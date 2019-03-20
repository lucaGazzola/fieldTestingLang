package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.test.NumberUtilsTestField;

public aspect NumberUtilsTester {
	
	pointcut callCreateNumber(String number): call(* NumberUtils.isNumber(String)) && args(number) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String number): callCreateNumber(number){
		
		TestFlags.testing = true;
		
		System.out.println(number);
		
		TestStorage.number = number;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(NumberUtilsTestField.class);
        
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
