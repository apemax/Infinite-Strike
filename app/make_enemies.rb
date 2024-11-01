def make_enemy_fighters_left
  enemy_fighters = []
  enemy_fighters += 1.times.map { |n| {x: 300, y: 780, w: 32, h: 32, health: 20, path: 'sprites/enemyplane1.png', spawn: 'left'} }
  enemy_fighters += 1.times.map { |n| {x: 300, y: 840, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemy_fighters += 1.times.map { |n| {x: 300, y: 900, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemy_fighters += 1.times.map { |n| {x: 300, y: 960, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemy_fighters += 1.times.map { |n| {x: 300, y: 1020, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'left'} }
  enemy_fighters
end

def make_enemy_fighters_right
  enemy_fighters = []
  enemy_fighters += 1.times.map { |n| {x: 900, y: 780, w: 32, h: 32, health: 20, path: 'sprites/enemyplane1.png', spawn: 'right'} }
  enemy_fighters += 1.times.map { |n| {x: 900, y: 840, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemy_fighters += 1.times.map { |n| {x: 900, y: 900, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemy_fighters += 1.times.map { |n| {x: 900, y: 960, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemy_fighters += 1.times.map { |n| {x: 900, y: 1020, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', spawn: 'right'} }
  enemy_fighters
end

def make_enemy_fighters_center
  enemy_fighters = []
  enemy_fighters += 1.times.map { |n| {x: 600, y: 780, w: 32, h: 32, health: 20, path: 'sprites/enemyplane1.png', move: 'center', spawn: 'center'} }
  enemy_fighters += 1.times.map { |n| {x: 600, y: 840, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', move: 'left', spawn: 'center'} }
  enemy_fighters += 1.times.map { |n| {x: 600, y: 900, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', move: 'right', spawn: 'center'} }
  enemy_fighters += 1.times.map { |n| {x: 600, y: 960, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', move: 'left', spawn: 'center'} }
  enemy_fighters += 1.times.map { |n| {x: 600, y: 1020, w: 32, h: 32, health: 10, path: 'sprites/enemyplane2.png', move: 'right', spawn: 'center'} }
  enemy_fighters
end

def make_enemy_light_gunship_center
  enemy_light_gunship_center = []
  enemy_light_gunship_center += 1.times.map { |n| {x: 460, y: 780, w: 128, h: 24, health: 50, path: 'sprites/enemy_plane_medium_1.png'} }
  enemy_light_gunship_center += 1.times.map { |n| {x: 660, y: 780, w: 128, h: 24, health: 50, path: 'sprites/enemy_plane_medium_1.png'} }
  enemy_light_gunship_center
end