package de.caternberg.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EntryPoint {
    private static final Logger logger = LoggerFactory.getLogger(EntryPoint.class.getClass());

    public static void main(String[] args) {
        long startTime = System.nanoTime();
        logger.info("Hello world");
        long endTime = System.nanoTime();
        long totalTime = endTime - startTime;
        System.out.println("Total Time " + totalTime / 1000000000);
        System.out.println("Logic executed successfully....");
    }

}
