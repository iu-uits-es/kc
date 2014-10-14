DELIMITER /

INSERT INTO KRCR_NMSPC_T (NMSPC_CD, OBJ_ID, VER_NBR, NM, ACTV_IND, APPL_ID)
VALUES ('KC-S2S', UUID(), 1, 'Kuali Coeus System to System', 'Y', 'KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','MULTI_CAMPUS_ENABLED',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "MULTI_CAMPUS_ENABLED")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','irb.protocol.development.proposal.linking.enabled',UUID(),1,'CONFG','@{#param("KC-PROTOCOL", "Document", "irb.protocol.development.proposal.linking.enabled")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','iacuc.protocol.proposal.development.linking.enabled',UUID(),1,'CONFG','@{#param("KC-IACUC", "Document", "iacuc.protocol.proposal.development.linking.enabled")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','DHHS_AGREEMENT',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "DHHS_AGREEMENT")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','PROPOSAL_TYPE_CODE_NEW',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_NEW")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','PROPOSAL_TYPE_CODE_RESUBMISSION',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_RESUBMISSION")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','PROPOSAL_TYPE_CODE_RENEWAL',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_RENEWAL")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','PROPOSAL_TYPE_CODE_CONTINUATION',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_CONTINUATION")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','PROPOSAL_TYPE_CODE_REVISION',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_REVISION")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','ACTIVITY_TYPE_CODE_CONSTRUCTION',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "ACTIVITY_TYPE_CODE_CONSTRUCTION")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','proposaldevelopment.proposaltype.new',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "proposaldevelopment.proposaltype.new")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','proposaldevelopment.proposaltype.renewal',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "proposaldevelopment.proposaltype.renewal")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','proposaldevelopment.proposaltype.revision',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "proposaldevelopment.proposaltype.revision")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','proposaldevelopment.proposaltype.continuation',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "proposaldevelopment.proposaltype.continuation")}','','A','KC')
/
INSERT INTO KRCR_PARM_T(NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,PARM_DESC_TXT,EVAL_OPRTR_CD,APPL_ID)
VALUES ('KC-S2S','All','proposaldevelopment.proposaltype.resubmission',UUID(),1,'CONFG','@{#param("KC-PD", "Document", "proposaldevelopment.proposaltype.resubmission")}','','A','KC')
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'PI_CITIZENSHIP_FROM_CUSTOM_DATA' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'STIPEND_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_OTHER_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_PREDOC_SINGLE_DEG_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_PREDOC_DUAL_DEG_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_UNDERGRAD_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_POSTDOC_DEG_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TUITION_POSTDOC_NONDEG_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'SUBCONTRACT_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TRAINING_REL_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'TRAINEE_TRAVEL_COST_ELEMENTS' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'PROPOSAL_CONTACT_TYPE' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 'S2S_SUBMISSION_TYPE_CODE_PREAPPLICATION' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetBudgetCategoryTypePersonnel' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateTypeSupportStaffSalaries' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassCodeEmployeeBenefits' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassCodeVacation' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassTypeLabAllocationSalaries' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassTypeEmployeeBenefits' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassTypeVacation' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategoryCodePersonnel' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetPeriodTypeAcademicMonths' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetPeriodTypeSummerMonths' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateTypeAdministrativeSalaries' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetAppointmentTypeSumEmployee' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetAppointmentTypeTmpEmployee' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetTargetCategoryCodeEquipmentCost' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetFilterCategoryTypePersonnel' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateClassTypeSalariesMs' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetMaterialsAndSuppliesCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetConsultantCostsCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetPublicationCostsCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetComputerServicesCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetAlterationsCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetSubcontractCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetEquipmentRentalCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetDomesticTravelCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetForeignTravelCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetParticipantStipendsCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetParticipantTravelCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetParticipantTutionCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetParticipantSubsistenceCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetParticipantOtherCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetOtherDirectCostsCategory' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategory01Graduates' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategory01Postdocs' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategory01Undergrads' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategory01Secretarial' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetCategory01Other' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetRateTypeSupportStaffSalaries' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetPeriodTypeCalendarMonths' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-PD' AND CMPNT_CD = 'Document' AND PARM_NM = 's2sBudgetPeriodTypeCycleMonths' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-B' AND CMPNT_CD = 'Document' AND PARM_NM = 'budgetCategoryType.participantSupport' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-GEN' AND CMPNT_CD = 'A' AND PARM_NM = 'ALLOW_PROPOSAL_PERSON_TO_OVERRIDE_KC_PERSON_EXTENDED_ATTRIBUTES' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-GEN' AND CMPNT_CD = 'A' AND PARM_NM = 'NON_US_CITIZEN_WITH_TEMPORARY_VISA_TYPE_CODE' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-GEN' AND CMPNT_CD = 'A' AND PARM_NM = 'PERMANENT_RESIDENT_OF_US_TYPE_CODE' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-GEN' AND CMPNT_CD = 'A' AND PARM_NM = 'US_CITIZEN_OR_NONCITIZEN_NATIONAL_TYPE_CODE' AND APPL_ID = 'KC'
/
UPDATE KRCR_PARM_T SET NMSPC_CD = 'KC-S2S', CMPNT_CD = 'All', PARM_TYP_CD = 'CONFG', EVAL_OPRTR_CD = 'A' WHERE NMSPC_CD = 'KC-GEN' AND CMPNT_CD = 'A' AND PARM_NM = 'PERMANENT_RESIDENT_OF_US_PENDING' AND APPL_ID = 'KC'
/

DELIMITER ;
