require_relative "answers.rb"
@answers = Answers.new

def start_game
  while @answers.get_list.length > 0 && @answers.has_life && !@answers.exit
    @answers.random
    puts "game akan berhenti bila list pertanyaan habis atau point dibawah 0"
    puts "penambahan atau pengurangan point berdasarkan jumlah karakter"
    puts "karakter akan disembunyikan sejumlah point dibagi 10"
    puts "ketik '#{@answers.skip_word}' untuk lanjut tapi point berkurang"
    puts "ketik '#{@answers.double_word}' untuk point 2 kali lipat"
    puts "ketik '#{@answers.exit_word}' untuk keluar dari permainan"
    puts "Tebak kata: #{@answers.string_shuffle}"
    input = ""
    while @answers.loop_condition input do
      print "Jawab: "
      input = gets.chomp
      @answers.check_input input
    end
  end
end

start_game
