def defaults args
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
end