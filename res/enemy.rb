class Enemy < GameObject

  attr_accessor :speed, :pos, :name 


  def initialize
    @speed = 0
    @pos = [1, 3]
    @name = "Enemy"
  end


  

  def move_enemy(x, y)
    self.pos[0] += x 
    self.pos[1] += y
  end    

  def think_1
  	a = [1, 0, -1]
  	x = a.sample
    y = a.sample 
  	
    if self.pos[0] > 1
      self.move_enemy(x, y)
    end
  end   


    def think(f)
     a = ["u", "d", "r", "l"]
     x=a.sample
      if x == "u"
        self.move_u
      elsif x == "d"
        self.move_d(f)
      elsif x == "r"
        self.move_r(f)
      elsif x == "l"
        self.move_l
      end      
    end 

    def move_u
      if self.pos[1] > 1
        self.move_enemy(0, -1)
      end
    end
    
    def move_d(f)
      if self.pos[1] < f.size 
        self.move_enemy(0, 1)
      end
    end

    def move_r(f)
      if self.pos[0] < f.size
        self.move_enemy(1, 0)
      end
    end

    def move_l
      if self.pos[0] > 1 
        self.move_enemy(-1, 0)
      end
    end  
  

  

  


end  