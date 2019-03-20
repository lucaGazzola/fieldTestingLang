package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testIsNumber()
    @Test
    public void testCreateNumber() {
    	String number = TestStorage.number;
    	assumeTrue(number.endsWith("."));
        assumeTrue(StringUtils.isNumeric(number.substring(0,number.length()-1)));
        assertTrue(NumberUtils.isNumber(number));

    }

}
