def sluggish(fishes)
  fishes.each do |fish|
    return fish if fishes.none? {|other_fish| other_fish.length > fish.length}
  end
end

def merge_sort(fishes)
  prc = Proc.new{ |x,y| x.length <=> y.length}
  return fishes if fishes.length <= 1
  middle = fishes.length/2
  left_half = fishes[0...middle]
  right_half = fishes[middle..-1]

  merge(merge_sort(left_half), merge_sort(right_half), &prc)

end

def merge(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    if prc.call(left.first, right.first) == -1
      result << left.shift
    else
      result << right.shift
    end
  end
  result + left + right
end


def dominant(fishes)
  merge_sort(fishes).last
end

def clever(fishes)
  result = fishes.first
  fishes.each do |fish|
    result = fish if fish.length > result.length
  end
  result
end

def slow_dance(tile, tiles_array)
  tiles_array.each_index do |idx|
    return idx if tiles_array[idx] == tile
  end
  nil
end

TILES_HASH = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(tile)
  TILES_HASH[tile]
end
