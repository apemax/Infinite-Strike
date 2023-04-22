def collision_detection args
  args.state.enemy_bullets.each do |bullet|
    bullet[:x] += bullet[:dx]
    bullet[:y] += bullet[:dy]
  end
  args.state.player_bullets_1.each do |bullet|
    bullet[:x] += bullet[:dx]
    bullet[:y] += bullet[:dy]
  end
  args.state.player_bullets_2.each do |bullet|
    bullet[:x] += bullet[:dx]
    bullet[:y] += bullet[:dy]
  end

  # Check state of player bullets to see if any bullets missed enemies.
  args.state.enemy_bullets  = args.state.enemy_bullets.find_all { |bullet| bullet[:y].between?(-16, 736) }
  args.state.player_bullets_1 = args.state.player_bullets_1.find_all do |bullet|
    if bullet[:y].between?(-16, 736)
      true
    else
      false
    end
  end
  args.state.player_bullets_2 = args.state.player_bullets_2.find_all do |bullet|
    if bullet[:y].between?(-16, 736)
      true
    else
      false
    end
  end

  # Player and enemy collision detection.
  args.state.enemies_small_left = args.state.enemies_small_left.reject do |enemy|
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_wing
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    end
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_tail
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    else
      false
    end
  end
  args.state.enemies_small_right = args.state.enemies_small_right.reject do |enemy|
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_wing
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    end
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_tail
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    else
      false
    end
  end
  args.state.enemies_medium_center = args.state.enemies_medium_center.reject do |enemy|
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_wing
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    end
    if args.state.player[:alive]
      if enemy.intersect_rect? args.state.player_collision_tail
        args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        true
      end
    else
      false
    end
  end

  #Enemy bullet collision detection.
  args.state.enemy_bullets.each do |bullet|
    if args.state.player[:alive]
      if bullet.intersect_rect? args.state.player_collision_wing
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        bullet[:despawn]          = true
      end
      if bullet.intersect_rect? args.state.player_collision_tail
        args.state.explosions << {x: args.state.player[:x] + 4, y: args.state.player[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
        args.state.player[:alive] = false
        bullet[:despawn]          = true
      end
    end
  end

  #Player bullet collision detection.
  args.state.enemies_small_left = args.state.enemies_small_left.reject do |enemy|
    args.state.player_bullets_1.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end
  args.state.enemies_small_left = args.state.enemies_small_left.reject do |enemy|
    args.state.player_bullets_2.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end
  args.state.enemies_small_right = args.state.enemies_small_right.reject do |enemy|
    args.state.player_bullets_1.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          bullet[:despawn] = true
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end
  args.state.enemies_small_right = args.state.enemies_small_right.reject do |enemy|
    args.state.player_bullets_2.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          bullet[:despawn] = true
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end
  args.state.enemies_medium_center = args.state.enemies_medium_center.reject do |enemy|
    args.state.player_bullets_1.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end
  args.state.enemies_medium_center = args.state.enemies_medium_center.reject do |enemy|
    args.state.player_bullets_2.any? do |bullet|
      if bullet.intersect_rect? enemy
        enemy[:health] -= 10
        bullet[:despawn] = true
        args.state.explosions_small << {x: bullet[:x] + 4, y: bullet[:y] + 4, w: 8, h: 8, path: 'sprites/explosion-small-0.png', age: 0}
        if enemy[:health] <= 0
          args.state.explosions << {x: enemy[:x] + 4, y: enemy[:y] + 4, w: 32, h: 32, path: 'sprites/explosion-0.png', age: 0}
          args.state.score += 100
          true
        end
      else
        false
      end
    end
  end

  args.state.player_bullets_1 = args.state.player_bullets_1.reject { |bullet| bullet[:despawn] }
  args.state.player_bullets_2 = args.state.player_bullets_2.reject { |bullet| bullet[:despawn] }
  args.state.enemy_bullets  = args.state.enemy_bullets.reject { |bullet| bullet[:despawn] }
end