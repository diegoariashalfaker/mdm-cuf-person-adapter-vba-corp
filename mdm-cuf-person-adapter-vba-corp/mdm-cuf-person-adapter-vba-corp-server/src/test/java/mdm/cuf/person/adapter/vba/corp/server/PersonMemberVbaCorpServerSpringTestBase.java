package mdm.cuf.person.adapter.vba.corp.server;

import org.springframework.test.context.ActiveProfiles;

import mdm.cuf.core.server.AbstractMdmCufCoreHubOrMemberServerSpringTest;
import mdm.cuf.core.server.MdmCufCoreServerProfilesAndQualifiers;

/**
 * This is the base test class for Spring tests within MDM CUF person Server
 * 
 * @author darias
 */
@ActiveProfiles(profiles = { MdmCufCoreServerProfilesAndQualifiers.MODE_MEMBER })
public abstract class PersonMemberVbaCorpServerSpringTestBase extends AbstractMdmCufCoreHubOrMemberServerSpringTest {
    
}
