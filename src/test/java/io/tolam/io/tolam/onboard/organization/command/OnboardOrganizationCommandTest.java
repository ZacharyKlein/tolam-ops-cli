package io.tolam.io.tolam.onboard.organization.command;

import io.micronaut.configuration.picocli.PicocliRunner;
import io.micronaut.context.ApplicationContext;
import io.micronaut.context.env.Environment;
import io.tolam.TolamCommand;
import io.tolam.onboard.organization.command.OnboardOrganizationCommand;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class OnboardOrganizationCommandTest {

      @Test
    public void testWithCommandLineOption() throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        System.setOut(new PrintStream(baos));

        try (ApplicationContext ctx = ApplicationContext.run(Environment.CLI, Environment.TEST)) {
            String[] args = new String[] { "-v", "demo", "user@demo", "demo", "123456"};
            PicocliRunner.execute(OnboardOrganizationCommand.class, args);

            // tolam
            assertTrue(baos.toString().contains("Onboarding Organization with name: [demo]"));
        }
    }
}
