# docker-lein-karma

## Description
Simple docker container designed to run clojure and clojurescript tests with gitlab CI process.

Container is based on clojure:alpine official container. 

It includes lein, node, npm, karma + friends, chromium and firefox.

Karma is set up to render chrome and firefox in virtual frame buffer so 
it is possible to run tests in container environment.

## Supported modes
chrome, chrome-headless, firefox, nashorn

## Notes
Firefox version in alpine linux doesn't support firefox-headless mode.
Pay attention on test dependencies for nashorn. 
It will fail the test run in case of any dependencies related to DOM, like react.

## Usage
Typical .gitlab-ci.yml may look like this

```
image: raffinate/lein-karma

before_script:
  - lein deps

test:
  script:
    - lein doo firefox test once
```
