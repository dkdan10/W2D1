require_relative 'super_useful'
input = "five"
begin
  puts "'five' == #{convert_to_int(input)}"
rescue ArgumentError
  puts "Please enter a valid integer"
  input = gets.chomp
  retry
end


feed_me_a_fruit

sam = BestFriend.new('Daniel', 5, 'Skiing')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
