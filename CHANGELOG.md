

##CURRENT
* Revert "Remove feature flag for new homepage and make it the default"
  * Travis Schneeberger on Tue, 1 Dec 2015 13:17:51 -0500 [View Commit](../../commit/5bdeac82c8f0e81e9bc3d43ed72ca1e787fcfb8d)
* Remove feature flag for new homepage and make it the default
  * blackcathacker on Tue, 1 Dec 2015 09:27:17 -0800 [View Commit](../../commit/1431ddc2974b38c295a9751639e654fce1814d90)

##coeus-1512.1
* No Changes


##coeus-1511.112
* No Changes


##coeus-1511.111
*  Fixing UR calculation when OH rate is TDC and institute rate is set to 0.00
  * Gayathri Athreya on Mon, 30 Nov 2015 16:56:00 -0700 [View Commit](../../commit/0529a80f54d7839c3ac072b1cb0dbe7b866aff9b)

##coeus-1511.110
*  Cannot consistently copy a budget version from the Budget Versions Modal without generating an error.

  * Create a proposal with basic requirements to save.
  * Create a budget version > add a personnel line item, add a non-personnel line item: Save.
  * From the budget toolbar, select Budget Versions.
  * In the modal, select Actions> Copy. Select P1 only or all periods > copy.
  * Result:
  * The modal will close, but the dimmed background screen stays gray and the STE text can be seen.
  * The same results happened when I tried the Toolbar > Budget Versions >Copy from the proposal side.

  * Caused by: javax.persistence.PersistenceException: Exception [EclipseLink-7251] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.ValidationException Exception Description: The attribute [documentKey] of class [org.kuali.kra.bo.DocumentNextvalue] is mapped to a primary key column in the database. Updates are not allowed. at org.eclipse.persistence.internal.jpa.EntityManagerSetupImpl$1.handleException(EntityManagerSetupImpl.java:742) at
  * Travis Schneeberger on Mon, 30 Nov 2015 17:28:57 -0500 [View Commit](../../commit/b05ccd4648db10f4ed22b4ee6db726b2b7dc3033)

##coeus-1511.109
*  Budget > P&T > Delete period or modify budget period date range > User allowed to continue with mismatched dates to proposal

  * As a user with limited training in budget, I assume I can add or delete budget periods on the Budget >  Periods & Totals screen using the trashcan icon for any reason I choose. The period can have been generated and contain data, or be empty of values because no budget details have been generated or added.
  * I believe I can do this because the system lets me take that action, confirms that the budget period has been deleted, and lets me continue using the budget.
  * Issue(s):
  * Budget Period DATES are not being validated on the P&T screen, or at Complete.
  * -users can delete budget periods and continue.
  * -user can create a budget with missing date range

  * Desired Behavior:
  * After modifying periods on the P&T screen (*add, delete, edit existing dates*), System should validate the start and end dates in the budget to verify that they match the date range in the proposal details. *System should not let user save or leave the P&T screen until the Budget Start and End Date ranges matches the proposal start/end date range.*
  * Present an Error message to alert the user:  The budget period date range does not match the Start and/or End dates of the proposal. Use the 'reset to period defaults' option to restore the periods, or manually adjust the periods to include all days in the proposal date range.
  * Joe Williams on Mon, 30 Nov 2015 15:28:42 -0600 [View Commit](../../commit/07c6d44c97ab975b295044ed66ec51b5e8930e17)

##coeus-1511.108
* No Changes


##coeus-1511.107
*  Fixing role exemption certification and added tests.
  * I re-tested this case in 1511.58 and found that Key Persons with roles maintained in keypersonprojectrole who do not have to certify or disclose still show in Notify All and COI disclosure status modals but should not.
  * Gayathri Athreya on Mon, 30 Nov 2015 14:01:38 -0700 [View Commit](../../commit/4d170526406d6f4ff6a9990cb1f383dbe2e29474)
*  Budget category desciption was not setting properly for LA Vacation overhead items and NPE was throiwng while sorting these records of rate and base line items
  * Geo Thomas on Mon, 30 Nov 2015 15:35:53 -0500 [View Commit](../../commit/f288b2261b453b9133ec524b28387d96bc26dcd5)
* PD - "Save" button and proposal person certification "Clear All Answers" button is enabled in view mode
  * rmancher on Mon, 30 Nov 2015 15:19:57 -0500 [View Commit](../../commit/df4f9b609e3fc34b05ed2b2bdfdbd196d16ea829)

##coeus-1511.106
* Fix script to avoid failures

  * Re-order such that all dml occurs between necessary ddl to avoid auto-commit on DDL changes.
  * Add specific column names to avoid chances the default column ordering is different.
  * Backup subaward_amount_info and subaward_attachments into versioned backup tables in case of errors.
  * Geo Thomas on Mon, 30 Nov 2015 09:34:34 -0500 [View Commit](../../commit/5a7963a520ff47bdfe7740f2d9f6f16317866dbe)

##coeus-1511.105
* No Changes


##coeus-1511.104
* No Changes


##coeus-1511.103
*  Remove unused proposal budget status
  * Travis Schneeberger on Wed, 25 Nov 2015 22:01:37 -0500 [View Commit](../../commit/bbc2db9642be59de708e74e76d4ca8ae2c212355)

##coeus-1511.102
*  Fix underrecovery in some situations and add tests
  * If the Budget Settings > Unrecovered F&A Base selection is FUNSN, the system is not recognizing the the full difference. Cost Objects that are included in the FUNSN rate that are not charged F&A in the MTDC rate (like Equipment, Tuition, and Subawards) are not generating U/R when the rate pair of F&A = MTDC and UR F&A Base = FUNSN.
  * The following F&A Rate Type/Unrecovered F&A Rate Type combinations are still not calculating Underrecovery correctly in the budget, specifically on the Equipment and Tuition RA Object Codes (this seems to be happening with the Object Codes that are set-up to NOT apply MTDC).
  * F&A Rate Type/Unrecovered F&A Rate Type:
  * > MTDC /FUNSN
  * > FUNSN/MTDC
  * Example Scenario 1: MTDC over FUNSN
  * Proposal Activity Type: Other (or another one if you wish)
  * In the Budget > Budget Settings:
  * F&A Rate Type: MTDC
  * Unrecovered F&A Rate Type: FUNSN
  * In the Rates section, left the MTDC (56%) and FUNSN (M&S at 10%) rates at the Institute Rate
  * Add an Equipment - Not MTDC Object Code with a Total Base Cost of $10000
  * (while Equipment -Not MTDC is excluded from the MTDC base, it is included in the FUNSN base)
  * In the Edit Assigned Non-Personnel window for the Equipment Object Code there is nothing in the Rates tab - which is CORRECT (since no F&A rate is applied to Equipment), but the
  * Results: in all screens the KC Budget, this cost object displays 0.00
  * Desired results:
  * Details> Cost Sharing tab should display $1,000 for the over-recovery generated in the FUNSN UR BASE.
  * Periods & Totals screen > Unrecovered F&A column, is blank, but the 1,000 should be listed.
  * Add another line item of Travel of $10K.
  * Results:
  * The Details> Rates > MTDC = $5,6000
  * The Details > Cost Sharing > Unrecovered F&A = $4,600.
  * The Institutional Commitments > Unrecovered F&A is blank.
  * Expected Results;
  * The P&T screen > Underrecovered F&A should = $3,600 (-1000 + 4,600) Combining the unrecovered amounts of all lines.
  * Example Scenario 2:
  * Proposal Activity Type: Other (or another one if you wish)
  * In the Budget > Budget Settings:
  * F&A Rate Type: FUNSN
  * Unrecovered F&A Rate Type: MTDC
  * In the Rates section, left the MTDC (56%) and FUNSN (M&S at 10%) rates at the Institute Rate
  * Add Equipment - Not MTDC Object Code with a Total Base Cost of $10000
  * >Equipment -Not MTDC is excluded from the MTDC base, it is included in the FUNSN base
  * In the Details > Rates tab there is a Rate Cost of 1,000 (This is CORRECT (since 10% rate is applied to Equipment in the FUNSN base)
  * HOWEVER, in the Details> Cost Sharing tab> Underrecovered F&A is 0.00
  * Desired Result: -1,000.00 in the Unrecovered F&A for this scenario in the line item details.
  * Periods & Totals screen > Uncrecovered F&A is 0.00.
  * Desired Result: should be -1,000.
  * Next step > add travel expense of $10,000.
  * Results: Details > Rates> F&A of FUNSN is corrrect at $1,000.
  * Details > Cost Sharing > Unrecovered F&A = $4,600 (correct amount)
  * Commitments > Unrecovered F&A: Total unallocated = $4,600 (INCORRECT)
  * Periods & Totals> Unrecovered F&A = $4,600 (INCORRECT)
  * Desired Results;
  * Commitments > Unrecovered F&A: Total unallocated = $3,600 (-$1,000 + $4,600)
  * Periods & Totals> Unrecovered F&A $3,600 (-$1,000 + $4,600)
  * Gayathri Athreya on Mon, 30 Nov 2015 08:46:56 -0700 [View Commit](../../commit/1c1f0e48febc7a918a1c1b240bb168792f76fd6c)
*  Refactor calculate breakpoints
  * Gayathri Athreya on Tue, 24 Nov 2015 15:20:48 -0700 [View Commit](../../commit/7a4024df1a6907cd69c5cf86c80967fd5de817fb)
* Proposal Hierarchy: Changes to the Budget Periods on the Child
  * do NOT sync to the Parent Proposal.
  * Confirmed in res-test1 on 7/27/2015
  * Created a 4 year project period in initiating child> created parent.
  * Updated Parent start/end dates to 3 year
  * Updated Child proposal start/end dates; reset budget period boundaries.
  * Synced to parent: parent budget did not update to 3 year period. (there
  * were no budget details to delete; zero dollar budget).
  * Tried creating a new budget version in child with correct 3 year
  * periods: added budget details: marked for submission and synced to
  * parent, but parent budget STILL did not remove the unsupported 4th
  * period.
  * See parent #6382 and child 6381 in res-test1.
  * When a user creates a Proposal Hierarchy with certain project dates and
  * then changes those dates at both the child and parent levels, the budget
  * periods already created at the Parent Proposal do not update with the
  * new budget periods (especially when Periods are removed).
  * This happened last week in Production with Parent Proposal 27870 (the
  * parent and the child proposals were set up with a 5 year project period
  * but the parent proposal had 6 budget periods and the child proposals had
  * 5 budget periods). User kept getting the error on the Parent Proposal
  * Budget that 'Period 6 end date cannot exceed project end date' but there
  * was no way for us to fix it. 
  * Here are the steps to reproduce this:
  * 1. Create a proposal (child 1) entering minimum info to save with
  * Project Dates for example 07/01/2015 - 06/30/2021 
  * 2. Add a PI to your proposal 
  * 3. Create/Add a Budget Version (navigate to the Periods & Totals and you
should see 6 budget periods) (no need to add cost to the budget) 
  * 4. Click the Return to Proposal button to get back to the main proposal
screen 
  * 5. In the proposal screen, click the Hierarchy link in the toolbar and
  * in the Hierarchy window: 
  * a) Select Sub-Budget from the Hierarchy Budget Type 
  * b) Click the Create Hierarchy button 
  * 6. The Parent Proposal should be generated.
  * 7. Now, navigate to your PARENT Proposal and view the Budget (you should
see a Budget Version called 'Hierarchy Budget' and once you open it,
  * there should be the 6 budget periods that were in the child proposal
  * used to create the parent proposal) 
  * 8. In the Parent Budget, click the Return to Proposal button to get back
  * to the main proposal screen 
  * 9. On the Parent Proposal, in the Proposal Details, change the Project
  * End Date to 06/30/2020 
  * 10. Save and Close your Parent proposal
  * 11. Navigate to your CHILD proposal, and in the Proposal Details, change
  * the Project End Date to 06/30/2020 
  * 12. Then, open your budget and in the Periods & Totals section, click
  * the Rest to periods defaults button. You should now see 5 budget periods
  * (NOT 6) 
  * 13. Save your budget and click the Return to Proposal button. 
  * 14. In the proposal screen, click the Hierarchy link located in the
  * toolbar. In the Hierarchy window that opens, click the Sync Hierarchy
  * button (you should see a message that states 'Synchronization
successful') 
  * 15. Save and close out of your child proposal.
  * 16. Navigate back to the PARENT Proposal. 
  * 17. Navigate to the Budget and you still see the 6 Budget Periods that
  * were originally there. The system did not sync the budget periods change
  * from the child proposal. 
  * 18. While in the budget, click the Data Validation link, and Turn On the
  * Validations. You will get the error that 'Period 6 end date cannot
  * exceed end date' BUT there is no way to get rid off that period 6
  * You can see Parent Proposal Number 27496 in KC QA where this error is
shown.
  * Desired Behavior: The Parent Proposal Budget Periods should sync with
  * the Child Proposal Budget Periods.
  * MITKC-2023

  * 8. In the Parent Budget, click the Return to Proposal button to get back
  * to the main proposal screen 
  * 9. On the Parent Proposal, in the Proposal Details, change the Project
  * End Date to 06/30/2020 
  * 10. Save and Close your Parent proposal
  * 11. Navigate to your CHILD proposal, and in the Proposal Details, change
  * the Project End Date to 06/30/2020 
  * 12. Then, open your budget and in the Periods & Totals section, click
  * the Rest to periods defaults button. You should now see 5 budget periods
  * (NOT 6) 
  * 13. Save your budget and click the Return to Proposal button. 
  * 14. In the proposal screen, click the Hierarchy link located in the
  * toolbar. In the Hierarchy window that opens, click the Sync Hierarchy
  * button (you should see a message that states 'Synchronization
successful') 
  * 15. Save and close out of your child proposal.
  * 16. Navigate back to the PARENT Proposal. 
  * 17. Navigate to the Budget and you still see the 6 Budget Periods that
  * were originally there. The system did not sync the budget periods change
  * from the child proposal. 
  * 18. While in the budget, click the Data Validation link, and Turn On the
  * Validations. You will get the error that 'Period 6 end date cannot
  * exceed end date' BUT there is no way to get rid off that period 6
  * You can see Parent Proposal Number 27496 in KC QA where this error is
shown.
  * Desired Behavior: The Parent Proposal Budget Periods should sync with
  * the Child Proposal Budget Periods.
  * MITKC-2023  * vineeth on Wed, 25 Nov 2015 11:09:22 -0500 [View Commit](../../commit/291824ffed6b14ef16f17d71bf932d8caad05038)

##coeus-1511.101
* No Changes


##coeus-1511.100
* No Changes


##coeus-1511.99
* No Changes


##coeus-1511.98
* IRB - Review Comments not displaying in some Amendments
  * Issue here is when a schedule is selected at the time of approval and review comments are added prior to it,
  * a default schedule is set of each review comments.
  * Referenced schedule id is not changed based on switching schedule at the time of approval.
  * Fix to reprocess the review comments collection and update the latest schedule id prior to persisting.
  * rmancher on Thu, 26 Nov 2015 10:10:51 -0500 [View Commit](../../commit/bc910645fe3f226d7aad76ff98b75406ff8cee74)
*  STE occurs if initiating child proposal is unlinked before a non-lead unit child proposal.

*Step 1: create the initiating child proposal*
  * Create a proposal in lead unit IN-CARD
  * Add PI > user dusher
  * Create a new budget> zero dollars > mark complete/for submission
*Step 2*: create parent from initiating child
  * Toolbar> hierarchy > subbudget> *create parent* (Note proposal number of new parent)

*Step 3: create another matching lead unit child proposal*
  * While still in the initiating child proposal > toolbar > Copy proposal
  * Select IN-CARD as the unit (same as initiating) > copy budget
  * In new proposal, toolbar> budget versions > mark budget as for submission
  * Toolbar > hierarchy > subbudget > enter parent proposal number from step 2.> link to parent

*Step 4: create a new proposal in non-lead unit.*
  * Create proposal in unit IN-MED
  * Key Personnel > Add RHANLON as PI
  * Create Budget > zero $, complete & mark for submission
  * Return to proposal
  * Toolbar > Hiearchy > enter Parent proposal number from step 2, subbudget > link to parent
  * Close proposal

*Step 5: locate initiating child proposal*
 open in edit mode
  * Toolbar > hierarchy > unlink from hierarchy
save & close

*Step 6: located NON-LEAD child proposal*
  * Open in edit mode
  * Toolbar> hierarchy>unlink from hierarchy

  * {color:red}RESULT: STE{color}

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.hierarchy.ProposalHierarchyServiceImpl.removeFromHierarchy(ProposalHierarchyServiceImpl.java:300) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at
  * Travis Schneeberger on Mon, 30 Nov 2015 08:32:19 -0500 [View Commit](../../commit/8be198573da32ae9bb4942c29f2b728fbe9b5244)
*  Maintenance Doc > Organization > Audit > Audit Accepted field needs more than "Yes/No" options.
  * Options should include: Accepted, Rejected, Requested, and Reviewed.
  * In KC, the Organization "Audit Accepted" field is a checkbox, indicating a binary yes/no option.
  * In Coeus, the Audit Accepted field is a drop down with 4 options. (The dropdown has been in place since at least before Coeus 4.4.4, if not originally.)

  * This field is used by Research Subawards administrators to maintain a central, electronic record of detailed Audit status for subawardee organizations.
  * Field in KC needs to provide the same more detailed selection options as Coeus.
  * Travis Schneeberger on Wed, 25 Nov 2015 19:05:47 -0500 [View Commit](../../commit/1401811e891dfe428b766d7572c7c217f9826dde)
*  Fixing numerious bugs related to proposal development.

  * The user expects all proposals linked in a proposal hierarchy to be the same; therefore a children's status should match the status of the parent and should not be editable if in a status that does not allow edits.
           Currently, when a Hierarhcy Proposal Routes, the status of the parent becomes "Approval Pending" but the status of all the children remains as "In Progress."
           When the status of the Hierarchy Parent changes, the statuses of any linked children should be updated to match.  This should be reflected on the hierarchy tab, the medusa section, and in search results.

           From PD Search results, even when Parent is status of "Approval Pending" the children with "In Progress" have "Edit" action option enabled. When a hierarchy proposal is routing, parents AND children should all be locked down for editing as regular proposals are.

           From PD Search results, when Parent is status of "Approved and Submitted " the children with "In Progress" have "Edit" action option enabled. When a hierarchy proposal "Approved and Submitted, parents AND children should all be locked down from an further editing as regular proposals are.

           User with Edit permission for child proposal IS indeed able to open the hierarchy children with the Edit action link, even after parent is Approved & Submitted and they shouldn't be able to make any edits
           Note that when Hierarchy Parent is "Returned for Revisions," the child proposals should also be updated match the Proposal Status of the parent.

 Avoided a NullPointerException when creating a Proposal Hiearchy on a proposal without a budget.  Now a validation error occurs.
 Avoided a NullPointerException when linking a parent proposal to another proposal (child) that does not have a budget.  Now a validation error occurs.
 Corrected the proposal status inquiry so that it no longer uses the proposal type code but the proposal state code for the inquiry key.
  * Travis Schneeberger on Wed, 25 Nov 2015 11:14:47 -0500 [View Commit](../../commit/a92e0e0c9b15d3009c460d7d7e3beed5e53c4e66)

##coeus-1511.97
* No Changes


##coeus-1511.96
* No Changes


##coeus-1511.95
* PD Budget Version > Print > #1 "Budget Costshare Summary
  * Report" - missing column headers if no personnel costs.
  * if only non-personnel expenses are in the budget, the costshare summary
  * report does not include any column headers, making the report virtually
  * unusable for submission to sponsors or internal use.
  * To duplicate, create a budget version with only non-personnel items, add
  * cost share to the details.
  * Print the report following path: Budget Version > Print > #1 "Budget
  * Costshare Summary Report"
  * Results; There are no column headers to explain which column is the cost
share, the total cost to sponsor, and total project cost.
  * Desired Results: The column headers should appear on this report,
  * whether or not there is personnel.
  * Replicated in Res-Demo1 :1509.10 09-04-2015 18:01
  * PD 828 
  * Budget 1 - non personnel costs only no column headers
  * Budget 2 - personnel only included column headers
  * Budget 3 Personnel and non-personnel lines includes column headers
  * Discovered by MIT; their PDF of each budget attached. 
  * Screenshots from res demo 1  * vineeth on Fri, 27 Nov 2015 10:27:29 -0500 [View Commit](../../commit/e9329d62d5b1ae31ca242fecba1d69d63a8df04f)

##coeus-1511.94
* PD Budget Version > Action > Print > Budget Cumulative Report
  * printing formatting/subtotal & total display issues.
  * The printed report for Cumulative budget is not well formatted in KC.
  * The MIT Coeus version has been uploaded to compare and contrast to the
  * KC version. It would benefit end users if the print format could be
  * restored to match the MIT Coeus grouping on this report output.
  * PD Budget Version > Action > Print > Budget Cumulative Report printing
  * formatting/subtotal & total display issues
  * 1) The Budget Cumulative Report currently has a major display issue that
  * needs to be fixed for the Personnel section of the report. 
  * The report should display each Personnel Budget Category header once,
  * with multiple entries (one for each person per period entry in KC
  * budget) listed under it, followed by a single (sub)total calculation for
  * all budget entries using that personnel category. 
  * The report is currently printing with a unique Personnel Budget Category
  * header for each budget period instead of grouping.
  * See the uploaded pdf attachment example (KC PD 28061) : 
  * This budget contains a single Graduate Student and a single Senior
  * Personnel entry for each budget period on a 5 year budget. 
  * Rather than two headings & subtotals – one each for Graduate Students
  * and Senior Personnel – the personnel section has 5 of each, and in no
  * place is the "Total Graduate Students" or "Total Senior Personnel"
  * calculated for the cumulative budget period. 
  * In the pdf "KC PD 28061" The Personnel Headings and totals that should
  * remain are highlighted in green. All individual personnel entries should
  * be grouped under these.
  * For comparison, see pdf from Coeus Production, where grouping & totals
  * under personnel category headings is correct. (Coeus PD 00022845)
  * 2) The formatting needs to be corrected so that the line separating
  * Proposal info from start of budget report does is above the budget
  * report column headers and does not run through them.
  * 3) The Proposal Info at top of report – "Project" should instead be
  * labeled "Project Period" or just "Period"
  * 4) Formatting needs to be corrected so that longer Proposal Titles wrap
  * rather than extend beyond end of page and are cut off. See screenshot
  * "Long Title cut off"
  * vineeth on Thu, 26 Nov 2015 19:17:45 -0500 [View Commit](../../commit/cc077d5470bd295f31c4b82d1767ae991351f002)

##coeus-1511.93
* IRB - Review Comments not displaying while regenerating Amendment letter
  * Amendment is merged on to main protocol and a new document is created. Minutes/review comments
  * are not versioned while versioning protocol when amendment is merged. The review comments are only tied
  * corresponding amendemnt. Fix is to version review comments and attached it to versioned protocol.
  * rmancher on Thu, 26 Nov 2015 17:22:27 -0500 [View Commit](../../commit/2cc27b2c83193a0e85a7e53fabaab6247653b552)

##coeus-1511.92
* No Changes


##coeus-1511.91
* adding jdeps plugin, moving other code quality plugins to profiles.  updating docs
  * Travis Schneeberger on Thu, 26 Nov 2015 09:45:35 -0500 [View Commit](../../commit/0bccd0f74e762291f73c7ad61dbd0e2f5ad81461)

##coeus-1511.90
* Clean up subaward attachment handling

  * Move subaward attachments to new KcAttachmentDao implementation to resolve duplicating attachment stores and inconsistent storage types that caused errors specifically for Mysql and large attachments > than a couple of MBs.

  * Also resolves a problem with editing added subaward amount infos as changes were being made to a list that wasn't persisted.
  * blackcathacker on Tue, 24 Nov 2015 13:54:38 -0800 [View Commit](../../commit/8498d2dd1f65f03e62a85d0f0fa48357213dcdb7)

##coeus-1511.89
* No Changes


##coeus-1511.88
* No Changes


##coeus-1511.87
*  set default submissiontype while changing proposaltype in edit mode
  * Geo Thomas on Tue, 24 Nov 2015 16:23:59 -0500 [View Commit](../../commit/19865b435cdbe1c092862db7f966c64eabcf7b2f)
*  set default submissiontype in refresh method
  * Geo Thomas on Tue, 24 Nov 2015 15:50:53 -0500 [View Commit](../../commit/c0cfedafa97d3cd512b1e242ac34b940c7f2373a)

##coeus-1511.86
* No Changes


##coeus-1511.85
* No Changes


##coeus-1511.84
*  When a rejected proposal is saved the status should remain Revisions Requested unless the proposal is submitted to workflow.

  * As a central support person, I have superuser role to aid campus users. When I open a rejected proposal where the Status is "Revisions Requested", the status incorrectly changes to "In Progress". When a regular aggregator edits the revisions requested proposal, it stays in 'revisions requested' status. While this seems trivial, campus users will often search for this status proposal; but if the OSP super user aids in fixing trouble proposals, this breaks the search option.

  * To reproduce: as Quickstart -:
  * Reject a proposal or locate one in Revisions Requested status.
  * Click on Edit.
  * Proposal Opened, showed status Revisions Requested.
  * Clicked [Save]
  * Status Changed to In Progress
  * Closed proposal.
  * Searched for proposal.
  * Search Results showed In Progress for status.
  * Desired Result; the proposal status should stay in 'revisions requested' status until submitted to routing by the aggregator.
  * Travis Schneeberger on Tue, 24 Nov 2015 10:45:24 -0500 [View Commit](../../commit/c9efa5158e9e554d8d9b3fdc5375c797533d8af2)

##coeus-1511.83
* No Changes


##coeus-1511.82
*  database conversion to fix subaward amount info

  * Adds new java based data conversion to remove duplicates from the subaward amount info table. This conversion is documented in coeus-db/coeus-db-data-conv/README.md
  * blackcathacker on Thu, 19 Nov 2015 17:49:03 -0800 [View Commit](../../commit/34f38dfc911e4b406f5521b6baa1bb4494ef24e1)
*  Display and use amount infos from previous subaward versions

  * This commit changes the way subawards handle amount infos. Previously amount infos were copied forward with each successive version of the subaward. This changes this such that amount infos stay
  * linked to the original subaward version, but future subawards use the entire history of amount infos for display and calculation of total amounts. This change requires a reasonably complex conversion
  * included in the coeus-db-data-conv package that will remove these duplications. This change also makes previous amount infos read-only in future versions of subaward.
  * blackcathacker on Wed, 4 Nov 2015 16:25:41 -0800 [View Commit](../../commit/f6471164b60cbe87f7878a036ee5609663c0db59)

##coeus-1511.81
* Committee Edit - Performance issue
  * IRB committee document has huge performance issue.
  * Also volume of data is high.
  * This is when committee document is edited to make changes and routed.
  * Edit a committee and submit/blanket approve the document takes a while to complete the process and finalize the document.
  * Adding index to help boost performance.
  * rmancher on Mon, 23 Nov 2015 09:59:52 -0500 [View Commit](../../commit/5d8f026039d6213ea2c9e8bd7a191b0e81bd0820)

##coeus-1511.80
* No Changes


##coeus-1511.79
* When Spring Security is enabled, set X-Frame option to SAMEORIGIN

  * Without this things like the redirect page in the core spring context will disallow being viewed in the iframe and thus break things like Close and Cancel buttons when used.
  * blackcathacker on Mon, 23 Nov 2015 13:02:55 -0800 [View Commit](../../commit/7c577fa0fe5b130990009f8e9d018c9a01712d63)
*  Fixing calculation on cost element change
  * PD Budget - Non Personnel Line items: Rate calculations not updated with change of Cost Object from one where F&A and/or LA rates apply to one where they do not
  * Discovered in MIT KC Production.
  * Replicated in MIT KC QA Wkly Build kc1510.32
  * PD 29372 -
  * Steps to recreate:
  * Create a new proposal with Lead Unit being a unit where Lab Allocation rates are maintained.
  * Activity Type = Organized Research
  * Fill in other details as needed to save.
  * Go to budget - create a detailed budget.
  * Leave budget settings on the default (MTDC for both OH and UR rate types)
  * Go to Assign Non Personnel
  * Add a line item for "Materials and Services" (or any g/l which is subject to MTDC F&A and/or LA Rates) at $1000.
  * Save.
  * Go to Details > Rates for this line item. Note the rate types that have 'Rate Cost calculated.
  * (for MIT QA PD 29372 this included MTDC, EB on LA, Vacation on LA, LA - M&S, LA - Salaries)
  * Go to Details > Details for this line item
  * Change Category to "Other Operating Expenses"
  * Change Object Code Name to "Other Sponsor Funded Costs - Not MTDC" (or to another object code not subject to MTDC or LA )
  * Click Save Change.
  * After modal is closed, Click Save on the Non-Personnel Costs page.
  * Open Details > Rates for the line item again.
  * Note that the Rate Costs are still calculated and applied to the line item despite the change of the Cost Object.
  * KC needs to recalculate and apply correct rates to each line item when a change to Cost Object is made and then saved.
  * Should a user actually notice this calculation error, the only current workaround is to go to Budget Settings, change the OH Rate and the UR rate, Save, allow budget to recalculate & then save. Then go back to Budget settings, return to original selections, Save, and allow budget to again recalculate.
  * Resyncing rates from the rates tab or calculating budget period does NOT fix the problem.
  * Gayathri Athreya on Mon, 23 Nov 2015 13:15:32 -0700 [View Commit](../../commit/3b715d603511c9f7f948e833951cd6a8898ac2c3)

##coeus-1511.78
*  Budget Id and Budget Period Id are not set correctly when copying a proposal with a budget.
  * Travis Schneeberger on Fri, 20 Nov 2015 16:57:25 -0500 [View Commit](../../commit/370621df7b3ad2aa49b8360058530cdfbaaa960c)
*  Make small change to line items search ot avoid duplicate addition
  * Gayathri Athreya on Mon, 23 Nov 2015 11:20:21 -0700 [View Commit](../../commit/9fbbd86a58d58b43fdabcddb31fbd018101a4ba7)
*  clean out unused deep copy post processor code
  * Travis Schneeberger on Thu, 19 Nov 2015 11:35:50 -0500 [View Commit](../../commit/2c3c6992a67b69f6d573b1adf8e7a4c870b48c4c)

##coeus-1511.77
*  Attempt to fix cost sharing issues.
  * KC should not apply MTDC to Cost Sharing amount in Subaward cost elements that are populated to Non-Personnel expenses from Subawards entered in the Subawards Section of the budget.
  * Subawards with Cost Sharing input via the Subawards section - either with an uploaded grants.gov form or manually - result in subawardee Cost Share incurring F&A in the applicant organization budget. This causes incorrect amounts for the Cost Sharing Commitment, as well as for the Cost Sharing amount submitted to sponsor on the Grants.gov Coversheet (and budget if FNF form is included).
  * KC inputs the Subaward Cost Share amount that exist in Period 1 into the first Subcontract Object Code it adds to the Non-Personnel section, which in almost all cases is the Subcontracts - Subject to MIT F&A Object Code (that is set-up to apply F&A).
  * Steps to Reproduce:
  * 1. Create proposal with minim info required to save
  * 2. Create/add a detailed budget
  * 3. Navigate to the Subawards and click the +Add Subaward button
  * a. In the Add Subaward window:
  * i. Select an organization (e.g. enter 000090 in Organization Id field)
  * ii. Click the Add Subaward button (no need to upload an actual file - this can be demonstrated by manually entering the costs)
  * 4. Click the Details button for the added Subaward
  * a. In the Subaward Details window:
  * i. Enter the following in Budget Period 1 line:
  * • Direct Cost: 35000
  * • Indirect Cost:15000
  * • Cost Share 20000
  * ii. Click the Save Changes button
  * 5. Navigate to the Non-Personnel Costs section and you should see three Cost Elements/Object Codes added:
  * Subcontracts - Subject to MIT F&A
  * Subcontracts - No MIT F&A
  * Subcontractors F&A - No MIT F&A
  * 6. Navigate to the Institutional Commitments -> Cost Sharing and in Period 1 you will see Cost Sharing Amount that is higher than the $20,000 entered in the Subaward Details window (reason for it - is that KC applies MIT's F&A on the $20,000 of Subaward Cost Share which is incorrect and it should not happen). Also if you click on the View Subaward Cost Share button, in the Sub Award Cost Sharing Details window, you will only see the $20,000 entered and NOT the $20,000 + MIT's F&A (as displayed in the Cost Sharing Commitments section).
  * This miscalculation will cause the biggest issue if the proposal is to be submitted S2S since the Total Cost Share amount will populate the form showing to the Sponsor that we are committing more Cost Share than we really are.
  * There is no workaround for S2S if the application package includes the FedNonFed versions of the budget and subaward budget forms.
  * For non-S2S and when the RR Budget (NOT fed non fed) are included, there is a not-ideal work-around:
  * User must NOT add the Cost Sharing amounts in the Subawards section (Subaward Details window) BUT instead to manually add an additional Subcontracts - No MIT F&A object code in the Non-Personnel Costs section in Period 1 (and other Periods impacted), clicking on Details and inputting the Cost Sharing amount in the Cost Sharing Tab of that line item.
  * This workaround is not ideal as it makes reviewing subward info more difficult and 'buries' the cost sharing, in addition to being more work.
  * Gayathri Athreya on Fri, 20 Nov 2015 14:21:15 -0700 [View Commit](../../commit/0efb8a915d69c649f56ba0cccc52668e61faa74d)

##coeus-1511.76
* No Changes


##coeus-1511.75
* No Changes


##coeus-1511.74
* No Changes


##coeus-1511.72
* MIT- IRB - Protocols listed in Agenda PDF are not in desired
  * order.
  * Protocols listed in the agenda PDF are not in the desired order for MIT.
  * The agenda must sort the protocols by review type, then by submission
  * type and within each submission type they should display in numerical
sorting order.
  * Currently, when printing the agenda, the protocols are sorted by review
  * type (which is good) but then, all the submission types gets mixed
  * together  * vineeth on Fri, 20 Nov 2015 17:52:46 -0500 [View Commit](../../commit/d0f13deacd5ea76ed7de02adcca9b0485738ba87)

##coeus-1511.71
*  fixing sequence name in ojb mapping for watermark.
  * Travis Schneeberger on Fri, 20 Nov 2015 10:57:16 -0500 [View Commit](../../commit/baaea09feec0b07e907e4221a633e3e360a852ac)

##coeus-1511.70
* No Changes


##coeus-1511.69
* No Changes


##coeus-1511.68
* No Changes


##coeus-1511.67
*  remove the descriminator column DOCUMENT_NEXT_VALUE_TYPE from the table document_nextvalue.  It is not used.  Clean up next value code.
  * Travis Schneeberger on Thu, 19 Nov 2015 11:06:43 -0500 [View Commit](../../commit/759372238b5fc8e51f3d7eb7f3add1dd839a382b)

##coeus-1511.66
* No Changes


##coeus-1511.65
*   fixing a potential constraint violation when adding a propdev budget

  * org.springframework.orm.jpa.JpaSystemException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'DOCUMENT_NUMBER' cannot be null Error Code: 1048 Call: INSERT INTO DOCUMENT_NEXTVALUE (PROPERTY_NAME, DOCUMENT_NUMBER, NEXT_VALUE, OBJ_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR) VALUES (?, ?, ?, ?, ?, ?, ?) bind => [7 parameters bound] Query: InsertObjectQuery(org.kuali.kra.bo.DocumentNextvalue@6704e143[propertyName=personSequenceNumber,documentKey=<null>,nextValue=2,serialVersionUID=-9140148375067456625,updateUser=fchair,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=a647a7b8-7cc7-4c01-b41d-d45924e166cf,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]); nested exception is javax.persistence.PersistenceException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'DOCUMENT_NUMBER' cannot be null Error Code: 1048 Call: INSERT INTO DOCUMENT_NEXTVALUE (PROPERTY_NAME, DOCUMENT_NUMBER, NEXT_VALUE, OBJ_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR) VALUES (?, ?, ?, ?, ?, ?, ?) bind => [7 parameters bound] Query: InsertObjectQuery(org.kuali.kra.bo.DocumentNextvalue@6704e143[propertyName=personSequenceNumber,documentKey=<null>,nextValue=2,serialVersionUID=-9140148375067456625,updateUser=fchair,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=a647a7b8-7cc7-4c01-b41d-d45924e166cf,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]) at org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:321) at org.springframework.orm.jpa.DefaultJpaDialect.translateExceptionIfPossible(DefaultJpaDialect.java:120) at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:403) at org.kuali.rice.krad.data.jpa.KradEntityManagerFactoryBean.translateExceptionIfPossible(KradEntityManagerFactoryBean.java:546) at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:58) at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:213) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.doWithExceptionTranslation(JpaPersistenceProvider.java:555) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.save(JpaPersistenceProvider.java:187) at sun.reflect.GeneratedMethodAccessor1106.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:317) at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150) at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:96) at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:260) at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:94) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172) at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:204) at com.sun.proxy.$Proxy51.save(Unknown Source) at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.save(ProviderBasedDataObjectService.java:155) at org.kuali.coeus.propdev.impl.budget.ProposalBudgetServiceImpl.saveBudget(ProposalBudgetServiceImpl.java:185) at org.kuali.coeus.propdev.impl.budget.ProposalBudgetServiceImpl.getNewBudgetVersion(ProposalBudgetServiceImpl.java:144) at org.kuali.coeus.propdev.impl.budget.ProposalBudgetServiceImpl.getNewBudgetVersion(ProposalBudgetServiceImpl.java:64) at org.kuali.coeus.common.budget.impl.core.AbstractBudgetService.addBudgetVersion(AbstractBudgetService.java:70) at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetSharedControllerServiceImpl.addBudget(ProposalBudgetSharedControllerServiceImpl.java:112) at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetController.addBudget(ProposalBudgetController.java:59) at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetController$$FastClassBySpringCGLIB$$ea143290.invoke(<generated>) at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204) at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:629) at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetController$$EnhancerBySpringCGLIB$$badf24d.addBudget(<generated>) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.web.method.support.InvocableHandlerMethod.invoke(InvocableHandlerMethod.java:215) at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:132) at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672) at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:919) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:851) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:953) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:855) at javax.servlet.http.HttpServlet.service(HttpServlet.java:646) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:829) at javax.servlet.http.HttpServlet.service(HttpServlet.java:727) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:330) at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:118) at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:84) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:113) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:103) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:113) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:154) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:45) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilter(BasicAuthenticationFilter.java:150) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:110) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:57) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:87) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:50) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:342) at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:192) at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:160) at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:343) at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:260) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:78) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:62) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:92) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:80) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:327) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:82) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:62) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:320) at org.kuali.rice.krad.web.filter.BootstrapFilter.doFilter(BootstrapFilter.java:199) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at net.bull.javamelody.MonitoringFilter.doFilter(MonitoringFilter.java:198) at net.bull.javamelody.MonitoringFilter.doFilter(MonitoringFilter.java:176) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.PerformanceLoggingFilter.doFilter(PerformanceLoggingFilter.java:82) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.SessionExpiredFilter.doFilter(SessionExpiredFilter.java:46) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.HideWebInfFilter.doFilter(HideWebInfFilter.java:68) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.AbstractRequestLoggingFilter.doFilterInternal(AbstractRequestLoggingFilter.java:223) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220) at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122) at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170) at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103) at org.apache.catalina.valves.RemoteIpValve.invoke(RemoteIpValve.java:683) at org.apache.catalina.valves.CrawlerSessionManagerValve.invoke(CrawlerSessionManagerValve.java:180) at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:950) at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116) at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:421) at org.apache.coyote.ajp.AjpAprProcessor.process(AjpAprProcessor.java:188) at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:611) at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.doRun(AprEndpoint.java:2466) at org.apache.tomcat.util.net.AprEndpoint$SocketProcessor.run(AprEndpoint.java:2455) at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142) at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617) at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61) at java.lang.Thread.run(Thread.java:745) Caused by: javax.persistence.PersistenceException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'DOCUMENT_NUMBER' cannot be null Error Code: 1048 Call: INSERT INTO DOCUMENT_NEXTVALUE (PROPERTY_NAME, DOCUMENT_NUMBER, NEXT_VALUE, OBJ_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR) VALUES (?, ?, ?, ?, ?, ?, ?) bind => [7 parameters bound] Query: InsertObjectQuery(org.kuali.kra.bo.DocumentNextvalue@6704e143[propertyName=personSequenceNumber,documentKey=<null>,nextValue=2,serialVersionUID=-9140148375067456625,updateUser=fchair,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=a647a7b8-7cc7-4c01-b41d-d45924e166cf,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]) at org.eclipse.persistence.internal.jpa.EntityManagerImpl.flush(EntityManagerImpl.java:879) at sun.reflect.GeneratedMethodAccessor1104.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at net.bull.javamelody.JpaWrapper.doInvoke(JpaWrapper.java:70) at net.bull.javamelody.JpaWrapper$EntityManagerHandler.invoke(JpaWrapper.java:130) at net.bull.javamelody.JdbcWrapper$DelegatingInvocationHandler.invoke(JdbcWrapper.java:286) at com.sun.proxy.$Proxy305.flush(Unknown Source) at sun.reflect.GeneratedMethodAccessor1104.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.orm.jpa.ExtendedEntityManagerCreator$ExtendedEntityManagerInvocationHandler.invoke(ExtendedEntityManagerCreator.java:366) at com.sun.proxy.$Proxy49.flush(Unknown Source) at sun.reflect.GeneratedMethodAccessor1104.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.orm.jpa.SharedEntityManagerCreator$SharedEntityManagerInvocationHandler.invoke(SharedEntityManagerCreator.java:241) at com.sun.proxy.$Proxy49.flush(Unknown Source) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider$1.call(JpaPersistenceProvider.java:204) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.doWithExceptionTranslation(JpaPersistenceProvider.java:552) ... 131 more Caused by: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'DOCUMENT_NUMBER' cannot be null Error Code: 1048 Call: INSERT INTO DOCUMENT_NEXTVALUE (PROPERTY_NAME, DOCUMENT_NUMBER, NEXT_VALUE, OBJ_ID, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR) VALUES (?, ?, ?, ?, ?, ?, ?) bind => [7 parameters bound] Query: InsertObjectQuery(org.kuali.kra.bo.DocumentNextvalue@6704e143[propertyName=personSequenceNumber,documentKey=<null>,nextValue=2,serialVersionUID=-9140148375067456625,updateUser=fchair,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=a647a7b8-7cc7-4c01-b41d-d45924e166cf,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]) at org.eclipse.persistence.exceptions.DatabaseException.sqlException(DatabaseException.java:331) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeDirectNoSelect(DatabaseAccessor.java:902) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeNoSelect(DatabaseAccessor.java:964) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.basicExecuteCall(DatabaseAccessor.java:633) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeCall(DatabaseAccessor.java:560) at org.eclipse.persistence.internal.sessions.AbstractSession.basicExecuteCall(AbstractSession.java:2055) at org.eclipse.persistence.sessions.server.ClientSession.executeCall(ClientSession.java:306) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.executeCall(DatasourceCallQueryMechanism.java:242) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.executeCall(DatasourceCallQueryMechanism.java:228) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.insertObject(DatasourceCallQueryMechanism.java:377) at org.eclipse.persistence.internal.queries.StatementQueryMechanism.insertObject(StatementQueryMechanism.java:165) at org.eclipse.persistence.internal.queries.StatementQueryMechanism.insertObject(StatementQueryMechanism.java:180) at org.eclipse.persistence.internal.queries.DatabaseQueryMechanism.insertObjectForWrite(DatabaseQueryMechanism.java:489) at org.eclipse.persistence.queries.InsertObjectQuery.executeCommit(InsertObjectQuery.java:80) at org.eclipse.persistence.queries.InsertObjectQuery.executeCommitWithChangeSet(InsertObjectQuery.java:90) at org.eclipse.persistence.internal.queries.DatabaseQueryMechanism.executeWriteWithChangeSet(DatabaseQueryMechanism.java:301) at org.eclipse.persistence.queries.WriteObjectQuery.executeDatabaseQuery(WriteObjectQuery.java:58) at org.eclipse.persistence.queries.DatabaseQuery.execute(DatabaseQuery.java:904) at org.eclipse.persistence.queries.DatabaseQuery.executeInUnitOfWork(DatabaseQuery.java:803) at org.eclipse.persistence.queries.ObjectLevelModifyQuery.executeInUnitOfWorkObjectLevelModifyQuery(ObjectLevelModifyQuery.java:108) at org.eclipse.persistence.queries.ObjectLevelModifyQuery.executeInUnitOfWork(ObjectLevelModifyQuery.java:85) at org.eclipse.persistence.internal.sessions.UnitOfWorkImpl.internalExecuteQuery(UnitOfWorkImpl.java:2896) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1857) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1839) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1790) at org.eclipse.persistence.internal.sessions.CommitManager.commitNewObjectsForClassWithChangeSet(CommitManager.java:227) at org.eclipse.persistence.internal.sessions.CommitManager.commitAllObjectsForClassWithChangeSet(CommitManager.java:194) at org.eclipse.persistence.internal.sessions.CommitManager.commitAllObjectsWithChangeSet(CommitManager.java:139) at org.eclipse.persistence.internal.sessions.AbstractSession.writeAllObjectsWithChangeSet(AbstractSession.java:4260) at org.eclipse.persistence.internal.sessions.UnitOfWorkImpl.commitToDatabase(UnitOfWorkImpl.java:1441) at org.eclipse.persistence.internal.sessions.UnitOfWorkImpl.commitToDatabaseWithPreBuiltChangeSet(UnitOfWorkImpl.java:1587) at org.eclipse.persistence.internal.sessions.RepeatableWriteUnitOfWork.writeChanges(RepeatableWriteUnitOfWork.java:455) at org.eclipse.persistence.internal.jpa.EntityManagerImpl.flush(EntityManagerImpl.java:874) ... 150 more Caused by: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'DOCUMENT_NUMBER' cannot be null at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method) at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62) at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45) at java.lang.reflect.Constructor.newInstance(Constructor.java:422) at com.mysql.jdbc.Util.handleNewInstance(Util.java:409) at com.mysql.jdbc.Util.getInstance(Util.java:384) at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:1039) at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:4232) at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:4164) at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2615) at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2776) at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2838) at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:2082) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2334) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2262) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2246) at sun.reflect.GeneratedMethodAccessor253.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at bitronix.tm.resource.jdbc.BaseProxyHandlerClass.invoke(BaseProxyHandlerClass.java:64) at com.sun.proxy.$Proxy23.executeUpdate(Unknown Source) at sun.reflect.GeneratedMethodAccessor253.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at net.bull.javamelody.JdbcWrapper.doExecute(JdbcWrapper.java:404) at net.bull.javamelody.JdbcWrapper$StatementInvocationHandler.invoke(JdbcWrapper.java:129) at net.bull.javamelody.JdbcWrapper$DelegatingInvocationHandler.invoke(JdbcWrapper.java:286) at com.sun.proxy.$Proxy24.executeUpdate(Unknown Source) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeDirectNoSelect(DatabaseAccessor.java:892) ... 181 more
  * Travis Schneeberger on Thu, 19 Nov 2015 09:07:24 -0500 [View Commit](../../commit/ab61e699265a7b8fcdf3d67f7a829ea62b1181f8)
*   removing dead code
  * Travis Schneeberger on Wed, 18 Nov 2015 20:21:10 -0500 [View Commit](../../commit/1d1f4c52a86823846cd1d358679ddeaf71e67124)

##coeus-1511.64
* No Changes


##coeus-1511.63
* Modular Budget Sync incorrectly includes 'unapplied mtdc' in
  * F&A base.
  * In PD Budget, for a Modular budget, when you uncheck the "Apply Rate"
  * box for the MTDC in the details of a detailed budget line item, this is
  * not picked up when syncing your Modular Budget. The Modular budget does
  * NOT get adjusted to exclude the 'unapplied' MTDC from the F&A Base. The
  * F&A Base should only show the sum of the expenses for which the F&A rate
  * type box has been checked
  * Steps to recreate:
  * Start a new detailed budget version. Select Yes for modular. 
  * Add a few line items to the detailed budget. 
  * Go to Modular Budget Window. 
  * Click Sync. 
  * The Modular Budget correctly calculates based on detailed budget
  * entries.
  * Return to detailed budget > Non Personnel Costs (or Assign Personnel to
  * Period). 
  * Select Details (Or Details & Rates for personnel) for one of the line
  * item. 
  * In the Rates tab, Uncheck the "Apply Rate" box for MTDC. 
  * Save changes.
  * Go to Modular Budget Section 
  * Click "Sync" to pull in changes made to detailed budget. 
  * No updates are made to the calculation of F&A Base, Funds Requested,
  * Total Requested Costs fields.
  * Go to Budget Summary or Periods & Totals. 
  * Amounts are different than those in the Modular budget.  * vineeth on Wed, 18 Nov 2015 18:10:07 -0500 [View Commit](../../commit/7fa47ffbacfd679ff05955609c4b9fa423191a26)

##coeus-1511.62
*   When a proposal with budget is copied and the budget contains line items that have rates applied, the copied budget cannot be deleted.  The following STE occurs:

  * org.springframework.orm.jpa.JpaSystemException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`res_e1db`.`budget_details_cal_amts`, CONSTRAINT `FK1_BUDGET_DETAILS_CAL_AMTS` FOREIGN KEY (`BUDGET_DETAILS_ID`) REFERENCES `budget_details` (`BUDGET_DETAILS_ID`)) Error Code: 1451 Call: DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN ) bind => [1 parameter bound] Query: DeleteAllQuery(referenceClass=BudgetLineItem sql="DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN )"); nested exception is javax.persistence.PersistenceException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`res_e1db`.`budget_details_cal_amts`, CONSTRAINT `FK1_BUDGET_DETAILS_CAL_AMTS` FOREIGN KEY (`BUDGET_DETAILS_ID`) REFERENCES `budget_details` (`BUDGET_DETAILS_ID`)) Error Code: 1451 Call: DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN ) bind => [1 parameter bound] Query: DeleteAllQuery(referenceClass=BudgetLineItem sql="DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN )") at org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:321) at org.springframework.orm.jpa.DefaultJpaDialect.translateExceptionIfPossible(DefaultJpaDialect.java:120) at org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:403) at org.kuali.rice.krad.data.jpa.KradEntityManagerFactoryBean.translateExceptionIfPossible(KradEntityManagerFactoryBean.java:546) at org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:58) at org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:213) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.doWithExceptionTranslation(JpaPersistenceProvider.java:555) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.deleteMatching(JpaPersistenceProvider.java:317) at sun.reflect.GeneratedMethodAccessor1967.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:317) at org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:183) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150) at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:96) at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:260) at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:94) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172) at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:204) at com.sun.proxy.$Proxy52.deleteMatching(Unknown Source) at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.deleteMatching(ProviderBasedDataObjectService.java:136) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentServiceImpl.cleanupBudgetObjects(ProposalDevelopmentServiceImpl.java:255) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentServiceImpl.deleteProposal(ProposalDevelopmentServiceImpl.java:222) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.deleteProposal(ProposalDevelopmentSubmitController.java:198) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController$$FastClassBySpringCGLIB$$aff09485.invoke(<generated>) at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204) at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:700) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150) at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:96) at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:260) at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:94) at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:172) at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:633) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController$$EnhancerBySpringCGLIB$$aba74b42.deleteProposal(<generated>) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at org.springframework.web.method.support.InvocableHandlerMethod.invoke(InvocableHandlerMethod.java:215) at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:132) at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:743) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:672) at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:82) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:919) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:851) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:953) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:855) at javax.servlet.http.HttpServlet.service(HttpServlet.java:646) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:829) at javax.servlet.http.HttpServlet.service(HttpServlet.java:727) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:78) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:62) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:92) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:80) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:327) at org.kuali.coeus.sys.framework.auth.AuthServiceFilter.validateWebUserLoginToken(AuthServiceFilter.java:117) at org.kuali.coeus.sys.framework.auth.AuthServiceFilter.authenticateWebBasedUser(AuthServiceFilter.java:101) at org.kuali.coeus.sys.framework.auth.AuthServiceFilter.doFilter(AuthServiceFilter.java:90) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:320) at org.kuali.rice.krad.web.filter.BootstrapFilter.doFilter(BootstrapFilter.java:199) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at net.bull.javamelody.MonitoringFilter.doFilter(MonitoringFilter.java:198) at net.bull.javamelody.MonitoringFilter.doFilter(MonitoringFilter.java:176) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.PerformanceLoggingFilter.doFilter(PerformanceLoggingFilter.java:82) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.SessionExpiredFilter.doFilter(SessionExpiredFilter.java:46) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.HideWebInfFilter.doFilter(HideWebInfFilter.java:68) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.AbstractRequestLoggingFilter.doFilterInternal(AbstractRequestLoggingFilter.java:223) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:88) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220) at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122) at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170) at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103) at org.apache.catalina.valves.RemoteIpValve.invoke(RemoteIpValve.java:683) at org.apache.catalina.valves.CrawlerSessionManagerValve.invoke(CrawlerSessionManagerValve.java:180) at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:950) at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116) at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:421) at org.apache.coyote.ajp.AjpAprProcessor.process(AjpAprProcessor.java:188) at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:611) at org.apache.tomcat.util.net.AprEndpoint$SocketWithOptionsProcessor.run(AprEndpoint.java:2403) at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142) at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617) at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61) at java.lang.Thread.run(Thread.java:745) Caused by: javax.persistence.PersistenceException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`res_e1db`.`budget_details_cal_amts`, CONSTRAINT `FK1_BUDGET_DETAILS_CAL_AMTS` FOREIGN KEY (`BUDGET_DETAILS_ID`) REFERENCES `budget_details` (`BUDGET_DETAILS_ID`)) Error Code: 1451 Call: DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN ) bind => [1 parameter bound] Query: DeleteAllQuery(referenceClass=BudgetLineItem sql="DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN )") at org.eclipse.persistence.internal.jpa.QueryImpl.executeUpdate(QueryImpl.java:308) at sun.reflect.GeneratedMethodAccessor1968.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at net.bull.javamelody.JpaWrapper.doInvoke(JpaWrapper.java:70) at net.bull.javamelody.JpaWrapper$QueryHandler.invoke(JpaWrapper.java:203) at net.bull.javamelody.JdbcWrapper$DelegatingInvocationHandler.invoke(JdbcWrapper.java:285) at com.sun.proxy.$Proxy308.executeUpdate(Unknown Source) at org.kuali.rice.krad.data.jpa.JpaCriteriaQuery.executeUpdate(JpaCriteriaQuery.java:66) at org.kuali.rice.krad.data.jpa.DataObjectCriteriaQueryBase.deleteMatching(DataObjectCriteriaQueryBase.java:95) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider$6.call(JpaPersistenceProvider.java:320) at org.kuali.rice.krad.data.jpa.JpaPersistenceProvider.doWithExceptionTranslation(JpaPersistenceProvider.java:552) ... 102 more Caused by: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`res_e1db`.`budget_details_cal_amts`, CONSTRAINT `FK1_BUDGET_DETAILS_CAL_AMTS` FOREIGN KEY (`BUDGET_DETAILS_ID`) REFERENCES `budget_details` (`BUDGET_DETAILS_ID`)) Error Code: 1451 Call: DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN ) bind => [1 parameter bound] Query: DeleteAllQuery(referenceClass=BudgetLineItem sql="DELETE FROM BUDGET_DETAILS WHERE (BUDGET_ID IN )") at org.eclipse.persistence.exceptions.DatabaseException.sqlException(DatabaseException.java:331) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeDirectNoSelect(DatabaseAccessor.java:902) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeNoSelect(DatabaseAccessor.java:964) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.basicExecuteCall(DatabaseAccessor.java:633) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeCall(DatabaseAccessor.java:560) at org.eclipse.persistence.internal.sessions.AbstractSession.basicExecuteCall(AbstractSession.java:2055) at org.eclipse.persistence.sessions.server.ClientSession.executeCall(ClientSession.java:306) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.executeCall(DatasourceCallQueryMechanism.java:242) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.executeCall(DatasourceCallQueryMechanism.java:228) at org.eclipse.persistence.internal.queries.DatasourceCallQueryMechanism.deleteAll(DatasourceCallQueryMechanism.java:127) at org.eclipse.persistence.queries.DeleteAllQuery.executeDatabaseQuery(DeleteAllQuery.java:201) at org.eclipse.persistence.queries.DatabaseQuery.execute(DatabaseQuery.java:904) at org.eclipse.persistence.queries.DatabaseQuery.executeInUnitOfWork(DatabaseQuery.java:803) at org.eclipse.persistence.queries.ModifyAllQuery.executeInUnitOfWork(ModifyAllQuery.java:148) at org.eclipse.persistence.queries.DeleteAllQuery.executeInUnitOfWork(DeleteAllQuery.java:124) at org.eclipse.persistence.internal.sessions.UnitOfWorkImpl.internalExecuteQuery(UnitOfWorkImpl.java:2896) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1857) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1839) at org.eclipse.persistence.internal.sessions.AbstractSession.executeQuery(AbstractSession.java:1804) at org.eclipse.persistence.internal.jpa.QueryImpl.executeUpdate(QueryImpl.java:298) ... 113 more Caused by: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`res_e1db`.`budget_details_cal_amts`, CONSTRAINT `FK1_BUDGET_DETAILS_CAL_AMTS` FOREIGN KEY (`BUDGET_DETAILS_ID`) REFERENCES `budget_details` (`BUDGET_DETAILS_ID`)) at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method) at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62) at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45) at java.lang.reflect.Constructor.newInstance(Constructor.java:422) at com.mysql.jdbc.Util.handleNewInstance(Util.java:409) at com.mysql.jdbc.Util.getInstance(Util.java:384) at com.mysql.jdbc.SQLError.createSQLException(SQLError.java:1039) at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:4232) at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:4164) at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:2615) at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:2776) at com.mysql.jdbc.ConnectionImpl.execSQL(ConnectionImpl.java:2838) at com.mysql.jdbc.PreparedStatement.executeInternal(PreparedStatement.java:2082) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2334) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2262) at com.mysql.jdbc.PreparedStatement.executeUpdate(PreparedStatement.java:2246) at sun.reflect.GeneratedMethodAccessor267.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at bitronix.tm.resource.jdbc.BaseProxyHandlerClass.invoke(BaseProxyHandlerClass.java:64) at com.sun.proxy.$Proxy24.executeUpdate(Unknown Source) at sun.reflect.GeneratedMethodAccessor267.invoke(Unknown Source) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:497) at net.bull.javamelody.JdbcWrapper.doExecute(JdbcWrapper.java:403) at net.bull.javamelody.JdbcWrapper$StatementInvocationHandler.invoke(JdbcWrapper.java:128) at net.bull.javamelody.JdbcWrapper$DelegatingInvocationHandler.invoke(JdbcWrapper.java:285) at com.sun.proxy.$Proxy25.executeUpdate(Unknown Source) at org.eclipse.persistence.internal.databaseaccess.DatabaseAccessor.executeDirectNoSelect(DatabaseAccessor.java:892) ... 131 more
  * Travis Schneeberger on Wed, 18 Nov 2015 17:30:20 -0500 [View Commit](../../commit/310e44557de2df7e8d076e43ccd5b664be882fa3)
*  Attempt to fix LA print issues.
  * Single remaining issue in MIT KC Wkly when testing MITKC-2251 (which is marked Resolved & Ready to Deploy for the majority of issues in the case passing testing).
  * The line for "Allocated Lab Expense" that should appear under Other Direct Costs category is missing.
  * This is should be the sum of the M&A and the Utilities Lab Allocations entered in a single line.
  * This amount should be $27,569.40 for this proposal.
  * Only issue is this missing line for Allocated Lab Expense - all totals and subtotals are correct per the KC Budget, but when subtotals on the form are added, they do not equal the Total Direct Costs, etc.
  * If manually calculating total direct costs from line items on the budget print form:
  * TOTAL SALARIES & WAGES & FRINGE BENEFITS = 152,318.12
  * Total Materials = $1,000.00
  * Total Travel - Foreign = $12,000.00
  * --------> These add to $165,318.12
  * Amount of Total Direct Costs is actually $192,887.52
  * The missing line for Allocated Lab Expense = Allocated Lab Expense = $27,569.40 is the difference.
  * See uploaded PDF – all amounts correctly calculated and highlighted in Green.
  * Tested in MIT KC Wkly build kc1509.65
  * User = AEH
  * PD #29290
  * Testing scenario:
  * The lead unit is a Lab Allocated unit
  * The budget is built with with 5 individuals all assigned to the default Cost Element/group Research Staff - Off.
  * There is an additional single faculty personnel added
  * Lead Unit: Haystack
  * LA Rates Maintained for Salaries, M&S and Utilities
  * Budget Setting set to Off Campus for entire budget
  * Budget Details contains:
  * 5 Research Staff - Off.
  * 1 Faculty line item entered with 10% academic year effort, 0% charge, to create personnel cost sharing.
  * 1 line of M&A - $1000 cost to sponsor, $1000 entered as Cost Sharing.
  * 1 Line item for travel costs.
  * Gayathri Athreya on Wed, 18 Nov 2015 15:08:24 -0700 [View Commit](../../commit/b0f35348496d39618f6cd7739098b79ceb4f5ff2)
* budget deletion fixes
  * blackcathacker on Wed, 18 Nov 2015 12:28:56 -0800 [View Commit](../../commit/4ec933ddb353cc163a9e4739f895405a129eee75)

##coeus-1511.61
* No Changes


##coeus-1511.60
* Award with Multi-PI does not show Multi-PI on printed NOA.
  * If an Award contains a contact of type PI/Multiple, that Multiple PI/MPI
  * is not populated in the Award Notice printed report, or the Award
  * Modification report
  * Steps:
  * 1) Open Demo 1 Award ID 000024-00001
  * 2) Go to Award Actions>expand the Print panel
  * 3) Click Print button on the far right in the Award Notice section
  * Results:
  * 4) The investigator list only shows the PI and any Co'-I's: not the
  * Multi-PIs. 
  * See screenshot from MIT.
  * Confirmed in res demo 1 
  * See related RESKC-776 for the IP report fix to include MPI.
  * vineeth on Mon, 16 Nov 2015 17:08:36 -0500 [View Commit](../../commit/79189d1acf6f4a0f81d88f90849770d40412c94f)

##coeus-1511.59
* No Changes


##coeus-1511.58
* No Changes


##coeus-1511.57
* No Changes


##coeus-1511.56
* No Changes


##coeus-1511.54
* No Changes


##coeus-1511.52
* updating commons-collections due to a security advisory and other dependencies, reverting slf4j due to startup errors
  * Travis Schneeberger on Wed, 18 Nov 2015 09:12:27 -0500 [View Commit](../../commit/3bf7141d5556707fd1e8e3475703a5bacde7aeaf)

##coeus-1511.50
* No Changes


##coeus-1511.49
* No Changes


##coeus-1511.48
* updating commons-collections due to a security advisory and other dependencies
  * Travis Schneeberger on Tue, 17 Nov 2015 16:08:22 -0500 [View Commit](../../commit/b94c41efa3baa319eb39dad3498de16797f7b150)

##coeus-1511.47
*  Fix calculated direct cost calculation
  * A recent case fixed the Assigned Personnel screen's "Fringe" field to accurately display the combined personnel rate expenses of EB and Vacation. The field name was updated to 'calculated fringe.' (RESKC-416)
  * An unexpected result is that the Budget Summary screen is now incorrectly duplicating expenses.
  * Discovered in MIT's testing of fix for RESKC-416
  * Confirmed in Res Demo 1; Proposal #985
  * While Budget > Budget Summary > Personnel > Fringe for individuals DOES correctly display the cost of EB + Vacation for the individual.
  * The Budget > Budget Summary > Personnel > Calculated Direct Costs calculation is incorrect.
  * This amount STILL INCLUDES the Vacation expense for the individual, thus Vacation is being double counted in the budget summary. The Personnel Calculated Direct Costs should include only the "Lab Allocation - Salaries", "EB On LA", "Vacation on LA" and NOT the "Vacation" calculated for personnel.
  * The duplicate Vacation expense is causing the Total of the Personnel Subtotal and the Non-personnel Subtotal to exceed the Total Direct Costs listed on the Budget Summary.
  * Each “Rate Cost” for an individual should be included in ONLY one amount on the Budget Summary.
  * Scenario:
  * Create a proposal in an Lab Allocated unit, entering minimum details to save, with activity Type Research.
  * Create a new budget version with detailed budget.
  * Add an individual to Project Personnel with salary.
  * Assign Personnel to Period using a cost object subject to Vacation Accrual (e.g. Research Staff - On)
  * In Non-Personnel Costs, Add a travel line item.
  * Go to Budget Summary.
  * Note the Personnel > Calculated Direct Costs.
  * Go back to Assign Personnel to Period.
  * Open Details and Rates for the Research Staff Line item.
  * Compare amount from Budget Summary > Personnel > Calculated Direct Costs to the total of "Lab Allocation - Salaries", "EB On LA", and "Vacation on LA" rates for the person.
  * The amount from the Budget Summary will be higher with the delta being cost of vacation accrual for the individual.
  * Tested in KC Wkly build kc1509.65
  * PD #29305, budget #2.
  * Gayathri Athreya on Mon, 16 Nov 2015 13:34:57 -0700 [View Commit](../../commit/6444809495cee223c908cb78ca0396343ac74144)

##coeus-1511.46
* New Research Home page with suggest text box and quicklinks
  * blackcathacker on Mon, 16 Nov 2015 15:36:18 -0800 [View Commit](../../commit/22de7a3838b80077d336348a55aabe3ebe10b471)
*  Fix rest issue
  * ISSUE4:
  * Errors sometimes have html in them
  * Gayathri Athreya on Mon, 16 Nov 2015 15:52:59 -0700 [View Commit](../../commit/0625957403c472e7e4463d69b21138bdd65f80ca)
* PD - Exempt Address Book person PI/Multiple from certification
  * & notification
  * MIT requires some non-employees to participate in the system to perform
  * the proposal person certification. The parameter to exempt identified
  * key person roles is utilized to manage excluding those identified Key
  * Persons. Another solution is required to exempt non-employee/address
  * book persons added as the Proposal Role of PI/Multiple.
  * Per MIT compliance policy and procedure, proposal persons added to a
  * proposal via Non-Employee search (address book) and given the role of
  * PI/Multiple are exempt from the proposal person certification process.
  * Therefore, If the proposal role is PI/Multiple and the person is a
  * Non-Employee/ address book, 
  * THEN:
  * do not present the proposal person certification questionnaire
  * do not display certification status in the role header row
  * do not have a 'notify' option button in the role header row
  * do not include this proposal person in the "notify all' option in the
  * COI Disclosure Status window.
  * DO show 'Not Required" as the certification status in the COI Disclosure
  * Status window
  * The behavior should be the same as that of the parameterized Key Persons
  * exemption (KeyPersonProjectRole), but used for the assigned proposal
  * role of PI/Multiple.
  * Providing this as a parameter option is appropriate to allow other
  * implementers to include or exempt, as determined by their local policy.
  * Suggested name: EXEMPT_ADDRESSBOOK_MULTI-PI_CERT
  * vineeth on Thu, 12 Nov 2015 13:52:48 -0500 [View Commit](../../commit/8858db96a886926d565a003d61da27fd086eb14a)

##coeus-1511.44
* adding rest endpoint to discover our rest endpoints
  * Travis Schneeberger on Mon, 16 Nov 2015 15:34:31 -0500 [View Commit](../../commit/0529dbfe8aa050dc72192f5162c4f6cd56560e53)

##coeus-1511.43
* No Changes


##coeus-1511.42
* IRB - Batch Correspondence is producing Blank renewal reminder letters.
  * Prior fix to eliminate blank closure letter removed renewal stream and set the correspondence stream which now
  * broke the renewal reminders. Current cofiguration requires renewal stream to generate renewal reminders and correspondence
stream for other correspodences. While generating batch correspodence, all expiring and expired protocols are fetched
  * based on configuration. So there might be a case where we need to generate both renewal reminders as well as closure
  * letters when a batch correspondence action is performed. Tried to set both streams in the map but that is adding additional
  * blank pages at the top and in between each letters. As a fix, created a wrapper and parameter to define renewal
  * reminder correspondence types. The wrapper rely on this parameter to identify which stream to use while generating
  * each correpondence. Applied the same fix in IACUC as well.
  * Tested to make sure closure and renewal reminder correpondence are generated as per batch correspodence configuration.
  * rmancher on Thu, 12 Nov 2015 10:37:42 -0600 [View Commit](../../commit/a5f9d86603ad16fb367c630325752717aab2e370)
* rudimentary schema for crud endpoints using ?schema get
  * blackcathacker on Fri, 13 Nov 2015 13:14:55 -0600 [View Commit](../../commit/b7f5bd00dfd667cbda362efc94d328aeee6070eb)

##coeus-1511.41
* No Changes


##coeus-1511.40
* No Changes


##coeus-1511.39
* No Changes


##coeus-1511.38
* adding default field and pk discovery for rest services
  * Travis Schneeberger on Fri, 13 Nov 2015 17:52:10 -0500 [View Commit](../../commit/92defe2bd53a566f7e8835c6f3f7052bc77dc197)

##coeus-1511.37
* PD: S2S: eRA Commons ID field needs to accommodate other
  * Gov't agency credentials without error.
  * For S2S proposals, users need the ability to enter Agency Credentials
  * for sponsors other than NIH, in the eRA Commons ID field in Key
  * Personnel. Currently, there is a system validation error message if the
  * information entered in eRA Commons ID field is anything less than 6
  * characters (which NIH requires). BUT, other Gov't agency credential
  * information may be less than 6 characters. This field needs to contain a
system warning, rather than an error message, so it may accommodate all
  * Agency Credential information, and not just eRA Commons ID. Without
  * this, S2S submission may not be possible for sponsored proposals other
  * than NIH.
  * Create a proposal with the minimum required fields to save: Add a
  * federal sponsor that is NOT NIH.
  * Key Personnel> Add a person as PI and save
  * Expand to display Details tab
  * Enter the PI's AGENCY CREDENTIAL Id in the "ERA Commons User ID Field"
  * (with less than 6 characters)
  * ON the S2S Opportunity screen, search and add a non-NIH Opportunity 
  * Turn on Validations.
  * Results: The system presents an error noting the 6 character requirement
  * for NIH
  * Desired Results: The system should present a warning only. KRMS Rules
  * can be maintained locally to enforce sponsor specific format
  * requirements.  * vineeth on Fri, 13 Nov 2015 16:55:54 -0500 [View Commit](../../commit/6c462067c072255186318b1cca0c8910be0aafeb)

##coeus-1511.36
* adding servlet mappings for rest endpoints
  * Travis Schneeberger on Fri, 13 Nov 2015 15:25:59 -0500 [View Commit](../../commit/b79955076a7a9e3eb0ff3b11064db806a9ef1139)

##coeus-1511.35
* creating map based generic controller for rest endpoints
  * blackcathacker on Fri, 13 Nov 2015 13:14:55 -0600 [View Commit](../../commit/5d7798efa081ddaadc0b14197a76ed81bd95c0f3)

##coeus-1511.34
* adding more BO rest logic, update/insert logic
  * Travis Schneeberger on Fri, 13 Nov 2015 11:04:01 -0500 [View Commit](../../commit/a4f96778a1376bcadb7273602a5f542777db3195)

##coeus-1511.33
* No Changes


##coeus-1511.32
* No Changes


##coeus-1511.31
* adding more BO rest logic, update/insert logic
  * Travis Schneeberger on Thu, 12 Nov 2015 16:22:29 -0500 [View Commit](../../commit/fdeaa8fe824e74bd2900540955db40d1fd2e3df9)
* update simplecrudrestcontroller to be non-abstract to support eventually spring/auto configuration
  * blackcathacker on Thu, 12 Nov 2015 14:24:37 -0600 [View Commit](../../commit/aba1746a986675c1ede8963cf73a3384a837fea0)

##coeus-1511.30
* adding more BO rest logic, update/insert logic
  * Travis Schneeberger on Thu, 12 Nov 2015 15:42:41 -0500 [View Commit](../../commit/e0fc6c1e332b142a22359706651ae0995612cdcb)

##coeus-1511.29
* adding more BO rest logic, update/insert logic
  * Travis Schneeberger on Thu, 12 Nov 2015 14:27:43 -0500 [View Commit](../../commit/1e7759916dd8f1ad043d58fdb5af371ff0c33b3f)

##coeus-1511.28
* fix error codes for RestController and better error handling when objects don't exist

  * also do validation for foreign key references when attempting a delete
  * blackcathacker on Thu, 12 Nov 2015 10:03:20 -0600 [View Commit](../../commit/b16b85f84d56564c3d88833070159cac9f3cba07)

##coeus-1511.27
* No Changes


##coeus-1511.26
* No Changes


##coeus-1511.25
* adding more BO rest logic, delete logic
  * Travis Schneeberger on Wed, 11 Nov 2015 17:53:09 -0500 [View Commit](../../commit/5f3fa3408444a5dbae12b8c93dd1b94ad4e46e74)

##coeus-1511.24
* adding more BO rest logic
  * Travis Schneeberger on Wed, 11 Nov 2015 12:36:28 -0500 [View Commit](../../commit/63a91b601e1c624bdb8d9b1ddf4e664c3d7247ca)
* Rest Endpoint for Budget Category Type as sample service for csv upload
  * blackcathacker on Tue, 10 Nov 2015 16:55:24 -0600 [View Commit](../../commit/3d1795c198545a49200cd1e8ea95d55e2b77a8ff)

##coeus-1511.23
* No Changes


##coeus-1511.22
*  NumberFormatException
  * curl --user coeus-kualico:password https://res-demo1.kuali.co/kc-dev/award/api/v1/accounts/awards/16586noah
  * curl --user coeus-kualico:password https://res-demo1.kuali.co/kc-dev/award/api/v1/accounts/awards/16586noah
  * this gives a number format exception
  * Gayathri Athreya on Mon, 9 Nov 2015 16:26:46 -0600 [View Commit](../../commit/7def55f9519c1163476cf541d4fdb83ad14aea16)

##coeus-1511.21
*  Fixing null pointer
  * curl --user coeus-kualico:password https://res-demo1.kuali.co/kc-dev/award/api/v1/accounts/awards/3342
  * curl --user coeus-kualico:password https://res-demo1.kuali.co/kc-dev/award/api/v1/accounts/awards/3342
  * results in
        org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106)
  * </pre></p><p><b>root cause</b> <pre>java.lang.NullPointerException
        java.util.Optional.orElseGet(Optional.java:267)
        org.kuali.kra.award.home.Award.getCurrentFandaRate(Award.java:2508)
        org.kuali.coeus.award.finance.impl.AccountServiceImpl.createAccountInformation(AccountServiceImpl.java:61)
        org.kuali.coeus.award.finance.AwardAccountController.getAccountInformation(AwardAccountController.java:97)
  * Gayathri Athreya on Mon, 9 Nov 2015 15:40:45 -0600 [View Commit](../../commit/3aa447bfd7aa0ccc10583201f7fbb5e7611722ec)
*  Fixing validation.
  * When hitting REST endpoint with integerrs greater than db length, fails with db error.
  * Gayathri Athreya on Mon, 9 Nov 2015 14:56:10 -0600 [View Commit](../../commit/3207a09b5306828a7b5447fcc26d9a25dc5a28bd)

##coeus-1511.19
* No Changes


##coeus-1511.18
* Update award account apis to match url standards
  * blackcathacker on Sun, 8 Nov 2015 17:15:33 -0600 [View Commit](../../commit/95ce9fee9c9d768a75d11f3f247962ab633e6a35)

##coeus-1511.17
* No Changes


##coeus-1511.16
* Updating existing apis to match current Kuali standards
  * blackcathacker on Fri, 6 Nov 2015 14:48:09 -0800 [View Commit](../../commit/64c2a22a21e4553300f9d23b21a049b44abcbd08)

##coeus-1511.15
* fixing other BO names in jsp/tag files
  * Travis Schneeberger on Fri, 6 Nov 2015 17:26:42 -0500 [View Commit](../../commit/b9cb3425ae6278c1b3f9aec355b36253953e9394)
* fixing unit and sponsor lookups for several kew documents
  * Travis Schneeberger on Fri, 6 Nov 2015 15:56:45 -0500 [View Commit](../../commit/c793bd1b00f0f6b1ec3439afc4632e4f456a006b)

##coeus-1511.14
* No Changes


##coeus-1511.13
* No Changes


##coeus-1511.12
*  Changing logic since it was wrong.
  * Gayathri Athreya on Fri, 6 Nov 2015 12:00:06 -0700 [View Commit](../../commit/2fb16d6970ddaf8040d18f5b8d778ae1ebfd6aa0)
* Budget Rates - Use fontawesome from cdn and slight style changes

  * Include link to new URL on maintenance page
  * blackcathacker on Thu, 5 Nov 2015 16:24:56 -0800 [View Commit](../../commit/5de02a7cb7c1da42ae724ddde6b0de8161061803)

##coeus-1511.11
*  update award summary api to match standards
  * blackcathacker on Thu, 5 Nov 2015 13:56:00 -0800 [View Commit](../../commit/21d2956709bcba4d8be11374608c9f865c073e5d)

##coeus-1511.10
* No Changes


##coeus-1511.9
* No Changes


##coeus-1511.8
*  fixing integration test
  * Travis Schneeberger on Wed, 4 Nov 2015 18:20:24 -0500 [View Commit](../../commit/1be364e45b28ff1fcd77c772df116a762f682f24)
*  Fix issues with cancelled awards
  * Gayathri Athreya on Wed, 4 Nov 2015 14:36:29 -0700 [View Commit](../../commit/f24b0e9c32a3c407ee0a35d06e86c2c5300d65f8)
*  Fixing propsal types for s2s namespace with the proposal types defined in the bootstrap data. Since these params need to be more user friendly to map different proposal types to one s2s proposal type, changed the @PARAM defnitions and used individual values or comma separated ones for S2S namespace
  * Geo Thomas on Tue, 3 Nov 2015 16:24:59 -0500 [View Commit](../../commit/3b57984a610dc1475bfbd87fc346315bbb081673)
*  (User Story) As an IRB/IACUC Admin, I can configure the watermark for protocol attachments to include key data about the protocol so that it is clearly displayed on protocol attachments.

  * Acceptance Criteria:
  * Given an IRB Admin is maintaining watermarks for IRB protocol attachments, when they edit or add a watermark, then they can optionally include these data elements to the watermark:
  * Initial Protocol Approval Date
  * Last Protocol Approval Date
  * Expiration Date
  * Text up to 200 characters.
  * And when the watermark maintenance document is approved, then when PDF protocol attachments are printed these data correctly display based on the maintenance set up, along with the status watermark on the PDF:
  * And Dates will use the same date formats as in the UI
  * Given an IACUC Admin is maintaining watermarks for IACUC protocol attachments, when they edit or add a watermark, then they can optionally include these data elements to the watermark:
  * Initial Protocol Approval Date
  * Last Protocol Approval Date
  * Expiration Date
  * Text up to 200 characters.
  * And when the watermark maintenance document is approved, then when PDF protocol attachments are printed these data correctly display based on the maintenance set up, along with the status watermark on the PDF:
  * And Dates will use the same date formats as in the UI

  * The above requirements are already supported through property replacement however the watermark length must be increased.  Also, watermarks should be able to use a smaller font.
  * Travis Schneeberger on Tue, 3 Nov 2015 16:41:40 -0500 [View Commit](../../commit/740f11c8948039f952bb861fb52c64e6021e54a9)

##coeus-1511.7
* No Changes


##coeus-1511.6
* Fixing STE with Additional Budget Persons with RR Budget

  * When a proposal budget has more than 8 personnel across multiple periods, printing the S2S Form RR_Budget_1_3 requires generating of system narrative attachments. This fixes an exception that is generated due to incorrectly persisting of these attachments. Additional information on issue

  * Attempted printing this budget form to confirm if the Additional Key Persons attachment included the correct "Project Role" title from the Key Person screen from a customer reported issue.
  * I added >8 Senior persons to my budget and then the Key Person that was in budget category Senior Personnel to duplicate the issue.
  * Instead, I got an STE - see below.
  * Tested in Res-test1 for S2S connection, used PA-C-R01 opportunity for the form.
  * org.springframework.orm.jpa.JpaSystemException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'UPLOAD_TIMESTAMP' cannot be null Error Code: 1048 Call: UPDATE NARRATIVE_ATTACHMENT SET FILE_DATA_ID = ?, FILE_NAME = ?, OBJ_ID = ?, UPDATE_TIMESTAMP = ?, UPDATE_USER = ?, UPLOAD_TIMESTAMP = ?, UPLOAD_USER = ?, VER_NBR = ? WHERE ((PROPOSAL_NUMBER = ?) AND (MODULE_NUMBER = ?)) bind => [10 parameters bound] Query: UpdateObjectQuery(org.kuali.coeus.propdev.impl.attachment.NarrativeAttachment@3b118e62[serialVersionUID=4673438132556125127,name=73922_EXTRA_KEYPERSONS.pdf,type=application/octet-stream,fileDataId=35136425-3009-44d8-9595-72f89e156662,uploadUser=
  * blackcathacker on Tue, 3 Nov 2015 12:09:27 -0800 [View Commit](../../commit/8f1bf9de7b848d8d4d30f24f0b1cac423114c317)

##coeus-1511.5
*  Filter persons who do not need certs.
  * Currently, when the COI Disclosure Status feature is enabled, _all _key personnel are listed in the Disclosure Status window. This case is to update the COI Disclosure Status window and restrict the listed persons to _only _those key persons that are required to disclose. This update will better convey locally implemented Conflict of Interest compliance policy and procedure as maintained via the COI Hierarchy, the keypersonprojectrole parameter, RESKC-972 which will exempt non-personnel Multiple PI, or the parameter to exempt ALL address book non-personnel, if enabled.
  * Gayathri Athreya on Tue, 3 Nov 2015 09:05:15 -0700 [View Commit](../../commit/9741076ed4c6fc6c2db697727493a361f77400e6)
*  IACUC: Reviewers cannot be assigned if schedule is selected on DMR (Committee Reviewers appear and then disappear)
  * Create IACUC protocol
  * Submit for Review
  * Modify Submission Request:
  * -Use Designated Member Review as the submission review type
  * -Select committee
  * (Notice the reviewers appear as expected)
  * -Select schedule
  * Actual Result: The reviewers disappear for selection even though they are available. See screen shot with schedule selected.
  * Expected: Available Reviewers should be displayed for selection
  * Workaround is to not select a schedule so you can select reviewers, but that doesn't work some some school's processes. See screen shot without schedule selected.
  * Travis Schneeberger on Tue, 3 Nov 2015 10:52:16 -0500 [View Commit](../../commit/29de8afb0abf05ff631ee2b6d623fe5a5c7f3144)
* Notification needed to informDisclosure Required for
  * Contributed COI Disclosure Status feature.
  * Noticed during testing and documentation of the contributed COI
  * Disclosure Status feature in PD.
  * In the MIT environment, when a proposal persons answers the proposal
  * person certification saying 'yes' to at least one of the COI Disclosure
screening questions, a message is presented to the user stating that due
  * to their responses, they are required to submit a full financial
  * disclosure. 
  * As the proposal persons may be answering the external certification via
  * the Action List or the web page link from the email notification, they
  * are not able to see the COI Disclosure Status window in the proposal to
  * know if they are required to submit, or if it is not required.
  * We need a method of informing the proposal persons if they are required
  * to submit a full disclosure. A new Notification that is triggered from
  * the "Y" answers to the screening questions would support the
  * requirement. Send the notification if:
  * the proposal person answers the certification questionnaire in the
  * Action List
  * the proposal person answer the certification in the the web page
  * certification
  * -any users (proxy or proposal person) answers the certification in the
  * proposal.
  * The notification should be similar to the current PD Certification
  * Request Notice (10362) - see example text.
  * Based on your answers to the COI screening questions in the proposal
  * certification questions, you must now complete a full disclosure for
  * this proposal before it can be routed. 
  * Please navigate to the Researcher > Conflict of Interest > My
  * Disclosures menu.
  * Proposal Details as follows:<br/>Document Number:
  * {DOCUMENT_NUMBER}<br/>Proposal Number: <a title="" target="_self"
  * href="{APP_LINK_PREFIX}/kc-pd-krad/proposalDevelopment?methodToCall=viewUtility&viewId=PropDev-CertificationView&docId={DOCUMENT_NUMBER}
  * &userName=
  * {USER_NAME}
  * ">
  * {PROPOSAL_NUMBER}
  * </a> <br/>Proposal Title:
  * {PROPOSAL_TITLE}
  * <br/>Principal Investigator:
  * {PRINCIPAL INVESTIGATOR}
  * <br/>Lead Unit:
  * {LEAD_UNIT}
  * -
  * {LEAD_UNIT_NAME}
  * <br/>Sponsor:
  * {SPONSOR_CODE}
  * -
  * {SPONSOR_NAME}
  * <br/>Dealine Date:
  * {DEADLINE_DATE}
  * vineeth on Tue, 3 Nov 2015 10:34:37 -0500 [View Commit](../../commit/f338dd1158048616f26edbac8d206cfe0e4f3c8c)
* Budget rates feature development of edit mode and styling improvements
  * blackcathacker on Sun, 1 Nov 2015 19:44:25 -0800 [View Commit](../../commit/1471f811d24953ab831cfd6a0df25b59a22c2bf8)
* SpringMVC endpoint for rates SPA and code cleanup
  * blackcathacker on Fri, 30 Oct 2015 17:52:52 -0700 [View Commit](../../commit/9a62212ef6f2b45706ed629801747f56689a3bf7)

##coeus-1511.4
* No Changes


##coeus-1511.3
*  show the data validation message 'Validation errors exist. Please correct these errors prior to submitting to workflow routing.' inside the data validation tab and not at the bottom in the 'Other Errors' section
  * Travis Schneeberger on Mon, 2 Nov 2015 16:58:50 -0500 [View Commit](../../commit/a39cca7979f365d4742a20b75fb937a36180770a)
*  As an award administrator, I need to add Approved Subawards to award documents. Sometimes, multiple unique subawards are issued to the same organization; these could be to support separate investigators, projects, tasks, timeframes, etc. Currently, the system will let me add the organization on the Award tab, but will error on Validation when I try to submit.
  * Steps to duplicate:
  * Open an existing Award document (example: 002692-* in res-test1)
  * Edit
  * expand the Subawards panel
  * Use the lookup tool to locate and add an Organization & return it; enter a dollar amount and click Add.
  * Repeat the process, adding the previous selection a 2nd time.
  * Navigate to Award Actions > Submit.
  * Results: Validation error occurs stating there is a duplicate Organization Name.
  * Desired Results: Reduce the validation to a Warning to alert the user in case this was not the intent, but let the record be submitted with the duplicate/multiple appearances of organizations. There are business requirements to list the same organization multiple times.
  * Travis Schneeberger on Mon, 2 Nov 2015 16:57:31 -0500 [View Commit](../../commit/cbc4d656c317a2d48b6f02ba39fc50ebeceabff4)

##coeus-1511.2
*  As an Award administrator, I can maintain the Federal award identification number (FAIN) and Year, and Federal Award Date in my Awards and Subawards so that I can comply with the OMB's Uniform Grant Guidance.
  * Background:
  * See Uniform Grant Guidance policy statements: https://www.whitehouse.gov/omb/grants_docs/
  * Federal Award Identification Number (FAIN) is unique within the Federal agency, and required for each financial assistance award to assist recipients in correctly reporting subawards. The Federal agency may not - with limited exceptions - modify the FAIN during the life of the award. A unique number assigned to a financial assistance award. Needs to be alphanumberic and should be at least as long as Sponsor Award Number in KC. Agencies use different formats. For example, NIH implements the FAIN by deriving it from the core elements of the grant number. For example, the FAIN for 1R0lGM654321-01 would be R01GM654321.
  * Year is YYYY.
  * Federal Award Date means the date when the Federal award is signed by the authorized official of the Federal awarding. Format is month, day, and year.
  * Subcommittee Requirements confirmed 9/16/2015
  * Award Document Changes
  * 1. Award Document: New FAIN ID field on the Award tab, Sponsor panel – varchar, length 32
  * 2. Award Document: New Federal Award Year field on Award tab, Sponsor panel – YYYY
  * 3. Award Document: New Federal Award Date field on Award tab, Details & Dates panel, Time & Money subpanel along with other date fields and same format.
  * Subaward Document Changes
  * 4. Subaward Document: New Federal Award Project Description field – Subaward tab, Subaward panel, between the Title and Comments fields.
  * 5. Subaward Document: New F&A Rate field on the Subaward tab, Subaward panel – XX.XX% format
  * 6. Subaward Document: New de Minimus radio button or Y/N field added beside the F&A Rate field.
  * 7. Subaward Document: Create a display panel on the Subaward Tab, Funding Source panel to display the FAIN, the Federal Award Date, Obligated Total Award Amount, Sponsor and Prime Sponsor, CFDA Number, and Activity Type (similar to the information that displays in the Award document when a Funding Proposal is linked).
  * Travis Schneeberger on Sat, 31 Oct 2015 08:21:38 -0400 [View Commit](../../commit/80a9a451cce07d69f2e8832732e34eb843b673e8)

##coeus-1511.1
*  Fixing opp title
  * The xml _header _data being submitted S2S and not part of the form schemas that is causing the problem. So we need to correct why are we putting incorrect information into the Header, and to correctly handle when to populate and NOT populate the SF 424 CFDA Activity Title field.
  * Legacy Coeus also populated both these xml fields with the "OpportunityTitle" data, but trimmed to 119 characters to prevent errors on Submission.
  * Suggested Improvement:
  * KC needs to populate the "ActivityTitle" with the CFDA Description data from the S2S opportunity if available; and ALWAYS trim the length to stay under the 120 character limit.
  * IF the CFDA is blank in the opportunity, this field should remain blank in the SF424 RR forms.
  * Error at Grants.gov for field character length violation on a sponsor supplied field
  * Error Message from Grants.gov for this particular submission:
  * XML validation error: Schema validation error(s): cvc-maxLength-valid: Value 'Novel and Innovative Tools to Facilitate Identification, Tracking, Manipulation, and Analysis of Glycans and their Functions (R21)' with length = '130' is not facet-valid with respect to maxLength '120' for type 'StringMin1Max120Type'.
  * The system xml transmits the package "OpportunityTitle" (appears in the Adobe download) in the CFDA "ActivityTitle" field. (LIMIT = 120 characters)
  * Both of these fields are NOT able to be edited by KC end users.
  * Per the grants.gov header schema for this opportunity (http://apply07.grants.gov/apply/system/schemas/Header-V1.0.xsd), the field with the 120 character max length is the "Activity Title" – this corresponds to the Grants.gov opportunity CFDA Description field. Per the schema, it is NOT a required field (min occurances = 0)
  * Per the NIH Opportunity posted at grants.gov and displayed in the KC PD Opprtunity Search > Opportunity tab, the "Opportunity Title" field is the one that has the entry "Novel and Innovative Tools to Facilitate Identification, Tracking, Manipulation, and Analysis of Glycans and their Functions (R21)". The Opportunity Title field allows 255 characters per the Grants.gov header schema.
  * Gayathri Athreya on Fri, 30 Oct 2015 13:54:54 -0700 [View Commit](../../commit/266dddd065d7a435e06485ef455a28fb6b66faf6)

##coeus-1510.64
* No Changes


##coeus-1510.63
*  sorting protocol submissions by submission type and protocol Id so they will display sorted under each review type in the printed committee agenda.
  * Travis Schneeberger on Thu, 29 Oct 2015 16:55:48 -0400 [View Commit](../../commit/bc7163b89dec71c65a14274737e3004d423628aa)
*  code cleanup
  * Travis Schneeberger on Thu, 29 Oct 2015 16:24:23 -0400 [View Commit](../../commit/f0259062e012fd3ddd5ee9f999c39e26aae56f72)

##coeus-1510.62
* No Changes


##coeus-1510.61
* Resolving issue with editing undefined/adding rates
  * blackcathacker on Thu, 29 Oct 2015 16:34:19 -0700 [View Commit](../../commit/eb04b1ecc639dfdb78ad6f6758defa1d8f5a7f4d)

##coeus-1510.60
* Budget Institute Rates new interface first commit
  * blackcathacker on Thu, 4 Jun 2015 08:58:22 -0700 [View Commit](../../commit/fd5b1c307b731907297a8f2297162c0e5fdd02db)

##coeus-1510.58
* Missing PD Notification specific for Contributed COI
  * Disclosure Status feature.
  * Noticed during testing and documentation of the RESKC-504 contributed
  * feature for COI Disclosure Status in PD.
  * The MIT instance has a Development Proposal Notification specific to the
sponsors identified in the Hierarchy > COI Disclosures with KP Req.
  * Notification ID 10367
  * Action Code 107
  * The separate notification allows for specific instructions related to
  * certifying and potential COI disclosure actions. This leaves the OOTB
  * notification to certify to be used for sponsors not maintained in this
  * custom hierarchy and for implementations not using this feature.
  * Please incorporate this notification from the MIT code as soon as
  * possible so I can fully test and document this aspect.
  * Currently, the system is still utilizing the OOTB proposal certify
  * notification.
  * vineeth on Wed, 28 Oct 2015 11:43:08 -0400 [View Commit](../../commit/e7b1e6b5ec3933fe3daaec409e826eb93f89a46a)

##coeus-1510.57
*  Adding COI links
  * If instance is set to use new COI, display links to COI in monolith portal as:
  * Researcher:
  * -COI Dashboard
  * Unit/Central Admin:
  * -COI Adminstrator Dashboard
  * -COI Configuration
  * Gayathri Athreya on Wed, 28 Oct 2015 16:28:23 -0700 [View Commit](../../commit/6a2eb5aeb6bdd8c3342c0d2c5a5244949dc6a893)

##coeus-1510.56
* No Changes


##coeus-1510.55
*  pushing COI project data for generated IP documents.  Also, fixing a NullPointerException when generating an IP and the subcontracts flag is false on the proposal development document.
  * Travis Schneeberger on Mon, 26 Oct 2015 10:41:54 -0400 [View Commit](../../commit/7b242ae66e1288478444b6f39a3e90afb051549f)
* Provide config param for graceful switching of api security

  * When auth.core.enabled is set to true spring security will be disabled for the 3 contexts with current rest apis. This will assume that the auth filter will handle all authentication for rest apis.

  * Also additional code review comments responsded too.
  * blackcathacker on Wed, 28 Oct 2015 12:28:10 -0700 [View Commit](../../commit/5d22ca1a70684c60dc37e50b2ddd0eea45c0c070)
* Split out api and web auth filters as at least partial CSRF protection
  * blackcathacker on Mon, 26 Oct 2015 14:02:44 -0700 [View Commit](../../commit/e3d63f0acd9038004835ceb2283ed53e99fc4082)

##coeus-1510.54
*  Fixing custom data migration
  * Search for a migrated institutional proposal.
  * Open the proposal.
  * Click Edit
  * Receive error message stating "Other errors: The Value (Value) may only consist of visible characters, spaces, or tabs."
  * Gayathri Athreya on Tue, 27 Oct 2015 15:49:36 -0700 [View Commit](../../commit/43859b403ef11d70aa7c8f82ab3c4a56bbfd09a5)

##coeus-1510.53
*  Cannot edit IP or subaward.
  * 1. edit an Institutional Proposal document to create a new version.
  * 2. save the version.
  * 3. close the document without submitting.
  * 4. search for the Institutional Proposal using the IP lookup on the Central Admin tab.
  * 5. open and click edit. receive a message that a pending version exists.
  * 6. Click Yes to edit the pending version.
  * 7. User is returned to the Institutional Proposal in a non-editable state.
  * Gayathri Athreya on Tue, 27 Oct 2015 12:36:41 -0700 [View Commit](../../commit/9256584d34c9337a5af003b0604d0ce728bf946b)

##coeus-1510.52
*  Fix budget inflation flag.
  * If the user includes inflation for a non-personnel item, when the periods are generated inflation is not applied, if user tries to check inflation box and apply to other periods, amounts do not update and the apply inflation for future periods is not checked
  * As an alternate, tried checking the apply inflation and saving in the period. open the expense again and it is still not checked.
steps to reproduce
  * create proposal with multiple years
  * create budget
  * add non personnel item with amount
  * generate all periods
  * look at non-personnel item details - the inflation is not checked; inflation does not occur in out years
  * inflation cannot be checked an applied to period or future period in any non-personnel expense
  * RH note:
  * Issue seems to be problematic with cost elements that are no-inflation by default (like Equipment). Even adding the line item, opening Details checking the Inflate box and Saving. Then reopening Details - the inflate box is unchecked again. Check and save & apply to later periods does not apply inflation to the later periods.
  * The reverse: uncheck inflation on a cost object where inflation is by default IS working.
  * Gayathri Athreya on Fri, 23 Oct 2015 15:18:29 -0700 [View Commit](../../commit/88ae0f1557f5af0a27847cd06861a6513688ca65)

##coeus-1510.51
*  fix a broken test
  * Travis Schneeberger on Mon, 26 Oct 2015 16:32:54 -0400 [View Commit](../../commit/fab68b7abc03779f2c32d95372131f18fd5791df)
*  Adding Derived role for Award PI and plugged this role into Report Tracking Notifications Type
  * Geo Thomas on Thu, 22 Oct 2015 16:39:46 -0400 [View Commit](../../commit/72993461481409f88ccc87b33afe6a2bd52a20de)
*  adding a configuration for the system to system auth token
  * Travis Schneeberger on Mon, 26 Oct 2015 14:16:54 -0400 [View Commit](../../commit/fb198add95928fcd75f3218937016b44ed885d3c)
*  time and money documents are not properly getting their doc status column set during the tmdocstatus conversion.  This is due to a treating a character column as numeric.
  * Travis Schneeberger on Mon, 26 Oct 2015 12:12:36 -0400 [View Commit](../../commit/db0b37dbb1c3c24ffd8647377db8beee603a9904)
*  code cleanup
  * Travis Schneeberger on Fri, 23 Oct 2015 18:11:05 -0400 [View Commit](../../commit/fb5ffb23210f039fcdc80d5f658344ed44eb3e9d)
*  On committee, when deleting a member role, a member expertise or the entire member the deleted element successfully deletes on save.  Then when the committee document is submitted or blanket approved the previously deleted element is no longer deleted.  The expected result is any deleted element will stay deleted after document submission.
  * Travis Schneeberger on Fri, 23 Oct 2015 18:08:54 -0400 [View Commit](../../commit/ab3c76417d89eb1acd9ba7aefed468c6fd811f1c)
* Viewing PD causes whitescreen when no keywords defined

  * When viewing a PD in readonly mode(from the PD lookup or after enroute/final) and keywords are enabled and there are no keywords defined in the system a stacktrace is generated in the logs and only a whitescreen is displayed to the user. This fixes that and the read-only display of the keywords which was previously broken as well. The following is a snippet from the stack trace

  * For "${...}" content: Expected a string or something automatically convertible to string (number, date or boolean), but this evaluated to a sequence (wrapper: f.t.SimpleSequence):
  * ==> (spring.status.value?default(""))  [in template "krad/WEB-INF/ftl/components/field/dataInputField.ftl" at line 64, column 27]
  * ...
  * freemarker.core.NonStringException: [... Exception message was already printed; see it above ...]
  * blackcathacker on Fri, 23 Oct 2015 11:58:46 -0700 [View Commit](../../commit/30bd9958a1a41f3e530503e08afb280973624e89)
* On committee, when deleting a role from a member the role successfully deletes on save.  Then when the committee document is submitted or blanket approved the previously deleted role is no longer deleted.  The expected result is any deleted roles will stay deleted after document submission.
  * Travis Schneeberger on Fri, 23 Oct 2015 12:27:12 -0400 [View Commit](../../commit/0d104187f666b6999edc94d3b3db003f0e0c1b73)
*  Making lead unit field bigger.
  * After upgrading to 1508.3 repo version we are finding that PD copy proposal has a strange "Lead Unit" selection box. it only fits one unit at a time so it is very difficult to use.
steps to reproduce
  * log in as a user with create access in many units, such as quickstart
  * either find an existing proposal or create a proposal by completing proposal basics
  * Use the copy button in top header
  * in the modal see the lead unit field
  * The selection box is so small that even the arrows are difficult to use
  * Gayathri Athreya on Thu, 22 Oct 2015 22:32:01 -0700 [View Commit](../../commit/7a8a20a8ab3ad030f4435d837b241093241891bf)

##coeus-1510.50
* MIT - IRB - Unable to View Approval Letter when taking the
  * Expedited Approval action.
  * IRB Admins are unable to view and print their approval letters when
  * performing their expedited approval action.The button to view the letter
  * from the correspondence tab that shows when the approval action is
  * performed, gives error below.
  * Steps:
  * Create protocol
  * Submit for review as expedited
  * Perform expedited approval 
  * The correspondence tab appears with the "show" button
  * click Show
  * click view on the expedited approval letter
  * HTTP status 500 error shows up.
  * Example: protocol 1505696609 in QA-Wkly. 
  * Note that the letter can be viewed later using the Protocol
  * Actions>History panel
  * HTTP Status 500 - Cannot verify that the methodToCall should be
  * methodToCall.viewCorrespondence.line696626.anchor.y
  * type Exception report
  * message Cannot verify that the methodToCall should be
  * methodToCall.viewCorrespondence.line696626.anchor.y
  * description The server encountered an internal error that prevented it
  * from fulfilling this request.
  * exception
  * java.lang.RuntimeException: Cannot verify that the methodToCall should
  * be methodToCall.viewCorrespondence.line696626.anchor.y
  * org.kuali.rice.kns.util.WebUtils.getMethodToCallSettingAttribute(WebUtils.java:205)
  * org.kuali.rice.kns.util.WebUtils.parseMethodToCall(WebUtils.java:155)
  * org.kuali.rice.kns.web.struts.form.KualiForm.populate(KualiForm.java:120)
  * org.kuali.rice.kns.web.struts.form.KualiDocumentFormBase.populate(KualiDocumentFormBase.java:186)
  * org.kuali.rice.kns.web.struts.form.KualiTransactionalDocumentFormBase.populate(KualiTransactionalDocumentFormBase.java:65)
  * org.kuali.coeus.sys.framework.model.KcTransactionalDocumentFormBase.populate(KcTransactionalDocumentFormBase.java:80)
  * org.kuali.kra.irb.ProtocolForm.populate(ProtocolForm.java:162)
  * org.kuali.rice.kns.web.struts.action.KualiRequestProcessor.processPopulate(KualiRequestProcessor.java:307)
  * org.kuali.coeus.sys.framework.controller.interceptor.KcRequestProcessor.processPopulate(KcRequestProcessor.java:86)
  * org.kuali.rice.kns.web.struts.action.KualiRequestProcessor.processFormActionAndForward(KualiRequestProcessor.java:228)
  * org.kuali.rice.kns.web.struts.action.KualiRequestProcessor.strutsProcess(KualiRequestProcessor.java:222)
  * org.kuali.rice.kns.web.struts.action.KualiRequestProcessor.process(KualiRequestProcessor.java:101)
  * org.apache.struts.action.ActionServlet.process(ActionServlet.java:1913)
  * org.kuali.rice.kns.web.struts.action.KualiActionServlet.process(KualiActionServlet.java:202)
  * org.apache.struts.action.ActionServlet.doPost(ActionServlet.java:462)
  * javax.servlet.http.HttpServlet.service(HttpServlet.java:647)
  * javax.servlet.http.HttpServlet.service(HttpServlet.java:728)  * vineeth on Fri, 23 Oct 2015 11:14:10 -0400 [View Commit](../../commit/c65c0202b32d0fe5788833f54fee3fabae23f25a)

##coeus-1510.49
*  supporting multiple project sponsors
  * Travis Schneeberger on Thu, 22 Oct 2015 19:12:48 -0400 [View Commit](../../commit/c0b4c4fc916ba11fe5731478159b4d3bd5832b86)

##coeus-1510.48
* Protocol Review comments entered at time of approval not persisting while generating correspondence and not appearing on letters
  * Fix is to persist review comments prior to performing protocol actions/generating correspondence so that those comments are
  * available in correspondence.
  * rmancher on Thu, 22 Oct 2015 16:11:53 -0400 [View Commit](../../commit/94b0cb54b1954bd17c6c108a58102de8f31387f7)

##coeus-1510.47
* Initialize allFundingProposal collection to avoid NPE when none exist

  * On navigating to the institutional proposal actions tab the page would not complete loading and the following stack trace could be found in the logs
  * java.lang.NullPointerException
        at org.kuali.kra.institutionalproposal.home.InstitutionalProposal.getAwardFundingProposalsExist(InstitutionalProposal.java:941)
  * blackcathacker on Thu, 22 Oct 2015 13:14:48 -0700 [View Commit](../../commit/f66f3a61e4ec1b81ebf35f47a5d1a7b58b124ead)

##coeus-1510.46
* No Changes


##coeus-1510.45
*  setting a compatible xstream for the batch correspondence print for irb and iacuc.  This avoids a blank pdf file that is generated when printing protocol expiration from committee actions.
  * Travis Schneeberger on Wed, 21 Oct 2015 18:00:39 -0400 [View Commit](../../commit/295a3a9810808eba2337809851557b5a7e220984)
*  avoid NPE when ProtocolPerson is a non-employee
  * Travis Schneeberger on Wed, 21 Oct 2015 14:41:34 -0400 [View Commit](../../commit/bc0f124aed907ac99fe7efb2844b5de70b84b2b7)
*  undo last action throws an exception when the last action is a batch correspondence generation
  * Travis Schneeberger on Wed, 21 Oct 2015 14:06:32 -0400 [View Commit](../../commit/133c9c875efd0dba91fc6970bc837eed6d68b158)

##coeus-1510.44
* No Changes


##coeus-1510.43
* fix schemaspy and melody authentication

  * Schemaspy and Java Melody servlets weren't mapped to the Bootstrap Login filter which actually sets the remote user and redirects for authentication. This applies that filter and avoids the no remote user error that occurs in some cases as well.
  * blackcathacker on Wed, 21 Oct 2015 10:55:25 -0700 [View Commit](../../commit/937ddca6c6a374a8f752cf3a772e74878b8640c1)
* avoid number format exception when the sponsor template is non-numeric
  * Travis Schneeberger on Wed, 21 Oct 2015 09:58:13 -0400 [View Commit](../../commit/d0a64763f1ade0cec5519dc838944fce35603974)

##coeus-1510.42
* No Changes


##coeus-1510.41
* No Changes


##coeus-1510.40
* update to script to handle foreign keys
  * blackcathacker on Tue, 20 Oct 2015 18:49:47 -0700 [View Commit](../../commit/0cd0c14a30b4f8e585ed19b315663244f59c04ed)

##coeus-1510.39
* No Changes


##coeus-1510.38
* Ignore test and update email validation default
  * blackcathacker on Tue, 20 Oct 2015 16:43:36 -0700 [View Commit](../../commit/194ab4989c7ff8dcb353b218c0063fa7552aa646)
* chaning kc-sql pom version and adding headers to sql scripts
  * Geo Thomas on Tue, 20 Oct 2015 19:30:09 -0400 [View Commit](../../commit/95b0ef3a750d13efc188f70786679eee63a868df)
*  since there was a conflict between hosted customers proposal types and bootstrap proposal types, new proposal types have changed to start from 500 onwards.
  * Geo Thomas on Tue, 20 Oct 2015 16:34:49 -0400 [View Commit](../../commit/bd08cf1687c2e39dd7ddfce07b5e592550b8becb)
*  fixing oracle and mysql SQL migrations for a rice embedded configuration as contributed by: https://github.com/kuali/kc/pull/1590
  * Travis Schneeberger on Tue, 20 Oct 2015 16:38:32 -0400 [View Commit](../../commit/75c36bd31f317fc9fd17cf5ae51c27da55dfed27)
* MIT IRB - Full Board Protocols not Assigned to Agenda should
  * not display in the Minutes PDF.
  * MIT:
  * when you have a protocol and submit it to a schedule, that protocol
shows up in the minutes even when it is not assigned to the agenda. 
  * Full review protocols not assigned to the agenda should not show up in
  * the minutes. 
  * Exempt and Expedited protocols assigned to a schedule should show in the
  * minutes
  * Happens consistently. Here is one example: 
  * There is a protocol 1403006261A001 that shows up in the minutes, even
  * though it is only "Submitted to committee" not "In agenda". 
  * The protocol was submitted to the 5/21/15 schedule but never put "in
  * agenda", nevertheless, it shows in the minutes, it should not.
  * vineeth on Tue, 20 Oct 2015 12:59:43 -0400 [View Commit](../../commit/4ddd5eaf997bbd1e427c58c5745aa32d6df46ca2)
* Use configurable password for dev password during push
  * blackcathacker on Tue, 20 Oct 2015 12:36:11 -0700 [View Commit](../../commit/61b461aebc780305c7feaba366d4d191a1902b86)
* Bulk push from KC to Core Auth Service
  * blackcathacker on Tue, 13 Oct 2015 18:45:45 -0700 [View Commit](../../commit/c2102841453fc893fbf45aad723d214fb610b0ca)

##coeus-1510.36
* No Changes


##coeus-1510.35
* MIT- PD - Notify individual key personnel function not
  * consistent with Notify All window options.
  * I suspect MIT's instance is experiencing a COLLISION with RESKC-542 that
  * restored the individual notify all feature that their contributed COI
  * Disclosure feature broke. 
  * This is working in Kuali 1509.64 09-29-2015 14:43
  * In kc1509.57 created pd 29247 with required fields to save
  * added an Employee PI
  * Added a non-employee Co-Investigator, 
  * I am now able to notify via button in individual's name header on the
screen
  * BUT am not *able to notify this person via the *Notify All window. 
  * These notify functions should be the same in both places and should
  * follow COI disclosure hierarchy requirements.
  * vineeth on Fri, 16 Oct 2015 19:25:01 -0400 [View Commit](../../commit/d9f81a4235be00af043fe3db2d607a3c63fec478)

##coeus-1510.34
*  Implement some kind of cahcing for Units list and gets refreshed every minute. The pefromance issue was to fetch the entire unit list for all Agendas. With this fix, it would not call  getUnits() method if the request gets completed within a min
  * Geo Thomas on Thu, 15 Oct 2015 17:50:16 -0400 [View Commit](../../commit/69f121f5ba46c5e2c8b568c1ee90f716b0e7cf8f)

##coeus-1510.33
*  adding admin auth token
  * Travis Schneeberger on Mon, 19 Oct 2015 11:44:04 -0400 [View Commit](../../commit/1234699de5a4100594bc2ce601da044374cd5e07)
*  adding qualifier so the Derived User Role will resolve its members
  * Travis Schneeberger on Mon, 19 Oct 2015 10:13:43 -0400 [View Commit](../../commit/4638abe46fc812a242ac7c07271b8222cc54c4e8)
*  Use a parameter called enableIPGenerationPromptDialog for enabling/disabling IP generation dialog. This is an MIT customization done as part of newly added proposal types to decide whether IP has to be created as a new version of existing one or entirely new IP. It checks for all changed corrected proposal types and if its one of them, it would generate a new version of existing IP or else, it generates new IP. It never prompted user to select an option for IP generation
  * Geo Thomas on Wed, 14 Oct 2015 16:47:06 -0400 [View Commit](../../commit/d2b6b54d461939cb4798e401bccfc0517ad43f2e)

##coeus-1510.32
* Auth service improvements to support more config options
  * blackcathacker on Fri, 16 Oct 2015 14:03:11 -0700 [View Commit](../../commit/58a271ff1ba10fe42698f875a20ff99847a21230)

##coeus-1510.31
*  implementing kim api from the monolith for use in COI
  * Travis Schneeberger on Fri, 16 Oct 2015 15:44:22 -0400 [View Commit](../../commit/e35ba626e1f3347d1e3ace61e82226d3b87e1514)

##coeus-1510.30
* MIT PD: STE at navigate to Summary/Submit screen after using
  * Notify on Key Personnel screen.
  * In MIT's QA instance, users cannot consistently navigate to the
  * Summary/Submit screen.
  * I can consistently trigger the STE occurs by using the individual Notify
  * option on the Key Personnel screen and then try to navigate to
summary/submit. It will also STE if I navigate to other screens and so
something & save...If I used Notify at all in the session, I get the STE
  * at navigate to Summary/Submit.
  * I did not get the STE if I used the Notify ALL option.
  * If I don't notify, I can successfully navigate to the summary/submit
screen.
  * Retested by Rhanlon in MITQA 1509.57 on 10/15 with proposal 29273
  * In kc1509.57 user kdenutte 
  * Create a proposal with the basic requirements to save
  * Key Personnel >
  * Added MIT employee as PI 
  * Added a non-employee Co-I got erroneous COI prompts but saved 
  * Clicked to navigate to Summary/Submit screen 
  * Result: and got the STE below .
  * java.lang.UnsupportedOperationException at
  * java.util.AbstractList.remove(AbstractList.java:161) at
  * java.util.AbstractList$Itr.remove(AbstractList.java:374) at
  * java.util.AbstractList.removeRange(AbstractList.java:571) at
  * java.util.AbstractList.clear(AbstractList.java:234) at
  * org.kuali.coeus.common.notification.impl.NotificationHelper.initializeDefaultValues(NotificationHelper.java:155)
  * at
  * org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.prepareSummaryPage(ProposalDevelopmentViewHelperServiceImpl.java:796)
  * at
  * org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.navigateToSubmit(ProposalDevelopmentSubmitController.java:278)
  * at
  * org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController$$FastClassBySpringCGLIB$$aff09485.invoke(<generated>)
  * at
  * org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)
  * at
  * org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:700)
  * at
  * org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:150)
  * at
  * org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:96)
  * at
  * org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:260) 
  * vineeth on Thu, 15 Oct 2015 17:37:22 -0400 [View Commit](../../commit/ce5f3222149e2a233658bd4c572bad1e45cebe62)

##coeus-1510.28
* No Changes


##coeus-1510.27
* Handle null sortid on budget_category_type compare

  * Budget Category Types allow null sort ids, but the compareTo method would throw an NPE when it encountered one.
  * java.lang.NullPointerException
        at org.kuali.coeus.common.budget.framework.core.category.BudgetCategoryType.compareTo(BudgetCategoryType.java:79)
        at org.kuali.coeus.common.budget.framework.core.category.BudgetCategoryType.compareTo(BudgetCategoryType.java:33)
        at java.util.TreeMap.compare(TreeMap.java:1290)
        at java.util.TreeMap.put(TreeMap.java:538)
        at org.kuali.coeus.common.budget.impl.calculator.BudgetCalculationServiceImpl.categorizeObjectCodesByCategory(BudgetCalculationServiceImpl.java:491)
        at org.kuali.coeus.common.budget.impl.calculator.BudgetCalculationServiceImpl.calculateBudgetSummaryTotals(BudgetCalculationServiceImpl.java:512)
        at org.kuali.kra.award.budget.calculator.AwardBudgetCalculationServiceImpl.calculateBudgetSummaryTotals(AwardBudgetCalculationServiceImpl.java:41)
        at org.kuali.kra.award.budget.AwardBudgetServiceImpl.populateBudgetLimitSummary(AwardBudgetServiceImpl.java:882)
        at org.kuali.kra.award.web.struts.action.AwardAction.budgets(AwardAction.java:1035)
  * blackcathacker on Thu, 15 Oct 2015 15:42:19 -0700 [View Commit](../../commit/6bb6983ce2b598aa035ee5e51febe3a5c695b04c)
* MIT- PD - Notify individual key personnel function not
  * consistent with Notify All window options.
  * I suspect MIT's instance is experiencing a COLLISION with RESKC-542 that
  * restored the individual notify all feature that their contributed COI
  * Disclosure feature broke. 
  * This is working in Kuali 1509.64 09-29-2015 14:43
  * In kc1509.57 created pd 29247 with required fields to save
  * added an Employee PI
  * Added a non-employee Co-Investigator, 
  * I am now able to notify via button in individual's name header on the
screen
  * BUT am not *able to notify this person via the *Notify All window. 
  * These notify functions should be the same in both places and should
  * follow COI disclosure hierarchy requirements.
  * MIT- PD - Notify individual key personnel function not
  * consistent with Notify All window options.
  * I suspect MIT's instance is experiencing a COLLISION with RESKC-542 that
  * restored the individual notify all feature that their contributed COI
  * Disclosure feature broke. 
  * This is working in Kuali 1509.64 09-29-2015 14:43
  * In kc1509.57 created pd 29247 with required fields to save
  * added an Employee PI
  * Added a non-employee Co-Investigator, 
  * I am now able to notify via button in individual's name header on the
screen
  * BUT am not *able to notify this person via the *Notify All window. 
  * These notify functions should be the same in both places and should
  * follow COI disclosure hierarchy requirements.
  * MIT- PD - Notify individual key personnel function not
  * consistent with Notify All window options.
  * I suspect MIT's instance is experiencing a COLLISION with RESKC-542 that
  * restored the individual notify all feature that their contributed COI
  * Disclosure feature broke. 
  * This is working in Kuali 1509.64 09-29-2015 14:43
  * In kc1509.57 created pd 29247 with required fields to save
  * added an Employee PI
  * Added a non-employee Co-Investigator, 
  * I am now able to notify via button in individual's name header on the
screen
  * BUT am not *able to notify this person via the *Notify All window. 
  * These notify functions should be the same in both places and should
  * follow COI disclosure hierarchy requirements.  * vineeth on Tue, 13 Oct 2015 17:21:56 -0400 [View Commit](../../commit/d1741e12bc2844f3b284af70140c862b1ebfc2c8)

##coeus-1510.26
* No Changes


##coeus-1510.25
*  fixing bug where we are gather project data by proposal number rather than proposal id for InstitutionalProposal which is causing a NullPointerException on save
  * Travis Schneeberger on Thu, 15 Oct 2015 10:48:59 -0400 [View Commit](../../commit/5ce0af0205d7d260a452046fd6eb7c09839301a0)

##coeus-1510.24
* Improvements to the new auth service filter

  * Should improve the ability to use the auth service token for external REST requests and improve the ease of using micro-services in development by being able to configure a global RestTemplate that ignores ssl validation
  * blackcathacker on Mon, 5 Oct 2015 17:03:32 -0700 [View Commit](../../commit/efccb5b9f9a703948b4539207c2a79f90a4068a0)

##coeus-1510.23
* Date qualify the standard workflow

  * Add create date qualification to the new standard workflow so that the date it is implemented it will only affect new proposals and not existing ones and therefore end up with duplicate workflow requests.
  * blackcathacker on Thu, 8 Oct 2015 13:20:51 -0700 [View Commit](../../commit/a9da4668f3dbce0b049a5901e6b8ad8485dee514)

##coeus-1510.22
*  implementing a full project push for all modules to COI, removing incorrect and not necessary join
  * Travis Schneeberger on Wed, 14 Oct 2015 15:25:50 -0400 [View Commit](../../commit/957aaee7aa5f48e7d12a2dbe211b965e08fb00c6)

##coeus-1510.21
* IRB - Unable to see Deferred Letter in Protocol History for a production protocols - due to versioning
  * This is to fix NPE when protocol is submitted for full board, assigned to agenda and defer action is performed.
  * Correspondence is null in above case.
  * rmancher on Wed, 14 Oct 2015 11:39:07 -0400 [View Commit](../../commit/29ed69db8e95c961a8a921b1bfcc824b5b6361f9)

##coeus-1510.20
* No Changes


##coeus-1510.19
* Existing protocols where user has more than one role in a Protocol cannot be submitted or edited.
  * MIT, and other Coeus schools are experiencing problems with migrated IRB data because Kuali research restricts a Protocol person to only one role.
  * Testing this case, there is no issue with migrated protocols where same user has multiple roles.
  * Currently add personnel does not let user add same person with multiple roles. This is now driven by parameter where
schools can enable duplicate personnel with different roles. Application does not allow multiple investigators.
  * rmancher on Tue, 13 Oct 2015 14:46:48 -0400 [View Commit](../../commit/ca502a8f482278bdbf897288c5485f995d0798b7)

##coeus-1510.18
* No Changes


##coeus-1510.16
*  Adding certification questions to KRMS
  * User needs to make a proposition in KRMS that will allow user to specify if a proposal key person has answered a specific question. The function should allow user to specify results that are = value, != value, =null, =!null
  * This should be set up similar to the current KRMS Category for Questionnaire where the user can specify the Question and the Questionnaire being used; only this function will check the multiple occurrences (for each person listed in a proposal) that happen for a person certification questionnaire.
  * Gayathri Athreya on Tue, 13 Oct 2015 14:48:01 -0700 [View Commit](../../commit/42fbb79fcff991254d58948ac482d52cb6060024)

##coeus-1510.15
*  Fixing address book STE
  * User receives STE when trying to create new address book entry.
  * Steps to recreate:
  * 1. Select the System Admin tab
  * 2. Select Maintenance
  * 3. Select Address Book
  * 4. Click Create New
  * STE displays – see full STE added to comments.
  * Gayathri Athreya on Tue, 13 Oct 2015 13:18:31 -0700 [View Commit](../../commit/55530c28c654476e0b41cea49e037c9cd67b57e0)

##coeus-1510.14
* No Changes


##coeus-1510.13
*  implementing a full project push for all modules to COI
  * Travis Schneeberger on Thu, 8 Oct 2015 13:33:48 -0400 [View Commit](../../commit/5d7fdd98d09cb919d29f79450f6a54ffb6e4da42)

##coeus-1510.12
* No Changes


##coeus-1510.11
* IRB Agenda template missing meeting date in Heading and
  * displays the previous meeting date instead of next meeting date in Next
  * Meeting item.
  * In the out of the box template IRB agenda template:
  * -The date of the meeting should be displayed in the header
  * -The date displayed as the next meeting should be the next scheduled
  * meeting not the previous meeting date:  * vineeth on Wed, 7 Oct 2015 14:42:56 -0400 [View Commit](../../commit/a1002bd42127e40a05d99226715888757f7def8b)

##coeus-1510.10
* No Changes


##coeus-1510.9
* No Changes


##coeus-1510.8
* IRB/IACUC - Sections to amend or edit via admin correction on protocols are not unlocked after amendment is approved.
  * Modules are released once the amendment is approved and final. We need to load the document via document service to
  * get the workflow document to check for document status.
  * rmancher on Tue, 6 Oct 2015 11:53:05 -0400 [View Commit](../../commit/b65427e0376f1b9a07b89f28ec0edc23fea84447)

##coeus-1510.7
* No Changes


##coeus-1510.6
* Change award budget warning message
  * blackcathacker on Tue, 6 Oct 2015 10:43:01 -0700 [View Commit](../../commit/4caf83a5c9c63879b0c579009e28fafbb75b4813)

##coeus-1510.5
* Award budget line items imported with wrong dates

  * PB expenses where end dates are not period end dates shows wrong amounts pulled into AB.
  * When personnel is added to a proposal budget in a way that the end date for personnel expense is not the same as the period end date, it is not converting properly when adding the award budget. The award budget shows those end dates as the period end date and causes an STE when user tries to correct the end dates.
  * blackcathacker on Mon, 5 Oct 2015 16:05:15 -0700 [View Commit](../../commit/88034f0e9a2067624489f8bb15e747ac99826fdd)
* Approval letter not generating correctly for amendments after
  * an SMR or SRR.
  * 1. Create protocol 
  * 2. Submit and Approve 
  * 3. Create Amendment 
  * 4. Submit amendment for full board review 
  * 5. *SMR ​ or SRR the amendment​*
  * 6. Submit amendment​ as Response
  * 8. Approve ​
  * Result: Approval Letter appears to be for the main protocol not the
  * amendment because the system cannot tell it is an amendment after it is
submitted as a response. 
  * Expected: Approval Letter should be for the amendment.
  * We are using SubmissionTypeCode in stylesheet to identify whether the
  * protocol is an amendment 
  * Above scenario will indicate that the submission is "Response to
  * Previous IRB Notification" 
  * See attached schema.
  * We need a way to specify in the stream whether the current protocol
  * approved is an amendment  * vineeth on Mon, 5 Oct 2015 11:33:09 -0400 [View Commit](../../commit/c0945c932959c9ed475fbc46f7e118097929deb5)

##coeus-1510.4
* No Changes


##coeus-1510.3
* IRB - Unable to see Deferred Letter in Protocol History for a production protocols.
  * The deferred letters don't seem to make it to the Protocol History. Action is available but the letter cannot be opened or viewed.
  * The issue here is that the current document is cancelled and a new document is created. Correspondence is tied only to the
  * old version. While analyzing data found that there is a mismatch in protocol sequence number. That is fixed along with this since
  * migration script rely on sequence to fetch the prior correspondece. Also included in this PR migration script for protocol
sequence mismatch and create version for protocol correspondence.
  * rmancher on Wed, 30 Sep 2015 09:37:53 -0400 [View Commit](../../commit/0b872bd470b43e4e0217218c2ceb28a2d13282f8)

##coeus-1510.2
* No Changes


##coeus-1510.1
*  Attempting to fix tim sort issue.
  * User experiences the attached error message on award 337 when attempting to click on any other tab of the award. This error seems to be local only to award 337 and not happening to other awards.
  * Stack trace error displays. See below.
  * java.lang.IllegalArgumentException: Comparison method violates its general contract!
  * at java.util.ComparableTimSort.mergeHi(ComparableTimSort.java:866)
  * at java.util.ComparableTimSort.mergeAt(ComparableTimSort.java:483)
  * at java.util.ComparableTimSort.mergeForceCollapse(ComparableTimSort.java:422)
  * at java.util.ComparableTimSort.sort(ComparableTimSort.java:222)
  * at java.util.Arrays.sort(Arrays.java:1312)
  * at java.util.Arrays.sort(Arrays.java:1506)
  * at java.util.ArrayList.sort(ArrayList.java:1454)
  * at java.util.Collections.sort(Collections.java:141)
  * at org.kuali.kra.award.paymentreports.awardreports.reporting.service.ReportTrackingServiceImpl.getReportTacking(ReportTrackingServiceImpl.java:343)
  * at org.kuali.kra.award.paymentreports.awardreports.reporting.service.ReportTrackingServiceImpl.shouldAlertReportTrackingDetailChange(ReportTrackingServiceImpl.java:405)
  * at org.kuali.kra.award.web.struts.action.AwardHomeAction.save(AwardHomeAction.java:272)
  * Gayathri Athreya on Thu, 1 Oct 2015 15:14:21 -0700 [View Commit](../../commit/4ce4d30f00ee279c1c265e90cd17b01fed79624e)
*  changing s2s version in pom file
  * Geo Thomas on Thu, 1 Oct 2015 18:07:21 -0400 [View Commit](../../commit/37e4d5af94340f2d4b76d806e768a03263b030bb)
*  implementing project push (allowing any role code to be sent)
  * Travis Schneeberger on Thu, 1 Oct 2015 17:10:18 -0400 [View Commit](../../commit/37a96bf1d3d4812deb954842830f68275ddede34)
*  New proposal types have been added to support new submission type settings in RR SF424 Form V2.0. The script also have parameters to define comma separated values for these parameters. If school wants to use different proposal types to set Application Type and Submission Type in RR SF424 forms, they should change these PROPOSAL_TYPE_X_X parameters and set appropriate values
  * Geo Thomas on Wed, 30 Sep 2015 14:09:56 -0400 [View Commit](../../commit/185045b3ccab915c4ebd114bdd787e490849168b)
*  Fixing budget cost share summary print
  * Budget Print Report: "1 Cost Share Summary Report"
  * Issue 1: When more than one person is detailed in a group, only the salary of the first person is published, making the remaining sums on the form incorrect.
  * Issue 2: Due to incorrect LA total, other values on the print out are incorrect
  * – Total Direct Cost incorrect sum
  * – Total Cost incorrect sum
  * See Res Demo 1 proposal # 791 budget version 2 has the grouped salaries.
  * The lead unit is a Lab Allocated unit.
  * The budget is built with with 2 individuals assigned to the default Cost Element/group and 2 individuals assigned to a custom group.
  * LA Rates Maintained for Salaries, M&S
  * Problems:
  * 1.	Personnel Section: Lab Allocation Category
  * •	Allocated Admin Support: Faculty Salaries - Amount is INCORRECT
  * •	Total Lab Allocation: Salaries & Wages - Amount shown in report is INCORRECT due to prior value
  * 2.	Total Salaries & Wages: Amount Shown is INCORRECT due to prior value
  * 3.	TOTAL SALARIES & WAGES & FRINGE BENEFITS is INCORRECT due to prior value
  * 4 Total Direct Cost value is incorrect as it is using the sum of this column
  * 5 Total Cost is incorrect as it is using the sum of this column
  * Gayathri Athreya on Thu, 1 Oct 2015 09:31:34 -0700 [View Commit](../../commit/e1d67a2257b387703080af021c1345544d3c1190)

##coeus-1509.65
*  Rolodex state display issues.
  * Gayathri Athreya on Wed, 30 Sep 2015 11:15:34 -0700 [View Commit](../../commit/eee8cc9d466974b92d4de355771b44b66e4a1901)

##coeus-1509.64
*  Adding support for canadian provinces.
  * Need new field to capture Canadian Providences in both Addressbook and Person Record for Key Personnel use and Records for Subcontracts, these should map to the R&R forms
  * NIH requires the Canadian province code as a separate field
  * NIH began enforcing this recently without announcing
  * Forms:
  * On the SF424 Face Page (RR_SF424_2_0-V2.0 and RR_SF424_1_2-V1.2): Applicant Information (Address book) Person to be Contacted (Person Record), Authorized Representative (Person Record), PD/PI (Person Record) all require a province code for people/subcontracts from Canada (screenshot2)
  * On the RR_KeyPersonExpanded_2_0 and RR_KeyPerson-V1.1: Key Personnel for each personnel profile (Addressbook for non-personnel and Person Record for personnel) listed (screenshot 1)
  * On the PerformanceSite_2_0 and PerformanceSite_1_2-V1.2: Project/ Performance Site (Address book) Locations (screenshot3)
  * Update needs to be available in both 5.2.1 and 6.0
  * Gayathri Athreya on Wed, 23 Sep 2015 15:53:16 -0700 [View Commit](../../commit/503eeeaa3088f9e7914d7f401e044f8f38e8c4dd)

##coeus-1509.63
*  implementing project push
  * Travis Schneeberger on Mon, 28 Sep 2015 11:13:39 -0400 [View Commit](../../commit/f7d169fe3e12b9e6ab2593cbf378608df8dea79e)

##coeus-1509.62
* Cannot submit IRB protocol because of The Reviewer N is not
  * available.
  * Create protocol or use existing one. Test Protocol #: 1509002481
  * Added an attachment (probably not relevant)
  * Submit for Review, as follows in this test:
  * -Initial protocol appl.
  * -Expedited
  * -Committee=KC JF III
  * -No schedules available
  * -Reviewers are Claudia Hovis and N 
  * -Select Claudia as primary and N as secondary
  * -check a checklist item
  * Submit
  * If you don't select N as a reviewer then you only get one error "The
  * Reviewer N is not available"
  * Attempted with several different committees and each time N appears as a
  * reviewer. 
  * vineeth on Mon, 28 Sep 2015 16:24:41 -0400 [View Commit](../../commit/c71f9eb12922869bf032785428087289ab430f7c)

##coeus-1509.61
* No Changes


##coeus-1509.60
* Code review comments
  * blackcathacker on Mon, 28 Sep 2015 10:03:33 -0700 [View Commit](../../commit/ca56985955f262f7c1a0e150a0fa9e0a877ca353)
* Filter capable of integrating into the new Core Auth Service
  * blackcathacker on Thu, 24 Sep 2015 11:33:17 -0700 [View Commit](../../commit/48474ea8f8949282ce653ba732bea078ed8f7a6b)

##coeus-1509.59
* No Changes


##coeus-1509.58
* No Changes


##coeus-1509.57
* PD - Budget Rates screen allows Edits when marked Complete -
  * it should not.
  * budget was marked complete and then edits were made to budget > rates
screen. Rates were applied causing Underrecovery but no errors or
  * warnings presented. 
  * Edits should not be allowed once Budget is marked "Complete" 
  * Recreated in MIT's KC Stage kc1505.70-2015-09-07 22:13 PM. 
  * Confirmed in res-demo 1 - proposal 859 1509.40 09-17-2015 10:16
  * 1. Created proposal & create a detailed budget with a non-personnel line
  * item in each period. 
  * 2. On Non-Personnel Costs screen selected the "Complete Budget" button
  * at bottom of screen and in resultant modal checked box for "Ready to be
submitted to sponsor?" and clicked "OK" 
  * 3. Navigated to Rates screen 
  * RESULT: rates are still editable immediately after marking budget
  * Complete
  * 4. Edit Applicable rates to less than Institute Rates. Save. 
  * 5. Click return to proposal and no errors present. 
  * 6. Navigate to Summary/Submit select Submit for Review and proposal
  * routes.
  * DESIRED RESULTS:
  * Rates screens should be READ ONLY as soon as the budget is marked
  * COMPLETE. No edits should be allowed once a budget is marked complete.
  * NOTE BY RH: When the user opens a budget in 'complete' status, the rates
screen is in view only. The rates remain editable while the user is
still in the budget session after they marked the budget as complete.

  * vineeth on Thu, 24 Sep 2015 18:08:28 -0400 [View Commit](../../commit/300db462a1cfd409bbc93c330786dab22e5a1c99)
* Minor correction to PD workflow KRMS agenda due to mismatched keys
  * blackcathacker on Thu, 24 Sep 2015 14:42:27 -0700 [View Commit](../../commit/bcf7470877d9e899bbc6b5fc3e4b88fe046533a8)

##coeus-1509.56
* No Changes


##coeus-1509.55
* IP cannot remove Award Linking
  * As a user, if i accidentally add an IP as a funding source to award and
save, then I would normally be able to select that award in the IP and
  * unlink the two by choosing unlock. This is no longer available in 6.0
  * and we need it still
steps to reproduce
  * on an existing award, find and add an IP to link as funding source
save the award
  * go to medusa and open the IP
  * edit the IP
  * on award actions open the funded awards to see missing features  * vineeth on Thu, 24 Sep 2015 14:06:41 -0400 [View Commit](../../commit/48c95904e611e57be4501151a7d548e612d87fb2)
* Implement getValuesFromCommaSeparatedParam to return a list of param values in S2SConfigurationServiceImpl and added test cases
  * Geo Thomas on Thu, 17 Sep 2015 14:36:29 -0400 [View Commit](../../commit/1b1b418d2aef589177acbd1c30141166cd32283a)

##coeus-1509.54
* Preventing an error from being thrown when moving the cursor into the sponsor template code field but not typing anything and then moving the cursor away.  Previously an ajax call would occur and return an error 500 because the sponsor template code code was blank.  Now the lookup isn't executed and a blank response is generated.
  * Travis Schneeberger on Wed, 23 Sep 2015 17:53:03 -0400 [View Commit](../../commit/0e6660eeb37d9be22a63fee332270494f6e94bbd)
*  making the placeholder document handling more robust.  Removing the assumption that if a document header is found containing a description "*****PLACEHOLDER*****" then you can retrieve a valid AwardDocument from it.  Also removing the assumption that their will only ever be one Document Header with a description  "*****PLACEHOLDER*****".  These assumptions can create an issue where the root Award Hierarchy record is not being created because the placeholder document is not found.
  * Travis Schneeberger on Wed, 23 Sep 2015 17:44:57 -0400 [View Commit](../../commit/c1a71ab0035ed5a71ac1f59743e6b22f82bdd4d0)

##coeus-1509.53
* Code review changes and additional unit test
  * blackcathacker on Wed, 23 Sep 2015 09:26:35 -0700 [View Commit](../../commit/0eb0c44e0307cad90af7285413d3c8c014bd9446)
*  Move Proposal workflow fully to KRMS

  * In order to support more dynamic routing for PD and without putting the burden of always having to modify KEW files these changes implement our current PD workflow fully in KRMS. This will allow more flexibility in building and modifying workflows to suit various needs across multiple institutions and units within a single institution.
  * blackcathacker on Mon, 21 Sep 2015 11:30:26 -0700 [View Commit](../../commit/8db7be726d83bd775d6e26ad24f368cdaa0dd323)

##coeus-1509.52
* T&M end dates error message cannot be fixed.
  * Award was originally created with a larger budget and multiyear time
  * frame, but at the last minute the sponsor reduced the funding and time
  * to one year. I tried to make adjustments in the amounts, but the T&M
  * document is now locked (I can't open it in edit mode). error message is
  * attached.
steps to reproduce
  * Create an award
start T&M create with anticipated amounts
submit t&M
  * finalize award
  * edit award to shorten period
  * open and edit T&M to deobligate and shorten
  * delete unneeded Direct/ F&A Distribution dates
submit
  * finalized award
  * edit award
  * open T&M with intention to edit amounts again and see onscreen error
  * that cannot be cleared (you need to be able to edit to make the changes
  * that the validation is running against) Plus, the error is appearing
  * because the Direct/F&A Funds Distribution defaulted back to the original
  * date periods even though it doesn't match the project end date.
  * This is problem because there becomes no way to edit this T&M nor any
  * way to start a different t&m
  * Expected Result: The message should not appear because the dates in the
  * Direct/F&A Fund Distribution should have saved to the database.  * vineeth on Tue, 22 Sep 2015 17:15:43 -0400 [View Commit](../../commit/6ac7a349c596e6934217919e97f316e0ef0a2f87)

##coeus-1509.51
*  For oracle implementations, the char(200) length on the budget category type causes issues because oracle pads the category type with 199 spaces, this causes the categories to not match
  * with the code and hence causes printing issues.
  * Gayathri Athreya on Wed, 23 Sep 2015 07:55:10 -0700 [View Commit](../../commit/cb3726e720278704ef97c4816168bd111bcf9d4b)

##coeus-1509.50
*  Obligated Distributable not updating if Award amount lowered.
  * If award ant T&M are created, but then award amount is decreased on award side, a new T&M is submitted to show the new decreased amounts, then the T&M obligated distributable is not updated to show lower amount. This causes problems with the award budget not showing accurate information.
  * Steps to reproduce
  * create an award with 100000 direct budget
  * create and submit the t&m
  * update award to show direct as 75000
  * Note the t&m history shows the obligated cummulative as 75000 but distributable as 100000
  * edit T&M as correction and submit the new 75000 figures
  * look at T&M history panel and see that the obligated distributable amount is still showing as 100000
submit award
  * create a new award budget and notice that the amount available in the obligated change is 100,000 due to the incorrect T&M obligated distributable amount
  * Gayathri Athreya on Tue, 22 Sep 2015 11:45:11 -0700 [View Commit](../../commit/4db80f32a8800e931fc8c7b6feac2430a7358369)

##coeus-1509.49
* No Changes


##coeus-1509.48
* Migration script to create expedited and exempt checklist versions.Protocol checklist was not versioned when an amendment/renewal is merged.There is a java code fix to create versions during merge process and this script is to take care of existing data.
  * rmancher on Tue, 22 Sep 2015 09:28:14 -0400 [View Commit](../../commit/bc71e8b2e150428d925acd8c88558ef653fc5bd4)

##coeus-1509.46
* No Changes


##coeus-1509.45
* fixing line endings
  * Travis Schneeberger on Mon, 21 Sep 2015 20:25:32 -0400 [View Commit](../../commit/b25fcc220780146fee781ab1b6d09af10e3dfb8f)

##coeus-1509.44
* Some Proposal Validations for Attachments have Incorrect fix 
  * path for Grants.gov validation type-issue fixed
  * vineeth on Mon, 21 Sep 2015 12:19:32 -0400 [View Commit](../../commit/43b9a3e4f1148f44d172732a316259cd51472fd4)
* Making active mq data directory configurable through kc config files.  This allows the directory to be set without a environment variable:  org.apache.activemq.default.directory.prefix
  * Travis Schneeberger on Mon, 21 Sep 2015 12:18:20 -0400 [View Commit](../../commit/530bed8bdef8121d8f91e22718b2ea309a9e3cb8)

##coeus-1509.43
* No Changes


##coeus-1509.42
* PD: System should enforce Proposal and Budget Start/End dates
  * match prior to submitting-issue fixed  * vineeth on Fri, 18 Sep 2015 11:22:54 -0400 [View Commit](../../commit/67bdc5b372e0efb052ceaadec83923d586db78f3)

##coeus-1509.41
*  Creating Admin Screen for ActiveMQ messages
  * Travis Schneeberger on Wed, 16 Sep 2015 17:58:45 -0400 [View Commit](../../commit/b79475cc702f145e8409ac12ce1465c56edcbdd0)
* Direct/F&A Funds Distribution not getting deleted from T&M
  * document-issue fixed  * vineeth on Thu, 17 Sep 2015 12:51:28 -0400 [View Commit](../../commit/50d7a21d09d6fe3ef080dab4f56e3d52c7c43754)

##coeus-1509.40
* Move IRB and IACUC Protocol History to a separate tab to address performance issues when opening the history for protocols with many versions/submissions. Moving history to separate tab helps users to take actions on protocol much quicker.
  * rmancher on Tue, 15 Sep 2015 17:23:37 -0400 [View Commit](../../commit/66ea1800b20906fff44da99b63f5ec042eb27ae1)

##coeus-1509.39
* Fix IRB protocol history checklist items. Create version for expedited and exempt checklist items
  * once amendment is approved.
  * rmancher on Wed, 16 Sep 2015 10:06:51 -0400 [View Commit](../../commit/efa6cc173ef6cd1deafb2c44ab028efcf7e199c9)

##coeus-1509.38
* No Changes


##coeus-1509.37
* Budget Line Item Details > On/Off campus flag re-sets to ON
  * with certain actions when it should not-issue fixed  * vineeth on Wed, 16 Sep 2015 11:22:47 -0400 [View Commit](../../commit/030118d513b8d3d8318f92bc40a85441cb5519ae)

##coeus-1509.36
*  adding a merge function
  * Travis Schneeberger on Wed, 16 Sep 2015 15:27:01 -0400 [View Commit](../../commit/258884c1a372f3b8a4b69d2b640332c71701f0a6)
*  Fix STE
  * Gayathri Athreya on Wed, 16 Sep 2015 08:25:10 -0700 [View Commit](../../commit/a72a3bcb3735efbf0c69cf303bca7e4c43a0d4a1)

##coeus-1509.35
* IRB - Admin Correction don't allow to delete personnel issue
  * fixed  * vineeth on Tue, 15 Sep 2015 11:15:00 -0400 [View Commit](../../commit/717b670ac72c8bb85663015af8916c7bbfc10b5b)

##coeus-1509.34
* No Changes


##coeus-1509.33
* PI/Multiple on Institutional Proposal does not carry over
  * -issue fix  * vineeth on Tue, 15 Sep 2015 10:15:06 -0400 [View Commit](../../commit/d4925347d0b93d7852b87073745cff2f07edccff)
*  Fix fringe calculations.
  * When a budget groups personnel (automatically by cost object or manually by created groups), and the unit has Lab Allocation rates, the printed budget report is not correctly publishing the correct Salaries & Wages amount for the Allocated Admin Support > personnel row because it only displays the calculated amount for the FIRST PERSON in each Group.
  * The Fringe Benefits field is correctly calculating against the correct value of ALL persons.
  * The incorrect value for LA > Salaries causes the remaining S&W totals in the section to be incorrect in this report and inconsistent with the "Calculation Methodology" section.
  * Also, subsequent values in the Allocated Administrative Support and Lab Expense Rates and Base for "Base" and "Calculated Costs" are also wrong WHEN PERSONNEL GROUP issue is in budget.
  * I created another test proposal where each person with same cost object was in a unique group (#791 v1); in that proposal the Base calculated correctly.
  * See proposal # 789 in res-demo-1.
  * Steps to duplicate:
  * Create a proposal in a unit with lab allocations (ex. 000001)
  * Create a budget
  * Add at least 4 people to the budget and enter a salary for each of them.
  * Assign 2 people to the same cost element > Faculty Salaries Tenured - On
  * Assign 2 people to the same cost element >Faculty Salaries Tenured - On, but create a group for the first person and use the same group for the 2nd person.
  * autocalculate periods.
  * Using the toolbar > Budget Periods > select the Action menu for this budget version > Print.
  * Select #4 Budget Summary Report and generate the PDF.
  * Result:
  * Review the values in the row for Allocated Admin Support > Faculty Salaries Tenured On: the Salaries and Wages field is not 10% of the Total Senior Personnel S&W of the above section. It is only the aggregate of the first person in each group. Due to this incorrect value, the following rows in the report are incorrect: (the Total Lab Allocation, TOTAL SALARIES & WAGES, and TOTAL SALARIES & WAGES & FRINGE BENEFITS)
  * Expected Result: The value for the above mentioned S&W field should be the sum of the Salary Allocation rate times the ALL personnel salaries, and the resulting totals should be correct. (The correct value appears in the Calculation Methodology section.)

  * ref
  * Gayathri Athreya on Mon, 14 Sep 2015 12:40:18 -0700 [View Commit](../../commit/e4139d2cd744979761ed6a5b33fd0e9febcb8d26)
*  Code cleanup
  * Gayathri Athreya on Fri, 11 Sep 2015 14:52:10 -0700 [View Commit](../../commit/bc1ec5f37c7fba3c85e36dd6e8a7fb0577312f20)

##coeus-1509.32
* No Changes


##coeus-1509.31
* Modular Budget Sync issue fix  * vineeth on Mon, 14 Sep 2015 14:52:33 -0400 [View Commit](../../commit/93edbdc0c59f9b12b2b332ea5e3ca9df6fb7cfce)
*  JMS based REST support via activemq
  * Travis Schneeberger on Fri, 4 Sep 2015 10:48:49 -0400 [View Commit](../../commit/2f4907fc068c1ae91ebb6c5cc49f42d64c42d156)

##coeus-1509.30
*  iacuc schedule print code cleanup
  * Travis Schneeberger on Thu, 10 Sep 2015 11:31:05 -0400 [View Commit](../../commit/0ae9032b4125ad85ffbe1432bd2a9649c4caa3be)
*  fixing iacuc schedule minutes print when iacuc protocol submissions exist
  * Travis Schneeberger on Thu, 10 Sep 2015 10:59:06 -0400 [View Commit](../../commit/fefd030ed8e072f116900529bd953b10514f6d7e)

##coeus-1509.29
* Making bitronix journal files and default transaction timeout configurable via a rice upgrade
  * Travis Schneeberger on Fri, 11 Sep 2015 21:44:26 -0400 [View Commit](../../commit/01b4b74127b32778ae380730055464bb8e7d4acd)

##coeus-1509.28
* allowing btm log location configuration
  * Travis Schneeberger on Fri, 11 Sep 2015 16:55:57 -0400 [View Commit](../../commit/8f57ef9d485fa32a673fc55ca7ece2975b52be9b)

##coeus-1509.27
*  Fixing budget base calculations
  * When a budget groups personnel (automatically by cost object or manually by created groups), and the unit has Lab Allocation rates, the printed budget report is not correctly publishing the correct Salaries & Wages amount for the Allocated Admin Support > personnel row because it only displays the calculated amount for the FIRST PERSON in each Group.
  * The Fringe Benefits field is correctly calculating against the correct value of ALL persons.
  * The incorrect value for LA > Salaries causes the remaining S&W totals in the section to be incorrect in this report and inconsistent with the "Calculation Methodology" section.
  * Also, subsequent values in the Allocated Administrative Support and Lab Expense Rates and Base for "Base" and "Calculated Costs" are also wrong WHEN PERSONNEL GROUP issue is in budget.
  * I created another test proposal where each person with same cost object was in a unique group (#791 v1); in that proposal the Base calculated correctly.
  * See proposal # 789 in res-demo-1.
  * Steps to duplicate:
  * Create a proposal in a unit with lab allocations (ex. 000001)
  * Create a budget
  * Add at least 4 people to the budget and enter a salary for each of them.
  * Assign 2 people to the same cost element > Faculty Salaries Tenured - On
  * Assign 2 people to the same cost element >Faculty Salaries Tenured - On, but create a group for the first person and use the same group for the 2nd person.
  * autocalculate periods.
  * Using the toolbar > Budget Periods > select the Action menu for this budget version > Print.
  * Select #4 Budget Summary Report and generate the PDF.
  * Result:
  * Review the values in the row for Allocated Admin Support > Faculty Salaries Tenured On: the Salaries and Wages field is not 10% of the Total Senior Personnel S&W of the above section. It is only the aggregate of the first person in each group. Due to this incorrect value, the following rows in the report are incorrect: (the Total Lab Allocation, TOTAL SALARIES & WAGES, and TOTAL SALARIES & WAGES & FRINGE BENEFITS)
  * Expected Result: The value for the above mentioned S&W field should be the sum of the Salary Allocation rate times the ALL personnel salaries, and the resulting totals should be correct. (The correct value appears in the Calculation Methodology section.)
  * Gayathri Athreya on Fri, 11 Sep 2015 11:30:53 -0700 [View Commit](../../commit/b7b5c582cc7d268e554e08e341600b304434016f)

##coeus-1509.26
* Display review comments in CR
  * rmancher on Fri, 11 Sep 2015 09:39:07 -0400 [View Commit](../../commit/99cab9c50faf2bf5bd351613d7ba6ff88bc3f239)

##coeus-1509.25
* No Changes


##coeus-1509.24
* No Changes


##coeus-1509.23
* No Changes


##coeus-1509.22
* Fix failing test
  * rmancher on Thu, 10 Sep 2015 15:16:21 -0400 [View Commit](../../commit/5bfee0fc1145d9f9182c27c16c288f5b0d5fa933)

##coeus-1509.21
* set created user and timestamp
  * rmancher on Thu, 10 Sep 2015 11:30:47 -0400 [View Commit](../../commit/6fd5ad46376a00b64fa81dfaeef11822a25eda8f)
* Correspondence sort issue
  * Fix protocol batch correspondence panel not loading
  * rmancher on Thu, 10 Sep 2015 10:52:21 -0400 [View Commit](../../commit/b8515f383d8595fc5e8c2f936994f09e2404489c)

##coeus-1509.19
* No Changes


##coeus-1509.18
*  Fix award budget error message
  * If an award end date is changed to an earlier date after an award budget version was created with the original end date, user is unable to create a budget version with new end dates.
  * To reproduce:
  * 1. locate an existing Award with an Award Budget in Posted status:
  * production issue: original project end date was 3/31/16, award budget with this end date was posted
  * 2. Edit Award and T&M document > revise project end date changed to 6/19/15, deobligate funds by amount -40,099
  * 3. Attempt to revise award budget: new award budget version created
  * Result:
  * 4. user can't navigate from parameters screen without changing period end dates, gets error "Period 2 end date cannot exceed project end date"
  * 5. when period two end date is adjusted, user cannot proceed because they are given the error "Line item end date can not be after budget period end date" (because line items exist with the original end date - however user can't adjust line item end dates because of error in step 4.
  * Gayathri Athreya on Wed, 9 Sep 2015 14:49:11 -0700 [View Commit](../../commit/4c149363afc8f41d4662d7b01c63c3d8c441d4c4)

##coeus-1509.17
* No Changes


##coeus-1509.16
*  Create basic integration tests
  * Travis Schneeberger on Wed, 9 Sep 2015 09:42:03 -0400 [View Commit](../../commit/38175ecd195f9b41323ecb29c88a05c74e2f8830)

##coeus-1509.15
*  Fix printing issues
  * Budget Print Report: "2 Budget Cumulative Report"
  * Issue 1: When more than one person is detailed in a group, only the salary of the first person is published, making the remaining sums on the form incorrect.
  * Issue 2: Calculation Methodology > F&A Exclusions duplicates Allocated Lab Expense row and thus doubles the total of exclusions from the F&A Base in the published total. This is a display issue on the form; that incorrect value is not being used in the actual F&A calculation. (Note: this duplicate row always appears and is not related to the salary group issue.)
  * Issue 3: When salary group issue exists, the Allocated Administrative Support and Lab Expense Rates and Base section of the calculation methodology page(s) contains the incorrect Base and Rate values. When no groups are used, or each person has their own group, this issue resolves.
  * Gayathri Athreya on Wed, 9 Sep 2015 08:06:02 -0700 [View Commit](../../commit/029ad74682ffee447ca7277c34f908af02b10757)

##coeus-1509.14
* Clicking doc link in TM History causes STE.

  * When using Award or T&M History clicking on a document link for a T&M doc would cause a stack trace due to a small bug in the generation of the URL.
  * ```java.lang.NoSuchMethodException: Action[/timeAndMoney] does not contain specified method (check logs)
	at org.apache.struts.actions.DispatchAction.dispatchMethod(DispatchAction.java:261)```
  * blackcathacker on Tue, 8 Sep 2015 17:42:25 -0700 [View Commit](../../commit/f0fe260d997e1d2c7a9e397bd73cf232f43abdb7)

##coeus-1509.13
*  Fix budget calculation print.
  * See proposal # 789 in res-demo-1.
  * Steps to duplicate:
  * Create a proposal in a unit with lab allocations (ex. 000001)
  * Create a budget
  * Add at least 4 people to the budget and enter a salary for each of them.
  * Assign 2 people to the same cost element > Faculty Salaries Tenured - On
  * Assign 2 people to the same cost element >Faculty Salaries Tenured - On, but create a group for the first person and use the same group for the 2nd person.
  * autocalculate periods.
  * Using the toolbar > Budget Periods > select the Action menu for this budget version > Print.
  * Select #4 Budget Summary Report and generate the PDF.
  * Result:
  * Review the values in the row for Allocated Admin Support > Faculty Salaries Tenured On: the Salaries and Wages field is not 10% of the Total Senior Personnel S&W of the above section. It is only the aggregate of the first person in each group. Due to this incorrect value, the following rows in the report are incorrect: (the Total Lab Allocation, TOTAL SALARIES & WAGES, and TOTAL SALARIES & WAGES & FRINGE BENEFITS)
  * Expected Result: The value for the above mentioned S&W field should be the sum of the Salary Allocation rate times the ALL personnel salaries, and the resulting totals should be correct. (The correct value appears in the Calculation Methodology section.)
  * Gayathri Athreya on Tue, 8 Sep 2015 14:52:57 -0700 [View Commit](../../commit/8eb2b74301f9e05a3ee599e004ec3d77ab8290d5)

##coeus-1509.12
*  Cannot Sync a hierarchy proposal with attachments from the child or the parent.

  * As a user, I need to create and maintain a hierarchy proposal. I wish to maintain the narrative attachments in the child proposal in case I need to copy and resubmit.
  * Steps to reproduce:
  * Create a new proposal with the minimal requirements to easily locate and to create a hierarchy:
  * 1 Enter Basic proposal data to save.
  * 2. Add the S2S Opportunity to enable a full attachment listing for later use (ex. PA-C-R01)
  * 3 Add a PI
  * 4 Create a budget version (no data required, just mark it as for submission for hierarchy create)
  * 5 Create the parent proposal
  * 6 Upload a few narratives to the child proposal
  * 7. Sync to parent
  * NOTE: this error also happens if you try to Sync from PARENT.
  * Expected result: successful sync to parent message in child proposal, and the parent proposal is updated with the narratives.
  * Actual result: STE.
  * Travis Schneeberger on Tue, 8 Sep 2015 09:40:46 -0400 [View Commit](../../commit/207454a5fad5ab52b755a632273e3f69292ce0ab)

##coeus-1509.11
*  Fix Protocol copy.

  * Attempt to copy an IRB or IACUC protocol. Tested on newly created protocol and older ones.
  * Get:
  * org.kuali.rice.krad.exception.UnknownDocumentIdException: Document no longer exists. It may have been cancelled before being saved.
  * Travis Schneeberger on Tue, 8 Sep 2015 10:13:28 -0400 [View Commit](../../commit/3b6648a7bb3591c454cd5f7dd6abc1e4b3b5cc0a)

##coeus-1509.10
* No Changes


##coeus-1509.8
*  Fixing budget print summary LA calculations.
  * Gayathri Athreya on Fri, 4 Sep 2015 15:02:17 -0700 [View Commit](../../commit/9eb77869ba865b4f738bb6bf62566bff90765b48)
*  another button fix
  * Gayathri Athreya on Fri, 4 Sep 2015 09:16:39 -0700 [View Commit](../../commit/78758e16d25d5dfdf5a3ce7a588f562a8bdcb663)

##coeus-1509.7
* No Changes


##coeus-1509.6
* No Changes


##coeus-1509.5
* No Changes


##coeus-1509.4
* No Changes


##coeus-1509.3
*  Fix spelling.
  * Gayathri Athreya on Thu, 3 Sep 2015 14:29:40 -0700 [View Commit](../../commit/cefe6d013009ab215b7561f1aa4cf3cadf9cf185)
*  Fixing budget rates button and award institute rates.
  * Gayathri Athreya on Thu, 3 Sep 2015 13:56:37 -0700 [View Commit](../../commit/18fa853f0e2c18b838f578d108d5bdd8a8af8d56)
*  Restoring key person certification functionality.
  * Somewhere between the Foundation 6.0 release and the current Kuali.co environments, the out of the box ability to 'include certification questions' for Key Persons has been lost.
  * The MIT contribution for COI Disclosure Status provided an automated way to add the proposal person certification for key persons, but that feature is enabled via a parameter.
  * Current 5.2.1 users undergoing upgrade review noted the feature is missing.
  * Related jira for the missing option to 'include credit allocation' for key persons.
  * Gayathri Athreya on Tue, 1 Sep 2015 17:10:53 -0700 [View Commit](../../commit/d8f724bc8d228b542456583ecb69929351062d51)

##coeus-1509.2
* Changes to support external citizenship sources better
  * blackcathacker on Mon, 31 Aug 2015 14:47:02 -0700 [View Commit](../../commit/cfa96829fc79c802b0843b346abbadab242d3f42)

##coeus-1509.1
*  Trying to fix budget rates button.
  * 1. Copy IP or Dev Proposal with budget
  * 2. Created the Award
  * 3. Created time and money and obligated the first year funding
  * 4. Finalized time and money
  * 5. Finalized the Award
  * 6. open the budget tab keyed in a new budget name
  * 7. tried to open the new budget to select the proposal budget
  * I get this message and cannot get out of it with yes or no. This is a NEW ISSUE when creating a new award budget.
  * Gayathri Athreya on Mon, 31 Aug 2015 16:47:33 -0700 [View Commit](../../commit/48aa9e5808478df446256dd91e69743bc09278ba)
*  Fix correspondence redirection after SMR or SRR.
  * With Correspondence set up (as not Final) for SMR and SRR.
  * Create protocol
  * Submit Protocol
  * -Assign committee
  * -Assign schedule
  * -Expedited review
  * -checklist
  * -Assign reviewer
  * Return for Specific Minor Revisions or Substantial Revisions Required
  * Result: User is taken to the main Protocol tab upon completion of the action. Letter is generated but the user has to go to Protocol history to view/update the correspondence.
  * Expected: The Correspondence panel is displayed with the newly generated correspondence for the SMR or SRR action.
  * Gayathri Athreya on Mon, 31 Aug 2015 09:52:13 -0700 [View Commit](../../commit/e94049afd446d2776f4da4562bee90b24f9d8e05)

##coeus-1508.47
* No Changes


##coeus-1508.46
* No Changes


##coeus-1508.45
* Update V1508_008__financial_rest_apis.sql  * tdurkin on Tue, 25 Aug 2015 18:31:11 -0500 [View Commit](../../commit/b5912207ca7da1d06ff6f2a784f5d9de412102f5)

##coeus-1508.44
* fixing compile error
  * blackcathacker on Wed, 26 Aug 2015 12:29:14 -0700 [View Commit](../../commit/6301334bebe64cf3ea7a3fd24ef12f89ef6672ce)
* Award Contribution: Delivery Mechanism to send out Award Notice pdf via the Notification System
  * Joe Williams on Tue, 25 Aug 2015 15:25:22 -0500 [View Commit](../../commit/187686a1307ad72b0a124359d1721e0f23c14d15)
* RESKC-353-Fixing cost sharing validations in IP
  * Issue: A proposal was routed last week after a validation check showed no errors. There are no source accounts listed for the costshare. The budgetUnrecoveredFandAEnforcementFlag and budgetCostSharingEnforcementFlag parameters and both are disabled, so the system should not be checking for a source account. There should not be an error. The Turn on Validation worked correctly, but the validation upon submission did not.
  * Gayathri Athreya on Wed, 26 Aug 2015 11:12:05 -0700 [View Commit](../../commit/7dd99dfb0991c772bdb29fadc732fe2369e5c1aa)

##coeus-1508.42
*  Reverting previous performance fixes that caused a bunch of bugs and fixing current issue with final flag.
  * Create IACUC protocol
  * Submit
  * Modify submission to assign, committee, and reviewers. (Use DMR review type in testing.)
  * Scenario 1:
  * As reviewer in online review document, enter or select comment and add.
  * Save.
  * -Expected: Comment is saved and still editable.
  * -Actual: Comment is read only.
  * Scenario 2:
  * As IACUC admin go to Online review and enter or select comment on behalf of reviewer, mark final and add.
  * -Expected: . Final flag is still checked.
  * -Actual: Comment is marked not Final.
  * Mark comment final.
  * Save
  * -Expected: Comment is still editable and marked Final.
  * -Actual: Comment is marked final but is now read only
  * Gayathri Athreya on Wed, 26 Aug 2015 09:13:57 -0700 [View Commit](../../commit/29f23db878e465737c499f0e7671458cd2698d43)

##coeus-1508.41
* No Changes


##coeus-1508.40
*  Fix undo last action.
  * Create protocol
  * Submit Protocol
  * -Assign committee
  * -Assign schedule
  * -Expedited review
  * -checklist
  * -Assign reviewer
  * Return for Specific Minor Revisions or Substantial Revisions Required
  * Undo Last Action
  * Get:
  * org.springframework.dao.DataIntegrityViolationException: OJB operation; SQL []; Duplicate entry '2012-2023-2024' for key 'UQ1_PROTOCOL_ONLN_RVWS'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry '2012-2023-2024' for key 'UQ1_PROTOCOL_ONLN_RVWS'
  * Gayathri Athreya on Tue, 25 Aug 2015 12:21:03 -0700 [View Commit](../../commit/026d30a0798d928684fce33218dbb290a926d899)
* when there is a pending and active award when a time and money document is submitted add award amount info to both versions of the award
  * Joe Williams on Fri, 21 Aug 2015 14:26:35 -0500 [View Commit](../../commit/5457c4d191f3b1c375b5b51e355cd32227b60ddf)

##coeus-1508.39
* No Changes


##coeus-1508.38
* No Changes


##coeus-1508.37
* No Changes


##coeus-1508.36
*  Making All My Reviews link under the IRB section link to IRB Online Reviews not IACUC Online Reviews
  * Travis Schneeberger on Tue, 25 Aug 2015 11:23:16 -0400 [View Commit](../../commit/211892292dea896be530fe621fbd16e73f85c9f8)

##coeus-1508.35
*  Adding risk levels
  * Gayathri Athreya on Mon, 24 Aug 2015 15:57:24 -0700 [View Commit](../../commit/efd380fe9dadb3b25e3bca48e35462a4f7f67268)

##coeus-1508.34
*  extra documentation
  * Gayathri Athreya on Mon, 24 Aug 2015 13:36:12 -0700 [View Commit](../../commit/c4a5b3e484f2f59512d54f36f02cc1e598d65f1a)
*  fixing budget period lookup in award budget when a modular budget exists.
  * Travis Schneeberger on Mon, 24 Aug 2015 16:04:07 -0400 [View Commit](../../commit/a8562fa5e5f4d04b07ac8ed33c5f0f555fca5867)
*  Documentation and minor added functionality of getting awards linked to an account.
  * Gayathri Athreya on Fri, 21 Aug 2015 17:12:01 -0700 [View Commit](../../commit/a88b09110bfbd3e136e4dc7e7fd4fe0d6eba7caa)

##coeus-1508.33
* correctly set faculty flag on institutional proposal persons

  * Issue: Proposal Summary printout inaccurate Affiliation Type for PI

  * Steps:

  * 1.) create a proposal log with a PI that has a faculty affiliation
  * 2.) create IP from proposal log.
  * 3.) navigate to action page and print notice.

  * also occurs if you delete and add a PI with a faculty affiliation.

  * Expect result: Faculty label printout says 'Yes'

  * Actual result: Faculty label in printout says 'No'
  * Joe Williams on Mon, 24 Aug 2015 09:56:02 -0500 [View Commit](../../commit/b27828b3ed636d01cf00c7539ee4aa19788d601a)

##coeus-1508.32
* RESKC-677-validations: Adding input validations.
  * Gayathri Athreya on Fri, 21 Aug 2015 14:26:57 -0700 [View Commit](../../commit/539e96153bf82dcc78b843b804955559b2a5b864)

##coeus-1508.31
*  Financial account REST api
  * Gayathri Athreya on Wed, 5 Aug 2015 12:12:02 -0700 [View Commit](../../commit/1e77bb650c34fe27348ac2942979b8b9467d555e)
*  return saved adhoc recipient when saving document to avoid sql exception

  * Steps to reproduce:
  * 1. Create an Award or edit an existing award, complete required fields and submit.
  * 2. Click "Time & Money"
  * 3. Click on "edit"
  * 3.a: maintain required fields and entries
  * 4. Add an adhoc recipient (FYI or approve)
  * 5. Click on "submit"

  * Alternate scenario:
  * After adding transaction type, transaction details, and ad hoc recipient, click on the Action Summary and History tab, then return to the T&M tab; > STE occurs.

  * Errors:
  * The system has encountered an error and is unable to complete your request at this time. Please provide more information regarding this error by completing this Incident Report.
  * Error Details: java.lang.RuntimeException: post processor caught exception while handling do action taken change: OJB operation failed; nested exception is org.apache.ojb.broker.PersistenceBrokerException: org.springframework.orm.jpa.JpaSystemException: Exception [EclipseLink-4002] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DatabaseException Internal Exception: java.sql.SQLException: ORA-01407: cannot update ("MG1505"."KRNS_ADHOC_RTE_ACTN_RECIP_T"."OBJ_ID") to NULL Error Code: 1407 Call: UPDATE KRNS_ADHOC_RTE_ACTN_RECIP_T SET OBJ_ID = ? WHERE ((((ACTN_RQST_CD = ?) AND (DOC_HDR_ID = ?)) AND (ACTN_RQST_RECIP_ID = ?)) AND (RECIP_TYP_CD = ?)) bind => [5
  * Joe Williams on Wed, 19 Aug 2015 08:45:30 -0500 [View Commit](../../commit/ad637d710121c2c8d32dab7717f78adaa8fbe852)

##coeus-1508.30
* No Changes


##coeus-1508.29
* display the correct award project end date on lookups

  * Issue: Award lookup not displaying correct Project End Date

  * Steps:

  * 1.) Create and submit an award with a project end date of 08/31/2016
  * 2.) Create a time and money document change obligated and final end date to to 09/30/2016
  * 3.) do a look up that award, and notice the lookup displays the first end date.

  * Expected Results: award lookup displays end date from the latest time and money document.
  * Joe Williams on Thu, 20 Aug 2015 09:40:16 -0500 [View Commit](../../commit/df37dda1ae5e21182b454b7e1b2aa724def79e46)

##coeus-1508.28
* Multiple award budget versions cause incorrect olbigated amounts

  * Once there are more than 2 award budget versions, obligated amounts begin to not match correct values due to a bad conflict between some budget summary code and other logic expectations. This change creates new properties used to store the total costs of the current and all previous award budgets to resolve this issue such that the total cost is maintained on the budget.
  * blackcathacker on Wed, 19 Aug 2015 17:51:01 -0700 [View Commit](../../commit/55ce7461d89faa491f88221a05ace6f9547f3d3e)

##coeus-1508.27
* No Changes


##coeus-1508.26
* No Changes


##coeus-1508.25
*  Fixing subaward
  * Subaward Medusa lists two different Id sometimes.
  * Subaward listed as #33 under Award but as #27 in dropdown panel
  * Gayathri Athreya on Mon, 17 Aug 2015 15:47:37 -0700 [View Commit](../../commit/ab876026ea7234a37203987636a2d9ef1b25624c)
*  Fixing F&A validations
  * When creating a proposal with underrecovery, when you omit the Unverrecovery Account, the data validation allows the proposal to be submitted into routing and passes all the validations, but does not allow the proposal to be submitted to sponsor.
  * (I think this error is the result of a fix to allow the proposal to be entered with no underrecovery account)
  * 1. create a proposal that has UR
  * 2. certify proposal
  * 3. complete budget and mark budget for submission
  * 4. navigate to Superuser actions
  * 5. approve proposal
  * 6. click submit to sponsor (incident report appears )
  * Source Account is a required field.

  * There is no way to correct this error since the proposal "approval granted" as the document is not accessible.
  * Gayathri Athreya on Mon, 17 Aug 2015 14:13:18 -0700 [View Commit](../../commit/32e504f1625bb1a8fc6f945ecc5071119b675ed6)
*  ensure that all parameters point to a valid component record.
  * Travis Schneeberger on Mon, 17 Aug 2015 15:02:09 -0400 [View Commit](../../commit/47ca00520a53c5817bbbb2e0e78f56abf86b6893)
* Duplicate rows when importing budget details in award budget
  * blackcathacker on Fri, 14 Aug 2015 10:23:56 -0700 [View Commit](../../commit/7acffb09aa3c4bb4b09dc9e09994923dabce6a2d)
* Sponsor Forms not including non-final budget amounts in printouts

  * Instead of using a null budget in the case that a final budget does not exist, we will use the newest budget added to the proposal.
  * blackcathacker on Fri, 14 Aug 2015 10:18:11 -0700 [View Commit](../../commit/f2422d1d9d93bc126a5f4dfb0bbed893cfdcb501)

##coeus-1508.24
* No Changes


##coeus-1508.23
* Add back in feature to replace Versions.do with Parameters.do

  * A regression was introduced that removed a replacement in the forwardUrl that replaced Versions.do with Parameters.do. This adds this feature back in such that navigating from award to budget will open the parameters page instead of the versions.
  * blackcathacker on Wed, 12 Aug 2015 19:03:15 -0700 [View Commit](../../commit/63a1568129fea78ba95aa5ed45813066972edf04)

##coeus-1508.22
* Validate correct budget line item when validating sync to period limit

  * When attempting to sync to period cost limit on a non-personnel line item, when a personnel line item does exist in the budget the following erroneous error is sometimes reported. "Cannot perform this operation on a line item with personnel budget details."
  * blackcathacker on Wed, 12 Aug 2015 17:17:48 -0700 [View Commit](../../commit/5b565883f776f2d147ea8f205c75aae45dd8171f)

##coeus-1508.21
* When returning from posting a budget the page fails to fully load
  * blackcathacker on Tue, 11 Aug 2015 15:33:34 -0700 [View Commit](../../commit/629bf4712ff7fc670b3fb68f080f846036e5e7dc)
* Update readme to include information about node and npm dependencies
  * blackcathacker on Wed, 12 Aug 2015 12:19:19 -0700 [View Commit](../../commit/65d2cb20e65896aa9d0aacf259a80672d47b5c3e)
*  as per code review no longer versioning award funding proposals
  * Travis Schneeberger on Wed, 12 Aug 2015 09:31:58 -0400 [View Commit](../../commit/591f3c1fd9ca695bf47db0cdd7aa15b5da8a6e5a)
*  code cleanup
  * Travis Schneeberger on Tue, 11 Aug 2015 15:20:42 -0400 [View Commit](../../commit/ffc59ab901e0922fea260969bad97de99cc04d94)
*  Fixing award funding proposal versioning where the funding proposals were not versioned when an institutional proposal was versioned.
  * Travis Schneeberger on Tue, 11 Aug 2015 14:22:35 -0400 [View Commit](../../commit/3dfa1507d5c406efe09f7947735563903ef32a8e)

##coeus-1508.20
*  Fix award budget data issue
  * Gayathri Athreya on Tue, 11 Aug 2015 14:14:31 -0700 [View Commit](../../commit/385e3473f65bb238cbf5e242d62ea0c095c6398c)

##coeus-1508.19
* Fix award budget issues related to foreign keys

  * and budget calculation and line item deletion.

  * Caused by: java.lang.NullPointerException
	at org.kuali.coeus.common.budget.impl.nonpersonnel.BudgetExpensesAuditRule.processRunAuditBusinessRules(BudgetExpensesAuditRule.java:130)
	... 102 more

  * and

  * Caused by: javax.persistence.PersistenceException: Exception [EclipseLink-43] (Eclipse Persistence Services - 2.6.0.v20150309-bf26070): org.eclipse.persistence.exceptions.DescriptorException
  * Exception Description: Missing class for indicator field value [AWRD] of type [class java.lang.String].
  * Descriptor: RelationalDescriptor(org.kuali.coeus.common.budget.framework.core.Budget --> [DatabaseTable(BUDGET)])
  * blackcathacker on Tue, 11 Aug 2015 12:24:15 -0700 [View Commit](../../commit/d4eb56ca2f7f18560afb30f4d762aff72ad57c00)

##coeus-1508.18
* IRB - Create Amendment - Duplicate persons

  * When creating an IRB protocol, the document is saved multiple times and the personnel are copied and merged multiple times and it appears that the deletion aware lists don't work properly within the same transaction. Removing the unnecessary saves clears that up.
  * blackcathacker on Mon, 10 Aug 2015 20:35:02 -0700 [View Commit](../../commit/c0f1206ced5ad63b6886ae41cd4028896fcdd7c1)

##coeus-1508.17
*  Trying to fix lazy loading elements in rates
  * Gayathri Athreya on Mon, 10 Aug 2015 15:50:31 -0700 [View Commit](../../commit/50c482315d450786628caad21deea283e046da3b)

##coeus-1508.16
*  allowing the attachment tab to load with an attachment and in read only mode
  * Travis Schneeberger on Mon, 10 Aug 2015 15:26:26 -0400 [View Commit](../../commit/c7d9ddfff7f0b2497a50d27008f366b8028d75ad)
*  allowing whitespace in attachment names
  * Travis Schneeberger on Mon, 10 Aug 2015 15:18:44 -0400 [View Commit](../../commit/21e02df9ac57ee33a54805bd7b3ccd557f8f9c8d)

##coeus-1508.15
* No Changes


##coeus-1508.14
*  adding missing indexes and foreign keys for iacuc and irb
  * Travis Schneeberger on Fri, 7 Aug 2015 17:37:43 -0400 [View Commit](../../commit/ccbd09fd5f3b5a293bfdae6d4aa1f241d1f8ca88)
*  not getting the total protcol submissions in a getter but using a previously retrieved value to increase performance
  * Travis Schneeberger on Fri, 7 Aug 2015 16:29:33 -0400 [View Commit](../../commit/96b501554ebe0d2337d077e1833ba37a26b92724)
*  reducing the amount of find protocol calls to improve performance
  * Travis Schneeberger on Fri, 7 Aug 2015 16:05:44 -0400 [View Commit](../../commit/0f0b69f63b0ce8d95f8a58d073cc13f1a9547b76)
*  removing search that's not working.
  * Gayathri Athreya on Fri, 7 Aug 2015 11:00:55 -0700 [View Commit](../../commit/580bf0c9df9779d6881c65594507c9ff1487de5a)

##coeus-1508.13
*  making email and notification asynchronous rather than blocking.  This will help performance where these features are used.
  * Travis Schneeberger on Thu, 6 Aug 2015 18:10:07 -0400 [View Commit](../../commit/5fd79136a405c012bdcaa974c856720fc1a4771e)

##coeus-1508.12
*  adding index to prevent full table scan
  * Travis Schneeberger on Thu, 6 Aug 2015 16:54:22 -0400 [View Commit](../../commit/f96070f502c04c1688b681c85890e116bf7e3e67)
*  prevent schedule status fetch from being executed for every available schedule date.  Also, using the schedule status code value rather than description.
  * Travis Schneeberger on Thu, 6 Aug 2015 16:51:13 -0400 [View Commit](../../commit/2dd1f047e3a93b2c1c54afcdd58d6ad710df0a0f)

##coeus-1508.11
* No Changes


##coeus-1508.10
*  Attempting to fix OJB issue.
  * Unable to open award budget.
  * Steps to reproduce:
  * 1. Create an award with all required fields, including amounts.
  * 2. Create a budget, route it and post it.
  * 3. Route the award to final.
  * 4. Click edit on the finalized award.
  * 5. SAVE.
  * 6. Navigate to the budget tab, see STE.
  * org.apache.ojb.broker.OJBRuntimeException: Incorrect or not found field reference name 'awardId' in descriptor org.apache.ojb.broker.metadata.CollectionDescriptor@1edf2759[cascade_retrieve=true,cascade_store=object,cascade_delete=object,is_lazy=true,class_of_Items=class org.kuali.kra.award.budget.AwardBudgetExt] for class-descriptor 'org.kuali.coeus.common.budget.framework.core.Budget'
  * at org.apache.ojb.broker.metadata.ObjectReferenceDescriptor.getForeignKeyFieldDescriptors(Unknown Source)
  * at org.apache.ojb.broker.metadata.ObjectReferenceDescriptor.getForeignKeyValues(Unknown Source)
  * at org.apache.ojb.broker.accesslayer.CollectionPrefetcher.associateBatched(Unknown Source)
  * at org.apache.ojb.broker.accesslayer.BasePrefetcher.prefetchRelationship(Unknown Source)
  * at org.apache.ojb.broker.core.QueryReferenceBroker$PBPrefetchingListener.prefetch(Unknown Source)
  * at org.apache.ojb.broker.core.QueryReferenceBroker$PBCollectionProxyListener.beforeLoading(Unknown Source)
  * at org.apache.ojb.broker.core.proxy.CollectionProxyDefaultImpl.beforeLoading(Unknown Source)
  * at org.apache.ojb.broker.core.proxy.CollectionProxyDefaultImpl.getData(Unknown Source)
  * at org.apache.ojb.broker.core.proxy.CollectionProxyDefaultImpl.iterator(Unknown Source)
  * at java.util.AbstractCollection.addAll(AbstractCollection.java:343)
  * at org.kuali.kra.award.budget.AwardBudgetServiceImpl.getAllBudgetsForAward(AwardBudgetServiceImpl.java:897)
  * at org.kuali.kra.award.home.Award.getBudgets(Award.java:2771)
  * at org.kuali.kra.award.budget.AwardBudgetExt.getPrevBudget(AwardBudgetExt.java:222)
  * at org.kuali.kra.award.budget.calculator.AwardBudgetCalculationServiceImpl.calculateBudgetSummaryTotals(AwardBudgetCalculationServiceImpl.java:41)
  * at org.kuali.kra.award.budget.AwardBudgetServiceImpl.populateBudgetLimitSummary(AwardBudgetServiceImpl.java:855)
  * at org.kuali.kra.award.web.struts.action.AwardAction.budgets(AwardAction.java:1023)
  * Gayathri Athreya on Wed, 5 Aug 2015 17:18:23 -0700 [View Commit](../../commit/9f7797c1204a5dd1435a7b5a207cb3523b309bc7)

##coeus-1508.9
*  making sure the index handling logic is working with the correct collection.
  * Travis Schneeberger on Wed, 5 Aug 2015 16:20:32 -0400 [View Commit](../../commit/c4c14df29e7242ad2cfd1fb471659798e1382e7e)
* Remove duplicate T&M Docs when retreiving based on aai

  * When doing query by criteria searches referencing a collection, it appears to return duplicate T&M results. This removes the duplication before returning from the dao.
  * Additionally when hitting reload on the new T&M History tab the necessary data to render the page was not being populated on the BO.
  * blackcathacker on Wed, 5 Aug 2015 12:01:45 -0700 [View Commit](../../commit/db357854318392c4448c267cdc81851494dd6b1b)
*  Fixing index out of bounds on funding proposal delete on award document.
  * Travis Schneeberger on Wed, 5 Aug 2015 11:39:43 -0400 [View Commit](../../commit/002728e7a968f362b0e16c25cf8bca2e6beaed97)

##coeus-1508.8
*  changing lookup helper service to prototype scope so that custom data lookups or "data to alter" lookups do not throw an exception related to unknown properties.  Fixing our integration test to now confirm that lookup helper services are always prototype scope.
  * Travis Schneeberger on Tue, 4 Aug 2015 16:01:47 -0400 [View Commit](../../commit/bd0b2d0da6869930dd6420d96e647a4a399652c7)

##coeus-1508.7
*  Fixing STE
  * Gayathri Athreya on Thu, 30 Jul 2015 18:39:21 -0700 [View Commit](../../commit/a496543b9f08e8b15d7d9912d81d0d277e909d73)

##coeus-1508.6
* fixes issues with differences in total direct cost between award summary and award parameters

  * Edited an award node to add funds; submitted.
  * Edited the T&M doc to fund the node; submitted.
  * On Budget Versions tab: added a new budget > opened.
  * Linked P1 of the proposal budget (details did not come forward).
  * Manually added personnel and non-personnel to get close to the limit.
  * On the Summary screen, edited the F&A OH override field to meet the obligated total for this budget & saved.
  * On Award Budget Actions > tried to submit.
  * Results: got an error that the direct cost was exceeded.
  * On Parameter screen> the direct cost amount did not reflect the details of the budget.

  * Desired result: the values on the parameter screen should update to reflect the amounts in the detailed budget.
  * Joe Williams on Mon, 3 Aug 2015 16:42:02 -0500 [View Commit](../../commit/3b294a9654f62d920decb27a1572e540b4a5534b)

##coeus-1508.5
* sync question id seq table with question table
  * Joe Williams on Fri, 31 Jul 2015 13:23:04 -0500 [View Commit](../../commit/586be857622bfc7c6b520be454be4d11dc678561)

##coeus-1508.4
*  fix issue with edit button not opening pending award
  * Joe Williams on Mon, 3 Aug 2015 12:25:13 -0500 [View Commit](../../commit/d63c0eec06b9b7fb3c876543dd4534e8e0a59377)

##coeus-1508.3
* No Changes


##coeus-1508.2
* No Changes


##coeus-1508.1
* Update V1507_021__Resolve_repackaging.sql  * Douglas Pace on Fri, 31 Jul 2015 16:01:21 -0700 [View Commit](../../commit/afcc8e9b2df0822a352c4052b1e96fbd3f53b4a2)
* Update V1507_021__Resolve_repackaging.sql  * Douglas Pace on Fri, 31 Jul 2015 16:01:04 -0700 [View Commit](../../commit/5be60706d38f70c6cf3f2f96d41101d6fd377d35)
* Fix to resolving repackaging scripts.
  * blackcathacker on Fri, 31 Jul 2015 15:53:15 -0700 [View Commit](../../commit/5ebb5aca6fde30fe05092dd1e2c0e9abcad5a923)

##coeus-1507.77
* Fix minor oracle issues

  * Including a problem with KcPerson lookup related to repackaging causing an error in demo data when navigating to custom attributes
  * blackcathacker on Fri, 31 Jul 2015 12:40:35 -0700 [View Commit](../../commit/3cfe96a38c15a98ed8bbc102830ab3a08ee79664)

##coeus-1507.76
* No Changes


##coeus-1507.75
* prevent error when optional parameter doesn't exist

  * When this optional parameter hasn't been added the following error occurs
  * ```
  * when-present<#else>when-missing. (These only cover the last step of the expression; to cover the whole expression, use parenthessis: (myOptionVar.foo)!myDefault, (myOptionVar.foo)?? The failing instruction (FTL stack trace): ---------- ==> ${request.contextPath} [in template "krad/WEB-INF/ftl/lib/html.ftl" in macro "html" at line 51, column 25] #else [in template "krad/WEB-INF/ftl/lib/html.ftl" in macro "html" at line 50, column 9] @krad.html view=view [in template "krad/WEB-INF/ftl/fullView.ftl" at line 18, column 1] #include "fullView.ftl" [in template "krad/WEB-INF/ftl/uifRender.ftl" at line 69, column 9] #else [in template "krad/WEB-INF/ftl/uifRender.ftl" at line 68, column 5] ---------- Java stack trace (for programmers): ---------- freemarker.core.InvalidReferenceException: [... Exception message was already printed; see it above ...] at freemarker.core.InvalidReferenceException.getInstance(InvalidReferenceExcept
  * ```
  * blackcathacker on Fri, 31 Jul 2015 10:40:53 -0700 [View Commit](../../commit/750e2766552f759917b67af13da9a4b62184fc75)
* Fix award hierarchy/award actions for very large hierarchies
  * blackcathacker on Fri, 26 Jun 2015 23:23:40 -0400 [View Commit](../../commit/13fbdc2018597ffcaa2e8b8d0b5b953db64c9cb0)
* make the award sequence number values finder more efficient to make the print section load faster
  * Travis Schneeberger on Thu, 25 Jun 2015 14:34:30 -0400 [View Commit](../../commit/2f6b1b4bc8ba46ccf84bd9026b4bb87e0c9d601c)

##coeus-1507.74
* fix calculated fringe and calculated direct cost display on proposal budget

  * As a proposal user, I am trying to verify that salaries and  employee benefits are being calculated correctly.
  * When I add a person to a proposal in a unit with Lab Allocation rates, the value displayed in the "Calculated Fringe" field is not correct.
  * The field should only contain any calculated employee benefit rates for the identified person (which may include EB, Vacation, or any other defined personnel EB type rate).

  * Currently, the Calculated Fringe includes field is displaying
  * EB + EB ON LA (Incorrect)
  * (missing vacation)

  * Additionally:
  * Calculated direct costs includes:
  * Vacation (Incorrect)
  * Vacation on LA
  * (Missing EB on LA)

  * The correct display should include/display the following:

  * Calculated Fringe for a personnel entry SHOULD include individuals';
  * EB
  * Vacation

  * Calculated direct costs SHOULD include:
  * EB ON LA
  * Vacation on LA
  * Joe Williams on Wed, 29 Jul 2015 15:34:31 -0500 [View Commit](../../commit/caeb8c6c307a6a6cf22a89ec8e71d5224daa85c5)

##coeus-1507.73
* apply inflation rates from child budget when calculating line items on parent budget

  * In a Proposal Hierarchy, when you have one child proposal budget that applies inflation to a particular Cost Category and then in another Child Proposal, you set the Inflation Rate for that Cost Category to '0'. When synced to the Parent Proposal, the Parent budget will apply inflation to the Cost, even if the Cost in the child proposal did not have inflation applied. This is causing the Parent budget numbers to be different from the child budget numbers.
  * Desired Behavior: The Parent Budget should not make any changes/recalculations to the numbers that are brought from the Child Proposal Budgets.
  * Steps to Reproduce:
  * 1. Create a Proposal (with minimum info to save) - one year project period is enough. Also, add a PI
  * 2. Create a Detailed Budget
  * a) In the Project Personnel, add any person, for example TBA-PostDoc and update the Details with the Base Salary (e.g. 12,000)
  * b) Go to Assign Personnel To Periods, and click the Assign Personnel Button.
  * c) In the Add Personnel to Period window, select:
  * TBA-Post-Doc from the Person drop-down
  * Form Object Code, select Post-Doctoral Staff-On
  * Enter 100 in Effort % and Charged %
  * Click the Assign to Period 1 button
  * d) Save your budget and click the Return to proposal button
  * 3. In the Proposal, click the Hierarchy link in the toolbar. In the Hierarchy window select:
  * a) Hierarchy Budget Type: Sub Budget
  * b) Click the Create Hierarchy button
  * c) Note the Parent Proposal number generated
  * 4. Close out of your proposal
  * 5. Create another proposal (make sure it has the same project period as the first proposal you created). Also add a PI
  * 6. Create a Detailed Budget in the second proposal
  * a) In the Project Personnel, add any person, for example TBA-PostDoc and update the Details with the Base Salary (e.g. 12,000) and also change the Job Code (e.g. enter 1 in the Job Code field just so this TBA has a different Job Code then the TBA we have in the first budget we created)
  * b) Go to the Rates --> Inflation, and change the Inflation Rate for Post-Doctoral Staff to '0'
  * c) Go to Assign Personnel To Periods, and click the Assign Personnel Button.
  * d) In the Add Personnel to Period window, select:
  * TBA-Post-Doc from the Person drop-down
  * Form Object Code, select Post-Doctoral Staff-On
  * Enter 100 in Effort % and Charged %
  * Click the Assign to Period 1 button (you should notice that the salary requested is not inflated)
  * e) Save your budget and click the Return to proposal button
  * 7. In the Proposal, click the Hierarchy link in the toolbar. In the Hierarchy window:
  * a) Enter your Parent Proposal Number in the Link Proposal field
  * b) Form the Hierarchy Budget Type select Sub Budget
  * c) Click the Link this Child to a Parent button
  * 8. Close out of your proposal
  * 9. Go to the Parent Proposal and navigate to the Budget
  * 10. In the Budget go to Project Personnel - Assign Personnel to Periods section
  * 11. You will see that the Requested Salary for the Post Docs is inflated for both Post-Docs, even though one of them had the salary not inflated in the child proposal
  * Joe Williams on Thu, 30 Jul 2015 12:49:27 -0500 [View Commit](../../commit/7ce30372b4a05e2bf6974d2d9b0c0e54a3eecb98)

##coeus-1507.72
* Fix T&M summary for single node hierarchies
  * blackcathacker on Fri, 26 Jun 2015 14:40:23 -0400 [View Commit](../../commit/90abff1f46e7e1fa39245a0349f23176278c8522)
* Fixes to the summary and history tab
  * blackcathacker on Thu, 25 Jun 2015 15:51:30 -0400 [View Commit](../../commit/a9f3efb2ba6c26a23f027076b256d2f08cb4ebdf)
* Award Time and Money Improvements
  * blackcathacker on Wed, 24 Jun 2015 17:56:08 -0400 [View Commit](../../commit/ee71818851e2f92960a9b95c92599e4ff5f4274b)

##coeus-1507.71
* No Changes


##coeus-1507.70
* No Changes


##coeus-1507.69
*  fix irb committee submission when there is a protocol submission using the committee.  Rice will attempt to validate a large object graph and cause the committee to go into exception routing.  Fix irb and iacuc committee submission when there is a protocol submission where routing to final will attempt to save protocol submission lite bo which are mapped to views.
  * Travis Schneeberger on Wed, 29 Jul 2015 17:20:13 -0400 [View Commit](../../commit/b426e1a655a5cfa2fe65c23855b42a937af66c8a)

##coeus-1507.68
*  fix doc handler url for iacuc committee document
  * Travis Schneeberger on Wed, 29 Jul 2015 16:31:40 -0400 [View Commit](../../commit/fc7f4ddfd623283524194f8a8811b3eb43571d61)

##coeus-1507.67
*  adding missing primary key attribute to iacuc submission lite bo ojb mapping
  * Travis Schneeberger on Wed, 29 Jul 2015 15:06:00 -0400 [View Commit](../../commit/9b07e4546212857e247de4bced114871e45071d4)

##coeus-1507.66
* allow modular budget actions from parent budgets in prop dev

  * As a proposal user, I need to build hierarchies to satisfy my multiple campus locations.
  * Currently, when I need to prepare a modular budget with a hierarchy, I cannot populate the Modular Budget screen in the Parent proposal.
  * The initiating child is designated as Modular, and populated the modular screen.
  * Additional linked child proposal budgets were also modular, and successfully populate the modular screen.
  * When I open the Parent proposal Budget > Modular Budget screen, I should be able to sync the detailed budget information to populate this screen, but the options are all grey - appearing in view only mode.
  * Nor can I manually add any details to the modular screen.
  * If the modular budget screen is not populated, then I cannot populate the NIH Modular Budget form. If my total budget is below $250,000 in direct costs, NIH requires that I submit a modular budget, else my submission will be rejected by eCommons. Some opportunities absolutely mandate use of modular budget types and I do not have the option to increase the dollar value of the budget to escape the restriction.
  * Joe Williams on Wed, 29 Jul 2015 08:14:14 -0500 [View Commit](../../commit/6b5e9ce0ca35a7975038e47d390c3e5753da28f4)

##coeus-1507.65
*  Trying to fix award budget intermittent issues.
  * Open an award budget document, navigate into any screen, aka Personnel.
  * I had been able to create an AB, and Edit it, but eventually, I get the 'not finished loading' message and have to exit out by means of selecting a portal, leaving a lock on the document.
  * Gayathri Athreya on Tue, 28 Jul 2015 16:05:32 -0700 [View Commit](../../commit/cc29147decd3a9ef49c13ccc7c8bdda32540a66a)

##coeus-1507.64
*  Budget print doesnt work after assigning a person to period fix

  * This removes an update line that was causing some fields to become null.  The line appears to be unneeded and fixes the bug by removing it.
  * bsmith83 on Tue, 28 Jul 2015 15:52:29 -0700 [View Commit](../../commit/45affb6fe7d235b65f83f8112edab9681d242e70)

##coeus-1507.63
* fixes issue where propdev documents are not editable
  * Joe Williams on Tue, 28 Jul 2015 16:54:05 -0500 [View Commit](../../commit/e1c7cc698212a8294887a518be3c09a1b6db358c)

##coeus-1507.62
* No Changes


##coeus-1507.61
*  Fixing error
  * Steps to reproduce:
  * 1.    Create a proposal with project dates 9/1/15 - 12/31/16 for example. Make sure the project end date is within one Calendar year but spans next fiscal year. In this example the project ends Calendar year 2016 but December 2016 falls into MIT’s F/Y 2017 which runs from 7/1/16 – 6/30/17.
  * 2.    Create detailed budget with default periods.
  * 3.    Add non-Personnel and Personnel expenses in each period.
  * 4.    Go to rates screen and adjust applicable rate to less than rate maintained. Save.
  * 5.    Go to Institutional Commitments U/R screen. Two Fiscal Years present. Add accounts and amounts. Save.
  * 6.    At top of same U/R screen do Data Validations > turn on. Error message shows warning for “Unrecovered F&A - The Fiscal Year is outside of the project period.”
  * This warning acts as error and prevents "Complete" budget which prevents routing.
  * Gayathri Athreya on Tue, 28 Jul 2015 12:31:44 -0700 [View Commit](../../commit/dc57197592f7a238c782ab29ca27827a1b36c2fd)

##coeus-1507.60
* revert unwanted changed
  * Joe Williams on Tue, 28 Jul 2015 13:29:47 -0500 [View Commit](../../commit/c93189ee4cf6b3b35e961a54800f124180eaaf63)
* fix STE when editing budget settings on hierarchy parent
  * Joe Williams on Tue, 28 Jul 2015 12:55:42 -0500 [View Commit](../../commit/b023e869dfe3576e86095cc84491fd9e78bd86b9)
* add validation on add proposal person to check for key person role
  * Joe Williams on Mon, 27 Jul 2015 13:59:13 -0500 [View Commit](../../commit/e8672434c80a4c99f1e23fa35fca2bceb810f88b)

##coeus-1507.59
* fixed error with expanding award note text
  * Joe Williams on Tue, 28 Jul 2015 09:48:18 -0500 [View Commit](../../commit/910160fa8e6b60bd5ce6447d63da60eec1cdfef4)

##coeus-1507.58
* Fixing proposal summary view in action list

  * When a budget exists the following error occurs
  * java.lang.RuntimeException: Exception evaluating expression: #view.editModes.containsKey(#budgetAuthConsts.ADD_BUDGET_EDIT_MODE) and !viewOnly and canEditView
  * blackcathacker on Mon, 27 Jul 2015 16:30:16 -0700 [View Commit](../../commit/0d44769e7675bb5e3bc6f2fb2433b73c0bc8face)
* Unable to submit to sponsor after blanket approve

  * When blanket approving a PD you are sent back to the portal and then if you try to reopen the proposal to submit to s2s or submit to sponsor you are unable to because the only link available is edit. This allows users to still take document actions regardless of the document being in view only mode.
  * blackcathacker on Mon, 27 Jul 2015 16:46:44 -0700 [View Commit](../../commit/8c3c8e7247f6d8553f78f1d813335cfa1de06121)

##coeus-1507.57
* Fix error in IP when trying to use Print Notice

  * When trying to print the IP notice when a noticeOfOpportunity has been selected you get an exception
  * blackcathacker on Mon, 27 Jul 2015 14:50:41 -0700 [View Commit](../../commit/a5591c00923645ebd6320ef8aaf3556ec4878433)

##coeus-1507.56
* Time and Money improvements
  * blackcathacker on Tue, 23 Jun 2015 15:38:27 -0400 [View Commit](../../commit/22d9d79e8a106eab0ab54a5c26c8c30d0e77b2f0)
* Fix issue with award special review and missing next values
  * blackcathacker on Mon, 27 Jul 2015 10:55:32 -0700 [View Commit](../../commit/ff099349a33fede777902a0f9e64ce8fa454922c)

##coeus-1507.55
* Using Comparator.comparing and helper method
  * blackcathacker on Fri, 24 Jul 2015 19:54:15 -0700 [View Commit](../../commit/143325aaa6c528d4a5bf63fcb80facf8be4d9cd7)
* Use funding proposals instead of award versions
  * blackcathacker on Tue, 23 Jun 2015 14:59:37 -0400 [View Commit](../../commit/ba66e750155171e37c718d80351dcb34f659d4f5)
*  more UR fixes
  * Gayathri Athreya on Fri, 24 Jul 2015 16:37:56 -0700 [View Commit](../../commit/6e5bbb939abdadd2dcd807d16d69c51b2344170b)

##coeus-1507.54
* add short url link
  * Joe Williams on Thu, 23 Jul 2015 10:13:19 -0500 [View Commit](../../commit/2e3e6d4a2d601a9439f7bd008eed0adbf30130e8)

##coeus-1507.53
* No Changes


##coeus-1507.52
* Adding a profile to cleanup node since these are generated artifacts of the build process.
  * Travis Schneeberger on Fri, 24 Jul 2015 10:48:02 -0400 [View Commit](../../commit/15a13cd315fd821d33a433163b03939fd4359918)

##coeus-1507.51
* Award and T&M Improvements
  * blackcathacker on Tue, 23 Jun 2015 11:38:33 -0400 [View Commit](../../commit/21087b492d8d05f38482a08bc66601a2179ab683)
* Data conversion to support new status column
  * blackcathacker on Thu, 23 Jul 2015 12:34:07 -0700 [View Commit](../../commit/f69bdc3dd1f888ca7aa5b4a310016522c4231604)
*  Time and money document status performance
  * Brandon Nicholls on Mon, 22 Jun 2015 16:16:25 -0400 [View Commit](../../commit/7160ff88e64918afdebc52cb5cbb3b2668e3d8f7)

##coeus-1507.50
* No Changes


##coeus-1507.49
* No Changes


##coeus-1507.48
* make the protocol history tab load fater
  * Travis Schneeberger on Thu, 25 Jun 2015 17:18:36 -0400 [View Commit](../../commit/e8e055d141ebed93732fdacce9991d0510499cd5)

##coeus-1507.47
* No Changes


##coeus-1507.46
* Fixed several issues with Data Conversion RoleMember -> document_access conversion.

  * 1. after converting only the KRIM_ROLE_MBR_ATTR_DATA_T entries were removed leaving KRIM_ROLE_MBR_T entries with no attribute data. I altered to remove the role member from both tables.
  * 2. the compare method used to filter duplicate document access role members was incorrect causing data loss. The compare was only comparing document number so for a given role if more than one principal was a member only one would get converted and the others would be lost. I corrected the compare to fix this issue while still removing true duplicates.
  * 3. We found role member records in our database with null document id attribute. So I added a check to ignore these.
  * Travis Schneeberger on Wed, 22 Jul 2015 14:22:04 -0400 [View Commit](../../commit/106ffc5c0ed22e9d637e9028a4fbdb4ac2f0d1cb)

##coeus-1507.45
* Add 'edit' buttons to read-only instances of Kuali Research Docs

  * As a user I need to be able to begin editing a document that is entered via read-only mode. This already works for Inst Prop and Award. Needs to be added to Prop Dev and any compliance docs where applicable. Should only show up when user otherwise would have edit permissions.
  * Joe Williams on Mon, 20 Jul 2015 17:02:52 -0500 [View Commit](../../commit/18cc0437c270003c345bb79bf4629bf4c18a4d0e)
* Update Grants.gov for SHA-2, port 443, TLS-1.1/1.2

  * Grants.gov needs to be updated. Details on certificate and port requirements:
  * Additionally, you must utilize Port 443 with the SHA-2 based digital signature. Please note that all intermediate certificates in the certificate chain must also be SHA-2 in order to work with port 443.
  * Port 443 will only support:
  * SHA-2 Certificates
  * TLS v1.1 and TLS v1.2

  * Port 446 will be discontinued soon. MIT has already moved to the new port/transport mechanisms. We can grab their code from Geo's repo.
  * Joe Williams on Tue, 21 Jul 2015 13:25:33 -0500 [View Commit](../../commit/b0bc615492063caaac0f612c789663a9d312b705)

##coeus-1507.44
*  fix issue with budget line item group names displaying wrong

  * When a budget line item group name is blank and not null extra parentheses are added to the groupname. These extra parentheses cause issues when opening the detail and rates modal.
  * Joe Williams on Wed, 22 Jul 2015 16:41:03 -0500 [View Commit](../../commit/9bab1bf73efdeed2025b07001b270a7fe861715d)
*  removal of the target tag
  * Abraham Heward on Wed, 22 Jul 2015 13:30:47 -0700 [View Commit](../../commit/5e04fe7a37c7c393a7ab664c5b3d764cc783ce62)

##coeus-1507.43
* Fix jenkins build by moving node install directory to working directory
  * blackcathacker on Wed, 22 Jul 2015 12:48:33 -0700 [View Commit](../../commit/00c9a2866284141c5dc7fd32dffa4ac09ca8d9a5)
*  Improvement to All My Proposals Search person fields

  * This commit adds/fixes aggregator, participant, and initiator fields on proposal search.  Changes what All My Proposal retrieves to include aggregator and pi,coi,and mpi for proposals for the current user.Improves some of the logic around how these searches work - unfortunately it is still sub-optimal due to a bug in Rice, see jira https://jira.kuali.org/browse/KULRICE-14269.  Includes small performance improvements due to these changes and using server side paging.
  * bsmith83 on Wed, 15 Jul 2015 10:09:43 -0700 [View Commit](../../commit/a2427487acb43ead29e54f3ef99ed033390b1f78)
*  Fixing underrecovery
  * Create a proposal type Research.
  * Create a budget;
  * in Settings: select Rate Type of TDC and select Unrecovered Rate Type of MTDC
  * in Rates screen: set TDC rate to 10%
  * Add budget non-personnel expenses and generate periods
  * Review calculated Rate in budget item Details modal: TDC rate calculates correctly.
  * But UR is negative value
  * Review the P&T screen: note negative UR amount in column.
  * Open Commitments> Unrecovered F&A screen. System says no UR generated.
  * There SHOULD be UR because the TDC rate = 10% and the MTDC is 56%.
  * Gayathri Athreya on Wed, 22 Jul 2015 10:04:44 -0700 [View Commit](../../commit/9a5773aa89f083a4d916b7c0988e892bbd134b34)
* Summary service rest API documentation
  * blackcathacker on Fri, 17 Jul 2015 19:51:18 -0700 [View Commit](../../commit/4ec81dc72fe61e3cd01f4757d4815f69baad3358)

##coeus-1507.42
* add create amendment permission to iacuc admin role
  * Joe Williams on Wed, 22 Jul 2015 08:48:05 -0500 [View Commit](../../commit/6ab5d0f1c2b163f7d72853bdbde7e278718da6d4)
* fix ip attachment validation

  * When IP Attachment type is turned on (INSTITUTIONAL_PROPOSAL_ATTACHMENTS_FLAG) and user adds an attachment type to pending IP, If user accesses the IP via document search then an error message appears on screen without the ability to clear it.

  * Steps to reproduce

    create a proposal log
    create an institute proposal from the proposal log
    blanket approve
    turn on IP attachments (INSTITUTIONAL_PROPOSAL_ATTACHMENTS_FLAG to Y)
    for maintenance, add a type for IP Attachment type
    find IP and edit
    select the attachment type
    add an attachment
    remember IP document number
    save and close IP
    search Doc search for IP and open

  * Error message appears on screen and does not allow user to navigate to other screens
  * Joe Williams on Tue, 21 Jul 2015 08:23:05 -0500 [View Commit](../../commit/106de79aad859ce32b83a865f1fd23537ea6a2d3)

##coeus-1507.41
* switching to bitronix, removing xapool and jotm support
  * Travis Schneeberger on Tue, 21 Jul 2015 13:29:19 -0400 [View Commit](../../commit/4a237f351230842779994495a372bb328120d5e2)

##coeus-1507.40
* No Changes


##coeus-1507.39
* No Changes


##coeus-1507.38
* No Changes


##coeus-1507.37
* No Changes


##coeus-1507.36
*  Fix for copy dialog STE on ownedByUnit readonly replacement

  * Read-only replacement was causing an issue with the copy dialog because those fields dont exist on the object for the dialog copy object, copy is never read-only so this removes the replacement
  * bsmith83 on Mon, 20 Jul 2015 11:48:55 -0700 [View Commit](../../commit/b0e85c6f63a7803023f1d391b37ebdaf19fa0ced)

##coeus-1507.35
*  creating lite bo for protocol submission to help committee maintenance performance
  * Travis Schneeberger on Wed, 24 Jun 2015 14:51:54 -0400 [View Commit](../../commit/5440f35e53dcfeecebc01eb690dc619db46fe1e6)

##coeus-1507.34
* fix broken iacuc validation preventing submission
  * Joe Williams on Thu, 16 Jul 2015 14:31:36 -0500 [View Commit](../../commit/b22d404797541ea63f320f00b4c291201fed146b)
*  restore valid krms actions to PD and budget contexts
  * Joe Williams on Thu, 16 Jul 2015 14:06:29 -0500 [View Commit](../../commit/8b0ed453a48fe0f03bb09f4cb665eb171562ed55)
* added dialog to edit notification message and subject when sending certification notification for single users

  * As a system Admin I set the 'Prompt User" option to "on" for the Maintenance Documents> Notification >Proposal Person Certification Request Notification)
  * Currently: the Notification is not generating in proposals for the user to customize the message since the addition of RESKC-504 contribution.

  * Steps:
  * Create a proposal.
  * Add several Persons to Key Personnel (PI, several Co-I's).
  * Click the "Notify" option on a person row.
*Result*: Notification is immediately sent.
*Desired Result*: If Prompt User flag is set to On for this notification, a notification window should present to the user allowing the standard notification options.
  * Joe Williams on Thu, 16 Jul 2015 13:05:46 -0500 [View Commit](../../commit/2d333bc46f2f84fb3018a2fcc7b430e7af1ecc71)
*  Online review not getting created for non-employee reviewer and then protocol cannot be approved
  * Steps to reproduce:
  * As IACUC Admin:
  * Create new IACUC committee.
  * Add a non-employee person as a voting member. Set dates and role so the person is active.
  * Make sure there are enough members for the quorum not counting the non-employee member.
  * Complete the rest of the Committee info and blanket approve.
  * Create a new IACUC protocol and submit.
  * Modify submission request and assign to committee just created. Set as Designated member review (don’t think the review type matters) .
  * Make the non-employee reviewer an assigned reviewer (committee, secondary, or primary).
  * Submit.
  * Go to Online review tab.
  * Results:
  * The online review for the non-employee reviewer is not set up. There is an empty review without a reviewer instead of a review for that reviewer. See screenshot-1.
  * If you attempt to create a new online review for that reviewer and submit, then you get:
  * java.lang.IllegalArgumentException: the personId is null or empty
  * Gayathri Athreya on Wed, 15 Jul 2015 17:19:59 -0700 [View Commit](../../commit/869410ee2afddc052d710409bb749ae93fd5f953)

##coeus-1507.33
*  Inactive indication on inactive units on in progress/old proposals
  * bsmith83 on Wed, 15 Jul 2015 14:39:25 -0700 [View Commit](../../commit/fb7d691698459ed04963ded59f43acd7c514ae80)
* Fix bug with unit hierarchy maint expand all

  * Code to ensure page has finished loading was broken on the unit hierarchy page. This fixes that by adding approriate span to allow script to determine if entire form has loaded.
  * blackcathacker on Wed, 15 Jul 2015 14:12:06 -0700 [View Commit](../../commit/205ea78ad4e420a8513f69ef5027d23d95ecb031)

##coeus-1507.32
*  reviewers available for designated review
  * Travis Schneeberger on Wed, 15 Jul 2015 11:49:19 -0400 [View Commit](../../commit/f52c42538e961fbf118c426dcf55aaf5862b5da4)

##coeus-1507.31
* short url service for quick access to specific records

  * As a user, I want a short URL that I can save that will always resolve/redirect to the correct record in the system.  If a document can be versioned, then the URL should resolve/redirect to the most current active version.
  * Joe Williams on Mon, 13 Jul 2015 10:12:48 -0500 [View Commit](../../commit/b6131bfbf2f21357aeb169cd9dec6da4405b8b9a)

##coeus-1507.30
*  Inactive Units Still Show up in Proposal Development Lead Unit Dropdown List

  * Previously, the inactive units would be selectable as an option for new proposals, this fixes that issue.  Read-only unit values in existing proposals still display inactive units correctly.
  * bsmith83 on Tue, 14 Jul 2015 15:01:17 -0700 [View Commit](../../commit/211e41a24589ee22a07ba71ef8272bc719ee8592)

##coeus-1507.29
*  Cannot save existing committees
  * Steps to reproduce:
  * 1. Create new IRB cmt doc.
  * 2. Fill out required fields, save, close.
  * 3. Reopen doc from doc search and save.
  * 4. Business rules failure on all required fields even though these fields are populated.
  * Gayathri Athreya on Tue, 14 Jul 2015 14:35:04 -0700 [View Commit](../../commit/e4e83eae94a18ce8b6603d46b2521da80d73b165)

##coeus-1507.28
*  Fix for invalid start and end date issues with proposal number

  * Previously, the first screen of Proposal Development would let a user through if there was a failing save business rule, and not give the new doc a proposal number which had the potential to cause strange behaviors because some functionality that was now clickable relied on it.  This fix insures that the document can pass the business rules it needs to before creation of the proposal document to avoid creating/assigning un-needed document numbers and creating proposals with incorrect information.  Now the user will be stopped on the first screen if they enter invalid data.
  * bsmith83 on Mon, 13 Jul 2015 17:34:06 -0700 [View Commit](../../commit/a903cfc7565c01b6841cd71fdaf1ef3b463aef70)

##coeus-1507.27
*  Fixing validation constraint for principal investigtor id
  * Gayathri Athreya on Tue, 14 Jul 2015 11:14:42 -0700 [View Commit](../../commit/da650712e7f302e5a582dab99cb20ff9744bc67b)
* budget personnel perf improvements
  * Travis Schneeberger on Tue, 23 Jun 2015 13:33:07 -0400 [View Commit](../../commit/ed5a84ae31f5835b0af50d53b148af31a1abfc92)

##coeus-1507.26
*  Fix for STE in PD if proposal person certification answered by a proposal person during aggregator's sesson

  * If a user tried to update a certification at the same time as another user, this used to error in a optimisticLockException.  This fix checks the versions of the AnswerHeaders being saved and if their exists a newer version of the answer header, shows an error message which explains what happened - and updates the view with the most current answers and certification status/time.
  * bsmith83 on Thu, 9 Jul 2015 13:18:43 -0700 [View Commit](../../commit/ede7284d462eae80d1fd58640428bcaf0384fd82)

##coeus-1507.25
*  Fixing copy
  * On trying to copy a protocol from the lookup results, I get the following STE.
  * 2015-07-13 15:18:11,185 [http-bio-8080-exec-10] u:quickstart/d: ERROR org.apache.struts.actions.DispatchAction - Action[/protocolProtocol] does not contain method named 'actions'
  * java.lang.NoSuchMethodException: org.kuali.kra.irb.protocol.ProtocolProtocolAction.actions(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
				 at java.lang.Class.getMethod(Class.java:1786)
				 at org.apache.struts.actions.DispatchAction.getMethod(DispatchAction.java:348)
				 at org.apache.struts.actions.DispatchAction.dispatchMethod(DispatchAction.java:252)
				 at org.kuali.rice.kns.web.struts.action.KualiAction.dispatchMethod(KualiAction.java:173)
				 at
  * Gayathri Athreya on Mon, 13 Jul 2015 15:23:27 -0700 [View Commit](../../commit/ce269c9c35d23d063acf0d80d773ef636f4ae563)

##coeus-1507.24
*  Display contact address as opposed to prg address in other organizations panel.
  * Gayathri Athreya on Mon, 13 Jul 2015 08:51:05 -0700 [View Commit](../../commit/6b3d97476bb9a1deea8becb7fdb78cdffc48482e)
* rename
  * Gayathri Athreya on Mon, 13 Jul 2015 07:26:44 -0700 [View Commit](../../commit/cd147542980ea6b6e5a22bcd1d4412fb946c2cc9)
* adding indexes to help performance
  * Travis Schneeberger on Mon, 13 Jul 2015 09:54:34 -0400 [View Commit](../../commit/6aca467b73f81ecb32ab17aa2d96254561798643)
*  Fixing update user and additional update timestamp issues.
  * Gayathri Athreya on Wed, 8 Jul 2015 14:01:55 -0700 [View Commit](../../commit/46e70231a001d40fc66e4868e69d4675fa0c5b8d)

##coeus-1507.23
* code cleanup
  * Travis Schneeberger on Mon, 13 Jul 2015 09:23:56 -0400 [View Commit](../../commit/83bec91b4d909191207bf3a0e999077d971f6b54)

##coeus-1507.22
* No Changes


##coeus-1507.21
* make edit link show for committee for cancelled document
  * Travis Schneeberger on Tue, 23 Jun 2015 20:41:42 -0400 [View Commit](../../commit/33e1b3ad9404b5aa7de55ef4698db8e1a43b23c1)
* Fix cost_element being updated when adding personnel to PD budget

  * When using some db analytics tools it was noticed that PD Budget would sometimes persist changes to a maint doc maintained code table. This was incorrect and can potentially contribute to database deadlocks.
  * blackcathacker on Fri, 10 Jul 2015 11:36:57 -0700 [View Commit](../../commit/b6ce96f7bc0ae3e4d4b3ed14f546073e05f9ddfc)
* make the protocol history tab load faster by removing extra doc service call
  * Travis Schneeberger on Thu, 25 Jun 2015 17:31:56 -0400 [View Commit](../../commit/f58cb0c784b323a65aedbf561e738c2b56c8e555)
* make transactionIds load faster on award actions tab
  * Travis Schneeberger on Thu, 25 Jun 2015 11:03:32 -0400 [View Commit](../../commit/98abe6da08f754e768521b5659909a444ac50d2e)
* fix concurrent modification exception on print proposal budget
  * Travis Schneeberger on Thu, 25 Jun 2015 11:02:43 -0400 [View Commit](../../commit/2d8e3dd0641abe1855d6720fdcf62901b874048d)
* using a criteria rather than findAll
  * Travis Schneeberger on Thu, 25 Jun 2015 09:25:38 -0400 [View Commit](../../commit/4e003c318bbc837286a98d1746616b3aded05a52)
* preventing rice from materializing minutes on validation by making them not updatable, fixing minute maintenance when a cancelled committee document exists.
  * Travis Schneeberger on Wed, 24 Jun 2015 17:46:55 -0400 [View Commit](../../commit/2255bf3ce2781106d0c971916bee0bfda4d53dff)
* avoid concurrent modification exception in meeting minutes tag
  * Travis Schneeberger on Wed, 24 Jun 2015 14:35:45 -0400 [View Commit](../../commit/0411f2e9daab7466454e4db47852ed7bfa049d0c)
* irb go fast button to not execute values finder to retrieve ALL protocol persons
  * Travis Schneeberger on Tue, 23 Jun 2015 15:31:27 -0400 [View Commit](../../commit/b95cf9409a8c97667cb15123153b2b0199e28e01)
* budget personnel perf improvements
  * Travis Schneeberger on Mon, 22 Jun 2015 21:54:08 -0400 [View Commit](../../commit/f2db411a4e3673f14ec96a98969bccfa6e73001f)
* Fix error in streams modification
  * blackcathacker on Mon, 22 Jun 2015 13:03:12 -0400 [View Commit](../../commit/fd89f9e1ed3ca414ca943b73ea805c73c05714df)
* Only check for the most recent valid aai
  * blackcathacker on Mon, 22 Jun 2015 12:08:19 -0400 [View Commit](../../commit/6b30e9d0534a5b100cdc6373e4811c5ea4cc5717)
* remove html commented out code to avoid possible server-side execution that is not rendered and therefore not needed.
  * Travis Schneeberger on Mon, 22 Jun 2015 11:46:25 -0400 [View Commit](../../commit/7e418eaedd28367265274f84cde7b2f776bc2c3d)
* Caching getIndexOfAwardAmountInfoForDisplay
  * blackcathacker on Mon, 22 Jun 2015 11:01:59 -0400 [View Commit](../../commit/6ec4620d6260aeb2a3d35427b7a92db485041c5f)

##coeus-1507.20
*  Fix reviewer selections on IACUC document.

  * Code Review Comments
  * Travis Schneeberger on Fri, 10 Jul 2015 12:03:02 -0400 [View Commit](../../commit/7cb276d7eedf8397dae878a61cbb3d61a55c1f5b)
* Restore inprocess and page loading alerts
  * blackcathacker on Thu, 9 Jul 2015 19:15:00 -0700 [View Commit](../../commit/dfdc8858f5a12a7e344931ec0c7e94cbde6b9494)
* When integration tests fail to startup correctly avoid attempting a startup for each test.
  * Travis Schneeberger on Thu, 9 Jul 2015 16:23:53 -0400 [View Commit](../../commit/078d8290ab83a4a35691813e649546e4920e6a0f)
* Replaces Jetty with Tomcat for Integration Tests
  * Travis Schneeberger on Thu, 9 Jul 2015 14:08:30 -0400 [View Commit](../../commit/f09bacdc513c2502313c9f546d04b86ea2b0a25e)
* create unit hierarchy proposal creator and modify proposal roles
  * Joe Williams on Thu, 9 Jul 2015 14:34:54 -0500 [View Commit](../../commit/9aa336a445b4ac86ba6c1515c04173b7b7c91df7)
*  Fix reviewer selections on IACUC document.

  * To reproduce:
  * Create IACUC protocol
  * Submit for Review
  * Modify Submission Request:
  * -Assign to committee and schedule
  * -Make a reviewer "Primary" and some "Secondary"
  * Submit

  * Result:  Reviewer selections revert back to "Committee"
  * Travis Schneeberger on Wed, 8 Jul 2015 18:27:40 -0400 [View Commit](../../commit/22b673b29a4c70985671afc41e3f4842df49704e)

##coeus-1507.19
* No Changes


##coeus-1507.18
* Institutional Proposal Clean Up
  * Joe Williams on Wed, 8 Jul 2015 11:55:20 -0500 [View Commit](../../commit/0a48e026de25772ff928ef06ecf58d0c4f3b12e6)
* Move Permission Logic To Authorizers
  * Joe Williams on Fri, 19 Jun 2015 12:53:16 -0500 [View Commit](../../commit/a25316d5381e6d63eff544970f3fc848697f86a7)
* Sub Award Attachment Disable Removal Option
  * Joe Williams on Wed, 17 Jun 2015 15:21:57 -0500 [View Commit](../../commit/8c32c5c677ebd953bc818b6284c1d0173ac378c4)
* Award Attachment Disable Removal Option
  * Joe Williams on Wed, 17 Jun 2015 14:22:36 -0500 [View Commit](../../commit/9a40cea4bb867ae23d47380e9ff90f9355e396a5)
* Institutional Proposal Attachments
  * Joe Williams on Tue, 16 Jun 2015 16:36:26 -0500 [View Commit](../../commit/bf8dba85cdddb19620515382dd560eaf5fc8ba9f)

##coeus-1507.17
* No Changes


##coeus-1507.16
* remove unused javascript.
  * Travis Schneeberger on Thu, 9 Jul 2015 11:06:02 -0400 [View Commit](../../commit/f1fb451ffe48c976f412492c68069006140499e2)
* allow sub award budget non-personnel lineitem rates to be edited

  * User Story
  * As a budget creator or aggregator preparing a Subaward Budget for my proposal, I need to be remove the application of F&A rates In the Rates tab of the Details modal for these line items so that I do not have to request F&A on the first $25k of a subaward in a proposal when it is not appropriate to do so (for example, if the request is for supplemental funding for an existing subaward or for continuation funding.) I would expect that to add unrecovered F&A, but that may well be appropriate depending on how the school tracks that.

  * Steps to Reproduce

    Create a proposal with the dates 07-01-2016 to 06-30-2020 or dates that correspond to your subaward file
    Navigate to Budget and create a new budget version
    Go to Subaward tab
    Add a new subaward
    Search for and select any subaward organization
    Attach a subaward R&R file like the one attached here
    Click Add Subaward
    System will read dates and amounts and translate into non-personnel correctly
    Navigate to Non-personnel and view amounts
    The system should allow user to modify the F&A Rates inclusion, but currently subawards are not editable

  * Background:
  * FE issue: provided to MIT Coeus users in 4.5.1.P.2 as missed requirement for the subaward upload tool. (COEUSQA-4060)
  * Allow the users to turn off OH calculation on these line items that are added by subaward extraction tool. Currently line items added by extraction tool does not allow users to override OH calc flag. The line item details for the lines inserted by the Subaward Budget Upload process needs to let the user to uncheck the F&A ("MTDC") the first $25K cost element line of the subaward costs even though they are normally subject to institutional F&A. As noted by users, there are times when it is not appropriate to request F&A on the first $25k of a subaward in a proposal, if the request is for supplemental funding for an existing subaward or for continuation funding.

  * Acceptance Criteria
  * Given a user is logged in with 'Modify Budget' Permission to add a new subaward budget R&R file to the budget subaward
  * When the user Adds the subaward
  * Then:

    The system shows the direct and indirect costs of subaward as line item expenses in the non-personnel section of the budget (as it does now)

  * When the system adds direct and indirect line items for the subaward
  * Then:

    The system allows the user to view details of each subaward line item, including the rates
    The user may modify the apply rate option of the details modal to include or not include the application of a specific rate

  * Given a user is logged in with 'Modify Budget' Permission to add a new subaward by entering direct and indirect costs to the budget subaward details modal
  * When the user Saves the subaward details
  * Then:

    The system shows the direct and indirect costs of subaward as line item expenses in the non-personnel section of the budget (as it does now)

  * When the system adds direct and indirect line items for the subaward
  * Then:

    The system allows the user to view details of each subaward line item, including the rates
    The user may modify the apply rate option of the details modal to include or not include the application of a specific rate
  * Joe Williams on Thu, 9 Jul 2015 08:50:58 -0500 [View Commit](../../commit/8c36c7ab04c48ceccdc073d494710131c2b3c2ef)
* Support p6spy through the dev maven profile
  * blackcathacker on Wed, 8 Jul 2015 12:20:07 -0700 [View Commit](../../commit/e81a671cbb1d8729c866afd99ccb01a805923ac3)

##coeus-1507.15
* Using absolute urls in global kns javascript file to avoid 404s due to bad paths.  This fixes the broken loading image on the loading screen.
  * Travis Schneeberger on Thu, 9 Jul 2015 08:51:30 -0400 [View Commit](../../commit/1edc6b767164af876cd820f3d6bc9c79fbdfa350)

##coeus-1507.14
* Remove integration test for removed logic
  * blackcathacker on Wed, 8 Jul 2015 16:11:01 -0700 [View Commit](../../commit/065827b774f952078968db71670688fc6b6765e6)
* Remove dwr script that no longer exists.
  * Travis Schneeberger on Wed, 8 Jul 2015 18:58:37 -0400 [View Commit](../../commit/40ed4ed219d88635ad9afc798654764c56522f47)
* Avoid Java8 concurrency issue with sorting on Award Reporting

  * Due to Java 8 handling of sorting and iterator concurrency modification you will recieve this error when payment terms have been added to the award
  * ```
  * java.util.ConcurrentModificationException
        at java.util.ArrayList$Itr.checkForComodification(ArrayList.java:901)
        at java.util.ArrayList$Itr.next(ArrayList.java:851)
        at org.apache.taglibs.standard.tag.common.core.ForEachSupport$SimpleForEachIterator.next(ForEachSupport.java:153)
        at org.apache.taglibs.standard.tag.common.core.ForEachSupport.next(ForEachSupport.java:175)
        at javax.servlet.jsp.jstl.core.LoopTagSupport.doAfterBody(LoopTagSupport.java:330)
        at org.apache.jsp.tag.webaward.awardReportClasses_tag._jspx_meth_c_005fforEach_005f4(awardReportClasses_tag.java:2138)```
  * blackcathacker on Wed, 8 Jul 2015 15:22:17 -0700 [View Commit](../../commit/9613562ad80b7494919234e707eabb8b0d2f83e0)
* disable severity sorting since we are grouping by severity
  * Joe Williams on Wed, 8 Jul 2015 15:40:44 -0500 [View Commit](../../commit/8604eac562232fb2929c0c5fef9fa2b8231f1fbe)
* avoid concurrent modification exception in budget rates, create a new utility function to use in jsps & tags

  * Due to budget rate types getter doing an inline sorting, Java 8 now reports a concurrent modification exception during JSP iteration and access.
  * Travis Schneeberger on Wed, 24 Jun 2015 13:06:41 -0400 [View Commit](../../commit/ae9dd041143e5a65bd9f238910ad3a85a4e3f82f)
*  Prevent the deletion of the last budget period

  * This adds an error message with suggestions on what to do when the user attempts to delete the last budget period on a budget.  This prevents the budget/proposal from breaking from a 0 period budget.
  * bsmith83 on Tue, 7 Jul 2015 18:14:35 -0700 [View Commit](../../commit/88a39689fd457acf7dd6390ed418da93e50583d2)
*  rule cleanup
  * Travis Schneeberger on Wed, 8 Jul 2015 10:06:27 -0400 [View Commit](../../commit/7fa3a6fcc79a1c8a2d93cbb719ed61849bb933d0)
*  Remove Negotiation follow up date validation
  * Travis Schneeberger on Wed, 8 Jul 2015 09:59:31 -0400 [View Commit](../../commit/a604812980b3775ce6dab8517c24d3a7bb2a32a1)
*  Removing unused KRMS Validation Actions
  * Travis Schneeberger on Wed, 8 Jul 2015 09:48:11 -0400 [View Commit](../../commit/8ffbc9f18f479f4e4daf1b97ca8a5d9066179a7f)

##coeus-1507.13
* revert changes to ProtocolFormBase that were causing issues

  * Create a protocol
  * Submit and approve protocol
  * On approved protocol, take create an amendment action (A001)
  * Select section (like "General Info"), add comment, submit
  * Close amendment A001
  * Go to original, approved protocol
  * Create another amendment (A002)

  * Actual Result: User can select the same section as selected on A001. After submitting A002, the section is now editable in both A001 and A002 at the same.

  * Expected Result: User cannot select the same section as selected on A001. The system should prevent the user from being able to amend the same section in more than one amendment in progress.
  * Joe Williams on Wed, 8 Jul 2015 08:00:01 -0500 [View Commit](../../commit/f04f7e6bc1ee7862b6b507d38eadbb3901433c22)
*  Adding missing primary key columns and constraints
  * Travis Schneeberger on Tue, 7 Jul 2015 16:40:56 -0400 [View Commit](../../commit/eaf72e3e589d6bb08685f95c80d1f9f2a4666a76)

##coeus-1507.12
* add prompt to warn users before they apply line items to later periods

  * If changes are made to a future year's existing expense via the Save and Apply to Other Periods, the user should confirm that change will impact future years, otherwise they may be surprised when data was unintentionally overwritten.
  * (see screenshot)

steps to reproduce
  * Create a budget
  * Add non-personnel expense
  * Select Details to Save and Apply to Other Periods
  * Open Details again, change the amount and choose Save and Apply to Other Periods,

  * Current Result: following year expense is automatically updated to reflect change and any inflation.

  * Expected Result: user should see message to confirm before change is made
  * "There is already a line item on period 2 based on this line item. Do you want to apply changes to existing items on later periods? Yes or No"
  * After user confirms, then the following year expense should update to reflect amount change including any inflation, if inflation was selected
  * Joe Williams on Tue, 7 Jul 2015 10:06:20 -0500 [View Commit](../../commit/59fa4fe900c44a6c4e3efe7ed93fd54bde993a15)

##coeus-1507.11
*  upgrading ojb to fix a concurrency issue under heavy load.
  * Travis Schneeberger on Tue, 7 Jul 2015 14:11:26 -0400 [View Commit](../../commit/c6410385351fe187f79d5c1e88a4716f576bb56c)
* only run cost share and unrecovered audit rules if flag is turned on

  * Changed parameter BudgetUnrecoveredFandAEnforcementFlag to N.
  * (This should allow the user to mark a budget complete without distributing the unrecovered f&A.)
  * Created a new proposal type = Research
  * Created a budget version.
  * Added a Non-Personnel Line Item (Other > Conference Expenses) for $10,000
  * Edited the line item details and unchecked apply MTDC.
  * Saved.
  * Generated all periods
  * Opened Commitments screen > Unrecovered F&A. Confirmed amounts exist.
  * Clicked Complete: got validation errors that the UR must be distributed.

  * Expected result: The budget should have been able to be completed because the enforcement flag was set to N prior to creating this proposal and budget.
  * Joe Williams on Tue, 7 Jul 2015 12:25:26 -0500 [View Commit](../../commit/4fcb55b2b7ecd85d7f9466287356389d47993986)

##coeus-1507.10
*  Fix to search on OSP Administrator for awards

  * Previously the search was looking at the wrong table to pull out osp adminstrator ids for the search, this corrects this and searches within the object returned for the OSP administrator.  This also adds a quickfinder and changes the search to use username for OSP administrator.  Caveat: If there are multiple OSP administrators for a single award, the one you you search on may not be the one shown in the results as it only shows the first OSP Admin in the result rows.
  * bsmith83 on Mon, 6 Jul 2015 18:39:28 -0700 [View Commit](../../commit/47323a7744291659a4940ec0d54f8e676e489ef3)

##coeus-1507.9
*  Fixing update timestamp for award amount info
  * Disrupts reporting.
  * Subsequent routing of T&M docs in award, changes the update timestamp of previous award amount info entries in the table. While routing a T&M doc, only the update timestamp field of the award amount info entries for that doc should be updated.
  * Gayathri Athreya on Mon, 6 Jul 2015 15:27:02 -0700 [View Commit](../../commit/6186a4a6fd21fe12b1abdb2ccfe0c6d46ec4b60e)
* fix view attachment from IACUC Summary and History

  * In a new IACUC protocol add two attachments and navigate to IACUC Protocol Actions/Summary and History/Summary . Click "view" action for the two attachments displayed in Summary.
  * Result: Clicking "view" does not perform any action. The files do not open.
  * Joe Williams on Mon, 6 Jul 2015 14:31:54 -0500 [View Commit](../../commit/0f508705a49d5adfb981b8241563b8da68edd32f)
* sort data validation screen

  * Steps to Recreate
  * 1 Create a New Proposal Development Document
  * 2 Connect to S2S opportunity PA-C-F32
  * 3 Turn on Validation
  * When you do this there is a long series of validation errors, and apparent sort logic. There are also no sort options for this table.
  * In KNS the Validation screen sorted out your errors from your warnings, from your Grants.gov errors and warnings.
  * Can sort functions be built into this table? I don't think we need anything more involved then default behavior sort icons for the headings, but that would go a long way towards avoiding any regression from the KNS validation organization.
  * Joe Williams on Mon, 6 Jul 2015 13:54:38 -0500 [View Commit](../../commit/19b54cfd919444f1714c65aa1e00eb991cd750a8)

##coeus-1507.8
* No Changes


##coeus-1507.7
* Changing unit back to a dropdown but using the advanced select box which includes a filter

  * This change will return the lead unit select to a drop down but using the advanced drop down currently in use by keywords and other places that also includes a filter such that a user can free-form type a partial number or name for the unit and have the displayed lists restricted by that value.
  * blackcathacker on Mon, 6 Jul 2015 10:47:26 -0700 [View Commit](../../commit/908fbbc3cb3f89e622870414aa647f4126227072)

##coeus-1507.6
* display correct messaging on lookup resutls if the search is bounded

  * when some searches hit the upper limit for returned results, the system does not provide a message to user that not all results are displayed. 3 lookups found so far with no upper limit message:
  * The SysAdmin->Person lookup in Training
  * Unit lookup
  * KCPersonExtendedAttributes lookup
  * Joe Williams on Mon, 6 Jul 2015 09:40:31 -0500 [View Commit](../../commit/939a5fa9fbf635c6be6e70350f53e97f40c6bae2)
* Updating project docs to reflect supported Maven version
  * Travis Schneeberger on Mon, 6 Jul 2015 10:29:34 -0400 [View Commit](../../commit/016fb17106b439a5bde10c0b62ecdfe33def8db8)

##coeus-1507.5
* RESKC-403 Fix to use id wildcards in combination with other properties for Proposal Lookup

  * This was a bug in the lookupable code that would assume if id was entered it was the actual full id and would ignore some other properties entered, this corrects this and expands on the searches in a couple fields which use people by allowing username, person id, full name, and last name as valid search values for those fields.  It also corrects an error with bad values being inserted into the database that caused the fullName stored to have 2 spaces inbetween first and last names which previously caused Full Name searches to fail on the fields above.
  * bsmith83 on Thu, 2 Jul 2015 18:19:02 -0700 [View Commit](../../commit/6597e9e0db5cdd8dcb737b4f7872f4dbe0c8b641)
*  Fixing proposal copy
  * Tried to copy proposal (status Approved and Submitted) from search results Action link "Copy"
  * (proposal had no subawards)

  * In Copy modal:
  * Selected same lead unit 264000
  * Selected:
  * Copy budget, final version
  * Copy Attachments
  * Copy Questionnaire.
  * Clicked Copy. Got error message (see screenshot) and STE below.

  * Tried again
  * All same selections but did not select to include Attachments.
  * Same errors & STE

  * STE:

  * Stacktrace (only in dev mode)

  * java.lang.RuntimeException: An error occured while trying to copy the proposal development document.
  * at org.kuali.coeus.propdev.impl.copy.ProposalCopyServiceImpl.copyProposal(ProposalCopyServiceImpl.java:239)
  * at org.kuali.coeus.propdev.impl.copy.ProposalDevelopmentCopyController.copy(ProposalDevelopmentCopyController.java:62)
  * Caused by: org.kuali.rice.krad.exception.ValidationException: business rule evaluation failed
  * at org.kuali.rice.krad.document.DocumentBase.validateBusinessRules(DocumentBase.java:521)
  * at org.kuali.coeus.sys.framework.model.KcTransactionalDocumentBase.validateBusinessRules(KcTransactionalDocumentBase.java:146)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.validateAndPersistDocument(DocumentServiceImpl.java:876)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.validateAndPersistDocumentAndSaveAdHocRoutingRecipients(DocumentServiceImpl.java:502)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.saveDocument(DocumentServiceImpl.java:156)
  * Gayathri Athreya on Thu, 2 Jul 2015 12:32:44 -0700 [View Commit](../../commit/50a08c95453104169de26d94960edfd8337fd22d)
*  Adding confirmation dialog.
  * PD Budget – Need a confirmation/warning prompt when user hits the Delete icon on Periods and Totals
  * We have had multiple users report that they have mistakenly deleted Period 1 of their budget by clicking on the "trash can" icon under the Actions header in PD Budget > Periods and totals.
  * There is no warning or confirmation message given to the user, and the deletion is immediate.
  * Gayathri Athreya on Thu, 2 Jul 2015 11:41:03 -0700 [View Commit](../../commit/91dff255d9fa02474e77ab00d173611b6468cd84)

##coeus-1507.4
* fixes issues when adding coi role to an instituional proposal

  * Steps:

  * Create Proposal Log

    Click on Central Admin
    Click on + sign by Proposal Log
    Enter Document description
    Select Proposal Type (New)
    Enter Title
    Lookup PI and return value
    Lookup Sponsor and return value (NIH)
    Save and copy or write down Proposal Number
    Submit

  * Create IP

    Click on Central Admin tab
    Search for Institutional Proposal
    Enter or paste Proposal Number from steps
    Search for Proposal Log
    Click on Proposal Number to open document
    Enter Document description
    Leave status as Pending
    Verify Sponsor and Program info
    Select NSF Science code (Medical - Life Sciences)
    Goto Financial panel
    Enter Requested Start and End dates
    Enter Total Direct Costs and F&A
    Click recalculate
    Goto Contacts Tab
    Search to Add Employee
    Return value
    Choose Project Role (CO-I , or Key Person)
    Click to Add person

  * Expected Behavior:

  * You would see panels for Combined Credit Split and Unit Contacts
  * You would see Action buttons on bottom of page to Save/Close etc

  * Actual Behavior

  * There is nothing below Project Personnel panel

    Click on any tab to exit page
    Get HTTP Status 500 error (see attached)
  * Joe Williams on Tue, 30 Jun 2015 14:01:16 -0500 [View Commit](../../commit/dd5645ca605a59dbe79e6e3fae8bf3785941b2ac)

##coeus-1507.3
* return user to landing page when canceling/closing proposal log

  * Steps to Reproduce
  * 1. In the KRAD portal, Central Admin tab > Pre-Award > Proposal Log, create a proposal log,
  * 2. Then cancel rather than submit/blanket approve.
  * Result: User is returned to the System Admin Portal, and must select KRAD portal.

  * Expected Result: User should be returned to the KRAD portal.
  * Joe Williams on Thu, 2 Jul 2015 08:54:29 -0500 [View Commit](../../commit/04147d723be04e2c7de31618a73e1ce7b698c689)

##coeus-1507.2
* RESKC-397 Rice update - people flow route log annotation fix
  * bsmith83 on Wed, 1 Jul 2015 09:01:00 -0700 [View Commit](../../commit/f12e907ac0a8a4e0f63eebe661d2ec705a120baa)
* Display print actions on award budgets

  * Customer updated from 5.2.1 to 6.0 asked for instructions on how to print Award Budget.
  * 6.0 is missing the Actions > Print Forms panel!

  * Award > Budget Versions(tab) > Open (budget) > Budget Actions (tab) > Print Forms (panel)
  * Joe Williams on Wed, 1 Jul 2015 10:36:21 -0500 [View Commit](../../commit/e2e11ad64849dcf0b155be4b5d8e7db47bc9e07f)

##coeus-1507.1
* RESKC-571 Fix to notes on protocols 'appearing' to overwrite eachother - tag file exception

  * Fix to the getter method sorting the content of the notes  list  (in reverse order)  each time it was called causing concurrent modification exceptions when it was iterated over by the tag file.  Instead new notes are now inserted to the top of the list
  * bsmith83 on Tue, 30 Jun 2015 18:11:30 -0700 [View Commit](../../commit/1e214160a9736b59a91f4ebef719648922d02d40)
* RESKC-344 Changed lead unit selection from dropdown to suggest field

  * Changes the lead unit field in proposal details and proposal copy to a suggestion based field that limits results based on what the user types
  * bsmith83 on Tue, 30 Jun 2015 09:25:30 -0700 [View Commit](../../commit/e38a69e8b2cc22cf57e217c19d3700305c79ff72)

##coeus-1506.73
* fix issue with adding award personnel details for rolodex and to be named

  * Steps To Recreate:

  * 1.) Create and Submit Award
  * 2.) Create and Submit T&M Doc for Award
  * 3.) Create Award Budget for Award
  * 4.) Add To Be Named Person.
  * 5.) Add Salary to To Be Named Person.
  * 6.) Add Personnel Detail for To Be Named Person.
  * 7.) Try To Save.
  * 8.) get STE

* SQLException during execution of sql-statement:
* sql statement was 'INSERT INTO BUDGET_PERSONNEL_DETAILS (BUDGET_PERSONNEL_DETAILS_ID,BUDGET_DETAILS_ID,LINE_ITEM_NUMBER,PERSON_NUMBER,BUDGET_ID,BUDGET_PERIOD,ON_OFF_CAMPUS_FLAG,PERSON_SEQUENCE_NUMBER,PERSON_ID,JOB_CODE,END_DATE,START_DATE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,APPLY_IN_RATE_FLAG,BUDGET_JUSTIFICATION,COST_SHARING_AMOUNT,COST_SHARING_PERCENT,LINE_ITEM_DESCRIPTION,PERCENT_CHARGED,PERCENT_EFFORT,PERIOD_TYPE,SALARY_REQUESTED,SEQUENCE_NUMBER,UNDERRECOVERY_AMOUNT,SUBMIT_COST_SHARING) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) '
* Exception message is [Column 'PERSON_ID' cannot be null]
* Vendor error code [1048]
* SQL state code [23000=INTEGRITY CONSTRAINT VIOLATION]
* Target class is 'org.kuali.coeus.common.budget.framework.personnel.BudgetPersonnelDetails'
* PK of the target object is [budgetPersonnelLineItemId=10]
* Source object: org.kuali.kra.award.budget.AwardBudgetPersonnelDetailsExt@28d9a5f8[serialVersionUID=4480947148039922420,budgetPersonnelLineItemId=10,budgetLineItemId=10,lineItemNumber=1,budgetId=1,budgetPeriod=1,onOffCampusFlag=true,budgetJustification=<null>,lineItemDescription=<null>,applyInRateFlag=true,personNumber=1,jobCode=AA000,periodTypeCode=3,personId=<null>,sequenceNumber=1,budgetPeriodId=1,personSequenceNumber=4,submitCostSharingFlag=true,costElement=400250,budgetCategoryCode=26,basedOnLineItem=0,quantity=0,lineItemSequence=1,groupName=,formulatedCostElementFlag=false,serialVersionUID=-6717116777934188909,serialVersionUID=8356817148151906918,updateUser=quickstart,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=1db3f017-cbbe-4d0b-a88a-29be036dcebb,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]
* The root stack trace is -->
* com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'PERSON_ID' cannot be null
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)
  * Joe Williams on Tue, 30 Jun 2015 17:04:18 -0500 [View Commit](../../commit/480b0e4c24b7f1750e766843da3cb98ba88ec038)

##coeus-1506.72
* RESKC-573

  * Checking for both 'Y' and 'Yes' when matching on the descends units flag.  * tdurkin on Tue, 30 Jun 2015 11:16:41 -0400 [View Commit](../../commit/e335202b4ada74d12ac27c56887b3510f2508db5)

##coeus-1506.71
* fix proposal credit allocation totals issue

  * Proposal Key Personnel Credit allocation calculations not accurate if one or more key personnel have three or four units assigned

steps to reproduce

    Create proposal
    add key personnel
    add two or three additional units for the person
    navigate to credit allocation
    add amounts to allocation and see that the figures to not sum correctly
  * Joe Williams on Tue, 30 Jun 2015 09:45:00 -0500 [View Commit](../../commit/f5a647c6bbd022514b6b8611552a4f007f047bc8)

##coeus-1506.70
* fix issue when copying proposal with manually entered sub award budgets

  * Copying Proposals that has Subaward budgets uploaded in the budget throws STE. You can copy proposal if you choose not to copy the budget.

  * At this point users cannot copy any proposals that has a subaward budget.

  * Comments: User is having an issue copying a budget version. Has a Subaward manually entered, not file upload. Get incident report when trying to copy budget.
  * Joe Williams on Mon, 29 Jun 2015 09:49:48 -0500 [View Commit](../../commit/237a8977a0de5b938038cd95a4c911417c6be333)
* display credit splits for award unit and persons home unit on award

  * 1. Create an Award, completing all required fields to save the document, enter the following for Lead Unit ID: IN-IN
  * 2. Click the Contacts tab
  * 3. Enter the following for Employee User Name: oblood
  * 4. Click Add to add OLBOOD as a Principal Investigator
  * 5. Click Save
  * 6. Observe the Unit Details and Combined Credit Split subpanels
  * Actual Behavior: The system displays a Unit Details subpanel row for the Lead Unit defined on the Award tab (IN-IN). The system does not display any rows for the Primary Department Code defined for the Person in the Person record (BL-RCEN). The system displays a Combined Credit Split subpanel row for the one Unit defined on the Unit Details subpanel (which is the Lead Unit entered on the Award tab).
  * Expected Behavior: The system should display a Unit Details subpanel row for the Lead Unit defined on the Award tab and a row for the Primary Department Code defined for the Person in the Person record. The system should display a Combined Credit Split subpanel row for each Unit defined on the Unit Details subpanel, one for the Lead Unit entered on the Award tab and one for the Primary Department Code defined for the person in the Person record.
  * Joe Williams on Mon, 29 Jun 2015 09:34:46 -0500 [View Commit](../../commit/78155087a4f526f691625685f801d4597f84a0cb)
* display correcct obligated amount and end date immediately upon adding award to subward

  * 1. Create and finalize an award.
  * 2. Create and finalize a T&M document for $50,000 using the Transactions panel for entering the amount.
  * 3. Edit T&M (which creates a new T&M document) and finalize it for $25,000 more using the Transactions panel for entering the amount.
  * 4. Create and finalize a subaward document, linking the subaward to the award created in step 1.

  * RESULT: The amount appearing in the Funding Source panel will show $50,000 in KC 5.0.1 and $0 in KC 5.1.

  * EXPECTED RESULT: The amount appearing in the Funding Source panel should be $75,000.
  * Joe Williams on Mon, 29 Jun 2015 08:34:33 -0500 [View Commit](../../commit/55a2efc019e2cf6c47e6f78122fa81d9d117814c)
* prevent users from being assigned derived roles on protocol copy

  * Steps to add derived role to a principle.

  * 1.) create protocol
  * 2.) add PI that is not current user
  * 3.) go protocol actions and copy protocol. (again be sure PI is not logged in user)

  * After you copy the protocol the PI is assigned the PI derived role, and will show up on every protocol as a PI.
  * Joe Williams on Fri, 26 Jun 2015 12:31:38 -0500 [View Commit](../../commit/1be730aacc797e9eb80a8bc3cb5b65ef403ba1e6)

##coeus-1506.69
* add certification questions update mechanism

  * User needs to be able to answer newly added certification questions rather than being forced to create a new proposal to answer new question

steps to reproduce

    start a new proposal document
    add key personnel
    close proposal
    maintain questionnaire to edit the proposal person certification questionnaire
    open the content section and use search lookup to add another question
    return the new question
    blanket approve document
    open proposal again
    navigate to proposal person certification

  * Results: the new question does not appear
  * Expected Results: the system should treat certification questions the same as all other questions and prompt user for update.

  * Acceptance Criteria:
  * As a user with the ModifyProposalDevelopmentDocument permission (ex Aggregator)

  * 1 When there is a new version of a proposal person certification questionnaire
  * Then:

    The system should tell the user that a new version of the questionnaire has been published and an update is required.
    Then:
    The user should then be prompted to instruct the system how to update the questionnaire

  * 2 When the user chooses to "copy the answers from the old version of questionnaire to the new one. Only questions that have been changed in the new version will have to be answered."
  * Then:

    The system will update questionnaire to show the newest questionnaire version and will retain answers to any questions that had previously been answered
    The system will not delete any answers

  * 3 When the user chooses the option "Do not copy answers from previous version of the questionnaire. Every question in the new version of the questionnaire will have to be answered."
  * Then:

    The system will update questionnaire to show the newest questionnaire version and all prior answers shall be cleared
    The system shall not retain any previously answered questions.

  * 4 When the user does not make a selection to the update prompt
  * Then:

    The system shall not allow any edits to the current questionnaire, the user must select an update option to be able to edit questionnaire
  * Joe Williams on Fri, 26 Jun 2015 15:29:17 -0500 [View Commit](../../commit/484d43a9cd8d7d96524b9c7391540a6f4c0b2075)

##coeus-1506.68
* RESKC-252 Numeric text sort detection fix for datatables which contain numeric values

  * Fix to allow for automated sorting of columns within rich datatables which contain values that are considered numeric, this allows this type of sorting to be automated rather than specified per column, per table as was necessary previously since non-numeric sort is useless on values that are clearly should be considered numeric with these new checks.  This also automatically fixes sorting for currency, comma separated, and percentage numeric columns.
  * bsmith83 on Wed, 17 Jun 2015 17:08:02 -0700 [View Commit](../../commit/579b66bfe39983729593a78fc15c9d6107766bfd)

##coeus-1506.67
* No Changes


##coeus-1506.66
* Adding and clarifying project documentation.  Removing unused build logic such as the dev profile and maven jetty support.
  * Travis Schneeberger on Thu, 25 Jun 2015 20:10:25 -0400 [View Commit](../../commit/7cd22b8fc19e1f6f6d1815a3e94de072eec5bc07)
*  Fixing attachment removal
  * Application throws STE when attempting to copy proposal with personnel attachment.
  * User is copying the proposal with budget, does not want to copy attachments.
  * Got an STE and the exceptiojn in STE said constraint error on EPS_PROP_PERSON_BIO_ATTACH_FK1 - Child row exists. Looks like application is deleting rows from FILE_DATA for source proposal, this should not be happening.
  * Disabled the constraint and copied the proposal, did not get the STE and copy was created.
  * During this process, KC had actually deleted rows from file_data for source proposal and now the referential kep cannot be enabled.
  * Gayathri Athreya on Thu, 25 Jun 2015 15:09:01 -0700 [View Commit](../../commit/31c360b35527116983a172ca8c9b3859cbe07a02)

##coeus-1506.65
* No Changes


##coeus-1506.64
* RESKC-570 Roll back for RESKC-560 and RESKC-499, implementing a fix described in 499

  * This will make meeting schedules session based again and will alert the user with an error if they have 2 schedules open at the same time because of a multitude of issues cropping up based on the assumption that some data that is missing in a variety of areas would be there
  * bsmith83 on Thu, 25 Jun 2015 17:00:21 -0700 [View Commit](../../commit/99a26aae55836083a6a2413344ff6bd2036efcbb)
* reevaluate canEditView on all workflow actions on proposal development
  * Joe Williams on Thu, 25 Jun 2015 12:13:21 -0500 [View Commit](../../commit/d3e788d13841ec6e8bbebd0e02b12368560709d2)

##coeus-1506.63
*  Add create user and timestamp
  * Create Timestamp and Create User are missing; proposal admin details is missing several of the "date submitted by" fields.
  * Create time stamps are for auditing purposes and to show who updated records.
  * Additionally, these data values are used in several reports to senior leadership.
  * Gayathri Athreya on Wed, 24 Jun 2015 15:00:37 -0700 [View Commit](../../commit/2e3091f637e979b4e491bf50789782ed82e603aa)

##coeus-1506.62
* No Changes


##coeus-1506.61
* display correct amount and final expiration date on subaward funding source

  * PART ONE
  * 1. Create and finalize an Award document with the following:
  * a. Project Start Date = 10/29/2012
  * b. Project End Date = 10/28/2015
  * 2. Create and finalize a Time & Money document with the following:
  * a. Anticipated Amounts = $300,000
  * b. Obligated Amounts = $200,000
  * c. Obligation Start Date = 10/29/2012
  * d. Obligation End Date = 10/28/2013

  * PART TWO
  * 3. Create a Subaward document, completing all required fields to save and submit the document, including a contact
  * 4. On the Funding Source panel of the Subaward, link it to the Award created in steps 1 and 2 above
  * 5. On the Financial tab enter Effective Date 11/01/2013; Obligated Change $10,000; Anticipated Change $20,000
  * 6. Click Add
  * 7. Submit and finalize the Subaward document

  * PART THREE
  * 8. Open the Funding Source panel of the Subaward and view the Award Amount and Final End Date of the linked award.

  * Actual Behavior: The system does not display the Award's Obligated Amount of $200,000 and final end date of 10/28/2015 from the linked Award in the Subaward edoc.

  * Expected Behavior: The system should display the Award's Obligated Amount of $200,000 and final end date of 10/28/2015 from the linked Award in the Subward edoc.
  * Joe Williams on Thu, 25 Jun 2015 09:15:25 -0500 [View Commit](../../commit/5c2fac5d8e98f4c2acde7271aef829f2c990a62e)
* allow editing of proposal immediately after recall action

  * confirming returned for revisions is not allowing all editable functionality of an In Progress proposal. Which in essence makes return for revisions useless.
  * Joe Williams on Thu, 25 Jun 2015 08:23:44 -0500 [View Commit](../../commit/006ddc3a93c8efd675e975beba5fefb2b110cbdd)
*  Fixing null pointer.
  * Gayathri Athreya on Wed, 24 Jun 2015 16:25:23 -0700 [View Commit](../../commit/a7ab6c301e24f1b181af188852346148241e63af)
* maintain reviewer section when send notificaiton button is clicked
  * Joe Williams on Wed, 24 Jun 2015 16:25:22 -0500 [View Commit](../../commit/8cfbbd780fc80abcee8d60412635c5517288bec1)
* Fix issues with adding/removing committee members from present/absentee list

  * Edit an IRB or IACUC schedule
  * In attendance:
  * -set a member as Present Voting
  * -then set the other member as Present Voting
  * Save
  * Members revert to Absent.

  * Sometimes a member will not even move to Present after clicking Present Voting

  * Mark a selected attendee as absent get:
  * java.lang.IndexOutOfBoundsException: Index: 0, Size: 0 at java.util.ArrayList.rangeCheck(ArrayList.java:653) at java.util.ArrayList.get(ArrayList.java:429) at org.kuali.coeus.common.committee.impl.meeting.MeetingServiceImplBase.markAbsent(MeetingServiceImplBase.java:240)....

  * Captured a video to show the various things going on.

  * Full stack trace:
  * java.lang.IndexOutOfBoundsException: Index: 0, Size: 0
  * Joe Williams on Tue, 23 Jun 2015 12:42:06 -0500 [View Commit](../../commit/6034c20fe68a627e01d1bde2deaaebaaf472d8e8)

##coeus-1506.60
*  syncing DD with DB column sizes, allows symbols and whitespace for CommitteeScheduleMeetingDoc.minuteName and ScheduleAgenda.agendaName
  * Travis Schneeberger on Fri, 19 Jun 2015 16:11:59 -0400 [View Commit](../../commit/9c04eeecee60aea69ac20c465de42bf7db526efd)

##coeus-1506.59
* do not validate newly added custom attributes when document is enroute

  * Discovered this in UA's local 5.2.1 implementation and confirmed still an issue in 6.0.1
  * If a new Custom Data field is added for the Proposal module (and it is required) all enroute proposals will validate requiring the new field and be stuck in routing. However, if you return the document to the initiator (via 'return for edit' or superuser return to initiated) the newly added custom data field is not inserted into the document so the initiator can't fill it out even though it validates as required. The only way to update the proposal with the newly created Custom Data is for the initiator to 'recall' the document. However, typically on newly added Custom Data fields we want them to affect only new proposals not enroute proposals.
  * STEPS TO REPRODUCE FOR PROPOSAL:
  * 1. create proposal and submit into routing (notate document number).
  * 2. on maintenance tab select custom attribute and create new custom data field.
  * 3. add newly created custom data to proposal development module via the Custom Attribute Document table (make it required).
  * 4. login as current workflow stop user
  * 5. open the newly created enroute proposal.
  * 6. on Proposal Actions tab run validations, see new requirement for Custom Data.
  * 7. click 'return for edit' on proposal and fill out text box, click 'yes'
  * 8. login as initiator of document
  * 9. open doc and go to Custom Data, new custom data field not present
  * 10. go to Proposal Actions tab and run validations, error still present
  * 11. click 'recall' button
  * 12. get back into document and go to Custom Data, now it's present and can be added/edited.
  * Joe Williams on Wed, 24 Jun 2015 08:28:29 -0500 [View Commit](../../commit/064b6728ec9871cfef789d68e776bebbd39a3ba1)

##coeus-1506.58
* bring over award dates when award is copied

  * 1. Create an Award, completing all required fields to submit the document
  * 2. Enter valid Project Start and End Dates and valid Obligated Start and End Dates
  * 3. On the Award Actions tab, click Submit
  * 4. Use the Award Lookup to search for the Award
  * 5. In the Award Lookup's search results, click the Copy action next to that Award
  * 6. When the system displays the Hierarchy Actions panel, select New on the Award Copy subpanel and click the Copy action button on that panel
  * 7. When the system displays the newly initiated Award, scroll down to view the Time & Money subpanel on the Details & Dates panel and observe the Project Start and End Dates and the Obligated Start and End Dates
  * Actual Behavior: The Project Start Date, Project End Date, Obligated Start Date, and Obligated End Date are blank/null/empty. The system did not copy over the dates from the original Award.
  * Expected Behavior: The system should display the same dates (Project Start, Project End, Obligated Start, and Obligated End) in the copied Award as entered in the submitted, finalized Award used to make the copy. The system should not display the date fields as blank/null/empty.
  * Joe Williams on Wed, 24 Jun 2015 08:57:59 -0500 [View Commit](../../commit/5f21d76a4e4ef56b244aa4bb25a41ac1dc983863)

##coeus-1506.57
*  Fixing online review issue.
  * Not easily reproducible but getting this in both IRB and IACUC protocols at times on performing Protocol Actions or trying to access an online review: org.kuali.rice.core.api.exception.RiceRuntimeException: The workflow document is null. This indicates that the DocumentHeader has not been initialized properly. This can be caused by not retrieving a document using the DocumentService. at org.kuali.rice.krad.bo.DocumentHeader.getWorkflowDocument(DocumentHeader.java:75)
  * In res1-demo1, login as oblood, got to All My Reviews, and open IACUC Protocol #: 1506000154, go to Online Review tab and see that it doesn't render correctly, then go to Protocol Actions, and see the error.
  * Gayathri Athreya on Tue, 23 Jun 2015 10:28:41 -0700 [View Commit](../../commit/a5dbfbe452b3bb36eccbad79edc0b2ea18462763)

##coeus-1506.56
*  Do not create pessimistic locks in view mode.
  * Steps:
  * Open proposal from loolup in view mode. Without closing proposal, go to pessimistic locks lookup and search. See the proposal in the lookup.
  * Gayathri Athreya on Tue, 23 Jun 2015 13:36:49 -0700 [View Commit](../../commit/0562a80508f7fd8783306267106fb7e93a3e9591)
* prevent award submission when krms errors are present

  * Looks to be same issue as KRACOEUS-6343 and KRACOEUS-6502 but fixes not extended to all modules.
  * built a Term Specification, Term, and Agenda to create a validation that would not allow sponsorCode = 000400. I then created an award and selected the sponsor of 000400 and then 'turned on validations' and the error displayed appropriately in the Unit Business Rules Errors' section. However, even though there was an error present upon validation I was able to submit the Award into routing. I tested the very same field and validation in Propdev and the system prevented the user from submitting into routing because of the error. See attached screenshot for further reference.
  * Joe Williams on Tue, 23 Jun 2015 15:21:00 -0500 [View Commit](../../commit/1c6fb22fdcee3b99c34e53e6fa2978809cacf6d0)
* code clean up
  * Joe Williams on Tue, 23 Jun 2015 15:20:19 -0500 [View Commit](../../commit/9f4d091488f99e2264b533db72217e2a5111fd70)

##coeus-1506.55
* Always populate negotiation documents with most recent custom data attributes

  * Steps to Recreate:
  * 1 Create a Negotiation Document
  * 2 Enter the necessary fields to save and save the negotiation
  * 3 Create a New Custom Data field for Negotiation
  * 4 Re-open your negotiation document
  * When you take these steps only the custom data fields that were entered into the system at the time the Negotiation was created are populated. A similar problem happened with other document types. However, the correction is dependent on the document going through a versioning step. As Negotiation is never versioned this Jira did not correct this problem for the Negotiation module. Some negotiations will stay open for quite a while, and a change in needed data that happens in the middle of a given negotiation may still apply to them. So the issue that was solved for the other modules with KRACOEUS-6009 needs a Negotiation fix.
  * Joe Williams on Tue, 23 Jun 2015 13:25:23 -0500 [View Commit](../../commit/d11c136c3a48188e4eb7eba519bd2470658b02b6)

##coeus-1506.54
* Update README.md  * Gayathri Athreya on Tue, 23 Jun 2015 09:04:37 -0700 [View Commit](../../commit/89a2c48f9c9c1e85609db70e86a2afd45094e687)
* Fix Calculate Button On Summary Personnel Item Details

  * Testing and documenting the use of Summary instead of project person in the budget.
  * If I edit the entered Requested Salary field and click calculate, the screen does not refresh to display the revised Fringe amount. The user has to close the window and then the period screen refreshes to show the amount. The calculate works/refreshes fringe when a project person is used.
  * The intent of using Summary is to enter an uncalculated salary value to meet a specific sponsor request - usually. So it is helpful to the user to be able to see the calc' fringe amount so they can revise the base salary, if needed. They have to close and re-open the window to see the change now.

  * Steps to Reproduce

    create a proposal and create a new budget
    navigate to assign personnel to periods
    assign personnel
    select summary as the "person" to add
    choose object code (like admin -on)
    assign to period 1
    open details modal
    enter requested salary
    click calculate button

  * Result: Nothing happens
  * Expected Result: The Calculated Fringe and Underrecovery F&A calculations should update if there are rates associated with those types for this proposal
  * Joe Williams on Tue, 23 Jun 2015 09:46:35 -0500 [View Commit](../../commit/c6427fe8f7350b06f4522dd6e2b463dc5506a188)

##coeus-1506.53
* No Changes


##coeus-1506.52
* No Changes


##coeus-1506.51
*  Removing unnecessary logic from committee lookup, cleanup other lookup logic
  * Travis Schneeberger on Fri, 19 Jun 2015 15:17:18 -0400 [View Commit](../../commit/5de793e2c61c313ade118771caa85b9f4850619f)
* Removing global state that is mutated in places other than bean initialization
  * Travis Schneeberger on Fri, 19 Jun 2015 09:50:12 -0400 [View Commit](../../commit/5142a997dc91134321990cfbc03ccfe1c7388221)
*  Code cleanup, removing unnecessary document service call
  * Travis Schneeberger on Thu, 18 Jun 2015 15:18:12 -0400 [View Commit](../../commit/e74843ed9c2af797585ac54305211e65a235581c)
*  Making "view active" committee open a committee with the highest sequence number that is also on a final document.
  * Travis Schneeberger on Thu, 18 Jun 2015 14:45:47 -0400 [View Commit](../../commit/09acbe59aff89744e0411d52b932c1ee77305e97)

##coeus-1506.50
* No Changes


##coeus-1506.49
* Display Graduation Year on Generic and NSF Cover Page Forms

  * In Proposal Dev, the printing of the Cover Page for Generic Printing Forms and the NSF sponsor forms from Print > Sponsor From Packages > Cover Sheet does not populate the date of the PD/PI(S) graduation date(s)

  * Tested this out in Trunk build-1c8ac214 (Dec-23-02:17) Oracle9i
  * user=quickstart
  * proposal #54
  * PI = Opal blood.

  * The NSF (non g.gov) coversheet print and the Generic print form coversheet both have:
  * Degree populated from the Proposal Person > Degree > "Degree Description" field.
  * Both leave "Graduation year" blank even when populated in Proposal Person > Degree > "Graduation Year".

  * See screenshots.

  * (Note: the mapping for G.gov forms is different.
  * The Grants.gov RR Key Person Form print has:
  * Degree populated from the

  * The year is populated from the Proposal Person > Extended Details > Education > "Year Graduated" field.)
  * Joe Williams on Thu, 18 Jun 2015 15:27:48 -0500 [View Commit](../../commit/84d71a8300eab3e098e47abcb54ef94a58ddb83a)

##coeus-1506.48
* Assign Iacuc PI correct roles

  * Create an IACUC Protocol
  * Use person without any IACUC roles as PI
  * Save
  * On Permission tab, person is added as PI and IACUC Protocol aggregator
  * Go to the PIs person record, they have IACUC Protocol Aggregator (role 1582)
  * They should just be given the PI derived role on the protocol not IACUC Protocol aggregator.
  * This works as expected in IRB but not IACUC.
  * Joe Williams on Thu, 18 Jun 2015 10:41:09 -0500 [View Commit](../../commit/f951fd9c3ab8967cc36db73c93a8cf029cb609b0)
*  Removing unused parameters
  * Travis Schneeberger on Thu, 18 Jun 2015 11:26:16 -0400 [View Commit](../../commit/b87d0dc978fc352bb8b4f6314082acf9c8e7accd)

##coeus-1506.47
* add close button to proposal budget

  * User needs to be able to exit the entire proposal from the budget screens. Budget missing a close option from ALL budget screens.

  * Acceptance criteria
  * As a user logged in with the permission 'modify budget'

    When user chooses to close the budget
    Then user should see warning message such as "Would you like to save this document before you close it?"

    When user does not intend to choose close budget,
    Then they may return to the document

    When a user does want to save the budget before closing
    Then the most recent screen edits will be saved and the budget screen will close, sending user to the main KRAD portal screen

    When a user does not want to save the budget before closing
    Then the most recent screen edits will NOT be saved and the budget screen will close, sending user to the main KRAD portal screen

  * Also fixes issue with dirty checking on closing
  * Joe Williams on Thu, 18 Jun 2015 09:30:14 -0500 [View Commit](../../commit/b17f8606fb0ecd38c2714c2b83caa5f152f44e53)
* return to award document from time and money document if accessed from award

  * 1. Create an Award, completing all required fields to save the document and create a Time & Money
  * 2. Click Time & Money
  * 3. Click Cancel (or Close)
  * 4. Click Yes to the question asking the user to confirm whether or not to follow-through on canceling the Time & Money document (or click either Yes or No to saving upon clicking Close)
  * Expected Behavior: If the Time & Money document was accessed through the Award document's Time & Money button, the system should return the user to the Award. The system should not return the user to the KC portal page.
  * Actual Behavior: The system does not return the user to the Award. The system returns the user to the KC portal page (KC 5.2.1 / KC-DLY) or the KRAD portal page (KC 6.0 / KC-TRUNK).
  * Joe Williams on Wed, 17 Jun 2015 15:53:18 -0500 [View Commit](../../commit/e7600be15e9adca39b28f5749fc73a56bb2a7aa6)

##coeus-1506.46
*  person bio deletion issues.
  * Tried to delete the Co-Investigator from the proposal and each time got Incident report. Then navigation within proposal was not possible and more incident reports resulted when selecting any tab from left menu.
  * removing bio uploaded for person from db resolved issue.
  * Associated Personnel attachments should be deleted when person is deleted as Coeus did.
  * Step to reproduce:
  * Add a rolodex add personnel attachments which insert records in eps_prop_person and eps_prop_person_bio tables.
  * Delete the person, which delete the person record from eps_prop_person table, but not from eps_prop_person_bio table. So the error.
  * Gayathri Athreya on Wed, 17 Jun 2015 12:55:22 -0700 [View Commit](../../commit/6942ff4c4b8e76d6e799a210d7bb35ed00aa360d)

##coeus-1506.45
* [RESKC-394] Double scrollbar fix for iframe views
  * bsmith83 on Tue, 16 Jun 2015 19:11:50 -0700 [View Commit](../../commit/11aaaa3c7f1b0b09d099ca545eb413a4b9ef4d46)

##coeus-1506.44
*  When canceling a saved committee document, rice refreshes all references on the BO.  This populates BOs which contains cycles.  When rice tries to serialize the document for the cancel action xstream gets stuck in the cycle between Organization & OrganizationYnq and causes a StackOverflow.  By adding workflow properties we specify which attributes to serialize avoiding the cycles.
  * Travis Schneeberger on Tue, 16 Jun 2015 16:53:44 -0400 [View Commit](../../commit/4089f0f213f27956eca0ce953f4dde0185a83242)
* retain posted timestamp for award and IP notes and attachments

  * As an Award Maintainer, or
  * As an IP Maintainer, I need to update aspects of existing (Awards or ) Institutional Proposals.
  * When editing these records, my ID and Time stamp should only be added to the document, and to any new items I maintain that add them.
  * Currently, when I Edit an IP record or Award with existing Attachments, ALL those existing attachments update with MY user ID and the current time stamp.
  * Those attachments should maintain the User ID and time stamp from when they were originally added or actually last maintained. NOT with the info from the current edit.
  * Joe Williams on Thu, 11 Jun 2015 13:20:00 -0500 [View Commit](../../commit/49a65b7a5617cad0c55dea67ce5905c899134808)
*  code cleanup
  * Travis Schneeberger on Mon, 15 Jun 2015 13:52:54 -0400 [View Commit](../../commit/8695f890bcbde1ad2145ea83a3afcec6f92ed71b)
*  Improve the performance of the ip lookup
  * Travis Schneeberger on Mon, 15 Jun 2015 13:20:53 -0400 [View Commit](../../commit/7b597811463584c542079ccaf0e035d56f80b313)

##coeus-1506.43
* No Changes


##coeus-1506.42
*  Fixing funds requested calculations and allocations and LA calculation
  * Gayathri Athreya on Wed, 10 Jun 2015 15:16:46 -0700 [View Commit](../../commit/0a961a18201c18c3cbf5a60a04fc634dbeaf4ec7)
*  Do not fail rules on warning
  * Gayathri Athreya on Mon, 15 Jun 2015 13:47:02 -0700 [View Commit](../../commit/799e0aa4465d00bc667a92aff5b34fc3fe3bef05)

##coeus-1506.41
* No Changes


##coeus-1506.40
* changes
  * Joe Williams on Mon, 15 Jun 2015 11:19:32 -0500 [View Commit](../../commit/b7f8f13789177812981b7f10c5c440c316c057cc)
* fix protocol submissions search when title and schedule date criterion are used

  * Currently, the Protocol Submission search returns ALL submitted protocols, even with criteria entered in the search screen.
  * User Story:
  * As an IRB Protocol administrator, I want to search Protocol Submissions and use the filtering tools to adjust my search criteria to limit my results. For example, I would like to use a date range to only locate protocols submitted in a certain month.

  * Steps to reproduce:
  * As a user with IRB roles (or quickstart in Kualico)
  * Navigate to Central Admin > Post-Submission Compliance > Protocol Submissions
  * In the generated Look up screen, enter Submission Date From (1/1/2015) and Submission Date To (5/31/2015)
  * Click Search
  * Result: 28 records return.

  * Clear search
  * Try entering a partial title "JF" > click Search
  * Result: 28 records return.

  * Clear search
  * Do not enter any variables in the lookup screen > click Search
  * Result: 28 records return.

  * Desired Results: Filters should work to limit the search results.
  * Joe Williams on Fri, 12 Jun 2015 13:47:01 -0500 [View Commit](../../commit/9c89ae2f9ac6cb02ce8c0be086478787528a5361)

##coeus-1506.39
* Reverts back an MIT commit
  * Joe Williams on Mon, 15 Jun 2015 08:56:09 -0500 [View Commit](../../commit/5e0c6629d8ea1d336bdd6a1fd4f68f244802d708)

##coeus-1506.38
* [RESKC-522] Protocol performance tweaks
  * bsmith83 on Fri, 12 Jun 2015 19:12:49 -0700 [View Commit](../../commit/5cab2a8bbf2825b16d5f98808a8e1df43290d17c)

##coeus-1506.37
* No Changes


##coeus-1506.36
* update check specified narrative type krms function to check internal attachments

  * KRMS rule built using any internal attachment type with the function "check specified narrative type" either always shows or never shows. If user configures validation to show message when attachment is missing, it is not possible for the proposal user to make a selection (by adding the missing attachment) to clear the data validation.

  * Steps to reproduce

    Create an Agenda
    Add a rule to run when true
    In the proposition add description
    select function
    find term "check specified narrative type"
    use "=" comparison
    value of "true"
    add name
    narrative type: use any internal attachment, such as 55 (for MIT Cost Sharing Distribution")
    KC Validation
    Action Warning
    Message- any message
    Area: Attachments
    Section Name: Internal Attachments
    Page ID: PropDev-AttachmentsPage
    Section ID: PropDev-AttachmentsPage-InternalSection
    Name: any name
    Add rule
    Blanket Approve Agenda
  * Joe Williams on Fri, 12 Jun 2015 16:23:30 -0500 [View Commit](../../commit/72b53881f118b2c4954e6908090b1e612803325d)

##coeus-1506.35
*  Improve the performance of the protocol authorizers by removing edit mode logic that is not used.
  * Travis Schneeberger on Fri, 12 Jun 2015 14:27:37 -0400 [View Commit](../../commit/38e23b44be4f947f66dc0819a922b95e350b99ed)

##coeus-1506.34
* No Changes


##coeus-1506.33
* Add certify user and timestamp to notification renderer
  * Joe Williams on Fri, 12 Jun 2015 07:59:04 -0500 [View Commit](../../commit/34625af33a0a864e4d195b8de2645091e77a2072)
* Improve unit service

  * Remove hard-coded usage of 000001. Add index and foreign key check on unit table to improve performance and safety. Refactor getTopUnit to simply query for record with null parent unit.
  * blackcathacker on Thu, 11 Jun 2015 18:26:02 -0700 [View Commit](../../commit/9cf34d9a006a88e5a1eaba3a0bb2cab328cddd46)

##coeus-1506.32
*  making log messages use one log statement (avoids interleave), make perf filter & monitoring filter use the same exclude configuration, make monitoring verbose logging configurable.
  * Travis Schneeberger on Thu, 11 Jun 2015 11:21:04 -0400 [View Commit](../../commit/a21ce042d412b09fb9c8f88cc6090dc87449f5dc)

##coeus-1506.31
* No Changes


##coeus-1506.30
* iacuc copy link redirects user to the copy action on the protocol

  * Login as user who can edit/copy IACUC protocols.
  * From the Researcher portal, select Search IACUC Protocols
  * Perform a search that you know will return results. (Or create a new IACUC protocol if needed to get results.)
  * From the Results list, select Copy from one of the protocols.
  * Result: User is taken to KC Landing Page.
  * Expected Result: Protocol is opened and user is taken to the Copy option in Protocol Actions where they can copy the protocol.

  * Workaround: From the Results list, select View or Edit instead of Copy. The protocol opens. Go to IACUC Protocol Actions, Copy to New Document.
  * Joe Williams on Thu, 11 Jun 2015 14:16:59 -0500 [View Commit](../../commit/23d45eb4d3b0464d56561348183ac8848da5716f)

##coeus-1506.29
* No Changes


##coeus-1506.28
* No Changes


##coeus-1506.27
* No Changes


##coeus-1506.26
*  Code Cleanup
  * Travis Schneeberger on Wed, 10 Jun 2015 15:06:03 -0400 [View Commit](../../commit/8759f8779c7c36714234a2ac6fb4f08aa0121ada)
* Budget Single Point Entry Enhancement
  * Joe Williams on Tue, 9 Jun 2015 16:34:58 -0500 [View Commit](../../commit/ff64bd468921aab9d39bebf9bbc76a13ac3283fa)
*  Fixing an index out of bounds exception which is swallowed and then becomes visible to the end user as a exception creating java.util.List
  * Travis Schneeberger on Wed, 10 Jun 2015 15:00:45 -0400 [View Commit](../../commit/22091cc7fbc5360ef58a4139a346ee7d6b67e76f)
*  Fixing a hidden NPE when accessing a Protocol Amendment and the Protocol Person does not have an affiliation.
  * Travis Schneeberger on Wed, 10 Jun 2015 14:58:44 -0400 [View Commit](../../commit/c6b573e15480da1fb8f95d33fe3f1cf22570d7d6)

##coeus-1506.25
*  Adding indexes to prevent deadlock and increase performance
  * Travis Schneeberger on Wed, 10 Jun 2015 12:11:11 -0400 [View Commit](../../commit/f6264ba08d874cb7f713c740bb51a43e13fab2fa)

##coeus-1506.24
* [RESKC-499] Multiple browser windows/tabs open when editing Schedules will cause data to overwrite
  * Travis Schneeberger on Wed, 10 Jun 2015 10:03:35 -0400 [View Commit](../../commit/09a463c4f471be4c9dc8776c1dabaabf21a97e4e)

##coeus-1506.23
* No Changes


##coeus-1506.22
*  Fixing non personnel underrecovery rate calculation.
  * As a user I need to create a budget with a reduced MTDC rate of 10% 'de minimus' rate for an NSF submission. My institution needs to capture the under recovered F&A, so I must set the Budget F&A Rate Type to MTDC (and manually set the rate to 10% as the applied rate) and set the UR Rate Type to FUNSN (which will apply the 56% F&A rate on Salaries and 10% F&A rate on Materials and Services). This follows my institute policy of capturing the UR on the salary&applied eb/fringe/vacation.
  * Steps to reproduce:
  * Create a proposal in Unit 000001 (rates modified)
  * activity type = research
  * Create a budget
  * Budget Settings:
select F&A Rate type of MTDC
  * Select UR Rate Type of FUNSN
  * Rates Screen:
  * Edit the Applied rate for MTDC to %10
  * Review FUNSN rates 56% for Salaries; 10% for M&S
  * Add a person to the Budget; enter a salary amount for the person; apply the person to the first budget period.
  * Add a non-personnel line item, example Travel. for $10,000.
  * Save.
  * Expected Results:
  * The Personnel salary will generate Under Recovered F&A
  * (Difference of the full 56% FUNSN Salary rate less the 10% reduced MTDC rate).
  * The Non-personnel line item will NOT generate UR, because the applied MTDC rate and the standard FUNSN M&S rate are equal.
  * Current Result:
  * Personnel calculate UR correctly.
  * Non-Personnel do NOT calculate correctly and are generating UR.
  * It appears that the first FUNSN rate for Salaries is being applied.
  * Gayathri Athreya on Mon, 8 Jun 2015 14:08:42 -0700 [View Commit](../../commit/bea3df997cabcd6625e24e150c86e428885ec9c9)
* added coi hierarchy parameter
  * Joe Williams on Tue, 9 Jun 2015 09:20:08 -0500 [View Commit](../../commit/ef589a6c01b4f7623880e53e6089620e9d23de93)

##coeus-1506.21
* code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 16:20:54 -0400 [View Commit](../../commit/7e159c1eb5d59d0a8c500b33e9c8cae54dd9816e)
* IRB protocol search limit fix
  * Travis Schneberger on Tue, 2 Jun 2015 16:04:38 -0400 [View Commit](../../commit/32ad34ce3f9a8545a8f9a4200c2374091707c194)

##coeus-1506.20
* avoiding a NPE when submitting an IACUC amendment.
  * Travis Schneeberger on Mon, 8 Jun 2015 15:01:14 -0400 [View Commit](../../commit/df09356f3e3f64481c8ca2f3d335d55344557141)

##coeus-1506.19
*  Hide delete attachment button when institutional proposals are view only

  * A user should be required to edit the IP document before the Notes and Attachments allow 'delete' therefore delete button should be hid in view mode.

  * Steps to reproduce:
  * 1. create or search for an Institutional Proposal
  * 2. in edit mode, on the Institutional Proposal tab under Notes and Attachments, attach a file
  * 3. fill out other required fields
  * 4. save and blanket approve
  * 5. re-open the IP
  * 6. open Notes and Attachments

  * Results- delete button appears next to the file.
  * Expected Results- delete button should not appear when the IP is in view mode, user should be required to edit document first
  * Joe Williams on Mon, 8 Jun 2015 10:13:45 -0500 [View Commit](../../commit/3b75f94e0d8d74301058cefb7a845004b2820ba0)
*  correctly display other degree type question

  * Discovered in testing S2S questionnaire supporting the PHS Fellowship form:
  * Users answering the s2s form supporting Fellowship questionnaires presented with 2 follow up (requirement based) questions when one of five (5) specific "Other" Degree types are selected from the argument value list. The 5 questions include the full text word "other" in the question text, so question ID 100 requirement = "OTH" presents when it should not.

  * In the s2s form supporting Fellowship Questionnaire, there is a question branch with a series of questions that only present if the prior answer selected from an argument value list contains a certain text value. (for an “other” type of degree).
  * The requirement in each question in the branch is if it contains the text value ( DDOT, DOTH, MDOT, MOTH, VDOT, and OTH).

  * In KC, the Upper Case requirement is not being honored, so 5 of these questions are presenting both their specific match and the “OTH” question, because there is lower case text in each with the full word ‘other’ in lower case.
  * Requirement in KC is picking up lowercase appearance of “other” in the question text:
  * ID16 = MOTH
  * ID 17 =DOTH
  * ID18 = DDOT
  * ID19 = VDOT
  * ID 100 = OTH
  * ID 21 = MDOT

  * Only ID 100= OTH is working as anticipated: (OTH should only present when OTH is selected from the prior question.)
  * Joe Williams on Mon, 8 Jun 2015 09:57:25 -0500 [View Commit](../../commit/aa251ab2796cc604024b024e4775cf834cd9baf2)
* Organization Summary Service

  * Includes additional tests for other summary services to validate Moo conversion
  * blackcathacker on Fri, 5 Jun 2015 20:16:24 -0700 [View Commit](../../commit/5922725d9eacb8d3f0de482facdf337621736236)

##coeus-1506.18
* only return active version of subawards on subaward lookup

  * 1. Create & blanket approve a subaward document with Subrecipient #000040 "University of Maine". Note that this is Version 1.
  * 2. Now edit & blanket approve the subaward from step 1, changing the Subrecipient to #000041 "University of Maryland". Note that this is Version 2.
  * 3. Central Admin > Post-Award > Subawards > click on search icon (magnifying glass)
  * 4. While in the Subaward Lookup, enter 000040 (University of Maine) in the Subrecipient field.
  * 5. Click search.

  * RESULT: The search returns the subaward where current value for Subrecipient is 000041: "University of Maryland" (version 2).

  * EXPECTED RESULT: Search should only look for values from the maximum finalized subaward documents in the Subaward Lookup (most recent final value). In this example, the search in step 4 should have returned no values when searching for 000040 "University of Maine" since it was only present on Version 1 and had been replaced by version 2 with 000041 "University of Maryland".

  * This is true for the following Subaward Lookup criteria: Subrecipient, Start Date From, Start Date To, End Date From, End Date To, Subaward Type, Purchase Order ID, Title, Account ID, Vendor ID, Requisitioner Unit, Archive Location, Closeout Date From.
  * Joe Williams on Fri, 5 Jun 2015 09:37:57 -0500 [View Commit](../../commit/836420eced7243977843f5c546a187210d6bf261)

##coeus-1506.17
* Fix NPE that occurred with certain activity date combo

  * When a Negotation has activities that are in the past in the same location such that the later activity starts before the previous activity ends and does not have an end date, building the history for the activities will cause an NPE to be thrown during JSP page rendering(not displayed to the user). Any further activity will produce an error similar to java.lang.RuntimeException: Error occured while trying to create a new instance for class interface java.util.List.

  * The underlying NPE was occurring here. java.lang.NullPointerException
        at org.kuali.kra.negotiations.service.NegotiationServiceImpl.getNegotiationActivityHistoryLineBeans(NegotiationServiceImpl.java:294)
        at org.kuali.kra.negotiations.web.struts.form.NegotiationForm.getNegotiationActivityHistoryLineBeans(NegotiationForm.java:292)
  * blackcathacker on Fri, 5 Jun 2015 17:16:08 -0700 [View Commit](../../commit/dc576524f2d67bfa87e0be0f8caef2c8c2c8bb80)

##coeus-1506.16
*  Make reject action permission based.
  * Gayathri Athreya on Fri, 5 Jun 2015 08:36:11 -0700 [View Commit](../../commit/263dea90d8bc15669d9606e97a04d8fc8f4b0548)

##coeus-1506.15
*  ignoring url patterns for static content and healthcheck
  * Travis Schneeberger on Fri, 5 Jun 2015 15:46:27 -0400 [View Commit](../../commit/1e9f9bd56ec096e1ef01a5e011d1fc9a6aad045a)

##coeus-1506.14
* Warning should not count as rules errors.
  * In Kualico instance: Negative under recovered F&A generated in budget; values do not populate to Commitments> UR Distribution. Cannot resolve validation.

  * Create a proposal type Research.
  * Create a budget;
  * in Settings: select Rate Type of TDC and select Unrecovered Rate Type of FUNSN
  * in Rates screen: set TDC rate to 10%
  * Add budget expenses and generate periods
  * Review calculated Rate in budget item Details modal: TDC rate calculates correctly.
  * Review the P&T screen: note negative UR amount in column
  * Complete Budget action prompts Validation Error to clear audit.
  * Open Commitments> Unrecovered F&A screen. System says no UR generated.
  * Gayathri Athreya on Fri, 5 Jun 2015 12:12:43 -0700 [View Commit](../../commit/97c0fc0aeaf7fc96b3df8ba773d1be3c13c9c24c)

##coeus-1506.13
*  adding java melody jpa monitoring
  * Travis Schneeberger on Thu, 4 Jun 2015 16:39:44 -0400 [View Commit](../../commit/2641c16aef2cea6b1ce8fda6d0863ec1a267d662)

##coeus-1506.12
* Proposal Person Certification Enhancements
  * Joe Williams on Wed, 3 Jun 2015 14:06:23 -0500 [View Commit](../../commit/0f3bce441c0d94a98c081ea7f16a1737c915f2ad)

##coeus-1506.11
*  allow iacuc online review without a schedule

  * Steps to reproduce:
  * Create IACUC protocol
  * Submit for Designated Member Review (DMR).
  * Modify Submission details.
  * Assign to a Committee
  * Do not assign a schedule.
  * Select a primary reviewer.
  * Submit

  * Result: Online Review tab does not appear in protocol. Usable Online Review documents are not created. Reviewer get notification in Action List and a review appears in their All My Reviews list but they cannot do anything with it.

  * Expected Result: Online Review tab appears in protocol. Online Review documents are created and accessible/usable by reviewers. A schedule should not be needed for DMR.
  * Joe Williams on Wed, 3 Jun 2015 16:54:56 -0500 [View Commit](../../commit/b55208952f2d315dddf5af1a34adb19e26a2e10b)

##coeus-1506.10
* fix STE on award navigation after submission

  * Logged in as Admin to Res-Demo1
  * Searched for existing award using account number 2533529
  * Opened record > clicked edit button
  * Maintained Description and Transaction Type on Award Tab.
  * Clicked on another tab to make the award change; got an STE very much like the one listed below by Victor. (input string referenced my award -For input string: "000073-00001"

  * This is a blocker issue in Award .

  * I am getting STEs when I try to navigate to the Award tab after finalizing an Award, or when I try to finalize a Time and Money document.  This is happening in Demo1 and Demo2
  * Joe Williams on Thu, 4 Jun 2015 08:14:15 -0500 [View Commit](../../commit/65e8bb75b88ed9d266daa1daa112ed994d9fe1c3)

##coeus-1506.9
*  fixing concurrent modification exception in Java 8 when sorting a collection in a getter without returning a copy.
  * Travis Schneeberger on Wed, 3 Jun 2015 17:59:45 -0400 [View Commit](../../commit/2f08417736f01e63714b9b578d7aa6fd0edee92e)

##coeus-1506.8
* No Changes


##coeus-1506.7
* code cleanup
  * Travis Schneberger on Wed, 3 Jun 2015 10:36:22 -0400 [View Commit](../../commit/1f82d85d0fd7b5d0b6c3857e4e4aa35833c4404a)
* Update unit formulated Cost
  * Travis Schneberger on Wed, 3 Jun 2015 09:35:54 -0400 [View Commit](../../commit/f1657abefdfd2a52509f4f1d35054994e00950b7)
* code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 15:24:53 -0400 [View Commit](../../commit/c349e5dfa9fc30be11f11ea6126bdec64d0ae3a1)
* increment sequence number of new Institutional Proposal
  * Travis Schneberger on Tue, 2 Jun 2015 15:24:32 -0400 [View Commit](../../commit/9f64a0f1118e858e2fc2b302afadcfa7b9f44190)
* add warning when no budget exists, code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 14:42:01 -0400 [View Commit](../../commit/8535ecf3b817ddbca291d7719c0305772ecd1731)
* fix delete proposal, code cleanup, remove unused code
  * Travis Schneberger on Tue, 2 Jun 2015 14:27:54 -0400 [View Commit](../../commit/6232384dccb99a8a2d7a193eaed3ec46acff4930)

##coeus-1506.6
* Award Title and Status Modification Highlights Fixed in Delta, code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 13:53:02 -0400 [View Commit](../../commit/95622c82f932340c43b98c976f315840baaf920d)
* Making the absentee list populate correctly
  * Travis Schneberger on Mon, 1 Jun 2015 11:32:44 -0400 [View Commit](../../commit/56f94cff610b7157e9d4cda08f30ee9e20557698)

##coeus-1506.5
* No Changes


##coeus-1506.4
* Fixing Delta Report Formatting Issues, code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 17:14:54 -0400 [View Commit](../../commit/59d2221de555d3629683c85a70d2fcd5eac687bb)

##coeus-1506.3
* No Changes


##coeus-1506.2
* negotiation xml stream calendar formating fix and parameter name fix
  * Travis Schneberger on Mon, 1 Jun 2015 17:59:49 -0400 [View Commit](../../commit/46194609e4b3a70939fc56e37dc25f382a2d7b52)
* negotiation xml stream calendar fix, xml stream code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 17:54:58 -0400 [View Commit](../../commit/13d66c82d7d08f2cbe18c16a3774679f805e6a96)
* Avoiding a NullPointerException with report tracking.
  * Travis Schneberger on Mon, 1 Jun 2015 11:44:26 -0400 [View Commit](../../commit/5a8152afd64213bd8031ba45324a885d1e8ee640)

##coeus-1506.1
*  fixing test related to java melody datasource monitoring, code cleanup
  * Travis Schneberger on Sat, 30 May 2015 11:25:04 -0400 [View Commit](../../commit/13b95b7ba487bb43590988cf594bc7e6ece3743d)
*  Hierarchy copy fixes
  * "Award Copy + Copy as child of" and "New Child + based on copy from parent" and "selected award" are also copying the budget.
  * Create an Award Hierarchy Structure
  * Test 1: New Child section > click button to ‘copy from parent’, then click [create]
  * 1.	Start with an existing Award with T&M doc. (Example: 000073-00001:2533529)
  * (this root node award had an award budget)
  * 2.	Award Actions > Show Hierarchy Actions panel
  * 3.	Expand the node detail by clicking on the  beside the award-node number
  * 4.	In the New Child section > click button to ‘copy from parent’, then click [create] at the end of the row; A new award in ‘initiated’ status will open in the screen. (my test = 000073-00002)
  * 5.	Complete the required fields to submit:
  * a.	Award tab –
  * i.	Description
  * ii.	Details & Dates section: Change title to make this easier to locate; otherwise all fields from parent are pre-filled.-save Award tab
  * b.	Payments/Reports/Terms (BUG?) I had to add a report to get past the error validation. But often, we don’t want to have reporting requirements at the child nodes – so no types should be required. (separate JIRA after more testing.)
  * c.	Award Actions Tab > submit
  * Even prior to submit, I opened the Budget Versions tab and found that the budget version from the root node were copied into this -00002 child node.
  * Test 2: Create new child node: Hierarchy Actions > New Child > Based on Selected Award = child node 2 (same as open award node w/award budget)
  * 1.	Search and open award *73-00002 (this node has an award budget copied from the root node)
  * 2.	Award Actions > Show Hierarchy Actions panel
  * 3.	Click the green  beside the root node -0000001 to expand the award view
  * 4.	Click the green  beside the child -00002 node to expand the copy options
  * 5.	Click the button beside “selected award” and then click the drop-down to select the *73-00002 node (same as open) then [create]
  * 6.	The new -00003 award node will present in the screen to be maintained.
  * a.	At this point, you can click on Budget Versions and confirm that versions were copied from the selected node.
  * 7.	Award Actions > Submit.
  * 8.	Wait for processing to complete
  * 9.	Click on Budget Versions screen.
  * 10.	Click [open] on the rebudget version that is still in progress
  * Gayathri on Fri, 29 May 2015 16:20:15 -0700 [View Commit](../../commit/5140c119bb88e8c1d154dc2f78b891d4abf1509e)
* Fixed Cost Sharing and U/R screens display 'NAN' instead of total unallocated

steps to reproduce
  * Open an existing Proposal #564 in res-demo1
  * Open the Budget version
  * (see assigned person Rosemary Hanlon, or do the following:
  * Add a Person; maintain their cost object and salary
  * Assign the person to a budget period with their Effort% greater than Charge% (to generate cost sharing) save

  * Edit the Details & Rates
  * Click on the Rates tab
  * Uncheck the "apply' box in the MTDC row (to generate under recovered f&a)
  * Save
  * Save proposal

  * Click to Institutional Commitments
  * >Click to Unrecovered F&A
  * The "total Unallocated" field shows "NAN"

  * >Click Cost Sharing
  * The "total unallocated" field shows "NAN"

  * Expected Result: should display a numeric value = to 0 until user starts allocating, and then the numeric value should update based on the maintained amounts in the table rows.
  * Joe Williams on Fri, 29 May 2015 12:26:19 -0500 [View Commit](../../commit/93d1e02a83b7b2e4da1becc9272018adcd5d42ab)
* added award audit rule to check for invalid sponsor codes

  * 1. Create an award document filling in only the required fields.
  * 2. For the Sponsor enter an invalid code such as '010002' which after it is entered will indicate in red "not found"
  * 3. Submit to the award e-doc to final.
  * RESULT: Document saves and finalizes even though the sponsor field (which is a required field) has an invalid code entered.
  * EXPECTED RESULT: Document should not save or finalize with a sponsor code that is not found. An error should be displayed indicating the sponsor is invalid.

  * The way this is described could cause some problems. If you create an award with a sponsor that later becomes inactive you wouldn't be able to maintain your document as the hard on save errors also prevent editing. This should probably be done via a validation error which would prevent submission. It should also apply to the prime sponsor field.
  * Joe Williams on Fri, 29 May 2015 12:07:14 -0500 [View Commit](../../commit/4534d9a3a61c3efcc9b9de93bdc71d28e72f90df)
* Fix to Display Only Active Committee Members On Schedule Absentee List
  * Joe Williams on Thu, 28 May 2015 11:51:04 -0500 [View Commit](../../commit/edbc42b86401affc92212a0e36583972b4ab894d)

##coeus-1505.70
* Fix Issue Where Multi Pis Are Removed From Award Upon Editing
  * Joe Williams on Fri, 29 May 2015 14:44:06 -0500 [View Commit](../../commit/9169df3b0c6f0e1411083e74c10949fb1280cee8)
*  Rice upgrade for rice quartz job monitoring, ehcache statistics monitoring, kc quartz job monitoring, SQL monitoring.
  * Travis Schneberger on Fri, 29 May 2015 17:19:03 -0400 [View Commit](../../commit/34fdc9dfad0dc9903e836f32e8075c0aca899b0f)
* Disable Reset To Default Capabilities When Budget Is View Only
  * Joe Williams on Fri, 29 May 2015 12:48:47 -0500 [View Commit](../../commit/18df6cb41cc4a4c6b5269a7913bf6d6df8f64cee)

##coeus-1505.69
* Updating docs with supported infastructure
  * Travis Schneberger on Fri, 29 May 2015 10:30:59 -0400 [View Commit](../../commit/ead3ae673109f6c72749a6dc473a0d42b9482977)
* Adding null check to avoid a NPE for an anticipated award type.
 Code cleanup.
  * Travis Schneberger on Fri, 29 May 2015 10:25:31 -0400 [View Commit](../../commit/ea974ef658ffebca00714d4a4771e6b5c2b79472)
* Removing unused integration test initalization logic
  * Travis Schneberger on Fri, 29 May 2015 10:13:08 -0400 [View Commit](../../commit/e06acb545eb6d1afe53730c9f60385699381e3eb)
*  enable java melody
  * Travis Schneberger on Fri, 29 May 2015 10:12:43 -0400 [View Commit](../../commit/b60cf41839c3e97992cee3027fd7d5cb461cb705)
*  Allow same person to be added under different roles.
  * As an Award Maintainer, I need to set up new, and maintain existing Awards.
  * When adding Unit and Sponsor Contacts, I sometimes need to add the person to multiple project roles. This usually occurs with small/independent industrial and foundation sponsors in the Sponsor Contacts; and with small internal departments in the Unit Contacts panel.
  * Currently, the system will not let me add the same person to multiple roles. I get an error message on the top of the page, and a specific error above the panel identifying the person saying they are already added to contacts.

  * Steps to reproduce:
  * 1 Either create a new award, or open an existing award in Edit mode.
  * 2 Select a Transaction type on the Award panel.
  * 3 Click the Contacts tab to open
  * 4 Expand the Sponsor Contacts panel.
  * 5 Search for an address book person to add; select a project role; Add.
  * 6 Search the address book again for the same id added in step 5; select a different project role. Add.
  * Result: Error on page and above panel stating that the person already exists.
  * Desired Result: Allow duplicates for all Award contacts; Sponsor, Unit, Central Admin.
  * Gayathri on Thu, 28 May 2015 10:23:20 -0700 [View Commit](../../commit/887b8a0c110d14ca9f5cee73b8a2c4ccd51cf1e2)
* fixes issue when adding fringe amounts the award budget sumary tab

  * When adding fringe amounts in the award budget summary tab every time you navigate to the paramters tab, the fringe amount will increase
  * Joe Williams on Tue, 26 May 2015 13:02:49 -0500 [View Commit](../../commit/038a9cfa54d76af45ac8e1c68844bfc242d154fc)
*  Suppress notification if business rule failure on data override
  * In the Kualico instance, the system still presents the Data Override Notification even if entered item was invalid.The Notice should NOT be sent.
  * Steps:
  * In an enroute proposal; OSP admin uses Data Override. Example: Award ID:
  * If user enters a value in the 'change' field that does not match the valid criteria (too few #/, too long, not a true Award ID) the system outlines the field in red and presents an error warning in the window; but the user can still click 'create override'; the window closes, and the Notification window still presents to alert Aggregator of override. But the override did NOT occur.
  * The Notification window should NOT be generated if the override did not occur.
  * In the MIT QA instance, the data override notification "prompt user' is NOT CHECKED. So these incorrect notices are being sent.
  * The RESKC-485 case fixes the issue of the override validation error message not appearing on the proposal screen when the override modal window closes.
  * This case is to fix the notice from being generated when the override action is not performed due to invalid/incomplete entry.
  * Gayathri on Wed, 27 May 2015 14:45:39 -0700 [View Commit](../../commit/4e0173e80c4174eaaad4a369c519fd3647e13b3c)

##coeus-1505.68
* Add Include Custom Action Urls On All My Protocols Search
  * Joe Williams on Tue, 26 May 2015 10:59:04 -0500 [View Commit](../../commit/a1dade2b0085e1002a3386dd1daf5d9f38590dd6)

##coeus-1505.67
* New parameter for Default Email Recipient
  * Joe Williams on Wed, 27 May 2015 15:55:29 -0500 [View Commit](../../commit/6ec322368d14c0ebe58b3876d94e8dc8353a430f)

##coeus-1505.66
*  Fixing report amounts for awards.
steps to reproduce:
  * 1: Central Admin >click link for Current & Pending to open window
  * 2 click show. Print reports
  * 3. click icon for Person Search in Current Report or Pending Report (result will populate both fields)
  * 4. Enter search criteria, to locate a person with current awards (jtester in kualico)
  * 5 click search
  * 6. select the person from the list and click return value
  * 7. click [initiate report] for Current - view results on screen
  * Expected results:
  * A single row for each award maintained as "current" displaying the obligated amount from the award.
  * Actual result:
  * Some awards are showing double the amount obligated. In Kualico, some other multiple of the current obligated is appearing.
  * Gayathri on Wed, 27 May 2015 12:15:32 -0700 [View Commit](../../commit/e631f92ffd8a16f693eed90f1496cebf404f790f)
* copy over modular budgets when proposal is copied

  * As a proposal aggregator, I need to copy proposals & budgets. When I copy a proposal & budget with a modular budget filled with details that were either manually added or sync'd from the detailed budget, that screen is not being copied to the new proposal. If I am trying to quickly prepare a change/corrected s2s submission, this missing information will cause another error at the sponsor.

  * Confirmed problem in res-demo1 1505.47 05-20-2015 10:49

  * Steps to duplicate:
  * Locate or create a proposal & budget with the Budget > Modular screen completed.
  * Example: #553 in res-demo1.
  * Copy the proposal> select to copy for submission budget (or version with modular complete)
  * In the new proposal (example #554); notice the following:
  * S2S opportunity >Forms > Optional Modular Budget form still checked to 'include'
  * Budget > Budget Settings > Modular checkbox still checked
  * Budget > Modular Budget screen > blank. No details copied.
  * Joe Williams on Wed, 27 May 2015 13:37:12 -0500 [View Commit](../../commit/4e3eb00e3b8799efae7189d928a43c2c352e0fcd)

##coeus-1505.65
*  STE in dataoverride when using award id
  * As an OSP Contract Administrator and proposal approver, I need to use data override to correct information on routing proposals (defined in the maintenance doc 'proposal dev editable columns).

  * To duplicate;
  * As Quickstart in res-demo1, open a proposal in approval pending status
  * Open DataOverride from toolbar
  * Select Award ID
  * Enter the 12 digit award id
  * When I enter a valid award id, it takes it. If I enter an invalid one, the modal shows an error but if I go ahead and submit, I either get a STE or screen goes blank.

  * org.kuali.rice.core.api.exception.RiceRuntimeException: Exception trying to invoke action SAVE for document: 4690
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.performWorkflowAction(DocumentControllerServiceImpl.java:892)
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.save(DocumentControllerServiceImpl.java:285)
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.save(DocumentControllerServiceImpl.java:266)
	at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase.save(ProposalDevelopmentControllerBase.java:257)
	at org.kuali.coeus.propdev.impl.dataovveride.ProposalDevelopmentDataOverrideController.createOverride(ProposalDevelopmentDataOverrideController.java:115)
	at org.kuali.coeus.propdev.impl.dataovveride.ProposalDevelopmentDataOverrideController$$FastClassBySpringCGLIB$$76e3085c.invoke(<generated>)

  * Caused by: java.lang.RuntimeException: No PersistenceProvider handles type: class org.kuali.kra.award.home.Award
	at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.persistenceProviderForType(ProviderBasedDataObjectService.java:266)
	at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.findMatching(ProviderBasedDataObjectService.java:96)
	at org.kuali.coeus.propdev.impl.core.SubmissionInfoServiceImpl.getProposalCurrentAwardVersion(SubmissionInfoServiceImpl.java:303)
	at org.kuali.coeus.propdev.impl.core.SubmissionInfoServiceImpl.getProposalCurrentAwardSponsorAwardNumber(SubmissionInfoServiceImpl.java:169)
	at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentRule.processProposalRequiredFieldsBusinessRule(ProposalDevelopmentDocumentRule.java:319)
	at
  * Gayathri on Tue, 26 May 2015 16:18:27 -0700 [View Commit](../../commit/b62b0145f680376a40523f1c68343f995d476e83)

##coeus-1505.64
* disable autocalculate, and syns/recalculate modular budgets when in view only mode

  * When proposal is opened in view mode, budget is also opened in view mode but user has access to generate all periods and sync, calculate buttons are enabled in modular budget.

  * Case 1: Proposal is opened by someone with view access only
  * Case 2: Proposal is opened with Search proposals: view link, regardless of user’s access
  * Case 3: User with budget creator access opens a budget currently being edited by another user (locked for editing view status)
  * In all cases, the sync to modular information is saved.
  * In some cases, the institutional commitments reset to default button result is saved. (If only this button is clicked, results don’t save. If the viewer also clicks the sync button in modular section, the reset to default action is saved.)
  * In all cases, the autocalculate function will run, but the results will not save on return to/close proposal action.

  * Steps to reproduce:
  * 1. As quickstart, create a proposal with NIH as sponsor. Add PI Nicolas Majors. Add users oblood and chew as Budget
  * Creators Add user psmock as Viewer.
  * 2. Save and close. Logout.

  * For Case 1: Proposal is opened by someone with view access only
  * 1. Login as oblood. Create budget version named < oblood version >. Add non‐personnel item, period 1 only. Save, return to proposal. Close (yes to save). Logout.
  * 2. Login as psmock. Click Budget in left navigation bar. Click on oblood version to open. Navigate to modular section. Click ‘sync’. Budget information for Period 1 is synced. Click autocalculate periods link. Budget for all periods is generated (confirm by viewing Budget Summary). Click return to proposal. Close (btw: user is prompted for save, but this prompt shouldn’t happen in view mode).

  * Case 2: Proposal is opened with Search proposals: view link, regardless of user’s access
  * 1. Login as chew. Create budget version named < chew version >. Complete salary detail for Majors. Add personnel item for Majors with 10% effort, 5% charged. Add non‐personnel item Materials & Services $50,000. In Institutional Commitments, Cost Sharing section, Period 1: enter 100 for Percentage, < dept1 > for Source account. Save. Return to proposal. Close (yes to save). Logout.
  * 2. Login as quickstart. Use Search Proposal link, enter proposal number, click ‘view’ from the results Actions options. Click Budget. Open chew version. Navigate to Institutional Commitments. Click reset to default button. Information for percentage and source is cleared. Navigate to Modular section. Click sync. Information for period 1 is synced.

  * Case 3: User with budget creator access opens a budget currently being edited by another user (locked for editing view status)
  * 1. Login as oblood. Open proposal. Create new budget version < oblood 2 >. Add non‐personnel item Materials & Services, $50,000. Save.
  * 2. Open a new incognito or private browsing window. Login as chew. Open the same proposal. Open oblood 2 budget version. Navigate to Modular section. Click ‘sync’. Information syncs and saves. (Since proposal is locked for editing, sync button should not be active.) Click autocalculate all periods link. Budget information for all periods is generated (confirm by viewing Budget Summary).

  * Results: Action buttons are available to user when budget is accessed in View Mode
  * Expected Results: These action buttons should not appear, since action should only be available to users when editing.
  * Joe Williams on Tue, 26 May 2015 16:59:48 -0500 [View Commit](../../commit/d2800edc293ad638e642955f08ecf5ed331e9a3d)

##coeus-1505.63
* RESKC-371
  * This does not happen all the time but when it does, there's no way around it.

  * 1. Add an opportunity to a proposal, PA-C-R01
  * 2. Try to add narrative Budget Justification.

  * Get STE

  * org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter 'previousValue' is not present at org.springframework.web.method.annotation.RequestParamMethodArgumentResolver.handleMissingValue(RequestParamMethodArgumentResolver.java:201) at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:92) at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:77) at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:157) at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:124) at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:745) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:685) at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:80) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:919) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:851) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:953) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:855) at javax.servlet.http.HttpServlet.service(HttpServlet.java:646) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:829) at javax.servlet.http.HttpServlet.service(HttpServlet.java:727) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:78) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:62) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:89) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:77) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:327) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:82) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:62) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:320) at org.kuali.rice.krad.web.filter.BootstrapFilter.doFilter(BootstrapFilter.java:199) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.PerformanceLoggingFilter.doFilter(PerformanceLoggingFilter.java:80) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.SessionExpiredFilter.doFilter(SessionExpiredFilter.java:46) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.HideWebInfFilter.doFilter(HideWebInfFilter.java:68) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.AbstractRequestLoggingFilter.doFilterInternal(AbstractRequestLoggingFilter.java:214) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220) at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122) at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170) at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103) at org.apache.catalina.valves.RemoteIpValve.invoke(RemoteIpValve.java:683) at org.apache.catalina.valves.CrawlerSessionManagerValve.invoke(CrawlerSessionManagerValve.java:180) at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:950) at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116) at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:421) at org.apache.coyote.ajp.AjpAprProcessor.process(AjpAprProcessor.java:188) at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:611) at org.apache.tomcat.util.net.AprEndpoint$SocketWithOptionsProcessor.run(AprEndpoint.java:2403) at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145) at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615) at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61) at java.lang.Thread.run(Thread.java:745)
  * Gayathri on Tue, 26 May 2015 13:56:52 -0700 [View Commit](../../commit/e118ed16b6e4c9a0c99e82441af3e9fc28a2cf73)
* Award Budget Approval Saving wrong FnA cost
  * Joe Williams on Tue, 26 May 2015 15:42:11 -0500 [View Commit](../../commit/34bd531130ba5a546579cb3be63bd4b9807ca432)
*  Fixing award copy
  * 1. Created award with all required fields to submit.
  * 2. Open T&M and add money, route.
  * 3. Open award, create budget for the obligated amnt in award.
  * 4. Route, approve and post budget.
  * 5. Open award hierarchy actions, copy new.
  * 6. Open new award, navigate to budget versions, notice the budget has been copied over
  * Gayathri on Tue, 26 May 2015 13:03:37 -0700 [View Commit](../../commit/1dc3d17a33b45c5f7d96f58a5470a7c27f30b6f3)
* Adding Default Congressional District to Other
  * Organizations
  * rashikpolus on Mon, 1 Dec 2014 20:24:08 +0530 [View Commit](../../commit/00b50b0f3d1b5ba7cf86dc7bdcb45bc25eefaf9a)
* Fixes issues with awards with null fields on award funding proposal
  * Joe Williams on Tue, 26 May 2015 13:10:14 -0500 [View Commit](../../commit/294d2f5a9792d921774c874213e8df8457a5f29f)
* Adds Parameters For Comment Type Codes
  * Joe Williams on Tue, 26 May 2015 10:07:24 -0500 [View Commit](../../commit/b448141bf75a59eafbec9841f78423dc6a5b2519)

##coeus-1505.62
* fix compiler error related to generics, fix compiler warnings
  * Travis Schneberger on Tue, 26 May 2015 15:58:53 -0400 [View Commit](../../commit/ca0c90838bd55f4b683b9e17d6e1c7550b29e632)
* Fixes Issues With Sorting of Budget Persons
  * vineeth on Thu, 15 Jan 2015 16:49:20 -0500 [View Commit](../../commit/51fb5dc493e10c206496f3310234ac5eaae56058)
*  Do not show cancelled award docs in T&M history
  * As an award administrator, I may need to cancel an award edit transaction instead of saving or submitting. The information may be incomplete, incorrect, or I may have selected the wrong award/node by mistake. I should be able to use the cancel button on the Actions panel to completely delete any updates or changes.

  * Steps:

  * Open existing award
  * Go to time and money and check history, note current version number and update timestamp/user
  * Return to award and click edit
  * Go to award actions and click cancel
  * Reopen award
  * Go to time and money and check history: cancelled award version will now be listed

  * Expected Result: all evidence of the cancelled document are removed from the Award, T&M, or Award Budget documents.
  * Currently, any cancelled documents are appearing as a Version in the T&M History panel.
  * Gayathri on Tue, 26 May 2015 10:41:02 -0700 [View Commit](../../commit/f84addc63df91c0afcbb4bcb4464345f469b9bb3)
* fix to display TBN table on add budget personnel

  * Tried to add a TBA person to a budget; but the list does not appear and the modal window does not fully generate.
  * I verified that there are 7 defined TBA persons in the maintenance document.

  * Steps to duplicate:
  * Locate an in-progress proposal or create a new one.
  * Open or create a budget version
  * On the Project Personnel screen, use the +Add Personnel button to open the modal
  * Select TBA from the 'search for' list option

  * Expected result: the list of maintained To Be Named persons should present with the ability to select how many to apply.

  * Current result: the field updates to To Be Named, but the rest of the modal window does not generate. There is only a letter-box window containing this type field. User cannot add a TBA person to the budget.
  * Joe Williams on Tue, 26 May 2015 09:50:22 -0500 [View Commit](../../commit/0d6467ccecdd72c6209a1ed2a4ce03910044d7aa)
* display disaproved submitted protocols in meeting

  * Amendment or Renewal with or without Amendment docs that are assigned to a Full Committee Meeting Agenda appear in the Protocol Submitted panel of the meeting document but disappear from that list after the recording of Disapprove decision on the amendment doc. This is the opposite of what is required.

  * On further searching, it appears that the after taking the Disapprove action on an amendment or renewal, the entire amendment/renewal record disappears. If attached steps are followed for a renewal w/amendment, the record disappears after Disapprove. If a new renewal is created, KC will maintain sequence structure (so R002 will appear, if R001 was preceding), but R001 will not return from search results.

  * Steps:

    Login as quickstart
    On Central Admin tab click on Lookup next to Human Participants
    Select Protocol Status – Active – Open to Enrollment
    Click search
    Click edit in Actions column on result list and Protocol displays
    Click on Protocol Actions tab
    Click show on Request an Action panel
    Click show on Create Renewal with Amendment
    Enter something in Summary box and check all the Amend boxes
    Click create button
    Record the Protocol # for this amendment (1502000021R002)
    Click cancel for Notification
    Click on Protocol Actions tab
    Click show on Data Validation panel
    Click turn on validation – fix any errors and save
    Click show on Request an Action panel
    Click show on Submit for Review panel
    Submission Type Continuing Review/Continuation with Amendment, Submission Review Type Full
    Select Committee and Schedule Date (next available)
    Select one primary reviewer
    Record Schedule date
    Click submit button
    Click show on Request an Action
    Click show on Assign to Agenda
    Click submit
    Click close button for protocol
    On Central Admin tab click lookup on IRB Schedules
    Enter the Schedule Date From and Schedule Date To that matches the Full Committee Schedule Date from above.
    Committee Id – select from dropdown menu
    Click search
    Click edit on result list item
    Click show on Protocol Submitted
    Verify that the protocol Amendment for this scenario is listed as In Agenda
    Click show on Attendance
    Add 3 Voting Members as Present Voting (only if there are not at least 3 Voting Members Present)
    Click close for the Meeting document – yes for “Would you like to save meeting data before close it?”
    Lookup for Human Participants on Central Admin tab
    Enter the Renewal with Amendment doc nbr in Protocol # field and search
    Click edit on the result list item
    Click on Protocol Actions tab
    Click show on Request an Action
    Click show on Record Committee Decision
    For Motion Type select “Disapprove”
    Enter No = 0 and Yes = 3
    Show on Review Comments – type in a comment
    Click final check box for the Comment
    Click add
    Click submit
    On Disapprove panel click submit
    Verify that Submission Status and Status are Disapproved
    Click close
    Click on Central Admin tab
    Click on IRB Schedules on Central Admin tab
    Enter the Schedule Date From and Schedule Date for this amendment
    Click edit on result list item
    Click show on Protocol Submitted
    The Renewal with Amendment Protocol number for this scenario is no longer listed. Expectation is that it will still be listed as a Protocol Submitted.
  * Joe Williams on Fri, 22 May 2015 10:59:53 -0500 [View Commit](../../commit/a15a9120600dc6bd1d6300ecf97c2ecc2d56ea30)
* Institutional Proposal's award type not saving for an anticipated award type.
  * Travis Schneberger on Fri, 22 May 2015 11:18:59 -0400 [View Commit](../../commit/f4b4b177b8ea1ddc2267358e12e27252f3d809cb)
* getting budget before reloading, fixing reload error.
  * Travis Schneberger on Fri, 22 May 2015 09:18:48 -0400 [View Commit](../../commit/c1c476618b1bdc3b6e3934a3ca341325808dbfc9)
* Award Budget causes an exception when adding personnel details.
  * Travis Schneberger on Fri, 22 May 2015 09:12:41 -0400 [View Commit](../../commit/4ecc447a74cdc9de91464d66e625402b6dda7a54)
* code cleanup in preparation for bugfix
  * Travis Schneberger on Fri, 22 May 2015 09:12:00 -0400 [View Commit](../../commit/19e51dda6dc904ba00be227649f1e58f55d56fc5)
* The reject button for the Award Document is missing when the document is on the initial node.
  * Travis Schneberger on Fri, 22 May 2015 08:37:33 -0400 [View Commit](../../commit/4561b722f639bedd5c7ce2c4c0087cdcd408bb7d)

##coeus-1505.61
* No Changes


##coeus-1505.60
* No Changes


##coeus-1505.59
* No Changes


##coeus-1505.58
* No Changes


##coeus-1505.57
* No Changes


##coeus-1505.56
* Clarifying documentation, fixing typos, changing recommended git version
  * Travis Schneberger on Fri, 22 May 2015 18:35:52 -0400 [View Commit](../../commit/0d9d29050adddddb3c1eeed9d08ab6c278e08eb4)

##coeus-1505.55
* Fix award budget versioning issues

  * When versioning awards the budgets need to stay with the original award, but new awards need to display all budgets. Additionally the budget creation process wasn't looking at the correct list of budgets and only the current awards budgets which meant it could easily ignore previously posted budgets.
  * blackcathacker on Fri, 22 May 2015 14:36:31 -0700 [View Commit](../../commit/b6734a4345c6c7e08675860d3995a308c67bc54e)
* Fix Java 7 compilation, code cleanup
  * Travis Schneberger on Fri, 22 May 2015 16:55:49 -0400 [View Commit](../../commit/c566ab7abe65b86773ac7725a17bf38c24b675ca)

##coeus-1505.54
* No Changes


##coeus-1505.53
*  fix award budget issues
  * Award budget documents seem to be attached to a particular sequence of the award and when new award sequences are created you can no longer view the budget created on an earlier sequence. Such as today account 2388937. When this happens users are also able to create new budget versions in the new award sequence regardless of the status of the earlier budget version. So now account 2388937 has two budget documents 1440820 and 1439251. Which again, shouldn't affect our work or SAP but I don't think this is how we want this to work.
  * Award budget totals when editing / versioning an award are not right either.
  * Gayathri on Fri, 22 May 2015 09:29:50 -0700 [View Commit](../../commit/0a7c381178303321d9753e3c9436ea94ae5b81c7)
* Removing validation constraints from award comments
  * Travis Schneberger on Fri, 22 May 2015 11:35:42 -0400 [View Commit](../../commit/199f9746681b9825ce1bf816d2aed7b2ef924a62)

##coeus-1505.52
* code cleanup, minor schemaspy fixes.
  * Travis Schneberger on Fri, 22 May 2015 10:07:13 -0400 [View Commit](../../commit/e72cb2dedf7396823efc6e83f3030c1e11c930ed)
* Validation for eRA Commons User Name is based on sponsor group NIH

  * Currently any proposal that has a sponsor under the 'NIH Multiple PI' Sponsor Hierarchy will require the eRA Commons username for PD/PIs, and if missing it will throw the following validation: eRA Commons User Name is missing for <insert PI name>.

  * Originally we tied this validation to the 'NIH Multiple PI' sponsor hierarchy, but since schools may be using this hierarchy for all sponsors (not just NIH) we need to tie this validation to another hierarchy.
  * Joe Williams on Fri, 22 May 2015 09:02:53 -0500 [View Commit](../../commit/5fca18771194606d0554d80c096d7ba883d59ee2)
* Fixed F and A cost resetting when approve Award Budget
  * Travis Schneberger on Fri, 22 May 2015 08:30:43 -0400 [View Commit](../../commit/a2606ad24055755b7023b1e4bbfbc2265fbae335)
* filter subaward funding source with query criteria
  * Travis Schneberger on Thu, 21 May 2015 11:28:48 -0400 [View Commit](../../commit/49294778766e32bbd5bc541d654529bbd6cdf7df)
* populate the anticipated award type description
  * Travis Schneberger on Thu, 21 May 2015 11:13:19 -0400 [View Commit](../../commit/aaca8247cfb21b0d965702150f74bcc7de64e504)
* adds lookup fields related to s2s
  * Travis Schneberger on Thu, 21 May 2015 10:54:19 -0400 [View Commit](../../commit/6fffc2914affe29761f7298ed1d3385690dcc6a7)

##coeus-1505.51
* Rice upgrade for security fix KULRICE-14248 and jdk8 bug RESKC-452
  * bsmith83 on Thu, 21 May 2015 16:16:45 -0700 [View Commit](../../commit/49277aa09477fec4d73531142a689b0a70f8146f)
* Add Numeric Validation to BudgetLineItem Quantity
  * Joe Williams on Thu, 21 May 2015 15:56:35 -0500 [View Commit](../../commit/02c38d3ff0ce5d27c625588d8b496434c308a79b)
*  STE while printing budget summary with TBS budget person

  * While priting budget summary with a TBS person in the budget, the following STE was received
  * ERROR org.kuali.rice.krad.web.controller.UifHandlerExceptionResolver - For input string: "TBA4650"
  * java.lang.NumberFormatException: For input string: "TBA4650"
  * at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
  * at java.lang.Integer.parseInt(Integer.java:492)
  * at java.lang.Integer.valueOf(Integer.java:582)
  * at org.kuali.coeus.propdev.impl.core.DevelopmentProposal.getParentInvestigatorFlag(DevelopmentProposal.java:2131)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getInvestigatorFlag(BudgetBaseStream.java:1928)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getReportTypeVO(BudgetBaseStream.java:2296)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.addReportTypeVO(BudgetBaseStream.java:2244)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getReportTypeVOList(BudgetBaseStream.java:2227)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.setReportTypeForBudgetSalarySummary(BudgetSummaryXmlStream.java:199)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getSalarySummary(BudgetSummaryXmlStream.java:185)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummary(BudgetSummaryXmlStream.java:156)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummaryReportPageType(BudgetSummaryXmlStream.java:138)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummaryReport(BudgetSummaryXmlStream.java:112)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.generateXmlStream(BudgetSummaryXmlStream.java:86)
  * at org.kuali.coeus.common.framework.print.AbstractPrint.renderXML(AbstractPrint.java:120)
  * at org.kuali.c
  * Gayathri on Thu, 21 May 2015 11:28:00 -0700 [View Commit](../../commit/9eebe1e17a689dd496ae1f3d17834ada7db1b2ef)

##coeus-1505.50
* excluding amount from ip rule
  * Travis Schneberger on Thu, 21 May 2015 11:49:06 -0400 [View Commit](../../commit/980462adb249dde972e0cd002d482f276862c863)
* fix where the negotiation counter is off by one day
  * Travis Schneberger on Thu, 21 May 2015 11:01:11 -0400 [View Commit](../../commit/569c9c8c370ca6411e56db1fac856e4e37301b3c)
* Fix to AwardComment to display correct update timestamp string
  * Joe Williams on Wed, 20 May 2015 14:53:48 -0500 [View Commit](../../commit/203598d178e7b244f4bdab368b9c7c3eaefd2746)

##coeus-1505.49
*  support the oracle thin driver in schemaspy
  * Travis Schneberger on Thu, 21 May 2015 09:39:15 -0400 [View Commit](../../commit/e458426eafb623f3d04e349bfc6bf2772bb8d353)
*  Fixing occasional STE in award
  * This error cropts up occassionally when you try to save an award.

  * SEVERE: Servlet.service() for servlet [action] in context with path [/kc-qa-wkly] threw exception
  * java.lang.RuntimeException
	at org.kuali.rice.kns.web.struts.form.pojo.PojoFormBase.populateForProperty(PojoFormBase.java:233)
  * Caused by: java.lang.NullPointerException
	at org.kuali.kra.award.home.Award.getAwardCgb(Award.java:3548)
	... 76 more
  * Gayathri on Wed, 20 May 2015 15:19:10 -0700 [View Commit](../../commit/75294447d9bfa8db54422d8b87682832f71ab466)

##coeus-1505.48
* Rice upgrade for RESKC-432
  * bsmith83 on Wed, 20 May 2015 15:25:33 -0700 [View Commit](../../commit/b9e7b201a08ef08e0af544563f5cc6279a5e33e8)

##coeus-1505.47
* fix compilation issue on java 7 related to generics
  * Travis Schneberger on Wed, 20 May 2015 11:56:16 -0400 [View Commit](../../commit/53047746238ee7844f65271b4134fee78a00687e)
*  Fixing printed dates and amounts
  * 1. Create a new Award, completing all fields required to save and submit the document and to create a Time & Money document, but do not submit the Award document
  * 2. Click Time & Money
  * 3. On the Transactions panel, add a transaction, such as the following:
   Source Award: External
  Destination Award: 000021-00001
  Obligated Change: 100.00
  Anticipated Change: 100.00
  * 4. Submit the Time & Money document
  * 5. Return to the Award and Submit the Award document
  * 6. Once the Award is submitted, observe the Time & Money panel on the Award tab and verify the accurate Anticipated and Obligated dates and values are displayed
  * 7. Click the Award Actions tab
  * 8. Click Show on the Print panel
  * 9. On the Award Notice row, click the Select All action button
  * 10. Click Print on the Award Notice row
  * 11. Observe the Anticipated and Obligated values and Obligated Start and End Dates on the printed Award Notice
  * +Actual Behavior+: The system does not display the Obligated Start and End Dates on the printed Award Notice for Version #1. The system displays $0.00 for all Anticipated and Obligated amounts.
  * +Expected Behavior+: The system should display the Obligated Start and End Dates on the printed Award Notice. The system should display accurate values for all Anticipated and Obligated amounts. See attached screen images.

  * 12. On the Award, click Edit
  * 13. Without making any changes, other than selecting a Transaction Type, Submit the Award
  * 14. Print and observe the Award Notice for Version 2 of the Award
  * +Actual Behavior+: The system displays the correct Obligation Start and End Dates. The system displays the correct Anticipated and Obligated amounts.

  * +Expected Behavior+: The system should display the correct dates and amounts on the Award Notice that reflect the current version of the Award.

  * 15. Edit the Time & Money document
  * 16. On the Transactions panel, add a transaction, such as the following:
  Source Award: External
  Destination Award: 000021-00001
  Obligated Change: 250.00
  Anticipated Change: 250.00
  * 17. Submit the Time & Money document
  * 18. Return to the Award
  * 19. Once the Award is submitted, observe the Time & Money panel on the Award tab and verify the accurate Anticipated and Obligated dates and values are displayed
  * 20. Click the Award Actions tab
  * 21. Click Show on the Print panel
  * 22. Click Print on the Award Notice row
  * 23. Observe the Anticipated and Obligated values and Obligated Start and End Dates on the printed Award Notice
  * +Actual Behavior+: Again, the system does not display the current Obligated Start and End Dates on the printed Award Notice. The system displays $100.00 for all Anticipated and Obligated amounts, the amounts associated with Version 1 of the Award.
  * +Expected Behavior+: The system should display the accurate Obligated Start and End Dates on the printed Award Notice for the current version of the Award, even if a new Time & Money document has been edited and submitted for the existing Award version. The system should display accurate values for all Anticipated and Obligated amounts reflecting the current version of the Award, even if a new Time & Money document has been edited and submitted for the existing Award version.
  * Gayathri on Tue, 19 May 2015 15:20:02 -0700 [View Commit](../../commit/b71459b454b890485c5a72e238ef9035bf26afe4)
* Rice update for KULRICE-12991
  * bsmith83 on Tue, 19 May 2015 13:42:57 -0700 [View Commit](../../commit/0646694b70c3c8de7df65ee3e23287498a07303c)
*  making award title required in the data dictionary to avoid a constraint violation when award title is not entered.
  * Travis Schneberger on Tue, 19 May 2015 16:13:03 -0400 [View Commit](../../commit/2851c3ff2f392e08c626d024c41e2db801cd23c9)
*  budget personnel STE
  * Steps to reproduce
  * Create a new proposal
  * Add several persons to the Key Personnel screen for budget use
  * Create a new detailed budget version
  * Define the budget persons with appointment types & salaries
  * On Assign Personnel to Period> select a person, maintain the required fields, click Save.
  * STE appears.
  * java.util.ConcurrentModificationException at java.util.Vector$Itr.checkForComodification(Vector.java:1184) at java.util.Vector$Itr.next(Vector.java:1137) at org.eclipse.persistence.indirection.IndirectList$1.next(IndirectList.java:618) at org.kuali.coeus.common.budget.impl.calculator.SalaryCalculator.filterBudgetPersons(SalaryCalculator.java:159) at
  * Gayathri on Tue, 19 May 2015 11:50:53 -0700 [View Commit](../../commit/549c441d856b0bedc5e5d63de4b17b9394fa9d42)
* UnitAgenda does not apply to subunits.

  * To reproduce: Create a UnitAgenda with a unit number of some parent unit (BL-BL in demo data).  Add a proposition to call a function such as All proposals when 'true'.  Add an action such as a KC Validation Action where it displays a warning such as (Area Name: Proposal Details, Page Id: PropDev-DetailsPage, Section Id: PropDev-DetailsPage-Section).  Create a proposal with a lead unit that is above the unit in the agenda (000001 in demo data).  Add a key person that belongs to a unit in the agenda or a subunit (BL-RUGS or BL-BL in demo data).  Turn validation on.  A warning from KRMS should appear.  It does not.
  * Travis Schneberger on Tue, 19 May 2015 14:36:58 -0400 [View Commit](../../commit/1713c9255a506294259b2384c68695491dca83cf)

##coeus-1505.46
*  Fix IP creation from proposal log
  * Create a proposal log and blanket approve.
  * Click on Create IP link, search for proposal log.
  * Results display with edit, copy buttons instead of select.
  * There's no way to select a proposal log.
  * Gayathri on Mon, 18 May 2015 20:41:50 -0700 [View Commit](../../commit/0a66d55d943809e4dd6df7615f1a4a28b8754649)
*  Change column length of indicator fields in IP
  * 1. Create and submit/blanket approve a Proposal Log
  * 2. Create a new Institutional Proposal, using the just-created Proposal Log
  * 3. Complete all required fields to save and submit the document
  * 4. Submit the document so that the Status = FINAL
  * 5. On the Institutional Proposal tab, click Edit
  * 6. Click the Institutional Proposal Actions tab
  * 7. Click Submit (or Blanket Approve)
  * Actual Behavior: The system does not allow the user to submit the document. The system indicates that three error messages were found on the page. The system displays three instances of the following error message below all panels: Must be at most 1 characters
  * Expected Behavior: The system should allow the user to submit the Institutional Proposal document. The system should not display any error messages. If the system displays any valid error messages, the system should indicate to the user to how fix them.
  * Gayathri on Tue, 19 May 2015 09:47:04 -0700 [View Commit](../../commit/045bc87f662b10841c8339d5b98b098a01cf9c34)

##coeus-1505.45
*  fix schemaspy authz when a user does not have a session established.
  * Travis Schneberger on Tue, 19 May 2015 09:57:40 -0400 [View Commit](../../commit/e17a1c3923aecf2f43ac6d8ac43b23f9878ef943)

##coeus-1505.44
* updating documentation for changes in javadoc tool and for the move to Java 8
  * Travis Schneberger on Mon, 18 May 2015 10:28:59 -0400 [View Commit](../../commit/168bb268de43b7362d6fd9df11ae0d7a13bc6b09)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

* fix ability to submit document with multi choice
* fix ability to delete multi choice when form first opens
* now allows whitespace in prompt and description
  * Travis Schneberger on Tue, 19 May 2015 08:55:16 -0400 [View Commit](../../commit/7d197581c5c77714aa37311f0a58085b73d81c01)

##coeus-1505.43
* No Changes


##coeus-1505.42
* return to award from award budget if budget was opened from award

  * Open an Award
  * Go to Budget Versions
  * Create or open an Award Budget
  * Perform a budget action such as approve, reject, or even close

  * Actual Results:
  * -User is taken to the Sys Admin portal.

  * Expected Results:
  * -User remains in the Award.
  * Joe Williams on Fri, 15 May 2015 14:59:20 -0500 [View Commit](../../commit/3248d256434f9643a6de6dc94b9134cd27360818)
* Fix for award error when saving on Payment, Reports & Terms

  * -Create new award
  * -Enter required data on Award tab, save
  * -Go to Payment, Reports & Terms tab
  * -Click save, error occurs

  * This is only happening on new awards.
  * HTTP Status 500 -

  * type Exception report

  * message

  * description The server encountered an internal error that prevented it from fulfilling this request.

  * org.springframework.dao.DataIntegrityViolationException: OJB operation; SQL []; ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * ; nested exception is java.sql.SQLIntegrityConstraintViolationException: ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * Joe Williams on Mon, 18 May 2015 08:49:18 -0500 [View Commit](../../commit/fc05d34448ed466425bc5e731c57673fa6919f2c)
* Java 8: making is possible to turn off java 8 specific javadoc parm
  * Travis Schneberger on Sun, 17 May 2015 21:20:56 -0400 [View Commit](../../commit/7305c54e5731b274ccf72899117af2edeaeefe36)
* Java 8: Fixing drools so that rules files can be loaded from within jars.
  * Travis Schneberger on Fri, 15 May 2015 17:49:07 -0400 [View Commit](../../commit/54be5e8613aa5842803024bc326054a19b51570b)
* Java 8: Fixing tests, changing StringUtils api usage to isBlank which is closer to drool's StringUtils isEmpty method.
  * Travis Schneberger on Fri, 15 May 2015 17:02:22 -0400 [View Commit](../../commit/dc938b3641a91ee4b488fe4b7c71fd5db7e3664e)
* Java 8: Upgrading Drools and MVEL to support Java 8, removing incorrect references to drools string utils
  * Travis Schneberger on Fri, 15 May 2015 15:14:13 -0400 [View Commit](../../commit/f144fab784cfbe0d3998437e52406151b53b267e)
* refactoring and added tests
  * Joe Williams on Fri, 15 May 2015 09:42:08 -0500 [View Commit](../../commit/695a397d36d1a398fc1fce040b5e3aa9041b0931)
* Fix to display correct linked subawards when award is versioned

  * 1. Create and submit a new Award (just complete the required fields to save and submit, no need to do a T&M document)
  * 2. Create a new Subaward, adding the just-created Award as the Funding Source, and then submit the Subaward
  * 3. Observe Medusa from both the Award and Subaward view
  * Actual Behavior: The system displays the linkage between the Award and Subaward from both Medusa views.
  * 4. Create and submit a new Proposal Log document
  * 5. Create and submit a new Institutional Proposal document, using the just-created Proposal Log
  * 6. Search for the just-submitted Award document and click the Edit action button
  * 7. Add the just-created Institutional Proposal as a Funding Proposal
  * 8. Select a Transaction Type
  * 9. Submit the edited Award
  * 10. Observe Medusa from the Award, Institutional Proposal, and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from either the Award and Institutional Proposal Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from both the Award and Institutional Proposal Medusa views.
  * 11. Create a Negotiation, selecting Award, Institutional Proposal, or Subaward for Negotiation Association Type and selecting one of the just-created documents
  * 12. Click Save to finalize the Negotiation
  * 13. Observe Medusa from the Award, Institutional Proposal, Negotiation and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from the Award, Institutional Proposal, and Negotiation Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from the Award, Institutional Proposal, and Negotiation Medusa views.
  * Joe Williams on Fri, 15 May 2015 09:39:13 -0500 [View Commit](../../commit/53db7d44ee996b0ac3408b22bceab708c77babec)
* return user to krad portal when closing a transactional document
  * Joe Williams on Fri, 15 May 2015 10:37:34 -0500 [View Commit](../../commit/3fb76b8f8c1a505707271e2765ee0aa0480af2ff)
* Upgrading to Java 8: removing MaxPerm setting since java 8 does not have perm gen space
  * Travis Schneberger on Fri, 15 May 2015 12:46:55 -0400 [View Commit](../../commit/c747ca00a8e0dd01043bc42a9b50b3d5eb3cd84c)
* Upgrading to Java 8: switching version of cglib to use an updated/non-repackaged version of asm
  * Travis Schneberger on Fri, 15 May 2015 12:32:24 -0400 [View Commit](../../commit/b8e88dfdd7cab8052fefe36223f54f71a1cf4449)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

  * code review comments
  * Travis Schneberger on Fri, 15 May 2015 10:43:38 -0400 [View Commit](../../commit/8ecc43ab6555c69c0e48d785b620ba1b48ed7ee4)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521
  * Adds a Multiple Choice question type to the Questionnaire framework. Utilizes a new table to store the multiple choice prompts and descriptions, respectively. Uses the MAX_ANSWERS fields to determine whether the question renders as a set of checkboxes or radio buttons.

  * Additional bugfixes:
* Fixed question deletion causing a constraint violation where a question has an explanation.
* Fixed proper form initialization based on the Response type where the first time a question page was loaded the page would display incorrectly until the response type was changed.
* Fixed the read only display not showing the correct dynamic information based on response type.  This was common when viewing after routing.

  * Other:
  * Cleaned up questionnaire maintenance code that is no longer used as of KC 6.0
  * Added Missing license headers
  * Travis Schneberger on Wed, 13 May 2015 14:54:54 -0400 [View Commit](../../commit/9422724a92bda8496e787abc4ca93e3b95e7eb91)
* Upgrading to Java 8: upgrading jmock
  * Travis Schneberger on Fri, 15 May 2015 11:20:12 -0400 [View Commit](../../commit/280ee3568f8742ad1befe9849da8cff6fb5b2e71)
* Upgrading to Java 8: fixing javadoc errors from Java 8's strict javadoc tool
  * Travis Schneberger on Fri, 15 May 2015 09:27:28 -0400 [View Commit](../../commit/d681620f0f5808b553395d8b62f29af8958faa22)
* Upgrading to Java 8: updating libraries, documentation, fixing test.
  * Travis Schneberger on Thu, 14 May 2015 21:18:16 -0400 [View Commit](../../commit/96c7e65fb0f166ead4e30826416721560f3a9854)
*  Making field readOnly so the values do not get updated while enroute
  * As a viewer of routing proposals, I navigate to review the included S2S Opportunity Forms. Upon opening this screen, all selected forms to include display as unchecked. Confirmed that the items were checked prior to routing; and remain checked if no one views them. But if the screen is opened prior to submitting to s2s, none of these optional forms & their attachments are being submitted.
  * Tried an alternate method to preview S2S forms via the Toolbar menu. At first opening, the checks were there. But when I reopened the toolbar print option in the same session - the checkmarks were gone.
  * This is a serious problem.
  * OSP Admins always verify that the users have checked the correct s2s forms to include, and print/preview some attachments as part of their review from this screen.

  * Created and submitted by user rhanlon
  * PA-C-R01 with Detailed Budget and Subaward Budget selected as optional forms.
  * Confirmed checks prior to submitting.
  * As approver RRabbit - logged in, Action List> opened proposal
  * Navigated to S2S Opportunity screen > Forms - all optional forms unchecked.
  * Gayathri on Thu, 14 May 2015 14:46:01 -0700 [View Commit](../../commit/0ea3178b4ee77c0cd5074cbc3c78b1ff90404762)
* fixes STE when cancelling from add instituional proposal lookup

  * 1. Central Admin > Pre-Award > Institutional Proposal
  * 2. Click on plus sign for creating an institutional proposal
  * 3. On the Proposal Log Lookup screen click on the cancel button
  * RESULT: Stack trace error (see below)
  * EXPECTED RESULT: User should be returned to the KRAD window.

  * org.kuali.rice.krad.datadictionary.DataDictionaryException: Unable to find View with id: Kc-LandingPage-RedirectView?forInstitutionalProposal
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getImmutableViewById(UifDictionaryIndex.java:142)
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getViewById(UifDictionaryIndex.java:128)
  * Joe Williams on Thu, 14 May 2015 12:38:14 -0500 [View Commit](../../commit/9c26bbd42ab635382b1f0eacb9aa70f6755b14f9)
* when proposal is view only don't prompt user to save on close

  * User is confused if they enter a proposal in view mode and then select close that the modal asks if they want to save.

  * Steps to Reproduce
  * 1. Login as quickstart. Create proposal.
  * 2. Add user psmock as Viewer Document level.
  * 3. Note proposal number and doc number. Close. Save.
  * 4. Open incognito or private browsing window.
  * 5. Login as psmock.
  * 6. Use Search Proposal link (Researcher menu) to find proposal number
  * 7. Click ‘view’ link.
  * 8. Navigate to one of the other sections.
  * 9. Click close on that screen. Should not get the ‘do you want to save message’.

  * Results: The modal asking the user if they would like to save document displays.
  * Expected Results: Whenever proposal is in view mode It should not generate the modal asking to save when when closing.
  * Joe Williams on Thu, 14 May 2015 11:21:33 -0500 [View Commit](../../commit/c2a77a56286bf1e1b3ee79196fddf4bba8ff6a38)
* Allow modification of S2S Opportunity anytime before submit

  * Revise selections in S2S Opportunity screen pre- and post-submission
  * As a Superuser or Proposal Approver and Submitter of S2S proposals to Grants.gov, I need to be able revise selections on the S2S Opportunity screen > Opportunity, Forms, and User Attached Forms tabs in proposals that are enroute/under review as well as Approved status, because the Submit to S2S step normally takes place after approval and submit to sponsor.
  * A new permission called 'Modify Proposal Development S2s While Enroute' has been added that controls the ability for a user to make modifications after the proposal is enroute.
  * blackcathacker on Tue, 12 May 2015 20:10:52 -0700 [View Commit](../../commit/5b4625f60f7b28a9f719bb6a47951b2354e83bd0)
* Fixed double headers for cache admin and proposal development documents

  * 1) login as quickstart
  * 2) switch to System Admin Tab (or maintenance tab)
  * 3) Select Action list
  * 4) Open document
  * Result: Double Headers appear
  * Joe Williams on Thu, 14 May 2015 09:55:38 -0500 [View Commit](../../commit/2fe83a31e4911a57708e86cfb1f771f75deeabd6)
* Sort Special Review Type Alphabetically
  * Joe Williams on Wed, 13 May 2015 16:11:13 -0500 [View Commit](../../commit/61b40cc2d03e36f9e5ea7cbe6ba57da375908e6c)
* scale attachment collections better with page resize

  * The new kualico ui, many of the screens redraw when in edit/add mode, putting several columns/buttons out of the window view, requiring scrolling.

  * When I add attachments, I must now use the scroll bar to find/have access to the Details/Edit/Delete options, as well as other columns (userid/timestamp).
  * If I compress the browser window, there is no compacting or wrapping of any column to aid in using a smaller screen.
  * I have to have the browser window open to at least 14.5 inches to see all the columns. If I compact the left navigation bar to icon mode, I still have to have the window at 13 inches to see all columns. (Chrome on a PC)
  * IE, I was able to see all in a 10.5 inch screen if I used icons for left nav bar.

  * Once a user gets the 10-20 narratives uploaded for an NIH submission, they will need to scroll down to get to the horizontal scroll bar, and then scroll back up to get to the Actions column to edit the attachments.
  * The white space is nice, but the row number column could be smaller, as can the Description column. Any ability to wrap text would also help if a user wanted to/had to work in a smaller window.

  * Can something be done to address the expanding window content? Like allowing these columns to text-wrap? In Add Attachments - reducing the column width of the Description field?
  * Joe Williams on Wed, 13 May 2015 13:42:45 -0500 [View Commit](../../commit/e4c0c7b45f8b50236a02e5d7d62e9e45d7f4ec92)
* fix to display sponsor name when proposal is view only

  * The proposal opens on the Basics screen where Sponsor field displays the sponsor code but not the sponsor name (see attached screen shot).

  * Expected Result: The sponsor name needs to appear along with the sponsor code.
  * Joe Williams on Wed, 13 May 2015 09:39:54 -0500 [View Commit](../../commit/0a4242d8d3e6a0164e38236cd9a6659b0ee11417)
* Fix modular idc currency validation to allow commas

  * Attempting to verify an RESSUP case, I created a new budget in existing proposal 332, added details, and then synced to the modular budget screen.
  * At Save, I got Errors on all 5 budget periods.
  * The F&A Base field in outlined in Red.
  * The value displayed conforms to the format. Example P1 = 192,496.73

  * With this error, I cannot save, cannot navigate of the screen, cannot return to proposal.
  * The only way I have found to save and safely exit is to delete the F&A Base value entirely for each period.

  * This is the first time I've synced a modular budget since the addition of commas to the numbers.
  * Joe Williams on Tue, 12 May 2015 14:02:46 -0500 [View Commit](../../commit/cbdcfd024fba4f7d2bc1a37aecc458339e4ca354)
* add close button to IACUC protocols after Submit action

  * Steps:

    Complete an IACUC protocol
    Submit for Review
    Post-processing page appears
    Do not select option to return to portal on Post-processing page
    After processing, Protocol is displayed and message appears ‘Document was successfully submitted."

  * Actual Result:
  * There is then no way to close the protocol.

  * Expected Result:
  * There should be a Close button like there is in IRB protocols. Clicking the Close button should remove any locks on the protocol and return the user to the KRAD Portal.
  * Joe Williams on Tue, 12 May 2015 12:39:57 -0500 [View Commit](../../commit/a560732a9ca958365fc7a0d14f52ad371ace275a)
* Fixes inablility to open committee
  * sanju.b on Mon, 10 Nov 2014 21:32:40 +0530 [View Commit](../../commit/2cbe4e0b22efedd2e1750cc9a162034d70bd4865)
* Fixed proposal copy action to keep original performance sites and other organizations

  * Copied Proposals replace the user added organization record with the Applicant Organization data.
  * Steps to Duplicate:
  * 1. Locate a proposal with an added Organization in the Basics > Organizations & Locations > Other Organizations (Example #276 in the res-i1ap.kuali.co) I added University of MD.
  * 2. Copy the Proposal (Example #351)
  * 3. Navigate to Basics > Org &Loc > Other Organizations: the org record matches the Applicant - NOT the U. MD record added by the user in the source proposal.

  * Occurs for Performance Sites as well Other Organizations. To reproduce use steps above for Performance Site Locations instead of Other Organizations
  * Joe Williams on Wed, 13 May 2015 08:57:42 -0500 [View Commit](../../commit/cb61949d861d36007865c2607b96da04dff61ddf)
*  Creating proposal from s2s opportunity
  * Module: Proposal Development/Researcher Portal link
  * Issue: STE when clicking on Create Proposal for S2S Opportunity link
  * User Story: As a proposal creator, I want to click on the link in the portal to Create a Proposal for S2S opportunity so that I can submit via to Grants.gov
  * Given a proposal creator want to create a Proposal for S2S, when I click on the Create Proposal for S2S Opportunity link in the portal, then I open a proposal development document and begin creating proposal.
  * Expected Result: Click on link and create a proposal
  * Actual result: click on link and get error:
  * org.springframework.web.bind.UnsatisfiedServletRequestParameterException: Parameter conditions "methodToCall=preparePrintDialog" not met for actual request parameters: document.developmentProposal.proposalTypeCode={}, document.developmentProposal.ownedByUnitNumber={}, document.developmentProposal.activityTypeCode={}, document.developmentProposal.requestedStartDateInitial={}, document.developmentProposal.requestedEndDateInitial={}, document.developmentProposal.title={}, document.developmentProposal.sponsorCode={}
  * Gayathri on Mon, 11 May 2015 21:04:14 -0700 [View Commit](../../commit/be4d40f7e4eb9bedaa9d74e4679895f4bc66a83e)
* added warning message when abstract detail character limit has been reached

  * In a basic proposal, add an Abstract (Layman Abstract type used for test). Use text generator to get a 50,000-character (with spaces) block of text. Copy/paste into abstract details modal (actually called Add Line). Text is truncated at 49,000 characters (with spaces) with no warning message that not all of the text has been pasted.
  * User Story:
  * As a user, I would like to have a warning message that I have reached a system limit for entering text, especially so that I do not assume my entire selection has been pasted into the limited space.
  * Something like << Data entry for this field is limited to 49,000 characters (with spaces). >> would cover both the situation of a person typing directly into the field and hitting the limit, and a user pasting a block of text from another source.
  * Joe Williams on Mon, 11 May 2015 08:25:23 -0500 [View Commit](../../commit/7a9b5711af404d8c11a9bbbb46246a5c51d263c4)
* Added the ability to view budget summary and print budget forms when proposal is view only

  * As an Approver and an Aggregator, I need to have access to the Budget Printed Reports for all status of proposals.
  * Issue: in the 1504 kuali co release; the Budget > Actions menu (where the Print menu for budget reports is located) does not appear to the user when the proposal is submitted to routing, and stays hidden when the proposal is submitted.
  * For non-s2s proposals, this leaves no method to access budget reports.

  * Scenario:
  * Create a proposal with a detailed budget that is going to an industrial or foundation sponsor.
  * Complete the required information to route the proposal.
  * Submit the proposal to routing.
  * As an APPROVER: attempt to print the Budget Summary Report from the Budget > Actions menu. There is no Action menu.
  * Joe Williams on Mon, 11 May 2015 13:57:44 -0500 [View Commit](../../commit/dcc16aba588d3843832fc0730c6bd545ec05ba19)
* Unanswered question audit errors.

  * https://github.com/kuali/kc/pull/1583
  * [KRAFDBCK-12535] Adding error messages to individual incomplete Questionnaire questions when audit mode is active and the questionnaire is mandatory.
  * Travis Schneberger on Wed, 6 May 2015 13:13:57 -0400 [View Commit](../../commit/f12527fbe308d39afd3507fc1dd39e3352c42003)
* Upgrading libraries in preparation for the move to Java 8: Spring upgrade
  * Travis Schneberger on Mon, 11 May 2015 10:08:06 -0400 [View Commit](../../commit/2be0fe4903074768439f75c43d91ddf95923b5b3)
* Fixes autocalculate dates error with dates not exactly the same as the period

  * If user adds a budget expense for tba personnel and the dates are not the same as the budget period start and end dates, then the autocalculate does not get dates for any budget items in additional years correct.

steps to reproduce

    create a proposal with basic requirements to start make sure period is for at least two years
    add a budget
    add personnel: one tba data entry assistant and one tba programmer
    give personnel salary
    navigate to assign personnel
    add programmer object code as post-doc
    effort and charge is 100
    period type is calendar
    add the tba data entry personnel
    add data entry personnel object code as post-doc
    change dates to be three months summer (6/1-8/31 of that year)
    effort and charge is 100
    period type is summer
    save and autocalculate periods
    compare period 1 to period 2 and you will see that dates are not for the same months in each of the years.

  * Current Result - Period 2 shows the data entry person and the programmer as starting and ending on the same day when period 1 was set up to show persons starting and ending on different days.

  * Expected result - whatever information (other than amount) entered in period 1 will be the same in out years when user autocalculates, with only the year applicable changing
  * Joe Williams on Thu, 7 May 2015 09:01:38 -0500 [View Commit](../../commit/42654d78a834682b77f2042faa40154d2c40de2b)
* Upgrading libraries in preparation for the move to Java 8
  * Travis Schneberger on Fri, 8 May 2015 10:33:46 -0400 [View Commit](../../commit/77db2617239fe2b95f7d24561e6050d9b67d5f10)
* Ensure GlobalVariables is updated in IncidentReport

  * The incident report in some cases(clicking cancel button for instance) doesn't update the GlobalVariables user session. This checks for and logs incidents of this nature but also overwrites the GlobalVariables with the request user session to ensure it is up to date.
  * blackcathacker on Thu, 7 May 2015 14:35:41 -0700 [View Commit](../../commit/5cac86e2863da970a4a1db64bce4d1be6ad10c3c)
* When and invalid prime sponsor is entered on an Institutional Proposal Document the Prime Sponsor ID field is not highlighted with an error indicator.
  * Travis Schneberger on Thu, 7 May 2015 09:30:00 -0400 [View Commit](../../commit/4f551c99fbea31a6412efca5f25b455c6f7bae2c)
* Institutional Proposal with inactive sponsor or prime sponsor.

  * https://github.com/kuali/kc/pull/1581

  * [KRAFDBCK-12386] Disabled hard error on save for inactive Sponsors in IP and replaced with an audit warning.

  * This code change provides a solution to the problem of trying to edit IPs with Sponsors that have been inactivated since the IP was first approved, by replacing the hard save error with an audit warning instead.
  * Travis Schneberger on Mon, 4 May 2015 16:14:41 -0400 [View Commit](../../commit/674046f87b5f66f8b4856a519499787536947ae9)
*  Cleaning up all the other terms
  * While working on this jira, I noticed that the method mapped for the term was wrong. While checking other terms, I found that other terms were mapped wrong as well. So fixing those.
  * Gayathri on Wed, 6 May 2015 15:25:02 -0700 [View Commit](../../commit/06439fc9933399b11c2c33756027c555080a94b2)
* When opening subaward for award use edit mode

  * Link to Subaward in the Award funding should open with edit button if user has appropriate role/permissions
  * Award modifiers should be able to edit an existing subaward via the awards module by selecting subawards -> Open subaward and then an edit button. The edit button is currently missing from this page.
  * Steps to Reproduce
  * Open an Award Document that has subaward funding (ex 6703 in https://res-demo1.kuali.co)
  * go to the Subawards panel on Award Tab
  * Click on the Open Subaward link in the Subawards where this awared is a Funding source subpanel.
  * Scroll to the bottom of the subaward document and look for the edit button.
  * RESULT: Only close button appears. Even though user has role/permission to create & edit subawards, the edit button is missing.
  * EXPECTED RESULT: User with appropriate role/permission should see an edit button in the subaward document when opening it via the link from awards. This is similar to how the link from subaward to award works when it opens the award and displays the edit button on the award document.
  * blackcathacker on Wed, 6 May 2015 17:58:23 -0700 [View Commit](../../commit/3de848fa6f829f2f09373bbe57467d7ee130b349)
*  Fix term spec to call the right method.
  * If you build an agenda with the costShareAmount term and create a PD with budget, you cannot navigate to the submit or questionnaire pages. Following STE
  * org.kuali.rice.krms.api.engine.TermResolutionException: Unable to plan the resolution of Term([costShareAmount]) [TermResolver=null, parameters={}] at org.kuali.rice.krms.framework.engine.TermResolutionEngineImpl.resolveTerm(TermResolutionEngineImpl.java:121) at org.kuali.rice.krms.framework.engine.BasicExecutionEnvironment.resolveTerm(BasicExecutionEnvironment.java:100) at org.kuali.rice.krms.framework.engine.expression.TermExpression.invoke(TermExpression.java:46) at  org.kuali.coeus.common.impl.krms.KrmsRulesExecutionServiceImpl.runApplicableRules(KrmsRulesExecutionServiceImpl.java:134) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.runApplicableRules(QuestionnaireAnswerServiceImpl.java:799) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.setupChildAnswerIndicator(QuestionnaireAnswerServiceImpl.java:549) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.getQuestionnaireAnswer(QuestionnaireAnswerServiceImpl.java:258) at org.kuali.coeus.common.questionnaire.framework.core.QuestionnaireHelperBase.populateAnswers(QuestionnaireHelperBase.java:163) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.populateQuestionnaires(ProposalDevelopmentViewHelperServiceImpl.java:620) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.prepareSummaryPage(ProposalDevelopmentViewHelperServiceImpl.java:772) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.navigateToSubmit(ProposalDevelopmentSubmitController.java:244)
  * Gayathri on Wed, 6 May 2015 14:37:13 -0700 [View Commit](../../commit/9e1838e75ed3a9b250c778111506e5d0e173b124)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * Fixing conversion program
  * Travis Schneberger on Wed, 6 May 2015 14:58:59 -0400 [View Commit](../../commit/6d099d70e752bbc2e43ab3b1526ddf571a734992)
* validate attachment status when submitting to sponsor

  * There is a parameter for Proposal Development named AUDIT_INCOMPLETE_PROPOSAL_ATTACHMENTS that has the following description:
  * "When set to Y, proposals will be audited for incomplete attachments up to and including sponsor submission. When set to N, incomplete attachments are valid on a proposal up to but excluding sponsor submission."
  * When this flag is set to N, a proposal can be successfully routed with an incomplete attachment, but there is no validation upon submission to sponsor that the status has been set to complete. On the KualiCo QA instance running build 1505.4, I was able to submit a proposal with an incomplete attachment without any warnings or errors; see attached screenshot.
  * In the KC 1504.3 release, there appeared to be some validation logic that was intended to prevent submission with incomplete attachments (in the class org.kuali.coeus.propdev.impl.core.SubmitToSponsorRule) but it was buggy; upon submitting a proposal with an incomplete attachment, the data validation window would pop up but would contain no errors, and the proposal would go into "approved" state but no IP would be generated. So it seems that the logic in SubmitToSponsorRule was partially working, but no indication of this error was given to the user and the proposal was not prevented from entering the "approved" state.
  * In 1505.4 it seems as though this partial validation has been removed.
  * Joe Williams on Tue, 5 May 2015 15:06:35 -0500 [View Commit](../../commit/014644597889f46b2cdbdcca010dfdb53d58dc63)
* Added View Institutionally Maintained Salaries Document Level Role
  * Joe Williams on Thu, 30 Apr 2015 15:27:12 -0500 [View Commit](../../commit/b3e54a17d2bffb04c83cad0bc8f1b5cc15ba89ea)
* Sort Special Review Approval Status Alphabetically
  * Joe Williams on Tue, 5 May 2015 16:41:02 -0500 [View Commit](../../commit/e4d1de92e60910d6df9672992eb93843509d2847)
*  Budget null pointer
  * In trying to figure out RESOPS-114, I could not open budget because of a null pointer so I added a null check in the place where I think this is coming from. Not sure if this will fix it but attempting.
  * java.lang.RuntimeException: Exception evaluating expression: #ViewHelper.getDateFromTimeStamp(budget.createTimestamp) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:448) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpression(DefaultExpressionEvaluator.java:514) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpressions(DefaultExpressionEvaluator.java:735) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpressionsOnConfigurable(DefaultExpressionEvaluator.java:421)
  * Caused by: java.lang.NullPointerException at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetViewHelperServiceImpl.getDateFromTimeStamp(ProposalBudgetViewHelperServiceImpl.java:209) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:606) at org.springframework.expression.spel.support.ReflectiveMethodExecutor.execute(ReflectiveMethodExecutor.java:69) at org.springframework.expression.spel.ast.MethodReference.getValueInternal(MethodReference.java:122) at org.springframework.expression.spel.ast.MethodReference.access$000(MethodReference.java:44) at org.springframework.expression.spel.ast.MethodReference$MethodValueRef.getValue(MethodReference.java:258) at org.springframework.expression.spel.ast.CompoundExpression.getValueInternal(CompoundExpression.java:82) at org.springframework.expression.spel.ast.SpelNodeImpl.getValue(SpelNodeImpl.java:93) at org.springframework.expression.spel.standard.SpelExpression.getValue(SpelExpression.java:89) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:445) ... 81 more
  * Gayathri on Tue, 5 May 2015 16:39:57 -0700 [View Commit](../../commit/a020e99dd03db54a2225fe4fd1278d94718043c1)
*  Allow other roles to be assigned in addition to aggregator document level role
  * There should not be a constraint of adding of other roles when aggregator is selected. These roles may be modified by implementing school so it may be necessary for Aggregator to also have any other role, ex: delete proposal.
  * Gayathri on Tue, 5 May 2015 13:01:28 -0700 [View Commit](../../commit/64fb806bb2641bc0a2b06058187671f8e28a496b)
* Fix character encoding in the app.
  * Create or edit award
  * In a Word document, type in: 'single quote' "double quote" long—dash
  * Cut that from Word and past in Award Title
  * Try to save it.
  * Result:
  * "Errors found in this Section: The Award Title (Title) may only consist of visible characters, spaces, or tabs."
  * And Award title is changed to: â€˜singleâ€™ â€œdoubleâ€ longâ€”dash
  * And if the user keeps saving, the system keeps transforming the characters until the maximum allowed characters are reached and an STE occurs: org.springframework.jdbc.UncategorizedSQLException: OJB operation; uncategorized SQLException for SQL []; SQL state [72000]; error code [12899]; ORA-12899: value too large for column "KCSO"."AWARD"."TITLE" (actual: 250, maximum: 200)
  * Expected Result is that KC accepts 'single quote' "double quote" long—dash.
  * Unless there is some technical reason that KC cannot accept (or transform and accept) these characters, based on how we are handling unicode.
  * Gayathri on Tue, 5 May 2015 09:53:42 -0700 [View Commit](../../commit/dc7f4acb037a248626beaaff8aefcefb8495c1fe)
* Create and route award placeholder as admin

  * This will avoid the placeholder ever being created as the user who is only trying to create a new award and avoid creating an editable Placeholder as well. This prevents the situation of placeholder award showing up in the users action list as an item to complete. This change also depends on the 'admin' user still existing and still having superuser privileges.
  * blackcathacker on Thu, 30 Apr 2015 15:09:07 -0700 [View Commit](../../commit/992884c355e41320e9b76910cb1561c7accb9b0b)
*  Accept lower case characters
  * In the S2S opportunity lookup, if user enters any lower case letters as part of the opportunity id, the system returns an error message.
  * The search field should not be case sensitive.
  * Search field is not case sensitive in 5.2.x.
  * Gayathri on Tue, 5 May 2015 10:51:09 -0700 [View Commit](../../commit/26fc0a13fc394ca5a9344d71582d9c505186521d)
* RESKC-291 - Budget summary table ui fix for fa columns
  * bsmith83 on Tue, 5 May 2015 10:10:28 -0700 [View Commit](../../commit/dba0ab3ae66db0a31df76a8ee933668bda14ba05)
* Avoid NullPointerException in KRMS when a narrative does not have a narrative status.
  * Travis Schneberger on Tue, 5 May 2015 14:10:01 -0400 [View Commit](../../commit/32dd6eeb4478e1fafdf1cdabd6022d491cc1257d)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * This re-implements some changes to the QuestionResolver code that we contributed before, and which made it into KC 5.2.1 but seem to have been left out of KC 6.0. It also includes a couple of our additional improvements/fixes to the QuestionResolver functionality, such as using the module sub item key when retrieving Answer Headers, filtering retrieved Answer Headers to only include those for the latest versions of Questionnaires, and making sure the Question Seq Id comparison is properly comparing String values.
  * Travis Schneberger on Thu, 30 Apr 2015 12:08:09 -0400 [View Commit](../../commit/04e5d1096c40f9392da2b372b44fb7448ce0e776)
* fixes STE when editing or adding sponsor templates

  * Maintenance > Awards > Sponsor Template > Create New.
  * Selected and added all required fields in each section:
  * -edit sponsor template - filled in all

    edit sponsor contacts - added a contact
    edit sponsor comments - added a comment
    -edit sponsor template reports - added a report type
    added a report recipient
    Tried to save; got STE

  * java.lang.RuntimeException: Unable to resolve collection property: class org.kuali.kra.award.home.AwardTemplate:templateContacts
  * org.kuali.rice.kns.service.impl.BusinessObjectAuthorizationServiceImpl.addMaintainableItemRestrictions(BusinessObjectAuthorizationServiceImpl.java:519)
  * Joe Williams on Tue, 5 May 2015 09:53:12 -0500 [View Commit](../../commit/1d0c82975d545371f0d51acd847a39f1148e0160)
* Oracle fixes
  * Our oracle installation scripts had a few issues.
  * 1. The anonymous block was assuming there was only one record in the subawards table while there could be more than one.
  * 2. Constraint was being applied in the wrong order.
  * The errors were
  * ADD CONSTRAINT FK3_BUDGET_SUB_AWARDS
                   *
  * ERROR at line 2:
  * ORA-02298: cannot validate (MG1504.FK3_BUDGET_SUB_AWARDS) - parent keys not
  * found

  * DECLARE
*
  * ERROR at line 1:
  * ORA-01422: exact fetch returns more than requested number of rows
  * ORA-06512: at line 7
  * Gayathri on Mon, 4 May 2015 13:59:37 -0700 [View Commit](../../commit/ced5293396f1b9f30c9de75d5cd212f0448782de)
* fixes issues with printing s2s forms after proposal has been submitted to s2s

  * As a user, I need to be able to open a previously submitted PD and generate the PDF form files. I use this tool to verify the attachments I uploaded are the same as those in the sponsor's grant image, and to reference when I am preparing a resubmitted version of this research project. In the current release, I cannot generate the PDF forms of a submitted proposal. I get an STE.

  * Steps to reproduce:
  * Locate a submitted proposal (example res-demo1: Proposal #65, doc 5146)
  * Navigate to Basics > S2S Opportunity Search > Forms
  * OR Toolbar > Print > Grants.gov forms
  * Select one or all of the available s2s forms
  * use the Generate the PDF file tool

  * Expected result: the PDF file is generated and can be opened, viewed, saved, etc.
  * Actual result: STE appears onscreen.

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController.printForms(ProposalDevelopmentS2SController.java:196) at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController$$FastClassBySpringCGLIB$$5f5dd18.invoke(<generated>) at
  * Joe Williams on Mon, 4 May 2015 16:26:12 -0500 [View Commit](../../commit/328288555a35833ae16ac9cecbd25e8774b25bab)
* return user to the subaward document from subaward invoice if subaward invoice was opened from the subaward document

  * Create/open subaward document.
  * Use Add Invoice Button on the Financial tab to open an invoice document.
  * At close, submit, or blanket approve, the user is taken back to the KNS maintenance screen instead of the KRAD portal
  * Joe Williams on Mon, 4 May 2015 11:03:48 -0500 [View Commit](../../commit/7812a240f2dc29d06459dcea768f22822b7bbb21)
* Copying award results in read-only award and broken hierarchies

  * This is due to the authorization fields no being populated and only populated during docHandler. Removing this check added fixes this.
  * blackcathacker on Fri, 1 May 2015 15:28:27 -0700 [View Commit](../../commit/a57e6d07e05c851b5dd8ca94a9732c85b504a3c5)
* Custom data escape.

  * https://github.com/kuali/kc/pull/1579

  * [KRAFDBCK-10749] Escaping custom data values so single quotes don't terminate them early.

  * This fixes being able to break out of custom data values with single quotes in the KNS custom data tag (KRAD does this already).
  * Travis Schneberger on Fri, 1 May 2015 14:54:18 -0400 [View Commit](../../commit/5fa3491f23e46113ccc743465c6c8cd152b6e080)
* Sponsor Award ID label.

  * https://github.com/kuali/kc/pull/1578
  * KRAFDBCK-9468

  * Changing "Sponsor Award" label to "Sponsor Award ID" in Negotiation.
  * Travis Schneberger on Fri, 1 May 2015 14:48:22 -0400 [View Commit](../../commit/9e8c0d664922d138e3a91b41791a86e10325710b)
* format currency values with commas

  * Throughout the PD Budget, money values are formatted without any commas (or dollar signs). When populated, money value fields should be formatted with commas and decimal as for currency. And especially when you get into the millions not having the commas becomes a problem.
  * Joe Williams on Thu, 30 Apr 2015 11:24:24 -0500 [View Commit](../../commit/2b6865ce25af2cfc068be4d219f34fda113b3c08)
* KRMS - Rule Function 'Incomplete Narrative Rule' has logic reversed

  * The KC KRMS Function "Incomplete Narrative Rule" has logic reversed and is actually checking that narratives are complete.
  * Analogous Coeus function is "Complete Proposal Narratives.
  * Rather than reprogramming the logic of the KC function, the name should be changed to represent what the function actually does.

  * Change name of function to "Complete Narrative Rule"
  * Joe Williams on Thu, 30 Apr 2015 15:43:40 -0500 [View Commit](../../commit/3ebea27d494d8f720ce82cb1e7d8044d67dd089e)
*  Do not regenerate periods if periods already exist!
  * As an award budget user, when I create a rebudget (new version of posted budget with no change to authorized amount), I expect to have all the budget details from the last posted version appear in the rebudget. I should be reducing funds from the existing line items and redistributing that amount to current or new line items, confined to matching the preexisting authorized total.
  * Current (4/29/15) release is not copying the posted budget details to the rebudget; the rebudget is blank, only letting me search for an IP to link details or manually reenter all items. This is not the intended functionality, and not consistent with prior releases.
  * Steps to recreate:
  * Kuali.com demo1 site on 4/29/2015. Award *73-00001, acct id 2533529
  * As Quickstart:
  * Locate an existing award or create a new award with T&M values maintained.
  * Create an initial Award Budget, match to auth total: Actions> submit;
  * As JTester:
  * Action list: Award budget link:Actions> approve the award budget.
  * As Quickstart:
  * Open Award Budget: Actions > post.
  * Open Award > Open Budget Versions
  * To create the rebudget (new AB without change to T&M).
  * -click 'new' to create the rebudget documument
  * result:
  * The new 'rebudget' is not populated with the details entered in the prior approved/posted version.
  * Thus, all the manually entered the details (or modified pulled in PD budget details) are lost, requiring the AB admin to do all the work over again from scratch.
  * The system should be copying the budget line item details forward to the rebudget; users should only be required to shift funds (reduce some line items to rebudget to another) to meet the authorized amount.
  * Rebudget had been working in previous tests: I have done a rebudget where I put in negative value in an existing detail line item to the add that value to another or new line item.
  * Gayathri on Thu, 30 Apr 2015 17:32:16 -0700 [View Commit](../../commit/7c23cc83246c24d0b6f59c6ed96fdfaf4e3cc9d1)
* SubAward Status is incorporated instead of Award Status in Subaward tab
  * in Award Document.
  * anumole on Mon, 27 Oct 2014 17:33:28 +0530 [View Commit](../../commit/86a8e980638252e10984a776f98a3d1682d9dda5)
* https://github.com/kuali/kc/pull/1584
  * KRAFDBCK-12440

  * This enhancement adds a new parameter "IP_INTELLECTUAL_PROPERTY_REVIEW_TAB_ENABLED" to determine whether or not the Intellectual Property Review tab should be shown in IP.
  * Travis Schneberger on Thu, 30 Apr 2015 15:46:24 -0400 [View Commit](../../commit/eb2d937679106ab4bb292c825eccf4d93bf1069b)
* Negotiation Unassociated Detail Inquiry Title Change fix
  * Joe Williams on Thu, 30 Apr 2015 16:32:05 -0500 [View Commit](../../commit/dc022f5e81122533bae7b702e0fd9164e4876f21)
* Fixed issue of showing latest version of award instead of Active in Awrd
  * heirarchy view.
  * vineeth on Thu, 2 Oct 2014 10:51:48 -0400 [View Commit](../../commit/e30394d9e7f2e5a190b59f2ed88ff8eaf9d26007)
* Editing budget category generates STE

  * User Story: As a system administrator, I want to periodically edit budget categories, so our budget calculations are accurate

  * Steps to Reproduce:

  * 1) System Admin Portal > Maintenance > Budget Category
  * 2) Click the 'search'
  * 3) Click 'edit' next to any result
  * 4) Enter a description on the Document Overview tab and then edit the Description in the Edit Budget Category tab
  * 5) Click either 'submit' or ' blanket approve'

  * Actual results:

  * User is redirected to an Incident Report screen with the following error: Error Details: OJB operation; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'budgetCategoryTypeCode' in 'where clause'

  * Expected results:

  * Document should go directly to final and record should be updated with the users changes.

  * User acceptance criteria:

  * Given a system administrator has to edit a budget category, when the appropriate edits are made and submitted, then the budget category is updated with my changes.
  * Joe Williams on Thu, 30 Apr 2015 14:20:24 -0500 [View Commit](../../commit/e95f90171f079a8add01d288fc427a37711b5237)
* Review comment updates for CONTRIB file
  * blackcathacker on Thu, 30 Apr 2015 09:13:52 -0700 [View Commit](../../commit/f20c423660567290a9a07223675d83d31fba7419)
* Add contributing file for public contributions
  * blackcathacker on Wed, 29 Apr 2015 10:19:55 -0700 [View Commit](../../commit/dabcec5c3c1d54eec3f3852f5e4f9db92364ebe9)
*  Refactoring and small unit test to exercise code
  * blackcathacker on Wed, 29 Apr 2015 20:11:52 -0700 [View Commit](../../commit/8bfb47b2ba80b14cbc294503e24062e17a0fe9cc)
* Use awardDocument updated info instead of award

  * Award Time and Money - T&M updates should not alter Award Version update timestamp and user
  * The History view should not reflect the update of the T&M change, but maintain when the award was last updated.
  * Using the awardDocument update timestamp accomplishes this.
  * blackcathacker on Wed, 29 Apr 2015 17:58:30 -0700 [View Commit](../../commit/776c97730929f9f9085e2efc9a3b5f537954dd7a)
* Award: Increase system performance on structure with many child accounts
  * Travis Schneberger on Thu, 30 Apr 2015 09:16:14 -0400 [View Commit](../../commit/42e27297087a985e47107aecc2729a60fdb8420e)
* Fix unit test related to: Omit questionnaires when related forms are not marked as included
  * Travis Schneberger on Wed, 29 Apr 2015 19:38:44 -0400 [View Commit](../../commit/32b9392ebb5052ab2c9a79ce76dbfc2c513f5f54)
* Set bounds on DevelopmentProposal lookups

  * When tested originally we were able to repo a outofmemory error and the search taking a LONG time. By setting bounds on the search always the search returns rather quickly. Further work needs to be done to resolve problems when a user has limited access to proposals as none may returned as the first 20 returned don't include any they have permission on.
  * blackcathacker on Wed, 29 Apr 2015 14:11:21 -0700 [View Commit](../../commit/479f8b3c87119a205dac441f16ba6dcaa8768215)
* Omit questionnaires when related forms are not marked as included
  * Joe Williams on Wed, 29 Apr 2015 15:54:10 -0500 [View Commit](../../commit/d4ddf1ced13386c23d87a53b8b9c348d616c8d6c)
* RESKC-361 avoiding a resource leak that was indicated by a OJB warning message.
  * Travis Schneberger on Wed, 29 Apr 2015 15:19:27 -0400 [View Commit](../../commit/8e50c6bbd1a73be876acadf5d8f17b0d5463495c)
* RESKC-361 avoiding a NullPointerException on proposal copy.

  * When an attachment exists such as a narrative or biography but the attachment does not have attachment data and the proposal attachment is copied with the copy attachments option then a NullPointerException occurs.  This scenario should not happen under normal circumstances and may indicate bad data in the system.
  * Travis Schneberger on Wed, 29 Apr 2015 15:18:45 -0400 [View Commit](../../commit/81e13a9a03d04e0e7aa131551524721ac16d239b)
*  Moving schemaspy feature to public release.

* Moving schemaspy initialization logic and dependency info out of the grm profile
* Making schemaspy a compile-time dependency, with current version
* Adding database script with conditional insert for schemaspy auth
* Adding schemaspy instructions to readme.md
* supporting oracle in schemaspy filter and cleanup
* cleanup of poms
* fix incorrect instructions for instrumentation in readme.md
  * Travis Schneberger on Tue, 28 Apr 2015 10:57:12 -0400 [View Commit](../../commit/090381e3152e2f78597122ff0bf1d8ef16c38310)
*  IP versioning should not copy award funding proposals over.
  * When a version of IP is linked to a version of the award, only that version needs to be linked instead of all edits of ths IP beling linked to the award. While displaying the awards linked in IP, display all the IP versions linked to awards.
  * Gayathri on Mon, 27 Apr 2015 11:28:20 -0700 [View Commit](../../commit/c96268ccb1fdc8e62bf13e0014cd8e971021a89c)
* set correct update user after editing an institutional proposal

  * Edit an IP
  * The Last Update field appropriately indicates the user that is updating the record while it is open.
  * Approve
  * Close
  * Reopen the IP

  * Actual result: Last update shows as performed by "kr"
  * Expected result: Last update should display user not "kr".
  * Joe Williams on Tue, 28 Apr 2015 09:01:05 -0500 [View Commit](../../commit/a533f70ea2acf7963a8a1532b2fa1bcb7819dd2b)
* release workflow pessimistic locks after approval

  * Approvers receive the following error message after approving proposal development document:

  * This document currently has a 160-PROPOSAL DEVELOPMENT lock owned by KR
  * Joe Williams on Tue, 28 Apr 2015 08:39:16 -0500 [View Commit](../../commit/26b45e35514791bfbf5d4ea361946066b56dd864)
* Fix Wrong Proposal Status after Proposal Approved at Final Stop and Submitted to Sponsor

  * Create Proposal
  * Submit for Review
  * Do approvals
  * At final stop, approve and then automatic submission to sponsor
  * Actual Result: Status is set to 'Approved Post-Submission'
  * Expected Result: Status is set to 'Approved and Submitted'
  * Joe Williams on Mon, 27 Apr 2015 15:35:26 -0500 [View Commit](../../commit/47212200a0a570fdb927c032a01a0be28ebf9c42)
* RESKC_352:clean up proposalHierarchyServiceImpl
  * Joe Williams on Mon, 27 Apr 2015 08:18:52 -0500 [View Commit](../../commit/530d493dd6db7a5eb6a6e4304e80c941a7ab0e30)
*  added institutional proposal rest service
  * Joe Williams on Thu, 23 Apr 2015 12:30:06 -0400 [View Commit](../../commit/a77012e0380744c91b4b96dc3ae7ad251ebccba1)
*  depending on new kualico build of jasper token auth jar
  * Travis Schneberger on Mon, 27 Apr 2015 17:26:07 -0400 [View Commit](../../commit/7d09e80ead59320026a5f93474336f94ea695953)
*  resequencing sql scripts, adding oracle script
  * Travis Schneberger on Fri, 24 Apr 2015 10:57:40 -0400 [View Commit](../../commit/3be9e0c54554a8d11f7f9ce74eb3a0daeeded7ae)
*  code review comments
  * Travis Schneberger on Fri, 24 Apr 2015 10:18:51 -0400 [View Commit](../../commit/de832842dafaaeacbee2d0a34c3206f2a711e401)
*  make award date change transactions show up with a transaction id in the various history views and transaction print dropdown menus
  * Travis Schneberger on Wed, 15 Apr 2015 15:42:18 -0400 [View Commit](../../commit/3832977239e89c6d877c0e68219edf1cf77abc6e)
*  cleanup
  * Travis Schneberger on Wed, 15 Apr 2015 09:02:54 -0400 [View Commit](../../commit/6a44b3b4a0e1c08183ca4895dae7217c5bab704f)
* Make all xmlstream beans prototype scope

  * XMLStream beans contain state which means they all need to be prototype scope to avoid potential clashes when server is under load
  * blackcathacker on Fri, 24 Apr 2015 10:03:02 -0400 [View Commit](../../commit/9d03addaef34a426aaa43286af951c931d61028b)
*  added correct s2s error message and fix it link for congressional district errors

  * The Fix button for Validation error on Congressional District in the Grants.gov Errors section takes you to S2S window; it should take you to Organization Tab where error can be fixed.
  * Joe Williams on Fri, 24 Apr 2015 09:40:05 -0400 [View Commit](../../commit/b3428ae736ac22b7d2d826b6de8792f5e9950ec8)
* HealthCheck now reports configured version and specific database status
  * blackcathacker on Thu, 16 Apr 2015 17:52:24 -0700 [View Commit](../../commit/deee751524ba0e8dcad9a8b0a61b585458826f44)
* Fix failing integration tests

  * Integration tests are failing as the controllers were the only things setting the upload information in the attachment. By setting the upload info during pre-persist we make sure the info is never null in integration tests or in the case of additional code paths
  * blackcathacker on Thu, 23 Apr 2015 09:30:24 -0400 [View Commit](../../commit/57f3a7f16a133ce76a23dd738db592748771da9e)
* Remove duplicately versioned sql files
  * blackcathacker on Wed, 22 Apr 2015 16:43:11 -0400 [View Commit](../../commit/6c90e27d2050456d8a7a88dc59c4fc084b1e866b)
* add warning message to autocalculate periods
  * Joe Williams on Fri, 17 Apr 2015 15:32:59 -0500 [View Commit](../../commit/0e0a7e0cde1e9cbcddfbd787a02d6fc570c959c4)
* Code review comments
  * blackcathacker on Fri, 17 Apr 2015 09:25:18 -0700 [View Commit](../../commit/49aab06b0024335363541359a2150be529de8095)
* Fix update user and date on attachments in PropDev
  * blackcathacker on Thu, 16 Apr 2015 22:28:17 -0700 [View Commit](../../commit/21dbe7a52a4ec67e9db54db8b74e9bf279793d7b)
* Award Placeholder Document fixes

  * When the placeholder doc was created by creating an award and not copying a hierarchy the resulting document doesn't have a valid award. Specifically no sponsor code which was causing an exception. This checks for the placeholder doc before checking for the sponsor groups.
  * blackcathacker on Wed, 22 Apr 2015 11:33:56 -0400 [View Commit](../../commit/29773eb718669a185ef526f2919b9358ea39d16d)
*  Cleaning up commit. Since we are overriding refreshNonUpdateableReferences anyway, we do not need to override method in rule base. Serialization changes also not needed it appears.
  * Gayathri on Wed, 22 Apr 2015 05:59:13 -0700 [View Commit](../../commit/abbd850c9110b1bffe6e2c11166d7f5bd596e436)
* fix rolodex persistence through sponsor maintenance document

  * Scenario:
  * 1 - Create a new Sponsor
  * 2 - Add Sponsor and Address details
  * 3 - Submit new Sponsor
  * 4 - Search for new Sponsor and open inquiry.

  * Result:
  * When the inquiry is opened you can see that a new rolodex record has been created but there is no address book information. If you try searching for the address book record, you can only copy the record, not edit it.

  * Expected Behavior:
  * 1 - The address book entry details should be saved when the sponsor record saves.
  * 2 - The address book record should be editable from the address book lookup.
  * Joe Williams on Tue, 21 Apr 2015 18:53:04 -0400 [View Commit](../../commit/6accf7789f227682d599c533e7d3bc6a3d4d2aaf)
* Allow sponsor code to be smaller than 6 characters

  * A customer ended up with sponsor codes shorter than 6 characters and since it was allowed by the database and a minimal functional change the sponsor code can now be any alphanumeric up to 6 characters
  * blackcathacker on Tue, 21 Apr 2015 16:02:18 -0400 [View Commit](../../commit/ed1500ec3dd9bfa11425fcbf3519f7574ed64bea)
* Oracle scripts

  * Bring full oracle scripts renamed and numbered back into the project
  * blackcathacker on Tue, 21 Apr 2015 09:15:55 -0400 [View Commit](../../commit/14507ad004e32834d9cc4767d4186a1fceda7dc4)
* added rolodex and ynq inquiry links to organization inquiry view
  * Joe Williams on Fri, 17 Apr 2015 14:59:43 -0500 [View Commit](../../commit/a1c752970037090bb002df5fb75632b13722a169)
* added update user to data over history
  * Joe Williams on Fri, 17 Apr 2015 13:58:48 -0500 [View Commit](../../commit/2f75317d94266a9cb1054511dec9cd090a2fb36f)
* kc-sql version update
  * blackcathacker on Fri, 17 Apr 2015 21:48:12 -0700 [View Commit](../../commit/000b000c1bcb3c8ae91236e60f120b1e7863a1c4)
* releasing
  * Travis Schneberger on Mon, 16 Mar 2015 14:13:11 -0400 [View Commit](../../commit/7f64da820e133d1d0fbd3d5bc216145d58d0dc44)
* release
  * Travis Schneberger on Mon, 16 Mar 2015 12:51:00 -0400 [View Commit](../../commit/bb72f3def08e57a5f0b5cb18f8b6dcb4950849ed)

##coeus-1505.41
* return to award from award budget if budget was opened from award

  * Open an Award
  * Go to Budget Versions
  * Create or open an Award Budget
  * Perform a budget action such as approve, reject, or even close

  * Actual Results:
  * -User is taken to the Sys Admin portal.

  * Expected Results:
  * -User remains in the Award.
  * Joe Williams on Fri, 15 May 2015 14:59:20 -0500 [View Commit](../../commit/5fe248a09e4cc55bceeb24fd7845f951d79f1e0e)

##coeus-1505.40
* No Changes


##coeus-1505.39
* Fix for award error when saving on Payment, Reports & Terms

  * -Create new award
  * -Enter required data on Award tab, save
  * -Go to Payment, Reports & Terms tab
  * -Click save, error occurs

  * This is only happening on new awards.
  * HTTP Status 500 -

  * type Exception report

  * message

  * description The server encountered an internal error that prevented it from fulfilling this request.

  * org.springframework.dao.DataIntegrityViolationException: OJB operation; SQL []; ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * ; nested exception is java.sql.SQLIntegrityConstraintViolationException: ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * Joe Williams on Mon, 18 May 2015 08:49:18 -0500 [View Commit](../../commit/aca0ce6122a5e03405598b0a13d7640e7db17046)

##coeus-1505.38
* Java 8: making is possible to turn off java 8 specific javadoc parm
  * Travis Schneberger on Sun, 17 May 2015 21:20:56 -0400 [View Commit](../../commit/9fabcc7995c78c1f995747dccdfa7950fdc2cb95)

##coeus-1505.37
* No Changes


##coeus-1505.36
* Java 8: Fixing drools so that rules files can be loaded from within jars.
  * Travis Schneberger on Fri, 15 May 2015 17:49:07 -0400 [View Commit](../../commit/82f1d2bcc43e389b31b6cab81263bb500dafdea4)
* Java 8: Fixing tests, changing StringUtils api usage to isBlank which is closer to drool's StringUtils isEmpty method.
  * Travis Schneberger on Fri, 15 May 2015 17:02:22 -0400 [View Commit](../../commit/f1645535c21b60a2ca05e6e65e76f050c3275c23)
* Java 8: Upgrading Drools and MVEL to support Java 8, removing incorrect references to drools string utils
  * Travis Schneberger on Fri, 15 May 2015 15:14:13 -0400 [View Commit](../../commit/edc26dfe1b6c82769d11c051bae13c155a0dc5f7)
* Upgrading to Java 8: removing MaxPerm setting since java 8 does not have perm gen space
  * Travis Schneberger on Fri, 15 May 2015 12:46:55 -0400 [View Commit](../../commit/7217b0a4096a69b468ccf40fa2597cc03add0604)
* return user to krad portal when closing a transactional document
  * Joe Williams on Fri, 15 May 2015 10:37:34 -0500 [View Commit](../../commit/3e3c3d50c6df0e90ffb3942d3311cb3c0ec245d3)
* Upgrading to Java 8: switching version of cglib to use an updated/non-repackaged version of asm
  * Travis Schneberger on Fri, 15 May 2015 12:32:24 -0400 [View Commit](../../commit/cb8adf607d85b67a7d71e5defd1b00e0379bc8ac)
* Upgrading to Java 8: upgrading jmock
  * Travis Schneberger on Fri, 15 May 2015 11:20:12 -0400 [View Commit](../../commit/2cd5e268c5ab56658c411f870d515ce7e7542925)
* refactoring and added tests
  * Joe Williams on Fri, 15 May 2015 09:42:08 -0500 [View Commit](../../commit/d489080c07844d78585d69e085c3b5fefe7c93cd)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

  * code review comments
  * Travis Schneberger on Fri, 15 May 2015 10:43:38 -0400 [View Commit](../../commit/d9690e74dfec73c6431f932aca5d9525a13820ec)
* Fix to display correct linked subawards when award is versioned

  * 1. Create and submit a new Award (just complete the required fields to save and submit, no need to do a T&M document)
  * 2. Create a new Subaward, adding the just-created Award as the Funding Source, and then submit the Subaward
  * 3. Observe Medusa from both the Award and Subaward view
  * Actual Behavior: The system displays the linkage between the Award and Subaward from both Medusa views.
  * 4. Create and submit a new Proposal Log document
  * 5. Create and submit a new Institutional Proposal document, using the just-created Proposal Log
  * 6. Search for the just-submitted Award document and click the Edit action button
  * 7. Add the just-created Institutional Proposal as a Funding Proposal
  * 8. Select a Transaction Type
  * 9. Submit the edited Award
  * 10. Observe Medusa from the Award, Institutional Proposal, and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from either the Award and Institutional Proposal Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from both the Award and Institutional Proposal Medusa views.
  * 11. Create a Negotiation, selecting Award, Institutional Proposal, or Subaward for Negotiation Association Type and selecting one of the just-created documents
  * 12. Click Save to finalize the Negotiation
  * 13. Observe Medusa from the Award, Institutional Proposal, Negotiation and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from the Award, Institutional Proposal, and Negotiation Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from the Award, Institutional Proposal, and Negotiation Medusa views.
  * Joe Williams on Fri, 15 May 2015 09:39:13 -0500 [View Commit](../../commit/2a483666703e61eb93a8804faeb70d09499497e8)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521
  * Adds a Multiple Choice question type to the Questionnaire framework. Utilizes a new table to store the multiple choice prompts and descriptions, respectively. Uses the MAX_ANSWERS fields to determine whether the question renders as a set of checkboxes or radio buttons.

  * Additional bugfixes:
* Fixed question deletion causing a constraint violation where a question has an explanation.
* Fixed proper form initialization based on the Response type where the first time a question page was loaded the page would display incorrectly until the response type was changed.
* Fixed the read only display not showing the correct dynamic information based on response type.  This was common when viewing after routing.

  * Other:
  * Cleaned up questionnaire maintenance code that is no longer used as of KC 6.0
  * Added Missing license headers
  * Travis Schneberger on Wed, 13 May 2015 14:54:54 -0400 [View Commit](../../commit/39264466a27f087779f1d76b506c89c2bc3f6059)
* Upgrading to Java 8: fixing javadoc errors from Java 8's strict javadoc tool
  * Travis Schneberger on Fri, 15 May 2015 09:27:28 -0400 [View Commit](../../commit/09301ace83c6fe888f32ec5f90231e00c5c8d09e)
* Upgrading to Java 8: updating libraries, documentation, fixing test.
  * Travis Schneberger on Thu, 14 May 2015 21:18:16 -0400 [View Commit](../../commit/b7f1a198b77ea4134c7beedbf898f92ec6378101)

##coeus-1505.35
* No Changes


##coeus-1505.34
*  Making field readOnly so the values do not get updated while enroute
  * As a viewer of routing proposals, I navigate to review the included S2S Opportunity Forms. Upon opening this screen, all selected forms to include display as unchecked. Confirmed that the items were checked prior to routing; and remain checked if no one views them. But if the screen is opened prior to submitting to s2s, none of these optional forms & their attachments are being submitted.
  * Tried an alternate method to preview S2S forms via the Toolbar menu. At first opening, the checks were there. But when I reopened the toolbar print option in the same session - the checkmarks were gone.
  * This is a serious problem.
  * OSP Admins always verify that the users have checked the correct s2s forms to include, and print/preview some attachments as part of their review from this screen.

  * Created and submitted by user rhanlon
  * PA-C-R01 with Detailed Budget and Subaward Budget selected as optional forms.
  * Confirmed checks prior to submitting.
  * As approver RRabbit - logged in, Action List> opened proposal
  * Navigated to S2S Opportunity screen > Forms - all optional forms unchecked.
  * Gayathri on Thu, 14 May 2015 14:46:01 -0700 [View Commit](../../commit/2fb0b7106cc3a7670d181a0f8cd34469f53a721b)
* fixes STE when cancelling from add instituional proposal lookup

  * 1. Central Admin > Pre-Award > Institutional Proposal
  * 2. Click on plus sign for creating an institutional proposal
  * 3. On the Proposal Log Lookup screen click on the cancel button
  * RESULT: Stack trace error (see below)
  * EXPECTED RESULT: User should be returned to the KRAD window.

  * org.kuali.rice.krad.datadictionary.DataDictionaryException: Unable to find View with id: Kc-LandingPage-RedirectView?forInstitutionalProposal
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getImmutableViewById(UifDictionaryIndex.java:142)
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getViewById(UifDictionaryIndex.java:128)
  * Joe Williams on Thu, 14 May 2015 12:38:14 -0500 [View Commit](../../commit/f53d8d72fe0eed583664c258863efe2cde34872b)
* when proposal is view only don't prompt user to save on close

  * User is confused if they enter a proposal in view mode and then select close that the modal asks if they want to save.

  * Steps to Reproduce
  * 1. Login as quickstart. Create proposal.
  * 2. Add user psmock as Viewer Document level.
  * 3. Note proposal number and doc number. Close. Save.
  * 4. Open incognito or private browsing window.
  * 5. Login as psmock.
  * 6. Use Search Proposal link (Researcher menu) to find proposal number
  * 7. Click ‘view’ link.
  * 8. Navigate to one of the other sections.
  * 9. Click close on that screen. Should not get the ‘do you want to save message’.

  * Results: The modal asking the user if they would like to save document displays.
  * Expected Results: Whenever proposal is in view mode It should not generate the modal asking to save when when closing.
  * Joe Williams on Thu, 14 May 2015 11:21:33 -0500 [View Commit](../../commit/cea4ee4ed5816eff95400775ccc41448f64330d8)
* Fixed double headers for cache admin and proposal development documents

  * 1) login as quickstart
  * 2) switch to System Admin Tab (or maintenance tab)
  * 3) Select Action list
  * 4) Open document
  * Result: Double Headers appear
  * Joe Williams on Thu, 14 May 2015 09:55:38 -0500 [View Commit](../../commit/5cfb32530579f088458d6b8bcc342aa69de4688b)
* Allow modification of S2S Opportunity anytime before submit

  * Revise selections in S2S Opportunity screen pre- and post-submission
  * As a Superuser or Proposal Approver and Submitter of S2S proposals to Grants.gov, I need to be able revise selections on the S2S Opportunity screen > Opportunity, Forms, and User Attached Forms tabs in proposals that are enroute/under review as well as Approved status, because the Submit to S2S step normally takes place after approval and submit to sponsor.
  * A new permission called 'Modify Proposal Development S2s While Enroute' has been added that controls the ability for a user to make modifications after the proposal is enroute.
  * blackcathacker on Tue, 12 May 2015 20:10:52 -0700 [View Commit](../../commit/b4e28cabef310cab212cc24275ba42c3da6b7e8d)
* Sort Special Review Type Alphabetically
  * Joe Williams on Wed, 13 May 2015 16:11:13 -0500 [View Commit](../../commit/28424fd6ca9a57554ed4cb0e90b675083e79b78c)

##coeus-1505.33
* scale attachment collections better with page resize

  * The new kualico ui, many of the screens redraw when in edit/add mode, putting several columns/buttons out of the window view, requiring scrolling.

  * When I add attachments, I must now use the scroll bar to find/have access to the Details/Edit/Delete options, as well as other columns (userid/timestamp).
  * If I compress the browser window, there is no compacting or wrapping of any column to aid in using a smaller screen.
  * I have to have the browser window open to at least 14.5 inches to see all the columns. If I compact the left navigation bar to icon mode, I still have to have the window at 13 inches to see all columns. (Chrome on a PC)
  * IE, I was able to see all in a 10.5 inch screen if I used icons for left nav bar.

  * Once a user gets the 10-20 narratives uploaded for an NIH submission, they will need to scroll down to get to the horizontal scroll bar, and then scroll back up to get to the Actions column to edit the attachments.
  * The white space is nice, but the row number column could be smaller, as can the Description column. Any ability to wrap text would also help if a user wanted to/had to work in a smaller window.

  * Can something be done to address the expanding window content? Like allowing these columns to text-wrap? In Add Attachments - reducing the column width of the Description field?
  * Joe Williams on Wed, 13 May 2015 13:42:45 -0500 [View Commit](../../commit/4c2a6a84f58b000a37895bf9d5cf1982d09566a4)

##coeus-1505.32
* No Changes


##coeus-1505.31
* No Changes


##coeus-1505.30
* fix to display sponsor name when proposal is view only

  * The proposal opens on the Basics screen where Sponsor field displays the sponsor code but not the sponsor name (see attached screen shot).

  * Expected Result: The sponsor name needs to appear along with the sponsor code.
  * Joe Williams on Wed, 13 May 2015 09:39:54 -0500 [View Commit](../../commit/c4c21ada04c0b92cc1d48bb309fc4f437bcc5669)
* Fixes inablility to open committee
  * sanju.b on Mon, 10 Nov 2014 21:32:40 +0530 [View Commit](../../commit/2940fb7ce4a57e93426b4ebb1151b20f580246c3)
* Fixed proposal copy action to keep original performance sites and other organizations

  * Copied Proposals replace the user added organization record with the Applicant Organization data.
  * Steps to Duplicate:
  * 1. Locate a proposal with an added Organization in the Basics > Organizations & Locations > Other Organizations (Example #276 in the res-i1ap.kuali.co) I added University of MD.
  * 2. Copy the Proposal (Example #351)
  * 3. Navigate to Basics > Org &Loc > Other Organizations: the org record matches the Applicant - NOT the U. MD record added by the user in the source proposal.

  * Occurs for Performance Sites as well Other Organizations. To reproduce use steps above for Performance Site Locations instead of Other Organizations
  * Joe Williams on Wed, 13 May 2015 08:57:42 -0500 [View Commit](../../commit/3eb72b26048625fac9a3eb97f17975b16317792a)
* Fix modular idc currency validation to allow commas

  * Attempting to verify an RESSUP case, I created a new budget in existing proposal 332, added details, and then synced to the modular budget screen.
  * At Save, I got Errors on all 5 budget periods.
  * The F&A Base field in outlined in Red.
  * The value displayed conforms to the format. Example P1 = 192,496.73

  * With this error, I cannot save, cannot navigate of the screen, cannot return to proposal.
  * The only way I have found to save and safely exit is to delete the F&A Base value entirely for each period.

  * This is the first time I've synced a modular budget since the addition of commas to the numbers.
  * Joe Williams on Tue, 12 May 2015 14:02:46 -0500 [View Commit](../../commit/42e085fefb89598f7fadf0ccef0adab133eb8445)
* add close button to IACUC protocols after Submit action

  * Steps:

    Complete an IACUC protocol
    Submit for Review
    Post-processing page appears
    Do not select option to return to portal on Post-processing page
    After processing, Protocol is displayed and message appears ‘Document was successfully submitted."

  * Actual Result:
  * There is then no way to close the protocol.

  * Expected Result:
  * There should be a Close button like there is in IRB protocols. Clicking the Close button should remove any locks on the protocol and return the user to the KRAD Portal.
  * Joe Williams on Tue, 12 May 2015 12:39:57 -0500 [View Commit](../../commit/46d635687f3609d414fed881453d6afe30a0c2c3)

##coeus-1505.29
*  Creating proposal from s2s opportunity
  * Module: Proposal Development/Researcher Portal link
  * Issue: STE when clicking on Create Proposal for S2S Opportunity link
  * User Story: As a proposal creator, I want to click on the link in the portal to Create a Proposal for S2S opportunity so that I can submit via to Grants.gov
  * Given a proposal creator want to create a Proposal for S2S, when I click on the Create Proposal for S2S Opportunity link in the portal, then I open a proposal development document and begin creating proposal.
  * Expected Result: Click on link and create a proposal
  * Actual result: click on link and get error:
  * org.springframework.web.bind.UnsatisfiedServletRequestParameterException: Parameter conditions "methodToCall=preparePrintDialog" not met for actual request parameters: document.developmentProposal.proposalTypeCode={}, document.developmentProposal.ownedByUnitNumber={}, document.developmentProposal.activityTypeCode={}, document.developmentProposal.requestedStartDateInitial={}, document.developmentProposal.requestedEndDateInitial={}, document.developmentProposal.title={}, document.developmentProposal.sponsorCode={}
  * Gayathri on Mon, 11 May 2015 21:04:14 -0700 [View Commit](../../commit/9a9266531eac4e8ccdd16cff9250cc7a2d6326df)

##coeus-1505.28
* added warning message when abstract detail character limit has been reached

  * In a basic proposal, add an Abstract (Layman Abstract type used for test). Use text generator to get a 50,000-character (with spaces) block of text. Copy/paste into abstract details modal (actually called Add Line). Text is truncated at 49,000 characters (with spaces) with no warning message that not all of the text has been pasted.
  * User Story:
  * As a user, I would like to have a warning message that I have reached a system limit for entering text, especially so that I do not assume my entire selection has been pasted into the limited space.
  * Something like << Data entry for this field is limited to 49,000 characters (with spaces). >> would cover both the situation of a person typing directly into the field and hitting the limit, and a user pasting a block of text from another source.
  * Joe Williams on Mon, 11 May 2015 08:25:23 -0500 [View Commit](../../commit/1e81f10f668f432f5875d10ca6751b93360f2f49)

##coeus-1505.27
* No Changes


##coeus-1505.26
* Added the ability to view budget summary and print budget forms when proposal is view only

  * As an Approver and an Aggregator, I need to have access to the Budget Printed Reports for all status of proposals.
  * Issue: in the 1504 kuali co release; the Budget > Actions menu (where the Print menu for budget reports is located) does not appear to the user when the proposal is submitted to routing, and stays hidden when the proposal is submitted.
  * For non-s2s proposals, this leaves no method to access budget reports.

  * Scenario:
  * Create a proposal with a detailed budget that is going to an industrial or foundation sponsor.
  * Complete the required information to route the proposal.
  * Submit the proposal to routing.
  * As an APPROVER: attempt to print the Budget Summary Report from the Budget > Actions menu. There is no Action menu.
  * Joe Williams on Mon, 11 May 2015 13:57:44 -0500 [View Commit](../../commit/f0ee8d85e649106fdcc285b117b096e07d11fc00)

##coeus-1505.25
* Unanswered question audit errors.

  * https://github.com/kuali/kc/pull/1583
  * [KRAFDBCK-12535] Adding error messages to individual incomplete Questionnaire questions when audit mode is active and the questionnaire is mandatory.
  * Travis Schneberger on Wed, 6 May 2015 13:13:57 -0400 [View Commit](../../commit/fb144a4af7ebcbf8d83964ec3b345cb5d1776e07)

##coeus-1505.24
* Upgrading libraries in preparation for the move to Java 8: Spring upgrade
  * Travis Schneberger on Mon, 11 May 2015 10:08:06 -0400 [View Commit](../../commit/b98b9183f9bd0c5f4a754878bc2845b5acc41131)

##coeus-1505.23
* No Changes


##coeus-1505.22
* Upgrading libraries in preparation for the move to Java 8
  * Travis Schneberger on Fri, 8 May 2015 10:33:46 -0400 [View Commit](../../commit/e077f0d99b1538aa7f56cd2f26253a588c87183d)
* Fixes autocalculate dates error with dates not exactly the same as the period

  * If user adds a budget expense for tba personnel and the dates are not the same as the budget period start and end dates, then the autocalculate does not get dates for any budget items in additional years correct.

steps to reproduce

    create a proposal with basic requirements to start make sure period is for at least two years
    add a budget
    add personnel: one tba data entry assistant and one tba programmer
    give personnel salary
    navigate to assign personnel
    add programmer object code as post-doc
    effort and charge is 100
    period type is calendar
    add the tba data entry personnel
    add data entry personnel object code as post-doc
    change dates to be three months summer (6/1-8/31 of that year)
    effort and charge is 100
    period type is summer
    save and autocalculate periods
    compare period 1 to period 2 and you will see that dates are not for the same months in each of the years.

  * Current Result - Period 2 shows the data entry person and the programmer as starting and ending on the same day when period 1 was set up to show persons starting and ending on different days.

  * Expected result - whatever information (other than amount) entered in period 1 will be the same in out years when user autocalculates, with only the year applicable changing
  * Joe Williams on Thu, 7 May 2015 09:01:38 -0500 [View Commit](../../commit/f233b94bfc5a0515a308bc90ef0c17ed131938de)

##coeus-1505.21
* No Changes


##coeus-1505.20
* Ensure GlobalVariables is updated in IncidentReport

  * The incident report in some cases(clicking cancel button for instance) doesn't update the GlobalVariables user session. This checks for and logs incidents of this nature but also overwrites the GlobalVariables with the request user session to ensure it is up to date.
  * blackcathacker on Thu, 7 May 2015 14:35:41 -0700 [View Commit](../../commit/c07238ae057f362a1ee301db6abb0b03fe822586)

##coeus-1505.19
* When and invalid prime sponsor is entered on an Institutional Proposal Document the Prime Sponsor ID field is not highlighted with an error indicator.
  * Travis Schneberger on Thu, 7 May 2015 09:30:00 -0400 [View Commit](../../commit/f048b27c305a1164ac751e5e308e3793b50bfb70)
* Institutional Proposal with inactive sponsor or prime sponsor.

  * https://github.com/kuali/kc/pull/1581

  * [KRAFDBCK-12386] Disabled hard error on save for inactive Sponsors in IP and replaced with an audit warning.

  * This code change provides a solution to the problem of trying to edit IPs with Sponsors that have been inactivated since the IP was first approved, by replacing the hard save error with an audit warning instead.
  * Travis Schneberger on Mon, 4 May 2015 16:14:41 -0400 [View Commit](../../commit/f9204cfdc0c565c21f85ade541870f90873269c0)

##coeus-1505.18
*  Cleaning up all the other terms
  * While working on this jira, I noticed that the method mapped for the term was wrong. While checking other terms, I found that other terms were mapped wrong as well. So fixing those.
  * Gayathri on Wed, 6 May 2015 15:25:02 -0700 [View Commit](../../commit/a8fd87a4556c0b3d44399effcc160b7cf8811a00)

##coeus-1505.17
* When opening subaward for award use edit mode

  * Link to Subaward in the Award funding should open with edit button if user has appropriate role/permissions
  * Award modifiers should be able to edit an existing subaward via the awards module by selecting subawards -> Open subaward and then an edit button. The edit button is currently missing from this page.
  * Steps to Reproduce
  * Open an Award Document that has subaward funding (ex 6703 in https://res-demo1.kuali.co)
  * go to the Subawards panel on Award Tab
  * Click on the Open Subaward link in the Subawards where this awared is a Funding source subpanel.
  * Scroll to the bottom of the subaward document and look for the edit button.
  * RESULT: Only close button appears. Even though user has role/permission to create & edit subawards, the edit button is missing.
  * EXPECTED RESULT: User with appropriate role/permission should see an edit button in the subaward document when opening it via the link from awards. This is similar to how the link from subaward to award works when it opens the award and displays the edit button on the award document.
  * blackcathacker on Wed, 6 May 2015 17:58:23 -0700 [View Commit](../../commit/310ee38bc3b3b082e18658eb41553bfef8b49cba)

##coeus-1505.16
*  Fix term spec to call the right method.
  * If you build an agenda with the costShareAmount term and create a PD with budget, you cannot navigate to the submit or questionnaire pages. Following STE
  * org.kuali.rice.krms.api.engine.TermResolutionException: Unable to plan the resolution of Term([costShareAmount]) [TermResolver=null, parameters={}] at org.kuali.rice.krms.framework.engine.TermResolutionEngineImpl.resolveTerm(TermResolutionEngineImpl.java:121) at org.kuali.rice.krms.framework.engine.BasicExecutionEnvironment.resolveTerm(BasicExecutionEnvironment.java:100) at org.kuali.rice.krms.framework.engine.expression.TermExpression.invoke(TermExpression.java:46) at  org.kuali.coeus.common.impl.krms.KrmsRulesExecutionServiceImpl.runApplicableRules(KrmsRulesExecutionServiceImpl.java:134) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.runApplicableRules(QuestionnaireAnswerServiceImpl.java:799) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.setupChildAnswerIndicator(QuestionnaireAnswerServiceImpl.java:549) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.getQuestionnaireAnswer(QuestionnaireAnswerServiceImpl.java:258) at org.kuali.coeus.common.questionnaire.framework.core.QuestionnaireHelperBase.populateAnswers(QuestionnaireHelperBase.java:163) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.populateQuestionnaires(ProposalDevelopmentViewHelperServiceImpl.java:620) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.prepareSummaryPage(ProposalDevelopmentViewHelperServiceImpl.java:772) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.navigateToSubmit(ProposalDevelopmentSubmitController.java:244)
  * Gayathri on Wed, 6 May 2015 14:37:13 -0700 [View Commit](../../commit/4990388e6b19fecbd00199b3fc777ff8a398b405)

##coeus-1505.15
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * Fixing conversion program
  * Travis Schneberger on Wed, 6 May 2015 14:58:59 -0400 [View Commit](../../commit/f84886cc19d3068f3903be077ab96847ef2ac1d5)

##coeus-1505.14
* validate attachment status when submitting to sponsor

  * There is a parameter for Proposal Development named AUDIT_INCOMPLETE_PROPOSAL_ATTACHMENTS that has the following description:
  * "When set to Y, proposals will be audited for incomplete attachments up to and including sponsor submission. When set to N, incomplete attachments are valid on a proposal up to but excluding sponsor submission."
  * When this flag is set to N, a proposal can be successfully routed with an incomplete attachment, but there is no validation upon submission to sponsor that the status has been set to complete. On the KualiCo QA instance running build 1505.4, I was able to submit a proposal with an incomplete attachment without any warnings or errors; see attached screenshot.
  * In the KC 1504.3 release, there appeared to be some validation logic that was intended to prevent submission with incomplete attachments (in the class org.kuali.coeus.propdev.impl.core.SubmitToSponsorRule) but it was buggy; upon submitting a proposal with an incomplete attachment, the data validation window would pop up but would contain no errors, and the proposal would go into "approved" state but no IP would be generated. So it seems that the logic in SubmitToSponsorRule was partially working, but no indication of this error was given to the user and the proposal was not prevented from entering the "approved" state.
  * In 1505.4 it seems as though this partial validation has been removed.
  * Joe Williams on Tue, 5 May 2015 15:06:35 -0500 [View Commit](../../commit/9a968d1c2ffad96304f50d3b4fa4d71ff7efb705)
* Added View Institutionally Maintained Salaries Document Level Role
  * Joe Williams on Thu, 30 Apr 2015 15:27:12 -0500 [View Commit](../../commit/70429e355b58b94d74a2fae52eb172df1560ba2f)
* Sort Special Review Approval Status Alphabetically
  * Joe Williams on Tue, 5 May 2015 16:41:02 -0500 [View Commit](../../commit/d514c3fa7b68e6b029917f521b2d512f169663b0)

##coeus-1505.13
*  Budget null pointer
  * In trying to figure out RESOPS-114, I could not open budget because of a null pointer so I added a null check in the place where I think this is coming from. Not sure if this will fix it but attempting.
  * java.lang.RuntimeException: Exception evaluating expression: #ViewHelper.getDateFromTimeStamp(budget.createTimestamp) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:448) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpression(DefaultExpressionEvaluator.java:514) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpressions(DefaultExpressionEvaluator.java:735) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpressionsOnConfigurable(DefaultExpressionEvaluator.java:421)
  * Caused by: java.lang.NullPointerException at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetViewHelperServiceImpl.getDateFromTimeStamp(ProposalBudgetViewHelperServiceImpl.java:209) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:606) at org.springframework.expression.spel.support.ReflectiveMethodExecutor.execute(ReflectiveMethodExecutor.java:69) at org.springframework.expression.spel.ast.MethodReference.getValueInternal(MethodReference.java:122) at org.springframework.expression.spel.ast.MethodReference.access$000(MethodReference.java:44) at org.springframework.expression.spel.ast.MethodReference$MethodValueRef.getValue(MethodReference.java:258) at org.springframework.expression.spel.ast.CompoundExpression.getValueInternal(CompoundExpression.java:82) at org.springframework.expression.spel.ast.SpelNodeImpl.getValue(SpelNodeImpl.java:93) at org.springframework.expression.spel.standard.SpelExpression.getValue(SpelExpression.java:89) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:445) ... 81 more
  * Gayathri on Tue, 5 May 2015 16:39:57 -0700 [View Commit](../../commit/c5e10d16d8f151b88c137a77fb54beff47fe6777)

##coeus-1505.12
* No Changes


##coeus-1505.11
*  Allow other roles to be assigned in addition to aggregator document level role
  * There should not be a constraint of adding of other roles when aggregator is selected. These roles may be modified by implementing school so it may be necessary for Aggregator to also have any other role, ex: delete proposal.
  * Gayathri on Tue, 5 May 2015 13:01:28 -0700 [View Commit](../../commit/fd979aa5554c8b42f2fde9412258c2217eb65ca6)

##coeus-1505.10
* Fix character encoding in the app.
  * Create or edit award
  * In a Word document, type in: 'single quote' "double quote" long—dash
  * Cut that from Word and past in Award Title
  * Try to save it.
  * Result:
  * "Errors found in this Section: The Award Title (Title) may only consist of visible characters, spaces, or tabs."
  * And Award title is changed to: â€˜singleâ€™ â€œdoubleâ€ longâ€”dash
  * And if the user keeps saving, the system keeps transforming the characters until the maximum allowed characters are reached and an STE occurs: org.springframework.jdbc.UncategorizedSQLException: OJB operation; uncategorized SQLException for SQL []; SQL state [72000]; error code [12899]; ORA-12899: value too large for column "KCSO"."AWARD"."TITLE" (actual: 250, maximum: 200)
  * Expected Result is that KC accepts 'single quote' "double quote" long—dash.
  * Unless there is some technical reason that KC cannot accept (or transform and accept) these characters, based on how we are handling unicode.
  * Gayathri on Tue, 5 May 2015 09:53:42 -0700 [View Commit](../../commit/feb6e0869f5dd368b6f2067b53f7e355757c47a4)
* Avoid NullPointerException in KRMS when a narrative does not have a narrative status.
  * Travis Schneberger on Tue, 5 May 2015 14:10:01 -0400 [View Commit](../../commit/85e1c3fb8d3d566c0f1ba92759cb9d5a17966572)
*  Accept lower case characters
  * In the S2S opportunity lookup, if user enters any lower case letters as part of the opportunity id, the system returns an error message.
  * The search field should not be case sensitive.
  * Search field is not case sensitive in 5.2.x.
  * Gayathri on Tue, 5 May 2015 10:51:09 -0700 [View Commit](../../commit/23d7d0490af7dddb180a1dc18e9e70cf5595490a)
* RESKC-291 - Budget summary table ui fix for fa columns
  * bsmith83 on Tue, 5 May 2015 10:10:28 -0700 [View Commit](../../commit/16be4d6e78b2d02ba4225f913cf1e925420eb7c4)
* Create and route award placeholder as admin

  * This will avoid the placeholder ever being created as the user who is only trying to create a new award and avoid creating an editable Placeholder as well. This prevents the situation of placeholder award showing up in the users action list as an item to complete. This change also depends on the 'admin' user still existing and still having superuser privileges.
  * blackcathacker on Thu, 30 Apr 2015 15:09:07 -0700 [View Commit](../../commit/71b4839cad80c6af75da7987ee5b809b1e474c67)

##coeus-1505.9
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * This re-implements some changes to the QuestionResolver code that we contributed before, and which made it into KC 5.2.1 but seem to have been left out of KC 6.0. It also includes a couple of our additional improvements/fixes to the QuestionResolver functionality, such as using the module sub item key when retrieving Answer Headers, filtering retrieved Answer Headers to only include those for the latest versions of Questionnaires, and making sure the Question Seq Id comparison is properly comparing String values.
  * Travis Schneberger on Thu, 30 Apr 2015 12:08:09 -0400 [View Commit](../../commit/e8a5e39b895bfb7a425d7f4a1c1597ca8301aa57)
* fixes STE when editing or adding sponsor templates

  * Maintenance > Awards > Sponsor Template > Create New.
  * Selected and added all required fields in each section:
  * -edit sponsor template - filled in all

    edit sponsor contacts - added a contact
    edit sponsor comments - added a comment
    -edit sponsor template reports - added a report type
    added a report recipient
    Tried to save; got STE

  * java.lang.RuntimeException: Unable to resolve collection property: class org.kuali.kra.award.home.AwardTemplate:templateContacts
  * org.kuali.rice.kns.service.impl.BusinessObjectAuthorizationServiceImpl.addMaintainableItemRestrictions(BusinessObjectAuthorizationServiceImpl.java:519)
  * Joe Williams on Tue, 5 May 2015 09:53:12 -0500 [View Commit](../../commit/80823d2cd8b55530839cc34c2aad91b74c3677bd)

##coeus-1505.8
* Oracle fixes
  * Our oracle installation scripts had a few issues.
  * 1. The anonymous block was assuming there was only one record in the subawards table while there could be more than one.
  * 2. Constraint was being applied in the wrong order.
  * The errors were
  * ADD CONSTRAINT FK3_BUDGET_SUB_AWARDS
                   *
  * ERROR at line 2:
  * ORA-02298: cannot validate (MG1504.FK3_BUDGET_SUB_AWARDS) - parent keys not
  * found

  * DECLARE
*
  * ERROR at line 1:
  * ORA-01422: exact fetch returns more than requested number of rows
  * ORA-06512: at line 7
  * Gayathri on Mon, 4 May 2015 13:59:37 -0700 [View Commit](../../commit/20babdc1852e11501469e4022a466eca3d8d3759)

##coeus-1505.7
* No Changes


##coeus-1505.6
* fixes issues with printing s2s forms after proposal has been submitted to s2s

  * As a user, I need to be able to open a previously submitted PD and generate the PDF form files. I use this tool to verify the attachments I uploaded are the same as those in the sponsor's grant image, and to reference when I am preparing a resubmitted version of this research project. In the current release, I cannot generate the PDF forms of a submitted proposal. I get an STE.

  * Steps to reproduce:
  * Locate a submitted proposal (example res-demo1: Proposal #65, doc 5146)
  * Navigate to Basics > S2S Opportunity Search > Forms
  * OR Toolbar > Print > Grants.gov forms
  * Select one or all of the available s2s forms
  * use the Generate the PDF file tool

  * Expected result: the PDF file is generated and can be opened, viewed, saved, etc.
  * Actual result: STE appears onscreen.

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController.printForms(ProposalDevelopmentS2SController.java:196) at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController$$FastClassBySpringCGLIB$$5f5dd18.invoke(<generated>) at
  * Joe Williams on Mon, 4 May 2015 16:26:12 -0500 [View Commit](../../commit/0b9d8a26de48a35bd0d6ac15975f6c019df988bc)

##coeus-1505.5
* return user to the subaward document from subaward invoice if subaward invoice was opened from the subaward document

  * Create/open subaward document.
  * Use Add Invoice Button on the Financial tab to open an invoice document.
  * At close, submit, or blanket approve, the user is taken back to the KNS maintenance screen instead of the KRAD portal
  * Joe Williams on Mon, 4 May 2015 11:03:48 -0500 [View Commit](../../commit/a4d4f6cca622470bc84d6fc5e1cf955bce375cab)

##coeus-1505.4
* No Changes


##coeus-1505.3
* Copying award results in read-only award and broken hierarchies

  * This is due to the authorization fields no being populated and only populated during docHandler. Removing this check added fixes this.
  * blackcathacker on Fri, 1 May 2015 15:28:27 -0700 [View Commit](../../commit/a250dbabb0184ea44f5a324e02e641d16278813e)
* Sponsor Award ID label.

  * https://github.com/kuali/kc/pull/1578
  * KRAFDBCK-9468

  * Changing "Sponsor Award" label to "Sponsor Award ID" in Negotiation.
  * Travis Schneberger on Fri, 1 May 2015 14:48:22 -0400 [View Commit](../../commit/35bfa7ebd1d70a91bc7932ab5ed5937ceb42ca85)
* Custom data escape.

  * https://github.com/kuali/kc/pull/1579

  * [KRAFDBCK-10749] Escaping custom data values so single quotes don't terminate them early.

  * This fixes being able to break out of custom data values with single quotes in the KNS custom data tag (KRAD does this already).
  * Travis Schneberger on Fri, 1 May 2015 14:54:18 -0400 [View Commit](../../commit/5a966812b677c0591014020e365e15f1aa532ba4)

##coeus-1505.2
* No Changes


##coeus-1505.1
* KRMS - Rule Function 'Incomplete Narrative Rule' has logic reversed

  * The KC KRMS Function "Incomplete Narrative Rule" has logic reversed and is actually checking that narratives are complete.
  * Analogous Coeus function is "Complete Proposal Narratives.
  * Rather than reprogramming the logic of the KC function, the name should be changed to represent what the function actually does.

  * Change name of function to "Complete Narrative Rule"
  * Joe Williams on Thu, 30 Apr 2015 15:43:40 -0500 [View Commit](../../commit/e7cb52c9b5bd23ebf1b714c7eb4394a9033ac402)
* format currency values with commas

  * Throughout the PD Budget, money values are formatted without any commas (or dollar signs). When populated, money value fields should be formatted with commas and decimal as for currency. And especially when you get into the millions not having the commas becomes a problem.
  * Joe Williams on Thu, 30 Apr 2015 11:24:24 -0500 [View Commit](../../commit/c5d86877ac264163546d13cb259231f96de22d37)

##coeus-1504.17
* No Changes


##coeus-1504.16
*  Do not regenerate periods if periods already exist!
  * As an award budget user, when I create a rebudget (new version of posted budget with no change to authorized amount), I expect to have all the budget details from the last posted version appear in the rebudget. I should be reducing funds from the existing line items and redistributing that amount to current or new line items, confined to matching the preexisting authorized total.
  * Current (4/29/15) release is not copying the posted budget details to the rebudget; the rebudget is blank, only letting me search for an IP to link details or manually reenter all items. This is not the intended functionality, and not consistent with prior releases.
  * Steps to recreate:
  * Kuali.com demo1 site on 4/29/2015. Award *73-00001, acct id 2533529
  * As Quickstart:
  * Locate an existing award or create a new award with T&M values maintained.
  * Create an initial Award Budget, match to auth total: Actions> submit;
  * As JTester:
  * Action list: Award budget link:Actions> approve the award budget.
  * As Quickstart:
  * Open Award Budget: Actions > post.
  * Open Award > Open Budget Versions
  * To create the rebudget (new AB without change to T&M).
  * -click 'new' to create the rebudget documument
  * result:
  * The new 'rebudget' is not populated with the details entered in the prior approved/posted version.
  * Thus, all the manually entered the details (or modified pulled in PD budget details) are lost, requiring the AB admin to do all the work over again from scratch.
  * The system should be copying the budget line item details forward to the rebudget; users should only be required to shift funds (reduce some line items to rebudget to another) to meet the authorized amount.
  * Rebudget had been working in previous tests: I have done a rebudget where I put in negative value in an existing detail line item to the add that value to another or new line item.
  * Gayathri on Thu, 30 Apr 2015 17:32:16 -0700 [View Commit](../../commit/b4489c9e8c93664f560489a4c41e0df1be229683)
* SubAward Status is incorporated instead of Award Status in Subaward tab
  * in Award Document.
  * anumole on Mon, 27 Oct 2014 17:33:28 +0530 [View Commit](../../commit/f797df76df53b03bef8fc3fd086f4792c7de8367)
* Negotiation Unassociated Detail Inquiry Title Change fix
  * Joe Williams on Thu, 30 Apr 2015 16:32:05 -0500 [View Commit](../../commit/f42ff59a3949e71d4baf2e46105a574f47d0ff97)
* Fixed issue of showing latest version of award instead of Active in Awrd
  * heirarchy view.
  * vineeth on Thu, 2 Oct 2014 10:51:48 -0400 [View Commit](../../commit/4fbb3c6a02ac56af40f52424b5e1e56278943a76)
* https://github.com/kuali/kc/pull/1584
  * KRAFDBCK-12440

  * This enhancement adds a new parameter "IP_INTELLECTUAL_PROPERTY_REVIEW_TAB_ENABLED" to determine whether or not the Intellectual Property Review tab should be shown in IP.
  * Travis Schneberger on Thu, 30 Apr 2015 15:46:24 -0400 [View Commit](../../commit/ebc0f36c251b60ca7465d727787126f601c20491)
* Editing budget category generates STE

  * User Story: As a system administrator, I want to periodically edit budget categories, so our budget calculations are accurate

  * Steps to Reproduce:

  * 1) System Admin Portal > Maintenance > Budget Category
  * 2) Click the 'search'
  * 3) Click 'edit' next to any result
  * 4) Enter a description on the Document Overview tab and then edit the Description in the Edit Budget Category tab
  * 5) Click either 'submit' or ' blanket approve'

  * Actual results:

  * User is redirected to an Incident Report screen with the following error: Error Details: OJB operation; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'budgetCategoryTypeCode' in 'where clause'

  * Expected results:

  * Document should go directly to final and record should be updated with the users changes.

  * User acceptance criteria:

  * Given a system administrator has to edit a budget category, when the appropriate edits are made and submitted, then the budget category is updated with my changes.
  * Joe Williams on Thu, 30 Apr 2015 14:20:24 -0500 [View Commit](../../commit/261e859ae06470ad7a7d44c7890d80dabf98f23a)
* Review comment updates for CONTRIB file
  * blackcathacker on Thu, 30 Apr 2015 09:13:52 -0700 [View Commit](../../commit/b7605bb14d3a16800523ad86ad7da20a7f7939b9)
* Add contributing file for public contributions
  * blackcathacker on Wed, 29 Apr 2015 10:19:55 -0700 [View Commit](../../commit/5a54613840fd271df6650d4ec9ff54180333f254)
* Award: Increase system performance on structure with many child accounts
  * Travis Schneberger on Thu, 30 Apr 2015 09:16:14 -0400 [View Commit](../../commit/790971bf9c1e21abbfb82d04b78132aafa35a9db)
*  Refactoring and small unit test to exercise code
  * blackcathacker on Wed, 29 Apr 2015 20:11:52 -0700 [View Commit](../../commit/31c692bece2a7316e85c62af70b319d7f9d5ef3a)
* Use awardDocument updated info instead of award

  * Award Time and Money - T&M updates should not alter Award Version update timestamp and user
  * The History view should not reflect the update of the T&M change, but maintain when the award was last updated.
  * Using the awardDocument update timestamp accomplishes this.
  * blackcathacker on Wed, 29 Apr 2015 17:58:30 -0700 [View Commit](../../commit/f03dc89bc3732fbfc12ac87ead09987350ff8b84)
* Fix unit test related to: Omit questionnaires when related forms are not marked as included
  * Travis Schneberger on Wed, 29 Apr 2015 19:38:44 -0400 [View Commit](../../commit/abac58680d59d3ca592e1740159e9b50ed651785)
* Set bounds on DevelopmentProposal lookups

  * When tested originally we were able to repo a outofmemory error and the search taking a LONG time. By setting bounds on the search always the search returns rather quickly. Further work needs to be done to resolve problems when a user has limited access to proposals as none may returned as the first 20 returned don't include any they have permission on.
  * blackcathacker on Wed, 29 Apr 2015 14:11:21 -0700 [View Commit](../../commit/5fa5fff9f459bff9db49cdc183685bef9fdca608)
* Omit questionnaires when related forms are not marked as included
  * Joe Williams on Wed, 29 Apr 2015 15:54:10 -0500 [View Commit](../../commit/040f6e167a863d1d8aa30e567f89d97024b69840)
* RESKC-361 avoiding a resource leak that was indicated by a OJB warning message.
  * Travis Schneberger on Wed, 29 Apr 2015 15:19:27 -0400 [View Commit](../../commit/3214d06c87af20c54ff046821a1df6e3942db543)
* RESKC-361 avoiding a NullPointerException on proposal copy.

  * When an attachment exists such as a narrative or biography but the attachment does not have attachment data and the proposal attachment is copied with the copy attachments option then a NullPointerException occurs.  This scenario should not happen under normal circumstances and may indicate bad data in the system.
  * Travis Schneberger on Wed, 29 Apr 2015 15:18:45 -0400 [View Commit](../../commit/cf89f15c4f0ef48d29809933eb6d568a1985c462)

##coeus-1504.15
* No Changes


##coeus-1504.14
*  Moving schemaspy feature to public release.

* Moving schemaspy initialization logic and dependency info out of the grm profile
* Making schemaspy a compile-time dependency, with current version
* Adding database script with conditional insert for schemaspy auth
* Adding schemaspy instructions to readme.md
* supporting oracle in schemaspy filter and cleanup
* cleanup of poms
* fix incorrect instructions for instrumentation in readme.md
  * Travis Schneberger on Tue, 28 Apr 2015 10:57:12 -0400 [View Commit](../../commit/12995f562722e950f551547999a069b875014137)
*  IP versioning should not copy award funding proposals over.
  * When a version of IP is linked to a version of the award, only that version needs to be linked instead of all edits of ths IP beling linked to the award. While displaying the awards linked in IP, display all the IP versions linked to awards.
  * Gayathri on Mon, 27 Apr 2015 11:28:20 -0700 [View Commit](../../commit/d7220558d85e3cdd9889898462c87baedcd797a7)
* set correct update user after editing an institutional proposal

  * Edit an IP
  * The Last Update field appropriately indicates the user that is updating the record while it is open.
  * Approve
  * Close
  * Reopen the IP

  * Actual result: Last update shows as performed by "kr"
  * Expected result: Last update should display user not "kr".
  * Joe Williams on Tue, 28 Apr 2015 09:01:05 -0500 [View Commit](../../commit/05d252067cca63f76fa850383904024a17cb476c)
* release workflow pessimistic locks after approval

  * Approvers receive the following error message after approving proposal development document:

  * This document currently has a 160-PROPOSAL DEVELOPMENT lock owned by KR
  * Joe Williams on Tue, 28 Apr 2015 08:39:16 -0500 [View Commit](../../commit/c85a0f15a28626e69ec1bf61468d2d751afa2fb1)

##coeus-1504.13
*  depending on new kualico build of jasper token auth jar
  * Travis Schneberger on Mon, 27 Apr 2015 17:26:07 -0400 [View Commit](../../commit/c690912d6b92bd4e13dcfa48e2f9977a980cee9b)
* Fix Wrong Proposal Status after Proposal Approved at Final Stop and Submitted to Sponsor

  * Create Proposal
  * Submit for Review
  * Do approvals
  * At final stop, approve and then automatic submission to sponsor
  * Actual Result: Status is set to 'Approved Post-Submission'
  * Expected Result: Status is set to 'Approved and Submitted'
  * Joe Williams on Mon, 27 Apr 2015 15:35:26 -0500 [View Commit](../../commit/e886230a92b6eff85f03c7c6281038af0d539cca)
* RESKC_352:clean up proposalHierarchyServiceImpl
  * Joe Williams on Mon, 27 Apr 2015 08:18:52 -0500 [View Commit](../../commit/18e3411729d385aaf45ef68227ee2f02c2fff205)
*  resequencing sql scripts, adding oracle script
  * Travis Schneberger on Fri, 24 Apr 2015 10:57:40 -0400 [View Commit](../../commit/497023f9082dd4fc2a659d04c17674cbe267e1a2)
*  code review comments
  * Travis Schneberger on Fri, 24 Apr 2015 10:18:51 -0400 [View Commit](../../commit/090ce7405cf9ce13a1efe4704b84b456e0d88f23)
*  make award date change transactions show up with a transaction id in the various history views and transaction print dropdown menus
  * Travis Schneberger on Wed, 15 Apr 2015 15:42:18 -0400 [View Commit](../../commit/89271da4bc2bdc7ced2643f05b5d46200dbebc66)
*  cleanup
  * Travis Schneberger on Wed, 15 Apr 2015 09:02:54 -0400 [View Commit](../../commit/90f296b210c720b318d9eea90379c57676f3f431)
*  added institutional proposal rest service
  * Joe Williams on Thu, 23 Apr 2015 12:30:06 -0400 [View Commit](../../commit/15f392cb5600d3c13017bc2840d0930f7535e6b0)

##coeus-1504.12
* Make all xmlstream beans prototype scope

  * XMLStream beans contain state which means they all need to be prototype scope to avoid potential clashes when server is under load
  * blackcathacker on Fri, 24 Apr 2015 10:03:02 -0400 [View Commit](../../commit/99f10d6cdf0244dd1d5fa52e80c334f1aea21cf7)
*  added correct s2s error message and fix it link for congressional district errors

  * The Fix button for Validation error on Congressional District in the Grants.gov Errors section takes you to S2S window; it should take you to Organization Tab where error can be fixed.
  * Joe Williams on Fri, 24 Apr 2015 09:40:05 -0400 [View Commit](../../commit/e43cc0dfc627da384a9d38f44400cce0de94a106)

##coeus-1504.11
* HealthCheck now reports configured version and specific database status
  * blackcathacker on Thu, 16 Apr 2015 17:52:24 -0700 [View Commit](../../commit/0f5d4f83b24c46abeaed8f4ebcb755d47bac10a4)

##coeus-1504.10
* Fix failing integration tests

  * Integration tests are failing as the controllers were the only things setting the upload information in the attachment. By setting the upload info during pre-persist we make sure the info is never null in integration tests or in the case of additional code paths
  * blackcathacker on Thu, 23 Apr 2015 09:30:24 -0400 [View Commit](../../commit/de24948ab4c31f1f667ec43b6c0c63fe9e23764e)
* Remove duplicately versioned sql files
  * blackcathacker on Wed, 22 Apr 2015 16:43:11 -0400 [View Commit](../../commit/79a52c523bd8a4a0d3a0e420ead15ddc848c5313)
* add warning message to autocalculate periods
  * Joe Williams on Fri, 17 Apr 2015 15:32:59 -0500 [View Commit](../../commit/ba6d6074d5f63f4a3e54b722726a8f0e1cb12494)
* Code review comments
  * blackcathacker on Fri, 17 Apr 2015 09:25:18 -0700 [View Commit](../../commit/998b02c569c33888517c6b390099c608af2a4a1f)
* Fix update user and date on attachments in PropDev
  * blackcathacker on Thu, 16 Apr 2015 22:28:17 -0700 [View Commit](../../commit/4d820fb8ab3f8ec8a4b879922b8e77aaa9070ccd)

##coeus-1504.9
* Award Placeholder Document fixes

  * When the placeholder doc was created by creating an award and not copying a hierarchy the resulting document doesn't have a valid award. Specifically no sponsor code which was causing an exception. This checks for the placeholder doc before checking for the sponsor groups.
  * blackcathacker on Wed, 22 Apr 2015 11:33:56 -0400 [View Commit](../../commit/bc28f8e7a6016e15b6b550f1c9c906f1100c8422)

##coeus-1504.8
*  Cleaning up commit. Since we are overriding refreshNonUpdateableReferences anyway, we do not need to override method in rule base. Serialization changes also not needed it appears.
  * Gayathri on Wed, 22 Apr 2015 05:59:13 -0700 [View Commit](../../commit/f888b9beac9a478fa7740bb0af028fcbefa37cbd)

##coeus-1504.7
* fix rolodex persistence through sponsor maintenance document

  * Scenario:
  * 1 - Create a new Sponsor
  * 2 - Add Sponsor and Address details
  * 3 - Submit new Sponsor
  * 4 - Search for new Sponsor and open inquiry.

  * Result:
  * When the inquiry is opened you can see that a new rolodex record has been created but there is no address book information. If you try searching for the address book record, you can only copy the record, not edit it.

  * Expected Behavior:
  * 1 - The address book entry details should be saved when the sponsor record saves.
  * 2 - The address book record should be editable from the address book lookup.
  * Joe Williams on Tue, 21 Apr 2015 18:53:04 -0400 [View Commit](../../commit/03d6db21c678c2728cf9d5ca447cd648b735b891)

##coeus-1504.6
* No Changes


##coeus-1504.5
* Allow sponsor code to be smaller than 6 characters

  * A customer ended up with sponsor codes shorter than 6 characters and since it was allowed by the database and a minimal functional change the sponsor code can now be any alphanumeric up to 6 characters
  * blackcathacker on Tue, 21 Apr 2015 16:02:18 -0400 [View Commit](../../commit/0cc7dfba835c8343524a797e540d6d65871ee780)
* Oracle scripts

  * Bring full oracle scripts renamed and numbered back into the project
  * blackcathacker on Tue, 21 Apr 2015 09:15:55 -0400 [View Commit](../../commit/4df62ebd31a478844448a5e7d0a250953058cfc4)
* added rolodex and ynq inquiry links to organization inquiry view
  * Joe Williams on Fri, 17 Apr 2015 14:59:43 -0500 [View Commit](../../commit/c7cf6e478b5d2a48414ed0ef7c91c94b3495317e)
* added update user to data over history
  * Joe Williams on Fri, 17 Apr 2015 13:58:48 -0500 [View Commit](../../commit/c07944d2ec00d457defeb1ce99ccecec973c7e4a)

##coeus-1504.4
* kc-sql version update
  * blackcathacker on Fri, 17 Apr 2015 21:48:12 -0700 [View Commit](../../commit/e0669b0a138ac093a19a33dde380a4f534762e3c)

##coeus-1504.3
* KRAFDBCK-10988: Adding totals to Negotiation Activity sub-tabs
  * rojlarge on Tue, 7 Apr 2015 18:39:30 -0400 [View Commit](../../commit/c0c22a523dc0f8e0c7361343eb0e03af5a5d4b75)

##coeus-1504.2
*  Renaming log files to right version
  * Gayathri on Fri, 17 Apr 2015 16:19:58 -0700 [View Commit](../../commit/aaa91348c850f74e22f028619b714954ccb15c6b)
* Documentation for public release and build
  * blackcathacker on Fri, 17 Apr 2015 16:04:52 -0700 [View Commit](../../commit/80748ea9cb76f523f7d50f4a6b975aec7c96263f)
* renaming files and removing temp files
  * Gayathri on Fri, 17 Apr 2015 15:45:36 -0700 [View Commit](../../commit/bcb851a18f8bbde30d3df87fa1bc4e083debd1c3)
*  Adding 1504 mysql and oracle release scripts
  * Gayathri on Fri, 17 Apr 2015 15:23:03 -0700 [View Commit](../../commit/cc29093c62e019bb200c83a02d8088137a407be5)

##coeus-1504.1
* moving away from sem ver
  * Travis Schneberger on Fri, 17 Apr 2015 18:30:33 -0400 [View Commit](../../commit/d0596b11edec6e28577a48b08f26ad065304191f)

##coeus-6.0.2.27
* updating dependencies and plugins in pom file
  * Travis Schneberger on Thu, 16 Apr 2015 19:48:55 -0400 [View Commit](../../commit/56974b1f0ed5bd1440569d2ad0b6fbb307e0557b)

##coeus-6.0.2.26
* fix report tracking to hide update user and timestamp when date entry hasn't been entered
  * Joe Williams on Thu, 16 Apr 2015 12:20:32 -0500 [View Commit](../../commit/fd64b8d58279084f53791420b1746ae10b73b205)
* allow printing of sponsor form when view only
  * Joe Williams on Wed, 15 Apr 2015 13:03:16 -0500 [View Commit](../../commit/d4321526420059f0232fb283391ebb2461d34c03)
* populated budget formulated costs from unit formulated cost tables
  * Joe Williams on Wed, 15 Apr 2015 09:46:54 -0500 [View Commit](../../commit/47bdb61e409299b37e172b931d8970b6846c435b)

##coeus-6.0.2.25
* No Changes


##coeus-6.0.2.24
*  upgrade rice
  * Joe Williams on Thu, 16 Apr 2015 08:22:34 -0500 [View Commit](../../commit/8bae0b0bdc31c5833a25aa5f7f42a92c44e8a569)

##coeus-6.0.2.23
* Move rest service dependency out of grm profile

  * The moo and mvel dependencies are always required so move them into the main dependency section
  * blackcathacker on Wed, 15 Apr 2015 17:59:49 -0700 [View Commit](../../commit/985d7f88218dd871624148d4faa2ec84ca152d55)

##coeus-6.0.2.22
* Update rice version
  * Joe Williams on Wed, 15 Apr 2015 17:03:38 -0500 [View Commit](../../commit/bf02c41a3b57ecc550aaf04ee416e959c5debf00)

##coeus-6.0.2.21
*  rice upgrade
  * Gayathri on Wed, 15 Apr 2015 08:37:43 -0700 [View Commit](../../commit/95dc07436f1afb7fcd8d5414ca83801fd943e591)

##coeus-6.0.2.20
*  fixing date calculation
  * Travis Schneberger on Tue, 14 Apr 2015 09:13:19 -0400 [View Commit](../../commit/8d546ff3ffc857bc2507d8f6fe0390a4a26905ff)

##coeus-6.0.2.19
* review comments
  * Gayathri on Mon, 13 Apr 2015 16:55:43 -0700 [View Commit](../../commit/a1a7ed197223235358f56d9aadbbd8947a77c04f)
*  moving rejected docs to saved state
  * Gayathri on Mon, 13 Apr 2015 10:34:44 -0700 [View Commit](../../commit/8e741a6bcc9030cd8f0883138b01026eb181f91c)

##coeus-6.0.2.18
* Update Rice Version
  * blackcathacker on Mon, 13 Apr 2015 14:07:58 -0700 [View Commit](../../commit/aa01f02f4b30a4cef77f9bfe333829eabb27275c)

##coeus-6.0.2.17
* Code review comments and copyright notices
  * blackcathacker on Mon, 13 Apr 2015 13:04:01 -0700 [View Commit](../../commit/c829857a50660bd18ad5a996665f937fdd02bd13)
*  PSU Award Summary Service
  * blackcathacker on Wed, 18 Feb 2015 15:40:02 -0800 [View Commit](../../commit/a35bf7b3a4d80385e0ccbcdc2cd712bfe35ad371)

##coeus-6.0.2.16
* fix people flow member require validation on add line on submit
  * Joe Williams on Mon, 13 Apr 2015 11:11:00 -0500 [View Commit](../../commit/733b6f6a9cd23d536427815261db896f9b2756f5)

##coeus-6.0.2.15
*  fixing key person unit validation
  * Travis Schneberger on Mon, 13 Apr 2015 11:07:51 -0400 [View Commit](../../commit/74065cd3dc7c96c0216ec2235fd8ae2e72d3575a)

##coeus-6.0.2.14
* make non personnel budget line items detail viewable when budget is readOnly
  * Joe Williams on Fri, 10 Apr 2015 10:44:30 -0500 [View Commit](../../commit/858e55f9b573132f6673f5d4d4c7ddb5f7d32f6e)
* make personnel details viewable in view mode
  * Joe Williams on Fri, 10 Apr 2015 13:33:55 -0500 [View Commit](../../commit/4f6ab6dd0ef5b843815a615bd91573d9a834c62a)

##coeus-6.0.2.13
* Jasper Report Links
  * blackcathacker on Fri, 10 Apr 2015 12:41:03 -0700 [View Commit](../../commit/dec341bf9aed3ce0c2f175760636c453e1d0da46)
* remove narrative locking region
  * Joe Williams on Fri, 10 Apr 2015 12:38:06 -0500 [View Commit](../../commit/a15fc1881b9d22be5da065cd6e1bf430ab9c4179)
*  upgrading rice
  * Gayathri on Fri, 10 Apr 2015 09:14:14 -0700 [View Commit](../../commit/814d625c456c7c9c12a1dc8d29d0103120264169)

##coeus-6.0.2.12
* No Changes


##coeus-6.0.2.11
* removed duplicate headers on krms and people flow documents
  * Joe Williams on Fri, 10 Apr 2015 10:08:02 -0500 [View Commit](../../commit/926204a501f784b198b07b46fe70fa887bcef87d)
* add warning message when adding a narrative type to the child that is already on the parent
  * Joe Williams on Thu, 9 Apr 2015 09:19:57 -0500 [View Commit](../../commit/f7ddacadd29371782ffa032c7d992cb3edb1464a)

##coeus-6.0.2.10
* Make PD unit number search field uniform and not restricted
  * blackcathacker on Thu, 9 Apr 2015 22:06:18 -0700 [View Commit](../../commit/f9021255f95f95f159989f5a831eb6209f5c3ab4)

##coeus-6.0.2.9
*  Award authorization issue
  * Gayathri on Thu, 9 Apr 2015 12:11:36 -0700 [View Commit](../../commit/0df17791f67164c47d6b08e4130f8ec49b973c1f)

##coeus-6.0.2.8
* fixed lookups on people flow members section
  * Joe Williams on Thu, 9 Apr 2015 13:42:24 -0500 [View Commit](../../commit/d42d12a23f0eb631ca324174af5702bd26ac670d)

##coeus-6.0.2.7
* make personnel budget line items details viewable when budget is readOnly
  * Joe Williams on Thu, 9 Apr 2015 12:52:40 -0500 [View Commit](../../commit/436b252792a8d6bed66678b6c7b3a95dcabb5b0c)

##coeus-6.0.2.6
*  Budget STE fix
  * Gayathri on Wed, 8 Apr 2015 10:55:26 -0700 [View Commit](../../commit/ba7600fabcee66f9673d8c09fcbddbbc40a65b40)

##coeus-6.0.2.5
*  Add fyi and acknowledge to action list.
  * Gayathri on Wed, 8 Apr 2015 09:21:18 -0700 [View Commit](../../commit/3f8bfb1d44a959edd717a52544ddac1ac492f104)

##coeus-6.0.2.4
* Fix sql to avoid primary key conflicts
  * blackcathacker on Tue, 7 Apr 2015 20:33:23 -0700 [View Commit](../../commit/22a4b96beaed5dc64aba04825f751192094f0e56)

##coeus-6.0.2.3
* Fix integration test
  * blackcathacker on Tue, 7 Apr 2015 18:02:21 -0700 [View Commit](../../commit/d056987b4666d51b996e984854df5904e6381370)
* Fix attachment problem by never doing orphanRemoval
  * blackcathacker on Tue, 7 Apr 2015 16:50:30 -0700 [View Commit](../../commit/ea2f774303c1b476579ebf90155be07e334a4108)

##coeus-6.0.2.2
*  updating pom, fixing db scripts that were changed as a part of a code review
  * Travis Schneberger on Tue, 7 Apr 2015 16:58:28 -0400 [View Commit](../../commit/d468f72bc90cdc47f8266e19b7c355fbef075d5b)
*  nsf cover page 1-6
  * Gayathri on Wed, 25 Mar 2015 12:22:35 -0700 [View Commit](../../commit/b00fdc8f2e00e08da81104485e8502f53b299f4e)
*  displaying sponsor award id not sponsor code
  * Travis Schneberger on Tue, 7 Apr 2015 16:23:56 -0400 [View Commit](../../commit/3a5288b201bc8f7540f332c5e6215e3b19a95fe2)
* fix broken test
  * Joe Williams on Tue, 7 Apr 2015 09:57:15 -0500 [View Commit](../../commit/1f8f4ffe0e61702bc04d00f1e41741cb2fa7d259)
*  making PeopleFlow lookup not open in an iframe
  * Travis Schneberger on Tue, 7 Apr 2015 10:47:00 -0400 [View Commit](../../commit/883318884f03f90eab034b83b01f53967b9c2715)
* apply unit agenda to all units in hierarchy
  * Joe Williams on Mon, 6 Apr 2015 15:06:51 -0500 [View Commit](../../commit/06939b293f62441f7acf74f549439ec4be32d81b)
* rename asdf custrom attribute group name to additional data
  * Joe Williams on Mon, 6 Apr 2015 16:07:16 -0500 [View Commit](../../commit/0c6c27bb02bb3c7543f7338be56f653769fe6665)

##coeus-6.0.2.1
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 21:36:12 -0400 [View Commit](../../commit/7313e436dac0e1dec0d339a982bd13678937e935)

##coeus-6.0.2.0
* Fix questionnaire test -- apparently didn't stage changes
  * blackcathacker on Mon, 6 Apr 2015 16:09:09 -0700 [View Commit](../../commit/7ebc716812c82ca06b83d46783beb77d26326b4a)
* Fix questionnaire test
  * Test was broken when switching viewing questionnaires from using the last document verison to using the database version always
  * blackcathacker on Mon, 6 Apr 2015 10:15:07 -0700 [View Commit](../../commit/8529b0d786b69d04ed2a98bced752aac7f7360e3)
* fix issues with person biosketch on prop dev
  * Joe Williams on Mon, 6 Apr 2015 08:28:26 -0500 [View Commit](../../commit/4a9d5ee0c8fb954e22a6d17f63619ab1e22582b3)
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 10:16:45 -0400 [View Commit](../../commit/69b167e22afd71c8ea6dbbab40fd38ec777e635b)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 09:28:24 -0400 [View Commit](../../commit/768e003ff526fc0a826f7d5916491db80ccf46ba)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 00:50:06 -0400 [View Commit](../../commit/35e0dd33e841e1c606fad02734d802332e9773ab)
* Update pom.xml  * Travis Schneeberger on Fri, 3 Apr 2015 20:30:22 -0400 [View Commit](../../commit/8e0e708802ae702e1f64ea6e6cf4bcf4806d3a1f)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 18:15:28 -0400 [View Commit](../../commit/aee775ffe111bdcbb7e417ae4a7750300e688042)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 18:09:57 -0400 [View Commit](../../commit/778e3d1004c1786f7ae65da72a40d031af8ad4fb)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 17:17:51 -0400 [View Commit](../../commit/d18ad43b5ef50726b0e463c9f695a47f153fb4a1)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 16:24:44 -0400 [View Commit](../../commit/c121570946cd8c1a4672ba3ade7ec2630ec8b86d)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 14:19:23 -0400 [View Commit](../../commit/0bb8dd92b3f020ed3bf5b558f13d0fde5a1dc97f)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 14:10:28 -0400 [View Commit](../../commit/88de6f425229e94204c491ec313fb6f5627e5839)
* dead js cleanup
  * Travis Schneberger on Fri, 3 Apr 2015 11:40:05 -0400 [View Commit](../../commit/59baafe9d00379094d7d7073e974ed291bba7e23)
* cleanup dead pd code, fixing precompilation step, fixing jsp compilation failures
  * Travis Schneberger on Fri, 3 Apr 2015 10:39:19 -0400 [View Commit](../../commit/b8280d98a718769e4be368fa4580998ba6273e94)
* Cleanup dead code in TimeAndMoneyHistoryServiceImpl
  * blackcathacker on Wed, 1 Apr 2015 15:59:19 -0600 [View Commit](../../commit/5a6f2e5102bd766a450cf6a3ec35723fc5a8d69e)
* Fix up abstractBudgetService
  * Joe Williams on Thu, 2 Apr 2015 13:01:34 -0600 [View Commit](../../commit/3a9dc171391f24bbfb27a2b46fb998672504a7d6)
* Refactor/test time and money trans history
  * blackcathacker on Tue, 31 Mar 2015 16:52:08 -0600 [View Commit](../../commit/1f39073e2a318206b794ea2fe3eb737addeb5055)
* Refactoring UnitServiceImpl
  * Travis Schneberger on Tue, 31 Mar 2015 11:43:05 -0400 [View Commit](../../commit/f4b6e5137e7c601695ce9d58417484cb16af9721)
* Modify and refactor unit and jetty memory arguments
  * blackcathacker on Fri, 27 Mar 2015 15:36:55 -0700 [View Commit](../../commit/4e7152bf30f5a6f8a8863bba3b10cb993d366396)
* Add citizenship type to clear error
  * blackcathacker on Thu, 26 Mar 2015 19:51:35 -0700 [View Commit](../../commit/a73050fea047564acbeefa8569ffa86990b3c2ce)
* View questionnaire using table instead of doc
  * This is to avoid serialization issues that occur due to questionnaire class repackaging
  * blackcathacker on Thu, 26 Mar 2015 17:52:57 -0700 [View Commit](../../commit/f0a41a0001fa963fe965483c29b3686aec0d92bb)
* Fix GRM SQL Error
  * blackcathacker on Thu, 26 Mar 2015 16:44:04 -0700 [View Commit](../../commit/c7113ca039623421b63f44ac81f51e1ea0706ef9)
* once a budget line item is added summary rows are no longer editable
  * Joe Williams on Wed, 25 Mar 2015 16:33:47 -0500 [View Commit](../../commit/e3ba5d7beb67c6f5600561ad2095d590296b3a5b)
* save budget when applying rates to later periods
  * Joe Williams on Wed, 25 Mar 2015 16:23:20 -0500 [View Commit](../../commit/2e7aa920e36fe2ffb550b73e1fc797a679e8117a)
* fix issue with escalating award budget total costs
  * Joe Williams on Wed, 25 Mar 2015 14:34:40 -0500 [View Commit](../../commit/f07ed082e40e3fecce2923c64f07a02fbf85c942)
* RESKC_239:update attachment handling to be compatible with oracle and mysql
  * Joe Williams on Wed, 25 Mar 2015 12:34:23 -0500 [View Commit](../../commit/40bf50c3ab7ed4ee560a20ef6a908f43f6a89008)
* fix print s2s xml button
  * Joe Williams on Wed, 25 Mar 2015 13:15:33 -0500 [View Commit](../../commit/572e2d6cf531cba3c986cb7a86a81c38d95a09ca)
* fix STE on award budget navigation
  * Joe Williams on Tue, 24 Mar 2015 16:41:34 -0500 [View Commit](../../commit/4c1371b4689abd9ea38d842d37adbe0917e1c739)
* filter on inflation rateClassType and add ID to table
  * Joe Williams on Tue, 24 Mar 2015 11:43:16 -0500 [View Commit](../../commit/b5be2afb71ccbe6cc22dd148535812ded8e0aeec)
* added campus code and unit quickfinders to add personnel wizard
  * Joe Williams on Tue, 24 Mar 2015 10:21:29 -0500 [View Commit](../../commit/27e5fec98788f52c467d05666babee428da27e39)
* fix STE on navigation to award budget summary
  * Joe Williams on Tue, 24 Mar 2015 09:33:42 -0500 [View Commit](../../commit/7dded8ecc47fcb1575a887b4d6e8150fb2a0049d)
* fix award labels on medusa view
  * Joe Williams on Mon, 23 Mar 2015 14:22:30 -0500 [View Commit](../../commit/32163e1b7400461130fde7d17293242cb9f1a799)
* create s2s error for missing citizenshiptype instead of throwing exception
  * Joe Williams on Mon, 23 Mar 2015 10:16:26 -0500 [View Commit](../../commit/80c865922b44fb588e89a14d69bf4665248ca649)
* add inflation rate info to add budget line item modals
  * Joe Williams on Thu, 19 Mar 2015 16:09:11 -0500 [View Commit](../../commit/40561a4ba47d0cf06a7b9e53ceeb9643a6c58bec)
*  Verify that the Instrumentation Configuration is correct
  * Travis Schneberger on Sat, 21 Mar 2015 21:21:40 -0400 [View Commit](../../commit/e208c6be03ab8e444a5254083b3e98714bd2890e)
* set default period to calendar
  * Joe Williams on Fri, 20 Mar 2015 17:01:31 -0500 [View Commit](../../commit/5b4be2c7bf7c82dc432f76182d9d8bda7ce1f8cc)
* fix STE on award notice print
  * Joe Williams on Fri, 20 Mar 2015 15:40:06 -0500 [View Commit](../../commit/adc64c4239a0b93f2f4a9df97a944f4062c5bed0)
* allow edit/copy of person training
  * Joe Williams on Fri, 20 Mar 2015 11:06:09 -0500 [View Commit](../../commit/9e29536a64c4d0cffe4eaf25cc6d456b359575ac)
*  updating error prone compiler, fixing several bugs found by compiler
  * Travis Schneberger on Fri, 20 Mar 2015 09:41:19 -0400 [View Commit](../../commit/1ef2966853ddc1328f74fc02ada486a926340dee)
* get xml file from subaward
  * Joe Williams on Fri, 20 Mar 2015 08:34:58 -0500 [View Commit](../../commit/13c43dc9386e327e7eb1929d57af27554c631493)
* Fix remaining integration tests
  * This also makes it so system properties always override configuration params
  * blackcathacker on Thu, 19 Mar 2015 20:02:06 -0700 [View Commit](../../commit/97d189cb3f616109c3f363bf62ec9467b06f9966)
* OJB mapping test configurable by system prop
  * In order to support configuring Jenkins CI test runs through Jenkins itself we need to be able to configure the OJB mapping test through system props
  * blackcathacker on Thu, 19 Mar 2015 11:04:51 -0700 [View Commit](../../commit/4edf73fa983f9bed8da46e8f0de29a9298dedf3f)
* Disable OJB mappings for subaward attachments
  * Subawards are only used by prop dev and therefore only relevent under JPA
  * blackcathacker on Thu, 19 Mar 2015 11:01:33 -0700 [View Commit](../../commit/6ad78c73a8bc378d3bd1011014478ac582c6c330)
*  resequencing db script
  * Travis Schneberger on Thu, 19 Mar 2015 10:44:03 -0400 [View Commit](../../commit/8e5c516212ec97cb1250c717efa9eedb550cc48c)
*  fixing staging data
  * Travis Schneberger on Thu, 19 Mar 2015 10:41:56 -0400 [View Commit](../../commit/4338fdb21b561862ba26e8ede085c28102aa91d6)
*  fixing coeus-it dependency and build order
  * Travis Schneberger on Thu, 19 Mar 2015 10:00:35 -0400 [View Commit](../../commit/e4cdd867c4ef8de28e23205626097cb5e26d62a3)
*  turning on flyway grm by default
  * Travis Schneberger on Thu, 19 Mar 2015 08:08:02 -0400 [View Commit](../../commit/dba00aac7ff22230ddda6560ab5983056502e95a)
* KCSUPPORT-661: properly reading logging files from the classpath
  * Travis Schneberger on Wed, 18 Mar 2015 20:18:57 -0400 [View Commit](../../commit/d9c57d4c0e914e71839cdd6e29ceebffc58edfd2)
*  adding schemaspy to our project
  * Travis Schneberger on Wed, 18 Mar 2015 17:36:02 -0400 [View Commit](../../commit/f453ad29308a3220c8b5affe202f7f058fe62bd7)
*  more help fixes
  * Gayathri on Thu, 12 Mar 2015 15:38:39 -0700 [View Commit](../../commit/e4be54df3781059509869faf9ce205be8388ec3b)
*  approver cannot view budget
  * Gayathri on Wed, 18 Mar 2015 15:28:39 -0700 [View Commit](../../commit/ab3135b5d0e8e0e3d451bc860c071c4f640b03ed)
* dismiss add person modal on add person request
  * Joe Williams on Wed, 18 Mar 2015 12:39:36 -0500 [View Commit](../../commit/47bc4c819ca6f8d87854d6a1a61760ee20ed9595)
* fix sql scripts
  * Joe Williams on Wed, 18 Mar 2015 08:33:28 -0500 [View Commit](../../commit/98f7c4632c10426a1b688eb9d8613f442c001bb7)
*  IACUC and IRB help fixes
  * Gayathri on Wed, 11 Mar 2015 17:10:28 -0700 [View Commit](../../commit/f7e55fa9231bfd5d074ac54d8140489ad4b36113)
*  info text
  * Gayathri on Tue, 17 Mar 2015 12:28:12 -0700 [View Commit](../../commit/1dfae9b559380ca2c39e22b286c7d684b7cd317c)
*  fixing budget rules
  * Gayathri on Mon, 16 Mar 2015 15:19:26 -0700 [View Commit](../../commit/f1be1a318f120bf0f3b9b9e62ed9b6688a2ae40b)
* fixed extended attribute biosketch validation
  * Joe Williams on Tue, 17 Mar 2015 10:11:25 -0500 [View Commit](../../commit/6a4a190622ad563ad15fdc94d246acb5226038cc)
* added budget category to non-budget add and edit modals
  * Joe Williams on Thu, 12 Mar 2015 14:34:01 -0500 [View Commit](../../commit/9b978e22af59cfa60c3b4b720495eaf70d7203cd)
* fix attachment deletion on copy and hierarchy
  * Joe Williams on Wed, 11 Mar 2015 13:24:19 -0500 [View Commit](../../commit/b3488496f6b224525b13f433eb95cdaae2a865b0)
* fix subaward attachment data
  * Joe Williams on Tue, 10 Mar 2015 16:55:33 -0500 [View Commit](../../commit/3b8220e13d57a0c148d55eecb1db52620e39d378)
* Support supplying test config via -Dvar=value
  * In order to support more easily configuring the CI server we want to move to -Dvar=value configuration for integration tests. By making these params not override previous values the -Dvar values are automatically pulled in and used.
  * blackcathacker on Mon, 16 Mar 2015 13:43:03 -0700 [View Commit](../../commit/bd7b6d440875a4bf445347aa6cdcda3ca702aa99)
* next iteration
  * Travis Schneberger on Mon, 16 Mar 2015 15:23:47 -0400 [View Commit](../../commit/0bf3f2b0b75a36de50a19ac259c5a537f8cfad0a)
* Update pom.xml  * Travis Schneeberger on Mon, 16 Mar 2015 14:24:25 -0400 [View Commit](../../commit/4580ff0b6e7541519476735526612290a0fb3dbb)
* Make debug logging debug
  * blackcathacker on Mon, 16 Mar 2015 09:56:34 -0700 [View Commit](../../commit/dc19e393ad5def2beeb2ffb12240865082d238ab)
* fix STE on unlink hierarchy
  * Joe Williams on Mon, 16 Mar 2015 09:06:49 -0500 [View Commit](../../commit/133f49a1f5053263661403c2b33ff8f8f2f930f1)
* return authorization exception messaeg instead of STE
  * Joe Williams on Fri, 13 Mar 2015 15:22:01 -0500 [View Commit](../../commit/bc1a27dc1dbeec2eb35aabc71946f4746698ed19)
* fix enroute attachment saving
  * Joe Williams on Fri, 13 Mar 2015 09:16:56 -0500 [View Commit](../../commit/d779cdb339a5adb7365e6a1a938d666c39a4e41c)
* fix attachment errors when linking to child from parent
  * Joe Williams on Wed, 11 Mar 2015 10:33:15 -0500 [View Commit](../../commit/5beb381422c896a3623eaa0908d536e9e22731eb)
*  Award locks fix
  * Gayathri on Tue, 10 Mar 2015 15:04:11 -0700 [View Commit](../../commit/42ef8b17a34420e6bff58d6d1c69f4a3822ffcd3)

##coeus-6.0.1
* releasing
  * Travis Schneberger on Mon, 16 Mar 2015 14:13:11 -0400 [View Commit](../../commit/7f64da820e133d1d0fbd3d5bc216145d58d0dc44)
* release
  * Travis Schneberger on Mon, 16 Mar 2015 12:51:00 -0400 [View Commit](../../commit/bb72f3def08e57a5f0b5cb18f8b6dcb4950849ed)
* KRACOEUS-8949: releasing s2s
  * Travis Schneberger on Mon, 16 Mar 2015 10:18:12 -0400 [View Commit](../../commit/4bf6fc11c1d7e71abb46a4260e01b00781dea35d)
*  adding documentation
  * Travis Schneberger on Fri, 13 Mar 2015 21:48:55 -0400 [View Commit](../../commit/e63af1d39cecdfbc28e064d7ea6039efcdfcb59c)
* KCSUPPORT-661: adding documentation, fixing bug related to http://bugs.java.com/view_bug.do?bug_id=6476706
  * Travis Schneberger on Fri, 13 Mar 2015 21:09:05 -0400 [View Commit](../../commit/662d50db4abbe64022a44a7ffae43ff6f24fbf6c)
* Fix license in files
  * blackcathacker on Thu, 12 Mar 2015 11:24:03 -0700 [View Commit](../../commit/237357f04bff1866ab6a099c184f19786924a7cd)
* KRACOEUS-8947: fixing data length problems, a serialization issue after submit, no need for oracle script change
  * Travis Schneberger on Thu, 12 Mar 2015 17:34:41 -0400 [View Commit](../../commit/8d4191bf20a98bbac28fb060c3b4903d0831b14d)
* KRACOEUS-8902: fix notification text
  * Gayathri on Thu, 12 Mar 2015 10:54:23 -0700 [View Commit](../../commit/a4484743ea134628ed757d6fc1c64bdddd0fabba)
*  fixing int tests for the grm profile
  * Travis Schneberger on Wed, 11 Mar 2015 21:23:10 -0400 [View Commit](../../commit/db2eea4081080f78157a08669d4a1cccd3224e93)
*  using a set to remove duplicate unit qualifications
  * Travis Schneberger on Wed, 11 Mar 2015 13:58:12 -0400 [View Commit](../../commit/f55da36e837ffdcc39b89760753940b5d8ca9603)
* KRACOEUS-8931: oracle scripts for release 6.0.1
  * Gayathri on Mon, 9 Mar 2015 14:40:01 -0700 [View Commit](../../commit/deb2667c659616e8e11e7481791a287e9f7e36b1)
*  supporting grm sql files
  * Travis Schneberger on Mon, 9 Mar 2015 23:41:30 -0400 [View Commit](../../commit/c15970262dc57fc22f473437ec2b1992ebf5e12f)
* KRACOEUS-8931: fixing mysql file placement
  * Gayathri on Mon, 9 Mar 2015 15:15:44 -0700 [View Commit](../../commit/67d49af07d9490a5b477abf71732d666d983b51f)
*  fixing hr import
  * Travis Schneberger on Mon, 9 Mar 2015 15:33:38 -0400 [View Commit](../../commit/d11559e28810e38dcc86878e07311f74dda7b1a9)
* KRACOEUS-8936:fix unit hierarchy view
  * Joe Williams on Mon, 9 Mar 2015 11:35:15 -0500 [View Commit](../../commit/5763260fdcbdca17f1b3c97dccfea92dafe7ea39)
* KRACOEUS-8786:fix subaward validation
  * Joe Williams on Mon, 9 Mar 2015 09:44:03 -0500 [View Commit](../../commit/597228500c5053ea41146fb9c25c352669e421ea)
* KRACOEUS-8934: grm profiles
* moved grm specific items to a profile (maven and spring)
* fixed several pom issue from code merge
* fixed the ReportAction that is clearly broken
* made all grm internal dependencies runtime scope so we do not have compile time dependencies
* confirmed app builds and starts with the grm profile enabled and disabled with the correct functionality
  * Travis Schneberger on Fri, 6 Mar 2015 13:01:36 -0500 [View Commit](../../commit/af7ae9c108a974a814c1bc5a2741f40255984be9)
* KRACOEUS-8937: avoiding an NPE on orphaned records
  * Travis Schneberger on Fri, 6 Mar 2015 20:20:25 -0500 [View Commit](../../commit/60e96b1d29bb46cabaeb9520c3aae72fe8aea0e4)
* KRACOEUS-8940:fix reject action
  * Joe Williams on Fri, 6 Mar 2015 16:11:20 -0600 [View Commit](../../commit/9716421d803246f6a9ae4cbbadec758d604cae91)
* KRACOEUS_8938:fix some integration tests
  * Joe Williams on Fri, 6 Mar 2015 10:34:09 -0600 [View Commit](../../commit/2ba3289808dafaad309644ab7964e3fd1b9252d9)
* KRACOEUS-8839:Ensure validations don't grab attachments
  * blackcathacker on Thu, 5 Mar 2015 12:10:37 -0700 [View Commit](../../commit/fb4e7689345b38158183c91ac5e6fc8927e1bba1)
* KRACOEUS-8935: adding logging
  * Travis Schneberger on Thu, 5 Mar 2015 11:45:08 -0500 [View Commit](../../commit/cec39f1e9a42f6efe3947994b83a9529a58cddd0)
* KRACOEUS-8748: code review comments
  * Travis Schneberger on Thu, 5 Mar 2015 10:14:50 -0500 [View Commit](../../commit/12fd321b813b96f3d59a29789c4fed23600e9841)
* KRACOEUS-8933: data cleanup, add constraints
  * Travis Schneberger on Thu, 5 Mar 2015 09:59:08 -0500 [View Commit](../../commit/3962401b85a683270189c2c784349ede962289cb)
* KRACOEUS-8928: upgrading wss4j
  * Travis Schneberger on Wed, 4 Mar 2015 16:05:26 -0500 [View Commit](../../commit/f4ca95b06fa49cb90fd0ce9dabaeec6fa41309a2)
* KRACOEUS-8748, KRACOEUS-8930:
* Adding rule to check if a record can be deleted before submit (supports OJB, JPA, and DD relationships)
* Making all KC maintenance docs inherit from KcMaintenanceDocumentEntry (ensures that all maintenance docs use KcMaintenanceDocumentRuleBase if not specified
* Making all Kc Rules extend from KcMaintenanceDocumentRuleBase
* Fixing bootstrap skinning so that GLOBAL_ERRORS are visible
  * Travis Schneberger on Wed, 4 Mar 2015 14:03:04 -0500 [View Commit](../../commit/45168d24cc4a151c04e2e84c44918d48e815c7a8)
* KRACOEUS-8929:resize navigation menu drop downs when window size changes
  * Joe Williams on Wed, 4 Mar 2015 10:23:57 -0600 [View Commit](../../commit/7a4d6bac1635c7d4c009358a7bfee01c781b3414)
* KRACOEUS-8924: hierarchy sync trace fix
  * Gayathri on Wed, 4 Mar 2015 09:23:35 -0700 [View Commit](../../commit/efddcd6130634812811f75975136ad74cad95125)
* KRACOEUS-8912: Add ability to certify enroute proposal
  * Gayathri on Tue, 3 Mar 2015 12:35:29 -0700 [View Commit](../../commit/ba4503daf9afdcc963dc0b414640135a109647b2)
* KRACOEUS-8927:removed broken budget rule
  * Joe Williams on Tue, 3 Mar 2015 13:30:45 -0600 [View Commit](../../commit/f27cd8389153dc3ea47c07d8ba6446d5853887e6)
* KRACOEUS-8740:wrap long medusa text fields
  * Joe Williams on Tue, 3 Mar 2015 12:58:04 -0600 [View Commit](../../commit/2591263e27575bcf0eed36df2a242e0c550fcff4)
* KRACOEUS-8925:save budget on modular sync
  * Joe Williams on Tue, 3 Mar 2015 08:29:45 -0600 [View Commit](../../commit/6647d3a68e113c7c721d494697a8007104480843)
* KRACOEUS-8891:Reduce logging on health checks
  * We are using the health check to make sure elb knows the server is up, but the performance logging log messages showing up every couple of seconds is annoying and expensive.
  * blackcathacker on Mon, 2 Mar 2015 22:39:43 -0700 [View Commit](../../commit/3241887a1167910856445eb7c8497ed253f1f2c9)
* KRACOEUS-8839:Code review changes
  * blackcathacker on Mon, 2 Mar 2015 21:10:30 -0700 [View Commit](../../commit/48644b1636a1f90e03a96ab708a49a164615497e)
* KRACOEUS-8839:Fix up commit related to attachments
  * Rename base class to match up with attachment dao given other different usages for AttachmentDataSource.java
  * Add javadoc and other clean up.
  * blackcathacker on Mon, 2 Mar 2015 18:04:13 -0700 [View Commit](../../commit/942939dcd5c4d986603923b41a09184a572339e6)
* KRACOEUS-8920:added arg value inquiries to questionnaire
  * Joe Williams on Mon, 2 Mar 2015 14:20:54 -0600 [View Commit](../../commit/94307eb585e2032318147bfbed3413437d38c11a)
* KRACOEUS-8839:fix attachment data
  * Joe Williams on Mon, 2 Mar 2015 13:21:19 -0600 [View Commit](../../commit/617054110223f667970ccf22e90a5186b23127ed)
* KRACOEUS-8903:mark budget incomplete from budget versions
  * Joe Williams on Mon, 2 Mar 2015 11:35:11 -0600 [View Commit](../../commit/9cb329e277eed5700e37736df73f66ab3ceed3d8)
* KRACOEUS-8905:generate module periods when chnage budget settings
  * Joe Williams on Mon, 2 Mar 2015 09:56:03 -0600 [View Commit](../../commit/5faa4fda4c723dae30f5614006bb709113e21bb7)
* Revert "KRACOEUS-8803 Fix unauthorized lead unit options"
  * Douglas Pace on Fri, 27 Feb 2015 18:00:16 -0800 [View Commit](../../commit/87d09dd52eccab5e742b742d2b4017b5c541b547)
* KRACOEUS-8868: increasing reqID length
  * Gayathri on Fri, 27 Feb 2015 16:38:09 -0700 [View Commit](../../commit/b67b44adbef02c03923ecf14168095b9f2a56f1e)
* KRACOEUS-8767: Fixing help links
  * Gayathri on Fri, 27 Feb 2015 15:51:20 -0700 [View Commit](../../commit/8ec7e5887978dbcfacf80d85e6d134283364f357)
* KRACOEUS-8176 Save budget to reflect totals in periods and budget
  * Adding a line item and closing window should recalcuate budget and
  * persist line item. We need to persist budget in this scenario since
  * we need to update periods and totals and budget totals.
  * rmancher on Fri, 27 Feb 2015 16:23:15 -0500 [View Commit](../../commit/c5daab6f9d347b1a7da0371e4726794eca2de41b)
* KRACOEUS-8920:added inquiry link to arg value custom data
  * Joe Williams on Fri, 27 Feb 2015 12:15:03 -0600 [View Commit](../../commit/55f79fe4c5ba3b6addabca216d5117cd781b4e8d)
* KRACOEUS-8919: changing field length
  * Travis Schneberger on Fri, 27 Feb 2015 10:25:46 -0500 [View Commit](../../commit/a9abe0e82e3b014d7c93200a905d8039f1081c8d)
* KRACOEUS-8918: adding not found message
  * Travis Schneberger on Fri, 27 Feb 2015 10:18:19 -0500 [View Commit](../../commit/fcc1b86707b791c3ece17c13411b68dc4c89aa3b)
* KRACOEUS-8905:display s2s errors when print invalid xml
  * Joe Williams on Fri, 27 Feb 2015 08:08:31 -0600 [View Commit](../../commit/638e3c932d570f06c7b0dd3ad34b41520af829a2)
* KRACOEUS-8803 Fix unauthorized lead unit options
  * Currently KIM is not checking whether user is associated with the
  * new group. We need a rice fix.
  * This is an interim solution.
  * rmancher on Wed, 25 Feb 2015 14:51:18 -0500 [View Commit](../../commit/dc158b3403c8ccd6e8d366ca9ca4a320f8914b9c)
* KRACOEUS-8390 Add close button to superuser action page
  * rmancher on Thu, 26 Feb 2015 11:28:51 -0500 [View Commit](../../commit/5d072dbc7b87fd9960f67c5c7c51e6c2a0eca394)
* KRACOEUS-8914: changing fixed point number message
  * Travis Schneberger on Thu, 26 Feb 2015 11:14:27 -0500 [View Commit](../../commit/1556750bcc25b76d2921da9ab74b781e32fe4d9c)
* KRACOEUS-8913: swapping field locations
  * Travis Schneberger on Thu, 26 Feb 2015 11:01:29 -0500 [View Commit](../../commit/bee646b0273fa9d4305a8779c45bce1c2929104e)
* KRACOEUS-8909: fixing constraint violation on save
  * Travis Schneberger on Thu, 26 Feb 2015 10:12:46 -0500 [View Commit](../../commit/1a0386df6b515ad6964a609e5fa58a2746c3d589)
* KRACOEUS-8909: fixing role qualifiers for sponsor for quickstart
  * Travis Schneberger on Thu, 26 Feb 2015 09:54:07 -0500 [View Commit](../../commit/0da1feff9db96c9e9e2cccfafb8ca47c242f8a5b)
* KRACOEUS-8909: make sponsor maintenance work without KFS integration
  * Travis Schneberger on Thu, 26 Feb 2015 08:26:31 -0500 [View Commit](../../commit/aa7e7969c3b76b78a0c1f91e18139028512b0320)
* KRACOEUS-8739: Adding missed change
  * Gayathri on Wed, 25 Feb 2015 14:51:58 -0700 [View Commit](../../commit/706f2b6579f3e94b68bf7cc70452833204bf5a6b)
* KRACOEUS-8902: Add notification when changing narratives
  * Gayathri on Wed, 25 Feb 2015 13:56:14 -0700 [View Commit](../../commit/7baf3d22ae28b92e6ea61126944c9dae314616c6)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Wed, 25 Feb 2015 15:35:25 -0500 [View Commit](../../commit/72b396be6de6fb7ef9c881a31f554694d22f7fdb)
* KRACOEUS-8878: code review comments
  * Travis Schneberger on Wed, 25 Feb 2015 14:27:07 -0500 [View Commit](../../commit/17ea473279f11bc95fbd1dc285b4616b8f92c131)
* KRACOEUS-8878: fixing package
  * Travis Schneberger on Wed, 25 Feb 2015 11:13:03 -0500 [View Commit](../../commit/f0f7870f82ebb0359611af92533043663a38564f)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Tue, 24 Feb 2015 09:47:46 -0500 [View Commit](../../commit/3c844db62debb972ea9cd32b1aa944cfc81712d7)
* KRACOEUS-8878: rolling back cgb api changes, fixing external DD files
  * Travis Schneberger on Mon, 23 Feb 2015 13:21:19 -0500 [View Commit](../../commit/61197fd08ace4b6de7dfdffdfc724f6acda648b5)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 16:13:46 -0500 [View Commit](../../commit/53147ca389922676a65bd5982b37f6add5c57de6)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 15:26:35 -0500 [View Commit](../../commit/9b74b87dd1511e6101e11a0e088629809ceebf02)
* KRACOEUS-8903:complete budget from budget versions page
  * Joe Williams on Wed, 25 Feb 2015 09:22:34 -0600 [View Commit](../../commit/2e7a378487226ad17b067829f68116c0426722e2)
* KRACOEUS-8904: adding missing closing tag
  * Travis Schneberger on Wed, 25 Feb 2015 08:40:34 -0500 [View Commit](../../commit/2982988cd70a11dc486396ec50b6c8b0f7bbef28)
* KRACOEUS-8898:Update doc typ to use new PD URL
  * blackcathacker on Tue, 24 Feb 2015 14:27:33 -0800 [View Commit](../../commit/f036776180f5395a6fdfa63b16f1ead007bd41a2)
* KRACOEUS-8874 Incorrect distributable amount when editing amount in award
  * rmancher on Tue, 24 Feb 2015 09:10:27 -0500 [View Commit](../../commit/61a0bb8e31e55885c90265a1ae253e9ad662915b)
* KRACOEUS-8899:fixed client side date validation
  * Joe Williams on Tue, 24 Feb 2015 11:48:22 -0600 [View Commit](../../commit/29e973127d24d62320b428e32e9f476945f7a401)
* KRACOEUS-7438: Fixing PI certification while routing
  * Gayathri on Mon, 23 Feb 2015 14:02:03 -0700 [View Commit](../../commit/686f68da9f24934237b5ec8fa5fb800152aa9bc3)
* KRACOEUS-8887:add confirmation dialog to complete budget
  * Joe Williams on Fri, 20 Feb 2015 14:17:53 -0600 [View Commit](../../commit/ce21ff2c850c80d7fe9ea33e66bad6225d0b1a3a)
* KRACOEUS-8896:fix research strategy s2s error
  * Joe Williams on Tue, 24 Feb 2015 08:32:58 -0600 [View Commit](../../commit/a121f6d39f35b131d789ee8a2434aa5f7ecae777)
* KRACOEUS-8892:Various db issues
  * V600_067__KC_DML_01_KRACOEUS-7014_B000.sql and others failed due to the coeus_module description being modified so the module_code as harded as was done during insert and in other locations in code, additionally they modified the special review type 'Animal Subjects' to 'Live Vertebrate Studies' and again this is a code hard-code in sql and in code so no reason to query for it.
  * V601_017__KRACOEUS-8864.sql failed because of conflicting primary keys so using new procedure to find first unused id
  * V600_046__KC_TBL_AWARD_BUDGET_EXT.sql needed to orphan the records in award_budget_limit as well
  * V600_063__KC_DML_01_KFSMI-11381_B000.sql failed because customer had inserted extra record at 999 which meant the next value was 1000. Instead using new procedure to find first available id
  * V300_002__schema.sql and V300_107__schema.sql were modified because of previously unseen errors with mysql 5.6
  * V600_054__KC_TBL_EPS_PROPOSAL_BUDGET_EXT.sql is another example of orphaned records where the proposal was deleted but the budgets weren't
  * blackcathacker on Mon, 23 Feb 2015 18:00:05 -0800 [View Commit](../../commit/2b15e79bb9bd3fce04684bfc914e4e4c05dfd2a8)
* KRACOEUS-8682: Hiding create proposal button
  * Gayathri on Mon, 23 Feb 2015 16:27:06 -0700 [View Commit](../../commit/6e3a6ae210449cc6b5d796efbb2d079578063a38)
* KRACOEUS-8895:Add CAS as dependency
  * blackcathacker on Mon, 23 Feb 2015 10:49:49 -0800 [View Commit](../../commit/384a628f51858d9b508cda8078da05483f6c4f47)
* KRACOEUS-8894:allow add viewer permission when document is enroute
  * Joe Williams on Mon, 23 Feb 2015 13:04:28 -0600 [View Commit](../../commit/2df23475e2b3871adb8f16d9cca5f7d488d0845d)
* KRACOEUS-8897: removing references to old commons-lang
  * Travis Schneberger on Mon, 23 Feb 2015 13:26:16 -0500 [View Commit](../../commit/b77d55410c839d411ce40541a8bbd5b1b25e70e7)
* KRACOEUS-8739: Fixing lookup sort
  * Gayathri on Mon, 23 Feb 2015 11:26:37 -0700 [View Commit](../../commit/54342126657e501a0d40074b068c510e5192616c)
* KRACOEUS-7451 Add status option for internal attachments
  * Include status option for add attachments and in the list.
  * Also add mark all status option.
  * rmancher on Mon, 23 Feb 2015 10:59:58 -0500 [View Commit](../../commit/7a5fd354b2fc149ea5d82c9eb769729f1f5ee5cf)
* KRACOUES-8890:set budget creator role to only edit budgets
  * Joe Williams on Mon, 23 Feb 2015 09:16:46 -0600 [View Commit](../../commit/cb97f0619570b40f427a42960ce1b3bd1794f916)
* KRACOEUS-8891:Health Check Page
  * Simple health check page that return 200 on success and 417 on failure.
  * Does simple query against the KC and Rice database to confirm they are accessible
  * blackcathacker on Sun, 22 Feb 2015 15:34:14 -0800 [View Commit](../../commit/cf65617ece8b605feba4a9fe92e7bf31d7ef3728)
* KRACOEUS-8888:create unique id and person name for tbn persons
  * Joe Williams on Fri, 20 Feb 2015 14:35:03 -0600 [View Commit](../../commit/f4be0deee195052ccf31b6e34756450d52cfd32a)
* KRACOEUS-8889: fixing PD routing
  * Gayathri on Fri, 20 Feb 2015 11:07:45 -0700 [View Commit](../../commit/aef03439164dcfd8f23cf32b14cfae76fc8c900f)
* KRACOEUS-8886:perform client side validation on navigation back to proposal
  * Joe Williams on Fri, 20 Feb 2015 09:49:55 -0600 [View Commit](../../commit/0d24748200d4bb6934d2f114f51636761724bff8)
* KRACOEUS-7453 Enable unit inquiry
  * Display unit and administrator details
  * rmancher on Fri, 20 Feb 2015 10:36:00 -0500 [View Commit](../../commit/53bd1e178c81b53d714aaa6d7b4b66e1273dfbd8)
* KRACOEUS-8885: Removing notify from child proposals
  * Gayathri on Thu, 19 Feb 2015 18:38:57 -0700 [View Commit](../../commit/660cc615e0a7bf2f0baf41f4d15be0748467342c)
* KRACOEUS-8770: KNS, Proposal and Budget Online help
  * Gayathri on Thu, 19 Feb 2015 17:53:00 -0700 [View Commit](../../commit/60f52092152454f2158ba1055bc9662c5d6a33c1)
* KRACOEUS-8884:fixed non personnel budget rates
  * Joe Williams on Thu, 19 Feb 2015 16:45:09 -0600 [View Commit](../../commit/fbf28001e2295e48c087c0511d8475def3dd41ab)
* KRACOEUS-8883:implement widget input only for questions with lookups
  * Joe Williams on Thu, 19 Feb 2015 15:50:04 -0600 [View Commit](../../commit/79eeb151b269c8a4cb876ccc5135cd95677bd8e0)
* KRACOEUS-8876:fix text area inline edit fieldwidth
  * Joe Williams on Thu, 19 Feb 2015 14:22:20 -0600 [View Commit](../../commit/63c925b8fa4657574ba457212bc164559b02a6f0)
* KRACOEUS-8831:moved div and program code validation to audit errors
  * Joe Williams on Thu, 19 Feb 2015 12:54:42 -0600 [View Commit](../../commit/6a468602f6ee4f8157edcbce35d6312fdcfa0092)
* KRACOEUS-8864:added special review validation
  * Joe Williams on Thu, 19 Feb 2015 10:07:37 -0600 [View Commit](../../commit/ea8a24d2591296408d1d9d5050ca4d649b8e5091)
* KRACOEUS-8809 Refresh budget summary during sync
  * Budget summary is not updated while performing sync operation in parent
  * proposal budget
  * rmancher on Wed, 18 Feb 2015 14:44:38 -0500 [View Commit](../../commit/d3d7d3008b26b67f992ccb5e1269387be80a99e1)
* KRACOEUS-8880: adding validation to s2s opportunity lookup fields
  * Travis Schneberger on Thu, 19 Feb 2015 09:18:44 -0500 [View Commit](../../commit/149877bcab443afce145477c8a223916e14b89a3)
* KRACOEUS-8881:Support for MySQL5.6/MariaDB10
  * This primarily involved making sure to drop the foreign key before modifying a referenced column and limited indexes to 767 bytes.
  * In order to still support Mysql5.5 you also have to make sure that when dropping the foreign keys the names of the contrainsts match exactly.
  * blackcathacker on Wed, 18 Feb 2015 16:21:42 -0800 [View Commit](../../commit/7b9c9681eb223dd81c5697e614c8f6b3880f1ed9)
* KRACOEUS-8873: Removing validation while deleting.
  * Gayathri on Wed, 18 Feb 2015 15:49:58 -0700 [View Commit](../../commit/81dd6283ec6ca5918425ad18b575c194f70be92d)
* KRACOEUS-8802 Subaward refresh on delete and replace
  * Fix to refresh the modal and clear current period details.

  * update review comments
  * rmancher on Tue, 17 Feb 2015 11:25:39 -0500 [View Commit](../../commit/ac92585b9089a377eb91126d843122b629065e27)
* KRACOEUS-8879: adding header text
  * Travis Schneberger on Wed, 18 Feb 2015 13:38:52 -0500 [View Commit](../../commit/f444865410b1b61e2b9d18f4eb85a2e9e2f2f11e)
* KRACOEUS-8873: Delivery info changes
  * Gayathri on Wed, 18 Feb 2015 08:46:30 -0700 [View Commit](../../commit/10d0b073f7cc16f70861064ae77df9c3188a2908)
* KRACOEUS-8856: fix grammar
  * Travis Schneberger on Wed, 18 Feb 2015 11:26:23 -0500 [View Commit](../../commit/e20cc1e98f1cb6c2b8fb96e43969b4d073fd28d3)
* KRACOEUS-8875: resequence sql file
  * Travis Schneberger on Wed, 18 Feb 2015 09:05:12 -0500 [View Commit](../../commit/96d2509bd4b56038cd2f5a96564564aa6af91eb4)
* KRACOEUS-8871:implement budget progressive navigation
  * Joe Williams on Tue, 17 Feb 2015 16:53:05 -0600 [View Commit](../../commit/6c16496c904410f221b4ea171df6e770ad99feb4)
* KRACOEUS-8854 : Fix issue with bad data so script can apply
  * blackcathacker on Sun, 15 Feb 2015 14:15:05 -0800 [View Commit](../../commit/0a1da018c96c302f26a5482783bef36c7582953c)
* KRACOEUS-8855:Make PD KEW doc standalone and repackage KEW related class
  * The PD KEW File that was being used by CX was apparently dependent on the previous foundation KEW file being ingested. I have copied relevant elements from it such that this file can be ingested into an empty database.
  * blackcathacker on Tue, 17 Feb 2015 16:09:27 -0800 [View Commit](../../commit/a9aa1c154a1c26ddefd29c47a5656dde06922025)
* KRACOEUS-8872: Adding warning while deleting attachments.
  * Gayathri on Tue, 17 Feb 2015 16:53:32 -0700 [View Commit](../../commit/a7f4624e65a97dd5b49d0a7a119a48b8eee02271)
* KRACOEUS-8870: Set demo cost elements to be active
  * At some point during the 4.0 release cost elements where changed from using 'N' to indicate active to 'Y' being active. Due to the oddities with the old sql scripts the bootstrap script that did this now runs before the demo data that inserts these records. This enables all the demo cost elements.
  * blackcathacker on Tue, 17 Feb 2015 15:25:31 -0800 [View Commit](../../commit/11d1407549ed2fd3e7735abf79e2b5b388214e3d)
* KRACOEUS-7443: Fix notification email address
  * Gayathri on Tue, 17 Feb 2015 15:58:48 -0700 [View Commit](../../commit/63cebfa4ef6ca0a67405ed3c18b6b2cb4fee12dd)
* Workaround OJB bug that causes wrong class to be cached
  * Whenever the Budget.class is cached instead of AwardBudgetExt
  * OJB will only return Budget.class for that ID.

  * Fixes rSmart/issues#510
  * blackcathacker on Tue, 17 Feb 2015 13:54:03 -0800 [View Commit](../../commit/c31c842be236e5dbed45dacc6c5408a1e050b677)
* Notification renderer unused
  * Related to investigating rsmart/issues#307 it was noticed this renderer is never referenced or used
  * blackcathacker on Tue, 17 Feb 2015 13:48:24 -0800 [View Commit](../../commit/fcdc0adeae27563e075fdf55fdd78e2ac951959b)
* Set default.htm as an index file so help works when null
  * Even when the help url is null, in the case of a missing help parameter
  * the help index will still show up. Partial fix for rSmart/issues#512
  * blackcathacker on Tue, 17 Feb 2015 13:42:49 -0800 [View Commit](../../commit/132c215f0efdd2067276490813dfb253717e26b6)
* KRACOEUS-8869: prevent PD from opening in iframe
  * Travis Schneberger on Tue, 17 Feb 2015 15:39:37 -0500 [View Commit](../../commit/15c7cd7f1726c4437aa75995901341dd0b9df4aa)
* KRACOEUS-8866: increasing column length
  * Travis Schneberger on Tue, 17 Feb 2015 15:14:17 -0500 [View Commit](../../commit/79f2da88961cf53f8ca2bc752fd13268109471df)
* KRACOEUS-8846: Question edit fix
  * Gayathri on Tue, 17 Feb 2015 12:58:00 -0700 [View Commit](../../commit/bba344a7045ca0a06422db7c0ec42aff0bf728f6)
* SO-138 : Make questionnaire certifcation generic
  * blackcathacker on Tue, 17 Feb 2015 10:46:55 -0800 [View Commit](../../commit/6fcfdb0c9c3e8cbda759d8df9c9f96f59a1fb240)
* KRACOEUS-8805
  * Budget Settings labels disappear when marked complete
  * rmancher on Tue, 17 Feb 2015 13:43:58 -0500 [View Commit](../../commit/663e502ce022593513764921673b4e9b70c3b6f1)
* KRACOEUS-8860: making old portal and new portal use the same help link properties
  * Travis Schneberger on Tue, 17 Feb 2015 12:55:35 -0500 [View Commit](../../commit/68b57ec73e2bc0cdc0bda6d6bc2cbc4d28bd7c45)
* KRACOEUS-8845: Adding ScaleTwo and ScaleThree decimal support.
  * Gayathri on Mon, 16 Feb 2015 16:32:28 -0700 [View Commit](../../commit/6b6a0ca6a1c5f3b3257c343b98d05b3aac4ac132)
* ISO-135
  * Gayathri on Tue, 17 Feb 2015 10:28:50 -0700 [View Commit](../../commit/ab01366fed35124d11f2855281cb4163c7abfe0f)
* KRACOEUS-8865: adding budget version
  * Travis Schneberger on Tue, 17 Feb 2015 11:23:28 -0500 [View Commit](../../commit/6b438adb9fbb047f56d9cee26fd8f3e744563c5f)
* KRACOEUS-8863: changing button text
  * Travis Schneberger on Tue, 17 Feb 2015 10:58:06 -0500 [View Commit](../../commit/936a6420f2d83d23776453c94c8168dea91111f9)
* KRACOEUS-8862:fix send personnel cert notification buttons to always display, and save personnel when they are sent
  * Joe Williams on Tue, 17 Feb 2015 09:45:48 -0600 [View Commit](../../commit/25f8a157f93808346418bddb07737e2dfc485f32)
* KRACOEUS-8861:fix progressive navigation to supplement info
  * Joe Williams on Tue, 17 Feb 2015 09:14:48 -0600 [View Commit](../../commit/74caa9abc9edee5e8ab403ca8399cd1d43d79b48)
* KRACOEUS-8860: changing help link
  * Travis Schneberger on Tue, 17 Feb 2015 08:55:19 -0500 [View Commit](../../commit/b640c0324f4985d878baa13126380bb87662289b)
* KRACOEUS-8855 : Code review changes
  * blackcathacker on Mon, 16 Feb 2015 14:38:04 -0800 [View Commit](../../commit/123feac228fe2d12a2935c364f68d79cb150940a)
* KRACOEUS-8745:added client side file size validation
  * Joe Williams on Mon, 16 Feb 2015 09:26:01 -0600 [View Commit](../../commit/5c22bfd5faa016d1ea0483d0372726f47b71b1a9)
* KRACOEUS-8806:disabled subaward view xml if attached file does not contain xml data
  * Joe Williams on Mon, 16 Feb 2015 16:03:35 -0600 [View Commit](../../commit/09e32237e30db33f08c3bd508ad62b5a6212dec5)
* KRACOEUS-8857:fix styling of add button on subaward page to not display in header of the table
  * Joe Williams on Mon, 16 Feb 2015 15:36:01 -0600 [View Commit](../../commit/4e3ef2d9fa4861773a7242fda85cdb2b879da73a)
* KRACOEUS-8856: changing message
  * Travis Schneberger on Mon, 16 Feb 2015 16:15:18 -0500 [View Commit](../../commit/50c26e5a2ab6cc530ca6e579ab0bea6fdffdc1d2)
* KRACOEUS-8840: convert budget periods page to inline editing
  * Joe Williams on Thu, 12 Feb 2015 12:24:35 -0600 [View Commit](../../commit/b84a140d68912968e662843003756473bc019155)
* KRACOEUS-8851:run budget save event when save method is called, fixed issue with non-employee code not being set on new budget person
  * Joe Williams on Mon, 16 Feb 2015 08:33:09 -0600 [View Commit](../../commit/25e170c6cbe957acbaf0dd7f52977c5793b88221)
* KRACOEUS-8855 : Use more realistic workflow for PD
  * blackcathacker on Mon, 16 Feb 2015 11:54:22 -0800 [View Commit](../../commit/e55925955e02a902144bf9df928035580566c092)
* KRACOEUS-8824 : Fix duplicate version
  * blackcathacker on Mon, 16 Feb 2015 11:27:01 -0800 [View Commit](../../commit/38f1bf82c7e17a2936d2ca48ea8130c99e9329c1)
* KRACOEUS-8824 : Fix duplicate current KualiDocument
  * blackcathacker on Mon, 16 Feb 2015 11:05:42 -0800 [View Commit](../../commit/89ab12b325629b7addfd253ca0a942468abdddea)
* KRACOEUS-8454: Adding SQL
  * Gayathri on Mon, 16 Feb 2015 09:37:08 -0700 [View Commit](../../commit/219679a04a8c9737829af689b6fe8171cf5daae5)
* KRACOEUS-8454: fix notifications
  * Gayathri on Mon, 16 Feb 2015 08:07:34 -0700 [View Commit](../../commit/614a66ac13d2ec6044bbd021c0f7c6090e7f735a)
* KRACOEUS-8837: fixing parameter text
  * Travis Schneberger on Mon, 16 Feb 2015 09:43:43 -0500 [View Commit](../../commit/73abe72776a9a8645c7c33098512d58eb2a44be9)
* KRACOEUS-8853: moving data conversion program into kc as a submodule
  * Travis Schneberger on Sat, 14 Feb 2015 11:57:29 -0500 [View Commit](../../commit/3fa7244db48400216cd97424d0c22f55b93b854c)
* KRACOEUS-8850: Fix cong districts while copying
  * Gayathri on Fri, 13 Feb 2015 15:25:08 -0700 [View Commit](../../commit/f4998a888d44264cbc84f40d9fbe3e6df3a86b50)
* KRACOEUS-8830: code review comments
  * Travis Schneberger on Fri, 13 Feb 2015 17:16:23 -0500 [View Commit](../../commit/8826a37317b722de934484bef01b01d629447493)
* KRACOEUS-8830: moving sql scripts
  * Travis Schneberger on Fri, 13 Feb 2015 10:48:50 -0500 [View Commit](../../commit/e98c9278716bbd83409af7be09486f27180f52f5)
* KRACOEUS-8830: cleanup, move out grm specific files, setting migration path
  * Travis Schneberger on Fri, 13 Feb 2015 10:43:38 -0500 [View Commit](../../commit/2676d331048081acb13d25fcc6a6cc71a88b2ff1)
* KRACOEUS-8830: removing old files
  * Travis Schneberger on Wed, 11 Feb 2015 10:07:10 -0500 [View Commit](../../commit/1f798e481a3f74e753cf83205617072d5d8308bc)
* KRACOEUS-8849:perform client side validation on budget navigation
  * Joe Williams on Fri, 13 Feb 2015 15:24:18 -0600 [View Commit](../../commit/429cb74decfcc83a22df67fee3bec93d76990a1a)
* KRACOEUS-8847:add validation to check for multiple units on the same key person
  * Joe Williams on Fri, 13 Feb 2015 15:00:14 -0600 [View Commit](../../commit/d89cdfe65f8f701351ce1c51c2fd4f9fe30fd90e)
* KRACOEUS-8841:update criteria input field to retreive force upper case from dd attribute defintion
  * Joe Williams on Fri, 13 Feb 2015 11:55:17 -0600 [View Commit](../../commit/8522588893434bce41bf552480a072e7e93e05c0)
* KRACOEUS-8828:hide s2s opportunity if non-federal sponsor is selected
  * Joe Williams on Tue, 10 Feb 2015 16:15:19 -0600 [View Commit](../../commit/7e3ed1bb2c684f6b126715fa211ed0d828fdd865)
* KRACOEUS-8844: Fixing reject action
  * Gayathri on Thu, 12 Feb 2015 17:53:33 -0700 [View Commit](../../commit/6a6c89efcdb38b7e57c518827e73a7d1657dacf4)
* KRACOEUS-8824 : Auto ingestion changes
  * blackcathacker on Thu, 12 Feb 2015 16:26:04 -0700 [View Commit](../../commit/9b8536d3c2e02b2880b3a0bc8224e98b833bf2b3)
* KRACOEUS-8815: Fix authorizer
  * Gayathri on Thu, 12 Feb 2015 17:47:41 -0700 [View Commit](../../commit/2639d2171382f75d2060053d394fff39288377c4)
* KRACOEUS-8842
  * Fix issue - Missing parts of screen on report COI in New projects to disclose
  * rmancher on Thu, 12 Feb 2015 14:47:30 -0500 [View Commit](../../commit/aa9ac53acc3a7d66d24ced90b729c8972b640251)
* KRACOEUS-8301
  * Required fields in custom data is preventing from navigating away from
supplemental information page.
  * rmancher on Thu, 5 Feb 2015 16:24:05 -0500 [View Commit](../../commit/aa036ad77118a40b1877a3447f2b885e1a55acd3)
* KRACOEUS-8841: fixing jobCode force uppercase
  * Travis Schneberger on Thu, 12 Feb 2015 11:49:04 -0500 [View Commit](../../commit/7e9fa3528b1261756fa3a8c5bb48aa236642214b)
* KRACOEUS-8819: Fixing STE
  * Gayathri on Tue, 10 Feb 2015 13:20:06 -0700 [View Commit](../../commit/fdadea0ffd7af550bbfd1221b6f5055d2d6ed204)
* KRACOEUS-8826: fixing DD file descriptions
  * Travis Schneberger on Thu, 12 Feb 2015 10:14:18 -0500 [View Commit](../../commit/c6a1c21b8183d08d5d8d3d12d9ddfafc26de1639)
* KRACOEUS-8761
  * Custom data fields erased when editing Institutional Proposals or Awards
  * rmancher on Thu, 12 Feb 2015 09:48:29 -0500 [View Commit](../../commit/ae7a2246eced3a00815f2e38154ce1cd148e1547)
* KRACOEUS-8838: adding missing dd file
  * Travis Schneberger on Thu, 12 Feb 2015 08:54:53 -0500 [View Commit](../../commit/f689f4758b3c211c327a43482e2f123a08cc1ce0)
* KRACOEUS-8835: fix cancel button
  * Travis Schneberger on Thu, 12 Feb 2015 07:46:31 -0500 [View Commit](../../commit/7702d508133ab412950a13e6414d8be4edc558bb)
* KRACOEUS-8832: Linking back
  * Gayathri on Wed, 11 Feb 2015 15:47:33 -0700 [View Commit](../../commit/4145aea9cf3d52b03e0955d40a3085a44a205dd3)
* KRACOEUS-8835: handling delete line from the wizard
  * Travis Schneberger on Wed, 11 Feb 2015 17:35:06 -0500 [View Commit](../../commit/74ec4ecf082dc5e5637b70380431765c2f3608e2)
* KRACOEUS-8798: Recall fix
  * Gayathri on Wed, 11 Feb 2015 15:19:56 -0700 [View Commit](../../commit/2bad6c9d84fd9ac02f5b5a6eabff5ab0532319df)
* KRACOEUS-8782:changed access screen add button dynamic to be similiar to key personnel
  * Joe Williams on Wed, 11 Feb 2015 15:21:38 -0600 [View Commit](../../commit/40de74403b250cfeea3961a3200ea63b4cafc17c)
* KRACOEUS-8833: keyword display fix
  * Gayathri on Wed, 11 Feb 2015 12:43:07 -0700 [View Commit](../../commit/aa6ece39878187077e5edbe5297e174e1796e2cb)
* KRACOEUS-8286
  * Fix to add new period to person salary details when dates change in proposal
  * and default periods are triggered.
  * rmancher on Thu, 5 Feb 2015 11:44:27 -0500 [View Commit](../../commit/9ca70b8dde6e804372c3c4c022a3829ba35414c0)
* KRACOEUS-7942
  * Reset compliance modal.
  * rmancher on Tue, 10 Feb 2015 14:34:37 -0500 [View Commit](../../commit/d4b76c1d8d1998020e9f2e4d039bfbaff6c2576e)
* KRACOEUS-6639:code changes for proposal person effort
  * Joe Williams on Thu, 5 Feb 2015 16:48:56 -0600 [View Commit](../../commit/6358143733c126062353a6a5264d27d110878a66)
* KRACOEUS-8829: making krad award lookup use custom lookupable
  * Travis Schneberger on Tue, 10 Feb 2015 18:55:39 -0500 [View Commit](../../commit/6e0b0a1888b1f3914a366d6a625ab5090ac4f716)
* KRACOEUS-8827: returning title
  * Travis Schneberger on Tue, 10 Feb 2015 12:56:00 -0500 [View Commit](../../commit/bb5277eb281bedefeef9c4905a7c6058863036ad)
* Revert "KRACOEUS-8814: adding billing frequency, fixing dd config"
  * Travis Schneeberger on Mon, 9 Feb 2015 18:32:53 -0500 [View Commit](../../commit/4093692a6ac9a92993d0c4a30501a15a813ad05d)
* KRACOEUS-8814: deleting sql scripts
  * Travis Schneberger on Mon, 9 Feb 2015 18:30:42 -0500 [View Commit](../../commit/7c762e65956086c235b1c73c7ef8a5146f1fcc2f)
* KRACOEUS-8814: adding billing frequency, fixing dd config
  * Travis Schneberger on Mon, 9 Feb 2015 10:32:20 -0500 [View Commit](../../commit/d350ec53a6d05d3474e74d7685beaeac65927003)
* KRACOEUS-8801:add remove from submission to deselect final budget
  * Joe Williams on Mon, 9 Feb 2015 11:36:16 -0600 [View Commit](../../commit/286f70da31a3598cebb4eb11274ad3ed5abe9daf)
* KRACOEUS-8817:added create xml to s2s forms page
  * Joe Williams on Mon, 9 Feb 2015 10:41:51 -0600 [View Commit](../../commit/3f10a750c67b1c5f29e9169278db559a8556963f)
* KRACOEUS-8820 : Make flyway process configurable
  * blackcathacker on Sat, 7 Feb 2015 23:28:38 -0800 [View Commit](../../commit/b5b6ff7812634ea4d0b94db36c8702ab21c48489)
* KRACOEUS-8730: Fix copy in view mode
  * Gayathri on Fri, 6 Feb 2015 13:42:07 -0700 [View Commit](../../commit/d49ea5bb0f1d2181dbf6519072ded55bf8b91422)
* KRACOEUS-8810:fixed error with non compliance entries not having special review numbers
  * Joe Williams on Fri, 6 Feb 2015 14:38:55 -0600 [View Commit](../../commit/a8a949f31b7212ded0c7d33f1853c0a67305b77b)
* KRACOEUS-8811: Copy parent changes
  * Gayathri on Fri, 6 Feb 2015 12:27:29 -0700 [View Commit](../../commit/0300c0dda1b7f3cc50c9df39026faaae46f3a96c)
* KRACOEUS-8661-fixing personnel sync
  * Gayathri on Fri, 6 Feb 2015 11:45:28 -0700 [View Commit](../../commit/11edfe1104b5ae21b5fe981a6320b08cf61e16bd)
* KRACOEUS-8176
  * Save new line items - budget personnel and non-personnel costs
  * rmancher on Fri, 6 Feb 2015 12:51:31 -0500 [View Commit](../../commit/365819f4f7436bf011a65499d28d4cd192e08275)
* KRACOEUS-8812:fixed sub award validation error
  * Joe Williams on Fri, 6 Feb 2015 11:17:58 -0600 [View Commit](../../commit/ab0d4124e54a7a3bbdbf177a00074f9ef0b0cc34)
* KRACOEUS-8813: fixing wilcard search
  * Travis Schneberger on Fri, 6 Feb 2015 11:40:54 -0500 [View Commit](../../commit/b3079ac2b27ef71777bfdaf8acb217a7d594393b)
* KRACOEUS-8796:fix attachment errors preventing canEdit from being evaluated
  * Joe Williams on Fri, 6 Feb 2015 10:12:40 -0600 [View Commit](../../commit/9a2919bd1ad560f40101b3fcb39e0e6fb53df466)
* KRACOEUS-8777:add missing hierarchybudgetsummary xml
  * Joe Williams on Fri, 6 Feb 2015 09:38:30 -0600 [View Commit](../../commit/ddeef4767f90d78823d609060d60cf0a702ec028)
* KRACOEUS-8782:updated access collection to add with dialog, fixed check that roles have changed
  * Joe Williams on Fri, 6 Feb 2015 08:57:47 -0600 [View Commit](../../commit/77b7a237415ac133a3f3c978ea9ec4dabb173de2)
* KRACOEUS-8799 : Style footer for KualiCo
  * blackcathacker on Thu, 5 Feb 2015 17:34:49 -0800 [View Commit](../../commit/3e137f8236e46611612fda0465f6d9cdb01e9e46)
* KRACOEUS-8777:added hierarchy summary to budget module
  * Joe Williams on Thu, 5 Feb 2015 16:59:13 -0600 [View Commit](../../commit/6a7c972a649924e6f2fe54ef094e20b6e890294d)
* KRACOUES-8792:fixed first period budget copy
  * Joe Williams on Thu, 5 Feb 2015 16:51:34 -0600 [View Commit](../../commit/c84f24c626a0f3bcffddfcdc875a246b03d352eb)
* KRACOEUS-7992: adding copy message
  * Gayathri on Thu, 5 Feb 2015 15:01:35 -0700 [View Commit](../../commit/866c1b1e16b1e7d79cbdc3c3ca7109b56e58081f)
* KRACOEUS-8791: Adding copy info to header
  * Gayathri on Thu, 5 Feb 2015 12:12:39 -0700 [View Commit](../../commit/681017e8fd4adf29bef691f17c85b2d5f36a6321)
* CX Merge Code Review Comment Changes
  * blackcathacker on Wed, 4 Feb 2015 11:41:45 -0800 [View Commit](../../commit/0024f17123dd4eb3b7f98e79e20dd63adcfb3f15)
* Repackage com.rsmart
  * blackcathacker on Tue, 3 Feb 2015 17:54:57 -0800 [View Commit](../../commit/6500799ded24611653a7f43ca29d99af41b2fa38)
* Fixes several styling issues:
* Logo is now the KualiCo logo
* Login page not table based anymore, styled correctly (although still hacked)
* Dropdown menus now look correct on large screens as well as small
* Colors on the proposal screens are now longer red.
  * Brandon Nicholls on Tue, 27 Jan 2015 21:40:08 -0700 [View Commit](../../commit/6f5d666b4dc4a472d17c2ad73754ab2138fc9e6a)
* Rewrite login page to assist styling
  * blackcathacker on Thu, 22 Jan 2015 17:18:05 -0800 [View Commit](../../commit/db15cc386c8fdf6fea3b6301357be22d4b5398fd)
* Updates to flyway db conversion
  * blackcathacker on Tue, 3 Feb 2015 12:41:43 -0800 [View Commit](../../commit/03b556e3509b8c5a2c906410fcc17e2492ea0bfd)
* Updates to sites styles to match cx-qa
  * Brandon Nicholls on Wed, 21 Jan 2015 11:50:32 -0700 [View Commit](../../commit/70c9a2749eed3c541f5659b271b6ce01bf5d3e6a)
* Standardizing version
  * blackcathacker on Tue, 13 Jan 2015 19:57:12 -0800 [View Commit](../../commit/6105b56370890029df004a4ac62aa114f1322d19)
* CX Skinning Changes from 5.2.1

  * cx_patches/src/main/java/com/rsmart/kuali/kra/web/jstl/PortalFunctions.java.patch

  * cx_patches/src/main/resources/META-INF/kc-config-defaults.xml.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap-skinned.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/*

  * cx_patches/src/main/webapp/css/images/bl-bevel-focus.gif.patch

  * cx_patches/src/main/webapp/css/rsmart.css.patch

  * cx_patches/src/main/webapp/rice-portal/scripts/easyXDM/resize_intermediate.html.patch

  * cx_patches/src/main/webapp/scripts/bootstrap/bootstrap.js.patch

  * cx_patches/src/main/webapp/sponsorHierarchyMaint.jsp.patch

  * cx_patches/src/main/webapp/static/images/checkbox.gif.patch

  * cx_patches/src/main/webapp/static/images/checked.gif.patch

  * cx_patches/src/main/webapp/unitHierarchy.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/award/awardHierarchyAwardActionsAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditList.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditNew.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityView.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/ViewNotification.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/iacuc/IacucResearchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/irb/researchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/multicampus_dummy_login.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentKeyPersonnel.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentProposal.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/timeandmoney/awardHierarchyTimeAndMoneyAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/budget/budgetVersions.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/coi/approveAction.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/iacuc/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/infopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/irb/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/medusa/medusaNegotiationSummary.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/questionnaire/qnInfopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherAwards.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherCompliance.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherPersonnel.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherReportLinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/unitQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalResearcherBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalTabs.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tlds/portal-func.tld.patch

switch back to more genric version of CX skin

  * replace rsmart logos with kualico
  * Lance Speelmon on Mon, 1 Dec 2014 14:03:22 -0700 [View Commit](../../commit/2cb2af80492a7d8488be14f8bcc05b80e9fd73d8)
* CX Reporting Framework

  * cx_patches/src/main/webapp/WEB-INF/struts-config.xml.patch

  * cx_patches/src/main/webapp/WEB-INF/web.xml.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/action/ReportForwardAction.java.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/form/ReportFormwardForm.java.patch
  * Lance Speelmon on Mon, 8 Dec 2014 16:46:02 -0700 [View Commit](../../commit/af713a3c60c7b2ab3c738854ddcd08d1ad16f000)
* CX Version Changes -- Primarily Bug Fixes

  * g diff -w kc-release-5_2_1-tag..rsmart-5.2.1 --stat=999 >! git_diff_kc-release-5_2_1-tag..rsmart-5.2.1_stat.txt

  * Removed all files we do not want to consider for merge

  * normalize changed files we want to merge

  * Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * map relocated path for files that could not be automatically matched

  * Added missing patches from: Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * removed trailing space from patch file

  * basic patch rewriting script ready

squashed some path rewriting logic bugs; smoke testing LGTM

  * ./rewrite_patches.rb

  * add CX_PORTING.md

  * Manually merged `cb38ce9` KualiCo pom.xml changes.

  * Conflicts:
	pom.xml

  * updated CX_PORTING for cx_patches/pom.xml.patch

  * applied cx_patches/src/main/config/kew/xml/2/AwardDocument.xml.patch

  * cx_patches/src/main/config/sql/current/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTD_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/0.0.0/dml/KR_DML_01_KCINFR-1018_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/tables/KC_TBL_CONTACT_USAGE.sql.patch
  * Fixes: Caused by: java.sql.SQLException: Can't create table `coeus`.`#sql-c8e0_78` (errno: 150 "Foreign key constraint is incorrectly formed")
  * Caused by: com.googlecode.flyway.core.command.FlywaySqlScriptException: Error executing statement at line 3: ALTER TABLE CONTACT_USAGE

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/contacts/AwardSponsorContactAuditRule.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/document/authorization/AwardDocumentAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/Award.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/AwardAmountInfo.java.patch
  * Default all award amount info amounts to zero when null.
  * Fixes rSmart/issues#503

  * cx_patches/src/main/java/org/kuali/kra/award/lookup/AwardLookupableHelperServiceImpl.java.patch
  * Ignore missing person/entity for https://github.com/rSmart/issues/issues/179

  * cx_patches/src/main/java/org/kuali/kra/award/printing/xmlstream/AwardBaseStream.java.patch
  * Make rolodex country code optional for Award printing.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.

  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardHomeAction.java.patch
  * CCU STE on Document #9532
  * java.lang.NullPointerException
        at org.kuali.kra.award.web.struts.action.AwardHomeAction.save(AwardHomeAction.java:240)
  * https://github.com/rSmart/issues/issues/468

  * Adding null checks to fix NPE.

  * fixes rSmart/issues#270

  * cx_patches/src/main/java/org/kuali/kra/bo/KcPerson.java.patch
  * Return a new empty KcPerson from fromEntityAndPersonId when entity is null.

  * cx_patches/src/main/java/org/kuali/kra/bo/Rolodex.java.patch

  * Commit: edf06332fe7d3cb3940e9353434523fab5d25033
  * Date:   2014-06-30 11:43:17 -0700 (5 months ago)

  * Patching fix from changeset 19864. This patch adds back the isSponsorAddress property to Rolodex. When isSponsorAddress is
  * "N", the behavior changes so the Rolodex reflects the Organization address. For this, organizations had to be added to
  * Rolodex. The maintainable also needed to be modified to recognize isSponsorAddress functionality.

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/bo/UnitAdministrator.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetBaseStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetCumilativeXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetSummaryXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/IndustrialBudgetXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/web/struts/action/BudgetAction.java.patch
  * java.lang.NullPointerException
        at org.kuali.kra.budget.web.struts.action.BudgetAction.execute(BudgetAction.java:189)
  * https://github.com/rSmart/issues/issues/417

  * cx_patches/src/main/java/org/kuali/kra/coi/disclosure/CoiDisclosureServiceImpl.java.patch
  * Ignore missing person/entity from org.kuali.kra.protocol.ProtocolActionBase.permissions(ProtocolActionBase.java:123)

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/CoiNotificationRoleQualifierServiceImpl.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.CoiNotificationRoleQualifierServiceImpl.getRoleQualifierValue(CoiNotificationRoleQualifierServiceImpl.java:47)
    at org.kuali.kra.common.notification.NotificationContextBase.populateRoleQualifiers(NotificationContextBase.java:85)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRoleRecipients(KcNotificationServiceImpl.java:434)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getNotificationRecipients(KcNotificationServiceImpl.java:352)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.fillinNotificationObject(KcNotificationServiceImpl.java:623)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:638)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/FinancialEntityNotificationRenderer.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.FinancialEntityNotificationRenderer.getDefaultReplacementParameters(FinancialEntityNotificationRenderer.java:56)
  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/service/impl/CoiMessagesServiceImpl.java.patch
  * When setting ANNUAL_DISCLOSURE_RENEWAL_DATE system parameter, the year is not parsed correctly.
  * https://github.com/rSmart/issues/issues/470

  * Fixes java.lang.NullPointerException in CoiMessagesServiceImpl

  * java.sql.Timestamp.compareTo(Timestamp.java:477)
  * java.sql.Timestamp.before(Timestamp.java:447)
  * org.kuali.kra.coi.service.impl.CoiMessagesServiceImpl.getMessages(CoiMessagesServiceImpl.java:75)

  * Fixes https://github.com/rSmart/issues/issues/240

  * cx_patches/src/main/java/org/kuali/kra/committee/lookup/CommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/bo/CommitteeBase.java.patch
  * java.lang.NullPointerException
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:356)
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:38)
  * Fixes https://github.com/rSmart/issues/issues/335

  * cx_patches/src/main/java/org/kuali/kra/common/committee/lookup/CommitteeLookupableHelperServiceImplBase.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/CommitteeScheduleAttachmentsBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionBase.java.patch
  * NPE When Accessing Meeting Actions Tab on IRB Schedule
  * https://github.com/rSmart/issues/issues/449

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionsActionBase.java.patch
  * java.lang.ArrayIndexOutOfBoundsException: Array index out of range: 0 at java.util.Vector.get(Vector.java:744)
  * at org.kuali.kra.common.committee.meeting.MeetingActionsActionBase.viewAgenda(MeetingActionsActionBase.java:205)
  * Fixes https://github.com/rSmart/issues/issues/307

  * cx_patches/src/main/java/org/kuali/kra/common/committee/notification/AgendaCreatedNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/notification/service/impl/KcNotificationServiceImpl.java.patch
  * Fixes https://github.com/rSmart/issues/issues/377

  * org.kuali.rice.core.api.exception.RiceIllegalArgumentException: principalName was blank
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.incomingParamCheck(IdentityServiceImpl.java:1566)
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.getEntityByPrincipalName(IdentityServiceImpl.java:125)
  * ...
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRecipientEmailAddresses(KcNotificationServiceImpl.java:542)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendEmailNotification(KcNotificationServiceImpl.java:524)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotification(KcNotificationServiceImpl.java:184)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:630)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Workaround https://github.com/rSmart/issues/issues/158 ; added try/catch to be more forgiving.

  * cx_patches/src/main/java/org/kuali/kra/iacuc/actions/IacucProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/iacuc/committee/lookup/IacucCommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/iacuc/protocol/IacucProtocolProtocolAction.java.patch
  * Adding fixes specific to IACUC

  * fixes rSmart/issues#299

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalPerson.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalProjectPersonnelBean.java.patch
  * UMC - NPE when editing a new Institutional Proposal.
  * https://github.com/rSmart/issues/issues/492

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/ProposalLogMergeAction.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/service/impl/ProposalLogServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalLookupableHelperServiceImpl.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * STE when PD "Submit to Sponsor"
  * java.lang.NullPointerException
  * at org.kuali.kra.institutionalproposal.service.impl.InstitutionalProposalServiceImpl.doBudgetDataFeed(InstitutionalProposalServiceImpl.java:539)
  * Prop Dev submitted. (PD 104)
  * approvals bypassed.
  * try to submit to sponsor as admin.
  * get the following STE.
  * this has happened more than once, but not every time.
  * http://jira.s2.rsmart.com:8080/browse/SO-32

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/IrbProtocolActionRequestServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/notification/ProtocolWithdrawnNotificationRenderer.java.patch
  * Adding new notification renderer to handle reason and action date types. I tried adding unit tests for this, but they're not working. I'll have to commit those at a later date once I get them to work.

  * fixes rsmart/issues#414

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/ProtocolProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/protocol/ProtocolProtocolAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/negotiations/notifications/NegotiationNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/NarrativeReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/PersonnelAttachmentReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/notification/ProposalDevelopmentNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/rules/ProposalDevelopmentDocumentRule.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/service/impl/ProposalCopyServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/web/struts/form/ProposalDevelopmentForm.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/actions/ActionHelperBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/notification/ProtocolReplacementParameters.java.patch

  * cx_patches/src/main/java/org/kuali/kra/questionnaire/answer/QuestionnaireAnswerServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/s2s/service/impl/S2SUtilServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/service/impl/KraAuthorizationServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/service/impl/SubAwardPrintingServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/xmlstream/SubAwardFDPPrintXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/timeandmoney/transactions/TransactionRuleImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/filter/PerformanceLoggingFilter.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/struts/action/KraTransactionalDocumentActionBase.java.patch

  * cx_patches/src/main/resources/ApplicationResources.properties.patch

  * cx_patches/src/main/resources/org/kuali/kra/CoreSpringBeans.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Award.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/AwardPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Budget.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportDetails.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptDefaultParms.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptTypeDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/DevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/RolodexMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/SponsorMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/IacucProtocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposalPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/LookupableDevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Negotiation.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationActivity.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationUnassociatedDetail.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/ProposalDevelopmentDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Protocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Rolodex.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Sponsor.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SponsorSpecial.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAward.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCopyRightsType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCostType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardFundingSource.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/AwardNotice.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/BudgetSummaryTotalPage.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Modification_Template.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Template_Agreement.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/RiceOverridesSpringBeans.xml.patch

  * cx_patches/src/main/resources/repository.xml.patch

  * begin phase 2 of CX merges

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch pass 2

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * updated CX_PORTING for files that cannot be found in pass 2

  * updated CX_PORTING after pass 2 TODO inspection

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/notification/impl/service/impl/KcNotificationServiceImpl.java:[451,16] error: 'catch' without 'try'

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/framework/person/KcPerson.java:[75,29] error: variable LOG is already defined in class KcPerson

  * Revert "cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch"

  * This reverts commit 6602461f15248817d029d055c62b9d694677941d.

  * Conflicts:
	CX_PORTING.md

  * revert changes to cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch and update CX_PORTING

  * Fixed: AuthTokenGenerator cannot be resolved to a type

  * Fixed: Duplicate field CoiMessagesServiceImpl.LOG

  * Fixed: ProposalPerson cannot be resolved to a type

  * Updated object references for com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java. A couple of errors remain that need attention

  * Fixed: The import org.kuali.kra.bo.Unit cannot be resolved

  * Fixed: Unit cannot be resolved to a type

  * Revert "cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch"

  * This reverts commit 3aa4c838aae72ce5f0173761a980fa146db83967.

  * Conflicts:
	CX_PORTING.md

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[111,130] error: cannot find symbol
  * [ERROR] symbol:   method getUnitAdministratorTypeCode()
  * [ERROR] location: class UnitAdministratorType
  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[128,135] error: cannot find symbol

  * CX 6 now compiles! w00t! Next bind to our fork of rice

  * bind to CX rice version 2.5.2.0-kualico-SNAPSHOT

  * Fixes: Caused by: java.lang.ClassNotFoundException: com.rsmart.kuali.coeus.data.migration.FlywayMigrator

  * very close to getting CX6 to start

  * Disable HR REST API until we can resolve: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'hrImportService' defined in class path resource [com/rsmart/kuali/coeus/hr/JerseyBeans.xml]: Instantiation of bean failed; nested exception is org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.rsmart.kuali.coeus.hr.service.impl.HRImportServiceImpl]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: org/kuali/kra/bo/PersonAppointment

  * Fixes ERROR 1064 (42000) at line 17: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--creates additional attribute for krms data validation rules

  * Added a quick hack to apply KC6 upgrade SQL/DML

  * updated CX_PORTING with new SQL error info

  * Fixes dml/KC_DML_02_KCINFR-979_B000.sql error

  * Erronous duplicate entry in mysql file

  * updated CX_PORTING.md for REST API progress

  * added todo for REST API spring context errors

  * Manually merged PD authorizer changes into PDDocAuthorizer

  * Merged in changes to KcAuthorizationBase and KcTransDocActionBase

  * resolved REST API startup issue

  * AwardActionsAction merged and other files confirmed

  * Relevant changes from patch applied to Rolodex.java

  * S2SUtil patch changes being applied upstream in KC
  * Lance Speelmon on Tue, 25 Nov 2014 10:53:18 -0700 [View Commit](../../commit/1ae2630486ac0ef911c1ffa8127b9e15ae60d1ce)
* KRACOEUS-8789:subaward sync from pdf refreshes details section
  * Joe Williams on Wed, 4 Feb 2015 16:39:15 -0600 [View Commit](../../commit/b20d724872eda17cc19650ce53ee3f5ceb74ecd4)
* KRACOEUS-8773: fixing a NPE
  * Travis Schneberger on Wed, 4 Feb 2015 16:07:40 -0500 [View Commit](../../commit/0f6e2b771e5e2d9bfb95401cbb60e75a64d7ccfc)
* KRACOEUS-7863
  * Implement Budget Non-Personnel Costs - Formulated Costs
  * rmancher on Wed, 4 Feb 2015 15:54:32 -0500 [View Commit](../../commit/ef3d3ba03a72a3b0596d4dbce870a41a9fa7ee45)
* KRACOEUS-8783:allow routing actions for proposals accessed through proposal search
  * Joe Williams on Wed, 4 Feb 2015 09:43:34 -0600 [View Commit](../../commit/bd780608c82c5dcda20fdc637e4cd9dc239c8cfb)
* KRACOEUS-8786:fixed subaward close out date constraint issues
  * Joe Williams on Wed, 4 Feb 2015 08:31:23 -0600 [View Commit](../../commit/b0e5a9abcf8053371659df415c8082422671b645)
* KRACOEUS-8776: lic header issue
  * Travis Schneberger on Tue, 3 Feb 2015 17:01:14 -0500 [View Commit](../../commit/b29c8f46fd05b1a958ba23b4dbac3febf1025771)
* KRACOEUS-8760:moved version and sql info to footer
  * Joe Williams on Fri, 30 Jan 2015 16:30:35 -0600 [View Commit](../../commit/d9b846d119222ba6ead2697277fd63d815b62a5e)
* KRACOEUS-8784:make sub award line items non editable from periods page
  * Joe Williams on Tue, 3 Feb 2015 14:23:22 -0600 [View Commit](../../commit/7ea052db65075ce4d3958d30df2fa1005e53a7f4)
* KRACOEUS-8781: fixing lic issues
  * Travis Schneberger on Tue, 3 Feb 2015 12:12:58 -0500 [View Commit](../../commit/4cfb034a046e8a4c66a39b67a4f09188d325dfa7)
* KRACOEUS-8775: setting the s2sgen lib to next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:44:29 -0500 [View Commit](../../commit/defd2f9b95e391079eb3b1f681594d2aeffd0e3d)
* KRACOEUS-8775: next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:41:56 -0500 [View Commit](../../commit/154a686f9289c09ae865376763d561c11e068038)
* KRACOEUS-8774: removing snapshot
  * Travis Schneberger on Mon, 2 Feb 2015 17:24:02 -0500 [View Commit](../../commit/7d3ddd5ae1fc848000c1a3412c03b18be92b55af)
* KRACOEUS-8769: removing help content
  * Travis Schneberger on Mon, 2 Feb 2015 15:46:06 -0500 [View Commit](../../commit/5714509e2ccd1ff5bf4ed460aa59ef84824f98ca)
* KRACOEUS-8772: Remove help icon from PD
  * Gayathri on Mon, 2 Feb 2015 11:34:42 -0700 [View Commit](../../commit/96b875d132a18e6b3516c7109e872a072702d79d)
* KRACOUES-8764:fix additional equipment system generated attachments
  * Joe Williams on Mon, 2 Feb 2015 10:21:53 -0600 [View Commit](../../commit/36480a289ba551da181442a5dc052c9fecb809dd)
* KRACOEUS-8762: fixing license in html files.
  * Gayathri on Sat, 31 Jan 2015 15:44:42 -0700 [View Commit](../../commit/69b0092d5732ee447b44f41ca5d83dcac027657c)
* KRACOEUS-8344: setting lib versions for release
  * Travis Schneberger on Sat, 31 Jan 2015 16:52:07 -0500 [View Commit](../../commit/6b0503589cdb146facb6e26d25c14661b2bd738e)
* KRACOEUS-8765: rice upgrade to 2.5.2
  * Gayathri on Fri, 30 Jan 2015 21:23:58 -0700 [View Commit](../../commit/e3862db9d1ca52d692c6887b5f7c03f00b31ec18)
* KRACOEUS-8762: License file change
  * Gayathri on Fri, 30 Jan 2015 16:27:19 -0700 [View Commit](../../commit/a16f5e36c180a3c3bbeae750009e7e7c295157f1)
* KRACOEUS-8749:fix relase scripts
  * Joe Williams on Fri, 30 Jan 2015 16:47:59 -0600 [View Commit](../../commit/8960ca00cd0030552ea9e873d79ef812efed4211)
* [KRACOEUS-8753] Help links for pd and pd budget
  * bsmith83 on Fri, 30 Jan 2015 12:03:17 -0800 [View Commit](../../commit/3ba5b96d3a5727c4541da2ed247ec2089f735613)
* KRACOEUS-8762: More License header updates. Change to Kuali Inc
  * Gayathri on Fri, 30 Jan 2015 12:50:01 -0700 [View Commit](../../commit/03ebf1cfc21fc4b9250c40ab80efcc9addc36756)
* KRACOEUS-8622: removing rice override
  * Travis Schneberger on Fri, 30 Jan 2015 12:41:28 -0500 [View Commit](../../commit/d5d87f2d47ae5817ad7785ab403cb17936790c64)
* KRACOEUS-8760:add application footer with copy right info
  * Joe Williams on Thu, 29 Jan 2015 10:24:26 -0600 [View Commit](../../commit/0e08bb73fd2b97d090d07e9bb1fd6ebb3c1ca7ba)
* KRACOEUS-8763: fixing lookup link
  * Travis Schneberger on Fri, 30 Jan 2015 09:47:00 -0500 [View Commit](../../commit/7434aff1d6cf03d268134cf8e926af52581ece7b)
* KRACOEUS-8762: License header updates
  * Gayathri on Thu, 29 Jan 2015 16:36:19 -0700 [View Commit](../../commit/d5cfb7fef63dc1c0fbdcfb5ff6aa41ee87d2b9d3)
* KRACOEUS-8664:ignoring proposalcopyservicetest
  * Joe Williams on Thu, 29 Jan 2015 15:16:45 -0600 [View Commit](../../commit/4b1da2d6060fda5b24000d6f91b381c7166978ff)
* KRACOEUS-8593 merging in PD budget and S2S help files
  * Jay Hulslander on Thu, 29 Jan 2015 09:53:24 -0500 [View Commit](../../commit/8362404965c1f0f0d2dc1a8a1acaaa88d8a76ca1)
* KRACOEUS-8664:removing ignore proposalcopyservicetest, and monitoring ci
  * Joe Williams on Thu, 29 Jan 2015 12:34:36 -0600 [View Commit](../../commit/e718bb172195875fb0fd64c4415046c701b07ad4)
* KRACOEUS-8749: fixing scripts
  * Gayathri on Wed, 28 Jan 2015 16:39:32 -0700 [View Commit](../../commit/91d88b67a7fd6b2c29ed770c60e0576012cb254d)
* KRACOEUS-8128, KRACOEUS-8129: fixing sql scripts
  * Travis Schneberger on Wed, 28 Jan 2015 17:45:12 -0500 [View Commit](../../commit/8247140404e649659ea11a0f66e14a8a9ef45ad8)
* KRACOEUS-8749:fix release script
  * Joe Williams on Wed, 28 Jan 2015 16:16:44 -0600 [View Commit](../../commit/7ebbd498f9f6cb5f6ad266a187bfa383f515b5d6)
* [KRACOEUS-8622] remove location overrides from KC
  * bsmith83 on Wed, 28 Jan 2015 13:24:22 -0800 [View Commit](../../commit/6bb1ab1d65dd141552df3d4128aca1fd87e8b9c4)
* KRACOEUS-8756: proposal log lookup fix
  * Gayathri on Wed, 28 Jan 2015 13:00:31 -0700 [View Commit](../../commit/9de6692548f00b1586a7d3d7183bca6a68c57ab0)
* Fixing bootstrap sequence script logic  * aakers on Wed, 28 Jan 2015 11:51:20 -0700 [View Commit](../../commit/18792f326bea6ee2a8d9933624948ad0d376421d)
* Moving responsibility-related sequences to the bottom to minimize broken
syntax impact on later scripts  * aakers on Wed, 28 Jan 2015 11:11:30 -0700 [View Commit](../../commit/26c6fe5beb5ccf742121dc10f52444b732392ba6)
* Updating database install shell scripts  * aakers on Wed, 28 Jan 2015 08:54:12 -0700 [View Commit](../../commit/6faa146e051dab83a254129aae06b314f7206e02)
* KRACOEUS-8755: rice upgrade
  * Gayathri on Tue, 27 Jan 2015 19:08:38 -0700 [View Commit](../../commit/baaa3437c8e4a1c45a19be831897b007314f8c01)
* KRACOEUS-8738 fixing formating concerns
  * Jay Hulslander on Tue, 27 Jan 2015 16:29:09 -0500 [View Commit](../../commit/ccd6f8f47133606009ef33345d9ba940bcfd0327)
* KRACOEUS-8747: changing description of param
  * Travis Schneberger on Tue, 27 Jan 2015 13:13:58 -0500 [View Commit](../../commit/3cac0efc0722ba58e38e204aea64886973254035)
* KRACOEUS-8128
  * fix fop error: ProtocolActionCorrespondenceGenerationServiceTest  * boneypolus on Tue, 27 Jan 2015 22:15:22 +0530 [View Commit](../../commit/4ec65be19b960732d3efd6d2e80c8830155c7bff)
* Revert "KRACOEUS-8750: sprint 14"
  * Travis Schneeberger on Mon, 26 Jan 2015 21:19:40 -0500 [View Commit](../../commit/38faeacd079bb25d3e6da55f99820843ccf35326)
* KRACOEUS-8628: Fixing routeLog proposal units
  * Gayathri on Mon, 26 Jan 2015 11:19:23 -0700 [View Commit](../../commit/6240def68a3bc8d12cda3c5d3acb7a7bb42b9271)
* KRACOEUS-8523
  * Set merged protocol document - IRB and IACUC to blanket approve.
  * rmancher on Mon, 26 Jan 2015 12:10:36 -0500 [View Commit](../../commit/af70c8dd084c844acfb31c5f88c61dfaad284130)

##coeus-6.0.0-s14
* KRACOEUS-8750: sprint 14
  * Travis Schneberger on Mon, 26 Jan 2015 21:18:39 -0500 [View Commit](../../commit/749b808c890d52781b632052e7375b8fd36ea2be)
* KRACOEUS-8749: release scripts
  * Gayathri on Mon, 26 Jan 2015 15:21:00 -0700 [View Commit](../../commit/8f6d755edcedabe6586c934fb290ef9ef0a8b226)
* [KRACOEUS-8582] Fix for lookup loading message not dismissing in IE
  * bsmith83 on Mon, 26 Jan 2015 12:06:00 -0800 [View Commit](../../commit/9a941cbfab68678391dbd5c2d984e64ccf9ab510)
* KRACOEUS-8728
  * Fix to not popup sync rates dialog when in view mode
  * Do not display lock message in view mode - both PD and Budget
  * rmancher on Fri, 23 Jan 2015 12:28:24 -0500 [View Commit](../../commit/859f0580e98d23fedf2a1079ac1f18b9c60d73d7)
* Update LandingPageView.xml  * Travis Schneeberger on Fri, 23 Jan 2015 15:56:18 -0500 [View Commit](../../commit/e7ed4847409526cb85f14273f34b06e1969b3640)
* KRACOEUS-8732: code review comments
  * Travis Schneberger on Fri, 23 Jan 2015 12:00:33 -0500 [View Commit](../../commit/e51c5c80177fc0b8686aad428cf59b1236cbe006)
* KRACOEUS-8732: making sure investigators can view proposals
  * Travis Schneberger on Fri, 23 Jan 2015 11:38:25 -0500 [View Commit](../../commit/4e0fbc94b68f4744358b5d867941022c81b06b67)
* Update KC_DML_01_KRACOEUS-8741_000D.sql  * Travis Schneeberger on Fri, 23 Jan 2015 09:19:33 -0500 [View Commit](../../commit/732c11ef3e1ef8c82a3ef96c327b1cb9f278722e)
* Update KC_DML_01_KRACOEUS-8741_000D.sql  * Travis Schneeberger on Fri, 23 Jan 2015 09:18:56 -0500 [View Commit](../../commit/80af4b7350a439910777d0cbc0f5d293eb05c664)
* KRACOEUS-8738 fixing landing page text
  * Jay Hulslander on Thu, 22 Jan 2015 19:03:50 -0500 [View Commit](../../commit/9edb57e78a3e8002af76848986675e9161ecb958)
* KRACOEUS-8733: adding oracle jar to oracle profile, creating a verifying to ensure if on the oracle platform the jar is present.
  * Travis Schneberger on Thu, 22 Jan 2015 22:27:50 -0500 [View Commit](../../commit/2b72d4ff6bcbb02a60547849f77408b76737c428)
* KRACOEUS-8728
  * Fix complete budget - in view mode
  * rmancher on Thu, 22 Jan 2015 16:18:56 -0500 [View Commit](../../commit/ca51f346797ebd08622f678d221e4d192afa82b3)
* KRACOEUS-8741: Demo Qnnr Usage change.  * chrisdenne on Thu, 22 Jan 2015 11:46:25 -0700 [View Commit](../../commit/65dbc5d01678b88751db3900297bd48078302f5d)
* KRACOEUS-8593 removing old help files, adding in 6.0 kns help, and merging in 6.0 PD help, and fixing merge related issues
  * Jay Hulslander on Wed, 21 Jan 2015 13:23:13 -0500 [View Commit](../../commit/863354def6794cba6154ea93e7476f9a1a65aaac)
* KRACOEUS-8678: Missing warning about invalid file type - Use different interface
  * Chuck Tharp on Thu, 22 Jan 2015 12:50:14 -0500 [View Commit](../../commit/39fdfcc3d2315f71f8e651c61c033b913f65c812)
* KRACOEUS-8711: handling null
  * Travis Schneberger on Thu, 22 Jan 2015 10:09:42 -0500 [View Commit](../../commit/552270f122c00619cf52cfb550bd5dcd0e156415)
* KRACOEUS-8723: fixing personnel attachments sync behavior
  * Gayathri on Wed, 21 Jan 2015 20:01:57 -0700 [View Commit](../../commit/14433482222057d6323255c89ff006656b3387b6)
* KRACOEUS-8724 : More sql fixes, mysql primarily
  * blackcathacker on Wed, 21 Jan 2015 18:28:11 -0800 [View Commit](../../commit/9ef8876c8eba0c7524a7a4669a762942a7ed897f)
* KRACOEUS-8736: handling changed category
  * Travis Schneberger on Wed, 21 Jan 2015 13:39:36 -0500 [View Commit](../../commit/151d90d2b9c4348a675b1386b0b224a3136e8155)
* KRACOEUS-8735
  * Calculate months last day inclusive.
  * rmancher on Wed, 21 Jan 2015 12:01:40 -0500 [View Commit](../../commit/3396dcbb1332c9643270090193f8f1c5547ac7f2)
* KRACOEUS-8728
  * Fix to open budget in view mode when proposal is in view mode
  * rmancher on Wed, 21 Jan 2015 11:14:10 -0500 [View Commit](../../commit/646159187456066476eaa66b1658c0c4bb2570ef)
* KRACOEUS-8129 : Fix unit test
  * blackcathacker on Tue, 20 Jan 2015 18:36:40 -0800 [View Commit](../../commit/f3aa235692a58df65898d8adb54d46563b5bd7b9)
* KRACOEUS-8693 : Subaward NIH specific calculations
  * blackcathacker on Mon, 19 Jan 2015 11:32:29 -0800 [View Commit](../../commit/604c8e4a5f36c20a61fade4b63a83db6ff403160)
* KRACOEUS-8713: Makes sure that a person has only one attachment per type
  * jamey-rsmart on Tue, 20 Jan 2015 15:03:28 -0700 [View Commit](../../commit/4d1c009463f2fa6a1733e3f448a5dd10a1a866fa)
* KRACOEUS-8328 : Switching to disclosable version
  * blackcathacker on Mon, 19 Jan 2015 18:58:27 -0800 [View Commit](../../commit/4f66c889553d5ca08dbc73f44398468bcebe031c)
* KRACOEUS-8727
  * Fix months calculation in budget periods
  * rmancher on Mon, 19 Jan 2015 19:24:33 -0500 [View Commit](../../commit/e94ea11383987f873e401d32a84c668efb651878)
* KRACOEUS-8729:recall fix
  * Gayathri on Tue, 20 Jan 2015 10:45:13 -0700 [View Commit](../../commit/68d541512e2bedeab966b75440f4e335af897e30)
* KRACOEUS-8683:fix STE on linking to child from parent when no link proposal is entered
  * Joe Williams on Tue, 20 Jan 2015 10:22:39 -0600 [View Commit](../../commit/97d5961facc088f35f3bbaf9c1cc4f1e0a7218c9)
* KRACOEUS-8129
  * fix fop error in: CommitteeBatchCorrespondenceServiceTest  * boneypolus on Tue, 20 Jan 2015 18:16:46 +0530 [View Commit](../../commit/ac07778e359cd780ab34347aedc7f788f5f7d121)
* KRACOEUS-8602 : Conversion script for IDC Rate Type
  * blackcathacker on Mon, 19 Jan 2015 18:37:36 -0800 [View Commit](../../commit/95f44445cb1f76267c7028228c9ffee0dcd711e4)
* KRACOEUS-8693 : Mistaken double ;;
  * blackcathacker on Mon, 19 Jan 2015 09:43:27 -0800 [View Commit](../../commit/5efc02ecc623f50c56d6ae1c0f2f820f7974baa5)
* KRACOEUS-8693 : Fix budget person salary details mapping
  * blackcathacker on Fri, 16 Jan 2015 19:05:52 -0800 [View Commit](../../commit/d9062e6643712a19a9ae3586ba1290d14f179ffe)
* KRACOEUS-8730: copy parent fix
  * Gayathri on Fri, 16 Jan 2015 15:51:27 -0700 [View Commit](../../commit/13c1f62f04ea4694e26c76b0d6e39305c4686b1d)
* KRACOEUS-8006
  * KRACOEUS-8712
  * Addressing these jiras I am not able to reproduce the issue.
  * I was not able to create an award and the payment reports and Terms tab was
  * not loading due to attributeEntry null error.
  * Adding AwardCgb to core spring bean to fix this issue.
  * rmancher on Fri, 16 Jan 2015 14:05:06 -0500 [View Commit](../../commit/ff896626b528b92808de345b6362dad5c662891c)
* KRACOEUS-8601:change hierarchy budget summary to only display latest budget
  * Joe Williams on Thu, 15 Jan 2015 10:17:38 -0600 [View Commit](../../commit/154cd18e24d1a5007cc073557d278edde615c86a)
* KRACOEUS-8494 S2S Print forms: After first print attempt, no message
  * given when printing all forms and there are errors on some forms that
  * prevent them from being printed  * mrudulpolus on Fri, 16 Jan 2015 18:20:10 +0530 [View Commit](../../commit/027a367baa95da24d9a0fd06b6c497ada2d432cd)
* KRACOEUS-8724 : Mysql sql fixes
  * blackcathacker on Tue, 13 Jan 2015 14:23:51 -0800 [View Commit](../../commit/067584b67db87c614fe801c05f2f177f73e87836)
* KRACOEUS-8328 : Subaward Cost Share Display
  * blackcathacker on Thu, 15 Jan 2015 16:14:50 -0800 [View Commit](../../commit/8e0c3f4062df849ce5b3c8670585085fe8b345ac)
* KRACOEUS-8692: creating dialog for subawards warning, making null period display as ""
  * Travis Schneberger on Thu, 15 Jan 2015 13:51:25 -0500 [View Commit](../../commit/b1377441d4f6ac014a1f4f21e4cca3723a04410d)
* KRACOEUS-8721
  * Ignore time in current date for comparison
  * rmancher on Thu, 15 Jan 2015 15:59:58 -0500 [View Commit](../../commit/90d35d1ed742556b027692b6e284e716460f3dd3)
* KRACOEUS-8722:added description to proposal attachment collection
  * Joe Williams on Thu, 15 Jan 2015 13:54:34 -0600 [View Commit](../../commit/62b4b05edce254b2fd3cea65abded7a8b0fde068)
* [KRACOEUS-8720] Removal of lookup for deadline type
  * bsmith83 on Thu, 15 Jan 2015 11:02:58 -0800 [View Commit](../../commit/ea67f4de410492c5fd591bd68afc442ec52966b1)
* KRACOEUS-8608 Validation error incorrectly shows when attachment type exists
  * Shoj on Thu, 15 Jan 2015 13:15:59 -0500 [View Commit](../../commit/4d1898f00f7ab0c17a0e5e5c743296893977c0ac)
* KRACOEUS-8718:turns off data validation on hierarchy creation, and hide data validation actions
  * Joe Williams on Thu, 15 Jan 2015 08:40:26 -0600 [View Commit](../../commit/745d18d6a06bfdc38eafbca4821a3adc0e820d54)
* KRACOEUS-8702 no longer auto-searching with empty criteria on search links
  * Jay Hulslander on Tue, 13 Jan 2015 11:56:12 -0500 [View Commit](../../commit/e373bd3e4b0be8a9888e1fe90e189d7eba55d868)
* KRACOEUS-8634: Handle subaward line items better
  * blackcathacker on Wed, 14 Jan 2015 17:15:10 -0800 [View Commit](../../commit/ae93d46c968f910ef2226e0dcd8364ebc1ee6a3b)
* [KRACOEUS-8700] Copy link fix for missing form content for spEL
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/3a4f288ffec06a9c9ea965861c13a6daf3626f3d)
* KRACOEUS-8705: Prevent duplicate bios
  * Gayathri on Wed, 14 Jan 2015 16:32:33 -0700 [View Commit](../../commit/6563f172917782a1401ecdd926710d993bc40f09)
* KRACOEUS-8716:add view proposal permission to aggregator only document level role
  * Joe Williams on Wed, 14 Jan 2015 16:36:22 -0600 [View Commit](../../commit/c04d4aa6399dc7a67d0a0c4146fa35e354f7a8e3)
* KRACOEUS-8717:change text for submission budget text
  * Joe Williams on Wed, 14 Jan 2015 16:04:31 -0600 [View Commit](../../commit/89897613eed829d6d4bfa5a07277bbb8871c4c37)
* KRACOEUS-8709: setting all stage award persons to joe tester for PI only
  * Travis Schneberger on Wed, 14 Jan 2015 16:22:36 -0500 [View Commit](../../commit/bd365f052aa412b98c41a11d6473e057a0d8cfb8)
* KRACOEUS-8714:hide clear answers when proposal is view only
  * Joe Williams on Wed, 14 Jan 2015 14:53:26 -0600 [View Commit](../../commit/f77319d6c1d25bae41ed08bb138a064c07599c04)
* KRACOEUS-8715: rice upgrade
  * Gayathri on Wed, 14 Jan 2015 13:48:01 -0700 [View Commit](../../commit/756f1f6dbddedbca0c102c276e395f5cb94b687e)
* KRACOEUS-7433:fixed issue of agendas not running for all units on a proposal
  * Joe Williams on Wed, 14 Jan 2015 14:10:42 -0600 [View Commit](../../commit/40308ad66a571a41f4917efa5766fa4d96d2a8b7)
* KRACOEUS-8711: fixing formatting errors
  * Travis Schneberger on Wed, 14 Jan 2015 14:17:15 -0500 [View Commit](../../commit/24bbdab352991ab5a9312e78db5d9ee2dc3ddf30)
* KRACOEUS-8711: preventing the search from executing upon first opening
  * Travis Schneberger on Wed, 14 Jan 2015 14:16:58 -0500 [View Commit](../../commit/b19cf8cb763e5dbba136be7447ab449efe50d618)
* KRACOEUS-8711: removing code duplication
  * Travis Schneberger on Wed, 14 Jan 2015 14:16:28 -0500 [View Commit](../../commit/47e34c09bb876c6e0e34f76bf357905026fb3bbb)
* KRACOEUS-8678: Missing warning about invalid file type
  * Chuck Tharp on Fri, 9 Jan 2015 15:44:41 -0500 [View Commit](../../commit/817b19bf0a5a104fc247f55eabce5c0f4ea65b1e)
* KRACOEUS-8668:hide super user actions on child proposals
  * Joe Williams on Wed, 14 Jan 2015 13:08:12 -0600 [View Commit](../../commit/cdbd4050469f69f57a8ef35a40ea1169ff49c76f)
* [KRACOEUS-8699] Fix for ajax tabs and the ids on add dialog actions within
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/0573ed8a538c477dc12c276d535c55a4c61b3442)
* KRACOEUS-8709: code review comments
  * Travis Schneberger on Wed, 14 Jan 2015 12:22:49 -0500 [View Commit](../../commit/695d576b35e1ccdb6a8b0bf46082d5ad7a470887)
* KRACOEUS-8707: Changed button label.
  * jamey-rsmart on Wed, 14 Jan 2015 10:06:30 -0700 [View Commit](../../commit/53ff3522fd6d33ed81507f16d777a39cedfe63b9)
* KRACOEUS-8710: only adding the datasource if it hasn't been added already
  * Travis Schneberger on Wed, 14 Jan 2015 11:56:03 -0500 [View Commit](../../commit/e4857ea22b6d94d310827bbb5c248e841a4eab8a)
* KRACOEUS-8709: adding validation, general code cleanup
  * Travis Schneberger on Wed, 14 Jan 2015 10:43:59 -0500 [View Commit](../../commit/ed19b00853d0e5255b896fef34e59383c485015a)
* KRACOEUS-8708:fix add proposal attachment
  * Joe Williams on Wed, 14 Jan 2015 08:51:24 -0600 [View Commit](../../commit/c72bc8eabcf378f2778cf7e5a3dabfe1d585c1f9)
* KRACOEUS-8703: fixing pessimistic locks maintenance
  * Gayathri on Tue, 13 Jan 2015 16:50:45 -0700 [View Commit](../../commit/4e726f474652f18c616b36a2228fd5b42c59a9f6)
* KRACOEUS-8655 : Code review changes
  * blackcathacker on Tue, 13 Jan 2015 14:25:28 -0800 [View Commit](../../commit/1f924afe166f7c6c86218619c5686c3f1ce55da5)
* KRACOEUS-8706
  * Add validation to budget modular
  * rmancher on Tue, 13 Jan 2015 16:06:24 -0500 [View Commit](../../commit/be17939eb7fe0bc89896f56d36cc7ac60eca9963)
* KRACOEUS-8470 managing validation boolean between award and budget, also fixing account type description validation on award
  * Jay Hulslander on Tue, 13 Jan 2015 15:17:04 -0500 [View Commit](../../commit/6e471a525ca0fc27613ee72411b5fc94723851b1)
* KRACOEUS-8704: uppercasing
  * Gayathri on Tue, 13 Jan 2015 13:05:42 -0700 [View Commit](../../commit/4396e6d377b44453a69a687b5707d885475ec290)
* KRACOEUS-8690: add investigators to protocals on PD medusa view.
  * Joe Williams on Tue, 13 Jan 2015 13:30:36 -0600 [View Commit](../../commit/681fead75e1c3a34bea9bdcd6de08067414f0fb8)
* KRACOEUS-8626: turning off client side validation for sync-all
  * Travis Schneberger on Tue, 13 Jan 2015 14:26:23 -0500 [View Commit](../../commit/8b726f3838c64a92829182810ccca761c9275ca2)
* [KRACOEUS-8695] Fix for proposal summary view
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/d9db48405f067fb7a7211aa302f2948710146ab8)
* KRACOEUS-8698: Fixing abstract copy
  * Gayathri on Tue, 13 Jan 2015 11:21:49 -0700 [View Commit](../../commit/b6b10cc3bbcd34f57ad638bba86a537ff8ac7860)
* KRACOEUS-8649
  * Set form name as report name when only one form is selected or set a generic name
  * rmancher on Tue, 13 Jan 2015 12:25:13 -0500 [View Commit](../../commit/e94411bd0bbc0a7221d004e29dd6ff83e3796e35)
* KRACOEUS-8689: removing s2s opportunity doesn't delete attachment type
  * Joe Williams on Tue, 13 Jan 2015 10:17:03 -0600 [View Commit](../../commit/6203f29bafd2326eb5eb5ea167cbf94c1d56fcfb)
* KRACOEUS-8494 S2S Print forms: After first print attempt, no message
  * given when printing all forms and there are errors on some forms that
  * prevent them from being printed  * mrudulpolus on Fri, 9 Jan 2015 19:34:31 +0530 [View Commit](../../commit/4894304af79258318e6fe2898c0da82bfe06d516)
* KRACOEUS-8436 PD UXI: S2S Form Print - Select All selects all Available
  * forms, not all Included forms  * sasipolus on Tue, 23 Dec 2014 17:06:25 +0530 [View Commit](../../commit/d5174dae40c9e7aefb2d6b777871a156cdc444c9)
* Revert "KRACOEUS-8701: sprint 13"
  * Travis Schneeberger on Mon, 12 Jan 2015 21:30:16 -0500 [View Commit](../../commit/20c35f24b84db65e3d9415b45392bfc6e27a8119)
* KRACOEUS-8655 : Check activity type change and empty rates
  * blackcathacker on Fri, 9 Jan 2015 11:10:41 -0800 [View Commit](../../commit/8aa3b624b20ddcbf6338f06beea33b46efc04b6f)
* KULRICE-14086.  Work-around to get Ajax working with disclosure triangles. (After rebase, fix conflict error)
  * sedgar01 on Mon, 12 Jan 2015 17:56:21 -0500 [View Commit](../../commit/77b68e9cbeecce689bf4f9793055b5f5ab22f958)
* KULRICE-14086.  Work-around to get Ajax working with disclosure triangles. (After rebase)
  * sedgar01 on Mon, 12 Jan 2015 17:08:15 -0500 [View Commit](../../commit/8a12f3845a5fd94460c70f84cd2747789ebaf7f3)
* KRACOEUS-8686
  * Fix issue related to audit rules invoked and correspinding save in attachments
  * causing unique constraint violation.
  * rmancher on Mon, 12 Jan 2015 14:16:09 -0500 [View Commit](../../commit/7ca69ab54d2ea8343a78b7deef5840e9d4b235ec)
* KRACOEUS-8526: refreshing pd user roles on navigate
  * Travis Schneberger on Mon, 22 Dec 2014 09:25:07 -0500 [View Commit](../../commit/14d923439c5f00e2b637e7d3e2be82855ded09bf)

##coeus-6.0.0-s13
* KRACOEUS-8701: sprint 13
  * Travis Schneberger on Mon, 12 Jan 2015 20:49:40 -0500 [View Commit](../../commit/b728461d18a3b97006aca6dc679a306e9c68a2b4)
* KRACOEUS-8688
  * Fix optimistic lock exception and duplicate notes
  * rmancher on Mon, 12 Jan 2015 19:18:28 -0500 [View Commit](../../commit/9289f11ecff7e466a80e4d03b20132e90b675d2a)
* KRACOEUS-8669: Display parent's status in child
  * Gayathri on Mon, 12 Jan 2015 11:52:14 -0700 [View Commit](../../commit/3b8cf3fba5e9813b419950f1344783c06a876ba5)
* KRACOEUS-8694: Adding CFDA number to proposal when opportunity is selected.
  * jamey-rsmart on Mon, 12 Jan 2015 15:14:40 -0700 [View Commit](../../commit/2586b301eeefe9664d6a9cc7c98da8255c6f0364)
* KRACOEUS-8668:hide workflow actions on child proposal
  * Joe Williams on Mon, 12 Jan 2015 15:23:36 -0600 [View Commit](../../commit/e249534da11315935a2db287d82df4517dd71f26)
* [KRACOEUS-8416] Fix for fields that could potentially hidden by dialog hiding when validated on blur
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/5da5fa99f0ff83c66df84e580d47a2f4787b47a2)
* KRACOEUS-7658:fixed routing to set the correct update user
  * Joe Williams on Mon, 12 Jan 2015 13:34:55 -0600 [View Commit](../../commit/36ed6a5538d5194d78420dcc7e3dcd0889ae208d)
* KRACOEUS-8697: preventing a NPE
  * Travis Schneberger on Mon, 12 Jan 2015 15:19:51 -0500 [View Commit](../../commit/a66c8c910862e1e2f83b5b47444aaa90ae956210)
* KRACOEUS-8654: Created error message to stop budget periods from being created that have a start date before or equal to the last period's end date.
  * jamey-rsmart on Tue, 6 Jan 2015 15:35:41 -0700 [View Commit](../../commit/05c7f71efdd4a9c0afe5f3601b994fe7267db9a0)
* [KRACOEUS-8691] table width issue fix
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/d3bd6c0f0bbb62dbb1aac06ed83088319452bc43)
* KRACOEUS-8586 : Confirm end date extension for hierarhcy
  * blackcathacker on Fri, 9 Jan 2015 16:40:21 -0800 [View Commit](../../commit/f944a27403a6cb22377e0531e435be3deb127075)
* KRACOEUS-8590: Adding in missing award info.
  * jamey-rsmart on Fri, 9 Jan 2015 16:37:54 -0700 [View Commit](../../commit/a725367f55a186eca867d48109e4046ade77ff74)
* KRACOEUS-8683:fixed STE when linking with no proposal selected
  * Joe Williams on Fri, 9 Jan 2015 15:34:36 -0600 [View Commit](../../commit/1a83a8dbda7b92b52e9c22faeef934db4efd6312)
* KRACOEUS-8329 : Code review comments
  * blackcathacker on Fri, 2 Jan 2015 17:47:56 -0800 [View Commit](../../commit/0fde2a372abb86442512bf303725168923284532)
* KRACOEUS-8329 : Budget Proposal Hierarchy Modal
  * blackcathacker on Fri, 19 Dec 2014 18:26:55 -0800 [View Commit](../../commit/bb9e33959b7f802dc55aa90559172bf7818a19af)
* KRACOEUS-8664: ignoring test until it is fixed
  * Travis Schneberger on Fri, 9 Jan 2015 13:51:01 -0500 [View Commit](../../commit/2485085af70cff1a1ac635c254178d3cbf1a5944)
* KRACOEUS-8679 fixing prototocl submission lookup
  * Jay Hulslander on Fri, 9 Jan 2015 09:22:02 -0500 [View Commit](../../commit/6dfea521698f6548ea7e914b6b0faa48455a9fc7)
* [KRACOEUS-8651] small css tweak for kc inline edit
  * bsmith83 on Thu, 8 Jan 2015 17:23:21 -0800 [View Commit](../../commit/d7eed910cbc2e37aa5477bf02c1c56947fecf385)
* KRACOEUS-8483
  * Fix STE on disapprove action
  * rmancher on Fri, 9 Jan 2015 11:29:43 -0500 [View Commit](../../commit/a5efafca86384d6295126b4f548bf6a2fe03971a)
* KRACOEUS-8646:fix test
  * Joe Williams on Fri, 9 Jan 2015 10:24:29 -0600 [View Commit](../../commit/42fbf84215c5c35fce2c0634d6c7828b9b0d61f3)
* KRACOEUS-8671: setting the budget status on the settings page now reflects on the versions page, canEditView is forced to reevaluate when setting the budget status
  * Travis Schneberger on Thu, 8 Jan 2015 14:41:10 -0500 [View Commit](../../commit/6677d134c3ae4edbf5688f28ba40893b9b19a351)
* KRACOEUS-8638:narrative lock makes access readOnly, access page creates both proposal and narrative locks
  * Joe Williams on Tue, 6 Jan 2015 16:21:08 -0600 [View Commit](../../commit/5b449b1d8147c50657fc766d7a9de2cde66e30c3)
* KRACOEUS-8506: Fixing JTA rollback exception
  * Gayathri on Thu, 8 Jan 2015 14:47:35 -0700 [View Commit](../../commit/8a886dfc1b49d32ad483bfa94fe342f4a8e15629)
* [KRACOEUS-8651] full name data attr for personnel
  * bsmith83 on Tue, 6 Jan 2015 11:37:15 -0800 [View Commit](../../commit/9dc6235f43125c7dc9139751748e026bf554dc44)
* KULRICE-14086.  Enable Server Side Paging for Key Personnel page.  Use Ajax for tabs.
  * sedgar01 on Thu, 8 Jan 2015 17:42:21 -0500 [View Commit](../../commit/5b23d015bcb1f3e5a9fd95407c832c6cd5679ccd)
* KRACOEUS-8668:update permissions on create hierarchy to hide submit button
  * Joe Williams on Thu, 8 Jan 2015 16:02:35 -0600 [View Commit](../../commit/27f6ec94d9d6d7b1eab1155d6fe6e5d469bf009c)
* KRACOEUS-8653
  * Budget final version - updated to marked for submission.
  * rmancher on Wed, 7 Jan 2015 17:42:33 -0500 [View Commit](../../commit/a410c6ed6615ee079bcc16bcf208f8cbcfbd2f3c)
* KRACOUES-8637:only allow questionnaire copy if a questionnaire has answers
  * Joe Williams on Wed, 7 Jan 2015 16:38:56 -0600 [View Commit](../../commit/e84366bbc072fe6b022b8ca3cba46f5ccec75bea)
* KRACOEUS-8672:fix STE on delete with s2s opportunity connected
  * Joe Williams on Wed, 7 Jan 2015 16:09:25 -0600 [View Commit](../../commit/6d278bd6c514928accb9de173fb82c439d14656f)
* KRACOEUS-8673: Key personnel can be duplicated in IP
  * Chuck Tharp on Wed, 7 Jan 2015 16:54:52 -0500 [View Commit](../../commit/258c7130c01fa8bd0c159b283d847680ad6f45c4)
* KRACOEUS-8667:hide s2s elements once document is in workflow, and hide edit link on proposal search if proposal is in workflow
  * Joe Williams on Wed, 7 Jan 2015 15:50:09 -0600 [View Commit](../../commit/24769c44825e8d4b6d325e6ffd68382448573926)
* KRACOEUS-8605
  * Fix budget settings changes not applied to personnel
  * Test Modular sync
  * rmancher on Wed, 7 Jan 2015 15:58:15 -0500 [View Commit](../../commit/50d47cb0e605d874aece274b2e2c5cd82850d4c9)
* KRACOEUS-8670: Typo in notifications
  * Chuck Tharp on Wed, 7 Jan 2015 15:53:03 -0500 [View Commit](../../commit/14b512a7580fa27ccef3a333ff0863bdd95036e4)
* KRACOEUS-8630: Handle personnel removal while unlinking and syncing
  * Gayathri on Wed, 7 Jan 2015 11:35:10 -0700 [View Commit](../../commit/9587ce5b0690b1d639f3c44796636ba55a8a7a11)
* KRACOEUS-8666:changed view document link on hierarchy summary to open on new tab
  * Joe Williams on Wed, 7 Jan 2015 10:21:13 -0600 [View Commit](../../commit/0b1a6cacec4c4c01967d2a73db9023261ac05797)
* KRACOEUS-8665: fixed issue with clearing search fields on personnel search
  * Joe Williams on Wed, 7 Jan 2015 10:08:35 -0600 [View Commit](../../commit/89cee3148d95a1910d69aaece5fc43b1ae943a9c)
* KRACOEUS-8662:fixed delete permissions
  * Joe Williams on Wed, 7 Jan 2015 09:24:35 -0600 [View Commit](../../commit/d2b5fdffa7f90a6e434f61761c468269766cd878)
* KRACOEUS-8664: fix test
  * Travis Schneberger on Wed, 7 Jan 2015 08:00:17 -0500 [View Commit](../../commit/56fb48eefb56a2bfa6e51b1a8f4f89d525a6d050)
* KRACOEUS-8660: fix test
  * Travis Schneberger on Wed, 7 Jan 2015 07:48:39 -0500 [View Commit](../../commit/6f7fcd4757ed7696f0b9a5a70f8db62617ef3133)
* KRACOEUS-8656: Changed Parent Prosal to Proposal to avoid confusion.
  * jamey-rsmart on Tue, 6 Jan 2015 14:33:58 -0700 [View Commit](../../commit/c12a6daa8a8e92eed81d0e57f29f51136273e8f2)
* KRACOEUS-8453: Fixes maint doc in dialog issue for Delivery Info and Organization and Location.
  * jamey-rsmart on Tue, 6 Jan 2015 13:35:37 -0700 [View Commit](../../commit/3c9e57c840e7738b520373f47c61d98e3ecb5087)
* KRACOEUS-8646:fix tests
  * Joe Williams on Tue, 6 Jan 2015 14:13:13 -0600 [View Commit](../../commit/723e1b0a2beeea1ed63fb6d656fb47acdd826550)
* KRACOEUS-8658 fixing IP lookups, field conversion problem
  * Jay Hulslander on Tue, 6 Jan 2015 13:49:30 -0500 [View Commit](../../commit/72124de65d96935367e44c7ddb88825978c4f480)
* KRACOEUS-8633 : Code review comments
  * blackcathacker on Tue, 6 Jan 2015 10:08:24 -0800 [View Commit](../../commit/060afa7e3b552546c06b4ff9796cff18ebdb191d)
* KRACOEUS-8646: fix test
  * Travis Schneberger on Tue, 6 Jan 2015 10:50:17 -0500 [View Commit](../../commit/1abe3150dbd447ef528deb068e4e158ab1607140)
* KRACOEUS-8657: fix test
  * Travis Schneberger on Tue, 6 Jan 2015 12:55:28 -0500 [View Commit](../../commit/14c74843edc129bb9ca65ce0fec17d842039cced)
* KRACOEUS-8644: fix test
  * Travis Schneberger on Tue, 6 Jan 2015 10:16:16 -0500 [View Commit](../../commit/55193c8e9072da466fa2f49ac044870e50e68b4b)
* KRACOEUS-8642: fix test
  * Travis Schneberger on Tue, 6 Jan 2015 09:22:17 -0500 [View Commit](../../commit/2fdddce3ac9e170e6f2bd1f1e56b6600801bf786)
* KRACOEUS-8442 Grants.gov: System Generated attachments are available for
selection in the Attachment Type dropdown (2 additional)  * sasipolus on Tue, 6 Jan 2015 19:40:12 +0530 [View Commit](../../commit/e12c76ac8c1dff375586944e5d2361ede5c8109d)
* KRACOEUS-8641: fix test
  * Travis Schneberger on Tue, 6 Jan 2015 09:09:40 -0500 [View Commit](../../commit/191fc8a09a26aebf7368d6d383293d1f96176c16)
* KRACOEUS-8634 : Fix removing budget line items for subaward
  * blackcathacker on Mon, 5 Jan 2015 18:15:03 -0800 [View Commit](../../commit/246dd63f85087d8e99980c2d1751a2c39c6155c9)
* KRACOEUS-8633 : Allow subaward details to be viewed when readonly
  * blackcathacker on Mon, 5 Jan 2015 17:46:17 -0800 [View Commit](../../commit/cf0a4c8a8221f038a49dea663c87d86d3e84fd2a)
* KRACOEUS-8453: Closing dialog window through document actions.
  * jamey-rsmart on Mon, 5 Jan 2015 14:51:14 -0700 [View Commit](../../commit/2c73263ee8b52e4912fec1b833639315dff026ce)
* KRACOEUS-8637:hide copy elements if they aren't present in the proposal
  * Joe Williams on Mon, 5 Jan 2015 15:45:40 -0600 [View Commit](../../commit/9b96e7ed6346a9ac40791448508076cf8f514b8e)
* KRACOEUS-8632
  * KRACOEUS-8631
  * Fix budget print forms
  * rmancher on Mon, 5 Jan 2015 12:54:57 -0500 [View Commit](../../commit/e43876b46926e1fcc649406a1d1630d9b832333f)
* KRACOEUS-8635
  * Fix for Add Rate dialog issue
  * rmancher on Mon, 5 Jan 2015 16:27:10 -0500 [View Commit](../../commit/6a1eae24860925f47613dcbf64a34edfb5260201)
* KRACOEUS-8555: Updated look and feel of medusa to be easier to read as well as consistent between PropDev and the PropDev lookup.
  * jamey-rsmart on Tue, 23 Dec 2014 14:41:07 -0700 [View Commit](../../commit/4387e9f04450470666ebef8d20517ced27436e23)
* KRACOEUS-8627:added validation to check parent if parent budget is in complete status
  * Joe Williams on Mon, 5 Jan 2015 13:20:44 -0600 [View Commit](../../commit/4303fdf7a965f17c3344aeca1bcc41d4913158b2)
* KRACOEUS-8618: Invalid error message upon IRB resubmission
  * Chuck Tharp on Mon, 5 Jan 2015 13:15:45 -0500 [View Commit](../../commit/60a6d1387543b55bbcd859ad043bc2297d71932f)
* KRACOEUS-8623 fixed replacement setting and ojb mappings

  * @ KRACOEUS-8623-radioOptions
  * Jay Hulslander on Mon, 5 Jan 2015 11:00:25 -0500 [View Commit](../../commit/0ff73efd82800e688583c7f27326e10b178ec2df)
* KRACOEUS-8626: turning off client side validation for sync-all
  * Travis Schneberger on Mon, 5 Jan 2015 11:30:37 -0500 [View Commit](../../commit/51019a33140be00226ac1d0410608ec6488099a8)
* KRACOEUS-8596:validate attachments before replacing attachments on narrative page save
  * Joe Williams on Mon, 5 Jan 2015 10:09:21 -0600 [View Commit](../../commit/b70b773829da3a1108b5bc6813b2bf6f25a08304)
* KRACOEUS-8625 - add view copy cache to proposal,
small css fix for app header version
  * jkneal on Mon, 5 Jan 2015 10:30:51 -0500 [View Commit](../../commit/9ab99481528239a953cfe14981d774b077ad5588)
* KRACOEUS-8595:fixed internal attachment type value finder
  * Joe Williams on Mon, 5 Jan 2015 08:39:57 -0600 [View Commit](../../commit/aaaa0da7451b7ce4b435abb106b478e03b34631e)
* KRACOEUS-8545 - Upgrade rice to get KIM caching, some changes on KC auth to take advantage of cache
  * jkneal on Wed, 31 Dec 2014 13:14:54 -0500 [View Commit](../../commit/a41f0e098be20478f12c626881f4c091568c3f23)
* KRACOEUS-7696 : Create Budget Versions Print Action  * sasipolus on Mon, 5 Jan 2015 14:02:55 +0530 [View Commit](../../commit/5962dc7fd8978e46bb234db4d6d3721293c4d72b)
* KRACOEUS-8571 : Fix some persistence issues with hierarchy
  * blackcathacker on Fri, 2 Jan 2015 19:57:19 -0800 [View Commit](../../commit/fbbee57788c71102fc03221c68d5074831cfbf60)
* KULRICE-14083 isCurrentQuestionnaire refactor
  * cniesen on Tue, 23 Dec 2014 16:56:34 -0600 [View Commit](../../commit/34e432fed87d5e0851c3a3f37283a39c29ca3831)
* KRACOEUS-8565
  * Display appointment type and salary effective date in assign personnel and edit personnel
  * Display job code in budget person dropdown
  * rmancher on Tue, 30 Dec 2014 14:14:42 -0500 [View Commit](../../commit/3275e63ce913ab45252ffc656bff71404a6329b7)
* KRACOEUS-8619: code review comments
  * Travis Schneberger on Wed, 31 Dec 2014 15:16:23 -0500 [View Commit](../../commit/088a90a4a4d848e3ee7d8cdc76b71aec2ae57bf5)
* KRACOEUS-8545 - Upgrade rice to get KIM caching, some changes on KC auth to take advantage of cache
  * jkneal on Wed, 31 Dec 2014 13:14:54 -0500 [View Commit](../../commit/1a04c9773a3bacfab0e8144f6bc951b185d6bca2)
* KRACOEUS-8621: adding missing rice location views
  * Travis Schneberger on Wed, 31 Dec 2014 13:11:02 -0500 [View Commit](../../commit/f3e178ebf41590d695fbcbe98ad5a286a63f3de9)
* KRACOEUS-8619: fixing rule for non-mandatory questionnaires
  * Travis Schneberger on Wed, 31 Dec 2014 10:49:27 -0500 [View Commit](../../commit/0e08e8cd82fc62d6a73224b80248026f271e7188)
* KFSTI-670 : CGB Sponsor Changes Merged
  * blackcathacker on Tue, 30 Dec 2014 11:46:42 -0800 [View Commit](../../commit/6b8a42af37c2498b99577ec5c0e59f8b9392ad90)
* [KRACOEUS-8609][KRACOEUS-8610] Redirect back to krad portal fix
  * bsmith83 on Tue, 30 Dec 2014 11:55:12 -0800 [View Commit](../../commit/76ca6d3e5956160fc5dd3f5fdca5931e101de168)
* KFSTI-670 KC-CGB Merge

  * KFSTI-672 apply Java/resource/web changes
  * KFSTI-673 add new db files
  * pulling in KC CGB functionality from overlay project
  * KFSTI-689 Make FrequencyDTO Serializable
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-681 cleanup sponsor annotations
  * KFSTI-673 add new db files
  * KFSTI-686 Fixing version of StringUtils
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-668 Replace usage of KualiDecimal
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-668 Replace usage of KualiDecimal
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-699 Change hardcoded valuesfinder to an enum
  * KFSTI-688 refactor AwardAccountDtoService
  * KFSTI-706 Get KC to start
  * KFSTI-680 refactor SponsorWebServiceImpl
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * KFSTI-673 add new db files
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-668 Replace usage of KualiDecimal
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-670 add new java/resource/web files
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-693 Use AwardCGB directly, which should be more limiting
  * KFSTI-672 apply Java/resource/web changes
  * KFSTI-673 add new db files
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-668 Replace usage of KualiDecimal
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-699 Change hardcoded valuesfinder to an enum
  * KFSTI-693 use limited lookup to find matching awards
  * KFSTI-670 add new java/resource/web files
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-670 add new java/resource/web files
  * KFSTI-672 apply Java/resource/web changes
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-670 add new java/resource/web files
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * KFSTI-687: move proposal id lookup to a dao, where a sql projection can occur
  * KFSTI-693 AwardWebServiceImpl refactoring
  * Make sure that records are not active
  * Turn off active report record
  * create sponsor maint doc rule, based on Doug's work
  * KFSTI-689 Make FrequencyDTO Serializable
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-698 do not swallow exception
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-681 cleanup sponsor annotations
  * KFSTI-689 Make FrequencyDTO Serializable
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-698 do not swallow exception
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-681 cleanup sponsor annotations
  * KFSTI-688 refactor AwardAccountDtoService
  * KFSTI-706 Get KC to start
  * KFSTI-689 Make FrequencyDTO Serializable
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-698 do not swallow exception
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-681 cleanup sponsor annotations
  * KFSTI-670 add new java/resource/web files
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-688 refactor AwardAccountDtoService
  * KFSTI-706 Get KC to start
  * KFSTI-680 refactor SponsorWebServiceImpl
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * KFSTI-680 refactor SponsorWebServiceImpl
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * KFSTI-693 Use AwardCGB directly, which should be more limiting
  * KFSTI-693 use limited lookup to find matching awards
  * Make sure that records are not active
  * KFSTI-689 Make FrequencyDTO Serializable
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-698 do not swallow exception
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-681 cleanup sponsor annotations
  * KFSTI-673 add new db files
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-688 refactor AwardAccountDtoService
  * KFSTI-706 Get KC to start
  * KFSTI-680 refactor SponsorWebServiceImpl
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * KFSTI-670 add new java/resource/web files
  * KFSTI-672 apply Java/resource/web changes
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-670 add new java/resource/web files
  * KFSTI-673 add new db files
  * KFSTI-677 fix compilation errors
  * KFSTI-694 Removed SponsorSpecial* DD files
  * KFSTI-692 remove unnecessary sql script
  * KFSTI-695 merge repository-award-cgb.xml changes into repository-award.xml
  * KFSTI-713 eliminate PublicAwardLookupableHelperServiceImpl
  * Turn off active report record
  * create sponsor maint doc rule, based on Doug's work
  * fix compilation errors from big rebase
  * fix one more start up error
  * Add back getters/setters on sponsor
  * bhutchinson on Mon, 15 Dec 2014 09:35:44 -0500 [View Commit](../../commit/e8eef85060190e831b14053cd79ee6e1b35e6dee)
* KRACOEUS-8480 : Code review comments
  * blackcathacker on Tue, 30 Dec 2014 10:36:11 -0800 [View Commit](../../commit/851b0ea8305a953fa99c749354be6272ebe16f49)
* KRACOEUS-8274 : Extra padding for select
  * blackcathacker on Mon, 29 Dec 2014 17:23:16 -0800 [View Commit](../../commit/870d2b45652b3f39b0e0fbb6141e79ddc8c387f1)
* KRACOEUS-8480 : Fix and merge shared budget actions
  * blackcathacker on Mon, 29 Dec 2014 15:40:20 -0800 [View Commit](../../commit/6894656584fb95cd5c8b6794f0871b4826bed860)
* [KRACOEUS-8612] Missing actions for committee schedules
  * bsmith83 on Mon, 29 Dec 2014 15:45:46 -0800 [View Commit](../../commit/2ba94d1cfad7f6f835d56fa9e98e486caf6daa46)
* KRACOEUS-8608
  * Revert changes
  * rmancher on Mon, 29 Dec 2014 16:10:18 -0500 [View Commit](../../commit/caab3bb56f14cbdd2ca359e5ed42a6204683e613)
* KRACOEUS-8608
  * Fix for attachment wiped out
  * rmancher on Mon, 29 Dec 2014 15:15:31 -0500 [View Commit](../../commit/b1be9a4c8929fa01e7d54ddca212c9dcfeef2da7)
* KRACOEUS-8614: reverting sprint 12
  * Travis Schneberger on Mon, 29 Dec 2014 13:14:30 -0500 [View Commit](../../commit/f58b5081609e56e002778e191e802d3901c64f72)
* KRACOEUS-8551:fixes STE where we try to delete and add a budget person in the same transaction
  * Joe Williams on Fri, 19 Dec 2014 16:48:28 -0600 [View Commit](../../commit/e4a5e9a0a04df651a7abb4d97055a4901786beaa)
* KRACOEUS-8556: Refreshing document pessimistic locks to make sure the document is in sync with the db.
  * jamey-rsmart on Thu, 18 Dec 2014 12:50:26 -0700 [View Commit](../../commit/3d92311c44b8d6a4748191afdb4fc7ff1bf30f24)

##coeus-6.0.0-s12
* KRACOEUS-8614: sprint 12
  * Travis Schneberger on Mon, 29 Dec 2014 12:48:00 -0500 [View Commit](../../commit/d119b377a6000b5cdfed745418a27084f14afee0)
* KRACOEUS-8482 & KRACOEUS-8587 the indicator setting needs to do it all the time
  * Jay Hulslander on Sun, 28 Dec 2014 09:14:05 -0500 [View Commit](../../commit/8bfc35e7241d69b7ec65f2159906f93efac3422a)
* KRACOEUS-8578
  * Display rates grouped by rate class
  * rmancher on Fri, 26 Dec 2014 14:09:52 -0500 [View Commit](../../commit/421f9d731ee43d2a2d664ac276edde9382e42154)
* KRACOEUS-8607
  * Fix issue related to Employee and non-employee search
  * rmancher on Fri, 26 Dec 2014 10:25:57 -0500 [View Commit](../../commit/e34eea49182a1f3c96e3fe6558fa4ff4adc880b3)
* [KRACOEUS-8476] Fix for potential duplicate ids for dynamically requested/generated dialogs within the View
  * bsmith83 on Tue, 23 Dec 2014 17:00:59 -0800 [View Commit](../../commit/a889d180c7f738235f053d50542017864afe1e91)
* KRACOEUS-8570
  * Add budget validation missing requirement
  * Display audit rules once validation is turned on
  * Validation budget complete - if audit rule exists, do not allow to complete budget
  * rmancher on Tue, 23 Dec 2014 14:35:08 -0500 [View Commit](../../commit/1b1d6faad6f732c6f0c51ef75b48e6b6bb18c00b)
* KRACOEUS-8482 and KRACOEUS-8587 verifying indicator fields before trying to route
  * Jay Hulslander on Tue, 23 Dec 2014 08:39:39 -0500 [View Commit](../../commit/f45e64b78d403e268b08c122f54cd0cf938d5510)
* KRACOEUS-8606: fixing bugs from field rename
  * Travis Schneberger on Tue, 23 Dec 2014 13:04:08 -0500 [View Commit](../../commit/0ae28d87f7cfe08bd0d1182733d5e234bf4d411f)
* KRACOEUS-8604: handling the usecase for adding a new budget period when there isn't any existing periods to base period id from and compare dates
  * Travis Schneberger on Mon, 22 Dec 2014 17:03:04 -0500 [View Commit](../../commit/c5034a28eb6a4f71fe25b953a746a1149e1c5a05)
* [KRAFDBCK-11079] Read only style fixes
  * bsmith83 on Mon, 22 Dec 2014 13:44:52 -0800 [View Commit](../../commit/7d3bc97a06e5665832880519cfbaaaf802b16b33)
* KRACOEUS-8482 adding degug logging.  The associated Jira only happens on servers
  * Jay Hulslander on Mon, 22 Dec 2014 16:15:22 -0500 [View Commit](../../commit/242f8c8f41eacc1d5e8d77a05a54c04be16b315a)
* KRACOEUS-8599: sending information to lookupable about whether the lookup is for IP
  * Travis Schneberger on Mon, 22 Dec 2014 12:09:58 -0500 [View Commit](../../commit/91bf89bdcefdda5ca041f824a712bb162eda708c)
* fixing non-destructive NPE
  * Jay Hulslander on Mon, 22 Dec 2014 10:43:29 -0500 [View Commit](../../commit/86a2c49413c2a767336cf217ad201bb06a61eec9)
* KRACOEUS-8598: rice upgrade
  * Travis Schneberger on Mon, 22 Dec 2014 10:21:36 -0500 [View Commit](../../commit/0a5cbf956da78ecbf94e8a35a0ded8d89716d950)
* KRACOEUS-8597 showInactiveLine is not a valid param
  * Jay Hulslander on Mon, 22 Dec 2014 09:20:41 -0500 [View Commit](../../commit/2d1ec290fdedf1df7a92a7e2ef0889ff88e257f6)
* [KRAFDBCK-11252] Added missing inquiries for organizations and sites
  * bsmith83 on Fri, 19 Dec 2014 17:28:54 -0800 [View Commit](../../commit/894b78c89d509b32feb4e512300f428a78a59b28)
* KRACOEUS-8581 Award Budget: Rejections create STE
  * Shoj on Fri, 19 Dec 2014 16:44:00 -0500 [View Commit](../../commit/15f2e6ec94210bff4ec03509e29cfb61d9f7c811)
* KRACOEUS-8580: Close only pess locks owned by current user
  * Chuck Tharp on Fri, 19 Dec 2014 10:17:07 -0500 [View Commit](../../commit/29163e978d790f58ed8d69d9b50c9a60e352b069)
* KRACOEUS-8569
  * Fix unable to update personnel summary line item
  * Also fix additional issue found while testing calculate.
  * Enable validation.
  * rmancher on Fri, 19 Dec 2014 11:04:43 -0500 [View Commit](../../commit/3ee71fa81987611706d0cc0507a60869592840ee)
* KRACOEUS-8534: added logic to check for permissions on child before adding to hierarchy in parent
  * Joe Williams on Fri, 19 Dec 2014 09:58:47 -0600 [View Commit](../../commit/51b21388192485031409bedef234fa69a9d3448b)
* KRACOEUS-8589: make internal attachment type editable on collection, so that required fields are caught client side
  * Joe Williams on Fri, 19 Dec 2014 09:10:48 -0600 [View Commit](../../commit/4f6294e429be531e0bc56706bb4fbc8a9536187e)
* KRACOEUS-8550: removing explicit member from derived role
  * Travis Schneberger on Fri, 19 Dec 2014 09:56:44 -0500 [View Commit](../../commit/11f7d31a577fad8d8e52668648a9c132865cc18a)
* KRACOUES-8573:fixed NPE on adding personnel attachment
  * Joe Williams on Fri, 19 Dec 2014 08:20:33 -0600 [View Commit](../../commit/9c77b2ee02b3901d78fd0b37eb8d149a520bb7ea)
* KRACOEUS-8575:added validation to check if parent is locked before allowing syncing from child proposal
  * Joe Williams on Thu, 18 Dec 2014 15:36:10 -0600 [View Commit](../../commit/a25d8ae33339f6b9ad07c4c6e23a0f49384a791a)
* KRACOEUS-8584: creating a modular budget doesn't create the period modular budget
  * Travis Schneberger on Thu, 18 Dec 2014 12:53:27 -0500 [View Commit](../../commit/d4e7de932177e5cb8bf573fa0a7ce4bbbb0a95c0)
* KRACOEUS-8452: Fixing missing properties.
  * jamey-rsmart on Thu, 18 Dec 2014 17:43:32 -0700 [View Commit](../../commit/a0b8d5cb753c1f84fd3b709efd8d9a89787044f9)
* [KRACOEUS-8519] pom fixes
  * bsmith83 on Thu, 18 Dec 2014 11:10:37 -0800 [View Commit](../../commit/9c05da75771960b47de1fbab330a8012ea1a8d14)
* KRACOEUS-8573:fix to display person names on personnel attachment in parent proposals
  * Joe Williams on Thu, 18 Dec 2014 12:58:54 -0600 [View Commit](../../commit/37bbdfd03bd70dcd732f4084136ea8cbd8195bd1)
* KRACOEUS-8507
  * “SravanVed” on Wed, 17 Dec 2014 11:05:42 -0500 [View Commit](../../commit/4ced1f5df7956ae341682fad26144294bda8ce30)
* KRACOEUS-7696 : Create Budget Versions Print Action  * sasipolus on Thu, 18 Dec 2014 15:24:51 +0530 [View Commit](../../commit/9af3142d8f155fc32148010b600814ed00a467cf)
* [KRACOEUS-8577] Remove more workaround code that now has fixes from rice
  * bsmith83 on Wed, 17 Dec 2014 16:53:13 -0800 [View Commit](../../commit/ce465268fab121722feb4ec005f61809e39877b7)
* KRACOEUS-8561 STE when submitting proposal s2s with compliance
  * Shoj on Wed, 17 Dec 2014 18:53:15 -0500 [View Commit](../../commit/597d0cc2c0f2a350aae57bb632e665d0f44f5011)
* KULRICE-14084 Improvements for Key Personnel Search Rendering. Changed to use lighttable
  * Sona Sona on Wed, 17 Dec 2014 14:58:32 -0800 [View Commit](../../commit/d4099ca5e91a9780858cc67376f27520c80ba0fa)
* KRACOEUS-8859:budget pessimistic locking
  * Joe Williams on Wed, 17 Dec 2014 09:24:58 -0600 [View Commit](../../commit/f2c58c07a5dd299db8c604eddf3b3c06189b1d1f)
* KRACOEUS-8524
  * Fix for person biography attachment
  * rmancher on Wed, 17 Dec 2014 16:57:16 -0500 [View Commit](../../commit/60f9c8e88fd250e7269d64080c269cef138440d7)
* KRACOEUS-8308: Adding links in Medusa.  Adding ability to navigate to PD's Notes tab in the Attachments Page.
  * jamey-rsmart on Mon, 24 Nov 2014 09:41:33 -0700 [View Commit](../../commit/b747c65b8e7b629571d16591b24be004913cdb9f)
* [KRACOEUS-8543] Ad hoc dialog and ad hoc service fixes
  * bsmith83 on Wed, 17 Dec 2014 10:15:32 -0800 [View Commit](../../commit/5312c6f2e204941e6b587773e49795e32a0f597f)
* KRACOEUS-8567: fixing rolodex constraint violation
  * Travis Schneberger on Wed, 17 Dec 2014 10:11:28 -0500 [View Commit](../../commit/113fbc6373d1600c05c0815aa71c7c4e37e0bfd9)
* KRACOEUS-8502:fixed concurrent mod exception on copy
  * Joe Williams on Wed, 17 Dec 2014 08:05:23 -0600 [View Commit](../../commit/bac045b123eb684afa6183af0f8ea244ae7e6201)
* KRACOEUS-8536: Formatting the menu.
  * jamey-rsmart on Tue, 16 Dec 2014 21:21:57 -0700 [View Commit](../../commit/b506fb7a75ca8472f2c08723fc016fb9fda6dad2)
* KRACOEUS-8332 : Use returnByScript for subaward org quickfinder
  * blackcathacker on Tue, 16 Dec 2014 18:30:15 -0800 [View Commit](../../commit/be3402f624af0cc7954641ca10b31e8ead712dd2)
* KRACOEUS-8325
  * Fix for Cost Limit alerts are not appearing in the Personnel and Non-Personnel
  * rmancher on Thu, 11 Dec 2014 11:01:50 -0500 [View Commit](../../commit/181fc01e13d9bf84af31928ae5ca823152895204)
* KRACOEUS-8524
  * Fix for proposal hierarchy view attachment file in parent.
  * rmancher on Tue, 16 Dec 2014 17:37:59 -0500 [View Commit](../../commit/b7c893378376bd8629087360eda80a971e8ab059)
* KRACOEUS-8521 : Clear direct cost when copying only first period

  * Additionally use ScaleTwoDecimal.ZERO instead of new ScaleTwoDecimal(0.0)
  * blackcathacker on Tue, 16 Dec 2014 16:26:21 -0800 [View Commit](../../commit/c498755a3b0a640e0f7495aa0af3bcb89aecc5b6)
* KRACOEUS-8552 : Make some setting fields editable for parent budgets
  * blackcathacker on Tue, 16 Dec 2014 16:18:46 -0800 [View Commit](../../commit/1f753d1a0ccac50b80972e199e17c385b8058e12)
* KRACOEUS-7536:allow concurrent modification to persist without optimistic locking
  * Joe Williams on Mon, 8 Dec 2014 16:25:31 -0600 [View Commit](../../commit/4e3c6a9c40b4c5b3580f22a5ac81395b94386746)
* KRACOEUS-8566 cleaning up question
  * Jay Hulslander on Tue, 16 Dec 2014 15:43:37 -0500 [View Commit](../../commit/d569635d714ef58e6e12517dec13700b15e3f646)
* KRACOEUS-8553 Protocol number not saved on ADD of Human Subjects or Animals Compliance when linking not enabled
  * Shoj on Tue, 16 Dec 2014 14:29:02 -0500 [View Commit](../../commit/adda086e00759cd7e0578b29a90d06e6c7d3bfcd)
* KRACOEUS-8541:only deletes budget periods if they have lineitems from child budgets
  * Joe Williams on Tue, 16 Dec 2014 10:30:12 -0600 [View Commit](../../commit/299d4c8d5a6bb2666c94fe46080798f1e6325b68)
* KRACOEUS-8257
  * Validate budget period add row after add line dialog fix and
  * update error messages
  * rmancher on Mon, 15 Dec 2014 12:29:34 -0500 [View Commit](../../commit/1aace45af4778281a8bc9240808b0385d534d3a3)
* KRACOEUS-8563
  * Add confirmation dialog and apply rules
  * for delete project personnel
  * rmancher on Tue, 16 Dec 2014 11:15:12 -0500 [View Commit](../../commit/a00b24e8ea8149191b02c14503535b887a3f978e)
* KRACOEUS-8531:filter f&a rate collection base on f&a rate class of budget
  * Joe Williams on Tue, 16 Dec 2014 10:47:25 -0600 [View Commit](../../commit/4ac3fac56575cd255a47f571a622a7ce43c84a92)
* KRACOEUS-8502:fix duplicate pk error on copy
  * Joe Williams on Thu, 11 Dec 2014 09:50:10 -0600 [View Commit](../../commit/da12cda372d99f750f4026eaa3b34f62ec9177fd)
* KRACOEUS-8542: STE upon clicking Calculate Current Period
  * Chuck Tharp on Tue, 16 Dec 2014 11:30:10 -0500 [View Commit](../../commit/3102b84dbd6908dd0deb6e85178c9a73e4e0be91)
* Update KC_DML_01_KRACOEUS-8454_B000.sql  * Travis Schneeberger on Tue, 16 Dec 2014 09:48:08 -0500 [View Commit](../../commit/5392267db7e5b80b1dcbd042d7d82979ccab58c6)
* KRACOEUS-8552 : Use budget type code when creating hierarchy
  * blackcathacker on Mon, 15 Dec 2014 23:10:50 -0800 [View Commit](../../commit/aa617615307dfa58f5db9ba46cfa4215f5a5a0ee)
* Update KC_DML_01_KRACOEUS-8454_B000.sql  * Travis Schneeberger on Mon, 15 Dec 2014 20:47:58 -0500 [View Commit](../../commit/87731e8459abce2049caeb0d8ed6e866d7ccab62)
* KRACOEUS-8546
  * Fix Assign personnel duplicate error message in edit mode
  * rmancher on Mon, 15 Dec 2014 16:33:52 -0500 [View Commit](../../commit/85d513358c5695c5bd6202cd58b070e82fa78b25)
* KRACOEUS-8535: speeding up PD search in order to address hierarchy issues.
  * Travis Schneberger on Mon, 15 Dec 2014 17:49:50 -0500 [View Commit](../../commit/58501f1200f26f0540b56d3629c35335aab4cd0a)
* KRACOEUS-8541:allow child proposals with different budget dates
  * Joe Williams on Mon, 15 Dec 2014 16:45:23 -0600 [View Commit](../../commit/0975a42b9356d9aa2daf3b10ebe55d667cb6be1c)
* KRACOEUS-8454 Notifications are not being sent when prompt user = N and modal doesn't appear
  * Shoj on Mon, 15 Dec 2014 17:18:30 -0500 [View Commit](../../commit/cd3930d64801dc67d226b702d093a0e33efc9aa9)
* KRACOEUS-8539 - Change name of transactionManager import from Rice
  * Added transaction handler interceptor
  * Upgrade Rice to 2.5.2-r49339
  * jkneal on Mon, 15 Dec 2014 10:12:16 -0500 [View Commit](../../commit/105c32169e9700ae6dd0781da3b206eadeb733f2)
* [KRAFDBCK-11969][KRACOEUS-8519] Fixed portal that is returned to for krad portal links
  * bsmith83 on Fri, 12 Dec 2014 18:24:26 -0800 [View Commit](../../commit/b986060fc7a68476380e821c07b04302371a1cd3)
* KRACOEUS-8478 : Adding non numerical amount to Modular F&A modal
  * yyuan1 on Fri, 12 Dec 2014 13:29:36 -0500 [View Commit](../../commit/7e5fffd92141f9eb2f2080b162dfabb309c76281)

##coeus-6.0.0-s11
* KRACOEUS-8557: sprint 11
  * Travis Schneberger on Mon, 15 Dec 2014 21:00:22 -0500 [View Commit](../../commit/7b1f79b79f69c4cb4d0487c57f36ff1acc4d50d0)
* KRACOEUS-8547 removing bad space
  * Jay Hulslander on Mon, 15 Dec 2014 12:59:33 -0500 [View Commit](../../commit/6f0c8b083c241985c97daf2ec85d19861b36d9a5)
* KRACOEUS-8395: Allows PD to link to IRB from IRB page.
  * jamey-rsmart on Wed, 26 Nov 2014 16:33:38 -0700 [View Commit](../../commit/24e788d0d2254ab5f819a5b091c29b8657a045fd)
* KRACOEUS-8522: ProposalBudgetForm now implements Auditable.
  * jamey-rsmart on Fri, 12 Dec 2014 13:34:34 -0700 [View Commit](../../commit/75e80312d9983993242486b2cd21ad878b1348ae)
* KRACOEUS-8534:added validation to check if user is aggregator on parent before linking a child to a parent
  * Joe Williams on Fri, 12 Dec 2014 14:33:16 -0600 [View Commit](../../commit/06d927a179289bef5d5687db3412cb055f36d3ac)
* KRACOEUS-8538:fixed duplicate keywords created on sync
  * Joe Williams on Fri, 12 Dec 2014 13:18:26 -0600 [View Commit](../../commit/d1bc9cdaf9d05cdbc126ab3eea7a06ae22911099)
* KRACOEUS-8489 S2S Opportunity: 'Create PDF' or print prompts user to confirm that they want to leave page or stay on page
  * Shoj on Fri, 12 Dec 2014 13:55:59 -0500 [View Commit](../../commit/f0919e6c5e4a171fe9240a176afcdc60150b088a)
* KRACOEUS-8304
  * Non personnel cost - adjust on off flag based on budget settings
  * rmancher on Fri, 12 Dec 2014 13:04:34 -0500 [View Commit](../../commit/e6758df68731459e34a5709464c52739daf5c37a)
* KRACOEUS-8485 PD UXI: Have to select 'Leave Page' to get form to print from Print in Proposal Tool Bar
  * Shoj on Fri, 12 Dec 2014 12:48:52 -0500 [View Commit](../../commit/20791666d5fd0d99e38748d945f202d9c6a7c9d9)
* KRACOEUS-8540: moving controller methods to the proper place
  * Travis Schneberger on Fri, 12 Dec 2014 12:48:10 -0500 [View Commit](../../commit/6abdc117bf218d358f403a96c871ac661e63372c)
* KRACOEUS-8537:makes budgets of parent proposals read only
  * Joe Williams on Fri, 12 Dec 2014 08:45:15 -0600 [View Commit](../../commit/a25eedb9593d04f89c759ccad8acab3a00d9e7b8)
* KRACOEUS-8454: reverting PR #1254 to fix the db export job
  * Travis Schneberger on Fri, 12 Dec 2014 07:49:59 -0500 [View Commit](../../commit/09b7b6ac7736b08bee328bce9e445e7e9ce7cb84)
* KRACOEUS-8534:remove hierarchy actions if user doesn't have permission
  * Joe Williams on Thu, 11 Dec 2014 16:55:50 -0600 [View Commit](../../commit/3239fbac6cee245c75c02a1518826d6aec2dfec9)
* Update KC_DML_01_KRACOEUS-8454_B000.sql  * Travis Schneeberger on Thu, 11 Dec 2014 17:53:33 -0500 [View Commit](../../commit/2c441f7513cc8b8bc150e32b8ec245a29a6e54ed)
* Update KC_DML_01_KRACOEUS-8454_B000.sql  * Travis Schneeberger on Thu, 11 Dec 2014 17:52:44 -0500 [View Commit](../../commit/335035a65f1ede2dfa0008016b3fc3d7d9f31d4c)
* KRACOEUS-8533:added missing info to proposal budget summary
  * Joe Williams on Thu, 11 Dec 2014 16:03:45 -0600 [View Commit](../../commit/ae18506476c2f61d68bd2de24d4050c60916c5c0)
* KRACOEUS-8532:changed activity type field label in hierarchy summary
  * Joe Williams on Thu, 11 Dec 2014 15:12:03 -0600 [View Commit](../../commit/cf70533343a79ed9d06431417c99bd9c983325bf)
* KRACOEUS-8531:added F&A rates to proposal budget summary
  * Joe Williams on Thu, 11 Dec 2014 14:50:50 -0600 [View Commit](../../commit/fec138398f1df4dcaf04b3ea6b2845f5e0f94edc)
* KRACOEUS-8324: restoring rule logic that was broken from KRACOEUS-7937
  * Travis Schneberger on Thu, 11 Dec 2014 15:42:46 -0500 [View Commit](../../commit/c3e1890196336e45360c2433609b039a734bb788)
* KRACOEUS-8458 cleaning up inactivation flag.  This should improve consistency, and maybe perf.
  * Jay Hulslander on Thu, 11 Dec 2014 14:08:48 -0500 [View Commit](../../commit/66da280803623724aef30e02d5165ade1ffebfc7)
* [KRACOEUS-8530][KRACOEUS-8374] Override and fixes for add line dialog fixes, also reversion of attachment fix to be in line with the fix in rice, correct file returned for subaward
  * bsmith83 on Thu, 11 Dec 2014 10:03:54 -0800 [View Commit](../../commit/fbff6621ce1e0bdc4199d368e88bc33f0161e1cf)
* KRACOEUS-8526: fixing role initialization
  * Travis Schneberger on Thu, 11 Dec 2014 13:45:10 -0500 [View Commit](../../commit/da0d8854476d5e6a5c62b5df4b1cebf822ed1b3c)
* KRACOEUS-8173
  * Delete personnel line item fix
  * rmancher on Thu, 11 Dec 2014 13:28:52 -0500 [View Commit](../../commit/c5241027a3b4cafac256dad215dc3151044c4ff3)
* KRACOEUS-8527:fixed ftl error on creditsplits for manually added units
  * Joe Williams on Thu, 11 Dec 2014 11:50:53 -0600 [View Commit](../../commit/58678f5b2dce0d10a9ce7a4ee228cfa5458654af)
* KRACOEUS-8529:budget summary panel will only display if parameter is set
  * Joe Williams on Thu, 11 Dec 2014 10:29:26 -0600 [View Commit](../../commit/b7c5b612c35fcc519d682744a322110c631c9a1f)
* KRACOEUS-8508: PD Cert can be completed as child in hierarchy
  * Chuck Tharp on Thu, 11 Dec 2014 11:53:54 -0500 [View Commit](../../commit/44ce4da4aa8a81bd7b3c2e50bb032f74819c23a9)
* KRACOEUS-6727 BudgetCategoryServiceImpl.lookupBudgetCategories() looks incorrect
  * Shoj on Thu, 11 Dec 2014 10:01:17 -0500 [View Commit](../../commit/5c7d3ea802e8c80135bb5db88290c5247f85acda)
* KRACOEUS-8507
  * “SravanVed” on Wed, 10 Dec 2014 21:55:24 -0500 [View Commit](../../commit/1c0eae715dd74484f57cab6ba1a7464bfd28a6cb)
* KRACOEUS-8448
  * Fix QuestionnairePrintingServiceTest  * greeshma on Thu, 11 Dec 2014 14:10:29 +0530 [View Commit](../../commit/1448e8200a24a4d1b71461f38d1cfe0414e2de41)
* KRACOEUS-8391: removing line that nulls out budgetPerson
  * Travis Schneberger on Wed, 10 Dec 2014 20:10:39 -0500 [View Commit](../../commit/83944e68962eba927c7a878e72392b2f849c55fb)
* KRACOEUS-8067:removed sync links from hierarchy summary
  * Joe Williams on Wed, 10 Dec 2014 16:54:40 -0600 [View Commit](../../commit/c72fbfa91881c46a4d054c32d5354253318735aa)
* KRACOEUS-8504:display latest budget version in budget summary if no final budget is selected
  * Joe Williams on Wed, 10 Dec 2014 16:40:48 -0600 [View Commit](../../commit/9d415dfaea9f4e17d2bb2b395a86663848445882)
* KRACOEUS-8357 fixing new bug that is associated with award budget personnel
  * Jay Hulslander on Wed, 10 Dec 2014 15:46:18 -0500 [View Commit](../../commit/d66b592df14dd341d229c5d270c5ac8223c19f32)
* KRACOEUS-8520: Trimming the value before it goes into UifBooleanEditor.setAsText method. This should fix the trailing space issue.
  * jamey-rsmart on Wed, 10 Dec 2014 11:36:24 -0700 [View Commit](../../commit/1b8ca766152b99834adbea9d3061707495ee4c7f)
* KRACOEUS-8486
  * “SravanVed” on Tue, 9 Dec 2014 22:48:05 -0500 [View Commit](../../commit/ab814c73c0236ac17bc8928496cef6aab562a42b)
* KRACOEUS-8510 : project income save button STE
  * yyuan1 on Tue, 9 Dec 2014 22:07:14 -0500 [View Commit](../../commit/8ef0fbf1d72b76a57d408290b6a0225c77e58f29)
* KRACOEUS-8487: Added the ability to keep audit activated between Prop dev and Prop Budget forms.
  * jamey-rsmart on Tue, 9 Dec 2014 13:20:30 -0700 [View Commit](../../commit/683aab5324a686ee678b367a543bd5a2e6fe5244)
* KRACOEUS-8484: Put notifications in correct page.
  * jamey-rsmart on Tue, 9 Dec 2014 17:01:08 -0700 [View Commit](../../commit/089f194e7764c37d1d02f061590e22bba1f99528)
* KRACOEUS-8474: removing bad annotation
  * Travis Schneberger on Tue, 9 Dec 2014 18:02:49 -0500 [View Commit](../../commit/52f98f17ef0fabdd30b95f37b9150f469bdb3ef4)
* KRACOEUS-8397:fixed issue of attachment file not being copied on proposal copy action
  * Joe Williams on Tue, 9 Dec 2014 10:01:59 -0600 [View Commit](../../commit/39ce70225e06b475ce6b9033b121c6187bcc990c)
* KRACOEUS-8515: fixing relationship of sponsor to rolodex.  Improving suggest query
  * Travis Schneberger on Tue, 9 Dec 2014 16:34:49 -0500 [View Commit](../../commit/5da60f42550cba92063589bdca7b1b9e768059b8)
* KRACOEUS-8502:temp fix for proposal copy
  * Joe Williams on Tue, 9 Dec 2014 15:36:32 -0600 [View Commit](../../commit/0151b2fb79c1f9adaba1406bbc0349c43a25ffba)
* KRACOEUS-8483
  * “SravanVed” on Tue, 9 Dec 2014 10:25:28 -0500 [View Commit](../../commit/dfcafc4a8a59daee153cc5c72ec59df4b55bd5e1)
* KRACOEUS-8454 Notifications are not being sent when prompt user = N and modal doesn't appear
  * Shoj on Tue, 9 Dec 2014 14:45:40 -0500 [View Commit](../../commit/af79504fcdfd6c11890a1ea40bd8c994bc966bd6)
* KRACOEUS-8447  Fix ProposalHierarchyServiceImplTest  * anithapolus on Thu, 4 Dec 2014 16:38:18 +0530 [View Commit](../../commit/9275e2e709a844f74e4d43219a2037298a11d910)
* KRACOEUS-8474
  * Budget project personnel validation.
  * Verify project personnel and summary personnel
  * Enable duplicate person validation.
  * rmancher on Fri, 5 Dec 2014 15:46:50 -0500 [View Commit](../../commit/337a721ce85be487e4668ba7ae3ffdd9574e5dd8)
* KRACOEUS-8427: fixing embedded mode for the route log
  * Travis Schneberger on Tue, 9 Dec 2014 10:37:30 -0500 [View Commit](../../commit/887051bdb39c10919fdc995ffd5803069b25c9c7)
* KRACOEUS-8490: better exception handling, other minor cleanup
  * Travis Schneberger on Tue, 9 Dec 2014 10:25:49 -0500 [View Commit](../../commit/2cd995b3c4b31c49f06cb9a5be86bf063b20a5db)
* KRACOEUS-8493
  * Compliance are editable when Proposal is in View mode
  * rmancher on Mon, 8 Dec 2014 18:05:38 -0500 [View Commit](../../commit/4436806acf76b565da920bc2f895209f7387b80c)
* KRACOEUS-8425: Adding the ability to link IACUC funding sources so they show up in Medusa.
  * jamey-rsmart on Fri, 5 Dec 2014 16:20:11 -0700 [View Commit](../../commit/c496d8f8ae1b3c81adeb6bf74672fb96c5903c63)
* KRACOEUS-8484: Adding message sayingg the notification was sent.
  * jamey-rsmart on Mon, 8 Dec 2014 13:07:18 -0700 [View Commit](../../commit/2425735eed42480f32a52a1db5d0ded351f9519a)
* KRACOEUS-8411
  * “SravanVed” on Mon, 8 Dec 2014 15:37:59 -0500 [View Commit](../../commit/046f5deddc5a7429fe7cd1891f701e0b4101b88b)
* KRACOEUS-7572
  * “SravanVed” on Fri, 5 Dec 2014 10:35:06 -0500 [View Commit](../../commit/74fea8d97a5ef2be0e5308566ed9b0c116945fbe)
* KRACOEUS-8067:added budget summary to submit page

  * changes
  * Joe Williams on Fri, 5 Dec 2014 15:46:27 -0600 [View Commit](../../commit/7d68a1c1e7d46f22d29d1667f36440432621750b)
* KRACOEUS-8482 fixing logic to determine if resubmission page should be displayed
  * Jay Hulslander on Mon, 8 Dec 2014 10:18:39 -0500 [View Commit](../../commit/ed6370646d26f8467084f6697ea55b1e26da9b87)
* KRACOEUS-7669 : Copy all or only first budget period
  * blackcathacker on Sun, 7 Dec 2014 20:40:40 -0800 [View Commit](../../commit/49fac28d1835089e325f7b1a0b890117ca21d1fb)
* [KRACOEUS-8479] Convert non-full date to full date on loss of focus in js
  * bsmith83 on Fri, 5 Dec 2014 16:34:28 -0800 [View Commit](../../commit/7d68d53d3ad32b8c1e6a301a8c5a038e0d0f89f6)
* KRACOEUS-8452: Added missing IP properties in Medusa.
  * jamey-rsmart on Fri, 5 Dec 2014 15:46:20 -0700 [View Commit](../../commit/dcd37f0e1b1fb01e5caff8f7cb33c3d49d88317c)
* KRACOEUS-8443: documentation
  * Travis Schneberger on Fri, 5 Dec 2014 16:07:51 -0500 [View Commit](../../commit/0f217580cb3446e39cfeaa28b2a0a588d5899223)
* KRACOEUS-8443: adding transactions to controllers, fiing pessimistic lock service for jpa
  * Travis Schneberger on Fri, 5 Dec 2014 14:43:47 -0500 [View Commit](../../commit/bfd85eae5e244d28e3c1be7b1852f2419e11a070)
* KRACOEUS-8357 fixing various problems with budget personnel and cleaning the services up
  * Jay Hulslander on Thu, 4 Dec 2014 07:54:07 -0500 [View Commit](../../commit/8f75cd443649cbeb1e7224221c45a6dcf3ef2da5)
* [KRACOEUS-8477] Reverse workarounds that are now fixed by Rice
  * bsmith83 on Fri, 5 Dec 2014 10:17:45 -0800 [View Commit](../../commit/23ac1ca43261271416d8fdfaa773db4494012439)
* KRACOEUS-8364 : Fix unit test
  * blackcathacker on Fri, 5 Dec 2014 10:17:13 -0800 [View Commit](../../commit/3ed5eb21c7ef65bcc0d445ca1360996a8c31cee9)
* changes
  * Joe Williams on Fri, 5 Dec 2014 10:57:40 -0600 [View Commit](../../commit/ceb16a7a0e278843242c7a6e0136ed2684845374)
* KRACOEUS-5730: Rearranging comments not persisted in reviews
  * Chuck Tharp on Fri, 5 Dec 2014 10:32:06 -0500 [View Commit](../../commit/838d6b7f5105ffebdedae3f68923a3b9cedfef2a)
* KRACOEUS-7536:fixes issues with pessimistic locks not being honored
  * Joe Williams on Thu, 4 Dec 2014 16:24:09 -0600 [View Commit](../../commit/93a4f65470911a25e0fb7ad5f1cfc27f877b5bec)
* KRACOEUS-8411 Added the missing DELIMITER
  * “SravanVed” on Fri, 5 Dec 2014 10:57:53 -0500 [View Commit](../../commit/58c2d15368afde4aba0d6dfc35fb8d1643245ed7)
* KRACOEUS-8364 : Clear the line item cost when calc subaward
  * blackcathacker on Thu, 4 Dec 2014 22:56:04 -0800 [View Commit](../../commit/f8629c1d71310f1352fc9e549820a4285ee42f04)
* KRACOEUS-8394 : Change budget dropdown to display 'For Submission Version'
  * blackcathacker on Thu, 4 Dec 2014 22:39:57 -0800 [View Commit](../../commit/fed933d809081579753e006e52757508a96afc5a)
* KRACOEUS-8252 : Save the current doc before creating new budgets

  * Also make sure the add budget dialogs appear ontop of the budget versions dialog.
  * blackcathacker on Thu, 4 Dec 2014 21:50:24 -0800 [View Commit](../../commit/11557cbd18145c8a061165940e5d6d062765c83a)
* [KRACOEUS-8312] Compliance date fixes when linked
  * bsmith83 on Thu, 4 Dec 2014 17:10:53 -0800 [View Commit](../../commit/741f1a72397f2254d5840e8f3aea9ce061596d36)
* KRACOEUS-8342
  * Sync cost limit - fix incorrect event mapping and
  * cost limit validation
  * rmancher on Thu, 4 Dec 2014 19:48:02 -0500 [View Commit](../../commit/45cf6197244ea33b23c897909589721ec5ec2489)
* KRACOEUS-8475: rice upgrade and "i before e except after c"
  * Travis Schneberger on Thu, 4 Dec 2014 17:07:45 -0500 [View Commit](../../commit/60075ad19728bad15a49758bdc75baa3fcba1680)
* KRACOEUS-7865
  * Budget period business rules - update for line edit and save.
  * rmancher on Thu, 4 Dec 2014 16:33:33 -0500 [View Commit](../../commit/4a40dab396fc6b60f3504f7dfbdd5c7defa732eb)
* KRACOEUS-8370: Fixed messages not showing up on cancel.
  * jamey-rsmart on Thu, 4 Dec 2014 12:30:55 -0700 [View Commit](../../commit/5a1903569eec6d2432af31869f8abc85b1a78a54)
* KRACOEUS-8443: avoiding the creation of datasources & pools per spring context.
  * Travis Schneberger on Thu, 4 Dec 2014 13:50:46 -0500 [View Commit](../../commit/584792adb24b2a89bf45d94047da45671eb428ef)
* KRACOEUS-8330:budget summary is recreated when autocalculate periods is ran
  * Joe Williams on Thu, 4 Dec 2014 11:44:36 -0600 [View Commit](../../commit/49f480fda403ee8313368de6c8b56293cdebe643)
* KRACOEUS-8411_current_mysql
  * “SravanVed” on Wed, 3 Dec 2014 16:20:59 -0500 [View Commit](../../commit/08a8b35917c2d20db0462b2b88df53dc711276b7)
* KRACOEUS-8120
  * Fix for dialog refresh issue.
  * Adding dialog to page
  * rmancher on Wed, 3 Dec 2014 20:35:48 -0500 [View Commit](../../commit/fc460e8b69d2fbe83a1715d6bda592b55576e3b4)
* KRACOEUS-8413
  * Budget data validation
  * rmancher on Wed, 3 Dec 2014 17:35:38 -0500 [View Commit](../../commit/d5b82da8ad643b269fafb118e4207893ba90457b)
* KRACOEUS-8461
  * Fix NPE budget project personnel rule.
  * rmancher on Wed, 3 Dec 2014 19:33:25 -0500 [View Commit](../../commit/60286b6a8eb6f8390ab872dd207234ed9b28c05b)
* KRACOEUS-8362 : Budget UXI: Cost Share amount
  * yyuan1 on Wed, 3 Dec 2014 19:13:30 -0500 [View Commit](../../commit/db24e08852b8f031287daad328cc688f1d8910f7)
* KRACOEUS-8457: sprint 10, chaging version
  * Travis Schneberger on Wed, 3 Dec 2014 17:13:22 -0500 [View Commit](../../commit/1ea035525c439ff4285d47f54d8c39375e9c904d)
* KRACOEUS-8342
  * Sync to Limits - direct cost, period total fix
  * validation and sync cost.
  * rmancher on Mon, 24 Nov 2014 15:24:32 -0500 [View Commit](../../commit/a6b05ba7b20317245332a1c779f472c6d3812574)
* KRACOEUS-8411
  * “SravanVed” on Wed, 3 Dec 2014 16:20:59 -0500 [View Commit](../../commit/e04c1e774a12b7f999f9702a1108b11ff84c3c81)
* KRACOEUS-8459:fixed office phone search on key personnel
  * Joe Williams on Wed, 3 Dec 2014 14:44:51 -0600 [View Commit](../../commit/a97922359bc05f116255ec5cf98aeb7c2c3c9eaf)
* KRACOEUS-8233: Fix user attached forms when copied
  * Gayathri on Wed, 3 Dec 2014 12:51:05 -0700 [View Commit](../../commit/ca61ba797dac2ffdab19c1c6fa60ecb2cbc3e8ee)
* KRACOEUS-8064: Personnel can be duplicated when protocol amendment is approved
  * Chuck Tharp on Mon, 20 Oct 2014 15:07:47 -0400 [View Commit](../../commit/3597639028d7e01ef1e91818c36864ff0b343620)
* KRACOEUS-8299 : budget summary modal --change shortcut map
  * yyuan1 on Fri, 21 Nov 2014 23:43:00 -0500 [View Commit](../../commit/9a33b4ad832775db941e4a1f867116ece9988e38)
* KRACOEUS-8159:added create_user and create_date to budget db
  * Joe Williams on Wed, 3 Dec 2014 09:52:38 -0600 [View Commit](../../commit/fa4ecfde432259e84fce2cfe6576bc3d6d2a9b83)
* KRACOEUS-8159: updates to budget header
  * Joe Williams on Wed, 3 Dec 2014 10:31:31 -0600 [View Commit](../../commit/4599cc6e0b6a428be1346f81eec3aa8acbde1496)
* KRACOEUS-8299 : budget summary modal
  * yyuan1 on Fri, 14 Nov 2014 22:29:01 -0500 [View Commit](../../commit/5badc99fe82420daa4e686fe82baa72dbc6f915f)
* KRACOEUS-8422 Personnel: Some data editable in View mode
  * Shoj on Tue, 2 Dec 2014 18:22:22 -0500 [View Commit](../../commit/d79e5b23a94ad11be8d038ec1c0160b3050fb1fb)
* KRACOEUS-8207:added save button to detail & rates modal
  * Joe Williams on Wed, 3 Dec 2014 09:10:15 -0600 [View Commit](../../commit/d7a408af4c682b79dda4aded9338bab5fd38ae1b)
* KRACOEUS-8110: Fix IACUC Assign To Agenda Unavailable authorizer
  * Chuck Tharp on Wed, 3 Dec 2014 08:45:03 -0500 [View Commit](../../commit/25bb7fd53dace8deda2a88471ba1cd3af533f321)
* KRACOEUS-8434: Fixing create protocol button
  * Gayathri on Tue, 2 Dec 2014 18:17:36 -0700 [View Commit](../../commit/f7c8cc03da36c6e486017b73b3ca8638510a028d)
* KRACOEUS-8264:updated budget footer to align with prop dev footer
  * Joe Williams on Tue, 2 Dec 2014 13:30:26 -0600 [View Commit](../../commit/09e5bc554f98f0a3f5908bc17a5f2620b19825d8)
* KRACOEUS-8402:allow personnel budget lines for same person/object/group combo if date range is different
  * Joe Williams on Tue, 2 Dec 2014 12:19:42 -0600 [View Commit](../../commit/62363ff7ce6e9664b027b3e00b04458f5337d793)
* KRACOEUS-8383:allow narrative writers to replace narratives in workflow
  * Joe Williams on Tue, 2 Dec 2014 11:13:55 -0600 [View Commit](../../commit/3b899cb65428dbc1dbf9f3ef9bb995c0f82df0cb)
* KRACOEUS-8444: removing mock screens
  * Travis Schneberger on Tue, 2 Dec 2014 09:43:31 -0500 [View Commit](../../commit/57b4fbe7db488b9603b5e4918a5ded11592242cc)
* KRACOEUS-8423:fixed issue with krms warnings
  * Joe Williams on Mon, 1 Dec 2014 08:37:15 -0600 [View Commit](../../commit/39ce6ab0bf73290e72b4b35959aa3cc182f6f34a)
* KRACOEUS-8412
  * “SravanVed” on Tue, 25 Nov 2014 16:18:53 -0500 [View Commit](../../commit/8a0034564a6a88ff578acea0627c992dc10cfd7d)

##coeus-6.0.0-s10
* KRACOEUS-8457: sprint 10
  * Travis Schneberger on Wed, 3 Dec 2014 01:09:18 -0500 [View Commit](../../commit/2c1f1a40769418557461a24049eeb1b2b099a1f6)
* KRACOEUS-8409: Adding award and subaward links.
  * Gayathri on Tue, 2 Dec 2014 17:06:38 -0700 [View Commit](../../commit/595ef44e93c21ae677b6629ed80be6cabae6a945)
* KRACOEUS-8443: Reverting changes
  * Gayathri on Tue, 2 Dec 2014 14:15:08 -0700 [View Commit](../../commit/8a9d74bb8c07f2f0ec1c4031b5a317b0e2def634)
* [KRACOEUS-8445] File input workaround for dialogs
  * bsmith83 on Tue, 2 Dec 2014 12:37:45 -0800 [View Commit](../../commit/dacdac515a862bdb57dd1173e4ace39c2b8b9b12)
* [KRACOEUS-8449] Incident report blank fix
  * bsmith83 on Tue, 2 Dec 2014 12:21:31 -0800 [View Commit](../../commit/dacbb1db196382f6a29bb3553ead3ab0abad68e0)
* KRACOEUS-8257
  * Include missing Add row functionality for budget periods
  * rmancher on Wed, 26 Nov 2014 19:29:36 -0500 [View Commit](../../commit/6fcc9339118deb12c57e437ee65c4fe07cb3a60c)
* KRACOEUS-8393:fixed budget personnel period rule
  * Joe Williams on Tue, 2 Dec 2014 08:25:30 -0600 [View Commit](../../commit/1d2783df09b3147209db3e97055a3b2105154f77)
* KRACOEUS-8417:made KcPerson id readOnly
  * Joe Williams on Tue, 2 Dec 2014 09:50:49 -0600 [View Commit](../../commit/aac6d65917969f9895251b5e0ddf7ab053b76917)
* KRACOEUS-8435 added award lookup and creat links
  * Jay Hulslander on Tue, 2 Dec 2014 09:01:02 -0500 [View Commit](../../commit/ea9af71d86e4cecc33d63e0ea4215779a51d0bdd)
* [KRACOEUS-8421] workaround fix for attachment upload
  * bsmith83 on Mon, 1 Dec 2014 17:35:26 -0800 [View Commit](../../commit/6bdda67930bbc9837727f2031993d8ece0cc90b9)
* [KRACOEUS-7754]  Session timeout for kc
  * bsmith83 on Mon, 1 Dec 2014 16:38:38 -0800 [View Commit](../../commit/0730d1f4d776e915cdffa58b607b92d48fba84ba)
* KRACOEUS-8443: add transactions to controllers
  * Travis Schneberger on Mon, 1 Dec 2014 18:49:35 -0500 [View Commit](../../commit/c717e820069fe1cf88f28c08f8f3e69da31c8cd2)
* KRACOEUS-8345 added budgetSubAward to ignore list
  * Jay Hulslander on Mon, 1 Dec 2014 16:09:30 -0500 [View Commit](../../commit/6ac7ea08796d02acaa3def2ebe85a9e1c54c34cc)
* [KRACOEUS-8420][KRACOEUS-8114][KRACOEUS-8275][KRACOEUS-8424]  Workaround fixes to fix/re-fix these jiras
  * bsmith83 on Mon, 1 Dec 2014 10:11:11 -0800 [View Commit](../../commit/0e145a3f5a252126b81cec43eada92215bc9ae6c)
* KRACOEUS-8334: Portal changes
  * Gayathri on Fri, 28 Nov 2014 10:18:17 -0700 [View Commit](../../commit/b1a01bdc3491e5e99ec888dcf36be4ed3218dc22)
* KRACOEUS-8429:removed updates available button when proposal is read only
  * Joe Williams on Mon, 1 Dec 2014 10:32:52 -0600 [View Commit](../../commit/d434949caf10c069c2d613683703c5e2a1f5bc8a)
* KRACOEUS-8246: null pointer fix
  * Gayathri on Fri, 28 Nov 2014 11:30:18 -0700 [View Commit](../../commit/18d0b4738dcdec4a2248a0da8ef9a7c3dea617c1)
* KRACOEUS-8224: Fixing copy
  * Gayathri on Wed, 26 Nov 2014 17:28:18 -0700 [View Commit](../../commit/0b0431722e40f28f8b214db4a08133b789a53c11)
* KRACOEUS-8370: Allow the system to display a message with the IP number in it.
  * jamey-rsmart on Wed, 26 Nov 2014 10:29:01 -0700 [View Commit](../../commit/24da4d82b89ecc7654545daac62602ad3afd49d1)
* KRACOEUS-8404: Adding missing rice scripts.
  * Gayathri on Wed, 26 Nov 2014 15:22:32 -0700 [View Commit](../../commit/6c947040bc4a3d7fceb36fdb43e9ed1197fcbf19)
* KRACOEUS-8246: Fixing hierarchy issues.
  * Gayathri on Sat, 18 Oct 2014 16:27:18 -0700 [View Commit](../../commit/7a1e727a6e91f8d47aaca3be4cecc22c339be271)
* KRACOEUS-8406: rice and spring upgrade
  * Travis Schneberger on Wed, 26 Nov 2014 16:28:29 -0500 [View Commit](../../commit/67c44d69ed8529e5f6031f0ae630735a19e0e083)
* KRACOEUS-8120
  * Add Missing Requirements for Budget Personnel Details Job Code
  * rmancher on Wed, 26 Nov 2014 14:42:43 -0500 [View Commit](../../commit/cec7259622bc67a9d96ae99c72404820818d6082)
* KRACOEUS-8377 Budget UXI: Budget Category Missing from Line Item Details
  * Shoj on Wed, 26 Nov 2014 13:24:33 -0500 [View Commit](../../commit/d04e152bd09cac7cb9003e2bea7619687f7bf190)
* KRACOEUS-8418: Fixing null pointers
  * Gayathri on Tue, 25 Nov 2014 22:19:49 -0700 [View Commit](../../commit/6753ce0e01d888fbd51f9ae46be9abd88b191407)
* KRACOEUS-8249 : Fix Integration Tests
  * blackcathacker on Tue, 25 Nov 2014 11:24:46 -0800 [View Commit](../../commit/c6bcf88e5ace9b34c1c3bd6eea1270ff71cd88b8)
* KRACOEUS-8417:added extended attributes to person editable fields
  * Joe Williams on Tue, 25 Nov 2014 13:40:35 -0600 [View Commit](../../commit/ded2a2efc6f320355900d6c2f2db583bf3e557c2)
* KRACOEUS-8175:fixed continue and back links on budget
  * Joe Williams on Tue, 25 Nov 2014 11:45:20 -0600 [View Commit](../../commit/6ed81445fce7544f962f11025265ca321b974fea)
* KRACOEUS-7973
  * “SravanVed” on Tue, 25 Nov 2014 09:01:57 -0500 [View Commit](../../commit/d2b381a40bcf92350f0aba058220ec5a9d147157)
* KRACOEUS-8221 : Proposal Copy Budget
  * blackcathacker on Sun, 9 Nov 2014 21:06:57 -0800 [View Commit](../../commit/2c34290160930d608f41e0c3033260d5f67ab480)
* KRACOEUS-8406: rice and spring upgrade
  * Travis Schneberger on Mon, 24 Nov 2014 18:29:47 -0500 [View Commit](../../commit/6a424684b3c55a379ed6891d0c52b8f4f8afc8f1)
* KRACOEUS-7976 setting excludeSubmitRestriction for questionniare lookups
  * Jay Hulslander on Mon, 24 Nov 2014 16:11:41 -0500 [View Commit](../../commit/0459880edba8dd798b0cdc7151c54f35e5002000)
* KRACOEUS-7652 The Sponsor Address Flag is not displaying when you do an Addressbook Inquiry
  * Shoj on Mon, 24 Nov 2014 15:11:35 -0500 [View Commit](../../commit/5d682a9b1ded0ab0de21467ab95a22a48deb37ba)
* KRACOEUS-8397:fixed personnel attachment file type validation
  * Joe Williams on Mon, 24 Nov 2014 11:17:59 -0600 [View Commit](../../commit/c5af2fd3e3ddf5f9cb93296f877b4673336b32fb)
* KRACOEUS-8234:update proposal status and progress bar on routing changes
  * Joe Williams on Thu, 20 Nov 2014 15:06:15 -0600 [View Commit](../../commit/2d920e7e5c77956189d6b73468699db996f36bb4)
* KRACOEUS-8391: fixing NPE
  * Travis Schneberger on Mon, 24 Nov 2014 09:30:00 -0500 [View Commit](../../commit/880a36a7e79b6786e0314c4a328fc55f1ab24f42)
* KRACOEUS-5730: Cannot rearrange meeting minutes
  * Chuck Tharp on Fri, 21 Nov 2014 14:46:59 -0500 [View Commit](../../commit/cc051e27303084771dc9d359dfc13b312ec3435f)
* KRACOEUS-8389
  * “SravanVed” on Fri, 21 Nov 2014 14:55:56 -0500 [View Commit](../../commit/eaa93bc514195447b80b2a24860f38c919a5d97e)
* KRACOEUS-8280: allows alphanumeric values in congressional district.
  * jamey-rsmart on Fri, 21 Nov 2014 12:45:28 -0700 [View Commit](../../commit/1307ae2ca8babb0f23786b5f217156a372d209a6)
* KRACOEUS-8371: Fixing PR comments
  * Geo Thomas on Fri, 21 Nov 2014 14:42:26 -0500 [View Commit](../../commit/f8c5fd3b52de6318586cb22d67ac161b179020bc)
* Fixing PR comments
  * Geo Thomas on Fri, 21 Nov 2014 14:38:59 -0500 [View Commit](../../commit/e03f89dc264c2cf1d0c293a80d7c8b1dae77d8c2)
* Fixing PR comments
  * Geo Thomas on Fri, 21 Nov 2014 14:37:28 -0500 [View Commit](../../commit/5d1876de1fc50724ce49f1087cf0954a92d622e9)
* KRACOEUS-8306: Addressing issue of changing sponsor code from NIH and certain roles.
  * jamey-rsmart on Wed, 19 Nov 2014 09:24:46 -0700 [View Commit](../../commit/9bc8dca414975cfcf06cd640d97943c029466bb7)
* KRACOEUS-8348: Meeting Minute edits are not saved
  * Chuck Tharp on Thu, 13 Nov 2014 10:52:49 -0500 [View Commit](../../commit/9a552479d0bb6c555a1efd8a1d7bd7dc02ed5ee2)
* KRACOEUS-7014:fixed some issues with certify notifications
  * Joe Williams on Fri, 21 Nov 2014 08:15:34 -0600 [View Commit](../../commit/4ff98c6f6da8a7b731bea5641c07bf06d0894a4b)
* KRACOEUS-8351 fixing questionniare field mapping parameter names to be consistent accross KC, cleaned up some variable names to make sense, and fixed the general questionnaire lookup
  * Jay Hulslander on Fri, 14 Nov 2014 14:07:33 -0500 [View Commit](../../commit/256791b3a4d61da69ee5c79c8b256673de85df98)
* KRACOEUS-6626: adding start and end dates
  * Travis Schneberger on Thu, 20 Nov 2014 18:11:19 -0500 [View Commit](../../commit/a258114674a5fb3247dff40ff3b5e91271312088)
* KRACOEUS-8323
  * Change in budget settings rate type - applied to line items
  * once confirmed.
  * rmancher on Thu, 20 Nov 2014 16:47:30 -0500 [View Commit](../../commit/414bd159293d6a73b2b1c4b11214b0dea03fe443)
* KRACOEUS-8339: Changed validation to AnyCharacterValidation for proposalState.description
  * jamey-rsmart on Thu, 20 Nov 2014 13:45:49 -0700 [View Commit](../../commit/2b9a00626adfc321c6e07a6446b28279e26ce3a5)
* KRACOEUS-8249 : Budget Copy Fixes
  * blackcathacker on Thu, 30 Oct 2014 13:43:29 -0700 [View Commit](../../commit/b7bda6d9812d99c4b66aa226fdf5b54ac7ff586f)
* KRACOEUS-7014:send person certification notifcation code changes
  * Joe Williams on Wed, 5 Nov 2014 10:47:50 -0600 [View Commit](../../commit/3b11c86e43c07812ecf647e6fa5bb486e5c3c86f)
* KRACOEUS-7527 Standardizing how ProposalType is accessed
  * Shoj on Thu, 20 Nov 2014 10:38:02 -0500 [View Commit](../../commit/1477815ffa9d3c5f90c504c34599d3114876e669)
* KRACOEUS-8380:fixed questionnaire agenda to work for all units
  * Joe Williams on Thu, 20 Nov 2014 08:51:33 -0600 [View Commit](../../commit/8a7a12b2399037b6f23144853938b2383ac42a2b)
* KRACOEUS-7492 New System parameter for S2S
  * mrudulpolus on Mon, 10 Nov 2014 16:18:21 +0530 [View Commit](../../commit/63eab5d6ee3aa672ebb6cbf5ae4cd11ad16ecb00)
* KRACOEUS-8012 Non-employees are appearing as PD/PI on S2S forms
  * mrudulpolus on Mon, 10 Nov 2014 15:32:52 +0530 [View Commit](../../commit/27c9cfdd6d38f4c465d45b778cea72acd546d653)
* KRACOEUS-8010: fixing another copy bug
  * Travis Schneberger on Wed, 19 Nov 2014 15:58:30 -0500 [View Commit](../../commit/876f715f513f64da7971ba4e09389bc2f4daaa33)
* KRACOEUS-8341 Field name of UnitAgendaTypeServiceImpl.java didn't match the name in KRMS_ATTR_DEFN_T
  * cniesen on Wed, 19 Nov 2014 13:42:06 -0600 [View Commit](../../commit/3063c6a360dd792268d6eddfa90e93b415c4b0f7)
* KRACOEUS-8235:make user attached forms viewable before s2s connection
  * Joe Williams on Wed, 19 Nov 2014 12:52:19 -0600 [View Commit](../../commit/b2e7ea0c3bfb9ac5c846877501ed768e9a3eb336)
* KRACOEUS-8010: fixing another copy bug
  * Travis Schneberger on Wed, 19 Nov 2014 13:19:21 -0500 [View Commit](../../commit/55650cb14ca5a3674cd7994dbf5a4ee589370d4b)
* KRACOEUS-8010: fixing more bugs
  * Travis Schneberger on Wed, 19 Nov 2014 11:22:19 -0500 [View Commit](../../commit/83c4820fb919a433bf2d2f6bee6210129ec9811a)
* KRACOEUS-8382:removing pessimistic lock message on submit
  * Joe Williams on Wed, 19 Nov 2014 10:03:25 -0600 [View Commit](../../commit/c43db0ad46c50d378ca21e745816d37c804821f6)
* [KRACOEUS-8275][KRACOEUS-8114][KRACOEUS-8312] various compliance page fixes with refreshes, fields, and protocols
  * bsmith83 on Thu, 6 Nov 2014 12:05:32 -0800 [View Commit](../../commit/166548110eca245fcd69cae11f4d8d476c9241f3)
* KRACOEUS-8373 - different budget summary issues
  * Geo Thomas on Tue, 18 Nov 2014 19:01:06 -0500 [View Commit](../../commit/fa78a0f3a35bea1d665360cd8f857c45ad5550d9)
* KRACOEUS-8372 : Save custom data with arg value lookups
  * Geo Thomas on Tue, 18 Nov 2014 18:26:59 -0500 [View Commit](../../commit/71777ad734ffb4b8b5bab7528e1ae5cb35a4909f)
* KRACOEUS-8371 - Changing DOB format error to warning so that application wont fail even if the masking is on for not displaying DOB
  * Geo Thomas on Tue, 18 Nov 2014 17:45:22 -0500 [View Commit](../../commit/3397625273da9b06709d8ce4d69dd1a1f278d4bf)
* KRACOEUS-8367:added permissions validation on save
  * Joe Williams on Tue, 18 Nov 2014 15:23:43 -0600 [View Commit](../../commit/dc2ed6aa2acfb6ff5526438e8a247e83bf495ebd)
* KRACOEUS-7672
  * Set Budget Salary parameter
  * rmancher on Tue, 18 Nov 2014 15:51:31 -0500 [View Commit](../../commit/6b06a7d172209aa64a76f2f539830884f00cb80b)
* KRACOEUS-7014:fixing sql scripts
  * Joe Williams on Tue, 18 Nov 2014 13:22:27 -0600 [View Commit](../../commit/38454fb4633c2ff0218cfebed51d4c3115d102f6)
* [KRACOEUS-8273] fix for add rate button placement
  * bsmith83 on Tue, 18 Nov 2014 11:09:09 -0800 [View Commit](../../commit/ae5eadfd70f054c93a3e2de4d3aec4f53abfac15)
* KRACOEUS-8201
  * Add missing personnel period validation
  * Adjust personnel line item calculation
  * rmancher on Wed, 12 Nov 2014 15:56:02 -0500 [View Commit](../../commit/07d137799399275b2bf8a03022a67c86b0bfabb9)
* Adding introduction to README  * mztaylor on Tue, 18 Nov 2014 12:53:44 -0500 [View Commit](../../commit/6a932f9c011c92bfaf6ed841c7f53bea0fc46c20)
* KRACOEUS-8356:added lock description to pessmistic locks
  * Joe Williams on Tue, 18 Nov 2014 11:49:33 -0600 [View Commit](../../commit/581645d6a3e8e5f4b6a8f28307509aaa45614799)
* KRACOEUS-7598: code review comments
  * Travis Schneberger on Tue, 18 Nov 2014 11:41:18 -0500 [View Commit](../../commit/a9b14fef4c751c1d59190afc72e7286a48e1572f)
* KCINFR-868: updating plugins
  * Travis Schneberger on Tue, 18 Nov 2014 11:13:45 -0500 [View Commit](../../commit/64d625b42f942a24cfcf88b9fddcf42d0233291d)
* KRACOEUS-7598: adding warning
  * Travis Schneberger on Tue, 18 Nov 2014 10:45:15 -0500 [View Commit](../../commit/91645a605422c9b484c901930538bc477795f2e7)
* KRACOEUS-6294:updating scripts from BSTD to B000
  * Joe Williams on Tue, 18 Nov 2014 08:50:31 -0600 [View Commit](../../commit/fa3dae6df757103b230622c4c4709592b6148a7b)
* KRACOEUS-8352: Personnel changes not reflected in Permissions page
  * Chuck Tharp on Fri, 14 Nov 2014 13:33:24 -0500 [View Commit](../../commit/db22eedb7efce04e1404c8e4e37811c5005b8829)
* Revert "KRACOEUS-8285: tagging release"
  * Travis Schneeberger on Mon, 17 Nov 2014 21:12:36 -0500 [View Commit](../../commit/2aff6649937974e81ed172464b029164501ebca0)
* KRACOEUS-8333:fixed issues with data types on data override controller
  * Joe Williams on Fri, 7 Nov 2014 11:28:42 -0600 [View Commit](../../commit/31d482cd903431512911853d772ad056adf0c908)
* KRACOEUS-7798 lack of depth param in deepcopy call breaks IntellectualPropertyReiview.
  * Jay Hulslander on Fri, 7 Nov 2014 16:07:20 -0500 [View Commit](../../commit/b65cbcf96eb77abb62f620077d183271a58fd869)
* KRACOEUS-8338:fixes issue with custom data not being passed to institutional proposals
  * Joe Williams on Tue, 11 Nov 2014 10:16:37 -0500 [View Commit](../../commit/163260b61948f58cf95268aa7908148fa281254c)

##coeus-6.0.0-s9
* KRACOEUS-8285: tagging release
  * Travis Schneberger on Mon, 17 Nov 2014 21:03:22 -0500 [View Commit](../../commit/4c7d6cd8f355aaa1d1d434ab97fbb774d5a7ebf1)
* KRACOEUS-7959: fixing compilation error
  * Travis Schneberger on Mon, 17 Nov 2014 19:41:39 -0500 [View Commit](../../commit/a4dbe269c3fc2b043a60d4031b3eef82107d86bb)
* KRACOEUS-8010: fixing bean name
  * Travis Schneberger on Mon, 17 Nov 2014 15:49:28 -0500 [View Commit](../../commit/16684e7887dd0c4662c0643f41d059bd3853d417)
* KRACOEUS-8278:fixed multiple issues with proposal search
  * Joe Williams on Mon, 17 Nov 2014 13:59:17 -0600 [View Commit](../../commit/d18e49e757019a1a40f8b920ff16800e35764b80)
* KRACOEUS-8144
  * Jay Hulslander on Mon, 17 Nov 2014 14:17:04 -0500 [View Commit](../../commit/60b0402eda494c4d1d3f81b956767e656bb09347)
* KRACOEUS-8300:fixed issues with personnel attachments generated from extend attributes
  * Joe Williams on Mon, 17 Nov 2014 13:06:06 -0600 [View Commit](../../commit/e62df7ab73e5f4d9f0a70cb4b072fc71e5e1f0ff)
* [KRACOEUS-8317] fix for duplicate submit to sponsors, old notification data
  * bsmith83 on Mon, 17 Nov 2014 09:59:57 -0800 [View Commit](../../commit/5d2d01b3ef6fe5bd8e83af2ee2db2cc82dbcdce1)
* KRACOEUS-8345 added getParentBudget to allow searching
  * Jay Hulslander on Wed, 12 Nov 2014 15:25:13 -0500 [View Commit](../../commit/85daae26eac9f675a7ebedd2b5986b4bbf706619)
* KRACOEUS-8272 Save/Save and Continue should not render when a proposal is in read only mode
  * Shoj on Mon, 17 Nov 2014 11:38:03 -0500 [View Commit](../../commit/631fc75c18518831c93e56edd704abdc44daf884)
* KRACOEUS-8316:when validations warnings are present on submit, data validation modal gets displayed with option to submit with warnings
  * Joe Williams on Fri, 7 Nov 2014 09:06:59 -0600 [View Commit](../../commit/c543677a323d1b0fa0efe769b7194a2f7823532e)
* KRACOEUS-8195
  * “SravanVed” on Wed, 22 Oct 2014 08:50:53 -0400 [View Commit](../../commit/2e7ac783b8bc8bab1fb4fa47125aa2e1d288ff77)
* KRACOEUS-7901:fixed issues with non employee search on add personnel wizard
  * Joe Williams on Thu, 6 Nov 2014 11:09:39 -0600 [View Commit](../../commit/90bea5e353d56723e5099e3eb91e2ba7182c1781)
* KRACOEUS-7014:send key person certification notification database changes
  * Joe Williams on Wed, 5 Nov 2014 11:11:32 -0600 [View Commit](../../commit/f90d0efd7990d6c4e8b63ad6c730bb9c963d5e84)
* KRACOEUS-8144 fixing award budget OJB caching issues
  * Jay Hulslander on Fri, 14 Nov 2014 09:53:08 -0500 [View Commit](../../commit/65ade3f1acd3c749f1bcc476a44e310e9ef470b8)
* KRACOEUS-8127 fix fop errors in:
  * ProposalDevelopmentPrintingServiceImplTest  * sasipolus on Mon, 17 Nov 2014 15:43:24 +0530 [View Commit](../../commit/94bda13f2117162e30fe043b8c37241d4147ac1f)
* KRACOEUS-7599: Adds Updated By and updated timestamp to uploads.
  * jamey-rsmart on Fri, 31 Oct 2014 15:07:40 -0700 [View Commit](../../commit/8a5d8d3e0e0c021d4e2dbbee4acff3046096490d)
* KRACOEUS-8331 : Cost Share percentage validation
  * yyuan1 on Mon, 10 Nov 2014 18:08:24 -0500 [View Commit](../../commit/4d6fa003d3c631b39c7156d191eb01326fff0a90)
* KRACOEUS-8350 fixing query params to use correct field
  * Jay Hulslander on Fri, 14 Nov 2014 11:55:24 -0500 [View Commit](../../commit/923427a9c6710543cd5b50bea83e3cacb597724a)
* KRACOEUS-8291 fix:
  * org.kuali.kra.test.OjbRepositoryMappingTest.verifyTablesPdXml  * sasipolus on Fri, 14 Nov 2014 15:11:52 +0530 [View Commit](../../commit/4238eb2a0fa7660210264ee100b43943fc470ab6)
* KRACOEUS-8219:fixed issues with change tracking
  * Joe Williams on Wed, 12 Nov 2014 15:15:51 -0500 [View Commit](../../commit/c4a04ec8673633e08f75e0517f31e1ded3b28571)
* KRACOEUS-7516: Added firstName, middleName, lastName to editable fields.  Fixed the editable fields issue.
  * jamey-rsmart on Tue, 11 Nov 2014 17:30:02 -0700 [View Commit](../../commit/aff906416d9975d158b969583b8457f7b6e2f25e)
* KRACOEUS-8287 : modular budget question --when add budget from budget versions
  * yyuan1 on Tue, 11 Nov 2014 15:17:44 -0500 [View Commit](../../commit/bd9e69a350c4d8682a38aa9c95f430b7b4ed019a)
* KRACOEUS-8341:fixed gg tracking validation
  * Joe Williams on Tue, 11 Nov 2014 12:17:19 -0500 [View Commit](../../commit/0056d13df37e365a1e546b730e354d17c9f467df)
* KRACOEUS-8336:clear lock on close
  * Joe Williams on Fri, 7 Nov 2014 14:54:13 -0600 [View Commit](../../commit/b3d0e4eb86eb2e689e24b5d6a0432da540ed7f0b)
* KRACOEUS-7805 Proposal Hierarchy Tests  * sasipolus on Tue, 11 Nov 2014 19:40:37 +0530 [View Commit](../../commit/a3645a2bccdbe46b98ca3917c73f5e935ea17789)
* KRACOEUS-8293	
  * fix: RRSubAwardBudget5_30V1_2GeneratorTest  * mrudulpolus on Tue, 11 Nov 2014 17:02:57 +0530 [View Commit](../../commit/9e96810ec619963085f1fd0073d8755e9e0454a2)
* KRACOEUS-8292
  * fix: RRSubAwardBudget10_30_1_3V1_3GeneratorTest  * mrudulpolus on Tue, 11 Nov 2014 16:38:32 +0530 [View Commit](../../commit/cf3a4f567dfdd42d4596c5f959db96a05addfd20)
* KRACOEUS-8322
  * Fix for Change of Dates to allow reset default and autocalculate.
  * rmancher on Mon, 10 Nov 2014 14:28:15 -0500 [View Commit](../../commit/806b015f213a5c11b5886f1c7b49d2e8ab68a3cd)
* KRACOEUS-8290
  * fix: ProposalDevelopmentPersonnelAttachmentRuleTest  * boneypolus on Mon, 10 Nov 2014 15:44:51 +0530 [View Commit](../../commit/71d94ea88651d1f8dfcc8d771e260f668e8ae683)
* KRACOEUS-8315 Fixing notification to display correct page
  * Shoj on Fri, 7 Nov 2014 17:02:50 -0500 [View Commit](../../commit/dcdccacfb89b4dd50e3228ece1582935ed11469b)
* KRACOEUS-8335: Correspondence generated during Return for SMR is on wrong action
  * Chuck Tharp on Fri, 7 Nov 2014 13:54:56 -0500 [View Commit](../../commit/3408f45de683170ecd4b404b43f618a6a3f9e57e)
* KRACOEUS-8318
  * Budget Summary screen issue when budget is marked Complete
  * rmancher on Fri, 7 Nov 2014 11:30:25 -0500 [View Commit](../../commit/df41388f1e36b764f18917eb7b097bc433272ba9)
* KRACOEUS-7687
  * Period Assign Summary Personnel Button Interaction
  * Verify and update required changes in budget summary.
  * rmancher on Fri, 7 Nov 2014 10:45:32 -0500 [View Commit](../../commit/61b4f4d691bc75615ff26777ce2ec3a1d2265ede)
* KRACOEUS-8310:allow s2s forms to be printed after submission
  * Joe Williams on Thu, 6 Nov 2014 10:26:28 -0600 [View Commit](../../commit/b5f2d0bab7b52a241d9afe9ed8a24f88b64a1a41)
* KRACOEUS-8289
  * fix: ProposalDevelopmentPermissionsRuleTest  * boneypolus on Thu, 6 Nov 2014 20:16:41 +0530 [View Commit](../../commit/9c3a2c56919b9b2e8d33d067080f16f4446aafb9)
* KRACOEUS-8294  * sasipolus on Thu, 6 Nov 2014 17:40:52 +0530 [View Commit](../../commit/08079743ec1bbd07dc5b2d554268c7a9416df505)
* KRACOEUS-8266:update all references before printing s2s forms
  * Joe Williams on Mon, 3 Nov 2014 11:28:49 -0600 [View Commit](../../commit/f238f01cea3ec48a1f87a0607930d9ffd665bc7b)
* KRACOEUS-8302:fixed STE on navigate with data validation turned on due to narrative type references
  * Joe Williams on Wed, 5 Nov 2014 16:17:07 -0600 [View Commit](../../commit/58a6196652b7df63d95b73522e269bd8d6d0cc0b)
* KRACOEUS-8287 : Modular Budget Question should only appear if the Sponsor is in the NIH Sponsor Hierarchy-fix
  * yyuan1 on Tue, 4 Nov 2014 13:01:17 -0500 [View Commit](../../commit/b30b9548ce53b33d2bde734b6e5c8bf1aff077a6)
* KRACOEUS-8010: retrieving Budget for award, fixing error message
  * Travis Schneberger on Wed, 5 Nov 2014 14:12:47 -0500 [View Commit](../../commit/23e2a2b007646c98935ad56d646491a1f819118a)
* KRACOEUS-8199 : project income total n/a
  * yyuan1 on Wed, 5 Nov 2014 09:29:53 -0500 [View Commit](../../commit/c14348f6a60612f686ff33e66edb66e8e4c9a109)
* KRACOEUS-8262: Changed DevelopmentProposal search to use the traditional lookup approach with the added functionality.
  * jamey-rsmart on Wed, 5 Nov 2014 10:23:15 -0700 [View Commit](../../commit/63d2059ec5c5fe3020f2a2c0410c062b6dfc75f8)
* KRACOEUS-8059 fixed bug with spaces in the full document type code
  * Jay Hulslander on Wed, 5 Nov 2014 09:16:43 -0500 [View Commit](../../commit/6a15ee7fc4eff34457314f7377658d07ab702b4f)
* KRACOEUS-8295 fix: QuestionnairePrintingServiceTest  * anithapolus on Wed, 5 Nov 2014 18:57:39 +0530 [View Commit](../../commit/5564f3acb7e89867a2d193ecd1357c08870f1b5d)
* KRACOEUS-8272 Save/Save and Continue should not render when a proposal is in read only mode
  * Shoj on Tue, 4 Nov 2014 23:28:01 -0500 [View Commit](../../commit/87dd8c17c9f4d9a88aa838558d14f45ae3378bec)
* KRACOEUS-8297: STE fix while populating proposal persons with degree info attached
  * Geo Thomas on Tue, 4 Nov 2014 13:31:54 -0500 [View Commit](../../commit/132fa5580ee4592dbcdfd5cda4ae930fc56cfdfc)
* KRACOEUS-8254
  * Add Personnel - problem with modal behavior for Employee/Non-Employee
  * rmancher on Tue, 4 Nov 2014 15:56:49 -0500 [View Commit](../../commit/9f68973ae039e019a04c6736156a437a965cce96)
* KRACOEUS-8199 : project income total N/A
  * yyuan1 on Tue, 4 Nov 2014 16:11:55 -0500 [View Commit](../../commit/ea0bec2aab9a9603005addb36282ab6f24e26a22)
* KRACOEUS-8252 : Save before navigating to budget
  * blackcathacker on Fri, 31 Oct 2014 09:58:13 -0700 [View Commit](../../commit/99c11d71e4419cc661f21782250a5cd2ea60f3a7)
* KRACOEUS-7953: fixing proposal lookup in embedded mode
  * Travis Schneberger on Tue, 4 Nov 2014 14:22:20 -0500 [View Commit](../../commit/e3fb1c8b80c2a916a07a9c6cc848755e8bcaaf5c)
* KRACOEUS-8223: fixing links
  * Travis Schneberger on Tue, 4 Nov 2014 10:49:34 -0500 [View Commit](../../commit/5b40f5f5e61c89b4a1baff0376700bd4d0f1dcbe)
* KRACOEUS-7861 allow search with active flag on the maintenance form, every other place don't show it.
  * Jay Hulslander on Fri, 31 Oct 2014 15:47:50 -0400 [View Commit](../../commit/ca7d9712ad81cb760789ac2884ea832604a6d0ff)
* KRACOEUS-7320:fixed permissions on proposal search
  * Joe Williams on Tue, 4 Nov 2014 08:29:57 -0600 [View Commit](../../commit/c1811295ad00d1ab5c4c0abf48f1467bddba213e)
* KRACOEUS-8267:remove user attach form edittable line on save
  * Joe Williams on Mon, 3 Nov 2014 11:53:07 -0600 [View Commit](../../commit/367e64d552d18551290ba8b668f894ef38e1b6ae)
* KRACOEUS-8059 fixing custom attrib document inquiry
  * Jay Hulslander on Thu, 30 Oct 2014 12:28:56 -0400 [View Commit](../../commit/76d91558c7dc575a8c073533f55dcb7bef6b029b)
* KRACOEUS-7961
  * Proposal Protocol Service Integration tests  * mrudulpolus on Wed, 24 Sep 2014 17:05:44 +0530 [View Commit](../../commit/d0d321eaf17fa434750b22a9d916e1ab38f07207)
* Revert "KRACOEUS-8285: tagging release"
  * Travis Schneeberger on Mon, 3 Nov 2014 22:20:55 -0500 [View Commit](../../commit/7d6850bec2ef0c1f0bd90c567fc398faf2d95241)
* KRAFDBCK-11138 : Modular Budget Question should only appear if the Sponsor is in the NIH Sponsor Hierarchy
  * yyuan1 on Mon, 3 Nov 2014 22:17:48 -0500 [View Commit](../../commit/b2a065f71b414641d18aaac1841265c674373b89)
*  KRACOEUS-8284: removing unused imports
  * Travis Schneberger on Mon, 3 Nov 2014 19:37:41 -0500 [View Commit](../../commit/05a74c8c11e213d7309d5247d9aaf681ea32e365)
* KRACOEUS-7683
  * Budget Summary Modal View
  * KRACOEUS-7682
  * Budget Summary Table View Fix
  * rmancher on Mon, 3 Nov 2014 15:18:47 -0500 [View Commit](../../commit/81a3ab56dec068130960170e88b91f07bad7967f)
* KRACOEUS-8199 : PD Budget UXI: Project Income View Summary: Totals are N/A
  * yyuan1 on Mon, 3 Nov 2014 15:03:15 -0500 [View Commit](../../commit/f8fa033b776c3c59197d9996d6529b94db4f3d0b)
* KRACOEUS-8105:changed order so that scripts are ran after KRACOEUS-6294 scripts
  * Joe Williams on Thu, 30 Oct 2014 15:21:22 -0500 [View Commit](../../commit/afaa2b8ffdf59b224a64ae5b2072a0e722e2e1e6)
* KRACOEUS-7959
  * Proposal KRMS Rule Service tests  * boneypolus on Fri, 24 Oct 2014 17:17:29 +0530 [View Commit](../../commit/85de4f75bf7eebd3e7932dcf19030c1914f985dc)

##coeus-6.0.0-s8
* KRACOEUS-8285: tagging release
  * Travis Schneberger on Mon, 3 Nov 2014 20:04:45 -0500 [View Commit](../../commit/cd2f10d8aa1a69f70afb3d5d2492da985e013b57)
* KRACOEUS-8198 : Fixes for budget dialogs
  * blackcathacker on Mon, 3 Nov 2014 16:10:45 -0800 [View Commit](../../commit/154b9ba9d419f3931d77bcd12f8865e9cfa21d5e)
* KRACOEUS-8242: Adds toggle button to add/remove questions when key personnel is of have certificationRequired set to true.
  * jamey-rsmart on Thu, 30 Oct 2014 13:06:54 -0700 [View Commit](../../commit/7f33fd1fa6777c6e4739f9d1bc77e88333aea1b4)
* KRACOEUS-8277:fixed refresh s2s submission detail
  * Joe Williams on Mon, 3 Nov 2014 14:16:45 -0600 [View Commit](../../commit/53cce54b501c40cbe34308e65ed7e9f4971d5cb6)
* KRACOEUS-8021 taining stipend table now editable
  * Jay Hulslander on Mon, 3 Nov 2014 11:50:49 -0500 [View Commit](../../commit/749d836babc55b98ec22abdfc1811d8aff595350)
* KRACOEUS-8106:make person readonly if it has already been save to db on personnel attachments
  * Joe Williams on Mon, 3 Nov 2014 08:08:54 -0600 [View Commit](../../commit/195924a9bba0f35d28908265a4fbd57be8d46ab4)
* KRACOEUS-7766,KRAFDBCK-9487 - This fix has got unit lookup for Agenda and ordering Agendas depedning on the unit hierarchy : fixing PR comments
  * Geo Thomas on Fri, 31 Oct 2014 16:57:59 -0400 [View Commit](../../commit/03c60c661c46bd9ba45f6caf84cb024d021e5292)
* KRACOEUS-8250
  * Reset to period defaults
  * KRACOEUS-7821
  * Salary by Period for new extended periods
  * rmancher on Fri, 31 Oct 2014 16:55:44 -0400 [View Commit](../../commit/174dc52ed65758349e270b72915af51c77f67aff)
* KRACOEUS-7766,KRAFDBCK-9487 - This fix has got unit lookup for Agenda and ordering Agendas depedning on the unit hierarchy : fixing PR comments
  * Geo Thomas on Fri, 31 Oct 2014 16:54:48 -0400 [View Commit](../../commit/28b4200787348a3dd75658be883a353f6840c6a6)
* KRACOEUS-7766,KRAFDBCK-9487 - This fix has got unit lookup for Agenda and ordering Agendas depedning on the unit hierarchy : fixing PR comments
  * Geo Thomas on Fri, 31 Oct 2014 16:44:55 -0400 [View Commit](../../commit/2f4c943cdae1a12a6971fedc42e78f8f885caed4)
* KRACOEUS-8133 Submit to Sponsor - Notification
  * Shoj on Fri, 31 Oct 2014 16:24:19 -0400 [View Commit](../../commit/7e3c45077336f6d99e52ded1f74635d65caba27c)
* KRACOEUS-7766,KRAFDBCK-9487 - This fix has got unit lookup for Agenda and ordering Agendas depedning on the unit hierarchy
  * Geo Thomas on Fri, 31 Oct 2014 16:21:09 -0400 [View Commit](../../commit/0d5488ddd70820c59b41331791254d5721a0efb3)
* KRACOEUS-8271: fixing permission page and perm rules
  * Travis Schneberger on Fri, 31 Oct 2014 14:15:27 -0400 [View Commit](../../commit/62d7cfd4810b09d6db495445776a6d3c30a1e20c)
* KRACOEUS-8065 : Fix for subawards and person calculations in hierarchy
  * blackcathacker on Wed, 29 Oct 2014 23:38:19 -0700 [View Commit](../../commit/c1c1fc23da887e1f9a129bf5986f4ea786c54a2b)
* KRACOEUS-8220:fixed issue with certification audit errors blocking navigation
  * Joe Williams on Fri, 31 Oct 2014 10:52:06 -0500 [View Commit](../../commit/29b023f7e5cecaba7f752df9127f6290d704f609)
* KRACOEUS-7268: New maint doc for PropAwardPersonRole.
  * jamey-rsmart on Wed, 29 Oct 2014 10:47:57 -0700 [View Commit](../../commit/c7b07c772f9de14d6774162b30cc882b28561af8)
* KRACOEUS-7320:proposal search view link makes document readOnly
  * Joe Williams on Fri, 31 Oct 2014 08:21:52 -0500 [View Commit](../../commit/e1692c23d67ed6124f300b6e1e91d90e4e2a6cf2)
* KRACOEUS-8267:fixed save user attached forms
  * Joe Williams on Fri, 31 Oct 2014 08:45:24 -0500 [View Commit](../../commit/e4e4cb95fa936055b37bf4649d66134849f3ab18)
* KRACOEUS-8260: Saving protocol results in multiple Special Reviews
  * Chuck Tharp on Thu, 30 Oct 2014 21:26:17 -0400 [View Commit](../../commit/1d6044d559a9efc7f80d66fd9a34990afe8d0c48)
* KRACOEUS-8038 : Budget Complete Status
  * blackcathacker on Thu, 30 Oct 2014 17:01:55 -0700 [View Commit](../../commit/0a0420eaeb6fef3cb16eaf389b7b3e1526b3d685)
* KRACOEUS-8261 : Fix budget final/complete validation
  * blackcathacker on Thu, 30 Oct 2014 15:45:28 -0700 [View Commit](../../commit/af985b73e008903bcbe013f0eb7f8542c1f342c5)
* KRACOEUS-8189
  * Apply to later periods fix
  * Refactor personnel and non-personnel cost
  * rmancher on Wed, 29 Oct 2014 11:05:43 -0400 [View Commit](../../commit/9331b4fa1f5ddc92e7331cf7d217086b4a39e3e6)
* KRACOEUS-8239:fixed STE when key person is added with degree in the person_degree table
  * Joe Williams on Thu, 30 Oct 2014 14:36:21 -0500 [View Commit](../../commit/b90248fdd79d2430b76d01e836e01e9da9fe5033)
* KRACOEUS-8170
  * Autocalculate periods fix.
  * Also apply rules and adjust recalculate message.
  * rmancher on Thu, 30 Oct 2014 15:02:23 -0400 [View Commit](../../commit/354bffeddc2417979008d234124807bc620d7d07)
* KRACOEUS-8181: code review comments
  * Travis Schneberger on Thu, 30 Oct 2014 14:36:39 -0400 [View Commit](../../commit/e32a98d742d338118b0397db51d3375cc64320f3)
* KRACOEUS-6956: Removing whitespace
  * Gayathri on Thu, 30 Oct 2014 08:55:53 -0700 [View Commit](../../commit/05a91488262d4751692e6d9696dea7cc6d6d14f6)
* KRACOEUS-8236: JPA maPPing fix
  * Joe Williams on Wed, 29 Oct 2014 16:36:59 -0500 [View Commit](../../commit/e044d592b2df6185402a5a16526ecc329aa6c0fb)
* KRACOEUS-8065 Fixing alter statement
  * Shoj on Thu, 30 Oct 2014 09:58:44 -0400 [View Commit](../../commit/f26edf821b8ad05791097e750e647ffe1f6af98e)
* KRACOEUS-8160: fixing test
  * Travis Schneberger on Mon, 27 Oct 2014 19:24:31 -0400 [View Commit](../../commit/862bf416e1293d1cdc2b054543178439f4671cbf)
* KRACOEUS-8106:additional fixes to personnel attachment validation
  * Joe Williams on Thu, 30 Oct 2014 08:01:37 -0500 [View Commit](../../commit/7a7fd2414447776de053eca14d9df20252a6838b)
* KRACOEUS-8188
  * Recalculate Salary by Period in Project Personnel
  * rmancher on Wed, 29 Oct 2014 20:33:15 -0400 [View Commit](../../commit/bc48a06c7cdf535a98168ed7d44185f506c26bc0)
* KRACOEUS-7595: Extra logic added to assist in avoiding the null document number issue.
  * jamey-rsmart on Wed, 29 Oct 2014 12:16:29 -0700 [View Commit](../../commit/714067198923638a6e712728e3909526d39588d3)
* KRACOEUS-8163:fixed credit split field level errors
  * Joe Williams on Wed, 29 Oct 2014 14:02:38 -0500 [View Commit](../../commit/77d17f0697b87e4203f1b8e8977982a35f5b4de6)
* KRACOEUS-7700 : Modular Budget Add Rates Modal
  * yyuan1 on Wed, 29 Oct 2014 14:15:59 -0400 [View Commit](../../commit/767ad6fbf22e0e6f74d1e24c9fdefc1ce9f54b51)
* KRACOEUS-8241 budget summary table fixes
  * bsmith83 on Wed, 29 Oct 2014 11:03:15 -0700 [View Commit](../../commit/63c68f387b1db5ebbe35d6a25d3081e30632687d)
* KRACOEUS-8226 using the correct lookupable helpepr service
  * Jay Hulslander on Wed, 29 Oct 2014 14:02:58 -0400 [View Commit](../../commit/a555258817c3042c5ef17e36923d22e8c2082d0d)
* KRACOEUS-8222: fixing links
  * Travis Schneberger on Wed, 29 Oct 2014 13:50:46 -0400 [View Commit](../../commit/8ffa95d24c730d8872a129a011b9d6ea7a718556)
* KRACOEUS-8238:fixed STE on navigate to supplemental info
  * Joe Williams on Wed, 29 Oct 2014 10:32:03 -0500 [View Commit](../../commit/cb45a730d16e3bb797263b2cb9c503fd0f3e6c88)
* KRACOEUS-8065: Proposal Budget Hierarchy creation
  * blackcathacker on Thu, 23 Oct 2014 19:51:14 -0400 [View Commit](../../commit/e6eae4acbe94b30cc453a4f5f0e22ba232c60551)
* KRACOEUS-7864 : Build Modular Budget Synced
  * yyuan1 on Tue, 28 Oct 2014 23:51:42 -0400 [View Commit](../../commit/33da650a344a30c05efbfc53ea20d0cf0aab3f20)
* KRACOEUS-8203: Rice upgrade. Apparently the previous did not fix the dialog issues it was supposed to fix.
  * Gayathri on Tue, 28 Oct 2014 18:08:18 -0700 [View Commit](../../commit/c18fc639a9778fb16f8cda4dd6d68824a4d1b63e)
* KRACOEUS-8075
  * once individual line items are added to a budget period only the Start Date, End Date, Cost limit and Direct Cost limit should remain editable for that budget period
  * rmancher on Tue, 28 Oct 2014 20:38:50 -0400 [View Commit](../../commit/6279a2a22205eb96f0c3f27bf8c86baed2153a99)
* KRACOEUS-8215 budget dialog overlap fix
  * bsmith83 on Tue, 28 Oct 2014 17:15:38 -0700 [View Commit](../../commit/a0872b5b9bc0dd3f43695aea4b8c202f9f380b28)
* KRACOEUS-8095
  * Unrecovered F&A in Details read only
  * KRACOEUS-8183
  * Retain total cost if amount is not entered in direct cost or indirect cost
  * Also fix dialog reset issue
  * rmancher on Tue, 28 Oct 2014 19:46:52 -0400 [View Commit](../../commit/93e5b08cad93972eb82b9fb8b0521387fdb03e56)
* KRACOEUS-8233: copying user attached forms
  * Gayathri on Tue, 28 Oct 2014 16:24:53 -0700 [View Commit](../../commit/952ef2e4a8fb139c0ad39d99424452e197320184)
* KRACOEUS-8043 Close button added for wizards, repositioned buttons for wizards, modals do not close when clicking out now
  * bsmith83 on Tue, 28 Oct 2014 12:43:59 -0700 [View Commit](../../commit/36bce9436752a913422bcfe0f31fa9cefc0abe74)
* KRACOEUS-8219:added compliance summary section
  * Joe Williams on Tue, 28 Oct 2014 15:41:57 -0500 [View Commit](../../commit/be94bf8e1f3fd53cd4c67ce19fecbc7375ff47ca)
* KRACOEUS-8217:removed editable credit splits from summary
  * Joe Williams on Tue, 28 Oct 2014 14:55:59 -0500 [View Commit](../../commit/cb4d8c74fa077a8a2cc2bd7ba56630915519254d)
* KRACOEUS-8164, Fixing deep in NarrativeEvent
  * Shoj on Tue, 28 Oct 2014 15:13:53 -0400 [View Commit](../../commit/e45413464763112e9729a7206d847db8ba091205)
* KRACOEUS-8141:fixed broken tests
  * Joe Williams on Tue, 28 Oct 2014 14:10:33 -0500 [View Commit](../../commit/4e72edacfc363110d89ab89c822e8a9d721cb6ac)
* KRACOEUS-8231: removing reflection
  * Travis Schneberger on Tue, 28 Oct 2014 15:01:34 -0400 [View Commit](../../commit/d6530893976106e3be4a69f1b7a66ebe2f0f6f64)
* KRACOEUS-8224: setting the proposal state.
  * Gayathri on Tue, 28 Oct 2014 11:48:49 -0700 [View Commit](../../commit/4b20664339a9a6c81822fad40f397e6d480a289c)
* KRACOEUS-7595: Adding in the ability to add ad hoc recipients after do is submitted.
  * jamey-rsmart on Tue, 28 Oct 2014 11:23:32 -0700 [View Commit](../../commit/2ba72033ff4dbd869faf0add516779d65ea93e0a)
* KRACOEUS-8213:set employee as default search type for personnel modal
  * Joe Williams on Tue, 28 Oct 2014 10:16:55 -0500 [View Commit](../../commit/87ad08a3055ffe02afa259773a2149f69d8ba96b)
* KRACOEUS-7806: More fixes for proposal hierarchy attachments
  * Gayathri on Tue, 28 Oct 2014 07:33:24 -0700 [View Commit](../../commit/91ddcba10070e5c2b6e985b129625f205d9df474)
* KRACOEUS-8140:fixed STE when calling data validation due to references not being refreshed
  * Joe Williams on Tue, 28 Oct 2014 09:12:21 -0500 [View Commit](../../commit/22e64bc7e874a56aef2ed56357881ec4cefad92c)
* KRACOEUS-7699 : Modular Budget Summary Modal -- showing total
  * yyuan1 on Tue, 28 Oct 2014 00:59:23 -0400 [View Commit](../../commit/1a3f8d0fb7566498902d89b77acbbb9ff4513d57)
* KRACOEUS-7698 : Build General Modular Budget Panel Render from real budget -- save/reculate then display
  * yyuan1 on Tue, 28 Oct 2014 00:52:05 -0400 [View Commit](../../commit/47ef63fc8cd1e5c436c93ea3b18beddc578acfcc)
* KRACOEUS-8183
  * Calculating summary budget Total Sponsor Cost
  * rmancher on Mon, 27 Oct 2014 17:11:19 -0400 [View Commit](../../commit/a5c38fd97d069ca024e261f03d22f65d17c327ec)
* KRACOEUS-6956 : rename KC_DML_01_KRACOEUS-6956_BSTD.sql to KC_DML_01_KRACOEUS-6956_B000.sql
  * yyuan1 on Mon, 27 Oct 2014 19:42:33 -0400 [View Commit](../../commit/9aedc2840229e51b9ff5a3d798c71f3dfd4ae729)
* KRACOEUS-8147 Copy button client validation on
  * bsmith83 on Mon, 27 Oct 2014 16:13:05 -0700 [View Commit](../../commit/8ff8a199bfb960fdec18eb0c6d5dbe1e14b001ee)
* KRACOEUS-8197 Changed visibility and relaxed permissions of copy link, added canCopy editMode
  * bsmith83 on Fri, 24 Oct 2014 18:32:57 -0700 [View Commit](../../commit/903273f516efc903ca7e65487c1f608729c4ba60)
* KRACOEUS-7851: fixing links to work in embedded mode
  * Travis Schneberger on Mon, 27 Oct 2014 17:28:41 -0400 [View Commit](../../commit/ace07e53a0d8a3d511f751ea4a04171c2e64922f)
* KRACOEUS-8141:added server side validation for proposal attachments
  * Joe Williams on Tue, 21 Oct 2014 14:00:20 -0500 [View Commit](../../commit/e909154630ed323d51ab70aef6099681345b830b)
* KRACOEUS-8097:fixed issue with loading screen closing before page is rendered
  * Joe Williams on Mon, 27 Oct 2014 14:38:00 -0500 [View Commit](../../commit/a17a552c1901edf5de1beae0c29206d7f6bb1902)
* KRACOEUS-7968:added auto submit to sponsor
  * Joe Williams on Mon, 27 Oct 2014 12:58:24 -0500 [View Commit](../../commit/12164374e4a54f7aadde48f127e5b905ab7ec350)
* KRACOEUS-7699 : Modular Budget Summary Modal
  * yyuan1 on Mon, 27 Oct 2014 13:21:39 -0400 [View Commit](../../commit/3ab9bf79bb022a6e89f90f2eadff28cd075283be)
* KRACOEUS-7873 fixing IP printing
  * Jay Hulslander on Mon, 27 Oct 2014 11:41:14 -0400 [View Commit](../../commit/71b1256c55a5a77480bac38b454c4afe0baea595)
* KRACOEUS-8202: fixing math & formatting problem
  * Travis Schneberger on Mon, 27 Oct 2014 11:23:14 -0400 [View Commit](../../commit/f46129b4bab213aacc423a6d990de8a02517dfec)
* KRACOEUS-8191:fixed STE when continuedFrom IPdoesn't haven't a s2s_submission associated with it
  * Joe Williams on Mon, 27 Oct 2014 09:41:00 -0500 [View Commit](../../commit/49816e4c18cf56454f36d4d5e48be03b48f56c83)
* KRACOEUS-8161
  * org.kuali.kra.award.printing.service.impl.AwardPrintingServiceImplTest  * anithapolus on Mon, 27 Oct 2014 19:58:05 +0530 [View Commit](../../commit/f965ea864de542a4cd1e3cd702eaac9e7652e12a)
* KRACOEUS-7698 : Build General Modular Budget Panel Render from real budget -display project total requested cost
  * yyuan1 on Sat, 25 Oct 2014 16:09:11 -0400 [View Commit](../../commit/54d6bf35246bd93e60ed6334acf58a9c2274ca45)
* KRAFDBCK-11554
  * “SravanVed” on Thu, 23 Oct 2014 15:57:38 -0400 [View Commit](../../commit/b244b1aa122e90c0759a379d2f932efec62330a5)
* KRACOEUS-8137: Stack overflow fix
  * Gayathri on Fri, 24 Oct 2014 19:21:50 -0700 [View Commit](../../commit/3a6c0971111610826229f943b029acb48f9eb6ec)
* KRACOEUS-8203: rice upgrade
  * Gayathri on Fri, 24 Oct 2014 15:14:00 -0700 [View Commit](../../commit/6b20fe23635ce27ef450085f7dc42ce3039e5b8d)
* KRACOEUS-8191:added previous gg tracking id and agency routing id to sponsor info
  * Joe Williams on Fri, 24 Oct 2014 14:03:13 -0500 [View Commit](../../commit/52b805ab8a4d8be9793339ce4a1b9d8c3024d614)
* KRACOEUS-7789 action list summary view fix
  * bsmith83 on Fri, 24 Oct 2014 13:33:49 -0700 [View Commit](../../commit/24fc1c11b5027326bdbf55b4b53a2eb6655fbd98)
* KRACOEUS-7671
  * Enable validation for personnel and non-personnel cost.
  * KRACOEUS-8072
  * Fix date issue
  * Fix JPA issue.
  * rmancher on Thu, 23 Oct 2014 17:56:17 -0400 [View Commit](../../commit/0e823850a44e0a73abcdc7168b4b07a0a87d08dd)
* KRACOEUS-8178
  * Remove period type search
  * rmancher on Fri, 24 Oct 2014 17:04:55 -0400 [View Commit](../../commit/b2c22e08ed523084470687b69114bdab65fc8bad)
* KRACOEUS-8194:added approval disclaimer when approve button is rendered
  * Joe Williams on Fri, 24 Oct 2014 15:27:41 -0500 [View Commit](../../commit/ec84e456e5a40d484fd52004c687c2b31b6f8ffd)
* KRACOEUS-8193:fixed typo
  * Joe Williams on Fri, 24 Oct 2014 14:41:01 -0500 [View Commit](../../commit/e6fd497a99a0fd7ef82a50dd63ec7db3e75543b1)
* KRACOEUS-8192: adding to the answer api
  * Travis Schneberger on Fri, 24 Oct 2014 15:02:09 -0400 [View Commit](../../commit/4833ec2803dd578621f2ce5087476dc809f8476b)
* KRACOEUS-8181: convenient way to clear pessimistic locks to make it easier for testing.
  * Travis Schneberger on Fri, 24 Oct 2014 13:46:16 -0400 [View Commit](../../commit/bfc97c246f6b844bdc9f1eb6c6de2fe7c201b087)
* KRACOEUS-8186
  * Removing warning message for recalculate
  * rmancher on Fri, 24 Oct 2014 12:34:15 -0400 [View Commit](../../commit/6a796842a8feaeac0ed478b56192180cc90b3960)
* KRACOEUS-8097:fixed budget fix it links
  * Joe Williams on Fri, 24 Oct 2014 11:29:39 -0500 [View Commit](../../commit/fb26da540fc506a6df01478b3bdac1d0b761b7d0)
* KRACOEUS-8190:fixed user attached form validation to check for duplicates before saving
  * Joe Williams on Fri, 24 Oct 2014 11:08:02 -0500 [View Commit](../../commit/6dadb31f18b88969a4b92a72a8ea3aa83347ff2f)
* KRACOEUS-7735:added print all certification on summary page
  * Joe Williams on Fri, 24 Oct 2014 10:43:02 -0500 [View Commit](../../commit/8d02f9dfdfb80cde65988d9770752bee72e7f9bf)
* KRACOEUS-8184
  * Remove Cost Sharing Percent
  * rmancher on Fri, 24 Oct 2014 11:28:13 -0400 [View Commit](../../commit/42071a9fbf25869c9916cae45c06030218e0d6ff)
* KRACOEUS-8091
  * org.kuali.kra.proposaldevelopment.rules.ProposalDevelopmentPermissionsRuleTest
  * :fix  * boneypolus on Thu, 23 Oct 2014 14:20:58 +0530 [View Commit](../../commit/16109da0bf7648618d4753fad755076339bf1e7a)
* KRACOEUS-8163:fixed validation of credit splits, added client side validation to navigation links
  * Joe Williams on Thu, 23 Oct 2014 11:09:10 -0500 [View Commit](../../commit/710cf799149b88e44b8f9be298ae50f2bd70dba4)
* KRACOUES-7597:more data override fixes
  * Joe Williams on Thu, 23 Oct 2014 16:53:22 -0500 [View Commit](../../commit/8d3b5161441d0100d297ec44a1231f6ed2492c0b)
* KRACOEUS-7864 : Build Modular Budget Synced - 2
  * yyuan1 on Thu, 23 Oct 2014 01:15:40 -0400 [View Commit](../../commit/953e4fa2962859e0010a9e628c05925b9c6a8953)
* KRACOEUS-8164
  * Shoj on Thu, 23 Oct 2014 16:29:57 -0400 [View Commit](../../commit/df1ee3f6887d00b2531a387f9c93344fc0266712)
* KRACOEUS-7922:added environment child questions to gg questionnaire
  * Joe Williams on Thu, 23 Oct 2014 14:47:42 -0500 [View Commit](../../commit/46b4b0871aee3076e60af145480a4488a7572f1f)
* KRACOEUS-8165:research.gov errors stop submission
  * Joe Williams on Thu, 23 Oct 2014 12:53:30 -0500 [View Commit](../../commit/fa3c0076d1972e3feed4d00f0c82fa366a3da37e)
* KRACOEUS-7747: fixing conditional rendering of perm elements
  * Travis Schneberger on Thu, 23 Oct 2014 11:04:03 -0400 [View Commit](../../commit/37dca62bde5376928bac54272c920d492c88fe2f)
* KRACOEUS-7860:fix proposal lookup in hierarchy modal
  * Joe Williams on Thu, 23 Oct 2014 09:17:15 -0500 [View Commit](../../commit/9b3db54f2aa4bcd5845e009892a7fcb8c6b0a1ac)
* KRACOEUS-8160 fixing custom data validation
  * Jay Hulslander on Thu, 23 Oct 2014 09:41:38 -0400 [View Commit](../../commit/3a9a80723837d29fc59bf99c936cceb1ddcd5aff)
* KRACOEUS-7747: fixing conditional rendering of copy
  * Travis Schneberger on Thu, 23 Oct 2014 09:16:01 -0400 [View Commit](../../commit/3222d9e4bc9b8fca5672f36477a867c6112f0dfb)
* KRACOEUS-8152 fix for concurrency issues in file upload
  * bsmith83 on Wed, 22 Oct 2014 16:56:57 -0700 [View Commit](../../commit/2172124ed9e691820f27c2ed75ea90b955d5cd66)
* KRACOEUS-7747: adding some permission logic for print, hierarchy, and budget
  * Travis Schneberger on Wed, 22 Oct 2014 14:02:10 -0400 [View Commit](../../commit/025334d0af058bc9438d2e4171121d990bffc0a2)
* KRACOEUS-7699 : Modular Budget Summary Modal
  * yyuan1 on Wed, 22 Oct 2014 12:52:58 -0400 [View Commit](../../commit/e39ba6e597ce843362a7045afbf02545e3048ea7)
* KRACOEUS-7873 creating very basic award  print service test
  * Jay Hulslander on Tue, 21 Oct 2014 15:43:17 -0400 [View Commit](../../commit/e83cf64d25873012c430a53febba562c7ec62471)
* KRACOEUS-8151 radio/checkbox left workaround for add personnel wizards
  * bsmith83 on Tue, 21 Oct 2014 18:41:26 -0700 [View Commit](../../commit/a548fc1267cd93c43848330900af6374a744fbab)
* KRACOEUS-8097:fixing broken tests
  * Joe Williams on Tue, 21 Oct 2014 16:49:44 -0500 [View Commit](../../commit/1e0e05804ce5a2731431ca48ce9b2b695e12890e)
* KRACOEUS-7847 - Fixing s2s submission
  * Shoj on Tue, 21 Oct 2014 18:23:20 -0400 [View Commit](../../commit/d1e01132483f7eac8096b24aa6cc6b07246b498d)
* KRACOEUS-8061 more loading indicator fixes
  * bsmith83 on Tue, 21 Oct 2014 15:14:11 -0700 [View Commit](../../commit/f931ddc4f6555809a54358ccf09a8cb4964117bf)
* KRACOEUS-7682
  * Proposal Budget Summary View

  * KRACOEUS-7684
  * Build budget summary
  * rmancher on Tue, 14 Oct 2014 11:17:11 -0400 [View Commit](../../commit/f94e9659c7b504bb925e8e26de0f90528f4f99de)
* KRACOEUS-8150:removing audit rule limiting NIH proposal titles to 81 characters
  * Joe Williams on Tue, 21 Oct 2014 15:29:37 -0500 [View Commit](../../commit/07c7cd1306d283cd3bf7b7631358201a31a54a3f)
* KRACOEUS-8097:addition audit error fixes
  * Joe Williams on Thu, 16 Oct 2014 16:56:13 -0500 [View Commit](../../commit/51094e0930c9a1fcaafc28f92c31456c7324f418)
* KRACOUES-8097:fixed data validation dialog and fix it links for personnel and credit allocation
  * Joe Williams on Tue, 14 Oct 2014 09:17:45 -0500 [View Commit](../../commit/c1d2304d828f313738d9d3b6ac28ea55ed7c8f92)
* KRACOEUS-7864 : Build Modular Budget Synced
  * yyuan1 on Fri, 17 Oct 2014 00:58:32 -0400 [View Commit](../../commit/987125bc1c9f8e09d29c3335bef18681c9fac691)
* KRACOEUS-7698 : Build General Modular Budget Panel Render from real budget
  * yyuan1 on Mon, 13 Oct 2014 13:20:15 -0400 [View Commit](../../commit/961829e40799ef0f97bbb1ce9a82b787049bc6fc)
* KRACOEUS-8094: special review copy issue
  * Gayathri on Tue, 21 Oct 2014 09:59:29 -0700 [View Commit](../../commit/dd8f91cc352d25b2f800955fafb53ed5b1003b57)
* KRACOEUS-8127 fix fop errors
  * in:ProposalDevelopmentPrintingServiceImplTest  * sasipolus on Tue, 21 Oct 2014 15:22:57 +0530 [View Commit](../../commit/b560400a57f8653e64ae519775b4315ae63d2a44)
* KRACOEUS-8138
  * “SravanVed” on Sat, 18 Oct 2014 13:05:07 -0400 [View Commit](../../commit/654b0d135a78e65c4167bc83dd6f9334b5ec1c5b)
* KRACOEUS-8136
  * “SravanVed” on Sat, 18 Oct 2014 12:46:12 -0400 [View Commit](../../commit/b2ac9fcff35352e2426f9d0697291a3198f77889)
* KRACOEUS-7698 : Build General Modular Budget Panel Render from real budget
  * yyuan1 on Mon, 13 Oct 2014 13:20:15 -0400 [View Commit](../../commit/48f606649c01afbdcdf2393c1ec307bcc3fa8e1c)
* KRACOEUS-8101
  * “SravanVed” on Tue, 14 Oct 2014 13:29:16 -0400 [View Commit](../../commit/72f5e8f3b1faa02013da9618f2ef1ce5bb852d76)
* KRACOEUS-8106:added personnel attachment validation
  * Joe Williams on Wed, 15 Oct 2014 12:53:56 -0500 [View Commit](../../commit/d97d8e177000234ca44df2554a75a3e65c89a7a0)
* KRACOEUS-7615 : Budget Subawards Edit Modal
  * blackcathacker on Wed, 8 Oct 2014 14:02:57 -0700 [View Commit](../../commit/d6715ca43006d1d6a09b2bfc988f744a667c7eae)
* KRACOEUS-8035: Attempting to print COI questionnaire generates STE
  * Chuck Tharp on Mon, 13 Oct 2014 13:39:56 -0400 [View Commit](../../commit/6dd52a3d2a092de0bfd8d1f99892ea9e28cfc76a)

##coeus-6.0.0-s7
* KRAFDBCK-11529 budget dialog loading indicator workaround
  * bsmith83 on Mon, 20 Oct 2014 16:57:57 -0700 [View Commit](../../commit/69d9a3300edac791e35d35ec0123d35b53803ee0)
* KRAFDBCK-11332 close button for lookup modal fix
  * bsmith83 on Mon, 20 Oct 2014 16:52:16 -0700 [View Commit](../../commit/fb6053bbe097ab176ff669888f65ae3637b87d24)
* KRACOEUS-8146: Fixing proposal copy button. This is a temp fix.
  * Gayathri on Mon, 20 Oct 2014 15:27:35 -0700 [View Commit](../../commit/44ec9bfa65dbb994042309f80f6bf18b927603cd)
* KRACOEUS-8096:fixing issue where narrative  references aren't being refreshed so display is rendering code and not the discripiton
  * Joe Williams on Mon, 20 Oct 2014 14:20:35 -0500 [View Commit](../../commit/88f884a39a04f90cc91112a96979192d6c33118a)
* KRACOEUS-7597:fixing data override display values and fix on change js to always be ran
  * Joe Williams on Fri, 17 Oct 2014 13:20:39 -0500 [View Commit](../../commit/6713f0287613c2a9a17114acdf102a716396c153)
* KRACOEUS-8139: Removing Access dialog as functionality has been switched to side navigation link.
  * Jamey Decker on Mon, 20 Oct 2014 08:32:09 -0700 [View Commit](../../commit/4277277db317c57ac5810a13fe78e2d4e680375c)
* KRACOEUS-8135 AwardBudgetLineItemExt are not mapped with JPA, so they need to use legacy data adapter to refresh objects
  * Jay Hulslander on Mon, 20 Oct 2014 10:25:25 -0400 [View Commit](../../commit/1365f8d25df1fd5620e0c4d9c3608d3a82939253)
* KRACOEUS-7860: Attachments sync work
  * Gayathri on Fri, 17 Oct 2014 12:49:56 -0700 [View Commit](../../commit/57e4c796bff82895d5ec79d5eee3c2c8b0068555)
* KRACOEUS-7595: Adding in Ad Hoc Recipient functionality.
  * Jamey Decker on Fri, 17 Oct 2014 15:49:31 -0700 [View Commit](../../commit/e9a9353f6a50b723f0042fbddf7a001d55133859)
* KRACOEUS-8122 Fixed several problems adding and deleting ProposalSite collection elements, and congressional districts
  * bsmith83 on Fri, 17 Oct 2014 13:24:08 -0700 [View Commit](../../commit/e36a0947d1b191a6b6ab7b20cb8d905495e2417d)
* KRACOEUS-8081: fixing proposal delete with a budget with periods
  * Travis Schneberger on Fri, 17 Oct 2014 14:08:53 -0400 [View Commit](../../commit/60258e0cff275f7bc54da8b183b8a22cc6de10d9)
* KRACOEUS-8125 fixing protocols so they route when add hoc approvers are added
  * Jay Hulslander on Fri, 17 Oct 2014 14:32:28 -0400 [View Commit](../../commit/8b6556de0d9a10c881d3781dbe645e62ecf803df)
* KRACOEUS-7282 - No IP Generated
  * Shoj on Fri, 17 Oct 2014 13:45:27 -0400 [View Commit](../../commit/e17771036169738acf22b60dcb53d9658c292d16)
* KRACOEUS-8084
  * org.kuali.kra.s2s.generator.impl.RRSubAwardBudget5_30V1_2GeneratorTest
  * fix  * anithapolus on Fri, 17 Oct 2014 16:46:31 +0530 [View Commit](../../commit/7b59a2001dcb2d01f3fac37f5192d821ebcc47d2)
* KRACOEUS-8085 fix:
  * org.kuali.kra.s2s.rrbudget.RRBudget10V1_3GeneratorTest  * sasipolus on Fri, 17 Oct 2014 15:05:34 +0530 [View Commit](../../commit/346f59604c64f29f8f9ad54ef38fc268e3c38030)
* KRACOEUS-8083
  * org.kuali.kra.s2s.generator.impl.RRSubAwardBudget10_30_1_3V1_3GeneratorTest
  * fix  * anithapolus on Fri, 17 Oct 2014 14:48:04 +0530 [View Commit](../../commit/004a11f3a540d084640502796a21a629e5c86050)
* KRACOEUS-7847 and KRACOEUS-7282
  * Shoj on Thu, 16 Oct 2014 14:59:20 -0400 [View Commit](../../commit/084b037e8197c704cb1a36c6facbfe9043448e15)
* KRACOEUS-7860: Fixing Proposal hierarchy proposal parts
  * Gayathri on Tue, 14 Oct 2014 18:08:10 -0700 [View Commit](../../commit/29dbcb638c9e12667765b719e5d32ab0b707c04c)
* KRACOEUS-8124 fixed award link to not auto search
  * Jay Hulslander on Thu, 16 Oct 2014 16:12:48 -0400 [View Commit](../../commit/ba063d1e3784a43f1ab7829e69a5806baa78593f)
* KRACOEUS-8123 adding protocol type maintenence doc XML into CoreSpringBeans
  * Jay Hulslander on Thu, 16 Oct 2014 15:24:40 -0400 [View Commit](../../commit/445250f4b5de56af46e92215a9b309e253dd1be0)
* KCINFR-982: removing @Ignore, fixing test
  * Travis Schneberger on Thu, 16 Oct 2014 14:29:53 -0400 [View Commit](../../commit/4d473bb8ba9b4b00118123de877d102d513f3f52)
* KCINFR-981: removing @Ignore
  * Travis Schneberger on Thu, 16 Oct 2014 13:47:25 -0400 [View Commit](../../commit/2b52d3658f25c6c489a40973d58461ee778cf6bd)
* KRACOEUS-8121 added in needed attributes reference for AttachmentFile
  * Jay Hulslander on Thu, 16 Oct 2014 13:22:25 -0400 [View Commit](../../commit/41a43d5fd9fe37a5008190eee2c1e4c065a7101e)
* KCINFR-982: removing @Ignore
  * Travis Schneberger on Thu, 16 Oct 2014 12:55:43 -0400 [View Commit](../../commit/13b223c3d7b528725f71faef1d8cbd74bdea0093)
* KCINFR-983: removing @Ignore
  * Travis Schneberger on Thu, 16 Oct 2014 12:52:14 -0400 [View Commit](../../commit/971be7ad2d5a295aedae1a8f97c2d2bc5a031c4f)
* KRACOEUS-7183:fixed issues with attachment notes
  * Joe Williams on Thu, 16 Oct 2014 09:36:25 -0500 [View Commit](../../commit/e5cbda18f1e35293858d5d9edae722febf18ae6d)
* KRACOEUS-7200:added print reports
  * Joe Williams on Wed, 15 Oct 2014 13:52:03 -0500 [View Commit](../../commit/e5ab26791ff0ec2f7e428a37b767c338d1ac7d69)
* KRACOEUS-8086 fix: org.kuali.kra.s2s.rrbudget.RRBudgetV1_3GeneratorTest  * boneypolus on Thu, 16 Oct 2014 18:57:39 +0530 [View Commit](../../commit/e5de56fbd3e4e1161d3361f509e25c95e9e88331)
* KRACOEUS-8089 org.kuali.kra.s2s.rrsf424.RRSF424V1_2GeneratorTest fix  * mrudulpolus on Thu, 16 Oct 2014 17:44:42 +0530 [View Commit](../../commit/4fb90bbf446b5fef03d3bb4149b364a20f0583a6)
* KRACOEUS-8090 org.kuali.kra.s2s.rrsf424.RRSF424_2_0_V2GeneratorTest fix  * mrudulpolus on Thu, 16 Oct 2014 16:46:00 +0530 [View Commit](../../commit/29659e4d5504c0232c9e91cf226f528eae6f9adc)
* KRACOEUS-8088 fix:
  * org.kuali.kra.s2s.rrfednonfedbudget.RRFedNonFedBudgetV1_1GeneratorTest  * sasipolus on Thu, 16 Oct 2014 15:25:43 +0530 [View Commit](../../commit/49d34e3f090e1f956d14167018be2a84c6ff5531)
* KRACOEUS-8087 fix:
  * org.kuali.kra.s2s.rrfednonfedbudget.RRFedNonFedBudget10V1_1GeneratorTest  * sasipolus on Thu, 16 Oct 2014 14:20:08 +0530 [View Commit](../../commit/cc3ceaf5186f5c6f8380cfbb90d8fcb857d4950a)
* KRACOEUS-8116 : Use dataObjectService for PD
  * blackcathacker on Wed, 15 Oct 2014 19:40:33 -0700 [View Commit](../../commit/29142a9a1373f691445359e66b094737222a18a8)
* KRACOEUS-8115 : Budget permissions
  * blackcathacker on Thu, 9 Oct 2014 12:51:10 -0700 [View Commit](../../commit/8a3c4ef38bb327424991379d364d85e97c80a100)
* KRACOEUS-8105:removing invalid document level roles
  * Joe Williams on Wed, 15 Oct 2014 10:44:24 -0500 [View Commit](../../commit/a4da0db1575c5312d55e0fcb6346ea0ad40e4b98)
* KRACOEUS-8099:only update file name on the s2s form not on attachments page
  * Joe Williams on Tue, 14 Oct 2014 10:32:18 -0500 [View Commit](../../commit/e4476186acb888e65baad5c8b20a1f38086ec6ad)
* KRACOEUS-8082
  * org.kuali.kra.s2s.generator.impl.PHS398ModularBudgetV1_2GeneratorTest
  * fix  * mrudulpolus on Wed, 15 Oct 2014 17:05:32 +0530 [View Commit](../../commit/220bc661c831af5888a86739e441fa9534539da3)
* KRACOEUS-8108 : Fix budget rates and lower memory/db usage of toString
  * blackcathacker on Tue, 14 Oct 2014 21:21:11 -0700 [View Commit](../../commit/1974deace0678c66d7e961e7db6b69f4e474d8ff)
* KRACOEUS-7884 medusa and copy links/views for lookup proposal view
  * bsmith83 on Mon, 13 Oct 2014 12:21:36 -0700 [View Commit](../../commit/e2b6652b14b832658004ea9b3f3f5abc2a13e282)
* KRACOEUS-7579
  * “SravanVed” on Tue, 14 Oct 2014 12:53:49 -0400 [View Commit](../../commit/74616611f881202bbda9aff01ef51452b1644353)
* KRACOEUS-8104: fixing tests
  * Travis Schneberger on Tue, 14 Oct 2014 12:10:31 -0400 [View Commit](../../commit/cab425bf046dc0254401639fb7b89bab41201f68)
* KRACOEUS-8104: fix build
  * Gayathri on Tue, 14 Oct 2014 07:52:44 -0700 [View Commit](../../commit/345c40c4280ad78ada830d5e5a59be8336d418ee)
* KRACOEUS-8063: establishing a common proposal module, setting up autowiring correctly.
  * Travis Schneberger on Tue, 14 Oct 2014 10:49:40 -0400 [View Commit](../../commit/79783966d18391c4eb06610b855ba575e7741593)
* KRACOEUS-8070
  * Budget person sort order - set to same as proposal person
  * Also changes to grouping personnel included.
  * rmancher on Mon, 13 Oct 2014 12:33:16 -0400 [View Commit](../../commit/d98bd55b7c3bb0aafabc3af91cc254128fd2f175)
* KRACOEUS-8076
  * “SravanVed” on Thu, 9 Oct 2014 14:44:02 -0400 [View Commit](../../commit/d09761ed7e861d488b6af13a557fcbc9e4e8a629)
* KRACOEUS-8079:created proposal hierarchy summary
  * Joe Williams on Fri, 10 Oct 2014 07:46:53 -0500 [View Commit](../../commit/206b5390a8e4d75613cb9f28a2d370f7f5f9b1e2)
* KRACOEUS-8104: properly initializing PD doc
  * Travis Schneberger on Tue, 14 Oct 2014 08:52:48 -0400 [View Commit](../../commit/24b35c7217d36558087ecb43a2630051fdb26b8b)
* KRACOEUS-8102: add newlines
  * Travis Schneberger on Tue, 14 Oct 2014 07:56:57 -0400 [View Commit](../../commit/3522c578b8d2a6154087576c457ca86566144dd5)
* KRACOEUS-7905 	budget header overlap fix
  * bsmith83 on Mon, 13 Oct 2014 17:46:00 -0700 [View Commit](../../commit/f8e9cb2f7e385575340bdf356cf4f6c448f7aa94)
* KRACOEUS-7996 fixed character validation for the description fields
  * Jay Hulslander on Mon, 13 Oct 2014 15:27:44 -0400 [View Commit](../../commit/6739ef5b7ce3085ae157aaf838128b5f7a7ab779)
* KRACOEUS-8033
  * Multiple dialogs refresh issue - Moving dialogs to page level
  * rmancher on Mon, 13 Oct 2014 14:51:58 -0400 [View Commit](../../commit/fb5d1243785866a7d6a97bfc2a00eaac6ca42e98)
* KRACOEUS-8098:removing sorting on add for key personnel
  * Joe Williams on Mon, 13 Oct 2014 12:57:09 -0500 [View Commit](../../commit/0b5bce66adb8f78c2ec5cb0a9e7e1e114b253fa3)
* KRACOEUS-8096:fixed issue with narrative type ref not updating on save of institute attachmetns
  * Joe Williams on Mon, 13 Oct 2014 11:03:52 -0500 [View Commit](../../commit/5944892d319f558fa6220f6d3be3c33b6bc97107)
* KRACOEUS-7597:fixing data override
  * Joe Williams on Mon, 13 Oct 2014 10:17:09 -0500 [View Commit](../../commit/ed7145012afb9c95c9f63e4bc7e52e9ee7b413a4)
* KRACOEUS-8058 fixed OJB mapping and added an award budget work around
  * Jay Hulslander on Thu, 9 Oct 2014 16:13:21 -0400 [View Commit](../../commit/ffc777b6e2bb3ac7fa1043ba6ac0f89ef73afcae)
* KRACOEUS-8093: correct changes to awardtype
  * Travis Schneberger on Fri, 10 Oct 2014 13:26:55 -0400 [View Commit](../../commit/c0540b052ab76b4a1069314b86d60708c1027ee4)
* KRACOEUS-8072
  * Fix default period update
  * KRACOEUS-8073
  * Calculate salary once line item is updated
  * KRACOEUS-8071
  * Fix for personnel period save - memory issue
  * Adjusting JPA mapping and removing some debugs
  * rmancher on Fri, 10 Oct 2014 11:50:31 -0400 [View Commit](../../commit/d2dbf7dedc2ae50973806ec1d106e4542cf74f7a)
* KCINFR-979: add missing component
  * Travis Schneberger on Fri, 10 Oct 2014 10:25:04 -0400 [View Commit](../../commit/770312f73aaf238ade450d9147c6b0f455e075a1)
* KRACOEUS-7109: fix mysql script
  * Travis Schneberger on Fri, 10 Oct 2014 10:24:39 -0400 [View Commit](../../commit/70634541688ff30830ef96c5c86c7a68d35eea57)
* KRACOEUS-6294: fix mysql script
  * Travis Schneberger on Fri, 10 Oct 2014 10:24:25 -0400 [View Commit](../../commit/421e1371b3059bc94bd13d1c4b0d3708079b7ba6)
* KRACOEUS-6954: fix mysql script
  * Travis Schneberger on Fri, 10 Oct 2014 10:21:06 -0400 [View Commit](../../commit/0318d50de48b5644f76e3b4f3f966f58a54df201)
* KRACOEUS-7120: fix mysql script
  * Travis Schneberger on Fri, 10 Oct 2014 10:20:52 -0400 [View Commit](../../commit/c3125d17a118296de24bda51ba5aa1d537530359)
* KRACOEUS-8092 : Rice upgrade
  * blackcathacker on Wed, 8 Oct 2014 14:04:13 -0700 [View Commit](../../commit/5c8ec59cfb5f04682bf57a95c3314e6d9aac6b1b)
* KRACOEUS-8068: fix SpringBeanConfigurationTest
  * Travis Schneberger on Thu, 9 Oct 2014 16:55:07 -0400 [View Commit](../../commit/960bc3a155be7f5864eda51f19bd3d700164b60f)
* KRACOEUS-8062:fixed issue with rrsf424 validation errors
  * Joe Williams on Thu, 9 Oct 2014 15:37:33 -0500 [View Commit](../../commit/6ab18ecb53f9c83dcf300b592823d486a1cec22f)
* KRACOEUS-8068: improving the performance of the document rejection service.
  * Travis Schneberger on Thu, 9 Oct 2014 16:27:37 -0400 [View Commit](../../commit/2718f02d8f694869b03bd5053b5edf7fbde469b1)
* KRACOEUS-8074
  * Fix Non-Personnel out years message
  * KRACOEUS-8069
  * Fix STE out of period 1
  * rmancher on Thu, 9 Oct 2014 12:27:41 -0400 [View Commit](../../commit/2e53681e50366e5eb744545fc78b65c2ea3f8aa0)
* KRACOEUS-8068: removing a couple imports
  * Travis Schneberger on Thu, 9 Oct 2014 11:02:32 -0400 [View Commit](../../commit/2aa5b6dd026d680e0c4333b40ee58767306341cf)
* KRACOEUS-8068: adding missing sql script & mapping change for previous jpa change
  * Travis Schneberger on Thu, 9 Oct 2014 10:05:51 -0400 [View Commit](../../commit/418df3978e7d8222ad562eef9c9c3ac9d9bd5e86)
* KRACOEUS-8068: fix SpringBeanConfigurationTest
  * Travis Schneberger on Thu, 9 Oct 2014 09:43:54 -0400 [View Commit](../../commit/b58fe028a1f338e82bc0946c62c3befcd75d2600)
* KRACOEUS-8036: Unit Hierarchy exception on copy
  * Chuck Tharp on Wed, 8 Oct 2014 19:09:04 -0400 [View Commit](../../commit/104049ed5ed632e5d0cc9a70233f098c9719d2fc)
* KRACOEUS:added questionnaire update dialog
  * Joe Williams on Tue, 7 Oct 2014 16:36:15 -0500 [View Commit](../../commit/b4d0451ba3fbabc05414054dac1c166ce20abdf2)
* KRACOEUS-7940
  * “SravanVed” on Mon, 29 Sep 2014 13:21:07 -0400 [View Commit](../../commit/36c81a40dcd702d7ae67eda358502c1cf9f1bd94)
* KRACOEUS-7756: fixing compiler error
  * Travis Schneberger on Tue, 7 Oct 2014 15:47:26 -0400 [View Commit](../../commit/ad4e142a8467619cc10e949fd96b783f860e82ae)
* KRACOEUS-8057:removed runtime exception for missing section names
  * Joe Williams on Tue, 7 Oct 2014 14:10:25 -0500 [View Commit](../../commit/57151ab410b847fcc9cfab0405d479f4c662b63c)
* KRACOEUS-7894:fixed issues with rendering child questions on load
  * Joe Williams on Tue, 7 Oct 2014 14:02:55 -0500 [View Commit](../../commit/6ec8c92bc7cd9751bd1055ceb9b0a5455d0689e4)
* KRACOEUS-7200:added print gov forms and print sponsor forms
  * Joe Williams on Tue, 7 Oct 2014 08:41:25 -0500 [View Commit](../../commit/cfbc1a4c13fcfe74432b88e9f96d8f5f4c5d57be)
* KRACOEUS-8033
  * Fix Proposal budget non-personnel cost - dialog refresh issue
  * rmancher on Tue, 7 Oct 2014 11:38:33 -0400 [View Commit](../../commit/e5a256d81b5ace1c6360e567eb7fab55ac1857f3)
* KRACOEUS-8044 persisting budgetperiods, and working around awards not being autowired
  * Jay Hulslander on Tue, 7 Oct 2014 11:29:40 -0400 [View Commit](../../commit/c1af874c2eb8a78abbf94cb230abc86b68c7c2cd)
* KRACOEUS-8057:making section name a none required field on kc validation action
  * Joe Williams on Tue, 7 Oct 2014 09:18:29 -0500 [View Commit](../../commit/e11f37b68e703a582f4966a7dc31028d45886390)
* KRACOEUS-7618 : Budget Notes/Consolidate Expense Justifications
  * yyuan1 on Wed, 1 Oct 2014 16:35:46 -0400 [View Commit](../../commit/e1245ce1db052ed0b053af6e51acccdfed9094c6)
* KRACOEUS-8040: Fixing s2s submission copy
  * Gayathri on Mon, 6 Oct 2014 18:07:08 -0700 [View Commit](../../commit/01c1753762adf4c553b04201cf41f8f743e04c4c)
* KRACOEUS-7893: Remove method accessible annotation in PD
  * Gayathri on Mon, 6 Oct 2014 18:19:01 -0700 [View Commit](../../commit/118c2e6dd41383166c7421f47a275b9187696508)
* KRACOEUS-8055
  * Delete line items from database when delete action is performed.
  * rmancher on Mon, 6 Oct 2014 17:01:01 -0400 [View Commit](../../commit/410f391540affa1e02a87527ce1faef40e8de108)
* KRACOEUS-7779:added row numbers to attachment collections
  * Joe Williams on Mon, 6 Oct 2014 14:03:36 -0500 [View Commit](../../commit/57ce493e54cc6693a187199fcbbf2cb26496cd53)
* KRACOEUS-8010: fixing several award bugs
  * Travis Schneberger on Mon, 6 Oct 2014 09:57:48 -0400 [View Commit](../../commit/cec2abd7b9d8e67a27e818581eec215b137f9f8e)
* KRACOEUS-8031 added unit validation to award person
  * Jay Hulslander on Fri, 3 Oct 2014 13:56:58 -0400 [View Commit](../../commit/3e0457a680ef5d4d6a5f9e38c77aca5560c0e9ff)
* KRACOEUS-8026: Reviewer assignments are not accepted by IACUC
  * Chuck Tharp on Fri, 3 Oct 2014 13:01:05 -0400 [View Commit](../../commit/af58c3cbe45ee83c5725f96be436c292cd9c57ff)
* KRACOEUS-7721
  * “SravanVed” on Wed, 1 Oct 2014 09:43:12 -0400 [View Commit](../../commit/1ab21eb8290cb13b69d8631f2393a7588ec87df1)
* KRACOEUS-8009 : Convert Unrecovered F&A panel to Button-less Edit
  * yyuan1 on Mon, 29 Sep 2014 00:10:28 -0400 [View Commit](../../commit/1f6c1596e5a3644a2272689a74f2a7ca0b2c3769)
* KRACOEUS-7998: Unmask CSS file spec in config to allow inclusion of fancybox CSS
  * Chuck Tharp on Tue, 30 Sep 2014 13:33:28 -0400 [View Commit](../../commit/0708fc6f3c7fd77fe4ed2fd2f9f98e2494691574)
* KRACOEUS-7999: Stack trace when trying to view undisclosed events
  * Chuck Tharp on Thu, 25 Sep 2014 21:03:09 -0400 [View Commit](../../commit/ef1a6fb8f911a243bbad9b10006dd4349f6b735b)
* KRACOEUS-7757 Proposal Budget Services tests   * anithapolus on Mon, 25 Aug 2014 15:42:35 +0530 [View Commit](../../commit/033a1eace85d4c94293e5f7f73a91f905755873b)
* KRACOEUS-7756 Proposal Person Services tests 
  * anithapolus on Thu, 4 Sep 2014 18:14:06 +0530 [View Commit](../../commit/ea86a53ea657ee980cdbed231f9685197e0df667)
* KRACOEUS-7960
  * Proposal Person Mass Change Service tests  * anithapolus on Fri, 26 Sep 2014 17:55:04 +0530 [View Commit](../../commit/a079189edfb0ed475cfa56ffe621fb044c476efa)
* KRACOEUS-7758
  * Proposal Printing Services tests  * boneypolus on Wed, 24 Sep 2014 19:30:17 +0530 [View Commit](../../commit/622baebc082952ef3a60a48c31ca3924ec523cd0)
* KRACOEUS-7760	
  * Proposal Special Review Service test  * mrudulpolus on Thu, 4 Sep 2014 17:25:29 +0530 [View Commit](../../commit/e2709a58ee3658c15890ff0649f8138581d71525)
* KRACOEUS-7759 Proposal Person S2S Questionnaire Service test  * sasipolus on Tue, 26 Aug 2014 20:55:10 +0530 [View Commit](../../commit/384899ddbe1d3969f4e1de55d6728994da4a311c)

##coeus-6.0.0-s6
* KRACOEUS-8039:Fixing proposal tests
  * Gayathri on Fri, 3 Oct 2014 17:05:24 -0700 [View Commit](../../commit/0c8af1046279b602b5a22e91fa8cdf46abd246d4)
* KRACOEUS-8034:fix questionnaire sequence number
  * Joe Williams on Fri, 3 Oct 2014 16:09:21 -0500 [View Commit](../../commit/e320497ceac6272a90dedc706445f98308397ac2)
* KRACOEUS-7876: Fixing delete. Making sure proposal gets deletd and user cannot view deleted proposal anymore.
  * Gayathri on Fri, 3 Oct 2014 10:52:52 -0700 [View Commit](../../commit/251706b5301f7b5b0055ed2553d4d43ba659ae9d)
* KRACOEUS-7644
  * Fix for Add person TBN collection
  * rmancher on Fri, 3 Oct 2014 15:12:59 -0400 [View Commit](../../commit/ab644ca8c130582cfb16e516c51f9749c44d83bb)
* KRACOEUS-7613, KRACOEUS-7614 : Code review changes
  * blackcathacker on Fri, 3 Oct 2014 11:53:10 -0700 [View Commit](../../commit/5d3faee4aa3134c4f680aaa9503ffbf85794204e)
* KRACOEUS-8037: Fixing TM single node transactions issue
  * Gayathri on Fri, 3 Oct 2014 11:32:48 -0700 [View Commit](../../commit/1a6755faa1145f62a24bcd0b3f6d163622e8ae71)
* KRACOEUS-7779:attachment count refreshes on aadding an attachment
  * Joe Williams on Fri, 3 Oct 2014 10:20:59 -0500 [View Commit](../../commit/002efb6da3ddde70e9634251ebebfa6862210fe4)
* KRACOEUS-8029 setting activity_number length to 3 in DD per actual database field size
  * Jay Hulslander on Thu, 2 Oct 2014 15:02:25 -0400 [View Commit](../../commit/8a246d2fc8b1c132a57454802a3e7d8135586b5f)
* KRACOEUS-7613, KRACOEUS-7614 : Budget Subawards
  * blackcathacker on Thu, 28 Aug 2014 09:31:32 -0700 [View Commit](../../commit/d195ffd5999a93a0514d3abca8f3ea30cdef2bb9)
* KRACOEUS-7689
  * Rendering of Non-Personnel costs panel
  * KRACOEUS-7690
  * Add assign non-personnel costs
  * rmancher on Wed, 1 Oct 2014 22:41:14 -0400 [View Commit](../../commit/e31b8c210857efca2a04e02fc5ac4c2661906363)
* KRACOEUS-8032 Fix to binding editors for prop science keyword and compliance, compliance binding fix also fixes save issues described in KRACOEUS-8008
  * bsmith83 on Thu, 2 Oct 2014 15:09:14 -0700 [View Commit](../../commit/4e8b46a779341899281ddc876e4a083c33a24c24)
* KRACOEUS-7842:fixed issues with add wizard
  * Joe Williams on Thu, 2 Oct 2014 17:04:14 -0500 [View Commit](../../commit/52b77e2a2d7dd6e927e98b2aa273daf3bb1d591f)
* KRACOEUS-7982:fixed s2s revision code other description
  * Joe Williams on Thu, 2 Oct 2014 13:09:59 -0500 [View Commit](../../commit/c6b0cda27c943d4281e771f49546a645d2ce4153)
* KRACOEUS-8025 fixing questionnaire lookup
  * Jay Hulslander on Wed, 1 Oct 2014 14:56:42 -0400 [View Commit](../../commit/cbc2b884ecfe90a25790d28f22ade14129c998fb)
* KRACOEUS-8001: Rename SQL files so they run under Rice schema instead of KC
  * Chuck Tharp on Thu, 2 Oct 2014 10:35:45 -0400 [View Commit](../../commit/321186322c48565a6345acaa18650f99d30a1817)
* KRACOEUS-7921:recall action should not render when proposal state is revision requested
  * Joe Williams on Thu, 2 Oct 2014 09:20:26 -0500 [View Commit](../../commit/b7b4c558ad3f5f6f32a00ceea7e5b11ef1854bc0)
* KRACOEUS-7589:removing enableSummaryDataValidationPanel parameter
  * Joe Williams on Thu, 2 Oct 2014 08:13:46 -0500 [View Commit](../../commit/00b56cce7a827c5f45b2df483374a5a00f77df61)
* KRACOEUS-7984 fixed duplicate ids causing duplicate error messages, reduced number of message summary blocks by 1
  * bsmith83 on Wed, 1 Oct 2014 17:50:21 -0700 [View Commit](../../commit/ee3b872013f3c774c04a5daf7f5ef37bccaa83b3)
* KRACOEUS-7592:added reject action
  * Joe Williams on Wed, 1 Oct 2014 15:24:48 -0500 [View Commit](../../commit/84d0995d2336a62b5e30ae8273c25589c3e0b715)
* KRACOEUS-7932 fixing ProposalLogStatusValuesFinder
  * Jay Hulslander on Wed, 1 Oct 2014 13:30:17 -0400 [View Commit](../../commit/7476b27b4bfb36ad73ca80430369d7cb6244be87)
* KRACOEUS-8022 fixed various issues with ProposalLogLookupableHelperServiceImpl
  * Jay Hulslander on Tue, 30 Sep 2014 15:14:47 -0400 [View Commit](../../commit/1c7be0bdf590572ef238ecc6997769a4fc25458e)
* KRACOEUS-7926
  * “SravanVed” on Tue, 30 Sep 2014 10:10:58 -0400 [View Commit](../../commit/5caa9a9fefcbc3c277776a2a260e38cafbf14233)
* KRACOEUS-8027: Increase length of Negotiation Agreement Type
  * Chuck Tharp on Tue, 30 Sep 2014 23:28:19 -0400 [View Commit](../../commit/52ee59d318469ecb41aad53592adc3585ad488e1)
* KRACOEUS-7428 user preference link in user menu
  * bsmith83 on Tue, 30 Sep 2014 17:03:51 -0700 [View Commit](../../commit/8c2a6078e3dbca00ecd00f99d195ce235d6c1773)
* KRACOEUS-7410 Logout and current user header fix
  * bsmith83 on Tue, 30 Sep 2014 16:13:26 -0700 [View Commit](../../commit/2255ccde8937f94e49a05c55efbf9d3ca4d6678f)
* KRACOEUS-8001: Remove Parameter proposaldevelopment.approver.view.title
  * Chuck Tharp on Mon, 29 Sep 2014 12:41:47 -0400 [View Commit](../../commit/438645bc25fe337a115aa4a3597adc0887410e25)
* KRACOEUS-8008 fix for additional dialog fields causing stack trace
  * bsmith83 on Tue, 30 Sep 2014 11:08:34 -0700 [View Commit](../../commit/ba303ad3c5ca0df24fb28af00d2b0faccb6ac653)
* KRACOEUS-7116:added submission details
  * Joe Williams on Tue, 30 Sep 2014 11:05:04 -0500 [View Commit](../../commit/7bda15bf5bad5a008a3979a744875c71832d18da)
* KRACOEUS-8020 fixed object path in JSP so links work
  * Jay Hulslander on Tue, 30 Sep 2014 11:19:14 -0400 [View Commit](../../commit/5b5d1ac3c32981d788379bbc577b1b138ba472db)
* KRACOEUS-8019 fixed NPE when PI does not have a home unit
  * Jay Hulslander on Tue, 30 Sep 2014 10:58:47 -0400 [View Commit](../../commit/ee0e37364b2be0f9c7dc623b42c93456883ec90a)
* KRACOEUS-8015 switching arg values lookup search to use business object service
  * Jay Hulslander on Tue, 30 Sep 2014 09:53:56 -0400 [View Commit](../../commit/2a09d13c5e256494e265c27982ce2e7790156544)
* KRACOEUS-7910:owned by unit of new rolodex defaults to users home unit
  * Joe Williams on Tue, 30 Sep 2014 09:08:46 -0500 [View Commit](../../commit/43bfcbe36e78bc240bd3e2cbded8e611048aa26b)
* KRACOEUS-7674
  * Set sort order for budget periods
  * rmancher on Mon, 29 Sep 2014 20:53:31 -0400 [View Commit](../../commit/a660140854b9869ffdf477370165d749f73f80da)
* KRACOEUS-7617 : Integrate basic view page for Budget Notes
  * yyuan1 on Fri, 26 Sep 2014 14:57:57 -0400 [View Commit](../../commit/cb76f62dce97952165a23224964afe618ee97502)
* KRACOEUS-7854: Fixing non-employee issues
  * Gayathri on Mon, 29 Sep 2014 12:35:27 -0700 [View Commit](../../commit/6e0773f3c6b0fba28a896f040f816fa2ce6c3a98)
* KRACOEUS-7745:clear congressional district if organziation doesn't have a default
  * Joe Williams on Mon, 29 Sep 2014 14:27:16 -0500 [View Commit](../../commit/f4a35d255500881db4855adfa0ab16e400e56a3a)
* KRACOEUS-7831:added future requests dialog to submit action
  * Joe Williams on Mon, 29 Sep 2014 14:02:37 -0500 [View Commit](../../commit/71a5ff426eb3207d8be3791f7aa0ab2362d8a9e7)
* KRACOEUS-7910: added add address book feature
  * Joe Williams on Fri, 26 Sep 2014 15:13:05 -0500 [View Commit](../../commit/4efaa383508d8e506beb6c3516d6b4225221abdc)
* KRACOEUS-7522:converted attachments to use edit with modals
  * Joe Williams on Thu, 25 Sep 2014 10:03:44 -0500 [View Commit](../../commit/1fff98f4c84cc2c6bc93daf9633e55798ca7bf99)
* KRACOEUS-7522:added view/edit rights to attachments
  * Joe Williams on Tue, 23 Sep 2014 16:04:39 -0500 [View Commit](../../commit/dd3e1244c1c6d90c3532e1f95353360b9d28aa39)
* KRACOEUS-7982:fixed s2s revision description
  * Joe Williams on Mon, 29 Sep 2014 10:09:38 -0500 [View Commit](../../commit/498ee0e1c0d8cd9f4bcc205f3539afbef4751085)
* KRACOEUS-8002 fixing protcol schedule attachments
  * Jay Hulslander on Thu, 25 Sep 2014 15:55:23 -0400 [View Commit](../../commit/53b02db4f4f567f77c65fa2a8af90ff3a55256e2)
* KRACOEUS-7674
  * Integrate Budget Personnel Period Mockview
  * KRACOEUS-7676
  * Period Assign Personnel Button Interaction
  * KRACOEUS-7675
  * Personnel Period calculation
  * KRACOEUS-7677
  * Edit Personnel Interaction
  * KRACOEUS-7677
  * Add details and rates interaction.
  * rmancher on Wed, 17 Sep 2014 14:46:08 -0400 [View Commit](../../commit/0091221fdf3d8bdd6012065f481d825a65df103e)
* KRAFDBCK-11199 ie nav overlap fix
  * bsmith83 on Fri, 26 Sep 2014 16:09:20 -0700 [View Commit](../../commit/e5bac84608c1593b6dbffb7e95f9861be71c54a9)
* KRACOEUS-7516: Implementing PersonEditableFields functionality Key Personnel.
  * Jamey Decker on Thu, 25 Sep 2014 18:49:09 -0700 [View Commit](../../commit/53545c53fb322f3af76181352231055291acdf9f)
* KRACOEUS-7905 document header styling fixes for page change
  * bsmith83 on Fri, 26 Sep 2014 16:00:24 -0700 [View Commit](../../commit/a409d1eac913b47b40fe0a1906dc6e0d8387121e)
* KRACOEUS-7894:fixes questionnaire js issues
  * Joe Williams on Fri, 26 Sep 2014 17:00:59 -0500 [View Commit](../../commit/a5aaf9ceafb07085862ba3579289274180c96496)
* KRACOEUS-7870: STE after adding Proposal as a Protocol funding source
  * Chuck Tharp on Thu, 25 Sep 2014 10:44:03 -0400 [View Commit](../../commit/bafa4cef6ecda4d4fae1778750282d4f9ee88def)
* KRACOEUS-7991 : Code review changes
  * blackcathacker on Fri, 26 Sep 2014 10:14:38 -0700 [View Commit](../../commit/ae587e1fb2eb1b916c56f0b4fd4b8e5570a23771)
* KRACOEUS-7982:added s2s revision type other description field
  * Joe Williams on Thu, 25 Sep 2014 11:22:04 -0500 [View Commit](../../commit/20da66790f346c88235abfc1ec51fa8dbaf08799)
* KRACOEUS-7539:set multipart file max upload size to MAX_FILE_SIZE_DEFAULT_UPLOAD parameter value
  * Joe Williams on Thu, 25 Sep 2014 13:32:01 -0500 [View Commit](../../commit/b7d5a5fe1afa41df4940e5f5243df3535e7a6914)
* KRACOEUS-8005:fixed issue with credit split saving
  * Joe Williams on Fri, 26 Sep 2014 09:12:27 -0500 [View Commit](../../commit/0f51ec82689d191c6e5f30552feec3b3b93e48a0)
* KRACOEUS-7991 : Futher fixes to award budget
  * blackcathacker on Thu, 25 Sep 2014 21:33:19 -0700 [View Commit](../../commit/3cdcbd6ab9c6e25a95bc194c1160c2815b3c7ed6)
* KRACOEUS-7905 document header styling fixes
  * bsmith83 on Thu, 25 Sep 2014 13:20:18 -0700 [View Commit](../../commit/b9b7a1c2843439e2dc92f9899c349b275cb2f9af)
* KRACOEUS-7996 fixing NPEs on error handling
  * Jay Hulslander on Thu, 25 Sep 2014 10:08:48 -0400 [View Commit](../../commit/97ec83b687a223eeb8a9b7dbe409f7d38ef3f11a)
* KRACOEUS-7994 fixed NPEs
  * Jay Hulslander on Thu, 25 Sep 2014 08:37:42 -0400 [View Commit](../../commit/8c3a121b0bef5421cc1d3435d6c0a3a625b9874c)
* KRACOEUS-7644
  * Remove refresh on cancel
  * rmancher on Wed, 24 Sep 2014 20:21:27 -0400 [View Commit](../../commit/8eb738fb05c96c3386470c1876ad0b0e7e0dbf23)
* KRACOEUS-7991 : Rename hackedDocumentNextValue and remove hack
  * blackcathacker on Wed, 24 Sep 2014 16:05:34 -0700 [View Commit](../../commit/a12cda46d1a2f0b62e56530d071dd6df357cd513)
* KRACOEUS-7991 : Remove proposalBudgetFlag and other code review comments
  * blackcathacker on Wed, 24 Sep 2014 13:55:56 -0700 [View Commit](../../commit/d1ef9d7ea9f1a55352473e395e26c4fead7e6954)
* KRACOEUS-7983: Added check icons to questionaire to indicate completion.
  * Jamey Decker on Wed, 24 Sep 2014 12:23:25 -0700 [View Commit](../../commit/ebbb8902726d5391bdf35a347731a57515fd34c0)
* KRACOEUS-7913 nav menu fix for all screen sizes, css cleanup
  * bsmith83 on Wed, 24 Sep 2014 14:53:07 -0700 [View Commit](../../commit/e1cfc9b4628e941379cbd4b7f1d6fc6282c7880c)
* KRACOEUS-7991 : Fix tag and ojb mapping errors
  * blackcathacker on Tue, 23 Sep 2014 18:05:45 -0700 [View Commit](../../commit/8bd29c78c452c3d749ef6234043e514d1da162f2)
* KRACOEUS-7991 : Struts actions must be in a single package for wildcarding
  * blackcathacker on Tue, 23 Sep 2014 13:24:20 -0700 [View Commit](../../commit/a353e0c2906d84bc2a53394e67270f183916cb9f)
* KRACOEUS-7309 : Remove BudgetDocument and replace with AwardBudgetDocument
  * blackcathacker on Mon, 22 Sep 2014 17:54:33 -0700 [View Commit](../../commit/d73650836f95223e55e189749aa92e2c2f319935)
* KRACOEUS-7991 : Fixing AwardBudget
  * blackcathacker on Mon, 22 Sep 2014 15:14:30 -0700 [View Commit](../../commit/62fe9c1e6f3a506e1f93d47320b3e7331799c7b3)
* KRACOEUS-7747: code review comments
  * Travis Schneberger on Wed, 24 Sep 2014 16:52:36 -0400 [View Commit](../../commit/56599f8d248bef7ba2cbd5b6033ed154abf466c4)
* KRACOEUS-7809: Fixing proposal persons routing
  * Gayathri on Wed, 24 Sep 2014 13:52:32 -0700 [View Commit](../../commit/1390ab06ba2fc31d2fc4902758e242cc83b07ec7)
* KRACOEUS-7747: code review comments
  * Travis Schneberger on Wed, 24 Sep 2014 14:33:03 -0400 [View Commit](../../commit/4bf11621c1a762c184de16baf46481c0c36e5a6d)
* KRACOEUS-7993 fixed OJB mapping
  * Jay Hulslander on Wed, 24 Sep 2014 13:03:43 -0400 [View Commit](../../commit/48ec506e3b34d0b4df0a5d677dad8401c8cba71c)
* KRACOEUS-7378:updated to development proposal search
  * Joe Williams on Mon, 22 Sep 2014 11:36:13 -0500 [View Commit](../../commit/04c85ec0972e47c8ab510fc39326161a405aaaca)
* KRACOEUS-7827
  * “SravanVed” on Thu, 18 Sep 2014 21:19:09 -0400 [View Commit](../../commit/7dec429d8464f5689959c65e1887ad0e5c81e384)
* KRACOEUS-7988 RolesValueFinder should not return null as it causes problems in the optionFinder DD param
  * Jay Hulslander on Wed, 24 Sep 2014 08:55:41 -0400 [View Commit](../../commit/264d4d043d09741d351ee73bc7ef002ec0ea476a)
* KRACOEUS-7990: Fixing proposal attachments
  * Gayathri on Tue, 23 Sep 2014 16:27:10 -0700 [View Commit](../../commit/ccc48a553f3418baa95068715d55878a7ded0731)
* KRACOEUS-7705 : Unrecovered F&A Panel -Display total
  * yyuan1 on Tue, 23 Sep 2014 18:39:37 -0400 [View Commit](../../commit/576615e8a09edcf2dba70228cc99b8fdfd818aae)
* KRACOEUS-7702 : Cost Sharing Panel -- display total
  * yyuan1 on Tue, 23 Sep 2014 16:21:28 -0400 [View Commit](../../commit/47a4ce69f2b8343889da44e109e2fe921360defe)
* KRACOEUS-7987: When questions are created, it will exclude date fields from having a maxLength set.
  * Jamey Decker on Tue, 23 Sep 2014 12:40:08 -0700 [View Commit](../../commit/cc2b73eb74b5c69d9949800054a0c311ceb81168)
* KRACOEUS-7250
  * “SravanVed” on Tue, 16 Sep 2014 10:29:42 -0400 [View Commit](../../commit/681328ceb80e6f4b5f3033ce7c5c660618fb92fe)
* KRACOEUS-7978 : Cost Sharing Reset & Recalculate actions
  * yyuan1 on Tue, 23 Sep 2014 13:36:26 -0400 [View Commit](../../commit/d0d54a3bec4280958cb4cb14b098af4cf5667856)
* KRACOEUS-7747: moving Replace Narrative Authorization code away from task authorizer framework, general cleanup
  * Travis Schneberger on Tue, 23 Sep 2014 12:23:04 -0400 [View Commit](../../commit/354c68a72f872a6f04797b09535f2b333b4fdc76)
* KRACOEUS-7654: Cannot specify any part of investigator name in Funding Source lookup
  * Chuck Tharp on Thu, 7 Aug 2014 12:10:01 -0400 [View Commit](../../commit/daae6c487cd767492e9c680c07b4e1c8acf8fd85)
* KRACOEUS-7747: moving Modify Narrative Status Authorization code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 11:58:58 -0400 [View Commit](../../commit/350973c392fc2632b529c93864a67e17fb9aa169)
* KRACOEUS-7747: moving Delete Narrative code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 11:56:24 -0400 [View Commit](../../commit/2cb00764a52b9e72908c4dd970707a0e5c7ab71c)
* KRACOEUS-7747: moving Read Narrative code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 11:51:14 -0400 [View Commit](../../commit/43a0a8ad948eb014e6f94134e789a62e1667990d)
* KRACOEUS-7747: moving Modify Narrative code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 11:43:41 -0400 [View Commit](../../commit/2567ac83359bf3426941007a849cc993d3703d43)
* KRACOEUS-7747: moving budget authorizer code to award, general cleanup
  * Travis Schneberger on Tue, 23 Sep 2014 11:29:45 -0400 [View Commit](../../commit/c41bd87a198abece2859c67d3558cd16db26f8a6)
* KRACOEUS-7747: moving Create IRB/IACUC From Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 11:13:37 -0400 [View Commit](../../commit/2cd3eb7f1577eef234567ed5a0d4e4e66778f10e)
* KRACOEUS-7747: removing award specific authorization
  * Travis Schneberger on Tue, 23 Sep 2014 10:40:11 -0400 [View Commit](../../commit/a171adffe44aa6a886638e85b7ef4a614119c28c)
* KRACOEUS-7747: moving Modify Budget Rates code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 10:36:00 -0400 [View Commit](../../commit/de7c62aa2ce2e7a72299abbe3a430dd8c2251b83)
* KRACOEUS-7747: moving View Budget code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 10:27:37 -0400 [View Commit](../../commit/4c33f53a3dd9615cdc98878fd4b04181b24a58f6)
* KRACOEUS-7747: moving Modify Budget code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 10:17:02 -0400 [View Commit](../../commit/3a7a1e6cf86049b5d374857f650953956663bfdd)
* KRACOEUS-7747: moving Open Budget code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 09:48:23 -0400 [View Commit](../../commit/89b75de3802f2811bc7bcf17bf0d220eb732f3fd)
* KRACOEUS-7747: moving Add Budget code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 09:42:20 -0400 [View Commit](../../commit/c88c5932b6bb0fe4e38ef0b80541482fbd5bdc61)
* KRACOEUS-7747: moving Add Narrative code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 09:30:28 -0400 [View Commit](../../commit/728923422ba0f63903c51f83eb0eef6ff4efd5a0)
* KRACOEUS-7747: moving Certify Authorization code away from task authorizer framework
  * Travis Schneberger on Tue, 23 Sep 2014 09:28:33 -0400 [View Commit](../../commit/3cdd16e4152e2aded1eede639a922f5fdc92ea02)
*  KRACOEUS-7702 : Cost Sharing Panel - Continue
  * yyuan1 on Thu, 18 Sep 2014 00:36:38 -0400 [View Commit](../../commit/cf605fa3faa79d58cd24c3e66a96bde0942e8cb9)
* KRACOEUS-7702 : Cost Sharing Panel -- init
  * yyuan1 on Tue, 16 Sep 2014 15:48:28 -0400 [View Commit](../../commit/48ae913bc345d460508eb63dad6bca2425cdb81f)
* KRACOEUS-7786 : Finish moving final flag off of Budget
  * blackcathacker on Thu, 18 Sep 2014 10:37:36 -0700 [View Commit](../../commit/0dafbd37bdd2f1364c3ed2e16ca583daffd1f094)
* KRACOEUS-7985: Transient property proposalPersonQuestionnaireHelper will be loaded with questions and answers upon certain condition, allowing Proposal Person Certification to be shown.
  * Jamey Decker on Mon, 22 Sep 2014 14:25:07 -0700 [View Commit](../../commit/e928454b0c5abdc32bf461487b707eb6195bae0b)
* KRACOEUS-7896:fixed save of s2s questionnaires
  * Joe Williams on Mon, 22 Sep 2014 15:47:30 -0500 [View Commit](../../commit/26740031047e5d6d900d62bc318dff0d0d704b10)
* KRACOEUS-7747: moving Replace Personnel Attachment Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 16:21:00 -0400 [View Commit](../../commit/a744490afbbf97cf642ff02c79e08c9f33cbc790)
* KRACOEUS-7747: moving Answer Proposal Questionnaire Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 16:14:02 -0400 [View Commit](../../commit/b390d8f9deb1817275d91dcd4093a3c23d2a6e63)
* KRACOEUS-7747: moving Add Note Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 16:06:18 -0400 [View Commit](../../commit/441e003c6c5c774644311c3e8174aa2c6e427336)
* KRACOEUS-7979 fixed ojb mapping to comply with object changes made in custom attribute
  * Jay Hulslander on Mon, 22 Sep 2014 16:03:24 -0400 [View Commit](../../commit/95db41e24d89fd54932ddf87ef4cb8e63c046060)
* KRACOEUS-7582: code review comments
  * Travis Schneberger on Mon, 22 Sep 2014 15:38:58 -0400 [View Commit](../../commit/95ccc67142a3a57ed51df150ff92f9f3706c78a5)
* KRACOEUS-7916: Creating a toggle to allow the attachment file name to be shown and updated.
  * Jamey Decker on Sat, 20 Sep 2014 21:39:01 -0700 [View Commit](../../commit/731c337ffc2855781d1e59f604b4a8ece4a40c76)
* KRACOEUS-7977 removed un used and invalid variables from disclosureReviewerActios.tag
  * Jay Hulslander on Mon, 22 Sep 2014 15:25:37 -0400 [View Commit](../../commit/9482657e1865e591fa75df79646100ecda39076c)
* KRACOEUS-7747: code review comments
  * Travis Schneberger on Mon, 22 Sep 2014 13:16:06 -0400 [View Commit](../../commit/3f09db962676a85be16493cb40fbfe2a57740a72)
* KRACOEUS-7747: moving Recall Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 13:09:58 -0400 [View Commit](../../commit/22969d8c1e47115d642f037cb8ce3ff5ac2ebcc4)
* KRACOEUS-7747: moving Delete Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 13:06:37 -0400 [View Commit](../../commit/b2a1219f16dacfc4f61ba188fa71172c32ae8b32)
* KRACOEUS-7747: moving Reject Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 13:02:12 -0400 [View Commit](../../commit/0ca1d9aab8a9c007564f8de8f2da0b852e7751a3)
* KRACOEUS-7747: moving Submit To Workflow Action Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 12:52:19 -0400 [View Commit](../../commit/c83f0db69ab57884a99c639d4ca63891609125fb)
* KRACOEUS-7747: moving Hierarchy Child Workflow Action &  Hierarchy Child Ack Workflow Action Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 12:45:15 -0400 [View Commit](../../commit/3e18461f680a4dede3558269d22488c5d3280111)
* KRACOEUS-7747: moving Maintain Proposal Hierarchy Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 12:27:37 -0400 [View Commit](../../commit/fb287efa4fa57ef55deccb813d3d7f2d24f50780)
* KRACOEUS-7747: moving Show Alter Proposal Data and Alter Proposal Data Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 11:48:50 -0400 [View Commit](../../commit/23812f3d89b0211d73b902b18888a37079747ccd)
* KRACOEUS-7581
  * “SravanVed” on Mon, 22 Sep 2014 11:28:49 -0400 [View Commit](../../commit/fc7a3953979fb21836af269f273b506853048aa4)
* KRACOEUS-7747: moving Modify Proposal Permissions Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 11:29:58 -0400 [View Commit](../../commit/e10a8772e01aeb2084e389affbc001538578b6f6)
* KRACOEUS-7747: moving Create Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 11:15:35 -0400 [View Commit](../../commit/d51e3bab4a0c90c1c3224745decf4b02858b1467)
* KRACOEUS-7703 : Cost Sharing Summary
  * yyuan1 on Mon, 22 Sep 2014 10:39:44 -0400 [View Commit](../../commit/dd0cc094a27907287667bcc1cf0acfffa80f840b)
* KRACOEUS-7747: moving Submit Proposal To Sponsor Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 10:14:52 -0400 [View Commit](../../commit/95c1436efe0aaf33ada5c9e89e6d166a8f1dd7e6)
* KRACOEUS-7747: moving Print Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 10:06:48 -0400 [View Commit](../../commit/f8a3f728618ab873c7ece970af006f3d5995ba34)
* KRACOEUS-7747: moving View Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Mon, 22 Sep 2014 09:41:48 -0400 [View Commit](../../commit/55a2c1a8080b9a06a250f142a36f5a91c254f167)
* KRACOEUS-7747: moving Modify Proposal Authorization code away from task authorizer framework
  * Travis Schneberger on Fri, 19 Sep 2014 17:49:38 -0400 [View Commit](../../commit/df21d80175786cbe917c697d0af6c7cb54c43ac0)
* KRACOEUS-7427:fixed institutional proposal lookup
  * Joe Williams on Mon, 22 Sep 2014 08:05:18 -0500 [View Commit](../../commit/922db66264672e66b48feae22e5cfc94f10256ee)
* KRACOEUS-7828
  * “SravanVed” on Thu, 18 Sep 2014 11:35:12 -0400 [View Commit](../../commit/6fb0d08651e69dc0a49345196a30c6b2f49f838e)
* KRACOEUS-7747: some cleanup and initial work
  * Travis Schneberger on Thu, 18 Sep 2014 11:50:01 -0400 [View Commit](../../commit/be00672473332ac205a8bb299a8c66795d6c4b61)
* KRACOEUS-7725: fixing NPE
  * Travis Schneberger on Fri, 19 Sep 2014 09:17:29 -0400 [View Commit](../../commit/bb90c7e3b8bc8405be8b28b426570e6045bff8eb)
* KRACOEUS-7582: removing document level role
  * Travis Schneberger on Wed, 17 Sep 2014 14:09:59 -0400 [View Commit](../../commit/6bdf5941dfab6bd789f41a7dfcfa77057f4cd67a)

##coeus-6.0.0-s5
* No Changes
