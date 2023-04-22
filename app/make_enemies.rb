def make_enemies_small_left
    enemies_small_left = []
    enemies_small_left += 1.times.map { |n| {x: 300, y: 780, w: 32, h: 32, health: 30, path: 'sprites/enemyplane1.png'} }
    enemies_small_left += 1.times.map { |n| {x: 300, y: 840, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_left += 1.times.map { |n| {x: 300, y: 900, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_left += 1.times.map { |n| {x: 300, y: 960, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_left += 1.times.map { |n| {x: 300, y: 1020, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_left
  end
  
  def make_enemies_small_right
    enemies_small_right = []
    enemies_small_right += 1.times.map { |n| {x: 900, y: 780, w: 32, h: 32, health: 30, path: 'sprites/enemyplane1.png'} }
    enemies_small_right += 1.times.map { |n| {x: 900, y: 840, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_right += 1.times.map { |n| {x: 900, y: 900, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_right += 1.times.map { |n| {x: 900, y: 960, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_right += 1.times.map { |n| {x: 900, y: 1020, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png'} }
    enemies_small_right
  end
  
  def make_enemies_medium_center
    enemies_medium_center = []
    enemies_medium_center += 1.times.map { |n| {x: 460, y: 780, w: 128, h: 24, health: 100, path: 'sprites/enemy_plane_medium_1.png'} }
    enemies_medium_center += 1.times.map { |n| {x: 660, y: 780, w: 128, h: 24, health: 100, path: 'sprites/enemy_plane_medium_1.png'} }
    enemies_medium_center
  end