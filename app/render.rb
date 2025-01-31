def render args
  args.outputs.background_color = [0, 75, 150]
  args.outputs.primitives << args.state.clouds.map do |cloud|
    [cloud[:x], cloud[:y], cloud[:w], cloud[:h], cloud[:path], 0].sprite
  end
  args.outputs.primitives << args.state.enemy_fighters.map do |enemy|
    [enemy[:x], enemy[:y], 32, 32, enemy[:path], -180].sprite
  end
  args.outputs.primitives << args.state.enemy_light_gunship.map do |enemy|
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
    [1280 - 230, 50, "Score:    #{(args.state.score).floor}", 3, 255, 255, 255, 255].label,
    [20, 700, "Time #{args.state.time_minutes}:#{"%02d" % args.state.time_seconds}", 5, 255, 255, 255, 255].label,
    [1280 - 230, 80, "Wave:     #{(args.state.current_wave).floor}", 3, 255, 255, 255, 255].label,
    [1280 - 230, 150, "Lives: ", 3, 255, 255, 255, 255].label,
  ]
  args.outputs.primitives << args.state.lives.map do |n|
    [1280 - 200 + 50 * n, 90, 31.5, 25.5, 'sprites/playerplane1.png'].sprite
  end

  args.outputs.sprites << update_exhaust_left(args) if args.state.player[:alive]
  args.outputs.sprites << update_exhaust_right(args) if args.state.player[:alive]
end

def make_initial_clouds
  clouds = []
  clouds += 6.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(1440), w: 64, h: 64, path: 'sprites/cloud1.png'} }
  clouds += 6.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(1440), w: 128, h: 64, path: 'sprites/cloud2.png'} }
  clouds += 6.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(1440), w: 256, h: 128, path: 'sprites/cloud3.png'} }
  clouds += 6.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(1440), w: 512, h: 128, path: 'sprites/cloud4.png'} }
  clouds
end

def make_clouds
  clouds = []
  clouds += 3.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(720) + 720, w: 64, h: 64, path: 'sprites/cloud1.png'} }
  clouds += 3.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(720) + 720, w: 128, h: 64, path: 'sprites/cloud2.png'} }
  clouds += 3.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(720) + 720, w: 256, h: 128, path: 'sprites/cloud3.png'} }
  clouds += 3.times.map { |n| {x: Math.rand(780) + 250, y: Math.rand(720) + 720, w: 512, h: 128, path: 'sprites/cloud4.png'} }
  clouds
end