package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.logging.Logger;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.StrBuilderAppendInsertTestField;
import org.apache.commons.lang.text.StrBuilder;

public aspect StrBuilderAppendInsertTester {
	
	pointcut callAppend(Object obj, int width, char padChar): call(* StrBuilder.appendFixedWidthPadRight(Object, int, char)) && args(obj, width, padChar) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(Object obj, int width, char padChar): callAppend(obj, width, padChar){
		
		TestFlags.testing = true;
				
		TestStorage.obj = obj;
		TestStorage.width = width;
		TestStorage.padChar = padChar;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(StrBuilderAppendInsertTestField.class);
        
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
