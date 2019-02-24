require './lib/enigma'

enigma = Enigma.new

# CLI format: ruby ./lib/encrypt.rb message.txt encrypted.txt

input_1 = ARGV[0]
input_2 = ARGV[1]

File.open("#{input_1}", "r") do |file|
  file.each_line do |line|
    enigma_hash = enigma.encrypt(line)
    puts "Created '#{input_2}' with the key #{enigma_hash[:key]} and date #{enigma_hash[:date]}."
    File.open(input_2, 'w') { |write_file| write_file.write(enigma_hash[:encryption]) }
  end
end
