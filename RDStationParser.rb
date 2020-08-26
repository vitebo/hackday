require 'json'
require 'date'
require 'csv'

result = {}
CSV.foreach('RDStation.csv') do |row|
  (date, name, profession) = row
  name = name.gsub(/([A-zÀ-ú]+)/) {|s| s.capitalize }.split(' ')
  id = name.join('').downcase
  result[id] = {
    firstName: name[0],
    lastName: name[1..-1].join(' '),
    email: nil,
    profession: profession.gsub(/([A-zÀ-ú]+)/) {|s| s.capitalize },
    createdAt: DateTime.parse(date).to_time.to_i * 1000
  }
end

File.open('RDStation.json', 'w') { |file| file.write(JSON.pretty_generate(result)) }
puts "#{result.count} resultados escritos em RDStation.json"
