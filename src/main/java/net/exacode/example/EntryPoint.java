package net.exacode.example;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EntryPoint {
	private static final Logger logger = LoggerFactory.getLogger(EntryPoint.class.getClass());
	
	public static void main(String[] args) {
		logger.info("Hello world");
<<<<<<< HEAD
=======
		long endTime   = System.nanoTime();
    		long totalTime = endTime - startTime;
    		System.out.println("Total Time " +totalTime/1000000000);
    		System.out.println("Logic executed successfully....");
>>>>>>> 8163ea478464b214bf15fbc8e3e5bb3a70c87f4d
	}

}
