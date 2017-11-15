package mdm.cuf.person.adapter.vba.corp.server;

import java.util.Arrays;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * This is the actual Spring boot application that loads up the entire app.
 *
 * @author darias
 */

@SpringBootApplication
@Import(PersonMemberVbaCorpServerConfig.class)
@ComponentScan(basePackages = "mdm.cuf.person.adapter.vba.corp.server", excludeFilters = @Filter(Configuration.class))
public class PersonMemberVbaCorpServerApplication extends SpringBootServletInitializer {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(PersonMemberVbaCorpServerApplication.class);

    @Override
    protected SpringApplicationBuilder configure(final SpringApplicationBuilder application) {
        return application.sources(PersonMemberVbaCorpServerApplication.class);
    }

    public static void main(final String[] args) throws Exception {
        final ConfigurableApplicationContext context = new SpringApplicationBuilder(PersonMemberVbaCorpServerApplication.class).build().run(args);
        final String[] profiles = context.getEnvironment().getActiveProfiles();
        if(LOGGER.isInfoEnabled()) 
            LOGGER.info("!!!!!!!!!!!!!!!!!! Active Profiles: "+ Arrays.toString(profiles) + "!!!!!!!!!!!!!!!!");
    }
}


