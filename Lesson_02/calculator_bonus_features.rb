# Calculator with Updates and Bonus Features
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# used to format prompts
def prompt(key, lang, input='')
  message = MESSAGES[lang][key]
  puts input.empty? ? "=> #{message}" : "=> #{message} #{input}"
end

# test if number is a valid integer
def integer?(number)
  number.to_i.to_s == number
end

# test if number is a valid float
def float?(number)
  /\d/.match(number) && /^-?\d*\.?\d*$/.match(number)
end

# test for a valid number
def number?(number)
  integer?(number) || float?(number)
end

# obtain a valid number
def get_number(number, lang, position)
  loop do
    prompt('first_number', lang) if position == 1
    prompt('second_number', lang) if position == 2
    number = gets.chomp

    if number?(number)
      return number.to_f
    else
      prompt('valid_number', lang)
    end
  end
end

# obtain a valid language selection from the user
def get_language
  loop do
    system "clear"
    prompt('choose_language', 'a')
    selection = gets.chomp

    case selection
    when '1' then return 'en'
    when '2' then return 'es'
    end

    prompt('invalid_language_choice', 'a')
    sleep(1)
  end
end

# display a welcome message to user / ask for name
def display_welcome(language)
  system 'clear'
  prompt('welcome', language)
end

# obtain a valid name from the user
def get_name(language)
  loop do
    name = gets.chomp.strip

    if name.empty?
      prompt('valid_name', language)
    else
      return name
    end
  end
end

# display a personalized greeting message to user
def display_greeting(name, language)
  prompt('greet', language, (name + '!'))
end

# obtain the operator of choice from the user
def get_operator(language)
  prompt('operator_prompt', language)
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      return operator
    else
      prompt('valid_operator', language)
    end
  end
end

# display message about what operation is being performed
def display_operator_message(operator, lang)
  case operator
  when '1'
    print MESSAGES[lang]['op_1']
  when '2'
    print MESSAGES[lang]['op_2']
  when '3'
    print MESSAGES[lang]['op_3']
  when '4'
    print MESSAGES[lang]['op_4']
  end

  puts MESSAGES[lang]['operator_message']
  sleep(1)
end

# perform requested calculation
def calculate(first_number, second_number, operator)
  case operator
  when '1'
    first_number + second_number
  when '2'
    first_number - second_number
  when '3'
    first_number * second_number
  when '4'
    first_number / second_number
  end
end

# display result
def display_result(result, language)
  prompt('result', language, result)
end

# ask if user wants to use calculator again
def calculate_again?(language)
  quit = false

  until quit
    prompt('again', language)
    answer = gets.chomp

    if answer.downcase.start_with?('y', 's')
      system "clear"
      return false
    elsif answer.downcase.start_with?('n')
      return true
    else
      prompt('invalid', language)
    end
  end
end

# thank the user and say good bye
def say_goodbye(language)
  prompt('bye', language)
end

# Begin Calculator Program #

language = get_language
display_welcome(language)

name = get_name(language)
display_greeting(name, language)

loop do # main loop
  first_number = get_number(first_number, language, 1)
  second_number = get_number(second_number, language, 2)

  operator = get_operator(language)

  display_operator_message(operator, language)

  result = calculate(first_number, second_number, operator)
  result = result.to_i if result.to_s.end_with?('.0')

  display_result(result.to_s, language)

  quit = calculate_again?(language)

  break if quit
end

say_goodbye(language)
