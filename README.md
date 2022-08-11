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

## Attribution

TODO
