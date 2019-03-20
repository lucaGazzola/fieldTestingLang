package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class StringUtilsTestField extends TestCase {
	
	// Adapted from StringUtilsEqualsIndexOfTest.testCustomCharSequence()
    @Test
    public void testCustomCharSequence() {
    	CharSequence cs1 = TestStorage.cs1;
    	CharSequence cs2 = TestStorage.cs1;
    	assertTrue(StringUtils.equals(cs1, new StringBuilder(cs2)));
    }

}
