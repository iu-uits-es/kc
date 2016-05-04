/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 *
 * Copyright 2005-2016 Kuali, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.coeus.instprop.impl.api;

import org.kuali.coeus.instprop.impl.api.dto.InstitutionalProposalDto;
import org.kuali.coeus.instprop.impl.api.dto.IpPersonDto;
import org.kuali.coeus.instprop.impl.api.service.InstitutionalProposalApiService;
import org.kuali.coeus.sys.framework.controller.rest.RestController;
import org.kuali.coeus.sys.framework.controller.rest.audit.RestAuditLogger;
import org.kuali.coeus.sys.framework.controller.rest.audit.RestAuditLoggerFactory;
import org.kuali.coeus.sys.framework.rest.ResourceNotFoundException;
import org.kuali.coeus.sys.framework.rest.UnprocessableEntityException;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.institutionalproposal.contacts.InstitutionalProposalPerson;
import org.kuali.kra.institutionalproposal.document.InstitutionalProposalDocument;
import org.kuali.kra.institutionalproposal.home.InstitutionalProposal;
import org.kuali.rice.kew.api.KewApiConstants;
import org.kuali.rice.kew.api.exception.InvalidActionTakenException;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.kew.routeheader.DocumentRouteHeaderValue;
import org.kuali.rice.kew.routeheader.service.RouteHeaderService;
import org.kuali.rice.krad.exception.UnknownDocumentIdException;
import org.kuali.rice.krad.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import java.util.stream.Collectors;

@RequestMapping(value="/api")
@Controller("institutionalProposalDocumentController")
public class InstitutionalProposalDocumentController extends RestController {

    @Autowired
    @Qualifier("institutionalProposalApiService")
    InstitutionalProposalApiService institutionalProposalApiService;

    @Autowired
    @Qualifier("documentService")
    private DocumentService documentService;

    @Autowired
    @Qualifier("routeHeaderService")
    private RouteHeaderService routeHeaderService;

    @Autowired
    @Qualifier("restAuditLoggerFactory")
    private RestAuditLoggerFactory restAuditLoggerFactory;

    private List<String> ipDtoProperties;
    private List<String> ipPersonDtoProperties;

    public InstitutionalProposalDocumentController() throws IntrospectionException {
        ipDtoProperties = getIpdtoProperties();
        ipPersonDtoProperties = getIpPersonDtoProperties();
    }

    protected List<String> getIpdtoProperties() throws IntrospectionException {
        return Arrays.asList(Introspector.getBeanInfo(InstitutionalProposalDto.class).getPropertyDescriptors()).stream()
                .map(PropertyDescriptor::getName)
                .filter(prop -> !"class".equals(prop))
                .collect(Collectors.toList());
    }

    protected List<String> getIpPersonDtoProperties() throws IntrospectionException {
        return Arrays.asList(Introspector.getBeanInfo(IpPersonDto.class).getPropertyDescriptors()).stream()
                .map(PropertyDescriptor::getName)
                .filter(prop -> !"class".equals(prop))
                .collect(Collectors.toList());
    }

    @RequestMapping(method= RequestMethod.POST, value="/v1/institutional-proposal-document",
            consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.CREATED)
    @ResponseBody
    String createInstitutionalProposal(@RequestBody InstitutionalProposalDto ipDto, @RequestParam(value = "createProposalLog", required = false) boolean createProposalLog) throws WorkflowException, InvocationTargetException, IllegalAccessException {
        RestAuditLogger auditLogger = restAuditLoggerFactory.getNewAuditLogger(InstitutionalProposalDto.class, ipDtoProperties);
        String proposalLogNumber = getInstitutionalProposalApiService().createProposalLog(createProposalLog, ipDto);
        InstitutionalProposal proposal = (InstitutionalProposal) getInstitutionalProposalApiService().convertDtoToDataObject(ipDto, InstitutionalProposal.class);
        getInstitutionalProposalApiService().initializeData(proposal);
        InstitutionalProposalDocument ipDocument = getInstitutionalProposalApiService().saveInitialProposal(proposal, ipDto.getDocumentDescription());
        getInstitutionalProposalApiService().addPersons(ipDocument, ipDto.getProjectPersons());
        getInstitutionalProposalApiService().addCustomData(ipDocument.getInstitutionalProposal(), ipDto);
        getInstitutionalProposalApiService().saveDocument(ipDocument);
        getInstitutionalProposalApiService().updateProposalLog(createProposalLog, proposalLogNumber, ipDocument);
        auditLogger.addNewItem(ipDto);
        auditLogger.saveAuditLog();

        return ipDocument.getDocumentNumber();
    }

    @RequestMapping(method= RequestMethod.DELETE, value="/v1/institutional-proposal-document/{documentNumber}",
            consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    void deleteInstitutionalProposal(@PathVariable Long documentNumber) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        DocumentRouteHeaderValue routeHeader = getRouteHeaderService().getRouteHeader(proposalDocument.getDocumentHeader().getWorkflowDocument().getDocumentId());
        if (!routeHeader.getDocRouteStatus().equalsIgnoreCase(KewApiConstants.ROUTE_HEADER_CANCEL_CD)) {
            try {
                documentService.cancelDocument(proposalDocument, "Cancelled");
            }
            catch (InvalidActionTakenException e) {
                throw new UnprocessableEntityException("Document " + documentNumber + " is not in a state to be cancelled.");
            }
        }
    }

    @RequestMapping(method= RequestMethod.GET, value="/v1/institutional-proposal-document/{documentNumber}",
            consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    InstitutionalProposalDto getInstitutionalProposal(@PathVariable Long documentNumber) {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        InstitutionalProposal proposal = proposalDocument.getInstitutionalProposal();
        InstitutionalProposalDto proposalDto = (InstitutionalProposalDto) getInstitutionalProposalApiService().convertDtoToDataObject(proposal, InstitutionalProposalDto.class);
        return proposalDto;
    }

    @RequestMapping(method= RequestMethod.POST, value="/v1/institutional-proposal-document/{documentNumber}/proposal-persons",
            consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    void addProposalPersons(@RequestBody List<IpPersonDto> ipPersonDto, @PathVariable Long documentNumber) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        RestAuditLogger auditLogger = restAuditLoggerFactory.getNewAuditLogger(IpPersonDto.class, ipPersonDtoProperties);
        institutionalProposalApiService.addPersons(proposalDocument, ipPersonDto);
        ipPersonDto.stream().forEach( item ->
                auditLogger.addNewItem(item)
        );
        getInstitutionalProposalApiService().saveDocument(proposalDocument);
        auditLogger.saveAuditLog();
    }

    @RequestMapping(method= RequestMethod.GET, value="/v1/institutional-proposal-document/{documentNumber}/proposal-persons",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    List<IpPersonDto> getAllProposalPersons(@PathVariable Long documentNumber) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        InstitutionalProposalDto proposalDto = (InstitutionalProposalDto) getInstitutionalProposalApiService().
                                                    convertDtoToDataObject(proposalDocument.getInstitutionalProposal(), InstitutionalProposalDto.class);
        List<IpPersonDto> persons = proposalDto.getProjectPersons();
        return persons;
    }

    @RequestMapping(method= RequestMethod.PUT, value="/v1/institutional-proposal-document/{documentNumber}/proposal-persons/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    void updateProposalPerson(@RequestBody IpPersonDto ipPersonDto, @PathVariable Long documentNumber, @PathVariable Long id) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        InstitutionalProposalPerson person = proposalDocument.getInstitutionalProposal().getProjectPersons().stream().filter(
                institutionalProposalPerson ->institutionalProposalPerson.getPersonId().equalsIgnoreCase(id.toString())).findFirst().orElse(null);
        if (person == null) {
            throw new ResourceNotFoundException("Person not found.");
        }
        RestAuditLogger auditLogger = restAuditLoggerFactory.getNewAuditLogger(IpPersonDto.class, ipPersonDtoProperties);
        // to ensure the person in the path is the person they are updating, not the one in the json.
        ipPersonDto.setPersonId(id.toString());
        proposalDocument.getInstitutionalProposal().getProjectPersons().remove(person);
        getInstitutionalProposalApiService().addPerson(proposalDocument, ipPersonDto);
        auditLogger.addNewItem(ipPersonDto);
        getInstitutionalProposalApiService().saveDocument(proposalDocument);
        auditLogger.saveAuditLog();
    }

    @RequestMapping(method= RequestMethod.DELETE, value="/v1/institutional-proposal-document/{documentNumber}/proposal-persons/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    void deleteProposalPerson(@PathVariable Long documentNumber, @PathVariable Long id) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        RestAuditLogger auditLogger = restAuditLoggerFactory.getNewAuditLogger(IpPersonDto.class, ipPersonDtoProperties);
        InstitutionalProposalPerson person = proposalDocument.getInstitutionalProposal().getProjectPersons().stream().filter(
                institutionalProposalPerson -> institutionalProposalPerson.getPersonId().equalsIgnoreCase(id.toString())).findFirst().orElse(null);
        if (person != null) {
            IpPersonDto personDto = (IpPersonDto) getInstitutionalProposalApiService().convertDtoToDataObject(person, IpPersonDto.class);
            proposalDocument.getInstitutionalProposal().getProjectPersons().remove(person);
            getInstitutionalProposalApiService().saveDocument(proposalDocument);
            auditLogger.addDeletedItem(personDto);
        }
        auditLogger.saveAuditLog();
    }

    @RequestMapping(method= RequestMethod.GET, value="/v1/institutional-proposal-document/{documentNumber}/proposal-persons/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    IpPersonDto getProposalPerson(@PathVariable Long documentNumber, @PathVariable Long id) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = getDocumentFromDocId(documentNumber);
        InstitutionalProposalPerson person = proposalDocument.getInstitutionalProposal().getProjectPersons().stream().filter(
                institutionalProposalPerson ->institutionalProposalPerson.getPersonId().equalsIgnoreCase(id.toString())).findFirst().orElse(null);
        if (person == null) {
            throw new ResourceNotFoundException("Person not found in proposal.");
        }
        IpPersonDto personDto = (IpPersonDto) getInstitutionalProposalApiService().convertDtoToDataObject(person, IpPersonDto.class);
        return personDto;
    }

    @RequestMapping(method= RequestMethod.PUT, value="/v1/institutional-proposal-document/{documentNumber}", params="route",
            consumes = {MediaType.APPLICATION_JSON_VALUE}, produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    void routeDocument(@PathVariable Long documentNumber) throws WorkflowException {
        InstitutionalProposalDocument proposalDocument = (InstitutionalProposalDocument) documentService.getByDocumentHeaderId(documentNumber.toString());
        institutionalProposalApiService.routeDocument(proposalDocument);
    }

    protected InstitutionalProposalDocument getDocumentFromDocId(Long documentNumber) {
        try {
            InstitutionalProposalDocument proposalDocument = (InstitutionalProposalDocument) documentService.getByDocumentHeaderId(documentNumber.toString());
            return proposalDocument;
        } catch (UnknownDocumentIdException | WorkflowException exception) {
            throw new ResourceNotFoundException("Could not locate document with document number " + documentNumber);
        }
    }

    public RouteHeaderService getRouteHeaderService() {
        return routeHeaderService;
    }

    public void setRouteHeaderService(RouteHeaderService routeHeaderService) {
        this.routeHeaderService = routeHeaderService;
    }

    public InstitutionalProposalApiService getInstitutionalProposalApiService() {
        return institutionalProposalApiService;
    }

    public void setInstitutionalProposalApiService(InstitutionalProposalApiService institutionalProposalApiService) {
        this.institutionalProposalApiService = institutionalProposalApiService;
    }
}
