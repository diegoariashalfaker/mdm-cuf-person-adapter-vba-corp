package mdm.cuf.person.adapter.vba.corp.server.async;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import mdm.cuf.core.api.async.AsyncStatus;
import mdm.cuf.core.api.async.CufChangeLogInstruction;
import mdm.cuf.core.server.logging.LogUtil;
import mdm.cuf.core.server.processor.async.changelog.ChangeLogConsumerHandler;
import mdm.cuf.core.server.processor.async.changelog.ChangeLogHandlerResponse;

@Component
@Primary
public class PersonMemberVbaCorpChangeLogConsumerHandler implements ChangeLogConsumerHandler {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(PersonMemberVbaCorpChangeLogConsumerHandler.class);

    @Override
    public ChangeLogHandlerResponse consume(CufChangeLogInstruction cufChangeLogInstruction) {
        LogUtil.logDebugWithBanner(LOGGER, "Change Log Q Handler",
                "The following CufChangeLogInstruction was received in this ChangeLogConsumerHandler: "
                        + cufChangeLogInstruction);
        
       ChangeLogHandlerResponse response = new ChangeLogHandlerResponse();
        response.setStatus(AsyncStatus.COMPLETED_NOOP);
        return response;
    }

}
