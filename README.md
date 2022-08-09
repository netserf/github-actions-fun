# github-actions-fun

This is a collection of GitHub Actions examples along with notes and references.

To limit the number of GitHub Actions minutes consumed, I've included a
`try_workflow.sh` script that moves only one workflow file to the
`.github/workflow` directory and clears out any old workflow files.

## Simple Shell Runs

```bash
./try_workflow.sh workflows/01_hello.yml
```

* Workflow: [01_hello.yml](workflows/01_hello.yml)
* Reference: [jobs.<job_id>.steps[*].run](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsrun)
* A simple workflow that runs shell commands in both ubuntu and windows
* Example runs in bash, python, and powershell

[02_hello.yml](workflows/02_hello.yml)

[02_actions.yml](workflows/02_actions.yml)

## Attribution

TODO
