package org.apache.commons.lang3.test;

import junit.framework.TestCase;
import static org.junit.Assume.assumeTrue;

import org.apache.commons.lang.text.StrBuilder;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class StrBuilderTestField extends TestCase {
	
	// Adapted from StrBuilderTest.testDeleteAll_String()
    @Test
    public void testDeleteAll_String() {
        StrBuilder sb = TestStorage.sb;
        sb.deleteAll(TestStorage.s);
    }

}
