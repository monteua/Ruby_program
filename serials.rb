require 'yaml'
serials = YAML.load(File.read('data.yml'))


puts """
Hi! 
If you want to add new serial, please enter: 'add'.
If you want to update information about existed serial, please enter: 'update'.
If you want to display information about serial, please enter: 'display'.
If you want to remove serial from our catalog, please enter: 'delete'. 
What do you want to do?
"""
print "> "
choice = gets.chomp

case choice

when "add"
  puts "Please write a name of your serial: "
  print "> "
  title = gets.chomp.upcase
  if serials[title.to_sym].nil?
	puts "Please enter rating to your serial: "
	print "> "
	rating = gets.chomp.upcase
	serials[title.to_sym] = rating.to_f
	File.open("data.yml", 'w') { |f| YAML.dump(serials, f) }
	puts "#{title} was successfully added to our catalog!"
	
  else
    puts "#{title} is already exist in our catalog!"
	
  end


when "update"
  puts "Please enter name of serial, which you want to update: "
  print "> "
  title = gets.chomp.upcase
  
  if serials[title.to_sym].nil?
    puts "Your serial is not in out catalog! Please add it using command 'add'!"
    
  else
    puts "Please enter a rate of your serial: "
    print "> "	
	rating = gets.chomp.upcase
	serials[title.to_sym] = rating.to_f
	File.open("data.yml", 'w') { |f| YAML.dump(serials, f) }
	puts "You successfully updated your serial in our catalog!"
	
  end

when "display"
  serials.each do |serial, rating|  
    puts "#{serial}: #{rating}"
  end

when "delete"  
  puts "Please write the name of your serial, which you want to remove from our catalog: "
  print "> "
  title = gets.chomp.upcase
  if serials[title.to_sym].nil?  
    puts "Error! We cannot find #{title} in our catalog. Please try again!"
	
  else
   	serials.delete(title.to_sym)
	File.open("data.yml", 'w') { |f| YAML.dump(serials, f) }
    puts "#{title} was successfully removed from our catalog!"
    
  end
else
  puts "ErroR! I don't know this command. Please, try again!"
end

sleep 60