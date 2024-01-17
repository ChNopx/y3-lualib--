---@class Object.Ability
--技能特殊属性（暂不生效）  
---@field ability_attribute number
--当技能施法开始或施法出手阶段结束时，如果与施法目标的距离超过该值，会打断技能释放。
---@field ability_break_cast_range any[]
--后摇时长  
--施法完成时间
---@field ability_bw_point number
--前摇时长  
--施法开始时间
---@field ability_cast_point number
--释放范围  
--以角色为圆心，以该值为半径的圆形区域。是角色不需要移动即可释放技能的最远距离。
---@field ability_cast_range any[]
--技能的释放类型。
---@field ability_cast_type number
--施法时长  
--施法出手时间
---@field ability_channel_time number
--技能资源消耗值  
--释放技能消耗的MP(会根据单位自身的技能资源进行变化)数值
---@field ability_cost any[]
--技能伤害值  
--技能造成的伤害，可使用公式编辑，需在触发内引用才可生效
---@field ability_damage any[]
--当前技能的影响范围，
---@field ability_damage_range any[]
--使用该技能时会消耗的生命值
---@field ability_hp_cost any[]
--图标  
--技能的图标，会在编辑器和游戏的ui上显示
---@field ability_icon number
--技能最大等级  
--技能的等级上限
---@field ability_max_level number
--最大充能层数  
--技能的最大充能数，必须满足充能数大于0且不在冷却状态才能施放该技能
---@field ability_max_stack_count any[]
--施法引导时间
---@field ability_prepare_time number
--充能cd  
--每增加一层充能数所需的时间（单位为秒）
---@field ability_stack_cd any[]
--是否允许无目标攻击  
---@field allow_none_target boolean
--动画
---@field animation string
--动画速率
---@field animation_speed number
--箭头长度  
--箭头指示器的长度
---@field arrow_length any[]
--箭头宽度  
--箭头指示器的宽度
---@field arrow_width any[]
---@field art_resource_btn any
--当采集到的资源是物品时，是否自动将物品拾取。如果不自动拾取则物品会创建在地面。
---@field auto_pick boolean
--后摇特效
---@field bs_sfx_list any[]
--后摇音效
---@field bs_sound_effect any[]
--建造技能建造的单位类型
---@field build_list any[]
--技能施法完成阶段能否被其他技能或者移动打断
---@field can_bs_interrupt boolean
--是否可以缓存  
--开启时，被控制时，控制结束 依旧可以继续释放（例如被禁止施法时发布施放命令，禁止施法解除后就会自动施放出来）
---@field can_cache boolean
--技能施法出手阶段能否被其他技能或者移动打断
---@field can_cast_interrupt boolean
--如果单位当前生命值不满足消耗时，能否施放技能
---@field can_cast_when_hp_insufficient boolean
--开启后可以配置消耗生命值相关的技能参数。如无需要请勿开启该配置，会增加系统消耗。
---@field can_cost_hp boolean
--释放该技能时候会尝试打断当前正在释放的技能
---@field can_interrupt_others boolean
--技能施法引导阶段能否被其他技能或者移动打断
---@field can_prepare_interrupt boolean
--技能施法开始阶段能否被其他技能或者移动打断
---@field can_ps_interrupt boolean
--圆形半径  
--圆形指示器的半径
---@field circle_radius any[]
--冷却时间  
--技能的冷却时间，释放一次技能后需要等待该时间才可继续释放（单位为秒）
---@field cold_down_time any[]
--使用采集技能时会播放的动画。会在技能施法开始时播放，施法停止时停止。
---@field collection_animation string
--采集技能时播放的采集动画是否会循环播放。
---@field collection_animation_loop boolean
--是否在采集完成后继续采集（仅在技能冷却时间为0时生效）
---@field collection_continuously boolean
--可破坏物标签要求
---@field collection_destructible_tags any[]
--如果单位当前生命值不满足消耗时施放技能，则该项为true时单位会死亡，为false时会保留1点生命值
---@field cost_hp_can_die boolean
--施法特效
---@field cst_sfx_list any[]
--施法音效
---@field cst_sound_effect any[]
--描述  
--描述
---@field description number
--结束特效
---@field end_sfx_list any[]
--结束音效
---@field end_sound_effect any[]
--索敌条件 - 阵营  
--按阵营选取目标。
---@field filter_condition_camp number
--索敌条件 - 类型  
--按种类选取目标。
---@field filter_condition_type number
--物品标签要求
---@field filter_item_tags any[]
--过滤效果单位  
---@field filter_modifier_unit number
--单位标签要求
---@field filter_unit_tags any[]
--受击特效
---@field hit_sfx_list any[]
--击中音效
---@field hit_sound_effect any[]
--技能受到单位属性中的冷却缩短的影响
---@field influenced_by_cd_reduce boolean
--勾选后移动会尝试打断当前技能，不勾选则可以实现移动施法
---@field influenced_by_move boolean
--流程-是否持续施法  
---@field is_channel boolean
--蓄力技能专属，为true时，技能开始和引导时间会一起作为蓄力技能一阶段的引导时间
---@field is_charge_ability boolean
--流程-是否立刻施法  
--释放这个技能是否需要施法过程，开启时可以在单位存活的任何时期发动该技能，即使被禁止施法也可以正常释放。
---@field is_immediate boolean
--是否是近战攻击  
--开启时，标记这个技能造成的伤害为近战伤害
---@field is_meele boolean
--是否开关技能（暂不生效）  
---@field is_toggle boolean
--ID
---@field key number
---@field kv Object.Ability.Kv
--魔法书中存放的技能list
---@field magicbook_list any[]
--名称  
--名称
---@field name string|integer
--开启时，技能释放后单位会自动转到技能释放的方向（转身速度为单位的转身速度）
---@field need_turn_to_target boolean
--每次使用采集技能时获取到的资源数量。如果采集的是玩家属性，则获得对应的玩家属性值，如果采集的是物品，则获得对应数量的物品。
---@field pick_count number
--施放技能消耗的玩家属性，技能拥有者的玩家该属性不足时无法施放技能
---@field player_props_cost any[]
--释放技能的前置条件
---@field precondition_list any[]
--前摇特效
---@field ps_sfx_list any[]
--前摇音效
---@field ps_sound_effect any[]
--如果技能目标点超出施法范围，会在施法范围内离目标最近的点施放
---@field release_immediately_out_of_range boolean
--允许学习等级  
--单位学习该技能所需要的等级
---@field required_level Object.Ability.RequiredLevel
--扇形指示器的角度
---@field sector_angle any[]
--扇形半径  
--扇形指示器的边长
---@field sector_radius any[]
--指示器类型  
--释放技能时的鼠标指示器的样式
---@field sight_type number
--可以设置触发指定事件时播放的声音
---@field sound_event_list any[]
--开启时，会根据技能的施法时间显示相应的进度条
---@field sp_count_down boolean
---@field sp_countdown boolean
--准备特效
---@field sp_sfx_list any[]
--准备音效
---@field sp_sound_effect any[]
--编辑器后缀
---@field suffix string
--标签  
--用于对技能的分类处理。为技能贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：所有拥有XX标签的技能等级+1
---@field tags any[]
--特殊筛选（只有尸体有效）  
--特殊的技能目标筛选规则
---@field target_attribute number
--主题  
---@field theme number
--UID
---@field uid string

---@class Object.Ability.Kv
---@field AttackTimes Object.Ability.Kv.AttackTimes

---@class Object.Ability.Kv.AttackTimes
---@field annotation string
---@field desc string
---@field etype number
--ID
---@field key string
---@field prop_cls string
---@field remark string
--主类型  
---@field type number
---@field value number

---@class Object.Ability.RequiredLevel
---@field formula string
---@field required_levels any[]


---@class Object.Buff
--挂接模型列表
---@field attach_model_list string
--每隔多长时间触发一次循环周期到期事件
---@field cycle_time number
--描述  
--描述
---@field description number
--死亡时是否销毁这个魔法效果。永久型的魔法效果不要勾选该选项。
---@field disappear_when_dead boolean
---@field effect_button any
--获得特效列表  
---@field gain_list any[]
---@field get_effect_list any[]
--光环会对附近符合条件的单位添加该光环效果
---@field halo_effect number
--不会对拥有指定标签的单位施加光环效果。  
--只有满足所有判断条件时，单位才会获得光环效果。
---@field ign_inf_unit_tag any[]
--不会对指定类型的单位施加光环效果。  
--只有满足所有判断条件时，单位才会获得光环效果。
---@field ign_inf_unit_type number
--对多大范围内的单位添加光环效果
---@field influence_rng number
--是否对光环的拥有者添加光环效果
---@field is_influence_self boolean
--ID
---@field key number
---@field kv Object.Buff.Kv
--不变会保留旧的魔法效果对象（事件中获取），覆盖会保留新的对象。
---@field layer_change_of_cover number
--魔法效果的最大层数，如果最大层数为1则魔法效果在局内的属性面板中不会显示层数
---@field layer_max number
---@field lose_effect_list any[]
--失去特效列表  
---@field lose_list any[]
---@field material_alpha number
--影响魔法效果携带者的材质
---@field material_change number
---@field material_color any[]
---@field material_color_intensity number
--模型  
--模型
---@field model number
--用于决定单位获得相同的魔法效果时，是否进行覆盖以及如何进行覆盖。
---@field modifier_cover_type number
--仅用于标记，用来进行效果分类，在ECA中可以对单位身上同一分类的魔法效果统一处理
---@field modifier_effect number
--效果图标  
---@field modifier_icon number
--不同类别的魔法效果将会有
---@field modifier_type number
--名称  
--名称
---@field name string|integer
--“同源”指覆盖发生时2个魔法效果的关联技能类型和来源单位相同  
--  
--当同源覆盖要求为是，2个不同源的魔法效果不会发生覆盖，走不覆盖规则
---@field same_origin_cover boolean
--护盾发生覆盖时的护盾值的处理方式
---@field shield_change_of_cover number
--通用类可以抵挡物理或法术伤害，物理和法术护盾只能抵挡对应的伤害
---@field shield_type number
--护盾可以抵挡的伤害值
---@field shield_value number
--勾选后会在局内单位的魔法效果栏中显示该魔法效果
---@field show_on_ui boolean
--可以设置触发指定事件时播放的声音
---@field sound_event_list any[]
--编辑器后缀
---@field suffix string
--标签  
---@field tags any[]
--根据敌我关系决定是否对单位施加光环效果
---@field target_allow number
--若覆盖类型为覆盖时，不变会保留旧的持续时间，覆盖会保留新的持续时间，若覆盖类型为叠加时，规则相反。
---@field time_change_of_cover number
--UID
---@field uid string

---@class Object.Buff.Kv


---@class Object.Item
--敏捷  
--为物品携带者提供的额外敏捷
---@field agility number
--主动技能  
--使用该物品的时释放的主动技能
---@field attached_ability number
--敏捷  
--为物品携带者提供的额外敏捷
---@field attached_agility any[]
--法术攻击力  
--为物品携带者提供的额外魔法攻击力的数值
---@field attached_attack_mag any[]
--物理攻击力  
--为物品携带者提供的额外物理攻击力的数值
---@field attached_attack_phy any[]
--攻击速度(%)  
--为物品携带者提供的额外攻击速度的倍数值
---@field attached_attack_speed any[]
---@field attached_buffs any[]
--冷却缩减(%)  
--为物品携带者提供的额外冷却缩短的百分比
---@field attached_cd_reduce any[]
--暴击率(%)  
--为物品携带者提供的额外暴击率
---@field attached_critical_chance any[]
--暴击伤害(%)  
--为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
---@field attached_critical_dmg any[]
---@field attached_custom_1 number
--法术防御力  
--为物品携带者提供的额外法术防御力的数值
---@field attached_defense_mag any[]
--物理防御力  
--为物品携带者提供的额外物理防御力的数值
---@field attached_defense_phy any[]
--伤害减免(%)  
--为物品携带者提供的额外伤害减免
---@field attached_dmg_reduction any[]
--躲避率(%)  
--为物品携带者提供的额外闪避率
---@field attached_dodge_rate any[]
--所有伤害加成(%)  
--为物品携带者提供的额外伤害加成
---@field attached_extra_dmg any[]
--技能伤害加成(%)  
--该字段并无实际效果
---@field attached_gainvalue any[]
--被治疗效果提升(%)  
--为物品携带者提供的额外受到治疗增益加成
---@field attached_heal_effect any[]
--命中率(%)  
--为物品携带者提供的额外命中率
---@field attached_hit_rate any[]
--最大生命值  
--为物品携带者提供的额外最大生命值
---@field attached_hp_max any[]
--生命恢复  
--为物品携带者提供的额外每秒恢复生命值
---@field attached_hp_rec any[]
--智力  
--为物品携带者提供的额外智力
---@field attached_intelligence any[]
--最大技能资源  
--为物品携带者提供的额外最大法力值
---@field attached_mp_max any[]
--技能资源恢复  
--为物品携带者提供的额外的每秒法力恢复值
---@field attached_mp_rec any[]
--移动速度  
--为物品携带者提供的额外移动速度
---@field attached_ori_speed any[]
--携带该物品时会获得的被动技能
---@field attached_passive_abilities any[]
--法穿数值  
--为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
---@field attached_pene_mag any[]
--法术穿透(%)  
--为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
---@field attached_pene_mag_ratio any[]
--物穿数值  
--为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
---@field attached_pene_phy any[]
--物理穿透(%)  
--为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
---@field attached_pene_phy_ratio any[]
--该字段并无实际效果
---@field attached_resilience any[]
--力量  
--为物品携带者提供的额外力量
---@field attached_strength any[]
--法术吸血(%)  
--为物品携带者提供的额外法术吸血
---@field attached_vampire_mag any[]
--物理吸血(%)  
--为物品携带者提供的额外物理吸血
---@field attached_vampire_phy any[]
--为物品携带者提供的额外真实视野
---@field attached_vision_true any[]
--法攻数值  
--为物品携带者提供的额外魔法攻击力的数值
---@field attack_mag number
--物攻数值  
--为物品携带者提供的额外物理攻击力的数值
---@field attack_phy number
--攻速数值  
--为物品携带者提供的额外攻击速度的倍数值
---@field attack_speed number
--自动使用  
--勾选后获得该物品时会自动使用该物品，如果不满足该物品的主动技能消耗条件则无法拾取
---@field auto_use boolean
---@field base_color_mod number
---@field base_tint_color any[]
--尺寸  
--物品模型的缩放比例
---@field body_size number
--购买所需资源  
--从商店里购买这件物品所需要的资源
---@field buy_res_list any[]
---@field can_sell boolean
--冷却缩减  
--为物品携带者提供的额外冷却缩短的百分比
---@field cd_reduce number
--CD组  
--该物品所在的CD组，物品使用时会使单位持有的相同CD组内所有物品进入使用物品的主动技能冷却
---@field cd_type string
--合成素材  
--合成这件物品所需要的材料，拥有所有合成原料后会自动合成该物品
---@field compose_list any[]
---@field compose_sfx number
--暴击率  
--为物品携带者提供的额外暴击率
---@field critical_chance number
--暴击效果数值  
--为物品携带者提供的额外暴击伤害的倍率。发生暴击时，造成的暴击伤害倍数
---@field critical_dmg number
--物品创建后的初始充能层数
---@field cur_charge number
--物品创建后的初始堆叠层数
---@field cur_stack number
---@field custom_1 number
--法防数值  
--为物品携带者提供的额外法术防御力的数值
---@field defense_mag number
--物防数值  
--为物品携带者提供的额外物理防御力的数值
---@field defense_phy number
--物品在地面上是否会自动销毁
---@field delete_on_discard boolean
--描述  
--描述
---@field description number
--开启后物品与物品之间会发生碰撞，可以防止物品堆叠在一起。碰撞范围设置在游戏规则-通用-物品碰撞范围中。
---@field disable_overlapping boolean
--可以遗弃  
--玩家是否可以将物品丢弃到地面
---@field discard_enable boolean
--持有者死亡时掉落  
--物品是否会在携带者死亡时掉落地面
---@field discard_when_dead boolean
--受到伤害减免比例  
--为物品携带者提供的额外伤害减免
---@field dmg_reduction number
--躲避率  
--为物品携带者提供的额外闪避率
---@field dodge_rate number
--消失时间  
--掉落在地面上的消失时间
---@field drop_stay_time number
--合成效果编辑按钮  
---@field effect_button any
--获得特效列表
---@field effect_list any[]
--所有伤害加成(%)  
--为物品携带者提供的额外伤害加成
---@field extra_dmg number
---@field fresnel_exp number
---@field gold_cost number
--被治疗效果提升(%)  
--为物品携带者提供的额外受到治疗增益加成
---@field heal_effect number
--命中率  
--为物品携带者提供的额外命中率
---@field hit_rate number
--最大生命值  
--生命值
---@field hp_max number
--生命恢复  
--为物品携带者提供的额外每秒恢复生命值
---@field hp_rec number
--图标  
--物品的头像
---@field icon number
--初始库存  
--物品作为商品时在商店中的初始可购买数
---@field init_stock number
--智力  
--为物品携带者提供的额外智力
---@field intelligence number
--鼠标悬浮到物品上时显示的名称样式
---@field item_billboard_type number
--ID  
--ID
---@field key number
--玩家自定义  
---@field kv Object.Item.Kv
--等级  
--物品的等级
---@field level number
---@field material_color any[]
---@field material_color_intensity number
--最大库存  
--物品作为商品时在商店中的最大可购买数
---@field max_stock number
--最大充能数  
--物品可以设置的最大充能层数
---@field maximum_charging number
--最大堆叠  
--物品可以叠加的最大堆叠层数。重复获得物品时，在不大于该值的情况下物品会自动堆叠。
---@field maximum_stacking number
--模型  
--模型
---@field model number
---@field model_opacity number
--最大技能资源  
--为物品携带者提供的额外最大法力值
---@field mp_max number
--技能资源恢复  
--为物品携带者提供的额外的每秒法力恢复值
---@field mp_rec number
--名称  
--名称
---@field name string|integer
---@field non_zero_stacking boolean
--法穿数值  
--为物品携带者提供的额外法术穿透。先计算固定穿透，再计算百分比穿透
---@field pene_mag number
--法术穿透(%)  
--为物品携带者提供的额外百分比法术穿透。先计算固定穿透，再计算百分比穿透
---@field pene_mag_ratio number
--物穿数值  
--为物品携带者提供的额外物理穿透。先计算固定穿透，再计算百分比穿透
---@field pene_phy number
--无视目标物抗百分比  
--为物品携带者提供的额外百分比物理穿透。先计算固定穿透，再计算百分比穿透
---@field pene_phy_ratio number
--前置条件  
--只有满足对应条件之后物品才会在商店中可购买。
---@field precondition_list any[]
--库存恢复间隔  
--当前物品作为商品时，商店库存增加的间隔时间
---@field refresh_interval number
--可以被抵押  
--是否可以将该物品出售到商店
---@field sale_enable boolean
---@field sell_gold number
--出售获得资源  
--出售到商店时获得的资源
---@field sell_res_list any[]
--可以设置触发指定事件时播放的声音
---@field sound_event_list any[]
---@field source_player_prop string
--堆叠类型  
--物品的堆叠或者充能逻辑。
---@field stack_type number
--购买开始时间  
--游戏开始后多长时间才能购买该类物品
---@field start_rft number
--力量  
--力量
---@field strength number
--编辑器后缀  
--编辑器后缀
---@field suffix string
--标签  
--用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
---@field tags any[]
--UID  
--UID
---@field uid string
--使用消耗次数  
--物品是堆叠类型时，每次使用该物品消耗的堆叠层数
---@field use_consume number

---@class Object.Item.Kv


---@class Object.Unit
--应用科技  
--单位的可应用科技（会受到该科技的影响）
---@field affect_techs any[]
--敏捷  
--敏捷
---@field agility number
--敏捷  
--敏捷
---@field agility_grow number
--锁敌范围  
--单位的警戒范围(AI)
---@field alarm_range number
--当单位转向时，如果转向角度小于该值，则移速不会受影响。
---@field angle_tolerance number
--防御类型  
--单位的护甲类型，具体效果可在游戏规则中查看
---@field armor_type number
--攻击间隔  
--单位两次普通攻击之前间隔的秒数，当普攻技能替换为自定义类型时，会使用技能的冷却时间
---@field attack_interval number
--两次普通攻击之间的间隔时间
---@field attack_interval_grow number
--法攻数值  
--单位的法术攻击力
---@field attack_mag number
--法术攻击力  
--单位的法术攻击力
---@field attack_mag_grow number
--物攻数值  
--单位的物理攻击力
---@field attack_phy number
--物理攻击力  
--单位的物理攻击力
---@field attack_phy_grow number
--攻击范围  
--单位可以攻击攻击范围内的可见单位，当普攻技能替换为自定义类型时，会使用技能的释放范围
---@field attack_range number
--普通攻击的攻击范围
---@field attack_range_grow number
--攻速数值  
--单位的攻击速度百分比，局内显示的实际攻速为:1/单位当前普通攻击技能冷却时间*攻击速度
---@field attack_speed number
--攻击速度(%)  
--攻击速度(倍数)
---@field attack_speed_grow number
--攻击类型  
--单位的攻击类型，具体效果可在游戏规则中查看
---@field attack_type number
---@field back_range number
--头顶名称显示方式  
--影响游戏内物体上方的文本显示内容。
---@field bar_show_name string|integer
--是否显示血条刻度  
--单位血条上是否会出现刻度线
---@field bar_show_scale boolean
---@field bar_show_title boolean
--物品栏  
--单位的物品栏格数
---@field bar_slot_size number
---@field bar_title_style number
---@field base_tint_color any[]
--单位血条高度偏移  
---@field billboard_height_offset number
--头顶名称字体  
--在单位头顶显示的文字字体
---@field billboard_name_font string
--x轴缩放  
---@field billboard_scale_x number
--y轴缩放  
---@field billboard_scale_y number
--血条样式  
--该单位在游戏内的血条样式
---@field blood_bar number
--血条显示模式  
--该单位在游戏内的血条的显示时机
---@field blood_show_type number
--模型缩放  
--对当前物体模型的缩放倍数，用于调整模型大小。
---@field body_size number
--夹角  
---@field box_angle number
--盒子长度  
---@field box_length1 number
--盒子宽度  
---@field box_length2 number
--半径  
---@field box_r number
--盒子类型  
---@field box_type number
---@field build_precondition_list any[]
--资源消耗  
--单位作为建筑时建造会消耗的资源
---@field build_res_cost_list any[]
---@field building_rotatable boolean
--购买所需资源  
--单位作为商品的购买所需资源
---@field buy_res_list any[]
--无法反击时会逃跑  
--当单位受到伤害且自身无法反击时，会向伤害来源的相反方向移动一段距离，仅在警戒状态下生效
---@field can_flee boolean
--解除锁定范围  
--单位的取消警戒范围(AI)，敌方离开取消警戒范围后会不再主动攻击敌方
---@field cancel_alarm_range number
--冷却缩减  
--单位技能进入cd时减少部分冷却时间
---@field cd_reduce number
--冷却缩减(%)  
--单位技能进入cd时减少部分冷却时间
---@field cd_reduce_grow number
--碰撞  
---@field collision number
--静态碰撞跟随面向  
--仅对建筑类型单位生效。勾选时，单位改变朝向时会使静态碰撞跟随旋转。
---@field collision_box_turning_enable boolean
---@field collision_points any[]
---@field combat_range number
--通用技能  
--单位的通用技能。在默认UI界面中，会显示在前6个技能栏内，超出的不显示但依然生效。
---@field common_ability_list any[]
--普攻  
--单位的普通攻击，唯一，单位对目标普通攻击时释放的技能
---@field common_atk any[]
--单位普通攻击的类型，选择自定义需要绑定技能
---@field common_atk_type number
---@field copper_coin number
--暴击率  
--单位普通攻击有概率造成额外伤害
---@field critical_chance number
--暴击率(%)  
--单位普通攻击有概率造成额外伤害
---@field critical_chance_grow number
--暴击效果数值  
--发生暴击时，造成的暴击伤害倍数
---@field critical_dmg number
--暴击伤害(%)  
--发生暴击时，造成的暴击伤害倍数
---@field critical_dmg_grow number
---@field custom_1 number
---@field custom_1_grow number
---@field custom_2 number
---@field custom_2_grow number
---@field custom_5 number
---@field custom_5_grow number
---@field custom_6 number
---@field custom_6_grow number
---@field custom_7 number
---@field custom_7_grow number
--默认行为  
--单位默认状态下会执行的行为
---@field default_behaviour_type string
--法防数值  
--单位的法术防御力
---@field defense_mag number
--法术防御力  
--单位的法术防御力
---@field defense_mag_grow number
--物防数值  
--单位的物理防御力
---@field defense_phy number
--物理防御力  
--单位的物理防御力
---@field defense_phy_grow number
--描述  
--单位的介绍说明，用在编辑器内和游戏内的Tips显示上
---@field description number
--死亡后是否销毁单位  
--死亡后是否会把单位完全销毁。（会在尸体消失时间结束后进行销毁，销毁后将无法再获取单位相关信息）
---@field destroy_after_die boolean
--死亡  
--死亡状态下会播放的动画
---@field die_anim string
---@field disk_shadow_size number
--受到伤害减免比例  
--百分比降低受到的伤害
---@field dmg_reduction number
--伤害减免(%)  
--百分比降低受到的伤害
---@field dmg_reduction_grow number
--躲避率  
--单位躲避其他单位普通攻击的概率
---@field dodge_rate number
--躲避率(%)  
--单位躲避其他单位普通攻击的概率
---@field dodge_rate_grow number
--死亡后掉落物品  
---@field drop_item any[]
--掉落物品  
--单位死亡后会掉落的物品
---@field drop_items_tuple any[]
--换色颜色  
---@field dye_color string
--换色方式  
---@field dye_color_plan number
--碰撞动态半径  
--碰撞动态半径，每50为1个标准格。
---@field dynamic_collision_r number
--动态碰撞类型  
---@field dynamic_collision_type number
--碰撞宽度  
---@field dynamic_collision_x number
--碰撞长度  
---@field dynamic_collision_z number
--敌方小地图头像  
---@field enemy_mini_map_icon number
--所有伤害加成(%)  
--百分比提高造成的伤害
---@field extra_dmg number
--所有伤害加成(%)  
--百分比提高造成的伤害
---@field extra_dmg_grow number
--强制显示在小地图  
--勾选后单位将强制显示在小地图上，无视战争阴影
---@field force_show_on_mini_map boolean
---@field fresnel_exp number
--技能伤害加成(%)  
--该字段并无实际效果
---@field gainvalue number
--技能伤害加成(%)  
--该字段并无实际效果
---@field gainvalue_grow number
---@field gold_coin number
--是否有技能资源条  
--该单位是否有可以用来释放技能的能量
---@field has_mp boolean
--是否显示白色护盾值  
---@field has_shield boolean
--被治疗效果加成(%)  
--提高接受治疗时受到的治疗效果
---@field heal_effect number
--被治疗效果提升(%)  
--提高接受治疗时受到的治疗效果
---@field heal_effect_grow number
--当单位受到治疗效果时，提升治疗量
---@field healing_effect number
---@field healing_effect_grow number
--英雄技能  
--单位的英雄技能，可以通过学习升级，每次学习需要消耗一个技能点（升级时获取）。在默认UI界面中，会显示在后6个技能栏内，超出的不显示但依然生效。
---@field hero_ability_list any[]
--命中率  
--单位普通攻击命中其他单位的概率
---@field hit_rate number
--命中率(%)  
--单位普通攻击命中其他单位的概率
---@field hit_rate_grow number
--最大生命值  
--单位的最大生命值
---@field hp_max number
--最大生命值  
--单位的最大生命值
---@field hp_max_grow number
--生命恢复  
--单位的每秒生命恢复数值
---@field hp_rec number
--生命恢复  
--单位的每秒生命恢复数值
---@field hp_rec_grow number
--头像  
--单位在游戏中显示的头像
---@field icon number
--默认状态  
--默认状态下会播放的动画
---@field idle_anim string
--初始库存  
--单位作为商品的初始库存
---@field init_stock number
--智力  
--智力
---@field intelligence number
--智力  
--智力
---@field intelligence_grow number
--是否应用玩家颜色光圈  
---@field is_apply_role_color boolean
--是否在小地图显示  
--单位是否会在小地图上显示出来
---@field is_mini_map_show boolean
--勾选后如果该单位被遮挡，会看到该单位的描边
---@field is_open_Xray boolean
--是否开启描边  
---@field is_open_outline_pass boolean
--是否做为商店  
--开启后单位可以作为商店编辑出售的物品
---@field is_shop boolean
--尸体消失时间  
--尸体消失时间
---@field keep_dead_body_time number
--无法移动时仍然保持目标  
--该字段未勾选时，在目标移动出自身的警戒范围后，且自身不能移动时，会立即开始寻找一个新的攻击目标。多用于定点守卫。
---@field keep_target boolean
--ID  
--单位的唯一表示
---@field key number
--玩家自定义  
---@field kv Object.Unit.Kv
--等级  
--单位的默认等级
---@field level number
---@field logic_rotate_speed_valid boolean
---@field logic_upper_rotate_speed_valid boolean
--主属性  
--英雄单位的主要属性，一般主属性的提升会对英雄有额外加成
---@field main_attr string
--最大库存  
--单位作为商品的最大库存
---@field max_stock number
--小地图头像  
--单位在小地图上的头像
---@field mini_map_icon number
--小地图头像缩放  
--单位在小地图上的头像的缩放
---@field mini_map_icon_scale number
--模型  
--当前单位所使用的的模型
---@field model number
--离地高度  
--单位的离地高度
---@field model_height number
---@field model_opacity number
--移动类型  
--单位的移动类型，决定单位究竟是在地面移动还是在空中移动。
---@field move_channel number
--可移动通道  
--对单位移动类型的补充，决定单位究竟是在哪些通道移动。任意通道被碰撞阻挡该单位均无法通过。
---@field move_limitation number
--移动类型  
--影响可用的可移动通道。
---@field move_type number
--技能资源条颜色  
--该单位用来释放技能的能量的颜色
---@field mp_color string
--技能资源类型标识  
--该单位用来释放技能的能量的名称
---@field mp_key string
--最大技能资源  
--单位的最大技能资源
---@field mp_max number
--最大技能资源  
--单位的最大技能资源
---@field mp_max_grow number
--技能资源恢复  
--单位的每秒技能资源恢复数值
---@field mp_rec number
--技能资源恢复  
--单位的每秒技能资源恢复数值
---@field mp_rec_grow number
--名称  
--当前单位的名称
---@field name string|integer
---@field need_preview_billboard boolean
--单位状态  
--进入游戏时，为单位附加的初始状态
---@field ori_bits number
--移速数值  
--单位每秒移动的距离。
---@field ori_speed number
--移动速度  
--单位每秒移动的距离。
---@field ori_speed_grow number
--被动技能列表  
--隐藏技能，放在这类技能位中的技能将不会被显示在游戏中。
---@field passive_ability_list any[]
--法穿数值  
--穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
---@field pene_mag number
--法术穿透  
--穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
---@field pene_mag_grow number
--法术穿透(%)  
--百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
---@field pene_mag_ratio number
--法术穿透(%)  
--百分比穿透敌人法术防御力。先计算固定穿透，再计算百分比穿透
---@field pene_mag_ratio_grow number
--物穿数值  
--穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
---@field pene_phy number
--物理穿透  
--穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
---@field pene_phy_grow number
--无视目标物抗百分比  
--百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
---@field pene_phy_ratio number
--物理穿透(%)  
--百分比穿透敌人物理防御力。先计算固定穿透，再计算百分比穿透
---@field pene_phy_ratio_grow number
--背包栏  
--单位的背包栏格数
---@field pkg_slot_size number
--前置条件  
--训练、购买、建造该单位的前置条件
---@field precondition_list any[]
---@field preview_billboard_health_value number
--库存恢复间隔  
--单位作为商品的库存恢复间隔
---@field refresh_interval number
--可研发科技  
--这些科技，可以在单位身上研发、升级。
---@field research_techs any[]
--韧性(%)  
--该字段并无实际效果
---@field resilience number
--韧性(%)  
--该字段并无实际效果
---@field resilience_grow number
---@field reward_custom_res_1 number
---@field reward_custom_res_2 number
---@field reward_custom_res_3 number
---@field reward_custom_res_4 number
---@field reward_custom_res_5 number
---@field reward_custom_res_6 number
--该单位被击杀后提供的经验奖励
---@field reward_exp number
---@field reward_official_res_1 number
---@field reward_official_res_2 number
--玩家颜色缩放  
---@field role_color_scale number
--转身速度(弧度)  
--单位的转身速度
---@field rotate_speed number
---@field scale number
--出售列表  
--单位作为商店时的出售列表
---@field sell_list any[]
--出售获得资源  
--单位作为商品的出售获得资源
---@field sell_res_list any[]
--是否敌友方显示不同头像  
---@field separate_enemy_icon boolean
--出售阵营参数  
---@field shop_camp_args number
--商店组件  
---@field shop_key any[]
--出售范围  
---@field shop_range number
--打开同时选中  
---@field shop_select boolean
--出售阵营类型  
---@field shop_sell_type number
--悬浮信息显示  
--开启后鼠标悬浮到单位身上时会显示单位名称和等级的文本框
---@field show_y3_extra_info boolean
---@field silver_coin number
---@field simple_common_atk Object.Unit.SimpleCommonAtk
--可以设置触发指定事件时播放的声音
---@field sound_event_list any[]
--特殊状态  
--特殊状态下会播放的动画
---@field special_idle_anim string
--当单位转向时，移动速度会受到一定的影响
---@field speed_ratio_in_turn number
--移动动画播放速率系数  
--单位移动时动画的播放速度
---@field standard_walk_rate number
--购买开始时间  
--单位作为商品的可购买时间(游戏开始多久后可以购买）
---@field start_rft number
--力量  
--力量
---@field strength number
--力量  
--力量
---@field strength_grow number
--编辑器后缀  
--给使用编辑器的用户看的备注，无实际作用
---@field suffix string
---@field support_range number
--标签  
--用于对物体的分类处理。为单位贴上标签后可以对其进行更方便的关系，例如编写游戏逻辑：杀死所有拥有XX标签的单位
---@field tags any[]
--主题  
---@field theme number
---@field title_bg_opacity number
---@field title_bg_scale number
---@field title_font_type string
---@field title_scale number
---@field title_text_size number
---@field turn_speed number
--主类型  
--单位类型决定了这类单位的一些特性，包括其可编辑的属性和某些属性的默认值。
---@field type number
--UID  
---@field uid string
---@field unit_hold_angle_speed number
---@field unit_title string
---@field use_base_tint_color boolean
--使用简易小地图头像  
--简易小地图头像的表现为一个小点。简易小地图头像的绘制性能消耗相比普通小地图头像更小，如果地图上会出现大量的该类型单位，建议使用简易小地图头像。
---@field use_simple_mini_map_icon boolean
--法术吸血数值  
--造成法术伤害后可以恢复自身生命值
---@field vampire_mag number
--法术吸血(%)  
--造成法术伤害后可以恢复自身生命值
---@field vampire_mag_grow number
--物理吸血数值  
--造成物理伤害后可以恢复自身生命值
---@field vampire_phy number
--物理吸血(%)  
--造成物理伤害后可以恢复自身生命值
---@field vampire_phy_grow number
--立绘  
---@field vect_drawing number
--视野类型  
--单位与战争迷雾相关的一些属性
---@field view_type number
--夜晚视野  
--单位在夜晚可以看到（驱散战争迷雾）的范围
---@field vision_night number
---@field vision_night_grow number
--白天视野  
--单位在白天可以看到（驱散战争迷雾）的范围
---@field vision_rng number
---@field vision_rng_grow number
--扇形视野白天夹角  
--单位在白天拥有的扇形视野夹角。
---@field vision_sector_angle_day number
---@field vision_sector_angle_day_grow number
--扇形视野夜晚夹角  
--单位在夜晚拥有的扇形视野夹角。
---@field vision_sector_angle_night number
---@field vision_sector_angle_night_grow number
--扇形视野夜晚半径  
--单位在夜晚拥有的扇形视野半径。
---@field vision_sector_night number
---@field vision_sector_night_grow number
--扇形视野白天半径  
--单位在白天拥有的扇形视野半径。
---@field vision_sector_rng number
---@field vision_sector_rng_grow number
--真实视野  
--单位所能侦测到隐身单位的范围
---@field vision_true number
--单位所能侦测到隐身单位的范围
---@field vision_true_grow number
--行走  
--行走状态下会播放的动作
---@field walk_anim string

---@class Object.Unit.Kv

---@class Object.Unit.SimpleCommonAtk
---@field ability_animations any[]
--后摇时长  
---@field ability_bw_point number
--前摇时长  
---@field ability_cast_point number
---@field attack_trajectory Object.Unit.SimpleCommonAtk.AttackTrajectory
---@field cast_effect_list any[]
---@field cast_sound number
---@field critical_anim string
---@field damage any[]
---@field damage_type number
--索敌条件 - 阵营  
---@field filter_condition_camp number
--索敌条件 - 类型  
---@field filter_condition_type number
---@field hit_effect Object.Unit.SimpleCommonAtk.HitEffect
---@field hit_sound number
---@field order_play_anim boolean
---@field order_play_reset_time number
---@field trajectory_radian number
---@field trajectory_speed number

---@class Object.Unit.SimpleCommonAtk.AttackTrajectory
---@field effect number
---@field follow_scale boolean
---@field scale number
---@field socket string

---@class Object.Unit.SimpleCommonAtk.HitEffect
---@field effect number
---@field follow_scale boolean
---@field scale number
---@field socket string

