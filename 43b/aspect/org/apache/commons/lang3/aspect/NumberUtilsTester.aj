package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang.text.ExtendedMessageFormat;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.NumberUtilsTestField;

public aspect NumberUtilsTester {
	
	pointcut callFormat(String pattern, Map registry): initialization(ExtendedMessageFormat.new(String, Map)) && args(pattern, registry) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String pattern, Map registry): callFormat(pattern, registry){
		
		TestFlags.testing = true;
				
		TestStorage.pattern = pattern;
		TestStorage.registry = registry;
		
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
