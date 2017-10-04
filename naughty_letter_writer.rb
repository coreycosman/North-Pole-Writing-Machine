require 'erb'

kids_data = File.read('data/kids-data.txt') naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids.data.each_line do |kid|
  kid_data_array = kid.split

  name = kid_data_array[0]
  gender = kid_data_array[1]
  behaviour = kid_data_array[2]
  toy = kid_data_array[3]
  no_toys = kid_data_array[4..8]
  address = kid_data_array[9..12]
  last_toy = kid_data_array[13]
  infraction = kid_data_array[16..kid_data_array.length]

  next unless behaviour == 'naughty'

  filename = 'letters/naughty' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."

File.write(filename, letter_text)

end

puts 'Done!'
