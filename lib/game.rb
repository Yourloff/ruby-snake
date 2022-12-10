class Game
  def initialize
    @score = 0
    @food_x = rand(GRID_WIDTH)
    @food_y = rand(GRID_HEIGHT)
    @finished = false
  end

  def draw
    unless finished?
      Square.new(x: @food_x * GRID_SIZE, y: @food_y * GRID_SIZE, size: GRID_SIZE, color: 'red')
    end

    Text.new(text_message, color: 'green', x: 10, y: 10, size: 20)
  end

  def finish
    @finished = true
  end

  def random_food_for_snake(snake_positions)
    # [[2, 23], [2, 0], [2, 1], [2, 2]]
    food = random_food

    snake_positions.each do |pos|
      if pos.eql?(food)
        food = random_food
      end
    end

    return food
  end

  def finished?
    @finished
  end

  def snake_eat_food?(x, y)
    @food_x == x && @food_y == y
  end

  def record_hit(positions_snake)
    @score += 1

    pos_food = random_food_for_snake(positions_snake)

    @food_x = pos_food[0]
    @food_y = pos_food[1]
  end

  private

  def text_message
    finished? ? "Game over. Your score: #{@score}. Press 'R' to restart" : "Score: #{@score}"
  end

  def random_food
    food_x_y = []

    food_x_y << rand(GRID_WIDTH)
    food_x_y << rand(GRID_HEIGHT)
    return food_x_y
  end
end
