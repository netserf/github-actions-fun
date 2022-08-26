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

* **Status**: [![Actions Status](https://github.com/netserf/github-actions-fun/workflows/Decrypte%20GPG/badge.svg)](https://github.com/netserf/github-actions-fun/actions)
* **Workflow**: [11_github_tokens.yml](workflows/11_github_tokens.yml)
* **References**:
  * TODO
* An example of how you can ...
* Assuming you have your gpg keys configured, you can use the following command
  to encrypt the file:

```bash
gpg --symmetric --cipher-algo AES256 my_secret.json
```

* Your GPG_PASSPHRASE will be configured in the repository's secrets
  


## Attribution

TODO
