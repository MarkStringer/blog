# 97 Agile Ideas - Idea Number 13
# Test Driven Development

The idea of test-driven development (TDD) is that every piece of code that is developed is matched with an automatic unit test: another piece of code which ensures the code does what it's supposed to.

The "driven" aspect of TDD is the idea that the test should come first. For any new piece of functionality the series of steps should be.

    Write a unit test that tests the functionality

    Test that this unit test fails

    Write code that makes the unit test pass

    Run the test to make sure it passes.

Why should we check that the unit tests fail? Before we write the code to make them pass? Because if the test passes before we write the code it's either testing the wrong thing or it's not working properly as a test.

It must be said that this approach of writing tests first is a counter-intuitive step too many for a lot of developers and so the order of the above steps tends to frequently be 3, 1, 4 (write code, write test, make sure test passes).

But that doesn't take away from the enormous value in the practice of wrapping as much of the code as possible in unit tests.

Code that is wrapped in unit tests can be continuously integrated because every time the code is changed all of the unit tests can be run to check that everything still works.

Code that can be continuously integrated can be continuously deployed - installed in environments where it can be run with live and like-live data. And code that can be continuously deployed can be continuously delivered. Available to its users, delivering value for the people who paid for it.
