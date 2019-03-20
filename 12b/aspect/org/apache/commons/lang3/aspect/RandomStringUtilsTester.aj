package org.apache.commons.lang3.aspect;

import java.util.List;
import java.util.Random;
import java.util.logging.Logger;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.logging.SingletonLogger;
import org.apache.commons.lang3.test.RandomStringUtilsTestField;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;;

public aspect RandomStringUtilsTester {
	
	pointcut callRandom(int count, int start, int end, boolean letters, boolean numbers, char[] chars, Random random): call(* RandomStringUtils.random(int, int, int, boolean, boolean, char[], Random)) && args(count, start, end, letters, numbers, chars, random) && if(!TestFlags.testing) && if(TestFlags.instrumentationON);
	
	before(int count, int start, int end, boolean letters, boolean numbers, char[] chars, Random random): callRandom(count, start, end, letters, numbers, chars, random){
		
		TestFlags.testing = true;
		
		System.out.println(count);
		System.out.println(chars);
		
		TestStorage.count = count;
		TestStorage.start = start;
		TestStorage.end = end;
		TestStorage.letters = letters;
		TestStorage.numbers = numbers;
		TestStorage.chars = chars;
		TestStorage.random = random;
		
		Logger logger = SingletonLogger.getInstance();
		
		JUnitCore jUnitCore = new JUnitCore();
        Result result = jUnitCore.run(RandomStringUtilsTestField.class);
        
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
