// Copyright 2020 <owner>

#include "gtest/gtest.h"
#include "example/example.h"

// Tests that don't naturally fit in the headers/.cpp files directly
// can be placed in a tests/*.cpp file. Integration tests are a good example.
TEST(TestDoSomething, ComplicatedIntegrationTestsCouldBeHere) {
  Dummy d;
  EXPECT_EQ(true, d.DoSomething());
}
