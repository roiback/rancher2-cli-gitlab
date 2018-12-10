# rancher2-cli-gitlab

A docker image to run Rancher 2 cli in giltab pipelines.

Example of use in a `gitlab-ci.yml` file:

```yml
variables:
  RANCHER_SERVER_URL: https://your.server/v3
  RANCHER_API_TOKEN: "..."
  RANCHER_PROJECT: "c-xxxxx:project-xxxxx"

production:
  image: jramcast/rancher2-cli-gitlab
  stage: deploy
  script:
    - rancher login "$RANCHER_SERVER_URL" -t "$RANCHER_API_TOKEN" --context $RANCHER_PROJECT --skip-verify
    - rancher kubectl set env deployment core --namespace "..." -e DEPLOY_TIMESTAMP="$(date +%s)"
```