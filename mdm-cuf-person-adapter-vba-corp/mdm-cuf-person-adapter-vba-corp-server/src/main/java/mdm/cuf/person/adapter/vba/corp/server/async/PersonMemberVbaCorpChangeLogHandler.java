package mdm.cuf.person.adapter.vba.corp.server.async;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import mdm.cuf.core.api.async.AsyncStatus;
import mdm.cuf.core.api.async.CufAsyncHandlerResponse;
import mdm.cuf.core.api.async.CufChangeLogInstruction;
import mdm.cuf.core.server.logging.LogUtil;
import mdm.cuf.core.server.processor.async.changelog.ChangeLogHandler;

@Component
@Primary
public class PersonMemberVbaCorpChangeLogHandler implements ChangeLogHandler {
    
    private static final Logger LOGGER = LoggerFactory.getLogger(PersonMemberVbaCorpChangeLogHandler.class);

    @Override
    public CufAsyncHandlerResponse handle(CufChangeLogInstruction cufChangeLogInstruction) {
        LogUtil.logDebugWithBanner(LOGGER, "Change Log Handler",
                "The following CufChangeLogInstruction was received in this ChangeLogHandler: "
                        + cufChangeLogInstruction);
        
        CufAsyncHandlerResponse response = new CufAsyncHandlerResponse();
        response.setStatus(AsyncStatus.COMPLETED_NOOP);
        return response;
    }

}
