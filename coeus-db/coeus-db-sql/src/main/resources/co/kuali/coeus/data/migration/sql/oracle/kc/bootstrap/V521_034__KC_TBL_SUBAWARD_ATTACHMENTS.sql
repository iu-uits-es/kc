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

CREATE TABLE SUBAWARD_ATTACHMENTS
(
    ATTACHMENT_ID         NUMBER(12,0) NOT NULL,
    SUBAWARD_ID	          NUMBER(12,0) NOT NULL,	
    SUBAWARD_CODE         VARCHAR2(20) NOT NULL,
    SEQUENCE_NUMBER       NUMBER(4,0) NOT NULL,
    ATTACHMENT_TYPE_CODE  VARCHAR2(30) NOT NULL,
    DOCUMENT_ID	          NUMBER(4,0) NOT NULL,
    FILE_ID		          NUMBER(22,0) NOT NULL,
    DESCRIPTION           VARCHAR2(200),
    FILE_NAME             VARCHAR2(150),
    DOCUMENT              BLOB,
    UPDATE_TIMESTAMP      DATE NOT NULL,
    UPDATE_USER           VARCHAR2(60) NOT NULL,
    VER_NBR               NUMBER(8,0) DEFAULT 1 NOT NULL,
    OBJ_ID                VARCHAR2(36) NOT NULL
);

ALTER TABLE SUBAWARD_ATTACHMENTS 
ADD CONSTRAINT ATTACHMENT_ID_PK
PRIMARY KEY (ATTACHMENT_ID) ;
