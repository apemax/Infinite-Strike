def update_enemy_positions args
  args.state.enemies_small_left.each do |enemy|
    enemy[:y] -= 2
    if enemy[:y] < 680
      enemy[:x] += 1
    end

    args.state.enemies_small_left = args.state.enemies_small_left.reject do |enemy|
      if enemy[:y] < -64
        true
      else
        false
      end
    end
  end
  args.state.enemies_small_right.each do |enemy|
    enemy[:y] -= 2
    if enemy[:y] < 680
      enemy[:x] -= 1
    end

    args.state.enemies_small_right = args.state.enemies_small_right.reject do |enemy|
      if enemy[:y] < -64
        true
      else
        false
      end
    end
  end
  args.state.enemies_medium_center.each do |enemy|
    enemy[:y] -= 1

    args.state.enemies_medium_center = args.state.enemies_medium_center.reject do |enemy|
      if enemy[:y] < -64
        true
      else
        false
      end
    end
  end
end

def update_enemy_fire args
  args.state.enemies_small_left.each do |enemy|
    if Math.rand < 0.004 + 0.004 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 12, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
  args.state.enemies_small_right.each do |enemy|
    if Math.rand < 0.004 + 0.004 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 12, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
  args.state.enemies_medium_center.each do |enemy|
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 21, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 48, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 63, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
    if Math.rand < 0.002 + 0.002 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 90, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
end