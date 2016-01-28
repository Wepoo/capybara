Feature: capybara sign in
  In order to sign in
  As a capybara
  I want to create 50 accounts

Scenario: capybara sign in
  Given I have no account
  And I Sign in
  And I press "готово"
  Then I should see "Вы вошли как"

Scenario: capybara sign in
  When I Sign in 50 times
  Then I should see "Вы вошли как"