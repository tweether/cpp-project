// Copyright 2020 <owner>

#include "example/example.h"

Dummy::Dummy() {
}

bool Dummy::DoSomething() {
    // Do silly things, using some C++17 features to enforce C++17 builds only.
    constexpr int digits[2] = {0, 1};
    auto [zero, one] = digits;
    return zero + one;
}
