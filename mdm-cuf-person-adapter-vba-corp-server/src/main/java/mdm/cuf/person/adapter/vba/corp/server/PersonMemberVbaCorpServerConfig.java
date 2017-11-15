package mdm.cuf.person.adapter.vba.corp.server;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import mdm.cuf.core.server.MdmCufCoreServerConfig;

/**
 * This is the main Spring config class for this module, it should declare any additional packages to scan declare any beans, supply
 * any other annotations etc.
 *
 * @author darias
 */

@Configuration
@ComponentScan(basePackages = "mdm.cuf.person.adapter.vba.corp.server", excludeFilters = @Filter(Configuration.class))
@Import({MdmCufCoreServerConfig.class})
public class PersonMemberVbaCorpServerConfig {
    

}

