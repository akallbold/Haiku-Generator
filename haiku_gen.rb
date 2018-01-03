require 'pry'

$syllable_6 = []
$syllable_5 = []
$syllable_4 = []
$syllable_3 = []
$syllable_2 = []
$syllable_1 = []


meditations =
"left, We aught to consider not only that our life is daily wasting away and a smaller part of it is left, but another thing also must be taken into the account, that if a man should live longer, it is quite uncertain whether the understanding will still continue sufficient for the comprehension of things, and retain the power of contemplation which strives to acquire the knowledge of the divine and the human. For if he shall begin to fall into dotage, perspiration and nutrition and imagination and appetite, and whatever else there is of the kind, will not fail; but the power of making use of ourselves, and filling up the measure of our duty, and clearly separating all appearances, and considering whether a man should now depart from life, and whatever else of the kind absolutely requires a disciplined reason, all this is already extinguished. We must make haste then, not only because we are daily nearer to death, but also because the conception of things and the understanding of them cease first. We ought to observe also that even the things which follow after the things which are produced according to nature contain something pleasing and attractive. For instance, when bread is baked some parts are split at the surface, and these parts which thus open, and have a certain fashion contrary to the purpose of the bakers art, are beautiful in a manner, and in a peculiar way excite a desire for eating. And again, figs, when they are quite ripe, gape open; and in the ripe olives the very circumstance of their being near to rottenness adds a peculiar beauty to the fruit. And the ears of corn bending down, and the lions eyebrows, and the foam which flows from the mouth of wild boars, and many other things- though they are far from being beautiful, if a man should examine them severally- still, because they are consequent upon the things which are formed by nature, help to adorn them, and they please the mind; so that if a man should have a feeling and deeper insight with respect to the things which are produced in the universe, there is hardly one of those which follow by way of consequence which will not seem to him to be in a manner disposed so as to give pleasure. And so he will see even the real gaping jaws of wild beasts with no less pleasure than those which painters and"


  def full_text_to_unique_words(full_text)
    unique_word_array = full_text.downcase.split(" ").uniq
    punctuation_marks= [".","?","!",",",";",":"]
    no_punc_unique_word_array = unique_word_array.map do |word|
      if punctuation_marks.include?(word[-1])
        word.slice(0..-2)
      else
        word
      end
    end
    # puts no_punc_unique_word_array
    no_punc_unique_word_array
  end

  def word_array_to_letter_array(no_punc_unique_word_array)
    no_punc_unique_word_array.each do |word|
      word_array = word.downcase.split("")
      count = 0
      vowels = ["a","e","i","o","u","y"]
      if word_array.size <=3
        return count+=1
      else
        word_array.each_with_index do |letter, i|
          if vowels.include?(letter) && !vowels.include?(word[i+1])
            count += 1
          end
        end
      end
      syllable_count_array_assigner(word,count)
    end
  end

  def syllable_count_array_assigner(word,syllable_count)

    case syllable_count
    when syllable_count>6 || syllable_count == 0
      return
    when 6
      $syllable_6 << word
    when 5
      $syllable_5 << word
    when 4
      $syllable_4 << word
    when 3
      $syllable_3 << word
    when 2
      $syllable_2 << word
    when 1
      $syllable_1 << word
    end
    # puts syllable_6
    # puts syllable_5
    # puts syllable_4
    # puts syllable_3
    # puts syllable_2
    # puts syllable_1
  end

  def rand_num_generator(limit)
    case limit
      when 1
         1
      when 2
         1+ rand(1...2)
      when 3
        1 + rand(1...3)
      when 4
        1 + rand(1...4)
      when 5
         1+ rand(1...5)
      when 6
         1+ rand(1...6)
      when 7
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
          line_array << $syllable_1.sample
        when 2
          line_array << $syllable_2.sample
        when 3
          line_array << $syllable_3.sample
        when 4
          line_array << $syllable_4.sample
        when 5
          line_array << $syllable_5.sample
        when 6
          line_array << $syllable_6.sample
        when 0
      end
    syllable_limit -= num_of_syllables
    end
    line_array
  end

  def haiku_generator
    puts line_generator(5).shuffle.join(" ")
    puts line_generator(7).shuffle.join(" ")
    puts line_generator(5).shuffle.join(" ")
  end
# binding.pry

    # word_array_to_letter_array(full_text_to_unique_words)
    # haiku_generator

no_punc_unique_word_array = full_text_to_unique_words(meditations)
puts no_punc_unique_word_array
word_array_to_letter_array(no_punc_unique_word_array)
puts word_array_to_letter_array(no_punc_unique_word_array)
haiku_generator
