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

  def finished?
    @finished
  end

  def snake_eat_food?(x, y)
    @food_x == x && @food_y == y
  end

  def record_hit
    @score += 1
    @food_x = rand(GRID_WIDTH)
    @food_y = rand(GRID_HEIGHT)
  end

  private

  def text_message
    finished? ? "Game over. Your score: #{@score}. Press 'R' to restart" : "Score: #{@score}"
  end
end
