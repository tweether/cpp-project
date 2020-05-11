
# C++ moderm template [![build](https://github.com/tweether/cpp-project/workflows/build/badge.svg)](https://github.com/tweether/cpp-project/actions?query=workflow%3Abuild) [![Build Status](https://travis-ci.com/tweether/cpp-project.svg?branch=master)](https://travis-ci.com/tweether/cpp-project) [![codecov](https://codecov.io/gh/tweether/cpp-project/branch/master/graph/badge.svg)](https://codecov.io/gh/tweether/cpp-project) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/961213824b5a46ed9f89a4d3e6b454f9)](https://www.codacy.com/gh/tweether/cpp-project?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=tweether/cpp-project&amp;utm_campaign=Badge_Grade)

This is a template to setting up a new C++ project, usually create a new C++ project requires a significant amount of preparation and boilerplate code, even more so for modern C++ projects with tests, executables and continuous integration. This template should help reduce the work required to setup up a modern C++ project.

## Features

- Sources, headers and mains separated in distinct folders
- Use of modern [CMake](https://cmake.org/) for much easier compiling
- Automatic [google code style](https://google.github.io/styleguide/cppguide.html) check
- Integrated test suite using [gtest](https://github.com/google/googletest)
- Code coverage reports, including automatic upload to [codecov.io](codecov.io)
- Setup for static code analysis using [cppcheck](http://cppcheck.sourceforge.net/)
- Continuous integration via [GitHub Actions](https://help.github.com/en/actions) / [Travis-CI](https://travis-ci.com)
- Support [Conan](https://conan.io/) package manager to quick install your package
- Moderm github issues template
- Suited for single header libraries and projects of any scale

## Usage

### Setup

When starting a new project, you probably don't want the history of this repository. To start fresh you can use the setup script as follows:

```shell
$ git clone https://github.com/tweether/cpp-project && cd cpp-project
$ ./setup.sh
```

### Building

Build by making a build directory (i.e. `build/`), run cmake in that dir, and then use make to build the desired target.

```shell
$ mkdir build && cd build
$ cmake ..
$ cmake --build .
```

## Requirements

**Required:**
- [conan](https://conan.io/) (>= 1.0)
- [cmake](https://cmake.org/) (>= 3.8)
- [gcc](https://gcc.gnu.org/) (>= 7.5)

**Options:**
- [cpplint](https://github.com/cpplint/cpplint)
- [cppcheck](http://cppcheck.sourceforge.net/)
- [lcov](http://ltp.sourceforge.net/coverage/lcov.php)

