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
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'leadUnitRule','Lead Unit Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Lead Unit Number','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'sponsorGroupRule','Sponsor Group Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Sponsor Group Name','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'proposalAwardTypeRule','Award Type Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Award Type Code','java.lang.Integer',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'s2sLeadershipRule','S2S Leadership Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'checkProposalPiRule','Check Proposal Principal Investigator','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'User Principal ID','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'checkProposalCoiRule','Check Proposal Co-Investigator','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'User Principal ID','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'leadUnitBelowRule','Lead Unit Below In Hierarchy','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Unit Number','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'specialReviewRule','Special Review Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Special Review Type Code','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'proposalUnitRule','Unit in Proposal','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Unit Number','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'sponsorTypeRule','Sponsor Type Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Sponsor Type Code','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'s2sAttachmentNarrativeRule','S2S Attachment Narrative Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'s2sModularBudgetRule','S2S Modular Budget Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'s2sFederalIdRule','S2S Federal ID Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'mtdcDeviation','MTDC Deviation in Final Budget Version','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'s2sExemptionRule','S2S Exemption Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'costElement','Cost Element Exists','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Cost Element','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'activityTypeRule','Activity Type Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Activity Type Code','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'sponsor','Sponsor Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Sponsor Code','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'nonFacultyPi','Non Faculty Principal Investigator','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'attachmentFileNameRule','Attachment File Name Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'mtdcDeviationInVersion','MTDC Deviation In Budget Version','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Budget Version Number','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'proposalTypeRule','Proposal Type Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'Proposal Type Code','java.lang.String',2,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUNCTION_ID VALUES(NULL)
/

insert into KC_KRMS_TERM_FUNCTION (KC_KRMS_TERM_FUNCTION_ID,KRMS_TERM_NM,DESCRIPTION,RETURN_TYPE,FUNCTION_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'incompleteNarrativeRule','Incomplete Narrative Rule','java.lang.String','2',NOW(),'admin',1,UUID())
/
INSERT INTO SEQ_KC_KRMS_TERM_FUN_PARM_ID VALUES(NULL)
/
insert into KC_KRMS_TERM_FUN_PARAM(KC_KRMS_TERM_FUN_PARAM_ID,KC_KRMS_TERM_FUNCTION_ID,PARAM_NAME,PARAM_TYPE,PARAM_ORDER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
values ((SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUN_PARM_ID),(SELECT (MAX(ID)) FROM SEQ_KC_KRMS_TERM_FUNCTION_ID),'DevelopmentProposal','org.kuali.kra.proposaldevelopment.bo.DevelopmentProposal',1,NOW(),'admin',1,UUID())
/
DELIMITER ;