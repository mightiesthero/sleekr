require 'yaml'
class Answers
  SKIP_WORD = "skip"
  DOUBLE_WORD = "double"
  EXIT_WORD = "exit"

  def initialize()
    @list = YAML.load_file('answers.yml')
    @list["done"] = []

    @point = 0
    @modifier = 1
    @answer = nil
    @exit = false
  end

  def get_list
    @list["pool"]
  end

  def has_life
    @point >= 0
  end

  def exit
    @exit
  end

  def random
    @list["pool"].shuffle!
    @answer = @list["pool"].shift

    @list["done"].push(@answer)

    @answer
  end

  def string_shuffle
    answer = @answer.split("").shuffle.join
    hide = @point / 10
    hide.times do |index|
      answer[index] = "*"
    end
    answer
  end

  def skip_word
    SKIP_WORD
  end

  def double_word
    DOUBLE_WORD
  end

  def exit_word
    EXIT_WORD
  end

  def loop_condition(input)
    ![@answer, SKIP_WORD, EXIT_WORD].include? input
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
    when EXIT_WORD
      @exit = true
      puts "KELUAR dari permainan point anda : #{@point}"
    else
      puts "SALAH! Silakan coba lagi"
    end
  end
end