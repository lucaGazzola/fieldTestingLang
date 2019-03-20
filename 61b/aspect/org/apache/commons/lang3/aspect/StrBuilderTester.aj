package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.StrBuilderTestField;
import org.apache.commons.lang.text.StrBuilder;

public aspect StrBuilderTester {
	
	pointcut callDelete(String s, StrBuilder sb): call(* StrBuilder.deleteAll(String)) && args(s) && target(sb) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String s, StrBuilder sb): callDelete(s, sb){
		
		TestFlags.testing = true;
				
		TestStorage.s = s;
		TestStorage.sb = sb;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(StrBuilderTestField.class);
        
        logger.info("test class: StrBuilderAppendInsertTestField");
        logger.info("ran: " + result.getRunCount() + " failed: " + result.getFailureCount());
        
        List<Failure> failures = result.getFailures();
      
        if(!failures.isEmpty()) {
            for(Failure f : failures) {
                logger.info(f.getTrace());
            }
        }
        
        TestFlags.testing = false;
		
	}

}
