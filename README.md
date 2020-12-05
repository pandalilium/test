# unison-homepage

## Develop

The folder "www" is the root of the website.
Everything here gets rolled out to the server

## Pull request

1. Create a new branch from _main_ and commit and push it with your changes.
2. In github, create a pull request (PR) for your branch
3. Get one of the other team members to approve the PR.
4. When approved, Github Actions will automatically build a release

## How to deploy to server

### Test server

All pull requests to branch _main_ trigger a build and a release.
Invoke the _"Deploy To Test"_ workflow to deploy to the test server.
The invocation will prompt for the correct branch name and build number. 

### Production server 

Builds on _main_ branch will automatically proceed with deployment to production.
