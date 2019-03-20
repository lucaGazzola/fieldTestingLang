package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang.text.StrBuilder;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class StrBuilderAppendInsertTestField extends TestCase {
	
	// Adapted from NumberUtilsTest.testCreateNumber()
    @Test
    public void testCreateNumber() {
    	StrBuilder sb = new StrBuilder(1);
        sb.appendFixedWidthPadRight(TestStorage.obj, TestStorage.width, TestStorage.padChar);
    }

}
