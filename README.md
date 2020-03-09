# docker-cljs-ci

## Description
Simple docker container designed to run clojure and clojurescript tests in CI process.

Container is based on clojure:alpine official container. 

It includes lein, node, npm, shadow-cljs, karma, chromium and firefox.

Karma is set up to render chrome and firefox in virtual frame buffer so 
it is possible to run tests in container environment in real browsers.

## Supported browser modes
Chrome, ChromeHeadless, Firefox

## Notes
Firefox version in alpine linux doesn't support FirefoxHeadless mode.

## Usage
Example .gitlab-ci.yml may look like this

```
image: raffinate/cljs-ci

before_script:
  - npm install

test:
  script:
    - shadow-cljs compile ci
    - karma start --single-run
```

or like this


```
image: raffinate/cljs-ci

before_script:
  - lein deps

test:
  script:
    - lein doo firefox test once
```
