package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.StringUtilsTestField;

public aspect StringUtilsTester {
	
	pointcut callEquals(CharSequence cs1, CharSequence cs2): call(* StringUtils.equals(CharSequence, CharSequence)) && args(cs1, cs2) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(CharSequence cs1, CharSequence cs2): callEquals(cs1, cs2){
		
		TestFlags.testing = true;
		
		TestStorage.cs1 = cs1;
		TestStorage.cs2 = cs2;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(StringUtilsTestField.class);
        
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
