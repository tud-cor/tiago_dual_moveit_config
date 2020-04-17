<?xml version="1.0" ?>
<!--This does not replace URDF, and is not an extension of URDF.
    This is a format for representing semantic information about the robot structure.
    A URDF file must exist for this robot as well, where the joints and the links that are referenced are defined
-->
<robot name="tiago_dual">
    <!--GROUPS: Representation of a set of joints and links. This can be useful for specifying DOF to plan for, defining arms, end effectors, etc-->
    <!--LINKS: When a link is specified, the parent joint of that link (if it exists) is automatically included-->
    <!--JOINTS: When a joint is specified, the child link of that joint (which will always exist) is automatically included-->
    <!--CHAINS: When a chain is specified, all the links along the chain (including endpoints) are included in the group. Additionally, all the joints that are parents to included links are also included. This means that joints along the chain and the parent joint of the base link are included in the group-->
    <!--SUBGROUPS: Groups can also be formed by referencing to already defined group names-->
@[if has_arm]@
    @[for side in ['left', 'right']]@
    <group name="arm_@(side)">
        <joint name="arm_@(side)_1_joint" />
        <joint name="arm_@(side)_2_joint" />
        <joint name="arm_@(side)_3_joint" />
        <joint name="arm_@(side)_4_joint" />
        <joint name="arm_@(side)_5_joint" />
        <joint name="arm_@(side)_6_joint" />
        <joint name="arm_@(side)_7_joint" />
        <joint name="arm_@(side)_tool_joint" />
    </group>
    <group name="arm_@(side)_torso">
        <group name="arm_@(side)" />
        <group name="torso" />
    </group>
    @[end for]@
    <group name="both_arms_torso">
        <group name="torso" />
        <group name="arm_right" />
        <group name="arm_left" />
    </group>
@[end if]@
    <group name="torso">
        <joint name="torso_lift_joint" />
    </group>

@[if end_effector_left == 'pal-gripper']@
    <group name="gripper_left">
        <link name="gripper_left_left_finger_link" />
        <link name="gripper_left_right_finger_link" />
        <link name="gripper_left_link" />
        <joint name="gripper_left_left_finger_joint" />
        <joint name="gripper_left_right_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper_left" parent_link="arm_left_tool_link" group="gripper_left" parent_group="arm_torso" />
@[end if]@

@[if end_effector_left == "schunk-wsg"]@
    <group name="gripper_left">
        <link name="gripper_left_left_finger_link" />
        <link name="gripper_left_right_finger_link" />
        <link name="gripper_left_link" />
        <joint name="gripper_left_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper_left" parent_link="arm_left_tool_link" group="gripper_left" parent_group="arm_torso" />
@[end if]@

@[if end_effector_left == "pal-hey5"]@
    <group name="hand_left">
        <joint name="hand_left_index_joint" />
        <joint name="hand_left_thumb_joint" />
        <joint name="hand_left_mrl_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="hand_left" parent_link="arm_left_tool_link" group="hand_left" />
    <!--PASSIVE JOINT: Purpose: this element is used to mark joints that are not actuated-->
    <passive_joint name="hand_left_grasping_fixed_joint" />
    <passive_joint name="hand_left_index_abd_joint" />
    <passive_joint name="hand_left_index_flex_1_joint" />
    <passive_joint name="hand_left_index_flex_2_joint" />
    <passive_joint name="hand_left_index_flex_3_joint" />
    <passive_joint name="hand_left_index_virtual_1_joint" />
    <passive_joint name="hand_left_index_virtual_2_joint" />
    <passive_joint name="hand_left_index_virtual_3_joint" />
    <passive_joint name="hand_left_little_abd_joint" />
    <passive_joint name="hand_left_little_flex_1_joint" />
    <passive_joint name="hand_left_little_flex_2_joint" />
    <passive_joint name="hand_left_little_flex_3_joint" />
    <passive_joint name="hand_left_little_virtual_1_joint" />
    <passive_joint name="hand_left_little_virtual_2_joint" />
    <passive_joint name="hand_left_little_virtual_3_joint" />
    <passive_joint name="hand_left_middle_abd_joint" />
    <passive_joint name="hand_left_middle_flex_1_joint" />
    <passive_joint name="hand_left_middle_flex_2_joint" />
    <passive_joint name="hand_left_middle_flex_3_joint" />
    <passive_joint name="hand_left_middle_virtual_1_joint" />
    <passive_joint name="hand_left_middle_virtual_2_joint" />
    <passive_joint name="hand_left_middle_virtual_3_joint" />
    <passive_joint name="hand_left_palm_joint" />
    <passive_joint name="hand_left_ring_abd_joint" />
    <passive_joint name="hand_left_ring_flex_1_joint" />
    <passive_joint name="hand_left_ring_flex_2_joint" />
    <passive_joint name="hand_left_ring_flex_3_joint" />
    <passive_joint name="hand_left_ring_virtual_1_joint" />
    <passive_joint name="hand_left_ring_virtual_2_joint" />
    <passive_joint name="hand_left_ring_virtual_3_joint" />
    <passive_joint name="hand_left_thumb_abd_joint" />
    <passive_joint name="hand_left_thumb_flex_1_joint" />
    <passive_joint name="hand_left_thumb_flex_2_joint" />
    <passive_joint name="hand_left_thumb_virtual_1_joint" />
    <passive_joint name="hand_left_thumb_virtual_2_joint" />
@[end if]@

@[if end_effector_right == 'pal-gripper']@
    <group name="gripper_right">
        <link name="gripper_right_left_finger_link" />
        <link name="gripper_right_right_finger_link" />
        <link name="gripper_right_link" />
        <joint name="gripper_right_left_finger_joint" />
        <joint name="gripper_right_right_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper_right" parent_link="arm_right_tool_link" group="gripper_right" parent_group="arm_torso" />
@[end if]@

@[if end_effector_right == "schunk-wsg"]@
    <group name="gripper_right">
        <link name="gripper_right_left_finger_link" />
        <link name="gripper_right_right_finger_link" />
        <link name="gripper_right_link" />
        <joint name="gripper_right_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper_right" parent_link="arm_right_tool_link" group="gripper_right" parent_group="arm_torso" />
@[end if]@

@[if end_effector_right == "pal-hey5"]@
    <group name="hand_right">
        <joint name="hand_right_index_joint" />
        <joint name="hand_right_thumb_joint" />
        <joint name="hand_right_mrl_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="hand_right" parent_link="arm_right_tool_link" group="hand_right" />
    <!--PASSIVE JOINT: Purpose: this element is used to mark joints that are not actuated-->
    <passive_joint name="hand_right_grasping_fixed_joint" />
    <passive_joint name="hand_right_index_abd_joint" />
    <passive_joint name="hand_right_index_flex_1_joint" />
    <passive_joint name="hand_right_index_flex_2_joint" />
    <passive_joint name="hand_right_index_flex_3_joint" />
    <passive_joint name="hand_right_index_virtual_1_joint" />
    <passive_joint name="hand_right_index_virtual_2_joint" />
    <passive_joint name="hand_right_index_virtual_3_joint" />
    <passive_joint name="hand_right_little_abd_joint" />
    <passive_joint name="hand_right_little_flex_1_joint" />
    <passive_joint name="hand_right_little_flex_2_joint" />
    <passive_joint name="hand_right_little_flex_3_joint" />
    <passive_joint name="hand_right_little_virtual_1_joint" />
    <passive_joint name="hand_right_little_virtual_2_joint" />
    <passive_joint name="hand_right_little_virtual_3_joint" />
    <passive_joint name="hand_right_middle_abd_joint" />
    <passive_joint name="hand_right_middle_flex_1_joint" />
    <passive_joint name="hand_right_middle_flex_2_joint" />
    <passive_joint name="hand_right_middle_flex_3_joint" />
    <passive_joint name="hand_right_middle_virtual_1_joint" />
    <passive_joint name="hand_right_middle_virtual_2_joint" />
    <passive_joint name="hand_right_middle_virtual_3_joint" />
    <passive_joint name="hand_right_palm_joint" />
    <passive_joint name="hand_right_ring_abd_joint" />
    <passive_joint name="hand_right_ring_flex_1_joint" />
    <passive_joint name="hand_right_ring_flex_2_joint" />
    <passive_joint name="hand_right_ring_flex_3_joint" />
    <passive_joint name="hand_right_ring_virtual_1_joint" />
    <passive_joint name="hand_right_ring_virtual_2_joint" />
    <passive_joint name="hand_right_ring_virtual_3_joint" />
    <passive_joint name="hand_right_thumb_abd_joint" />
    <passive_joint name="hand_right_thumb_flex_1_joint" />
    <passive_joint name="hand_right_thumb_flex_2_joint" />
    <passive_joint name="hand_right_thumb_virtual_1_joint" />
    <passive_joint name="hand_right_thumb_virtual_2_joint" />
@[end if]@


    <!--DISABLE COLLISIONS: By default it is assumed that any link of the robot could potentially come into collision with any other link in the robot. This tag disables collision checking between a specified pair of links. -->
    <disable_collisions link1="base_antenna_left_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="torso_fixed_column_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="torso_fixed_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_link" link2="wheel_left_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="wheel_right_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="base_sonar_01_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_sonar_02_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_sonar_03_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_left_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_right_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_left_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_right_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_front_right_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="head_2_link" reason="Adjacent" />
    <disable_collisions link1="head_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="head_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_fixed_column_link" link2="torso_fixed_link" reason="Default" />
    <disable_collisions link1="torso_fixed_column_link" link2="torso_lift_link" reason="Default" />
    <disable_collisions link1="torso_fixed_column_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_fixed_column_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_fixed_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="torso_fixed_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_fixed_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="wheel_left_link" link2="wheel_right_link" reason="Never" />

    <!-- Next disables generated with: https://gist.github.com/awesomebytes/18fe75b808c4c644bd3d -->
    <!-- Disabled because they are adjacent -->
    <!-- Tree looks like:
    base_footprint (NO COLLISION)
      base_link
      base_laser_link (NO COLLISION)
      base_antenna_left_link
      base_antenna_right_link
      base_imu_link (NO COLLISION)
      wheel_right_link
      wheel_left_link
        caster_front_right_1_link (NO COLLISION)
        caster_front_right_2_link
        caster_front_left_1_link (NO COLLISION)
        caster_front_left_2_link
        caster_back_right_1_link (NO COLLISION)
        caster_back_right_2_link
        caster_back_left_1_link (NO COLLISION)
        caster_back_left_2_link
        torso_fixed_link
          torso_lift_link
            head_1_link
              head_2_link
                xtion_link (NO COLLISION)
                xtion_optical_frame (NO COLLISION)
                  xtion_depth_frame (NO COLLISION)
                  xtion_depth_optical_frame (NO COLLISION)
                  xtion_rgb_frame (NO COLLISION)
                  xtion_rgb_optical_frame (NO COLLISION)
            arm_1_link
              arm_2_link
                arm_3_link
                  arm_4_link
                    arm_5_link
                      arm_6_link
                        arm_7_link
                          arm_tool_link




      torso_fixed_column_link
    base_cover_link (NO COLLISION)

     -->
    <disable_collisions link1="base_footprint" link2="base_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_laser_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_antenna_left_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_antenna_right_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_imu_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="wheel_right_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="wheel_left_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_right_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_left_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_right_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_left_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="torso_fixed_link" reason="Adjacent"/>
    <disable_collisions link1="torso_fixed_link" link2="torso_lift_link" reason="Adjacent"/>
    <disable_collisions link1="torso_lift_link" link2="head_1_link" reason="Adjacent"/>
    <disable_collisions link1="head_1_link" link2="head_2_link" reason="Adjacent"/>
    <disable_collisions link1="head_2_link" link2="xtion_link" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_depth_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_depth_frame" link2="xtion_depth_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_rgb_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_rgb_frame" link2="xtion_rgb_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="torso_fixed_column_link" reason="Adjacent"/>
    <disable_collisions link1="base_footprint" link2="base_cover_link" reason="Adjacent"/>

    <!-- Disabled because they don't have collision mesh so they can't collide between themselves-->
    <disable_collisions link1="base_laser_link" link2="base_footprint" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="xtion_rgb_optical_frame" reason="Never" />

    <!-- Disables because the second links doesn't have collision mesh -->
    <disable_collisions link1="base_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>

@[if has_arm]@
    @[for side in ['left', 'right']]@
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_2_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_4_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_5_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_6_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_7_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="torso_fixed_column_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_3_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_4_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_5_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_6_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_7_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="torso_fixed_column_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_4_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_5_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_6_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_7_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="arm_@(side)_5_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_4_link" link2="arm_@(side)_6_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="arm_@(side)_7_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="arm_@(side)_6_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_5_link" link2="arm_@(side)_7_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_5_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="arm_@(side)_7_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_6_link" link2="arm_@(side)_tool_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="arm_@(side)_tool_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="arm_@(side)_1_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="arm_@(side)_2_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="arm_@(side)_3_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="arm_@(side)_4_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="arm_@(side)_5_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="arm_@(side)_6_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="arm_@(side)_7_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="arm_@(side)_tool_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    @[end for]@
    <disable_collisions link1="arm_left_1_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_1_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_2_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_3_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_4_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_5_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_6_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_1_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_2_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_3_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_4_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_5_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="arm_left_tool_link" link2="arm_right_tool_link" reason="Never" />
@[end if]@

@[if end_effector_left in ['pal-gripper', 'schunk-wsg']]@
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="gripper_left_left_finger_link" link2="gripper_left_link" reason="Adjacent" />
    <disable_collisions link1="gripper_left_left_finger_link" link2="gripper_left_right_finger_link" reason="Default" />
    <disable_collisions link1="gripper_left_link" link2="gripper_left_right_finger_link" reason="Adjacent" />
    <disable_collisions link1="gripper_left_link" link2="gripper_left_right_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_left_link" link2="gripper_left_left_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_left_link" link2="gripper_left_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="head_1_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="gripper_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_right_finger_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_left_finger_link" link2="gripper_grasping_frame" reason="Never"/>

    @[for side in ['left','right']]@
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_left_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_left_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_left_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_left_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_left_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_left_grasping_frame" reason="Never"/>
    @[end for]@
@[end if]@

@[if end_effector_right in ['pal-gripper', 'schunk-wsg']]@
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="gripper_right_left_finger_link" link2="gripper_right_link" reason="Adjacent" />
    <disable_collisions link1="gripper_right_left_finger_link" link2="gripper_right_right_finger_link" reason="Default" />
    <disable_collisions link1="gripper_right_link" link2="gripper_right_right_finger_link" reason="Adjacent" />
    <disable_collisions link1="gripper_right_link" link2="gripper_right_right_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_right_link" link2="gripper_right_left_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_right_link" link2="gripper_right_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="head_1_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="gripper_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_right_finger_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_left_finger_link" link2="gripper_grasping_frame" reason="Never"/>

    @[for side in ['left','right']]@
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_right_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_right_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_right_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_right_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_right_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="gripper_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="gripper_right_grasping_frame" reason="Never"/>
    @[end for]@
@[end if]@

@[if end_effector_left == "pal-hey5"]@
    @[for side in ['left', 'right']]@
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_mrl_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_palm_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_mrl_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_safety_box" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_palm_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_safety_box" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_left_grasping_frame" reason="Never"/>
    @[end for]@
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_mrl_link" reason="Default" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_link" reason="Default" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_palm_link" reason="Default" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_palm_link" reason="Default" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_palm_link" reason="Default" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_link" reason="Default" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_safety_box" reason="Default" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_abd_link" reason="Default" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_flex_1_link" reason="Default" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_flex_2_link" reason="Default" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_link" reason="Default" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_thumb_virtual_2_link" reason="Default" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_index_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_mrl_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_thumb_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_index_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_index_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_index_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_index_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_middle_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_middle_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_middle_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_middle_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_ring_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_ring_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_ring_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_ring_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_little_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_little_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_little_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_little_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="base_laser_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_palm_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_abd_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_flex_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_index_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_abd_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_flex_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_little_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_abd_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_flex_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_middle_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_mrl_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_abd_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_flex_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_ring_virtual_3_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_abd_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_flex_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_1_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="hand_left_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_thumb_virtual_2_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_grasping_frame" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="hand_left_grasping_frame" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="hand_left_safety_box" link2="hand_left_palm_link" reason="Never" />
@[end if]@

@[if end_effector_right == "pal-hey5"]@
    @[for side in ['left', 'right']]@
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_mrl_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_palm_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_mrl_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_safety_box" reason="Adjacent" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_link" reason="Default" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_palm_link" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_safety_box" reason="Adjacent"/>
    <disable_collisions link1="arm_@(side)_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_4_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_5_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_6_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_7_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_@(side)_tool_link" link2="hand_right_grasping_frame" reason="Never"/>
    @[end for]@
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_mrl_link" reason="Default" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_link" reason="Default" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_palm_link" reason="Default" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_palm_link" reason="Default" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_palm_link" reason="Default" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_link" reason="Default" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_safety_box" reason="Default" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_abd_link" reason="Default" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_flex_1_link" reason="Default" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_flex_2_link" reason="Default" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_link" reason="Default" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_thumb_virtual_2_link" reason="Default" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_index_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_mrl_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_thumb_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_index_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_index_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_index_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_index_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_middle_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_middle_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_middle_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_middle_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_ring_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_ring_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_ring_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_ring_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_little_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_little_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_little_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_little_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="base_laser_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_palm_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_abd_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_flex_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_index_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_abd_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_flex_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_little_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_abd_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_flex_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_middle_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_mrl_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_abd_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_flex_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_ring_virtual_3_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_abd_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_flex_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_1_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="hand_right_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_thumb_virtual_2_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_grasping_frame" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="hand_right_grasping_frame" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="hand_right_safety_box" link2="hand_right_palm_link" reason="Never" />
@[end if]@

<!-- FT link disable collisions -->
@[if ft_sensor_left == "schunk-ft"]@
    <disable_collisions link1="wrist_left_ft_link" link2="arm_left_6_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="arm_left_7_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="arm_left_tool_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="arm_left_6_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="arm_left_7_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="arm_left_tool_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="wrist_left_ft_tool_link" reason="Adjacent" />

    @[if end_effector_left in ['pal-gripper', 'schunk-wsg']]@    
    <disable_collisions link1="wrist_left_ft_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="gripper_left_left_finger_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="gripper_left_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="gripper_left_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="gripper_left_left_finger_link" reason="Never" />
    @[end if]@

    @[if end_effector_left == "pal-hey5"]@
    <!-- Disable collisions with FT sensor -->    
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_safety_box" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_palm_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_palm_link" reason="Adjacent" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_tool_link" link2="hand_left_safety_box" reason="Never" />

    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_left_ft_link" link2="hand_left_safety_box" reason="Never" />
    @[end if]@
@[end if]@

<!-- FT link disable collisions -->
@[if ft_sensor_right == "schunk-ft"]@
    <disable_collisions link1="wrist_right_ft_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="arm_right_7_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="arm_right_6_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="arm_right_7_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="arm_right_tool_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="wrist_right_ft_tool_link" reason="Adjacent" />

    @[if end_effector_left in ['pal-gripper', 'schunk-wsg']]@    
    <disable_collisions link1="wrist_right_ft_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="gripper_right_left_finger_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="gripper_right_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="gripper_right_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="gripper_right_left_finger_link" reason="Never" />
    @[end if]@

    @[if end_effector_left == "pal-hey5"]@
    <!-- Disable collisions with FT sensor -->    
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_safety_box" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_palm_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_palm_link" reason="Adjacent" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_tool_link" link2="hand_right_safety_box" reason="Never" />

    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_right_ft_link" link2="hand_right_safety_box" reason="Never" />
    @[end if]@
@[end if]@

</robot>
