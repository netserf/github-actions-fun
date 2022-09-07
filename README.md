# github-actions-fun

This is a collection of GitHub Actions examples along with notes and references.

To limit the number of GitHub Actions minutes consumed, I've included a
simple `try_workflow.sh` script that copies only one workflow file to the
`.github/workflow` directory for execution and clears out any old workflow
files.

## 1. Shell Commands with `run:`

```bash
./try_workflow.sh workflows/01_hello.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Shell%20Commands/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [01_hello.yml](workflows/01_hello.yml)
* **Reference**: [jobs.<job_id>.steps[*].run](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsrun)
* A simple workflow that demonstrates the `run:` statement to execute shell
  commands
* Example runs in bash, python, and powershell using both ubuntu and windows

## 2. Executing Actions with `uses:`

```bash
./try_workflow.sh workflows/02_actions.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Actions%20Workflow/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [02_actions.yml](workflows/02_actions.yml)
* **Reference**: [jobs.<job_id>.steps[*].uses](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsuses)
* A workflow that demonstrates the `uses:` statement to execute a GitHub Action
* Publically available GitHub Actions may be found in the [Actions Marketplace](https://github.com/marketplace?type=actions)

## 3. Serializing dependent jobs with `needs:`

```bash
./try_workflow.sh workflows/03_needs.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Sequential%20Jobs/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [03_needs.yml](workflows/03_needs.yml)
* **References**:
  * [jobs.<job_id>.needs](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idneeds)
  * [jobs.<job_id>.steps[*].id](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsid)
  * [contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)
* A workflow that demonstrates the `needs:` statement to serialize dependent jobs
* Dependent jobs can be stated as a string or an array of strings
* This example also illustrates marking a step with an `id:` attribute. These
  step id's can be used to reference different step contexts during execution

## 4. Checkout your GitHub repository

```bash
./try_workflow.sh workflows/04_checkout.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Checkout%20Demo/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [04_checkout.yml](workflows/04_checkout.yml)
* **References**:
  * [actions/checkout](https://github.com/actions/checkout)
* An action that checks-out your repository into $GITHUB_WORKSPACE, so your
  workflow can access it
* Once of many ready-made GitHub Actions to simplify your workflow

## 5. Trigger filters

```bash
./try_workflow.sh workflows/05_trigger_filters.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Trigger%20Filters/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [05_trigger_filters.yml](workflows/05_trigger_filters.yml)
* **References**:
  * [trigger filters](https://docs.github.com/en/actions/using-workflows/triggering-a-workflow#using-filters)
* An example that shows how to filter the GHA triggers so only a subset of
  events will trigger the workflow
* In this case the pull requests are filtered down to subset of events that are
  listed in the `types:` array

## 6. Trigger workflow on-demand

```bash
./try_workflow.sh workflows/06_on_demand_trigger.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/On%20Demand%20Trigger/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [06_on_demand_trigger.yml](workflows/06_on_demand_trigger.yml)
* **References**:
  * [repository_dispatch](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#repository_dispatch)
  * [dispatch event](https://docs.github.com/en/rest/repos/repos#create-a-repository-dispatch-event)
* An example of how to trigger a workflow on-demand using the GitHub API
* Once the workflow is in place, you can trigger it with the following POST
  request:

```bash
curl \
-X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: token <TOKEN>" \
<https://api.github.com/repos/OWNER/REPO/dispatches> \
-d '{"event_type":"on-demand-test","client_payload":{"unit":false,"integration":true}}'
```

* Note that the `event_type` in the POST request must match one of the `types:`
  strings set in the `repository_dispatch` trigger

## 7. Scheduled triggers

```bash
./try_workflow.sh workflows/07_scheduled_trigger.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Scheduled%20Trigger/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [07_scheduled_trigger.yml](workflows/07_scheduled_trigger.yml)
* **References**:
  * [scheduled triggers](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#schedule)
* An example that shows how to trigger a workflow on a scheduled basis using
  cron syntax

## 8. Environment Variables

```bash
./try_workflow.sh workflows/08_env_vars.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Environment%20Variables/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [08_env_vars.yml](workflows/08_env_vars.yml)
* **References**:
  * [environment variables](https://docs.github.com/en/actions/learn-github-actions/environment-variables)
* An example that shows how to use environment variables in a workflow
* Environment variables can be set at the workflow level, the job level, or at
  the step level

## 9. Secrets

```bash
./try_workflow.sh workflows/09_secrets.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Secrets/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [09_secrets.yml](workflows/09_secrets.yml)
* **References**:
  * [secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
* An example that shows how to load secrets configured in your repository
  into your workflow

## 10. GitHub Tokens

```bash
./try_workflow.sh workflows/10_github_tokens.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/GitHub%20Tokens/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [10_github_tokens.yml](workflows/10_github_tokens.yml)
* **References**:
  * [Automatic token authentication](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)
* An example of how you can use a GITHUB_TOKEN secret in your workflow when
  you need to authenticate in a workflow run

## 11. Decrypt GPG-encrypted files

```bash
./try_workflow.sh workflows/11_decrypt_gpg.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Decrypt%20GPG/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [11_github_tokens.yml](workflows/11_github_tokens.yml)
* **References**:
  * [GPG-encrypted files](https://www.gnupg.org/gph/en/manual/x110.html)
* An example of how you can unencrypt a GPG-encrypted file in your workflow
* This is using a simple symmetric cipher to perform the encryption
* The [my_secret_json.gpg](my_secret_json.gpg) file was encrypted using a
  passphrase to protect the secret. The following command performs the
  encryption:

```bash
gpg --symmetric --cipher-algo AES256 my_secret.json
```

* The GPG_PASSPHRASE is configured in the repository's secrets so that it may
  be used in the workflow to unecrypt the file

## 12. Contexts

```bash
./try_workflow.sh workflows/12_contexts.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Contexts/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [12_contexts.yml](workflows/12_contexts.yml)
* **References**:
  * [Contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)
* An example workflow showing various GHA contexts
* Contexts provide access to information about workflow runs, runner
  environments, jobs, and steps. Each context is an object that contains
  properties, which can be strings or other objects.

## 13. Functions

```bash
./try_workflow.sh workflows/13_functions.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Functions/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [13_functions.yml](workflows/13_functions.yml)
* **References**:
  * [Functions](https://docs.github.com/en/actions/learn-github-actions/expressions#functions)
* An example workflow showing some of the GHA functions available
* The number of functions is limited, so you consider other tooling if you need
  more functionality

## 14. Conditional Steps

```bash
./try_workflow.sh workflows/14_conditionals.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Conditionals/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [14_conditionals.yml](workflows/14_conditionals.yml)
* **References**:
  * [jobs.<job_id>.if](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idif)
  * [Status Checks](https://docs.github.com/en/actions/learn-github-actions/expressions#status-check-functions)
* An example workflow showing how you can use conditional steps to control
  whether subsequent steps execute

## 15. Matrix Strategy

```bash
./try_workflow.sh workflows/15_matrix_strategy.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Matrix%20Strategy/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [15_matrix_strategy.yml](workflows/15_matrix_strategy.yml)
* **References**:
  * [Matrix Strategy](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs)
* An example workflow showing how a matrix strategy can define a single job that
  automatically creates multiple jobs based on the matrix values
* Very useful when you need to run test code against multiple versions and/or
  operating systems

## 16. Containers

```bash
./try_workflow.sh workflows/16_containers.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Containers/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [16_containers.yml](workflows/16_containers.yml)
* **References**:
  * [jobs.<job_id>.container](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idcontainer)
  * [Job in a container](https://docs.github.com/en/actions/using-jobs/running-jobs-in-a-container)
* An example workflow showing how to run a GHA job inside a container
* An option to consider if you need a container environment or a specialized
  environment beyond the standard GHA runners available

## 17. Multiple Containers

```bash
./try_workflow.sh workflows/17_multi_containers.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Multiple%20Containers/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [17_multi_containers.yml](workflows/17_multi_containers.yml)
* **References**:
  * [jobs.<job_id>.services](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idservices)
* An example workflow showing how to run a GHA job with a set of container-based
  services
* An option to consider when testing a job that requires a backend service
  (e.g. API + database)

## 18. Customize Containers

```bash
./try_workflow.sh workflows/18_customize_containers.yml

```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Customize%20Containers/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [18_customize_containers.yml](workflows/18_customize_containers.yml)
* **References**:
  * [jobs.<job_id>.steps\[*\].uses](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsuses)
* An example workflow showing how you can further customize a container image
  taken from Docker Hub and used in a GHA step

## 19. Override Entrypoint

```bash
./try_workflow.sh workflows/19_override_entrypoint.yml
```

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Override%20Entrypoint/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [19_override_entrypoint.yml](workflows/19_override_entrypoint.yml)
* **References**:
* [jobs.<job_id>.steps[*].with.entrypoint](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepswithentrypoint)
* An example workflow using a container image which overrides the default
  entrypoint with a local script

## Attribution

TODO
