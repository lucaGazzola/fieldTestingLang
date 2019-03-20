package org.apache.commons.lang3.test;

import junit.framework.TestCase;

import static org.junit.Assume.assumeNotNull;

import org.apache.commons.lang3.aspect.TestStorage;
import org.apache.commons.lang3.text.translate.NumericEntityUnescaper;
import org.junit.Test;

public class NumericEntityUnescaperTestField extends TestCase {
	
	// Adapted from NumericEntityUnescaperTest.testSupplementaryUnescaping()
    @Test
    public void testSupplementaryUnescaping() {
    	CharSequence s = TestStorage.s;
        NumericEntityUnescaper neu = new NumericEntityUnescaper();
    	assumeNotNull(s);
    	assertNotNull(neu.translate(s));
    	
    }

}
