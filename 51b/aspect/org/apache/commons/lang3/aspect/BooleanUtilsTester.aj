package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.BooleanUtilsTestField;
import org.apache.commons.lang.BooleanUtils;

public aspect BooleanUtilsTester {
	
	pointcut callToBoolean(String s): call(* BooleanUtils.toBoolean(String)) && args(s) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String s): callToBoolean(s){
		
		TestFlags.testing = true;
				
		TestStorage.s = s;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(BooleanUtilsTestField.class);
        
        logger.info("test class: NumberUtilsTestField");
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
