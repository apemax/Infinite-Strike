def defaults args
  args.state.explosions ||= []
  args.state.explosions_small ||=[]
  args.state.clouds ||=[]
  args.state.enemy_fighters ||= []
  args.state.enemy_light_gunship ||= []
  args.state.score ||= 0
  args.state.lives ||= 3
  args.state.player ||= {x: 620, y: 80, w: 63, h: 51, path: 'sprites/playerplane1.png', angle: 0, cooldown: 0, alive: true}
  args.state.player_collision_wing ||= {x: 620, y: 111, w: 63, h: 13, path: 'sprites/playerplanecollisionwing.png', angle: 0}
  args.state.player_collision_tail ||= {x: 637, y: 82, w: 30, h: 6, path: 'sprites/playerplanecollisiontail.png', angle: 0}
  args.state.enemy_bullets ||= []
  args.state.player_bullets_1 ||= []
  args.state.player_bullets_2 ||= []
  args.state.time_seconds ||= 0
  args.state.time_minutes ||= 0
  args.state.time_frame ||= 0
  args.state.current_wave ||= 0
  args.state.spawn_timer ||= 0
  args.state.cloud_timer ||= 0
  args.state.sub_wave ||= 1
  args.state.next_wave_condition ||= 0
  args.state.debug_enabled ||= false
end
