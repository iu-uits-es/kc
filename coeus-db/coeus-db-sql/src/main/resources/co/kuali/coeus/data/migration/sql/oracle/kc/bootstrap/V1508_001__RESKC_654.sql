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

DECLARE temp NUMBER;
BEGIN
	SELECT COUNT(*) INTO temp FROM user_sequences WHERE sequence_name = 'SEQ_QUESTION_ID';
	IF temp > 0 THEN EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_QUESTION_ID'; END IF;
end;
/

DECLARE max_id NUMBER;

BEGIN
SELECT max(question_id)+1 into max_id from question;
execute immediate 'CREATE SEQUENCE SEQ_QUESTION_ID INCREMENT BY 1 START WITH '||max_Id||' NOMAXVALUE NOCYCLE NOCACHE ORDER';
end;
/