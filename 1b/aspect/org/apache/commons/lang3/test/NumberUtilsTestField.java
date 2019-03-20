package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	String number = TestStorage.number;
        assumeTrue(number.length() < 11);
        if(number.startsWith("0x"))
        	assumeTrue(StringUtils.isNumeric(number.substring(2)));
        else
        	assumeTrue(StringUtils.isNumeric(number));
        assertNotNull(NumberUtils.createNumber(number));
    }

}
