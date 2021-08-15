#!/bin/bash

# Install basic libraries
npm i debug
npm i -D @types/jest
npm i -D jest
npm i -D jsdoc
npm i -D cdmgtri/project-template
npm i -D cdmgtri/jsdoc-template
npm i -D nodemon
npm i -D trash-cli

# Add scripts to package.json
npx npm-add-script --force -k "docs" -v "npx jsdoc -c jsdoc.json"
npx npm-add-script --force -k "docs:clean" -v "npx trash docs"
npx npm-add-script --force -k "docs:watch" -v "npx nodemon --watch src --exec \"npm run docs\""
npx npm-add-script --force -k "test" -v "jest test"
npx npm-add-script --force -k "test:ci" -v "jest --ci --coverage --reporters='default' ==reports='./.github/report' test"
npx npm-add-script --force -k "test:cov" -v "jest --runInBand --coverage test || true"
npx npm-add-script --force -k "test:debug" -v "env DEBUG_ENABLED=true npm run test"
npx npm-add-script --force -k "test:long" -v "env LONG_TESTS=true DEBUG_ENABLED=true npm run test"

# Copy assets
cp node_modules/project-template/assets/jsdoc.json .
cp -r node_modules/project-template/assets/.github .
cp node_modules/project-template/assets/tasks.json .vscode/
