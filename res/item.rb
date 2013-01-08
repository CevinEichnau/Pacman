class Item < GameObject

  attr_accessor :name, :points, :pos

  def initialize
    @name = [nil, nil, nil, "c"]
    @points = [0, 0, 0]
    @pos = [5, 6] + [7, 8] + [9, 10]
  end

  def create_item(type)
    result = Item.new

    case type
    when :diamond
      result.name = "Diamond"
      result.points = 50
      self.name[0] = result.name
      self.points[0] = result.points
    when :emerald
      result.name = "Emerald"
      result.points = 20
      self.name[1] = result.name
      self.points[1] = result.points
    when :coin
      result.name = "Coin"
      result.points = 5  
      self.name[2] = result.name
      self.points[2] = result.points
    else
      raise "unknown item type"
    end

    return result
  end

end  