def update_enemy_pattern_small args
  args.state.enemy_fighters.each do |enemy|
    enemy[:y] -= 2
    if enemy[:y] < 680 and enemy[:spawn] == 'left'
      enemy[:x] += 1
      enemy[:y] += 1
    end

    if enemy[:y] < 680 and enemy[:spawn] == 'right'
      enemy[:x] -= 1
      enemy[:y] += 1
    end

    if enemy[:y] < 680 and enemy[:y] > 340 and enemy[:move] == 'left' and enemy[:spawn] == 'center'
      enemy[:x] -= 1
      enemy[:y] += 1
    end
    if enemy[:y] < 680 and enemy[:y] > 340 and enemy[:move] == 'right' and enemy[:spawn] == 'center'
      enemy[:x] += 1
      enemy[:y] += 1
    end

    args.state.enemy_fighters = args.state.enemy_fighters.reject do |enemy|
      if enemy[:y] < -64
        true
      else
        false
      end
    end
  end
end

def update_enemy_pattern_medium args
  args.state.enemy_light_gunship.each do |enemy|
    enemy[:y] -= 1

    args.state.enemy_light_gunship = args.state.enemy_light_gunship.reject do |enemy|
      if enemy[:y] < -64
        true
      else
        false
      end
    end
  end
end

def update_enemy_fire args
  args.state.enemy_fighters.each do |enemy|
    if Math.rand < 0.004 + 0.004 && args.state.player[:alive]
      args.state.enemy_bullets << {x: enemy[:x] + 12, y: enemy[:y] - 8, w: 6, h: 12, path: 'sprites/enemybullet1.png', dx: 0, dy: -3}.sprite!
    end
  end
  args.state.enemy_light_gunship.each do |enemy|
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