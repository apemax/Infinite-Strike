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