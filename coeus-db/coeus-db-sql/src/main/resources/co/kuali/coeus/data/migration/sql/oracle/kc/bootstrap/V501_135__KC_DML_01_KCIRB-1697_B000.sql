--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

INSERT INTO PROTOCOL_STATUS ( PROTOCOL_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID ) 
VALUES ( '107', 'Return To PI', sysdate, 'admin', SYS_GUID() ) ;

INSERT INTO PROTOCOL_ACTION_TYPE ( PROTOCOL_ACTION_TYPE_CODE, DESCRIPTION, TRIGGER_SUBMISSION, TRIGGER_CORRESPONDENCE, FINAL_ACTION_FOR_BATCH_CORRESP, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID ) 
VALUES ( '213', 'Returned To PI', 'N', 'N', 'N', sysdate, 'admin', SYS_GUID() ) ;

INSERT INTO SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 213, 'Returned To PI', sysdate, 'admin', SYS_GUID(), 1 );
