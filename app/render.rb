def render args
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
    [20, 700, "Time #{args.state.time_minutes}:#{"%02d" % args.state.time_seconds}", 5, 255, 255, 255, 255].label,
  ]

  args.outputs.sprites << update_exhaust_left(args) if args.state.player[:alive]
  args.outputs.sprites << update_exhaust_right(args) if args.state.player[:alive]
end