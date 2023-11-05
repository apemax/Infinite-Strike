require 'app/collision_detection.rb'
require 'app/update_enemy.rb'
require 'app/make_enemies.rb'
require 'app/update_animations.rb'
require 'app/player_input.rb'
require 'app/render.rb'
require 'app/defaults.rb'

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
  defaults args

  args.state.time_frame += 1

  if args.state.time_frame == 60
    args.state.time_frame = 0
    args.state.time_seconds += 1

    if args.state.time_seconds == 60
      args.state.time_seconds = 0
      args.state.time_minutes += 1
    end
  end

  if args.inputs.keyboard.key_down.p and args.state.debug_enabled == false
    args.state.debug_enabled = true
  elsif args.inputs.keyboard.key_down.p and args.state.debug_enabled == true
    args.state.debug_enabled = false
  end

  if args.state.debug_enabled
    debug args
  end

  if args.state.current_wave == 1 and args.state.next_wave_condition == 6
    args.state.current_wave += 1
    args.state.next_wave_condition = 0
  end

  if args.state.current_wave == 2 and args.state.next_wave_condition == 4
    args.state.current_wave += 1
    args.state.next_wave_condition = 0
  end

  if args.state.current_wave == 1
    if args.state.enemies_small_left.empty?
      args.state.enemies_small_left = make_enemies_small_left
      args.state.next_wave_condition += 1
    end
    if args.state.enemies_small_right.empty?
      args.state.enemies_small_right = make_enemies_small_right
      args.state.next_wave_condition += 1
    end

    update_enemy_pattern_small_left args
    update_enemy_pattern_small_right args
  end

  if args.state.current_wave == 2
    if args.state.enemies_small_left.empty?
      args.state.enemies_small_left = make_enemies_small_left
    end
    if args.state.enemies_small_right.empty?
      args.state.enemies_small_right = make_enemies_small_right
    end
    if args.state.enemies_medium_center.empty?
      args.state.enemies_medium_center = make_enemies_medium_center
      args.state.next_wave_condition += 1
    end

    update_enemy_pattern_small_left args
    update_enemy_pattern_small_right args
    update_enemy_pattern_medium_center args
  end

  if args.state.current_wave == 3
    if args.state.enemies_small_left.empty?
      args.state.enemies_small_left = make_enemies_small_left
    end
    if args.state.enemies_small_right.empty?
      args.state.enemies_small_right = make_enemies_small_right
    end
    if args.state.enemies_small_center.empty?
      args.state.enemies_small_center = make_enemies_small_center
    end

    update_enemy_pattern_small_left args
    update_enemy_pattern_small_right args
    update_enemy_pattern_small_center args
  end

  if args.state.clouds.empty?
    args.state.clouds = make_clouds
  end

  args.state.clouds.each do |cloud|
    cloud[:y] -= 0.5
    args.state.clouds = args.state.clouds.reject do |cloud|
      if cloud[:y] < -64
        true
      else
        false
      end
    end
  end

  player_input args

  update_explosions args

  collision_detection args

  update_enemy_fire args

  render args

  #Respawn player if player dies.
  if (!args.state.player[:alive]) && args.state.enemy_bullets.empty? && args.state.explosions.empty? && args.state.enemies_small_left.all? && args.state.enemies_small_right.all?
    args.state.player[:x]     = 620
    args.state.player[:y]     = 80
    args.state.player_collision_wing[:x]     = 620
    args.state.player_collision_wing[:y]     = 111
    args.state.player_collision_tail[:x]     = 637
    args.state.player_collision_tail[:y]     = 82
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
    args.state.enemies_small_center.clear
    args.state.enemies_medium_center.clear
    args.state.enemy_bullets.clear
    args.state.score = 0
    args.state.time_seconds = 0
    args.state.time_minutes = 0
    args.state.player_bullets_1.clear
    args.state.player_bullets_2.clear
    args.state.current_wave = 1
    args.state.next_wave_condition = 0
  end
end

def debug args
  args.outputs.debug << args.gtk.framerate_diagnostics_primitives
  args.outputs.labels << [10, 50, "Next Wave Condition: #{(args.state.next_wave_condition)}", 3, 255, 255, 255, 255].label
end