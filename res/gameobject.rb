class GameObject

  attr_accessor :position, :gamefield  

  def initialize
    @position = [1, 1] 

  end

  def place(x, y)
    self.position[0] = x
    self.position[1] = y
  end


  def move(x, y)
    
   self.position[0] += x
   self.position[1] += y
  end  


end  