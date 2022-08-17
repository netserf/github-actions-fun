# github-actions-fun

This is a collection of GitHub Actions examples along with notes and references.

To limit the number of GitHub Actions minutes consumed, I've included a
simple `try_workflow.sh` script that copies only one workflow file to the
`.github/workflow` directory for execution and clears out any old workflow
files.

## 1. Shell Executions with `run:`

```bash
./try_workflow.sh workflows/01_hello.yml
```

* **Workflow**: [01_hello.yml](workflows/01_hello.yml)
* **Reference**: [jobs.<job_id>.steps[*].run](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsrun)
* A simple workflow that demonstrates the `run:` statement to execute shell
  commands
* Example runs in bash, python, and powershell using both ubuntu and windows

## 2. Executing Actions with `uses:`

```bash
./try_workflow.sh workflows/02_actions.yml
```

* **Workflow**: [02_actions.yml](workflows/02_actions.yml)
* **Reference**: [jobs.<job_id>.steps[*].uses](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsuses)
* A workflow that demonstrates the `uses:` statement to execute a GitHub Action
* Publically available GitHub Actions may be found in the [Actions Marketplace](https://github.com/marketplace?type=actions)

## 3. Serializing dependent steps with `needs:`

```bash
./try_workflow.sh workflows/03_needs.yml
```

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

* **Workflow**: [04_checkout.yml](workflows/04_checkout.yml)
* **References**:
  * [actions/checkout](https://github.com/actions/checkout)
* An action that checks-out your repository into $GITHUB_WORKSPACE, so your
  workflow can access it
* Once of many ready-made GitHub Actions to simplify your workflow

## 5. Trigger options for GitHub Actions

```bash

```bash
./try_workflow.sh workflows/05_on_trigger_options.yml
```

* **Workflow**: [05_on_trigger_options.yml](workflows/05_on_trigger_options.yml)
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

* **Workflow**: [06_on_demand_trigger.yml](workflows/06_on_demand_trigger.yml)
* **References**:
  * [repository_dispatch](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#repository_dispatch)
  * [dispatch event](https://docs.github.com/en/rest/repos/repos#create-a-repository-dispatch-event)
* An example of how to trigger a workflow on-demand using the GitHub API
* Once the workflow is in place, you can trigger it with the following POST
  request:

```bash
# curl \
# -X POST \
# -H "Accept: application/vnd.github+json" \
# -H "Authorization: token <TOKEN>" \
# <https://api.github.com/repos/OWNER/REPO/dispatches> \
# -d '{"event_type":"on-demand-test","client_payload":{"unit":false,"integration":true}}'
```

* Note that the `event_type` in the POST request must match one of the `types:`
  strings set in the `repository_dispatch` trigger

## Attribution

TODO
