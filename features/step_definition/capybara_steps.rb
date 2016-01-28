require 'capybara/cucumber'
Capybara.default_driver = :selenium

$stdout = File.open('users.txt', 'a')

Before do
  visit 'http://www.practica.ru/accounts/register/'
end

Given(/^I have no account$/) do
  expect(page).to have_content('регистрация')
end

When(/^I Sign in$/) do
  fill_in 'email', with: 'user' + rand(1_000).to_s + '@random.com'
  fill_in 'password1', with: '12345678912'
  fill_in 'password2', with: '12345678912'
end

When(/^I press "([^"]*)"$/) do |arg1|
  click_on(arg1)
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content('выйти')
end

When(/^I Sign in 50 times$/) do 
  50.times do
    visit 'http://www.practica.ru/accounts/logout/'
    visit 'http://www.practica.ru/accounts/register/'

    login = 'brother' + rand(10_000).to_s + '@bang.by'
    password = rand(10_000_000)
    fill_in 'email', with: login
    fill_in 'password1', with: password
    fill_in 'password2', with: password
    begin
      $stdout.write "#{login}\t#{password}\n"
      click_on('готово')
    rescue
      puts "It's OK"
    end
  end
end
