package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	String number = TestStorage.number;
    	try {
    		NumberUtils.createNumber(number);
    	}catch(NumberFormatException e) {}
    }

}
