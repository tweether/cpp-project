
# C++ moderm template ![CI](https://github.com/ymh199478/cpp-project/workflows/CI/badge.svg) [![codecov](https://codecov.io/gh/ymh199478/cpp-project/branch/master/graph/badge.svg?token=JAM9BYYOE1)](https://codecov.io/gh/ymh199478/cpp-project)

This is a template to setting up a new C++ project, usually create a new C++ project requires a significant amount of preparation and boilerplate code, even more so for modern C++ projects with tests, executables and continuous integration. This template should help reduce the work required to setup up a modern C++ project.

## Features

- Sources, headers and mains separated in distinct folders
- Use of modern [CMake](https://cmake.org/) for much easier compiling
- Automatic [google code style](https://google.github.io/styleguide/cppguide.html) check
- Integrated test suite using [gtest](https://github.com/google/googletest)
- Code coverage reports, including automatic upload to [codecov.io](codecov.io)
- Setup for static code analysis using [cppcheck](http://cppcheck.sourceforge.net/)
- Continuous integration via [GitHub Actions](https://help.github.com/en/actions)
- Support [Conan](https://conan.io/) package manager to quick install your package
- Suited for single header libraries and projects of any scale

## Usage

### Setup

When starting a new project, you probably don't want the history of this repository. To start fresh you can use the setup script as follows:

```shell
$ git clone https://github.com/ymh199478/cpp-project && cd cpp-project
$ ./setup.sh
```

### Building

Build by making a build directory (i.e. `build/`), run cmake in that dir, and then use make to build the desired target.

```shell
$ mkdir build && cd build
$ cmake .. -DCMAKE_BUILD_TYPE=Debug
$ cmake
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

