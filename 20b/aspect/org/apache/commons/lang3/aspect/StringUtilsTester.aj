package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.test.StringUtilsTestField;

public aspect StringUtilsTester {
	
	pointcut callJoin(Object[] array, char separator, int startIndex, int endIndex): call(* StringUtils.join(Object[], char, int, int)) && args(array, separator, startIndex, endIndex) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(Object[] array, char separator, int startIndex, int endIndex): callJoin(array, separator, startIndex, endIndex){
		
		TestFlags.testing = true;
				
		TestStorage.array = array;
		TestStorage.separator = separator;
		TestStorage.startIndex = startIndex;
		TestStorage.endIndex = endIndex;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(StringUtilsTestField.class);
        
        logger.info("test class: StringUtilsTestField");
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
