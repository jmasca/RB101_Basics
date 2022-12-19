# ROCK PAPER SCISSORS LIZARD SPOCK #
require "yaml"

MESSAGES = YAML.load_file('messages_rpsls.yml')
VALID_CHOICES = %w(rock paper scissors lizard spock)
RULES = { rock: { lizard: 'crushes', scissors: 'crushes' },
          paper: { rock: 'covers', spock: 'disproves' },
          scissors: { paper: 'cuts', lizard: 'decapitates' },
          lizard: { spock: 'poisons', paper: 'eats' },
          spock: { scissors: 'smashes', rock: 'vaporizes' } }

def check_for_winner(user, computer)
  if win?(user, computer) then 'user'
  elsif win?(computer, user) then 'computer'
  end
end

def display_choices(users_choice, computers_choice)
  system "clear"
  prompt('user_chose', users_choice.capitalize)
  sleep(0.75)
  prompt('computer_chose', computers_choice.capitalize)
  sleep(1.14)
  puts "\n"
end

def display_final_round_message
  system "clear"
  sleep(0.5)
  final_round = %w(IT ALL COMES DOWN TO THE FINAL ROUND!!!)
  final_round.each do |word|
    print word + ' '
    sleep(0.5)
  end
  sleep(1.25)
end

def display_grand_winner(grand_winner)
  prompt('grand_user') if grand_winner == 'user'
  prompt('grand_computer') if grand_winner == 'computer'
  sleep(1.5)
end

def display_instructions
  system "clear"
  prompt('display_instructions')
  gets
  system "clear"
end

def display_result(winner)
  case winner
  when 'user' then prompt('user_wins')
  when 'computer' then prompt('computer_wins')
  else prompt('tie')
  end
  sleep(1.75)
end

def display_round(round)
  system "clear"
  sleep(0.5)
  puts "=> -- Round #{round}! -- <=\n\n".rjust(37)
  sleep(0.75)
end

def display_rule(user, computer, winner)
  if winner == 'user'
    puts "=> #{user.capitalize} #{RULES[user.to_sym][computer.to_sym]} \
#{computer.capitalize}!"
  else
    puts "=> #{computer.capitalize} #{RULES[computer.to_sym][user.to_sym]} \
#{user.capitalize}!"
  end
  sleep(1.22)
end

def display_score(win_count)
  puts "\n"
  puts "Score".rjust(36) + "\n\tYou: #{win_count[:user]} total wins!\t \
        Computer: #{win_count[:computer]} total wins!\n\n\n"
  sleep(1)
end

def display_welcome_message
  system "clear"
  prompt('welcome')
  sleep(1)
  puts "\n"
end

def get_users_choice
  loop do
    prompt('choose_one', VALID_CHOICES.join(', '))
    choice = gets.chomp.strip.downcase

    if valid_choice?(choice)
      choice = retrieve_full_word(choice)
      return choice
    end

    prompt('not_valid')
  end
end

def get_yes_or_no
  loop do
    choice = gets.chomp.downcase
    return choice if %w(y n).include?(choice)
    prompt('invalid')
  end
end

def prompt(key, input='')
  message = retrieve_message(key, input)
  puts message
end

def retrieve_full_word(choice)
  VALID_CHOICES.each do |word|
    return word if word.start_with?(choice)
  end
end

def retrieve_grand_winner(win_count)
  if win_count[:user] == 3 then 'user'
  else 'computer'
  end
end

def retrieve_message(key, input)
  message = MESSAGES[key]
  input.empty? ? "=> #{message}" : "=> #{message} #{input}"
end

def grand_winner?(win_count)
  return true if win_count[:user] == 3 || win_count[:computer] == 3
  false
end

def play_again?
  puts "\n\n"
  prompt('play_again?')
  return true if get_yes_or_no == 'y'
  false
end

def valid_choice?(choice)
  return false if choice == 's'
  return false if choice.empty?
  VALID_CHOICES.include?(retrieve_full_word(choice))
end

def view_instructions?
  prompt('view_instructions?')
  view_instructions = get_yes_or_no
  return true if view_instructions == 'y'
  false
end

def win?(first, second)
  RULES[first.to_sym].include?(second.to_sym)
end

## BEGIN RPSLS GAME ##
display_welcome_message
display_instructions if view_instructions?

loop do # main loop
  round = 1
  winner = ''
  win_count = { user: 0, computer: 0 }

  loop do
    display_round(round)
    users_choice = get_users_choice
    computers_choice = VALID_CHOICES.sample
    winner = check_for_winner(users_choice, computers_choice)

    display_choices(users_choice, computers_choice)
    display_rule(users_choice, computers_choice, winner) if winner
    display_result(winner)
    next if !winner

    win_count[winner.to_sym] += 1
    display_score(win_count)

    break if grand_winner?(win_count)

    prompt('next_round')
    gets

    round += 1
    display_final_round_message if round == 5
  end

  grand_winner = retrieve_grand_winner(win_count)
  display_grand_winner(grand_winner)

  break if !play_again?
end

prompt('thank_you')
