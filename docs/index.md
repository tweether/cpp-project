# C++ moderm template

This is a template to setting up a new C++ project, usually create a new C++ project requires a significant amount of preparation and boilerplate code, even more so for modern C++ projects with tests, executables and continuous integration. This template should help reduce the work required to setup up a modern C++ project.

## Requirements

**Required:**

- [conan](https://conan.io/) (>= 1.0)
- [cmake](https://cmake.org/) (>= 3.8)
- [gcc](https://gcc.gnu.org/) (>= 7.5)

**Options:**

- [cpplint](https://github.com/cpplint/cpplint)
- [cppcheck](http://cppcheck.sourceforge.net/)
- [lcov](http://ltp.sourceforge.net/coverage/lcov.php)

## Codecov.io

Add Codecov's token in `Github -> Settings -> Secrets` Token name is: `CODECOV_TOKEN`