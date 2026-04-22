def caesar_cipher(string, shift_factor)
  ciphered_string = string.split('').map do |c|
    ciphered = c
    if c >= 'A' && c <= 'Z'
      ciphered = (((c.ord - 'A'.ord + shift_factor) % 26) + 'A'.ord).chr
    elsif c >= 'a' && c <= 'z'
      ciphered = (((c.ord - 'a'.ord + shift_factor) % 26) + 'a'.ord).chr
    end
    ciphered
  end
  ciphered_string.join('')
end

puts "Input a string: "
string = gets
puts "Input the shift factor: "
shift_factor = gets.to_i
puts caesar_cipher(string, shift_factor)
