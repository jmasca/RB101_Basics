# Mortgage / Car Loan Calculator
require 'yaml'
MESSAGES = YAML.load_file('messages_loan_calculator.yml')

# format prompts
def prompt(key, input='')
  message = get_message(key, input)
  puts message
end

# get the appropriate message from the YAML file
def get_message(key, input)
  message = MESSAGES[key]
  input.empty? ? "=> #{message}" : "=> #{message} #{input}"
end

# welcome and greet the user
def welcome_and_greet
  prompt('welcome')
  sleep(1)

  prompt('name')
  name = get_name

  prompt('greet', (name + '!'))
  sleep(1)
end

# obtain a valid name from the user
def get_name
  loop do
    name = gets.chomp.strip

    if name.empty?
      prompt('valid_name')
    else
      return name
    end
  end
end

# validate the number is an integer
def integer?(number)
  number.to_i.to_s == number
end

# validate the number is a float
def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

# obtain the loan amount from the user
def get_loan_amount
  system "clear"
  loop do
    prompt('loan_amount')

    loan_amount = gets.chomp
    loan_amount.delete!(',') if loan_amount.include?(',')

    if valid_loan_amount?(loan_amount) && loan_amount.to_f > 0
      return loan_amount
    else
      prompt('valid_amount')
    end
  end
end

# obtain the annual percentage rate from the user
def get_apr
  system "clear"
  loop do
    prompt('apr')
    apr = gets.chomp

    if valid_apr?(apr)
      return apr
    else
      prompt('valid_apr')
    end
  end
end

# obtain the loan duration, in months, from the user
def get_loan_duration
  system "clear"
  loop do
    prompt('duration_in_months')
    loan_duration_months = gets.chomp

    if integer?(loan_duration_months) && loan_duration_months.to_i > 0
      return loan_duration_months
    else
      prompt('valid_duration')
    end
  end
end

# validate the loan amount
def valid_loan_amount?(amount)
  return false if amount.include?('.') && amount.split('.').last.size > 2
  integer?(amount) || float?(amount)
end

# validate the APR
def valid_apr?(rate)
  if rate.to_f > 100 || rate.to_f < 0
    return false
  end
  integer?(rate) || float?(rate)
end

# verify the users provided information
def verify_info(loan_amount, apr, loan_duration_months)
  loop do
    loan_amount.delete!(',') if loan_amount.include?(',')
    system "clear"
    display_info(loan_amount, apr, loan_duration_months)
    puts "\n"

    correct = correct_info
    return if correct == 'y'

    return get_choice
  end
end

# display the users input
def display_info(loan_amount, apr, loan_duration_months)
  loan_amount = format('%.2f', loan_amount)
  loan_amount = format_amount(loan_amount) if loan_amount.length >= 4

  prompt('details')
  sleep(0.75)
  prompt('input_amount', ('$' + loan_amount))
  sleep(0.75)
  prompt('input_apr', (apr + ' %'))
  sleep(0.75)
  prompt('input_duration', (loan_duration_months + ' months'))
  sleep(0.75)
end

# format the loan amount to include commas
def format_amount(loan_amount)
  cents = remove_cents(loan_amount) if loan_amount.include?('.')

  loan_amount = add_commas(loan_amount)
  loan_amount += cents if cents

  loan_amount
end

# remove the cents from the loan amount for formatting
def remove_cents(loan_amount)
  len = loan_amount.length
  idx = loan_amount.index('.')
  cents = loan_amount.slice!(idx...len)
  cents
end

# add commas for output format
def add_commas(loan_amount)
  len = loan_amount.length
  idx = -4

  while (idx * -1) <= (len)
    loan_amount.insert(idx, ',')
    idx -= 4
    len = loan_amount.length
  end

  loan_amount
end

# obtain validation that the user entered the correct information
def correct_info
  prompt('correct')
  loop do
    correct = gets.chomp.downcase

    if %w(y n).include?(correct)
      return correct
    else
      prompt('invalid_response')
    end
  end
end

# have the user choose an option to correct their info
def get_choice
  prompt('what_info')
  loop do
    choice = gets.chomp
    return choice if %w(1 2 3 4).include?(choice)
    prompt('must_enter')
  end
end

# display prompts to the user
def verified_and_calculating_prompts
  prompt('thank_you')
  sleep(2)
  system "clear"

  prompt('calculating')
  sleep(2)
end

# calculate monthly payment with 0% interest
def calculate_monthly_payment_zero(loan_amount, loan_duration_months)
  loan_amount.to_f / loan_duration_months.to_f
end

# calculate the monthly payment amount
def calculate_monthly_payment(loan_amount, apr, loan_duration_months)
  loan_amount.delete!(',') if loan_amount.include?(',')

  if apr == '0'
    monthly_payment = calculate_monthly_payment_zero(loan_amount,
                                                     loan_duration_months)
  else
    monthly_rate = ((apr.to_f / 100) / 12)

    monthly_payment = loan_amount.to_f * (monthly_rate /
          (1 - (1 + monthly_rate)**(-loan_duration_months.to_f)))
  end

  format_monthly_payment(monthly_payment)
end

# format the monthly payment amount
def format_monthly_payment(monthly_payment)
  monthly_payment = format('%.2f', monthly_payment)
  format_amount(monthly_payment.to_s)
end

# ask if user wants to calculcate another payment
def again?
  loop do
    prompt('again?')
    again = gets.chomp.downcase
    if !%w(y n).include?(again)
      prompt('invalid_response')
      next
    end

    case again
    when 'y' then return true
    when 'n' then return false
    end
  end
end

# display monthly payment amount
def display_monthly_payment(loan_amount, apr, loan_duration_months,
                            monthly_payment)
  display_info(loan_amount, apr, loan_duration_months)
  puts "\n"
  prompt('display_monthly_payment', ('$' + monthly_payment))
  puts "\n"
  sleep(2)
end

## Begin Mortgage / Car Loan Calculator Program ##
system "clear"

welcome_and_greet

loop do # main loop
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration_months = get_loan_duration

  loop do
    choice = verify_info(loan_amount, apr, loan_duration_months)

    case choice
    when '1' then loan_amount = get_loan_amount
    when '2' then apr = get_apr
    when '3' then loan_duration_months = get_loan_duration
    else break
    end
  end

  verified_and_calculating_prompts

  monthly_payment = calculate_monthly_payment(loan_amount, apr,
                                              loan_duration_months)
  system "clear"

  display_monthly_payment(loan_amount, apr, loan_duration_months,
                          monthly_payment)

  again = again?
  break if !again
end

prompt('bye')
