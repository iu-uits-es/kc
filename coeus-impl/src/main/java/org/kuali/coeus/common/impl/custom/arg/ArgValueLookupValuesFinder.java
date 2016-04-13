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
package org.kuali.coeus.common.impl.custom.arg;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.coeus.common.framework.custom.arg.ArgValueLookup;
import org.kuali.coeus.sys.framework.keyvalue.KeyValueComparator;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.uif.control.UifKeyValuesFinderBase;

import java.util.*;

public class ArgValueLookupValuesFinder extends UifKeyValuesFinderBase {

	private static final String ARG_VALUE_VALUES_FINDER_PREFER_DESCRIPTION = "ARG_VALUE_VALUES_FINDER_PREFER_DESCRIPTION";
	private ParameterService parameterService;
    private static final String INACTIVE_IND = "(inactive)";

    private String argName;
    private String currentValue;
    private boolean excludeInactive = true;

    @Override
    public List<KeyValue> getKeyValues() {

        Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put("argumentName", argName);
        Collection<ArgValueLookup> argValueLookups = (Collection<ArgValueLookup>) KcServiceLocator.getService(BusinessObjectService.class).findMatching(ArgValueLookup.class, fieldValues);
        List<KeyValue> keyValues = new ArrayList<KeyValue>();
        List<KeyValue> inactiveKeyValues = new ArrayList<KeyValue>();

        for (ArgValueLookup argValueLookup : argValueLookups) {
            String description = StringUtils.isNotBlank(argValueLookup.getDescription()) ? argValueLookup.getDescription() : argValueLookup.getValue();
            if (argValueLookup.isActive()) {
                keyValues.add(new ConcreteKeyValue(argValueLookup.getValue(), getKeyValueValue(argValueLookup)));
            }
            else {
                if (!isExcludeInactive() || StringUtils.equals(currentValue, argValueLookup.getValue())) {
                    inactiveKeyValues.add(new ConcreteKeyValue(argValueLookup.getValue(), getKeyValueValue(argValueLookup) + " " + INACTIVE_IND));
                }
            }
        }

        // Added comparator below to alphabetize lists on value
        Collections.sort(keyValues, new KeyValueComparator());
        Collections.sort(inactiveKeyValues, new KeyValueComparator());
        keyValues.add(0, new ConcreteKeyValue("", "select"));
        keyValues.addAll(inactiveKeyValues);
        return keyValues;
    }

	protected String getKeyValueValue(ArgValueLookup argValueLookup) {
		if (StringUtils.isBlank(argValueLookup.getDescription()) 
			|| !getParameterService().getParameterValueAsBoolean(Constants.KC_GENERIC_PARAMETER_NAMESPACE, 
				Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, ARG_VALUE_VALUES_FINDER_PREFER_DESCRIPTION)) {
			return argValueLookup.getValue();
		} else {
			return argValueLookup.getDescription();
		}
	}

    public String getArgName() {
        return argName;
    }

    public void setArgName(String argName) {
        this.argName = argName;
    }

	public ParameterService getParameterService() {
		if (parameterService == null) {
			parameterService = KcServiceLocator.getService(ParameterService.class);
		}
		return parameterService;
	}

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
	}

    public String getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(String currentValue) {
        this.currentValue = currentValue;
    }

    public boolean isExcludeInactive() {
        return excludeInactive;
    }

    public void setExcludeInactive(boolean excludeInactive) {
        this.excludeInactive = excludeInactive;
    }

}
