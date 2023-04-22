require 'app/collision_detection.rb'
require 'app/update_enemy.rb'
require 'app/make_enemies.rb'
require 'app/update_animations.rb'

def tick args
  args.state.current_scene ||= :title_scene

  current_scene = args.state.current_scene

  case current_scene
  when :title_scene
    tick_title_scene args
  when :game_scene
    tick_game_scene args
  when :game_over_scene
    tick_game_over_scene args
  end

  if args.state.current_scene != current_scene
    raise "Scene was changed incorrectly. Set args.state.next_scene to change scenes."
  end

  if args.state.next_scene
    args.state.current_scene = args.state.next_scene
    args.state.next_scene = nil
  end
end

def tick_title_scene args
  args.outputs.background_color = [0, 0, 0]
  args.outputs.labels << [470, 500, "Infinite Strike", 15, 255, 255, 255, 255]
  args.outputs.labels << [380, 400, "Press the Enter key to start.", 10, 255, 255, 255, 255]
  args.outputs.labels << [570, 300, "Controls:", 10, 255, 255, 255, 255]
  args.outputs.labels << [480, 250, "w,a,s,d = Movement.", 10, 255, 255, 255, 255]
  args.outputs.labels << [540, 200, "Space = Fire.", 10, 255, 255, 255, 255]

  if args.inputs.keyboard.enter
    args.state.next_scene = :game_scene
  end
end

def tick_game_scene args
  args.state.explosions     ||= []
  args.state.explosions_small         ||=[]
  args.state.player_exhaust  ||=[]
  args.state.enemies_small_left        ||= []
  args.state.enemies_small_right        ||= []
  args.state.enemies_medium_center        ||= []
  args.state.score          ||= 0
  args.state.player         ||= {x: 620, y: 80, w: 63, h: 51, path: 'sprites/playerplane1.png', angle: 0, cooldown: 0, alive: true}
  args.state.player_collision_wing ||= {x: 620, y: 111, w: 63, h: 13, path: 'sprites/playerplanecollisionwing.png', angle: 0}
  args.state.player_collision_tail ||= {x: 637, y: 82, w: 30, h: 6, path: 'sprites/playerplanecollisiontail.png', angle: 0}
  args.state.enemy_bullets  ||= []
  args.state.player_bullets_1 ||= []
  args.state.player_bullets_2 ||= []
  args.state.time_seconds   ||= 0
  args.state.time_minutes   ||= 0
  args.state.time_frame     ||= 0

  args.state.time_frame += 1

  if args.state.time_frame == 60
    args.state.time_frame = 0
    args.state.time_seconds += 1

    if args.state.time_seconds == 60
      args.state.time_seconds = 0
      args.state.time_minutes += 1
    end
  end

  if args.state.enemies_small_left.empty?
    args.state.enemies_small_left = make_enemies_small_left
  end
  if args.state.enemies_small_right.empty?
    args.state.enemies_small_right   = make_enemies_small_right
  end
  if args.state.time_seconds >= 5
    if args.state.enemies_medium_center.empty?
      args.state.enemies_medium_center   = make_enemies_medium_center
    end
  end

  update_explosions args
  update_enemy_positions args

  # Handle user input.
  if args.inputs.left && args.state.player[:x] > (250 + 5)
    args.state.player[:x] -= 5
    args.state.player_collision_wing[:x] -= 5
    args.state.player_collision_tail[:x] -= 5
  end
  if args.inputs.right && args.state.player[:x] < (1280 - args.state.player[:w] - 250 - 5)
    args.state.player[:x] += 5
    args.state.player_collision_wing[:x] += 5
    args.state.player_collision_tail[:x] += 5
  end
  if args.inputs.up && args.state.player[:y] < (720 - args.state.player[:h] - 0 - 5)
    args.state.player[:y] += 5
    args.state.player_collision_wing[:y] += 5
    args.state.player_collision_tail[:y] += 5
  end
  if args.inputs.down && args.state.player[:y] > (0 + 5)
    args.state.player[:y] -= 5
    args.state.player_collision_wing[:y] -= 5
    args.state.player_collision_tail[:y] -= 5
  end

  collision_detection args

  args.state.player[:cooldown] -= 1
  if args.inputs.keyboard.key_held.space && args.state.player[:cooldown] <= 0 && args.state.player[:alive]
    args.state.player_bullets_1 << {x: args.state.player[:x] + 16, y: args.state.player[:y] + 38, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: 8}.sprite!
    args.state.player_bullets_2 << {x: args.state.player[:x] + 32, y: args.state.player[:y] + 38, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: 8}.sprite!
    args.state.player[:cooldown] = 10 + 1
  end
  args.state.enemies_small_left.each do |enemy|
    if Math.rand < 0.004 + 0.004 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 12, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
  args.state.enemies_small_right.each do |enemy|
    if Math.rand < 0.004 + 0.004 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 12, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
  args.state.enemies_medium_center.each do |enemy|
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 21, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 48, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 63, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 90, y: enemy[:y] - 8, w: 6, h: 13, path: 'sprites/bullet1.png', dx: 0, dy: -3}.sprite!
    end
  end

  args.outputs.background_color = [0, 0, 0]
  args.outputs.primitives << args.state.enemies_small_left.map do |enemy|
    [enemy[:x], enemy[:y], 32, 32, enemy[:path], -180].sprite
  end
  args.outputs.primitives << args.state.enemies_small_right.map do |enemy|
    [enemy[:x], enemy[:y], 32, 32, enemy[:path], -180].sprite
  end
  args.outputs.primitives << args.state.enemies_medium_center.map do |enemy|
    [enemy[:x], enemy[:y], 128, 24, enemy[:path], -0].sprite
  end
  args.outputs.primitives << args.state.player if args.state.player[:alive]
  args.outputs.primitives << args.state.player_collision_wing if args.state.player[:alive]
  args.outputs.primitives << args.state.player_collision_tail if args.state.player[:alive]
  args.outputs.primitives << args.state.explosions
  args.outputs.primitives << args.state.explosions_small
  args.outputs.primitives << args.state.player_bullets_1
  args.outputs.primitives << args.state.player_bullets_2
  args.outputs.primitives << args.state.enemy_bullets
  args.outputs.primitives << [
    [0, 0, 250, 720, 0, 0, 100].solid,
    [1280 - 250, 0, 250, 720, 0, 0, 100].solid,
    [1280 - 230, 50, "Score    #{(args.state.score).floor}", 3, 255, 255, 255, 255].label,
    [20, 700, "Time #{(args.state.time_minutes)}:#{(args.state.time_seconds)}", 5, 255, 255, 255, 255].label,
  ]

  args.outputs.sprites << update_exhaust_left(args) if args.state.player[:alive]
  args.outputs.sprites << update_exhaust_right(args) if args.state.player[:alive]
  #args.outputs.debug << args.gtk.framerate_diagnostics_primitives

  #Respawn player if player dies.
  if (!args.state.player[:alive]) && args.state.enemy_bullets.empty? && args.state.explosions.empty? && args.state.enemies_small_left.all? && args.state.enemies_small_right.all?
    #args.state.player[:alive] = true
    args.state.player[:x]     = 620
    args.state.player[:y]     = 80
    args.state.player_collision_wing[:x]     = 620
    args.state.player_collision_wing[:y]     = 111
    args.state.player_collision_tail[:x]     = 637
    args.state.player_collision_tail[:y]     = 82
    #args.state.clear!
    args.state.next_scene = :game_over_scene
  end
end

def tick_game_over_scene args
  args.state.player[:alive] = false
  args.outputs.background_color = [0, 0, 0]
  args.outputs.labels << [520, 500, "Strike over!", 10, 255, 255, 255, 255]
  args.outputs.labels << [460, 450, "Final time: #{(args.state.time_minutes)}:#{(args.state.time_seconds)}", 10, 255, 255, 255, 255]
  args.outputs.labels << [460, 400, "Final score: #{(args.state.score)}", 10, 255, 255, 255, 255]
  args.outputs.labels << [320, 350, "Press the Enter key to try again.", 10, 255, 255, 255, 255]
  if args.inputs.keyboard.enter
    args.state.next_scene = :game_scene
    args.state.player[:alive] = true
    args.state.explosions.clear
    args.state.enemies_small_left.clear
    args.state.enemies_small_right.clear
    args.state.enemies_medium_center.clear
    args.state.enemy_bullets.clear
    args.state.score = 0
    args.state.time_seconds = 0
    args.state.time_minutes = 0
    args.state.player_bullets_1.clear
    args.state.player_bullets_2.clear
  end
end