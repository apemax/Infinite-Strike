def update_explosions args
  args.state.explosions.each do |explosion|
    explosion[:age]  += 0.5
    explosion[:path] = "sprites/explosion-#{explosion[:age].floor}.png"
  end
  args.state.explosions = args.state.explosions.reject { |explosion| explosion[:age] >= 7 }
  
  args.state.explosions_small.each do |explosion|
    explosion[:age]  += 0.5
    explosion[:path] = "sprites/explosion-#{explosion[:age].floor}.png"
  end
  args.state.explosions_small = args.state.explosions_small.reject { |explosion| explosion[:age] >= 7 }
end
  
def update_exhaust_left args
  if args.state.player[:alive]
    args.state.player.started_running_at ||= args.state.tick_count
    how_many_frames_in_sprite_sheet = 8
    how_many_ticks_to_hold_each_frame = 2
    number_of_frames_to_show_each_sprite = 1
    should_the_index_repeat = true
    tile_index = args.state.player.started_running_at.frame_index(how_many_frames_in_sprite_sheet, how_many_ticks_to_hold_each_frame, should_the_index_repeat)
  end
  if !args.state.player[:alive]
    tile_index = 0
  end

  {
    x: args.state.player.x + 18,
    y: args.state.player.y + 15,
    w: 6,
    h: 12,
    path: 'sprites/playerplaneexhaust.png',
    tile_x: 0 + (tile_index * 6),
    tile_y: 0,
    tile_w: 6,
    tile_h: 12,
  }
end
  
def update_exhaust_right args
  if args.state.player[:alive]
    args.state.player.started_running_at ||= args.state.tick_count
    how_many_frames_in_sprite_sheet = 8
    how_many_ticks_to_hold_each_frame = 2
    number_of_frames_to_show_each_sprite = 1
    should_the_index_repeat = true
    tile_index = args.state.player.started_running_at.frame_index(how_many_frames_in_sprite_sheet, how_many_ticks_to_hold_each_frame, should_the_index_repeat)
  end
  if !args.state.player[:alive]
    tile_index = 0
  end
  
  {
    x: args.state.player.x + 39,
    y: args.state.player.y + 15,
    w: 6,
    h: 12,
    path: 'sprites/playerplaneexhaust.png',
    tile_x: 0 + (tile_index * 6),
    tile_y: 0,
    tile_w: 6,
    tile_h: 12,
  }
end