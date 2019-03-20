package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;

public class StringEscapeUtilsTestField extends TestCase {
	
	// Adapted from StringEscapeUtilsTest.testEscapeXml()
    @Test
    public void testCreateNumber() {
    	String s = TestStorage.s;
        if(!s.contains(">") && !s.contains("<"))
        	assertEquals(s, StringEscapeUtils.escapeXml(s));
    }

}
