package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang.NumberUtils;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	try{
    		NumberUtils.createNumber(TestStorage.number);
    	}catch(NumberFormatException e) {}
    }

}
