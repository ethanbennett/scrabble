class Scrabble

  def score(word)
    scores = fixed_word(word).map {|letter| score_each_letter(letter)}
    compile_scores(scores)
  end

  def fixed_word(word)
    word.delete(".,?/[{}]!@#%^&*()0987654321").chars
  end

  def score_each_letter(letter)
    point_values.find {|key, value| key == letter.capitalize}
  end

  def compile_scores(scores)
    scores.transpose[1].inject(0){|sum, score| sum + score}
  end  

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
