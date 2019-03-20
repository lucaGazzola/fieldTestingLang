package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang.math.NumberUtils;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	NumberUtils.createNumber(TestStorage.number);
    }

}
