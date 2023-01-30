package io.tolam.onboard.organization.asterisms;

import io.asterisms.account.sdk.workspace.WorkspaceProvisioningClient;
import io.asterisms.account.spi.workspace.WorkspaceProvisionedData;
import io.asterisms.account.spi.workspace.WorkspaceProvisioningOperations;
import io.asterisms.auth.spi.authentication.AuthenticationCredentialType;
import io.asterisms.auth.spi.token.AuthorizationToken;
import io.asterisms.core.workspace.Workspace;
import io.asterisms.core.workspace.WorkspaceProvisioningConfiguration;
import jakarta.inject.Singleton;
import io.asterisms.auth.sdk.authentication.UserAccountAuthenticator;
import reactor.core.publisher.Mono;
import io.asterisms.core.responses.SuccessResponseWithEntity;

import java.util.UUID;
import java.util.function.Function;

@Singleton
public class WorkspaceCreator {

  UserAccountAuthenticator authenticator;


  WorkspaceProvisioningClient workspaceProvisioningClient;

  public WorkspaceCreator(UserAccountAuthenticator authenticator, WorkspaceProvisioningClient workspaceProvisioningClient) {
    this.authenticator = authenticator;
    this.workspaceProvisioningClient = workspaceProvisioningClient;
  }

  public Mono<String> createWorkspace(String name, String email) {


    return authenticate().flatMap(authorizationToken ->

        workspaceProvisioningClient.provisionWorkspace("Bearer " + authorizationToken.getToken(),
            new WorkspaceProvisioningConfiguration(name, Workspace.RegistrationMode.OPEN, email)
        ).map(getResponse())

    ).flatMap(uuid -> {

      System.out.println(" >>>>>>> uuid: " + uuid.toString());
      return Mono.just(uuid.toString());
    });


  }

  private static Function<SuccessResponseWithEntity<WorkspaceProvisionedData>, UUID> getResponse() {
    return workspaceProvisionedDataSuccessResponseWithEntity -> workspaceProvisionedDataSuccessResponseWithEntity.getEntity().getWorkspace().getId();
  }


  //./asterisms-cli system init --email=sysadmin@example.com --password=theonering --requester=owner@example.com

  Mono<AuthorizationToken> authenticate() {
    return authenticator.systemLogin(

        AuthenticationCredentialType.SRP6,
        "sysadmin@example.com",
        "theonering",
        "CLI"

    );
  }


}
