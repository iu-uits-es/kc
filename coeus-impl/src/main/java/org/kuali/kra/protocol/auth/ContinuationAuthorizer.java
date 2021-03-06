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
package org.kuali.kra.protocol.auth;

import org.kuali.kra.protocol.ProtocolBase;
import org.kuali.kra.protocol.ProtocolSpecialVersion;

public class ContinuationAuthorizer extends ProtocolAuthorizerBase {

    @Override
    public boolean isAuthorized(String userId, ProtocolTaskBase task) {
        return false;
    }

    protected final boolean isAmendmentOrRenewalOrContinuation(ProtocolBase protocol) {
        return protocol.getProtocolNumber() != null &&
               (protocol.getProtocolNumber().contains(ProtocolSpecialVersion.AMENDMENT.getCode()) ||
                       protocol.getProtocolNumber().contains(ProtocolSpecialVersion.CONTINUATION.getCode()) ||
                       protocol.getProtocolNumber().contains(ProtocolSpecialVersion.RENEWAL.getCode()));
    }

}
