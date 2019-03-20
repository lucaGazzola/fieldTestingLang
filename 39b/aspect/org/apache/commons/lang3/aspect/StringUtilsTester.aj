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
	
	pointcut callReplace(String text, String[] searchList, String[] replacementList): call(* StringUtils.replaceEach(String, String[], String[])) && args(text, searchList, replacementList) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(String text, String[] searchList, String[] replacementList): callReplace(text, searchList, replacementList){
		
		TestFlags.testing = true;
				
		TestStorage.text = text;
		TestStorage.searchList = searchList;
		TestStorage.replacementList = replacementList;
		
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
