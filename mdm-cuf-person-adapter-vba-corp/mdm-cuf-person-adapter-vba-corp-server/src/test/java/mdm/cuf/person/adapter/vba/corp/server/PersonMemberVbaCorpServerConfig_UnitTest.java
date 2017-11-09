package mdm.cuf.person.adapter.vba.corp.server;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import mdm.cuf.person.adapter.vba.corp.server.PersonMemberVbaCorpServerProperties;


/**
 * This Config Unit Test is a simple test to ensure the spring context loads for this project.
 * 
 * @author darias
 */
public class PersonMemberVbaCorpServerConfig_UnitTest extends PersonMemberVbaCorpServerSpringTestBase {

	@Autowired
	private PersonMemberVbaCorpServerProperties properties;
	
	@Test
    public void contextLoads() {
        Assert.assertNotNull(properties.getDemoProperty());
    }

}
