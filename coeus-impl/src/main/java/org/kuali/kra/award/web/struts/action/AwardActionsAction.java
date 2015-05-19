/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
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
package org.kuali.kra.award.web.struts.action;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.kuali.coeus.common.framework.auth.task.TaskAuthorizationService;
import org.kuali.coeus.common.framework.print.AttachmentDataSource;
import org.kuali.coeus.common.framework.version.history.VersionHistoryService;
import org.kuali.coeus.common.notification.impl.service.KcNotificationService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.coeus.sys.framework.validation.AuditHelper;
import org.kuali.kra.award.AwardForm;
import org.kuali.kra.award.AwardNumberService;
import org.kuali.kra.award.awardhierarchy.AwardHierarchy;
import org.kuali.kra.award.awardhierarchy.AwardHierarchyTempObject;
import org.kuali.kra.award.awardhierarchy.sync.AwardSyncChange;
import org.kuali.kra.award.awardhierarchy.sync.AwardSyncPendingChangeBean;
import org.kuali.kra.award.awardhierarchy.sync.AwardSyncType;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.document.authorization.AwardTask;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.home.AwardService;
import org.kuali.kra.award.home.ValidRates;
import org.kuali.kra.award.home.fundingproposal.AwardFundingProposal;
import org.kuali.kra.award.infrastructure.AwardTaskNames;
import org.kuali.kra.award.notification.AwardNoticeNotificationRenderer;
import org.kuali.kra.award.notification.AwardNoticePrintout;
import org.kuali.kra.award.notification.AwardNotificationContext;
import org.kuali.kra.award.printing.AwardPrintParameters;
import org.kuali.kra.award.printing.AwardPrintType;
import org.kuali.kra.award.printing.service.AwardPrintingService;
import org.kuali.kra.external.award.AccountCreationClient;
import org.kuali.kra.external.award.AwardAccountValidationService;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.institutionalproposal.home.InstitutionalProposal;
import org.kuali.kra.institutionalproposal.service.InstitutionalProposalService;
import org.kuali.kra.kim.bo.KcKimAttributes;
import org.kuali.kra.timeandmoney.AwardHierarchyNode;
import org.kuali.rice.core.api.util.RiceConstants;
import org.kuali.rice.kew.api.KewApiConstants;
import org.kuali.rice.kew.api.WorkflowDocument;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.kns.question.ConfirmationQuestion;
import org.kuali.rice.kns.util.WebUtils;
import org.kuali.rice.kns.web.struts.action.AuditModeAction;
import org.kuali.rice.kns.web.struts.form.KualiDocumentFormBase;
import org.kuali.rice.krad.exception.AuthorizationException;
import org.kuali.rice.krad.util.AuditError;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.util.KRADConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.util.*;

/**
 * 
 * This class represents the Struts Action for Award Actions page(AwardActions.jsp)
 */
public class AwardActionsAction extends AwardAction implements AuditModeAction {
    
    private static final String ZERO = "0";
    private static final String NEW_CHILD_SELECTED_AWARD_OPTION = "c";
    private static final String NEW_CHILD_COPY_FROM_PARENT_OPTION = "b";
    private static final String AWARD_SPONSOR_CONTACT_LIST_ERROR_KEY = "document.awardList[0].sponsorContact";
    private static final String ERROR_INVALID_COUNTRY_CODE = "error.invalid.countryCode";
    private static final String ERROR_CANCEL_PENDING_PROPOSALS = "error.cancel.fundingproposal.pendingVersion";
    private static final String ACCOUNT_ALREADY_CREATED = "error.award.createAccount.account.already.created";
    private static final String NO_PERMISSION_TO_CREATE_ACCOUNT = "error.award.createAccount.noPermission";
    private static final String CONTACTS_AUDIT_ERRORS = "contactsAuditErrors";
    public static final String NEW_CHILD_NEW_OPTION = "a";
    public static final String AWARD_COPY_NEW_OPTION = "a";
    public static final String AWARD_COPY_CHILD_OF_OPTION = "d";
    
    @Override
    public ActionForward docHandler(ActionMapping mapping, ActionForm form
            , HttpServletRequest request, HttpServletResponse response) throws Exception { 
    	    AwardForm awardForm = (AwardForm) form;
            String command = request.getParameter(KewApiConstants.COMMAND_PARAMETER);
            ActionForward forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
            if(StringUtils.isNotEmpty(command) && KewApiConstants.DOCSEARCH_COMMAND.equals(command)) {
                loadDocumentInForm(request, awardForm); 
                WorkflowDocument workflowDoc = awardForm.getAwardDocument().getDocumentHeader().getWorkflowDocument();
                if(workflowDoc != null) {
                    awardForm.setDocTypeName(workflowDoc.getDocumentTypeName());
                }
                request.setAttribute("selectedAwardNumber", awardForm.getAwardDocument().getAward().getAwardNumber());   
            } else {
                forward = super.docHandler(mapping, awardForm, request, response);
            } 
            populateAwardHierarchy(form); 

            return forward;
    }
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ActionForward forward = super.execute(mapping, form, request, response);
        AwardForm awardForm = (AwardForm)form;
        String command = request.getParameter("command");
        String awardDocumentNumber = request.getParameter("awardDocumentNumber");
        String awardNumber = request.getParameter("awardNumber");
        if (StringUtils.isNotBlank(command) && "redirectAwardHierarchyFullViewForPopup".equals(command)) {
            forward = redirectAwardHierarchyFullViewForPopup(mapping, form, request, response, awardDocumentNumber, awardNumber);
        }
        return forward;
    }
    
    /**
     * 
     * This method is for the 'open window' button. It will be forwarded AwardHierarchyFullView.jsp
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
//    public ActionForward openWindow(ActionMapping mapping, ActionForm form, HttpServletRequest request,
//            HttpServletResponse response) throws Exception {
//        String documentNumber = request.getParameter("awardDocumentNumber");
//        String awardNumber = request.getParameter("awardNumber");
//        Award award = getActiveAwardVersion(awardNumber);
//        AwardForm awardForm = (AwardForm)form;
//        awardForm.setCurrentAwardNumber(awardNumber);
//        awardForm.setCurrentSeqNumber(award.getSequenceNumber().toString());
//        DocumentService documentService = KcServiceLocator.getService(DocumentService.class);
//        AwardDocument awardDocument = (AwardDocument)documentService.getByDocumentHeaderId(documentNumber);
//        awardDocument.setAward(award);
//        awardForm.setDocument(awardDocument);
//        super.populateAwardHierarchy(awardForm);
//        return mapping.findForward("basic");
//    }  
    
    private ActionForward redirectAwardHierarchyFullViewForPopup(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response, String awardDocumentNumber, String awardNumber) throws Exception {
        //super.populateAwardHierarchy(form);
        AwardForm awardForm = (AwardForm)form;
        response.sendRedirect("awardHierarchyFullView.do?methodToCall=openWindow&awardDocumentNumber=" + awardDocumentNumber + "&awardNumber=" + awardNumber + "&docTypeName=" + awardForm.getDocTypeName());
      
        return null;
    }
    
    
    @Override
    protected void validateLookupInquiryFullParameter(HttpServletRequest request, ActionForm form, String fullParameter) {
        if(fullParameter.startsWith("methodToCall.performLookup.(!!" + Award.class.getName() + "!!).(((awardNumber:awardHierarchyTempObject")) {
            return;
        } else {
            super.validateLookupInquiryFullParameter(request,form,fullParameter);
        }
    }

    @Override
    public ActionForward activate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AwardForm awardForm = (AwardForm) form;
        awardForm.setUnitRulesMessages(getUnitRulesMessages(awardForm.getAwardDocument()));
        return KcServiceLocator.getService(AuditHelper.class).setAuditMode(mapping, (AwardForm) form, true);
    }

    @Override
    public ActionForward deactivate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ((AwardForm) form).clearUnitRulesMessages();
        return KcServiceLocator.getService(AuditHelper.class).setAuditMode(mapping, (AwardForm) form, false);
    }
    
    /**
     * 
     * This method corresponds copy award action on Award Hierarchy UI. Depending on various options selected appropriate helper methods get called.
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward copyAward(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        AwardForm awardForm = (AwardForm)form;
        String awardNumber = getAwardNumber(request);
        int index = Integer.parseInt(StringUtils.split(awardNumber, "-")[1]);
        ActionForward forward = null;
        AwardHierarchy newRootNode = null;
        if (!StringUtils.isEmpty(awardForm.getAwardHierarchyTempObjects().get(index).getCopyAwardRadio())) {
            String radio = awardForm.getAwardHierarchyTempObjects().get(index).getCopyAwardRadio();
            Boolean copyDescendants = awardForm.getAwardHierarchyTempObjects().get(index).getCopyDescendants();
            AwardHierarchy targetNode = findTargetNode(request, awardForm);            
            if (StringUtils.equalsIgnoreCase(radio, AWARD_COPY_NEW_OPTION)) {
                if (copyDescendants!=null && copyDescendants) {
                    newRootNode = awardForm.getAwardHierarchyBean().copyAwardAndAllDescendantsAsNewHierarchy(targetNode.getAwardNumber());
                    forward = prepareToForwardToNewFinalChildAward(mapping, awardForm, request, response, targetNode, newRootNode);

                } else {
                    newRootNode = awardForm.getAwardHierarchyBean().copyAwardAsNewHierarchy(targetNode.getAwardNumber());
                    forward = prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newRootNode);
                }
            } else if(StringUtils.equalsIgnoreCase(radio, AWARD_COPY_CHILD_OF_OPTION)) {
                String awardNumberOfNodeToBeParent = awardForm.getAwardHierarchyTempObjects().get(index).getCopyAwardPanelTargetAward();
                if (!StringUtils.isEmpty(awardNumberOfNodeToBeParent) && !StringUtils.equalsIgnoreCase(awardNumberOfNodeToBeParent, ZERO)) {
                    if (copyDescendants!=null && copyDescendants){    
                        if(!StringUtils.isEmpty(awardNumberOfNodeToBeParent)) {
                            newRootNode = awardForm.getAwardHierarchyBean().copyAwardAndDescendantsAsChildOfAnotherAward(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
                            forward = prepareToForwardToNewFinalChildAward(mapping, awardForm, request, response, targetNode, newRootNode);
                        }
                    } else {
                        newRootNode = awardForm.getAwardHierarchyBean().copyAwardAsChildOfAnotherAward(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
                        forward = prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newRootNode);
                    } 
                }else{
                    GlobalVariables.getMessageMap().putError("awardHierarchyTempObject[" + index + "].copyAwardPanelTargetAward", KeyConstants.ERROR_COPY_AWARD_CHILDOF_AWARD_NOT_SELECTED, awardNumber);
                    awardForm.getFundingProposalBean().setAllAwardsForAwardNumber(null);
                    forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);    
                }
            }
        }else{  
            GlobalVariables.getMessageMap().putError("awardHierarchyTempObject[" + index + "].copyAwardPanelTargetAward", KeyConstants.ERROR_COPY_AWARD_NO_OPTION_SELECTED, awardNumber);
            forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        return forward;
    }
    
    /**
     * 
     * This method corresponds to the Create New Child behavior on Award Hierarchy JQuery UI. It calls various helper methods based on the options 
     * selected in the UI.
     *  
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward create(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm)form;
        String awardNumber = getAwardNumber(request);
        int index = Integer.parseInt(StringUtils.split(awardNumber, "-")[1]);
        ActionForward forward = null;
        
        if(awardForm.getAwardHierarchyTempObjects().get(index).getCreateNewChildRadio()!=null){
            AwardHierarchy targetNode = findTargetNode(request, awardForm);
            String radio = awardForm.getAwardHierarchyTempObjects().get(index).getCreateNewChildRadio();
            if(StringUtils.equalsIgnoreCase(radio, NEW_CHILD_NEW_OPTION)){
                AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewChildAward(targetNode.getAwardNumber());                
                forward = prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);
            }else if(StringUtils.equalsIgnoreCase(radio, NEW_CHILD_COPY_FROM_PARENT_OPTION)){
                AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewAwardBasedOnParent(targetNode.getAwardNumber());
                forward = prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);
            }else if(StringUtils.equalsIgnoreCase(radio, NEW_CHILD_SELECTED_AWARD_OPTION)){
                String awardNumberOfNodeToCopyFrom = awardForm.getAwardHierarchyTempObjects().get(index).getNewChildPanelTargetAward();
                if (StringUtils.isEmpty(awardNumberOfNodeToCopyFrom) || StringUtils.equalsIgnoreCase(awardNumberOfNodeToCopyFrom, ZERO)) {
                    GlobalVariables.getMessageMap().putError("awardHierarchyTempObject[" + index + "].newChildPanelTargetAward", KeyConstants.ERROR_CREATE_NEW_CHILD_OTHER_AWARD_NOT_SELECTED, awardNumber);
                    forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
                }else{
                    AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewChildAwardBasedOnAnotherAwardInHierarchy(
                            awardNumberOfNodeToCopyFrom, targetNode.getAwardNumber());
                    forward = prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);    
                }               
            }
        }else{
            GlobalVariables.getMessageMap().putError("awardHierarchyTempObject[" + index + "].newChildPanelTargetAward", KeyConstants.ERROR_CREATE_NEW_CHILD_NO_OPTION_SELECTED, awardNumber);
            forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        return forward;
        
    }
    
    /**
     *
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward createANewChildAward(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewChildAward(targetNode.getAwardNumber());
        return prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);
    }

    /**
     *
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward createANewChildAwardBasedOnParent(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewAwardBasedOnParent(targetNode.getAwardNumber());
        return prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);
    }

    public ActionForward createANewChildAwardBasedOnAnotherAwardInHierarchy(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String awardNumberOfNodeToCopyFrom = getHierarchyTargetAwardNumber(request);
        if(StringUtils.isEmpty(awardNumberOfNodeToCopyFrom)) {
            return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        AwardHierarchy newChildNode = awardForm.getAwardHierarchyBean().createNewChildAwardBasedOnAnotherAwardInHierarchy(awardNumberOfNodeToCopyFrom,
                targetNode.getAwardNumber());
        return prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newChildNode);
    }

    public ActionForward copyAwardAsANewHierarchy(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        AwardHierarchy newRootNode = awardForm.getAwardHierarchyBean().copyAwardAsNewHierarchy(targetNode.getAwardNumber());
        return prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newRootNode);
    }

    public ActionForward copyAwardAsANewHierarchyWithDescendants(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        AwardHierarchy newRootNode = awardForm.getAwardHierarchyBean().copyAwardAndAllDescendantsAsNewHierarchy(targetNode.getAwardNumber());
        return prepareToForwardToNewChildAward(mapping, awardForm, targetNode, newRootNode);
    }
    
    public ActionForward copyAwardAsChildOfAnotherAward(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        awardForm.getAwardHierarchyBean().copyAwardAsChildOfAnotherAward(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        populateAwardHierarchy(awardForm);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    public ActionForward copyAwardAndDescendantsAsChildOfAnotherAward(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        if(!StringUtils.isEmpty(awardNumberOfNodeToBeParent)) {
            awardForm.getAwardHierarchyBean().copyAwardAndDescendantsAsChildOfAnotherAward(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        }
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    public ActionForward copyAwardAsAChildInCurrentHierarchy(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        awardForm.getAwardHierarchyBean().copyAwardAsChildOfAnAwardInCurrentHierarchy(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        populateAwardHierarchy(awardForm);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward copyAwardAsAChildInCurrentHierarchyWithDescendants(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        awardForm.getAwardHierarchyBean().copyAwardAndDescendantsAsChildOfAnAwardInCurrentHierarchy(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        populateAwardHierarchy(awardForm);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward copyAwardAsAChildOfAwardInAnotherHierarchy(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        awardForm.getAwardHierarchyBean().copyAwardAsChildOfAnAwardInAnotherHierarchy(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward copyAwardAsAChildOfAwardInAnotherHierarchyWithDescendants(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        AwardHierarchy targetNode = findTargetNode(request, awardForm);
        String awardNumberOfNodeToBeParent = getHierarchyTargetAwardNumber(request);
        if(!StringUtils.isEmpty(awardNumberOfNodeToBeParent)) {
            awardForm.getAwardHierarchyBean().copyAwardAndDescendantsAsChildOfAnAwardInAnotherHierarchy(targetNode.getAwardNumber(), awardNumberOfNodeToBeParent);
        }
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }    

    public ActionForward selectAllAwardPrintNoticeItems(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm)form;
        awardForm.getAwardPrintNotice().selectAllItems();
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward deselectAllAwardPrintNoticeItems(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm)form;
        awardForm.getAwardPrintNotice().deselectAllItems();
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    protected boolean auditErrorExists(final String key) {
    	if (key == null) {
    		return false;
    	}
    	for (final AuditError error : (List<AuditError>) GlobalVariables.getAuditErrorMap().get(CONTACTS_AUDIT_ERRORS).getAuditErrorList()) {
    		if ((key + ".auditErrors").equalsIgnoreCase(error.getErrorKey())) {
    			return true;
    		}            
    	}
    	return false;
    }

    public ActionForward printNotice(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Map<String, Object> reportParameters = populateResponseParametersForNotice(awardForm);

        AwardPrintingService awardPrintService = KcServiceLocator.getService(AwardPrintingService.class);
        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(),AwardPrintType.AWARD_NOTICE_REPORT,reportParameters);
        streamToResponse(dataStream, response);
        //return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        return null;
    }

    public ActionForward printNoticeFromNotification(ActionMapping mapping, ActionForm form,
                                                     HttpServletRequest request, HttpServletResponse response) throws Exception {
        String awardNoticeId = request.getParameter("awardNoticeId");

        Map<String, Long> printoutKeyMap = new HashMap<String, Long>();
        printoutKeyMap.put("awardNoticeId", Long.valueOf(awardNoticeId));
        AwardNoticePrintout printout = getBusinessObjectService().findByPrimaryKey(AwardNoticePrintout.class, printoutKeyMap);

        if (printout == null) {
            String authMessage = "No Award Notice with an ID of %s exists";
            authMessage = String.format(authMessage, GlobalVariables.getUserSession().getPerson().getPrincipalName(), awardNoticeId);
            throw new AuthorizationException(GlobalVariables.getUserSession().getPerson().getPrincipalName(), "print", "Award Notice",
                    authMessage, new HashMap<String, Object>());
        }

        Award award = KcServiceLocator.getService(AwardService.class).getAward(printout.getAwardId());
        TaskAuthorizationService taskAuthService = KcServiceLocator.getService(TaskAuthorizationService.class);

        Map<String, String> awardQualifier = new HashMap<String, String>();
        awardQualifier.put(KcKimAttributes.AWARD, String.valueOf(award.getAwardId()));

        // Check if the user can view this Award-- if so then they can print the Notice
        AwardTask viewTask = new AwardTask(AwardTaskNames.VIEW_AWARD.getAwardTaskName(), award);
        boolean canPrint = taskAuthService.isAuthorized(GlobalVariables.getUserSession().getPrincipalId(), viewTask);

        if (canPrint) {
            ByteArrayOutputStream noticeOutputStream = new ByteArrayOutputStream();
            noticeOutputStream.write(printout.getPdfContent());

            WebUtils.saveMimeOutputStreamAsFile(response, Constants.PDF_REPORT_CONTENT_TYPE,
                    noticeOutputStream, printout.getAwardNumber() + "_Award_Notice_Report" + Constants.PDF_FILE_EXTENSION);

            return null;
        }

        String authMessage = "User '%s' is not authorized to print Award Notice for Award %s";
        authMessage = String.format(authMessage, GlobalVariables.getUserSession().getPerson().getPrincipalName(), award.getAwardNumber());
        throw new AuthorizationException(GlobalVariables.getUserSession().getPerson().getPrincipalName(), "print", "Award Notice",
                authMessage, new HashMap<String, Object>());
    }

    public ActionForward sendNotice(ActionMapping mapping, ActionForm form,
                                    HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Map<String, Object> reportParameters = populateResponseParametersForNotice(awardForm);

        AwardPrintingService awardPrintService = KcServiceLocator.getService(AwardPrintingService.class);
        AwardDocument awardDocument = awardForm.getAwardDocument();
        Award award = awardDocument.getAward();

        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(), AwardPrintType.AWARD_NOTICE_REPORT, reportParameters);

        AwardNoticePrintout awardPrintout = new AwardNoticePrintout(award.getAwardId(), award.getAwardNumber(), award.getUnitNumber());
        awardPrintout.setPdfContent(dataStream.getData());
        getBusinessObjectService().save(awardPrintout);

        AwardNoticeNotificationRenderer noticeRenderer = new AwardNoticeNotificationRenderer(awardPrintout.getAwardNoticeId(), award.getAwardNumber());
        AwardNotificationContext noticeContext = new AwardNotificationContext(awardForm.getAwardDocument().getAward(), "556",
                "Award Notice", noticeRenderer, Constants.MAPPING_AWARD_ACTIONS_PAGE);

        awardForm.getNotificationHelper().initializeDefaultValues(noticeContext);
        if (awardForm.getNotificationHelper().getPromptUserForNotificationEditor(noticeContext)) {
            return mapping.findForward(Constants.MAPPING_AWARD_NOTIFICATION_EDITOR);
        }
        else {
            getNotificationService().sendNotification(noticeContext);
        }

        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    private Map<String, Object> populateResponseParametersForNotice(AwardForm awardForm) {
        Map<String, Object> reportParameters = new HashMap<String, Object>();
        reportParameters.put(AwardPrintParameters.ADDRESS_LIST
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getSponsorContacts());
        reportParameters.put(AwardPrintParameters.FOREIGN_TRAVEL
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getForeignTravel());
        reportParameters.put(AwardPrintParameters.REPORTING
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getReports());
        reportParameters.put(AwardPrintParameters.CLOSEOUT
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getCloseout());
        reportParameters.put(AwardPrintParameters.FUNDING_SUMMARY
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getFundingSummary());
        reportParameters.put(AwardPrintParameters.SPECIAL_REVIEW
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getSpecialReview());
        reportParameters.put(AwardPrintParameters.COMMENTS
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getComments());
        reportParameters.put(AwardPrintParameters.HIERARCHY_INFO
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getHierarchy());
        reportParameters.put(AwardPrintParameters.SUBCONTRACT
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getSubAward());
        reportParameters.put(AwardPrintParameters.COST_SHARING
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getCostShare());
        reportParameters.put(AwardPrintParameters.KEYWORDS
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getKeywords());
        reportParameters.put(AwardPrintParameters.TECHNICAL_REPORTING
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getTechnicalReports());
        reportParameters.put(AwardPrintParameters.EQUIPMENT
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getEquipment());
        reportParameters.put(AwardPrintParameters.OTHER_DATA
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getOtherData());
        reportParameters.put(AwardPrintParameters.TERMS
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getTerms());
        reportParameters.put(AwardPrintParameters.FA_COST
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getFaRates());
        reportParameters.put(AwardPrintParameters.PAYMENT
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getPayment());
        reportParameters.put(AwardPrintParameters.FLOW_THRU
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getFlowThru());
        reportParameters.put(AwardPrintParameters.PROPOSAL_DUE
                .getAwardPrintParameter(), false);
        //awardForm.getAwardPrintNotice().getProposalsDue());

        reportParameters.put(AwardPrintParameters.SIGNATURE_REQUIRED
                .getAwardPrintParameter(), awardForm.getAwardPrintNotice()
                .getRequireSignature());

        return reportParameters;
    }

    protected KcNotificationService getNotificationService() {
        return KcServiceLocator.getService(KcNotificationService.class);
    }

    public ActionForward printChangeReport(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Map<String, Object> reportParameters = new HashMap<String, Object>();
        reportParameters.put(AwardPrintParameters.SIGNATURE_REQUIRED
                .getAwardPrintParameter(), awardForm
                .getAwardPrintChangeReport().getRequireSignature());
        reportParameters.put(AwardPrintParameters.SEQUENCE_NUMBER
                .getAwardPrintParameter(), awardForm
                .getAwardPrintChangeReport().getAwardVersion());
        reportParameters.put(AwardPrintParameters.TRANSACTION_ID_INDEX
                .getAwardPrintParameter(), awardForm
                .getAwardPrintChangeReport().getAmountInfoIndex());
        AwardPrintingService awardPrintService = KcServiceLocator
                .getService(AwardPrintingService.class);
        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(), AwardPrintType.AWARD_DELTA_REPORT,
                reportParameters);
        streamToResponse(dataStream, response);
        //return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        return null;
    }

    public ActionForward printHierarchy(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm)form;
        Map<String, Object> reportParameters = new HashMap<String, Object>();
        AwardPrintingService awardPrintService = KcServiceLocator
                .getService(AwardPrintingService.class);
        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(),
                AwardPrintType.AWARD_BUDGET_HIERARCHY,reportParameters);
        streamToResponse(dataStream, response);
        return null;
    }

    public ActionForward printHierarchyModification(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm)form;
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward printBudget(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
//        Map<String, Object> reportParameters = new HashMap<String, Object>();
//        AwardPrintingService awardPrintService = KcServiceLocator
//                .getService(AwardPrintingService.class);
//        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
//                awardForm.getAwardDocument(), AwardPrintType.AWARD_TEMPLATE
//                        .getAwardPrintType(), reportParameters);
//        streamToResponse(dataStream, response);
//        return null;
        //TODO: Add printing service call here
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }

    public ActionForward printTimeMoneyHistory(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Map<String, Object> reportParameters = new HashMap<String, Object>();
        AwardPrintingService awardPrintService = KcServiceLocator
                .getService(AwardPrintingService.class);
        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(),
                AwardPrintType.MONEY_AND_END_DATES_HISTORY,reportParameters);
        streamToResponse(dataStream, response);
        return null;
    }

    public ActionForward printTransactionDetail(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Map<String, Object> reportParameters = new HashMap<String, Object>();
        if (awardForm.getAwardTimeAndMoneyTransactionReport().getAmountInfoIndex() == null) {
            GlobalVariables.getMessageMap().putError("awardTimeAndMoneyTransactionReport.amountInfoIndex",
                    "error.award.print.transactionId.required");
            return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        reportParameters.put(AwardPrintParameters.SEQUENCE_NUMBER
                .getAwardPrintParameter(), awardForm
                .getAwardTimeAndMoneyTransactionReport().getAwardVersion());
        reportParameters.put(AwardPrintParameters.TRANSACTION_ID_INDEX
                .getAwardPrintParameter(), awardForm.getAwardTimeAndMoneyTransactionReport().getAmountInfoIndex());
        AwardPrintingService awardPrintService = KcServiceLocator
                .getService(AwardPrintingService.class);
        AttachmentDataSource dataStream = awardPrintService.printAwardReport(
                awardForm.getAwardDocument().getAward(),
                AwardPrintType.AWARD_BUDGET_HISTORY_TRANSACTION, reportParameters);
        streamToResponse(dataStream, response);
        return null;
    }

    public AwardNumberService getAwardNumberService(){
        return KcServiceLocator.getService(AwardNumberService.class);
    }

    protected String getAwardNumber(HttpServletRequest request) {
        String awardNumber = "";
        String parameterName = (String) request.getAttribute(KRADConstants.METHOD_TO_CALL_ATTRIBUTE);
        if (StringUtils.isNotBlank(parameterName)) {
            awardNumber = StringUtils.substringBetween(parameterName, ".awardNumber", ".");
        }

        return awardNumber;
    }

    private int getActiveHierarchyObjectIndex(HttpServletRequest request) throws Exception {
        Enumeration<String> lookupParameters = request.getParameterNames();
        int index = -1;
        while(lookupParameters.hasMoreElements()) {
            String temp = lookupParameters.nextElement();
            if(temp.startsWith("awardHierarchyTempObject[")) {
                index = temp.indexOf("awardHierarchyTempObject[") + 25;
                temp = temp.substring(index, index+1);
                index = Integer.parseInt(temp);
                break;
            }
        }
        
        return index;
    }
    
    @Override
    public ActionForward refresh(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception{
        AwardForm awardForm = (AwardForm)form;
        AwardDocument awardDocument = awardForm.getAwardDocument();
        int activeHierarchyObjectIndex = getActiveHierarchyObjectIndex(request);
        int loopIndex = 0;
        Award currentAward = awardDocument.getAward();
        
        for(AwardHierarchyTempObject temp: awardForm.getAwardHierarchyTempObjects()){ 
            List<String> order = new ArrayList<String>();
            
            if(loopIndex == activeHierarchyObjectIndex-1) {
                temp.setAwardNumber2(null);
                temp.setAwardNumber(null);
            }
            
            if(StringUtils.isNotBlank(temp.getAwardNumber1())){
                Map<String,AwardHierarchy> awardHierarchyItems = awardForm.getAwardHierarchyBean().getAwardHierarchy(temp.getAwardNumber1(), order);
                StringBuilder sb = new StringBuilder();
                for(String str:order){
                    sb.append(awardHierarchyItems.get(str).getAwardNumber());
                    sb.append(KRADConstants.BLANK_SPACE).append("%3A");
                }
                temp.setSelectBox1(sb.toString());
                request.setAttribute("selectedAwardNumber", temp.getAwardNumber()); 
            }

            if(StringUtils.isNotBlank(temp.getAwardNumber2())){
                order = new ArrayList<String>();
                Map<String,AwardHierarchyNode> awardHierarchyNodes = new HashMap<String, AwardHierarchyNode>();
                Map<String,AwardHierarchy> awardHierarchyItems = getAwardHierarchyService().getAwardHierarchy(temp.getAwardNumber2(), order);
                getAwardHierarchyService().populateAwardHierarchyNodes(awardHierarchyItems, awardHierarchyNodes, currentAward.getAwardNumber(), currentAward.getSequenceNumber().toString());
                StringBuilder sb = new StringBuilder();
                for(String str:order){
                    AwardHierarchyNode tempAwardNode = awardHierarchyNodes.get(str);
                    if(tempAwardNode.isAwardDocumentFinalStatus()) {
                        sb.append(tempAwardNode.getAwardNumber());
                        sb.append(KRADConstants.BLANK_SPACE).append("%3A");    
                    }
                }
                temp.setSelectBox2(sb.toString());
                request.setAttribute("selectedAwardNumber", temp.getAwardNumber()); 
            }
            loopIndex++;
        }

        return super.refresh(mapping, form, request, response);
    }

    private AwardHierarchy findTargetNode(HttpServletRequest request, AwardForm awardForm) {
        return awardForm.getAwardHierarchyBean().getRootNode().findNodeInHierarchy(getAwardNumber(request));
    }

    private ActionForward prepareToForwardToNewChildAward(ActionMapping mapping, AwardForm awardForm, AwardHierarchy targetNode,
                                                            AwardHierarchy newNodeToView) throws WorkflowException {
        ActionForward forward;
        if(newNodeToView != null) {
            awardForm.setCommand(KewApiConstants.INITIATE_COMMAND);
            createDocument(awardForm);
            Award newChildAward = newNodeToView.getAward();
            if(!newNodeToView.isRootNode()) {
                setMultipleNodeHierarchyOnAwardFormTrue(newChildAward);  
            }
            awardForm.getAwardDocument().setAward(newChildAward);
            awardForm.getAwardHierarchyBean().recordTargetNodeState(targetNode);
            awardForm.getFundingProposalBean().setAllAwardsForAwardNumber(null);
            forward = mapping.findForward(Constants.MAPPING_AWARD_HOME_PAGE);
        } else {
            forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        return forward;
    }
    
    private ActionForward prepareToForwardToNewFinalChildAward(ActionMapping mapping, AwardForm awardForm, HttpServletRequest request, HttpServletResponse response, AwardHierarchy targetNode,
            AwardHierarchy newNodeToView) throws Exception {
        ActionForward forward;
        if(newNodeToView != null) {
            awardForm.setCommand(KewApiConstants.INITIATE_COMMAND);
            createDocument(awardForm);
            Award newChildAward = newNodeToView.getAward();
            if(!newNodeToView.isRootNode()) {
                setMultipleNodeHierarchyOnAwardFormTrue(newChildAward);  
            }
            awardForm.getAwardDocument().setAward(newChildAward);
            awardForm.getAwardDocument().getDocumentHeader().setDocumentDescription("Copied Hierarchy");
            awardForm.getAwardHierarchyBean().recordTargetNodeState(targetNode);
            awardForm.getFundingProposalBean().setAllAwardsForAwardNumber(null);
            super.save(mapping, (ActionForm) awardForm, request, response);
            super.submitAward(mapping, (ActionForm) awardForm, request, response);
            forward = mapping.findForward(Constants.MAPPING_AWARD_HOME_PAGE);
        } else {
            forward = mapping.findForward(Constants.MAPPING_AWARD_BASIC);
        }
        return forward;
    }
    
    /**
     * Since a child award will always be part of a multiple award hierarchy, we need to set the boolean to true so that the anticipated
     * and obligated totals on Details & Dates tab will be uneditable on initial creation.  After the initial save of document
     * this is handled in the docHandler and home methods of AwardAction.
     * @param award
     */
    private void setMultipleNodeHierarchyOnAwardFormTrue(Award award) {
         award.setAwardInMultipleNodeHierarchy(true);
    }

    private String getHierarchyTargetAwardNumber(HttpServletRequest request) {
        return request.getParameter("awardNumberInputTemp");
    }

   
    /**
     * This method is used to create a financial document using the financial
     * account creation web service. 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward createAccount(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        AwardForm awardForm = (AwardForm) form;
        AwardDocument awardDocument = awardForm.getAwardDocument();
        Award award = awardDocument.getAward();
        // if the user has permissions to create a financial account
        if (awardForm.getEditingMode().get("createAwardAccount").equals("true")) {
            AwardAccountValidationService accountValidationService = getAwardAccountValidationService();
            boolean rulePassed = accountValidationService.validateAwardAccountDetails(award);
            if (rulePassed) {
                AccountCreationClient client = getAccountCreationClient();
                /*
                 * If account hasn't already been created, create it or
                 * display an error
                 */
                if (award.getFinancialAccountDocumentNumber() == null) {
                    
                    // Determine the ICR Rate Code to send - may require user interaction
                    if (StringUtils.isBlank(award.getIcrRateCode())) {
                        List<ValidRates> validRates = awardForm.getAccountCreationHelper().getMatchingValidRates(award.getCurrentFandaRate());
                        if (validRates.size() > 1) {
                            awardForm.getAccountCreationHelper().setValidRateCandidates(validRates);
                            return mapping.findForward(Constants.MAPPING_ICR_RATE_CODE_PROMPT);
                        } else if (validRates.size() == 1) {
                            award.setIcrRateCode(validRates.get(0).getIcrRateCode());
                        } else {
                            award.setIcrRateCode(Award.ICR_RATE_CODE_NONE);
                        }
                    }
                    client.createAwardAccount(award);
                } else {
                    GlobalVariables.getMessageMap().putError(ACCOUNT_ALREADY_CREATED, KeyConstants.ACCOUNT_ALREADY_CREATED);
                }
            }
        }
        else {
            GlobalVariables.getMessageMap().putError(NO_PERMISSION_TO_CREATE_ACCOUNT, KeyConstants.NO_PERMISSION_TO_CREATE_ACCOUNT);
        }
        forward = mapping.findForward(Constants.MAPPING_AWARD_ACTIONS_PAGE);
       
        return forward; 
    }
    
    protected AccountCreationClient getAccountCreationClient() {
        return KcServiceLocator.getService("accountCreationClient");
    }
   
    protected AwardAccountValidationService getAwardAccountValidationService() {
        return KcServiceLocator.getService("awardAccountValidationService");
    }
    
    @Override
    public ActionForward cancel(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        AwardForm awardForm = (AwardForm) form;
        Award award = awardForm.getAwardDocument().getAward();
        /*
         * We need to ensure the user didn't create a pending version of the linked proposal,
         * which, when processed, will overwrite any de-linking caused by the canceling of this Award version.
         */
        Set<String> linkedPendingProposals = getLinkedPendingProposals(award);
        if (!linkedPendingProposals.isEmpty()) {
            String proposalNumbers = StringUtils.join(linkedPendingProposals, ", ");
            GlobalVariables.getMessageMap().putError("noKey", 
                    ERROR_CANCEL_PENDING_PROPOSALS, 
                    proposalNumbers);
            return mapping.findForward(RiceConstants.MAPPING_BASIC);
        }
        
        Object question = request.getParameter(KRADConstants.QUESTION_INST_ATTRIBUTE_NAME);
        // this should probably be moved into a private instance variable
        // logic for cancel question
        if (question == null) {
            // ask question if not already asked
            return this.performQuestionWithoutInput(mapping, form, request, response, KRADConstants.DOCUMENT_CANCEL_QUESTION, getKualiConfigurationService().getPropertyValueAsString("document.question.cancel.text"), KRADConstants.CONFIRMATION_QUESTION, KRADConstants.MAPPING_CANCEL, "");
        }
        else {
            Object buttonClicked = request.getParameter(KRADConstants.QUESTION_CLICKED_BUTTON);
            if ((KRADConstants.DOCUMENT_CANCEL_QUESTION.equals(question)) && ConfirmationQuestion.NO.equals(buttonClicked)) {
                // if no button clicked just reload the doc
                return mapping.findForward(RiceConstants.MAPPING_BASIC);
            }
            // else go to cancel logic below
        }

        KualiDocumentFormBase kualiDocumentFormBase = (KualiDocumentFormBase) form;
        doProcessingAfterPost( kualiDocumentFormBase, request );
        if (award.getSequenceNumber() == 1) {
            AwardHierarchy hierarchy = getAwardHierarchyService().loadAwardHierarchy(award.getAwardNumber());
            hierarchy.setActive(false);
            getBusinessObjectService().save(hierarchy);
        }
        getDocumentService().cancelDocument(kualiDocumentFormBase.getDocument(), kualiDocumentFormBase.getAnnotation());
        
        //add all award amount info objects to previous award version and save.
//        AwardForm awardForm = (AwardForm) form;
//        AwardDocument awardDocument = (AwardDocument) awardForm.getDocument();
//        Award award  = awardDocument.getAward();
//        Award activeAward = getActiveAwardVersion(award.getAwardNumber());
//        activeAward.setAwardAmountInfos(award.getAwardAmountInfos());
//        //reinitialize the collection so the cancelled doc can be viewed.
//        award.initializeAwardAmountInfoObjects();
//        
//        getBusinessObjectService().save(award);
//        getBusinessObjectService().save(activeAward);

        return returnToSender(request, mapping, kualiDocumentFormBase);
    }

    
    /*
     * Find pending proposal versions linked to this award version.
     */
    private Set<String> getLinkedPendingProposals(Award award) {
        Set<String> linkedPendingProposals = new HashSet<String>();
        for (AwardFundingProposal awardFundingProposal : award.getFundingProposals()) {
            String proposalNumber = awardFundingProposal.getProposal().getProposalNumber();
            InstitutionalProposal pendingVersion = getInstitutionalProposalService().getPendingInstitutionalProposalVersion(proposalNumber);
            if (pendingVersion != null && pendingVersion.isFundedByAward(award.getAwardNumber(), award.getSequenceNumber())) {
                linkedPendingProposals.add(proposalNumber);
            }
        }
        return linkedPendingProposals;
    }
    
    protected InstitutionalProposalService getInstitutionalProposalService() {
        return KcServiceLocator.getService(InstitutionalProposalService.class);
    }
    
    protected VersionHistoryService getVersionHistoryService() {
        return KcServiceLocator.getService(VersionHistoryService.class);
    }
    
    /**
     * Called when the sync sponsor button is pressed.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward syncSponsor(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Award award = awardForm.getAwardDocument().getAward();
        getAwardSyncCreationService().addAwardSyncChange(award, new AwardSyncPendingChangeBean(AwardSyncType.ADD_SYNC, award, "sponsorCode", "sponsorCode"));
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    /**
     * Called when the sync award status button is pressed.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward syncStatusCode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Award award = awardForm.getAwardDocument().getAward();
        getAwardSyncCreationService().addAwardSyncChange(award, new AwardSyncPendingChangeBean(AwardSyncType.ADD_SYNC, award, "statusCode", "statusCode"));
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    /**
     * Called to delete award sync changes.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward deleteChanges(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Award award = awardForm.getAwardDocument().getAward();
        ListIterator<AwardSyncChange> iter = award.getSyncChanges().listIterator();
        while (iter.hasNext()) {
            AwardSyncChange change = iter.next();
            if (change.isDelete()) {
                getBusinessObjectService().delete(change);
                iter.remove();
            }
        }
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }   
    
    /**
     * Turns on sync mode.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward activateSyncMode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        awardForm.setSyncMode(true);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    /**
     * Turn off sync mode.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward deactivateSyncMode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm)form;
        awardForm.setSyncMode(false);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    /**
     * Clears all sync type selections.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward clearSyncSelections(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        for (AwardSyncChange change : awardForm.getAwardDocument().getAward().getSyncChanges()) {
            change.setSyncDescendants(null);
            change.setSyncFabricated(false);
            change.setSyncCostSharing(false);
        }
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    /**
     * Routes document back to previous route node that will re-run validation.
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward rerunValidation(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
        throws Exception {
        AwardForm awardForm = (AwardForm) form;
        
        awardForm.getAwardSyncBean().getParentAwardStatus().setStatus("Validation In Progress");
        getBusinessObjectService().save(awardForm.getAwardSyncBean().getParentAwardStatus());

        awardForm.getAwardDocument().getDocumentHeader().
            getWorkflowDocument().returnToPreviousNode("Re-run Hierarchy Sync Validation", Constants.AWARD_SYNC_HAS_SYNC_NODE_NAME);
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
    
    public ActionForward sendNotification(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        AwardForm awardForm = (AwardForm) form;
        Award award = awardForm.getAwardDocument().getAward();

        AwardNotificationContext context = new AwardNotificationContext(award, null, "Ad-Hoc Notification", Constants.MAPPING_AWARD_ACTIONS_PAGE);
        
        awardForm.getNotificationHelper().initializeDefaultValues(context);
        
        return mapping.findForward("notificationEditor");
    }
    
}
