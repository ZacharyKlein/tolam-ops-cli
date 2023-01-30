package io.tolam;

import io.micronaut.configuration.picocli.PicocliRunner;

import io.tolam.onboard.organization.command.OnboardOrganizationCommand;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.util.concurrent.Callable;

@Command(name = "tolam", description = "CLI for managing operations within the Tolam platform",
    subcommands = {OnboardOrganizationCommand.class},
    mixinStandardHelpOptions = true)
public class TolamCommand implements Callable<Object> {

  @Option(names = {"-v", "--verbose"}, description = "...")
  boolean verbose;

  public static void main(String[] args) throws Exception {
    PicocliRunner.execute(TolamCommand.class, args);
  }

  @Override
  public Object call() throws Exception {
    if (verbose) {
      System.out.println("Welcome to the Tolam CLI");
    }
    return 0;
  }
}
