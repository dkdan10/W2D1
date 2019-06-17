# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3

class CoffeeError < StandardError
end

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
   
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError
    p "Coffee is cool, but I want fruit"
    retry
  rescue StandardError
    p "I wanted fruit :("
  end

end  

# PHASE 4
class NotBestfriendError < StandardError
end

class NameEmptyError < StandardError
end

class PTEmptyError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known >= 5
      @yrs_known = yrs_known
    else
      p "Only #{yrs_known} years? Not a REAL friend...."
      raise NotBestfriendError
    end 

    if !name.empty?
      @name = name
    else
      p "That isn't a real name!"
      raise NameEmptyError
    end 

    if !fav_pastime.empty?
      @fav_pastime = fav_pastime
    else
      p "Fake activity..."
      raise PTEmptyError
    end 

    

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


