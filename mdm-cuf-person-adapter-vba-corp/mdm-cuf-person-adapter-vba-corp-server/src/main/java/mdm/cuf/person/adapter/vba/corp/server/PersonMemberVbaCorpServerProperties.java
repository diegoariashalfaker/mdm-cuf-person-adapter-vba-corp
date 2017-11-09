package mdm.cuf.person.adapter.vba.corp.server;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import mdm.cuf.core.server.AbstractMdmCufCoreServerProperties;

/**
 * Application properties, they can be wired up by using mdm-cuf-person-adapter-vba-corp placeholder in yml
 *
 * @author darias
 */

@Component
@ConfigurationProperties(prefix = "mdm-cuf-person-adapter-vba-corp")
public class PersonMemberVbaCorpServerProperties extends AbstractMdmCufCoreServerProperties {

    private String demoProperty;
    
    public String getDemoProperty() {
        return demoProperty;
    }
    
    public void setDemoProperty(String demoProperty) {
        this.demoProperty=demoProperty;
    }
    
    
}
