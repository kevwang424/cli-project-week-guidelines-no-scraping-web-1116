class DeathCLI

 def call
   puts "Welcome. To see the yearly toll of certain causes of death, please enter a search word."
   run
 end

 def get_user_input
   gets.strip.downcase
 end

 def run
   print "New search keyword: "
   input = get_user_input
   if input == "exit"
     exit
   elsif input == "help"
     help
   else
    parsed = parse_input(input)
    search(parsed)
    run
   end
 end

 def help
   puts "Type 'exit' to exit."
   puts "Type 'help' to view this menu again."
   puts "Type anything else to search for a death toll."
   run
 end

 def parse_input(input)
   words_to_ignore = %w(chronic disease diseases and in the or due to of syndrome)

   arr_of_words = input.split

   words_to_ignore.each do |ignore_word|
     arr_of_words.delete_if {|arr_word| arr_word == ignore_word}
   end

   arr_of_words
 end

 def search(input)
   answer_hash = Hash.new(0)
   match = []
   input.each do |search_word|
     Death.all.each do |death_instance|
       if death_instance.leading_cause.downcase.split(/[ !?@()-:,]/).include?(search_word)
         match << search_word unless match.include?(search_word)
         answer_hash[death_instance.year] += death_instance.num_of_deaths.to_i
       end
     end
   end
   render_results(answer_hash,match)
 end

 def render_results(answer_hash, match)
   if answer_hash.empty?
     puts "No results found. Please try another search word, for example: 'cancer', 'homicide', or 'kidney'."
   else
     answer_hash.each {|year, deaths| puts "In #{year} there were #{deaths} #{match.join(' and ')}-related deaths."}
   end
 end



end
