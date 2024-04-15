package tests;

import com.intuit.karate.Results;

import com.intuit.karate.Runner;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.Collection;
import java.util.List;

import org.junit.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber. ReportBuilder;
import org.apache.commons.io.FileUtils;

import java.util.ArrayList;

public class ParallelRunner {

	@Test
	public void testParallel() {
		Results results = Runner.path("classpath:tests")
				.outputCucumberJson(true)
		        .tags("~@ignore").parallel(5);
		generateReport(results.getReportDir());
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);

	}

	public static void generateReport(String karateOutputPath) {
			Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
			List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
			jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
			Configuration config = new Configuration(new File("target"), "KarateProj");
			ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
			reportBuilder.generateReports();
	}

}
