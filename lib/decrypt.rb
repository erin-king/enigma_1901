require './lib/enigma'

enigma = Enigma.new

# CLI format: ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818

read_file = ARGV[0]
write_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

File.open(read_file, "r") do |file|
  file.each_line do |line|
    enigma_hash = enigma.decrypt(line, key, date)
    puts "Created '#{write_file}' with the key #{key} and date #{date}."
    File.open(write_file, 'w') { |w_file| w_file.write(enigma_hash[:decryption]) }
  end
end
