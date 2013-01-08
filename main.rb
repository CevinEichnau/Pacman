require "./res/gameobject.rb"
require "./res/enemy.rb"
require "./res/gamefield.rb"
require "./res/item.rb"
require "./res/player.rb"
require 'io/console'
####### Gamefield withwalls and KI For Enemy !!! ########

def run
 
def read_char
  STDIN.echo = false
  STDIN.raw!


  input = STDIN.getc.chr
    if input == "\e" then
    input << STDIN.read_nonblock(3) rescue nil
    input << STDIN.read_nonblock(2) rescue nil
  end
ensure
  STDIN.echo = true
  STDIN.cooked!
 
return input
end


player = Player.new
f = Gamefield.new


player.gamefield = f

i=Item.new




puts "Enter a Player name"
name = gets.chomp


player.player_name(name)

puts "Hello #{player.name}, you have #{player.live.to_s} live.\n"
puts "Gamefieldsize? :\n"
fieldsize = gets.chomp
f.size= fieldsize.to_i

puts "Press Arrow up, down, left or right for start "

e=Enemy.new
l=GameObject.new
i.create_item(:coin)
i.create_item(:diamond)
i.create_item(:emerald)

f.set_at(l.position[0], l.position[1], player.name)
f.set_at(e.pos[0], e.pos[1], e.name)

f.set_at(i.pos[0], i.pos[1], i.name[0])

f.set_at(i.pos[2], i.pos[3], i.name[1])

f.set_at(i.pos[4], i.pos[5], i.name[2])




puts f.to_string(player.name, e.name, i)
e.think(f)
    def show_single_key(l, f, player, e, i)
  c = read_char
  


  case c
  when "\e[B"
    if l.position[1]  < f.size
    l.move(0, 1)
    end
    
    f.new_field(player, l, e, i)
 puts "Player X:#{l.position[0]}, Y:#{l.position[1]}  Live:#{player.live.to_s} Points:#{player.points}"
  puts "enemy X:#{e.pos[0]}, Y:#{e.pos[1]} \n"
  puts "Items: #{player.items[0]}, #{player.items[1]}, #{player.items[2]}"

  
 f.set_at(l.position[0], l.position[1], player.name)

 f.set_at(e.pos[0], e.pos[1], e.name)

 f.set_at(i.pos[0], i.pos[1], i.name[0])

 f.set_at(i.pos[2], i.pos[3], i.name[1])

 f.set_at(i.pos[4], i.pos[5], i.name[2])

     
      e.think(f)
    
    puts f.to_string(player.name, e.name, i)

  

  when "\e[C"
    if l.position[0]  < f.size
    l.move(1, 0)
    end
    f.new_field(player, l, e, i)
    puts "Player X:#{l.position[0]}, Y:#{l.position[1]}  Live:#{player.live.to_s} Points:#{player.points}"
     puts "enemy X:#{e.pos[0]}, Y:#{e.pos[1]} \n"
     puts "Items: #{player.items[0]}, #{player.items[1]}, #{player.items[2]}"
    f.set_at(l.position[0], l.position[1], player.name)

    f.set_at(e.pos[0], e.pos[1], e.name)

    f.set_at(i.pos[0], i.pos[1], i.name[0])

    f.set_at(i.pos[2], i.pos[3], i.name[1])

    f.set_at(i.pos[4], i.pos[5], i.name[2])
     
      e.think(f)
    
     puts f.to_string(player.name, e.name, i)
     

  when "\e[D"
    if l.position[0]  > 1
    l.move(-1, 0)
    end
   f.new_field(player, l, e, i)
   puts "Player X:#{l.position[0]}, Y:#{l.position[1]}  Live:#{player.live.to_s} Points:#{player.points}"
    puts "enemy X:#{e.pos[0]}, Y:#{e.pos[1]} \n"
     puts "Items: #{player.items[0]}, #{player.items[1]}, #{player.items[2]}"
   f.set_at(l.position[0], l.position[1], player.name)

   f.set_at(e.pos[0], e.pos[1], e.name)

   f.set_at(i.pos[0], i.pos[1], i.name[0])

   f.set_at(i.pos[2], i.pos[3], i.name[1])

   f.set_at(i.pos[4], i.pos[5], i.name[2])
    
      e.think(f)
    
    puts f.to_string(player.name, e.name, i)
    
  
  when "\e[A"
    if l.position[1]  > 1
    l.move(0, -1)
    end
   f.new_field(player, l, e, i)
   puts "Player X:#{l.position[0]}, Y:#{l.position[1]}  Live:#{player.live.to_s} Points:#{player.points}"
    puts "enemy X:#{e.pos[0]}, Y:#{e.pos[1]} \n"
     puts "Items: #{player.items[0]}, #{player.items[1]}, #{player.items[2]}"
   f.set_at(l.position[0], l.position[1], player.name)

   f.set_at(e.pos[0], e.pos[1], e.name)

   f.set_at(i.pos[0], i.pos[1], i.name[0])

   f.set_at(i.pos[2], i.pos[3], i.name[1])

   f.set_at(i.pos[4], i.pos[5], i.name[2])
      e.think(f)
    
    puts f.to_string(player.name, e.name, i)
    
 
    when "\e"
      
      system("clear")
      exit 0
  else
    puts "SOMETHING ELSE: #{c.inspect}"
  end
end

    show_single_key(l, f, player, e, i) while(f.win?(player))
    puts "GAME OVER\n"
    puts "play again? y/n"
    again = gets.chomp
    if again == "y"
      run
    elsif again == "n"
      puts "Thank you for play the game by =) "
    else
      puts "invalid input game stoped now"

    end    
end
run