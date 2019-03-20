package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class BooleanUtilsTestField extends TestCase {
	
	// Adapted from BooleanUtilsTest.test_toBoolean_String()
    @Test
    public void test_toBoolean_String() {
    	BooleanUtils.toBoolean(TestStorage.s);
    }

}
