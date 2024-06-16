# Contributing to {{ cookiecutter.name }}

## Development

Obtain the source code:

    $ git clone https://github.com/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }}

Setup Python virtual env and install missing dependencies:

    $ make

Make changes using your preferred editor.

Then invoke lints, tests, …:

    $ make check

These checks are also invoked in [CI (GitHub Actions)][ci] (against multiple
Python versions and also using different Linux distributions Python packages)
whenever a branch is pushed or a pull request is opened. You may need to
enable Actions in your fork's settings.

Other common tasks are available in the [Makefile](Makefile):

<!-- include tests/readme/make-help.md -->
<!-- end include -->

[ci]: https://github.com/{{ cookiecutter.author_github }}/{{ cookiecutter.hyphenated }}/actions

## Style Guidelines

* Try to follow the existing style (where it's not already enforced by a
  linter). This applies to both code and git commits.

* Familiarise yourself with [the seven rules of a great Git commit
  message](https://cbea.ms/git-commit/#seven-rules).
