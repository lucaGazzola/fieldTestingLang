package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang.text.ExtendedMessageFormat;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class NumberUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	ExtendedMessageFormat emf = new ExtendedMessageFormat(TestStorage.pattern, TestStorage.registry);
        //assertEquals("it's a dummy test!", emf.format(new Object[] {"DUMMY"}));
    }

}
