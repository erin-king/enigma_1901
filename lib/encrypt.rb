require './lib/enigma'

enigma = Enigma.new

# CLI format: ruby ./lib/encrypt.rb message.txt encrypted.txt

read_file = ARGV[0]
write_file = ARGV[1]

File.open("#{read_file}", "r") do |file|
  file.each_line do |line|
    enigma_hash = enigma.encrypt(line)
    puts "Created '#{write_file}' with the key #{enigma_hash[:key]} and date #{enigma_hash[:date]}."
    File.open(write_file, 'w') { |w_file| w_file.write(enigma_hash[:encryption]) }
  end
end
