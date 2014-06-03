<%--
 Copyright 2005-2014 The Kuali Foundation
 
 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.osedu.org/licenses/ECL-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<channel:portalChannelTop channelTitle="Proposals" />
<div class="body">
  <ul class="chan">
    <li><portal:portalLink displayTitle="true" title="Abstract Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.abstrct.AbstractType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Budget Categories" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.core.category.BudgetCategory&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Budget Status" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.budget.BudgetStatus&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Mail Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.proposal.framework.mail.MailType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Object Code" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.core.CostElement&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Deadline Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.framework.type.DeadlineType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Degree Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.bo.DegreeType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="IP Review Activity Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.ipreview.IntellectualPropertyReviewActivityType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="IP Review Requirement Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.ipreview.IntellectualPropertyReviewRequirementType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="IP Review Result Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.ipreview.IntellectualPropertyReviewResultType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Job Code" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.personnel.JobCode&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Location Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.location.ProposalLocationType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Mail By" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.proposal.framework.mail.MailBy&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Narrative Status" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.attachment.NarrativeStatus&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Narrative Types" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.attachment.NarrativeType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Person Document Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.person.attachment.PropPerDocType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Person Table Editable Columns" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.framework.person.attr.PersonEditableField&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Proposal Dev Editable Columns" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.editable.ProposalColumnsToAlter&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
 	<li><portal:portalLink displayTitle="true" title="Proposal Development Status" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.state.ProposalState&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Rate Class" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.RateClass&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Rate Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.RateType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
	<li><portal:portalLink displayTitle="true" title="Rate Class Exclusion" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.RateClassBaseExclusion&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li></li>
  	<li><portal:portalLink displayTitle="true" title="Rate Class Inclusion" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.RateClassBaseInclusion&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true&docFormKey=88888888" /></li></li>
    <li><portal:portalLink displayTitle="true" title="S2S Submission Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.s2s.S2sSubmissionType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="S2S Revision Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.s2s.S2sRevisionType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="S2S Providers" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.s2s.S2sProvider&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Training Stipend Rate" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.TrainingStipendRate&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Valid Calculation Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.calculator.ValidCalcType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Valid Cost Element Rate Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.rate.ValidCeRateType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Valid Narrative Form" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.attachment.ValidNarrForms&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
  	<li><portal:portalLink displayTitle="true" title="Institutional Proposal Status" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.ProposalStatus&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
	<li><portal:portalLink displayTitle="true" title="Proposal Log Status" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.proposallog.ProposalLogStatus&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
	<li><portal:portalLink displayTitle="true" title="Proposal Log Type" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.kra.institutionalproposal.proposallog.ProposalLogType&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="To Be Named Person" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.common.budget.framework.personnel.TbnPerson&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
    <li><portal:portalLink displayTitle="true" title="Budget Editable Columns" url="${ConfigProperties.application.url}/kr/lookup.do?methodToCall=start&businessObjectClassName=org.kuali.coeus.propdev.impl.budget.editable.BudgetColumnsToAlter&docFormKey=88888888&returnLocation=${ConfigProperties.application.url}/portal.do&hideReturnLink=true" /></li>
  </ul>
</div>
<channel:portalChannelBottom />
