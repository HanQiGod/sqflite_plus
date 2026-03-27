package com.tekartik.sqflite_plus;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Constants between dart & Java world
 */

public class ConstantTest {

    @Test
    public void key() {
        assertEquals("com.tekartik.sqflite_plus", Constant.PLUGIN_KEY);
    }
}
