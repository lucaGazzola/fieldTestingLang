package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class StringUtilsTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	try {
    		StringUtils.replaceEach(TestStorage.text, TestStorage.searchList, TestStorage.replacementList);
    	}catch(IllegalStateException e) {}	
    	catch(IllegalArgumentException  e) {}
    }

}
