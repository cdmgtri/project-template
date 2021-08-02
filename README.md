
Standard project template for Node.js code with basic testing, code coverage, documentation generation, and CI set up on GitHub.

See the [project template](https://github.com/cdmgtri/project-template).

**Contents**

- [Features](#features)
- [Installation](#installation)
- [Set up badges](#set-up-badges)
- [Pull changes into an existing repo](#pull-changes-into-an-existing-repo)
- [FAQ](#faq)

## Features

**Generate JSDocs**

Uses jsdoc, a custom template, a jsdoc typeof plugin, a jsdoc ts-import plugin, and nodemon to generate code documentation.

```sh
npm run docs         # Generate docs
npm run docs:clean   # Move the existing docs folder to the trash
npm run docs:watch   # Regenerate documentation on save
```

Settings are in the `jsdoc.json` file.

**Testing with Jest**

```sh
npm run test         # Runs code tests with jest
npm run test:ci      # Runs jest with the --ci and --reporters flags
npm run test:cov     # Runs jest with the coverage reporter
npm run test:debug   # Runs jest with the JS debug utility enabled for decorated console.error messages
```

**CI via GitHub Actions**

- Run tests (`npm run test`)
- Sends the coverage report to coveralls.io, which will add the repo if needed
- For the dev branch only (can change the branch in `.github/workflows/ci.yml`)
  - Creates a `gh-pages` branch if one does not exist
  - Removes the current `docs` folder if it exists (`npm run docs:clean`)
  - Generates the docs (`npm run docs`)
  - Publishes the `docs` folder to the gh-pages branch to post the latest documentation

**VSCode launch configurations**

Defaults to running all Jest tests.

## Installation

Options:

- Set up a new repo online on GitHub and select this as the new repo's template.
- Use github-cli with the following command

```sh
gh repo create MY_REPO --template cdmgtri/project-template
```

Update the settings after initializing the repo:

- Update `name` in `package.json` with the new project name
- Update `jsdoc.json` to add the project name and set specific options
- Update GitHub repo settings to use the root folder of the gh-pages branch for GitHub Pages
- Add the GitHub Pages link to the GitHub about field on the Code tab
- Set up badges (see below)

## Set up badges

In the README, set up the following badges.

**GitHub Actions Badge**

```md
[![CI](https://github.com/ACCOUNT/REPO/actions/workflows/main.yml/badge.svg)](https://github.com/ACCOUNT/REPO/actions)
[![coverage](https://coveralls.io/repos/github/ACCOUNT/REPO/badge.svg)](https://coveralls.io/github/ACCOUNT/REPO)
```

## Pull changes into an existing repo

```sh
git remote add template cdmgtri/project-template

git pull template master --allow-unrelated-histories --no-commit
```

Review all changes to make sure current project content is not overwritten by the template.

## FAQ

**Why does the build fail for this project?**

This project is not intended to pass its own GitHub Action tests.  Only essential files are provided in order to reduce the number of conflicts when merging into an existing project.  No dummy test file is provided and this causes the build to fail.

**Why is the readme in a separate branch**

This keeps the documentation for how to use the template separate from real project documentation in existing repos.  Cuts down on merge conflicts.

**Why is the readme not in the gh-pages branch**

The GitHub Actions file generates project documentation and pushes it to the `gh-pages` branch.  Anything else in `gh-pages` would be overwritten.
