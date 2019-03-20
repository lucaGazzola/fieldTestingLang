package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.test.StringEscapeUtilsTestField;

public aspect StringEscapeUtilsTester {
	
	pointcut callEscapeXml(String s): call(* StringEscapeUtils.escapeXml(String)) && args(s) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String s): callEscapeXml(s){
		
		TestFlags.testing = true;
		
		System.out.println(s);
		
		TestStorage.s = s;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(StringEscapeUtilsTestField.class);
        
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
