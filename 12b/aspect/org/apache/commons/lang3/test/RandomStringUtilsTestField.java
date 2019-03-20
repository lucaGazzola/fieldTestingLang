package org.apache.commons.lang3.test;

import junit.framework.TestCase;


import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.aspect.TestStorage;
import org.junit.Test;

public class RandomStringUtilsTestField extends TestCase {
	
	// Adapted from RandomStringUtilsTest.testRandomStringUtils()
    @Test
    public void testRandomStringUtils() {
        try {
        	long memory = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
            System.out.println("Used memory is bytes: " + memory);
            assertEquals(RandomStringUtils.random(TestStorage.count, TestStorage.start, TestStorage.end, TestStorage.letters, TestStorage.numbers, TestStorage.chars, TestStorage.random), RandomStringUtils.random(TestStorage.count, TestStorage.start, TestStorage.end, TestStorage.letters, TestStorage.numbers, TestStorage.chars, TestStorage.random));
        } catch (IllegalArgumentException ex) {
            // expected
        }
    }

}
