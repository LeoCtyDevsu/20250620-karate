package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {
    
    @Test
    void testMarvelCharacters() {
        Results results = Runner.path("classpath:com/pichincha/features")
                .outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}