class Stack
  def initialize
    @els = []
  end

  def add(el)
    @els.push(el)
  end

  def remove
    @els.pop
  end

  def show
    @els.dup
  end
end

class Queue
  def initialize
    @els = []
  end

  def enqueue(el)
    @els.push(el)
  end

  def dequeue
    @els.shift
  end

  def show
    @els.dup
  end
end

class Map
  def initialize
    @pairs = Array.new
  end


  def lookup(key)
    @pairs.find{|pair| pair[0] == key}[1]
  end

  def remove(key)
    @pairs.delete_if {|pair| pair[0] == key}
  end

  def assign(key, value)
    self.remove(key)
    @pairs << [key, value]
  end

  def show
    @pairs.dup
  end

end
