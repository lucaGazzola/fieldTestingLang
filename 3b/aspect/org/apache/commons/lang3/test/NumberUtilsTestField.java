package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import static org.junit.Assert.assertEquals;
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
//        assumeTrue(number.contains("."));
//        assumeTrue(number.length() > 10);
//        assumeTrue(StringUtils.isNumeric(number));
//        assertTrue(NumberUtils.createNumber(number) instanceof Double);
    	assertEquals(NumberUtils.createNumber(TestStorage.number), Double.valueOf(TestStorage.number));
    }

}
