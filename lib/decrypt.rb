require './lib/enigma'

enigma = Enigma.new

# CLI format: ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818

read_file = ARGV[0]
write_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

# Created 'decrypted.txt' with the key 82648 and date 240818

# The first is an existing file that contains an encrypted message. The second is a file where your program should write the decrypted message. The third is the key to be used for decryption. The fourth is the date to be used for decryption. In addition to writing the decrypted message to the file, your program should output to the screen the file it wrote to, the key used for decryption, and the date used for decryption.

File.open(read_file, "r") do |file|
  file.each_line do |line|
    enigma_hash = enigma.decrypt(line, key, date)
    puts "Created '#{write_file}' with the key #{key} and date #{date}."
    File.open(write_file, 'w') { |w_file| w_file.write(enigma_hash[:decryption]) }
  end
end

# File.open('lib/message.txt', "r") do |file|
#   file.each_line do |line|
#     enigma_hash = enigma.encrypt(line)
#     puts "Created '#{input_2}' with the key #{enigma_hash[:key]} and date #{enigma_hash[:date]}."
#     File.open(input_2, 'w') { |write_file| write_file.write(enigma_hash[:encryption]) }
#   end
# end
