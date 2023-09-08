def player_input args
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
    args.state.player[:cooldown] -= 1
  if args.inputs.keyboard.key_held.space && args.state.player[:cooldown] <= 0 && args.state.player[:alive]
    args.state.player_bullets_1 << {x: args.state.player[:x] + 16, y: args.state.player[:y] + 38, w: 6, h: 12, path: 'sprites/playerbullet.png', dx: 0, dy: 8}.sprite!
    args.state.player_bullets_2 << {x: args.state.player[:x] + 32, y: args.state.player[:y] + 38, w: 6, h: 12, path: 'sprites/playerbullet.png', dx: 0, dy: 8}.sprite!
    args.state.player[:cooldown] = 10 + 1
  end
end