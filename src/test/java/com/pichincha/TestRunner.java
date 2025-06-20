package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {
    
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:com/pichincha/features")
                .tags("~@ignore")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    @Karate.Test
    Karate testTags() {
        return Karate.run()
                .tags("@E2", "@Agente2")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate testMarvelCharacters() {
        return Karate.run().relativeTo(getClass()).path("com/pichincha/features");
    }
}