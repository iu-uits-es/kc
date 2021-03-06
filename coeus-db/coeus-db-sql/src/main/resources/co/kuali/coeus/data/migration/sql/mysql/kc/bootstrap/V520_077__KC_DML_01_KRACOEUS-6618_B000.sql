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

DELIMITER /
INSERT INTO SEQ_NOTIFICATION_TYPE_ID VALUES(NULL)
/
INSERT INTO NOTIFICATION_TYPE (NOTIFICATION_TYPE_ID, MODULE_CODE, ACTION_CODE, DESCRIPTION, SUBJECT, MESSAGE, PROMPT_USER, SEND_NOTIFICATION, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
    VALUES ((SELECT (MAX(ID)) FROM SEQ_NOTIFICATION_TYPE_ID), 9, '903','IACUC Reject Review',
    'IACUC Protocol {PROTOCOL_NUMBER} Review returned to reviewer',
    'Review comments for IACUC protocol <a title="" target="_self" href="{DOCUMENT_PREFIX}/kew/DocHandler.do?command=displayDocSearchView&amp;docId={DOCUMENT_NUMBER}">{PROTOCOL_NUMBER}</a> returned to reviewer.<br/>The reason is : {REASON}',
    'N', 'Y', 'admin', SYSDATE(), 1, UUID())
/
INSERT INTO SEQ_NOTIFICATION_TYPE_ID VALUES(NULL)
/
INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
    VALUES ((SELECT (MAX(ID)) FROM SEQ_NOTIFICATION_TYPE_ID), (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 9 and ACTION_CODE = '903'), 'KC-IACUC:IACUC Online Reviewer', 
    null, 'admin', SYSDATE(), 1, UUID())
/
INSERT INTO SEQ_NOTIFICATION_TYPE_ID VALUES(NULL)
/
INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
    VALUES ((SELECT (MAX(ID)) FROM SEQ_NOTIFICATION_TYPE_ID), (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 9 and ACTION_CODE = '903'), 'KC-UNT:IACUC Administrator', 
    null, 'admin', SYSDATE(), 1, UUID())
/
INSERT INTO SEQ_NOTIFICATION_TYPE_ID VALUES(NULL)
/
INSERT INTO NOTIFICATION_TYPE_RECIPIENT (NOTIFICATION_TYPE_RECIPIENT_ID, NOTIFICATION_TYPE_ID, ROLE_NAME, ROLE_SUB_QUALIFIER, UPDATE_USER, UPDATE_TIMESTAMP, VER_NBR, OBJ_ID)
    VALUES ((SELECT (MAX(ID)) FROM SEQ_NOTIFICATION_TYPE_ID), (select NOTIFICATION_TYPE_ID from notification_type where MODULE_CODE = 9 and ACTION_CODE = '903'), 'KC-UNT:IACUC Reviewer', 
    null, 'admin', SYSDATE(), 1, UUID())
/
DELIMITER ;
