class Snake
  attr_writer :direction
  attr_reader :positions

  def initialize
    @positions = [[2, 0], [2, 1], [2, 2], [2, 3]]
    @direction = 'down'
    @growing = false
  end

  def x
    head[0]
  end

  def y
    head[1]
  end

  def draw
    @positions.each do |position|
      Square.new(x: position[0] * GRID_SIZE, y: position[1] * GRID_SIZE, size: GRID_SIZE - 1, color: 'white')
    end
  end

  def move
    unless @growing
      @positions.shift
    end

    case @direction
    when 'down'
      @positions.push(new_coordinates(head[0], head[1] + 1))
    when 'up'
      @positions.push(new_coordinates(head[0], head[1] - 1))
    when 'left'
      @positions.push(new_coordinates(head[0] - 1, head[1]))
    when 'right'
      @positions.push(new_coordinates(head[0] + 1, head[1]))
    else
      # type code here
    end
    @growing = false
  end

  def grow
    @growing = true
  end

  def can_change_direction_to?(new_direction)
    case @direction
    when 'up' then new_direction != 'down'
    when 'down' then new_direction != 'up'
    when 'left' then new_direction != 'right'
    when 'right' then new_direction != 'left'
    else

    end
  end

  def hit_itself?
    @positions.uniq.length != @positions.length
  end

  private

  def head
    @positions.last
  end

  def new_coordinates(x, y)
    [x % GRID_WIDTH, y % GRID_HEIGHT]
  end
end
