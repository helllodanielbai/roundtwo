class WordChainer
    attr_reader :dictionary

    def initialize(dictionary_file_name)
        @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
        @dictionary = Set.new(@dictionary)
    end

    def adjacent_words(word)
        adjacent_words = []

        word.each_char.with_index do |old_char, i|
            ("a".."z").each do |new_char|
                next if old_char == new_char
                
                new_word = word.dup
                new_word[i] = new_char

                adjacent_words << new_word if @dictionary.include?(new_word)
            end
        end
        adjacent_words
    end
end