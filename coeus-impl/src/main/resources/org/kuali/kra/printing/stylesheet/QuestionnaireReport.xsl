<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java"
                exclude-result-prefixes="java">
    <xsl:output version="1.0" method="xml" encoding="UTF-8" indent="no"/>
    <xsl:param name="SV_OutputFormat" select="'PDF'"/>
    <xsl:variable name="XML" select="/"/>
    <xsl:variable name="url" select="'http://docs.onestart.iu.edu/dav/ERA/KC/images'" />

    <xsl:variable name="fo:layout-master-set">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="default-page" page-height="11in" page-width="8.5in" margin-left="0.6in" margin-right="0.6in">
                <fo:region-body margin-top="0.79in" margin-bottom="0.79in" />
                <fo:region-before extent="1.5in"/>
            </fo:simple-page-master>
        </fo:layout-master-set>
    </xsl:variable>

    <xsl:template match="/">
        <fo:root>
            <xsl:copy-of select="$fo:layout-master-set"/>
            <fo:page-sequence master-reference="default-page" initial-page-number="1" format="1" font-family="Times New Roman" font-size="10pt">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block>
                        <fo:leader leader-pattern="space" />
                    </fo:block>
                    <fo:block>
                        <fo:leader leader-pattern="space" />
                    </fo:block>
                    <fo:table table-layout="fixed" width="100%" border-spacing="2pt">
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-body start-indent="0pt">
                            <fo:table-row>
                                <fo:table-cell padding="2pt" text-align="center" display-align="center">
                                    <fo:block>
                                        <fo:inline font-size="11pt" font-weight="bold">
                                            <xsl:for-each select="Questionnaire">
                                                <xsl:for-each select="QuestionnaireName">
                                                    <xsl:apply-templates/>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <xsl:for-each select="$XML">
                            <xsl:choose>
                                <!-- PROTOCOL INFO -->
                                <xsl:when test="/Questionnaire/ProtocolInfo">
                                    <fo:table font-size="10pt" font-weight="bold" table-layout="fixed" width="100%" border-spacing="2pt">
                                        <fo:table-column column-width="120pt"/>
                                        <fo:table-column column-width="180pt"/>
                                        <fo:table-column column-width="120pt"/>
                                        <fo:table-column column-width="180pt"/>
                                        <fo:table-body start-indent="0pt">
                                            <fo:table-row>
                                                <fo:table-cell font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Protocol Number:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="normal" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="AnswerHeader">
                                                                <xsl:for-each select="ModuleKey">
                                                                    <xsl:apply-templates/>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Submission Type:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="normal" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="ProtocolInfo">
                                                                <xsl:for-each select="SubmissionType">
                                                                    <xsl:apply-templates/>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                            <fo:table-row>
                                                <fo:table-cell font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Title:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="normal" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="ProtocolInfo">
                                                                <xsl:for-each select="Title">
                                                                    <xsl:apply-templates/>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Principal Investigator:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="normal" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="ProtocolInfo">
                                                                <xsl:for-each select="Investigator">
                                                                    <xsl:for-each select="Fullname">
                                                                        <xsl:apply-templates/>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>

                                            <fo:table-row>
                                                <fo:table-cell font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Report Printed:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-weight="normal" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:variable name="currentdate" select="java:format(java:java.text.SimpleDateFormat.new('yyyy-MM-dd HH:mm:ss'), java:java.util.Date.new())" />
                                                        <fo:block>
                                                            <fo:inline>
                                                                <xsl:value-of select="format-number(number(substring(string($currentdate), 6, 2)), '00')"/>
                                                                <xsl:text>/</xsl:text>
                                                                <xsl:value-of select="format-number(number(substring(string($currentdate), 9, 2)), '00')"/>
                                                                <xsl:text>/</xsl:text>
                                                                <xsl:value-of select="format-number(number(substring(string($currentdate), 1, 4)), '0000')"/>
                                                            </fo:inline>
                                                        </fo:block>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                </xsl:when>


                                <!-- PROPOSAL INFO -->
                                <xsl:when test="/Questionnaire/ProposalInfo">
                                    <fo:inline-container>
                                        <fo:block>
                                            <xsl:text>&#x2029;</xsl:text>
                                        </fo:block>
                                    </fo:inline-container>
                                    <fo:table font-size="10pt" table-layout="fixed" width="100%" border-spacing="2pt">
                                        <fo:table-column column-width="120"/>
                                        <fo:table-column column-width="247"/>
                                        <fo:table-column column-width="150pt"/>
                                        <fo:table-column column-width="332"/>
                                        <fo:table-body start-indent="0pt">
                                            <fo:table-row>
                                                <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="justify" display-align="before">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Proposal Number:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="AnswerHeader">
                                                                <xsl:for-each select="ModuleKey">
                                                                    <xsl:variable name="value-of-template">
                                                                        <xsl:apply-templates/>
                                                                    </xsl:variable>
                                                                    <xsl:choose>
                                                                        <xsl:when test="contains(string($value-of-template),'&#x2029;')">
                                                                            <fo:block>
                                                                                <xsl:copy-of select="$value-of-template"/>
                                                                            </fo:block>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <fo:inline>
                                                                                <xsl:copy-of select="$value-of-template"/>
                                                                            </fo:inline>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Principal Investigator:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="ProposalInfo">
                                                                <xsl:for-each select="Investigator">
                                                                    <xsl:for-each select="Fullname">
                                                                        <xsl:variable name="value-of-template">
                                                                            <xsl:apply-templates/>
                                                                        </xsl:variable>
                                                                        <xsl:choose>
                                                                            <xsl:when test="contains(string($value-of-template),'&#x2029;')">
                                                                                <fo:block>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:block>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <fo:inline>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:inline>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                    <fo:inline-container>
                                        <fo:block>
                                            <xsl:text>&#x2029;</xsl:text>
                                        </fo:block>
                                    </fo:inline-container>
                                    <fo:table font-size="10pt" table-layout="fixed" width="100%" border-spacing="2pt">
                                        <fo:table-column column-width="120"/>
                                        <fo:table-column column-width="1000"/>
                                        <fo:table-body start-indent="0pt">
                                            <fo:table-row>
                                                <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="justify" display-align="before">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:text>Title:</xsl:text>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="2pt" display-align="center">
                                                    <fo:block>
                                                        <xsl:for-each select="Questionnaire">
                                                            <xsl:for-each select="ProposalInfo">
                                                                <xsl:for-each select="Title">
                                                                    <xsl:variable name="value-of-template">
                                                                        <xsl:apply-templates/>
                                                                    </xsl:variable>
                                                                    <xsl:choose>
                                                                        <xsl:when test="contains(string($value-of-template),'&#x2029;')">
                                                                            <fo:block>
                                                                                <xsl:copy-of select="$value-of-template"/>
                                                                            </fo:block>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <fo:inline>
                                                                                <xsl:copy-of select="$value-of-template"/>
                                                                            </fo:inline>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </xsl:for-each>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                    <xsl:if test="/Questionnaire/ProposalInfo/ProposalPersonUsed &gt; 0">
                                        <fo:table>
                                            <fo:table-column column-width="120"/>
                                            <fo:table-column column-width="247"/>
                                            <fo:table-column column-width="150pt"/>
                                            <fo:table-column column-width="332"/>
                                            <fo:table-body start-indent="0pt">
                                                <fo:table-row>
                                                    <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="justify" display-align="before">
                                                        <fo:block>
                                                            <fo:inline>
                                                                <xsl:text>Proposal Person:</xsl:text>
                                                            </fo:inline>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding="2pt" display-align="center">
                                                        <fo:block>
                                                            <xsl:for-each select="Questionnaire">
                                                                <xsl:for-each select="ProposalInfo">
                                                                    <xsl:for-each select="ProposalPersonName">
                                                                        <xsl:variable name="value-of-template">
                                                                            <xsl:apply-templates/>
                                                                        </xsl:variable>
                                                                        <xsl:choose>
                                                                            <xsl:when test="contains(string($value-of-template),'&#x2029;')">
                                                                                <fo:block>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:block>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <fo:inline>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:inline>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="justify" display-align="before">
                                                        <fo:block>
                                                            <fo:inline>
                                                                <xsl:text>Person Role:</xsl:text>
                                                            </fo:inline>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell padding="2pt" display-align="center">
                                                        <fo:block>
                                                            <xsl:for-each select="Questionnaire">
                                                                <xsl:for-each select="ProposalInfo">
                                                                    <xsl:for-each select="ProposalPersonRole">
                                                                        <xsl:variable name="value-of-template">
                                                                            <xsl:apply-templates/>
                                                                        </xsl:variable>
                                                                        <xsl:choose>
                                                                            <xsl:when test="contains(string($value-of-template),'&#x2029;')">
                                                                                <fo:block>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:block>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <fo:inline>
                                                                                    <xsl:copy-of select="$value-of-template"/>
                                                                                </fo:inline>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </xsl:for-each>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                                <fo:table-row>
                                                    <fo:table-cell number-columns-spanned="4" padding="2pt" display-align="left">
                                                        <fo:table>
                                                            <fo:table-column column-width="75%"/>
                                                            <fo:table-column column-width="25%"/>
                                                            <fo:table-body>
                                                                <fo:table-row>
                                                                    <fo:table-cell padding="2pt" display-align="left">
                                                                        <fo:block>
                                                                            My signature below certifies that I hereby authorize Indiana University to submit the above referenced proposal as an institutionally
                                                                            authorized proposal.
                                                                        </fo:block>
                                                                        <fo:block>
                                                                            Further, as a Principal Investigator/Co-Principal Investigator/Co-Investigator I certify that:
                                                                        </fo:block>
                                                                        <fo:block>
                                                                            <xsl:text>&#160;</xsl:text>
                                                                        </fo:block>
                                                                        <fo:block>
                                                                            Please contact your department head, center or laboratory director, or Vice-President for research if you cannot certify the following:
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell padding="2pt" display-align="left">
                                                                        <fo:block>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                            </fo:table-body>
                                                        </fo:table>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                            </fo:table-body>
                                        </fo:table>
                                    </xsl:if>
                                    <fo:block/>
                                </xsl:when>
                            </xsl:choose>



                            <!-- QUESTIONS/ANSWERS -->
                            <fo:block margin="0pt">
                                <fo:table table-layout="fixed" width="100%" border-spacing="2pt">
                                    <fo:table-column column-width="proportional-column-width(1)"/>
                                    <fo:table-body start-indent="0pt">
                                        <fo:table-row>
                                            <fo:table-cell padding="2pt" display-align="center">
                                                <fo:block>
                                                    <xsl:for-each select="Questionnaire">
                                                        <xsl:for-each select="Questions">
                                                            <xsl:if test="../UserOption/UserOptionsInfo/PrintAnswers  = &apos;No&apos;">
                                                                <xsl:for-each select="QuestionInfo">
                                                                    <xsl:if test="not(  Question  =  preceding-sibling::QuestionInfo[1]/Question )">
                                                                        <fo:block/>

                                                                        <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm">
                                                                            <fo:list-item>
                                                                                <fo:list-item-label end-indent="label-end()" text-align="right">
                                                                                    <fo:block font-family="Times New Roman" font-size="10pt">&#x25A0;</fo:block>
                                                                                </fo:list-item-label>
                                                                                <fo:list-item-body start-indent="body-start()">
                                                                                    <fo:block>
                                                                                        <xsl:for-each select="Question">
                                                                                            <xsl:apply-templates/>
                                                                                        </xsl:for-each>
                                                                                        <fo:block>
                                                                                            <fo:leader leader-pattern="space"/>
                                                                                        </fo:block>

                                                                                    </fo:block>
                                                                                </fo:list-item-body>
                                                                            </fo:list-item>
                                                                        </fo:list-block>
                                                                    </xsl:if>
                                                                </xsl:for-each>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell padding="2pt" display-align="center">
                                                <fo:block>
                                                    <xsl:for-each select="Questionnaire">
                                                        <xsl:for-each select="Questions">
                                                            <fo:block>
                                                                <fo:leader leader-pattern="space" />
                                                            </fo:block>
                                                            <xsl:call-template name="QuestionT" />
                                                        </xsl:for-each>
                                                    </xsl:for-each>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell padding="2pt" display-align="center">
                                                <fo:block>
                                                    <xsl:for-each select="Questionnaire">
                                                        <xsl:for-each select="QuestionnaireId">
                                                            <xsl:variable name="value-of-template">
                                                                <xsl:apply-templates/>
                                                            </xsl:variable>

                                                            <xsl:choose>
                                                                <xsl:when test="contains(string($value-of-template), '143020')">
                                                                    <xsl:call-template name="SignatureTh" />
                                                                </xsl:when>
                                                                <xsl:when test="contains(string($value-of-template), '109010')">
                                                                    <xsl:call-template name="SignatureTva" />
                                                                </xsl:when>
                                                                <xsl:otherwise />
                                                            </xsl:choose>
                                                        </xsl:for-each>
                                                    </xsl:for-each>

                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </xsl:for-each>
                        <xsl:if test="/Questionnaire/ProposalInfo/ProposalPersonUsed &gt; 0">
                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                            <fo:table table-layout="fixed" width="100%" border-spacing="2pt">
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="55%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="30%"/>
                                <fo:table-column column-width="10%"/>
                                <fo:table-body start-indent="0pt">
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-bottom-style="solid" font-weight="bold">
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border-bottom-style="solid" font-weight="bold">
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="Right" display-align="before">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:text>Signature</xsl:text>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell font-size="10pt" font-weight="bold" padding="2pt" text-align="justify" display-align="before">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:text>Date</xsl:text>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell>
                                            <fo:block><xsl:text>&#160;</xsl:text></fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </xsl:if>
                    </fo:block>
                    <fo:block id="SV_RefID_PageTotal"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>




    <!-- QUESTION Template -->
    <xsl:template name="QuestionT">
        <xsl:for-each select="QuestionInfo">
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" font-family="Times New Roman" font-size="10pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()" text-align="right">
                        <fo:block>•</fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <xsl:call-template name="AnswerT" />
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>
        </xsl:for-each>
    </xsl:template>



    <!-- ANSWER Template -->
    <xsl:template name="AnswerT">
        <fo:block margin="0pt" font-family="Times New Roman" font-size="10pt">
            <xsl:for-each select="Question">
                <xsl:apply-templates />
            </xsl:for-each>
        </fo:block>
        <fo:block margin="0pt" font-family="Times New Roman" font-size="10pt">
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <xsl:for-each select="AnswerInfo">
                <xsl:choose>
                    <xsl:when test="Selected=&quot;true&quot;">
                        <fo:block font-weight="bold" linefeed-treatment="preserve">
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2check.gif)" />
                            <xsl:value-of select="Answer"/>
                        </fo:block>
                    </xsl:when>
                    <xsl:otherwise>
                        <fo:block linefeed-treatment="preserve">
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <xsl:value-of select="Answer"/>
                        </fo:block>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </fo:block>
        <!-- Call Question template -->
        <fo:block margin="0pt">
            <xsl:call-template name="QuestionT" />
        </fo:block>
    </xsl:template>



    <!-- Signature Template for HIPAA -->
    <xsl:template name="SignatureTh">
        <fo:block margin="0pt" font-family="Times New Roman" font-size="10pt">
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:block font-style="italic">
                <fo:inline>The IRB has determined the alteration or waiver of authorization satisfies the following criteria at 45 CFR 164.512(i)(2)(ii) as described above. </fo:inline>
            </fo:block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="2mm" space-before.optimum="4pt" space-after.optimum="4pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The PHI to be used or disclosed is determined to be necessary</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block  line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     The explanation of how this research involves no more than minimal risk of loss of privacy to the subject is sufficient </fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="6mm" space-before.optimum="4pt" space-after.optimum="4pt">

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>             There exists an adequate plan to protect the identifiers from improper use and disclosure</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>            There exists an adequate plan to destroy the identifiers at the earliest opportunity consistent with conduct of the research</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />

                            <fo:inline>           There exist adequate written assurances that the requested information will not be reused or disclosed to any other person or entity, except as required by law, for authorized oversight of the research study, or for other research for which the use or disclosure of the requested information would be permitted by the Privacy Rule</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="2mm" space-before.optimum="4pt" space-after.optimum="4pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The explanation of how this research could not be practicably conducted without waiver of authorization is adequate </fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     The explanation of how this research could not be practicably conducted without access to and use of the individually identifiable health information is appropriate</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:block>
                <fo:inline>Authorized IRB Signature: ________________________________________</fo:inline>
                <fo:inline>IRB Approval Date:_________________</fo:inline>
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:inline>Printed Name of IRB Member: ________________________________________</fo:inline>
            </fo:block>

        </fo:block>
    </xsl:template>



    <!-- Signature Template for VA-Research -->
    <xsl:template name="SignatureTva">
        <fo:block margin="0pt" font-family="Times New Roman" font-size="10pt">
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:block font-style="italic">
                <fo:inline>The IRB has determined the alteration or waiver of authorization satisfies the following criteria at 45 CFR 164.512(i)(2)(ii) as described above. </fo:inline>
            </fo:block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="2mm" space-before.optimum="4pt" space-after.optimum="4pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The PHI to be used or disclosed is determined to be necessary</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block  line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     The explanation of how this research involves no more than minimal risk of loss of privacy to the subject is sufficient </fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="6mm" space-before.optimum="4pt" space-after.optimum="4pt">

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>             There exists an adequate plan to protect the identifiers from improper use and disclosure</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>            There exists an adequate plan to destroy the identifiers at the earliest opportunity consistent with conduct of the research</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />

                            <fo:inline>           There exist adequate written assurances that the requested information will not be reused or disclosed to any other person or entity, except as required by law, for authorized oversight of the research study, or for other research for which the use or disclosure of the requested information would be permitted by the Privacy Rule</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="2mm" space-before.optimum="4pt" space-after.optimum="4pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The explanation of how this research could not be practicably conducted without waiver of authorization is adequate </fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     The explanation of how this research could not be practicably conducted without access to and use of the individually identifiable health information is appropriate</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:block font-style="italic">
                <fo:inline>If Title 38 U.S.C. 7332-protected information will be utilized, all of the following criteria have been met:</fo:inline>
            </fo:block>

            <fo:list-block provisional-distance-between-starts="7mm" provisional-label-separation="2mm" start-indent="2mm" space-before.optimum="4pt" space-after.optimum="4pt">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The information will be maintained in accordance with the security requirements per the local VA Privacy Officer</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block  line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     The purpose of the data is to conduct scientific research</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>      The information will not identify any individual patient in any report of the research, or otherwise disclose patient identifiers</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>

                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block  line-height="1.5pt" padding-before="4pt" padding-after="-3pt"></fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()" >
                        <fo:block>
                            <fo:external-graphic height="2mm"  src="url({$url}/checkbox2.gif)" />
                            <fo:inline>     N/A</fo:inline>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </fo:list-block>

            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>

            <fo:block>
                <fo:inline>Authorized IRB Signature: ________________________________________</fo:inline>
                <fo:inline>IRB Approval Date:_________________</fo:inline>
            </fo:block>
            <fo:block>
                <fo:leader leader-pattern="space" />
            </fo:block>
            <fo:block>
                <fo:inline>Printed Name of IRB Member: ________________________________________</fo:inline>
            </fo:block>

        </fo:block>
    </xsl:template>

</xsl:stylesheet>
