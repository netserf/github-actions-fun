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

## Attribution

TODO
