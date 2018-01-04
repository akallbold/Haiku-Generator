require 'pry'

class CommandLineInterface

@@syllable_1 = []
@@syllable_2 = []
@@syllable_3 = []
@@syllable_4 = []
@@syllable_5 = []
#words with 6 or more syllables are extremely rare and would show up frequently in the haiku if it exists in the user input text

  def get_user_input
    puts "Please enter your favorite text:"
    full_text = gets.chomp
  end

  def full_text_to_unique_words(full_text)
    unique_word_array = full_text.downcase.split(" ").uniq
    punctuation_marks= [".","?","!",",",";",":"]
    no_punctuation_word_array = unique_word_array.collect do |word|
      if punctuation_marks.include?(word[-1])
        word.slice(0..-2)
      else
        word
      end
    end
  end

  def word_array_to_letter_array(no_punc_unique_word_array)
    no_punc_unique_word_array.map do |word|
      word.split("")
    end
  end

  def word_syllable_hash_creator(letter_array)

    vowels = ["a","e","i","o","u","y"]
    word_hash = {}

    letter_array.each do |word|
      word_hash[word.join] = 0
      if word.size <=3
        word_hash[word.join] += 1
      else
        word.each_with_index do |letter, i|
          if vowels.include?(letter) && !vowels.include?(word[i+1])
            word_hash[word.join] += 1
          end
        end
      end
    end
    word_hash
  end

  def syllable_array_assigner(word_syllable_hash)
    word_syllable_hash.each do |word,syllable_count|
      case syllable_count
      when syllable_count>5 || syllable_count == 0
      when 5
        @@syllable_5 << word
      when 4
        @@syllable_4 << word
      when 3
        @@syllable_3 << word
      when 2
        @@syllable_2 << word
      when 1
        @@syllable_1 << word
      end
    end
  end

  def rand_num_generator(limit)
    case limit
      when 1
         1
      when 2
        # binding.pry
         1+ rand(1...2)
      when 3
        # binding.pry
        1 + rand(1...3)
      when 4
        # binding.pry
        1 + rand(1...4)
      when 5
        # binding.pry
         1+ rand(1...5)
      when limit == 6 || limit == 7
        0
    end
  end

  def line_generator(num_of_syllables)
    syllable_limit = num_of_syllables
    line_array = []

    while syllable_limit > 0
      num_of_syllables = rand_num_generator(syllable_limit)
      case num_of_syllables
        when 1
          line_array << @@syllable_1.sample
        when 2
          line_array << @@syllable_2.sample
        when 3
          line_array << @@syllable_3.sample
        when 4
          line_array << @@syllable_4.sample
        when 5
          line_array << @@syllable_5.sample
        when 0
          0
      end
      # binding.pry
    syllable_limit -= num_of_syllables
    end
    line_array
  end

  def haiku_generator
    puts line_generator(5).shuffle.join(" ")

    puts line_generator(7).shuffle.join(" ")
    binding.pry
    # puts line_generator(5).shuffle.join(" ")
  end

  def run
    user_input = get_user_input
    user_input_array = full_text_to_unique_words(user_input)
    letter_array = word_array_to_letter_array(user_input_array)
    word_syllable_hash = word_syllable_hash_creator(letter_array)
    syllable_array_assigner(word_syllable_hash)
    haiku_generator
    # binding.pry

  end


end
