def main
  a = gets.chomp 
  file = File.open("some_file_name.txt", "w")
  file.puts "I wrote this with ruby! #{a}"
  file.close
end

main