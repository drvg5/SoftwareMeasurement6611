package testNG.basics;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import junit.framework.Assert;
import junit.framework.TestCase;

public class TestCyclomaticComplexity extends TestCase {

	public void testCyclo() throws ClassNotFoundException {

		File codeSnippet = new File("FilePath");

		Scanner sc;
		try {
			sc = new Scanner(codeSnippet);
			List<String> lines = new ArrayList<String>();

			while (sc.hasNext()) {
				lines.add(sc.nextLine());

			}

			int cycloComplexity = 0;
			int bracket = 0;
			for (int i = 0; i < lines.size(); i++) {

				String[] singleLine = lines.get(i).split(" ");

				for (String s : singleLine) {
					if (s.equals("if") || singleLine.equals("for") || s.equals("while") || s.equals("case")
							|| s.equals("catch") || s.equals("throw") || s.equals("return") || s.equals("&&")
							|| s.equals("||") || s.equals("?")) {
						++cycloComplexity;
					}

				}
			}

			System.out.println("CC : " + cycloComplexity);

			Assert.assertEquals(16, cycloComplexity);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
