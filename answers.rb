require 'yaml'
class Answers
  SKIP_WORD = "skip"
  DOUBLE_WORD = "double"

  def initialize()
    @list = YAML.load_file('answers.yml')
    @list["done"] = []

    @point = 0
    @modifier = 1
    @answer = nil
  end

  def get_list
    @list["pool"]
  end

  def has_life
    @point >= 0
  end

  def random
    @list["pool"].shuffle!
    @answer = @list["pool"].shift

    @list["done"].push(@answer)

    @answer
  end

  def string_shuffle
    @answer.split("").shuffle.join
  end

  def skip_word
    SKIP_WORD
  end

  def double_word
    DOUBLE_WORD
  end

  def loop_condition(input)
    ![@answer, SKIP_WORD].include? input
  end

  def check_input(input)
    score = @answer.length * @modifier
    case input
    when @answer
      @point = @point + score
      puts "BENAR point anda ditambah #{score} : #{@point}!"
      @modifier = 1
    when SKIP_WORD
      @point = @point - score
      puts "SKIP! point anda dikurangi #{score} : #{@point}"
      @modifier = 1
    when DOUBLE_WORD
      @modifier = 2
      puts "POINT di double"
    else
      puts "SALAH! Silakan coba lagi"
    end
  end
end