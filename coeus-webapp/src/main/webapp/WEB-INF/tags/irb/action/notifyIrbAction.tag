<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2015 Kuali, Inc.
   - 
   - This program is free software: you can redistribute it and/or modify
   - it under the terms of the GNU Affero General Public License as
   - published by the Free Software Foundation, either version 3 of the
   - License, or (at your option) any later version.
   - 
   - This program is distributed in the hope that it will be useful,
   - but WITHOUT ANY WARRANTY; without even the implied warranty of
   - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   - GNU Affero General Public License for more details.
   - 
   - You should have received a copy of the GNU Affero General Public License
   - along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<c:set var="attributes" value="${DataDictionary.ProtocolNotifyIrbBean.attributes}" />
<c:set var="submissionDocAttributes" value="${DataDictionary.ProtocolSubmissionDoc.attributes}" />
<c:set var="action" value="protocolProtocolActions" />


<c:set var="isOpen" value="false" />
<c:forEach items="${param}" var="par">
    <c:if test="${fn:startsWith(par.key, 'lookupActionNotifyIRBProtocol') and fn:startsWith(par.value, 'true')}">
        <c:set var="isOpen" value="true" />
    </c:if>
</c:forEach>
 <c:set var="parentTabValue" value="Notify IRB" scope="request"/>
                   
                                    
<kra:permission value="${KualiForm.actionHelper.canNotifyIrb}">

<kul:innerTab tabTitle="Notify IRB" parentTab="" defaultOpen="${isOpen}" tabErrorKey="actionHelper.protocolNotifyIrbBean*">
    <div class="innerTab-container" align="left">
        <table class="tab" cellpadding="0" cellspacing="0" summary="">
            <tbody>
                    <tr>
                    <td class="subhead" colspan="4">Details</td>
                    </tr>
                <tr>
                    <th width="15%"> 
                        <div align="right">
                            <nobr>
                            <kul:htmlAttributeLabel attributeEntry="${attributes.submissionQualifierTypeCode}" />
                            </nobr>
                        </div>
                    </th>
                    <td>
                        <kul:htmlControlAttribute property="actionHelper.protocolNotifyIrbBean.submissionQualifierTypeCode" attributeEntry="${attributes.submissionQualifierTypeCode}" />
                    </td>
	          		<th>
	          		    <div align="right">
	          		        <kul:htmlAttributeLabel attributeEntry="${attributes.reviewTypeCode}"/>
	          		    </div>
	          		</th>
	                <td align="left">
                        <kul:htmlControlAttribute property="actionHelper.protocolNotifyIrbBean.reviewTypeCode" attributeEntry="${attributes.reviewTypeCode}" />
					</td>
                </tr>
                <tr>
                    <th width="15%"> 
                        <c:if test="${(KualiForm.actionHelper.showCommittee) && (KualiForm.actionHelper.currentUserAuthorizedToAssignCommittee)}">
	                        <div align="right">
	                            <nobr>
	                            <kul:htmlAttributeLabel attributeEntry="${attributes.committeeId}" />
	                            </nobr>
	                        </div>
                        </c:if>
                    </th>
                    <td>
                        <c:if test="${(KualiForm.actionHelper.showCommittee) && (KualiForm.actionHelper.currentUserAuthorizedToAssignCommittee)}">
	                        <nobr>
	                        		             
		                        <html:select property="actionHelper.protocolNotifyIrbBean.committeeId">                               
	                            	<c:forEach items="${KualiForm.actionHelper.notifyIrbActionCommitteeIdByUnitKeyValues}" var="option" >
	                                	<c:choose>                      
	                                    	<c:when test="${KualiForm.actionHelper.protocolNotifyIrbBean.committeeId == option.key}">
	                                        	<option value="${option.key}" selected="selected">${option.value}</option>
	                                    	</c:when>
	                                    	<c:otherwise>                               
	                                        	<c:out value="${option.value}"/>
	                                        	<option value="${option.key}">${option.value}</option>
	                                    	</c:otherwise>
	                                	</c:choose>                                                
	                            	</c:forEach>
	                        	</html:select>
	                        	
	                        </nobr>
                        </c:if>
                    </td>
                    <th width="15%"> 
                        <div align="right">
                            <nobr>
                            <kul:htmlAttributeLabel attributeEntry="${attributes.comment}" />
                            </nobr>
                        </div>
                    </th>
                    <td>
                        <nobr>
                        <kul:htmlControlAttribute property="actionHelper.protocolNotifyIrbBean.comment" attributeEntry="${attributes.comment}" />
                        </nobr>
                    </td>
                </tr>
                </table>
           
			<c:forEach var="answerHeader" items="${KualiForm.actionHelper.protocolNotifyIrbBean.questionnaireHelper.answerHeaders}" varStatus="status">          
				<kra-questionnaire:questionnaireAnswersInnerTab parentTab="Notify IRB" 
				bean="${KualiForm.actionHelper.protocolNotifyIrbBean.questionnaireHelper}" 
				answerHeaderIndex="${status.index}" 
				property="actionHelper.protocolNotifyIrbBean.questionnaireHelper"
				overrideDivClass="inner-subhead"/>
			</c:forEach>
                
                
            <table cellpadding="0" cellspacing="0" summary="">
                
                <tr>
					<td align="center" colspan="4">
						<div align="center">
							<html:image property="methodToCall.notifyIrbProtocol.anchor${tabKey}"
							            src='${ConfigProperties.kra.externalizable.images.url}tinybutton-submit.gif' styleClass="tinybutton"/>
						</div>
	                </td>
                </tr>
            </tbody>
        </table>
    </div>
    
</kul:innerTab>

</kra:permission>
