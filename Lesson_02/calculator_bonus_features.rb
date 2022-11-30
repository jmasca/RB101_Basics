# Calculator with Updates and Bonus Features
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# used to format prompts
def prompt(key, lang, input='', op=false)
  message = MESSAGES[lang][key]
  if input.empty?
    puts "=> #{message}"
  elsif op
    puts "=> #{input} #{message}"
  else
    puts "=> #{message} #{input}"
  end
end

# test if number is a valid integer
def integer?(number)
  number.to_i.to_s == number
end

# test if number is a valid float
def float?(number)
  number.to_f.to_s == number
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

# convert the operator choice to a word
def operator_conversion(operator, lang)
  choice = case operator
           when '1'
             MESSAGES[lang]['convert_1']
           when '2'
             MESSAGES[lang]['convert_2']
           when '3'
             MESSAGES[lang]['convert_3']
           when '4'
             MESSAGES[lang]['convert_4']
           end
  choice
end

# Begin Calculator Program #

# obtain a valid language selection from the user
language = ''
loop do
  system "clear"
  prompt('choose_language', 'a')
  selection = gets.chomp

  case selection
  when '1'
    system "clear"
    language = 'en'
    prompt('welcome', language)
    break
  when '2'
    system "clear"
    language = 'es'
    prompt('welcome', language)
    break
  end
end

# obtain a valid name from the user
name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt('valid_name', language)
  else
    break
  end
end

prompt('greet', language, (name + '!'))

loop do # main loop
  # obtain a valid first number
  first_number = ''
  first_number = get_number(first_number, language, 1)

  # obtain a valid second number
  second_number = ''
  second_number = get_number(second_number, language, 2)

  prompt('operator_prompt', language)

  # obtain the operator of choice from the user
  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_operator', language)
    end
  end

  # convert the operator choice to a word
  op_action = operator_conversion(operator, language)

  # perform the requested operation
  prompt('operator_message', language, op_action, true)
  sleep(1)

  result = case operator
           when '1'
             first_number + second_number
           when '2'
             first_number - second_number
           when '3'
             first_number * second_number
           when '4'
             first_number / second_number
           end

  result = result.to_i if result.to_s.end_with?('.0')

  # display result
  prompt('result', language, result.to_s)

  # ask if user wants to use calculator again
  quit = false

  until quit
    prompt('again', language)
    answer = gets.chomp

    if answer.downcase.start_with?('y', 's')
      system "clear"
      break
    elsif answer.downcase.start_with?('n')
      quit = true
    else
      prompt('invalid', language)
    end
  end

  break if quit
end

prompt('bye', language)
