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

@Singleton
public class WorkspaceCreator {

  UserAccountAuthenticator authenticator;


  WorkspaceProvisioningClient workspaceProvisioningClient;

  public WorkspaceCreator(UserAccountAuthenticator authenticator, WorkspaceProvisioningClient workspaceProvisioningClient) {
    this.authenticator = authenticator;
    this.workspaceProvisioningClient = workspaceProvisioningClient;
  }

  public Mono<String> createWorkspace(String name) {


    return authenticate().flatMap(authorizationToken ->

        workspaceProvisioningClient.provisionWorkspace(authorizationToken.getToken(),
            new WorkspaceProvisioningConfiguration(name, Workspace.RegistrationMode.OPEN, "demo@example.com")
        ).map(workspaceProvisionedDataSuccessResponseWithEntity -> {
          return workspaceProvisionedDataSuccessResponseWithEntity.getEntity().getWorkspace().getId();
        })

    ).flatMap(uuid -> {

      //provision the Tolam org using workspace uuid as OrganizationId

      return Mono.just(uuid.toString());
    });


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
