DELIMITER /
CREATE TABLE IACUC_PROTOCOL_PERSON_ROLES ( 
    PROTOCOL_PERSON_ROLE_ID VARCHAR(12) NOT NULL, 
    DESCRIPTION VARCHAR(250),
    UNIT_DETAILS_REQUIRED CHAR(1) DEFAULT 'N' NOT NULL,
    AFFILIATION_DETAILS_REQUIRED CHAR(1) DEFAULT 'N' NOT NULL,
    TRAINING_DETAILS_REQUIRED CHAR(1) DEFAULT 'N' NOT NULL,
    COMMENTS_DETAILS_REQUIRED  CHAR(1) DEFAULT 'N' NOT NULL,
    ACTIVE_FLAG CHAR(1) DEFAULT 'N' NOT NULL,
    UPDATE_TIMESTAMP DATE NOT NULL, 
    UPDATE_USER VARCHAR(60) NOT NULL, 
    VER_NBR DECIMAL(8,0) DEFAULT 1 NOT NULL,     
    OBJ_ID VARCHAR(36) NOT NULL
) ENGINE InnoDB CHARACTER SET utf8 COLLATE utf8_bin
/
ALTER TABLE IACUC_PROTOCOL_PERSON_ROLES 
ADD CONSTRAINT PK_IACUC_PRTCL_PRSN_ROLES
PRIMARY KEY (PROTOCOL_PERSON_ROLE_ID) 
/
DELIMITER ;