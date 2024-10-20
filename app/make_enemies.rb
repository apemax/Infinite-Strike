def make_enemies_small_left
  enemies_small = []
  enemies_small += 1.times.map { |n| {x: 300, y: 780, w: 32, h: 32, health: 30, path: 'sprites/enemyplane1.png', spawn: 'left'} }
  enemies_small += 1.times.map { |n| {x: 300, y: 840, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemies_small += 1.times.map { |n| {x: 300, y: 900, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemies_small += 1.times.map { |n| {x: 300, y: 960, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemies_small += 1.times.map { |n| {x: 300, y: 1020, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemies_small
end

def make_enemies_small_right
  enemies_small = []
  enemies_small += 1.times.map { |n| {x: 900, y: 780, w: 32, h: 32, health: 30, path: 'sprites/enemyplane1.png', spawn: 'right'} }
  enemies_small += 1.times.map { |n| {x: 900, y: 840, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemies_small += 1.times.map { |n| {x: 900, y: 900, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemies_small += 1.times.map { |n| {x: 900, y: 960, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemies_small += 1.times.map { |n| {x: 900, y: 1020, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemies_small
end

def make_enemies_small_center
  enemies_small = []
  enemies_small += 1.times.map { |n| {x: 600, y: 780, w: 32, h: 32, health: 30, path: 'sprites/enemyplane1.png', move: 'center', spawn: 'center'} }
  enemies_small += 1.times.map { |n| {x: 600, y: 840, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', move: 'left', spawn: 'center'} }
  enemies_small += 1.times.map { |n| {x: 600, y: 900, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', move: 'right', spawn: 'center'} }
  enemies_small += 1.times.map { |n| {x: 600, y: 960, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', move: 'left', spawn: 'center'} }
  enemies_small += 1.times.map { |n| {x: 600, y: 1020, w: 32, h: 32, health: 20, path: 'sprites/enemyplane2.png', move: 'right', spawn: 'center'} }
  enemies_small
end

def make_enemies_medium_center
  enemies_medium_center = []
  enemies_medium_center += 1.times.map { |n| {x: 460, y: 780, w: 128, h: 24, health: 100, path: 'sprites/enemy_plane_medium_1.png'} }
  enemies_medium_center += 1.times.map { |n| {x: 660, y: 780, w: 128, h: 24, health: 100, path: 'sprites/enemy_plane_medium_1.png'} }
  enemies_medium_center
end