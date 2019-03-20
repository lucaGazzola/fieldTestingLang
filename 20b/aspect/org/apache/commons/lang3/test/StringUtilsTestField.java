package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import static org.junit.Assume.assumeNotNull;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class StringUtilsTestField extends TestCase {
	
	// Adapted from StringUtilsTest.testJoin_Objects()
    @Test
    public void testJoin_Objects() {
    	
    	assumeNotNull(TestStorage.array);
    	assumeNotNull(TestStorage.separator);
    	assumeNotNull(TestStorage.endIndex);
    	assumeNotNull(TestStorage.startIndex);
    	
    	assertEquals("null", StringUtils.join(TestStorage.array,TestStorage.separator, TestStorage.startIndex, TestStorage.endIndex));
    }

}
