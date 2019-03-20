package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.NumericEntityUnescaperTestField;
import org.apache.commons.lang3.text.translate.NumericEntityUnescaper;

public aspect NumericEntityUnescaperTester {
	
	pointcut callTranslate(CharSequence s): call(* NumericEntityUnescaper.translate(CharSequence)) && args(s) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(CharSequence s): callTranslate(s){
		
		TestFlags.testing = true;
		
		System.out.println(s);
		
		TestStorage.s = s;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(NumericEntityUnescaperTestField.class);
        
        logger.info("test class: NumericEntityUnescaperTestField");
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
