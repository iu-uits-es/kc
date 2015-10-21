package org.kuali.coeus.propdev.impl.auth.perm;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.PropAwardPersonRole;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;

import java.util.ArrayList;
import java.util.List;


public class ProposalDevelopmentPermissionsServiceTest {

    public static final String LOGGED_IN_USER_ID = "101";
    public static final String POSTDOC = "Postdoc";
    public static final String GRADUATE_STUDENT = "GraduateStudent";
    public static boolean CUSTOM_DATA_ENFORCED = true;
    public static boolean SPONSOR_REQUIRED = true;

    String USER_ID = "100";

    class ProposalDevelopmentPermissionsServiceTestImpl extends ProposalDevelopmentPermissionsServiceImpl {

        @Override
        protected List<String> getExemptKeyPersonRoles() {
            List<String> EXEMPT_ROLES = new ArrayList<>();
            EXEMPT_ROLES.add(POSTDOC);
            return EXEMPT_ROLES;
        }

        @Override
        protected boolean forcePiCoiKeyPersonsDisclosureWithCustomData(DevelopmentProposal developmentProposal) {
            return CUSTOM_DATA_ENFORCED;
        }

        @Override
        protected boolean doesSponsorRequireKeyPersonCertification(ProposalPerson proposalPerson) {
            return SPONSOR_REQUIRED;
        }

        @Override
        protected boolean isCoiDisclosureStatusFeatureEnabled() {
            return true;
        }

    }

    class ProposalPersonTestImpl extends ProposalPerson {
        @Override
        public KcPerson getPerson() {
           return new KcPerson();
        }
    }

    @Test
    public void testCanLoggedInPiCertify() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson pi = new ProposalPersonTestImpl();
        pi.setPersonId(USER_ID);
        pi.setProposalPersonRoleId(PropAwardPersonRole.PRINCIPAL_INVESTIGATOR);
        boolean canCertify = permissionService.canCertify(USER_ID, pi, true, false);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanProxyCertifyForRolodex() throws Exception {
        class ProposalRolodexPersonTestImpl extends ProposalPerson {
            @Override
            public KcPerson getPerson() {
                return null;
            }
        }

        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson proxy = new ProposalRolodexPersonTestImpl();
        proxy.setPersonId(USER_ID);
        proxy.setProposalPersonRoleId(PropAwardPersonRole.PRINCIPAL_INVESTIGATOR);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        boolean canCertify = permissionService.canCertify(USER_ID, proxy, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanCoiCertify() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson coi = new ProposalPersonTestImpl();
        coi.setPersonId(USER_ID);
        coi.setProposalPersonRoleId(PropAwardPersonRole.CO_INVESTIGATOR);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = false;
        boolean canCertify = permissionService.canCertify(USER_ID, coi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanMultiPiCertify() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.MULTI_PI);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = false;
        boolean canCertify = permissionService.canCertify(USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanProxyCertifyForPi() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.PRINCIPAL_INVESTIGATOR);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanProxyCertifyForCoI() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.CO_INVESTIGATOR);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanProxyCertifyForMultiPi() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.MULTI_PI);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanPiCertifyForCoI() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.CO_INVESTIGATOR);
        boolean isLoggedInUserPi = true;
        boolean canProxyCertify = false;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanPiCertifyForMpi() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson mpi = new ProposalPersonTestImpl();
        mpi.setPersonId(USER_ID);
        mpi.setProposalPersonRoleId(PropAwardPersonRole.MULTI_PI);
        boolean isLoggedInUserPi = true;
        boolean canProxyCertify = false;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, mpi, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }


    @Test
    public void testCanExemptKeyPersonCertify() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(POSTDOC);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = false;
        boolean canCertify = permissionService.canCertify(USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertFalse(canCertify);
    }

    @Test
    public void testKeyPersonProxyCertifyWhenCustomDataEnforced() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(GRADUATE_STUDENT);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        CUSTOM_DATA_ENFORCED = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testExemptKeyPersonProxyCertifyWhenCustomDataEnforced() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(GRADUATE_STUDENT);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        CUSTOM_DATA_ENFORCED = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testKeyPersonProxyCertifyWhenSponsorRequired() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(GRADUATE_STUDENT);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = true;
        CUSTOM_DATA_ENFORCED = false;
        SPONSOR_REQUIRED = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertTrue(canCertify);
    }

    @Test
    public void testCanViewerCertifyKeyPerson() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(GRADUATE_STUDENT);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = false;
        CUSTOM_DATA_ENFORCED = false;
        SPONSOR_REQUIRED = true;
        boolean canCertify = permissionService.canCertify(LOGGED_IN_USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertFalse(canCertify);
    }

    @Test
    public void testCanKPCertifyWhenSponsorAndCustomDataNotRequiredAndNotExempt() throws Exception {
        ProposalDevelopmentPermissionsServiceTestImpl permissionService = new ProposalDevelopmentPermissionsServiceTestImpl();
        ProposalPerson kp = new ProposalPersonTestImpl();
        kp.setPersonId(USER_ID);
        kp.setProposalPersonRoleId(PropAwardPersonRole.KEY_PERSON);
        kp.setProjectRole(GRADUATE_STUDENT);
        boolean isLoggedInUserPi = false;
        boolean canProxyCertify = false;
        CUSTOM_DATA_ENFORCED = false;
        SPONSOR_REQUIRED = false;
        boolean canCertify = permissionService.canCertify(USER_ID, kp, isLoggedInUserPi, canProxyCertify);
        Assert.assertFalse(canCertify);
    }

}
