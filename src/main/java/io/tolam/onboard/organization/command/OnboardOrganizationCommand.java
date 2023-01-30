package io.tolam.onboard.organization.command;

import io.micronaut.configuration.picocli.PicocliRunner;
import io.tolam.onboard.organization.asterisms.WorkspaceCreator;
import io.tolam.onboard.organization.client.OnboardOrganizationClient;

import jakarta.inject.Inject;
import picocli.CommandLine.*;

@Command(name = "onboard-organization",
    description = "Creates a new Organization within the Tolam platform, including an Asterisms Workspace and User",
    mixinStandardHelpOptions = true)
public class OnboardOrganizationCommand implements Runnable {

  @Inject
  OnboardOrganizationClient onboardOrganizationClient;

  @Inject
  WorkspaceCreator workspaceCreator;

  @Option(names = {"-v", "--verbose"}, description = "Enable verbose output")
  boolean verbose;

  @Parameters(index = "0", description = "Name of the Organization")
  String name;

  @Parameters(index = "1", description = "Email for the Asterisms Workspace Owner")
  String email;

  @Parameters(index = "2", description = "Description of the Organization")
  String description;

  @Parameters(index = "3", description = "Tax ID of the Organization")
  String taxId;

  public static void main(String[] args) throws Exception {
    PicocliRunner.run(OnboardOrganizationCommand.class, args);
  }

  public OnboardOrganizationCommand() {
  }

  public void run() {
    if (verbose) {
      System.out.println("Onboarding Organization with name: [" + name + "]; email: [" + email + "]; description: [" + description + "]; tax ID: [" + taxId + "]");
    }

    String workspaceId = workspaceCreator.createWorkspace(name, email).block();
    System.out.println(" >>>>>>> " + workspaceId);

    //TODO: Make HTTP Request to create Organization

  }
}
