CREATE SEQUENCE SEQ_ARG_VALUE_LOOKUP_ID INCREMENT BY 1 START WITH 10000 NOMAXVALUE NOCYCLE NOCACHE ORDER;

ALTER TABLE ARG_VALUE_LOOKUP ADD ACTV_IND CHAR(1) default 'N' ;

update ARG_VALUE_LOOKUP set ACTV_IND = 'Y';