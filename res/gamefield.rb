class Gamefield

  attr_accessor :size, :field

  def initialize
    @size = 0
    @field = []

  end

  def get_pos(obj, pos)

  end

  def size=(value)
    @size = value

    a_size = value * value
    self.field.clear
    while self.field.length < a_size.to_i
      self.field << nil 
    end
  end  

  def draw_field
    a_size = self.size * self.size
    
    while self.field.length < a_size.to_i
      self.field << nil 
    end
    
    self.field
  end  


  def to_string(p, e, i)
    string = "#"*self.size*2 + "##"
    string << "\n"
    
    y = 0
    while y < self.size do 
      y += 1
      x = 0
      string << "#"
      while x < self.size do 
        x += 1
        f = get_at(x, y)
            
            if  f == nil
              string << "  " # double space Important
              
           elsif f == p 
              string << "X "# double character las must be a space Important
            elsif f == e
              string << "V " # double character las must be a space Important
            elsif f == i.name[0]
              string << "D " # double character las must be a space Important   
            elsif f == i.name[1]
              string << "E " # double character las must be a space Important 
            elsif f == i.name[2]
              string << "C " # double character las must be a space Important
            elsif f == i.name[3]
              string << "  "       
            end  
        end
string << "#\n"

    end  
    string << "#"*self.size*2 + "##"
   string
  end  


  def get_at(x, y)
    pos = x + self.size * y

    self.field[pos]

  end

  def set_at(x, y, game_object)
    pos = x + self.size * y

   #  self.field.clear ###!!! emeny overwrite player !!!###

    self.field[pos] = game_object
    self.field[pos]

  end



  def new_field(player, l, e, i)
      
    if l.position == e.pos
      player.live -= 1
    end

    if l.position == i.pos[0..1]

      player.items[0] = i.name[0]
      i.pos[0] = 0
      i.pos[1] = 0 
      set_at(i.pos[0], i.pos[1], i.name[3])
      player.points += i.points[0]
    elsif l.position == i.pos[2..3] 
      
      player.items[1] = i.name[1]
      i.pos[2] = 0
      i.pos[3] = 0 
      set_at(i.pos[2], i.pos[3], i.name[3])
      player.points += i.points[1]
    elsif l.position == i.pos[4..5]
     # puts "1= #{l.position}::#{i.pos[0,1]} 2= #{i.pos[2,3]} 3= #{i.pos[4,5]} ALL = #{i.pos} :::: #{i.pos[0]}, #{i.pos[1]}"
      player.items[2] = i.name[2]
      i.pos[4] = 0
      i.pos[5] = 0 
      set_at(i.pos[4], i.pos[5], i.name[3])
      player.points += i.points[2]
    end  
    

    self.field.clear
    system('clear')
  end  


  def win?(player)
    if player.live == 0
      return false
    end
    return true  
  end  

    




end  



##########################################
#                  #                     #
#  #####  #######  #  ######  #########  #
#  #####  #######  #  ######  #########  #
#  #####                      #########  #
#          #  #########  ###             #
#  #####   #   #######   # ######  ####  #
#  #####  ####         ### ######  ####  #
#          #    #  #    ##               #
#######  ###  ###  ###  ##  ########  ####
######        #      #                   #
######  ####  ########  ######  ####  ####
######  ####              ####  ####  ####
######  ####  ##########  ####  ####  ####
#                 ##                     #
#  ######  #####  ##  ######  #########  #
#     ###                     ###        #
####  ###  ##  #########  ##  ###        #
#     ###  ##  #########  ##  ###        #
#          ##     ##      ##             #
#  #############  ##  #################  #
#                                        #
##########################################