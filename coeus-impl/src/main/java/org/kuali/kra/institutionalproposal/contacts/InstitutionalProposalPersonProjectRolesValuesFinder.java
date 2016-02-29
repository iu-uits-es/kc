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
package org.kuali.kra.institutionalproposal.contacts;

import java.util.List;

import org.kuali.coeus.common.framework.person.PropAwardPersonRoleValuesFinder;
import org.kuali.kra.institutionalproposal.web.struts.form.InstitutionalProposalForm;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.krad.uif.field.InputField;
import org.kuali.rice.krad.uif.view.ViewModel;

public class InstitutionalProposalPersonProjectRolesValuesFinder extends PropAwardPersonRoleValuesFinder {

	@Override
	protected String getSponsorCodeFromModel(ViewModel model) {
		return ((InstitutionalProposalForm) model).getInstitutionalProposalDocument().getInstitutionalProposal().getSponsorCode();
	}

    @Override
    public List<KeyValue> getKeyValues(){
    	InstitutionalProposalForm form = (InstitutionalProposalForm) KNSGlobalVariables.getKualiForm();
		return getKeyValues(form.getInstitutionalProposalDocument().getInstitutionalProposal().getSponsorCode());
    }

    @Override
    protected boolean piAlreadyExists(ViewModel model, InputField field) {
        return false;
    }
}
