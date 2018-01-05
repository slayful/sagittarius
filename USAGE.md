You still need to add:

- A License

## It's opinionated

This starter pack is opinionated. We suggest that you review:

- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [STYLE_GUIDE.md](STYLE_GUIDE.md)

Make sure that you agree with them. Feel free to make changes to suit your particular style.

## What you need to update

This repository is templated. You'll want to replace anything in {} with the correct value. The following replacement values are required:

- {USERNAME}: your GitHub username, for example: `ponylang`.
- {REPO}: the name of your repository, for example: `ponyc`.
- {PACKAGE}: the name of your libraries package, for example: `msgpack`.
- {COC_EMAIL}: email address that Code of Conduct violations should be reported to, for example: `coc@ponylang.org`.
- {PROJECT_DESCRIPTION}: a paragraph describing your project
- {PROJECT_STATUS}: paragraph or two describing the status of your project. Is it alpha? beta? production-ready? What's left to implement?

## What you need to create

Everything in this project assumes that your project has a single package that will be created at the root of the project. For example, if you were creating a project for supporting the MessagePack serialization format in Pony and called your package `msgpack` such that you would do the following to use it in other projects:

```pony
use "msgpack"
```

then you have to create a directory called `msgpack` at the root of your repository. All your Pony source code (including tests) will live in that directory. That directory needs to match the value you use for the {PROJECT} variable.

## About the CI setup

You'll still need to setup TravisCI to take advantage of the included `.travis.yml` file.  To do this, you'll need:

- A TravisCI account
- To grant TravisCI access to your repository
- Navigate to Settings > Integrations & services in your GitHub project. Do "Add Service" and search for "TravisCI". Add it as an integrated service.

If you've never set up TravisCI before, we strongly suggest you check our their [documentation](https://docs.travis-ci.com/).

### You can also

Set up a TravisCI cron job to run daily against the `master` branch of your repository. If you do, then the included `.travis.yml` file will test your project against both the latest released version of Pony as well as the most recent changes on master.

Your PRs will be tested against the last Pony release, and any cronjob you set up will be tested using the latest commit to the `master` branch in the [ponylang/ponyc repo](https://github.com/ponylang/ponyc).

### What you might also need

The CI setup only sets up a single matrix Linux build using TravisCI. We are assuming that most libraries won't have OS specific code. If your project does have OS specific code, you'll possibly need to add:

- A TravisCI macOS setup
- Windows CI using appveyor

The CI setup also assumes that your project should perform the same regardless of LLVM version. If that isn't true for your project, you'll need to adjust the TravisCI configuration accordingly.

## How Make structures your project

The Makefile assumes that your project will have:

- A single package
- That your tests are in the top-level of your package.
- Tests will be built in the `build` directory

The Makefile assumes that you don't have any external dependencies that are managed by pony-stable. If you need to use stable, you'll need to update one of the Makefile rules:

```make
build/{PACKAGE}: build {PACKAGE}/*.pony
  ponyc {PACKAGE} -o build --debug
```

to

```make
build/{PACKAGE}: build {PACKAGE}/*.pony
  stable fetch
  stable env ponyc {PACKAGE} -o build --debug
```
