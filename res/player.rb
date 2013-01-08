class Player < GameObject

  attr_accessor :name, :live, :items, :points

  def initialize
    @name = ""
    @live = 5
    @items = [nil, nil, nil]
    @points = 0
  end

  def player_name(name)
    self.name = name
  end

  def stats
     "Name: "+self.name+"\t Items: "+self.items.to_s+"\t Lives: "+self.live.to_s
  end 



   

end  



