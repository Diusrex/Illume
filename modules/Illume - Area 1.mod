MOD V1.0        u   �   �   @  r   J  ����                                                                                                                    activate_pulse      �  activate_pulse     �  aoe_of_pulse       �  aoe_of_pulse       �  audio_log_1        �  audio_log_2        �  audio_log_3        �  audio_log_4        �  audio_log_5        �  audio_log_6     	   �  center_audio_log
   �  center_pulse       �  center_scannable   �  cmd_cam_switch     �  cmd_cam_switch     �  cmd_cam_topdown    �  cmd_cam_topdown    �  creaturepalcus     �  doorpalcus         �  encounterpalcus    �  end_module         �  end_module         �  enter_area         �  enter_area         �  exit_module_door   �  introforest        �  introforest        �  introforest        �  intro_line         �  itempalcus         �  keep_door_open     �  keep_door_open     �  log_1_sound         �  log_1_subtitles !   �  log_1_subtitles "   �  log_1_trigger   #   �  log_2_sound     $   �  log_2_subtitles %   �  log_2_subtitles &   �  log_2_trigger   '   �  log_3_sound     (   �  log_3_subtitles )   �  log_3_subtitles *   �  log_3_trigger   +   �  log_4_sound     ,   �  log_4_subtitles -   �  log_4_subtitles .   �  log_4_trigger   /   �  log_5_sound     0   �  log_5_subtitles 1   �  log_5_subtitles 2   �  log_5_trigger   3   �  log_6_sound     4   �  log_6_subtitles 5   �  log_6_subtitles 6   �  log_6_trigger   7   �  module          8   �  m_beacon        9   �  m_bunch         :   �  m_double        ;   �  m_drum          <   �  m_note          =   �  m_note_blue     >   �  m_note_brown    ?   �  m_note_green    @   �  m_note_red      A   �  m_note_white    B   �  m_note_yellow   C   �  m_triple        D   �  placeablepalcus E   �  play_audio_log  F   �  play_audio_log  G   �  pulse_effect    H   �  pulse_effect    I   �  puzzle_camera   J   �  Repute          K   �  s1_tree_branch  L   �  s2_beak_rock    M   �  s3_stuffed_doll N   �  s4_ceiling      O   �  s5_necklace     P   �  s6_plant_stalk  Q   �  s7_paintbrush   R   �  scan_sound_1    S   �  scan_sound_2    T   �  scan_sound_3    U   �  scan_sound_4    V   �  scan_sound_5    W   �  scan_sound_6    X   �  scan_sound_7    Y   �  soundpalcus     Z   �  storepalcus     [   �  support_color   \   �  support_effects ]   �  support_sound   ^   �  support_sound   _   �  temple_ambience `   �  topdown_camera  a   �  triggerpalcus   b   �  turn_on_effects c   �  turn_on_effects d   �  tutorial_end    e   �  tutorial_end    f   �  tutorial_start  g   �  tutorial_start  h   �  t_lit_a         i   �  t_lit_c         j   �  t_lit_d         k   �  t_lit_f         l   �  t_lit_g         m   �  t_unlit_a       n   �  t_unlit_c       o   �  t_unlit_d       p   �  t_unlit_f       q   �  t_unlit_g       r   �  waypointpalcus  s   �  weather_rain    t   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �      s  y  C  �   O
  +  �  �3  �  �<  �  rE  �  ?N  �  W  �  �_  S  ,g  O  {n  R  �u  [  (w  �  �y  �   lz  j  �{  �  ��  e  �  �  ��  �  <�  |  ��  �  F�  j  ��  4  �  (�  t e  q� �� dY �  >] T  �m .   �m =   �m �  �q 7  w {  � �  d� �  B� v  ��   Г �  �� �  �� X  ݟ   �� �  ѩ �  �� ;  � �  �� �  � �  ]� �  '�   =� �  � �  �� �  �� \  � �  �� V	  E� �   �  � �  % �  �! w  * .	  M3 /	  |< 1	  �E %	  �N /	  X 2	  3a �  �i H  { �  σ    ϓ �6  �� t#  �� �  �� a  8� �	  � �	  � �	  d �	  >! �	  �* �	  �4 �	  �> �  �B �  tF �  UJ �  6N �  R �  �U �  �Y �	  �c �  e �#  A�   U�    l� %  �� �  {� �  ^� .  �� 
  �� �  0� 1  a� 7  �� �  H� a  �� �  ,� �  �� �  2� �  �� �  8 �  � �  J �  �  �  \) �  �1 �  �3 �  NCS V1.0B         F ����  ��������   �����  ���� pulse_ready����   3   � hit_f1����   3        � hit_f1����   3����  ��������      hit_f1����   7����          )����  tutorial_end       ����        ?�  =���   ����   �    �      ����  center_pulse   @  �����  ��������  aoe_of_pulse       pulse_ready����   7 pulse_cooldown����   4����  ����,           ����    �  ����    ����       I ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����      pulse_ready����   7 ����  // Custom script for OnPlayerChat under:
// Edit -> Module Properties -> Events
//
// This script starts the chain of scripts that encompasses a pulse.
// No default script for OnPlayerChat.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

// The height at which pulses are initiated from objects.
const float height = 1.0;

void ReadyPulse(object oPC)
{
    SetLocalInt(oPC, "pulse_ready", TRUE);
}

void main()
{
    object oPC = GetPCChatSpeaker();
    location oPC_loc = GetLocation(oPC);

    if (GetLocalInt(oPC, "pulse_ready")) {
        // Used to execute a script that will instantly unfreeze player after
        // hitting F1 at end of tutorial sequence.
        if (GetLocalInt(oPC, "hit_f1") < 2) {
            int hit_f1 = GetLocalInt(oPC, "hit_f1");
            SetLocalInt(oPC, "hit_f1", hit_f1 + 1);
            if (hit_f1 == 0) ExecuteScript("tutorial_end", oPC);
        }

        // VFX_IMP_PC_PULSE
        TLVFXPillar(680, oPC_loc, 1, 0.1, height, 0.0);

        // This invisible object will act as the center
        // of the pulse as other objects are affected.
        object center = CreateObject(OBJECT_TYPE_PLACEABLE, "center_pulse", oPC_loc);

        ExecuteScript("aoe_of_pulse", center);

        // Unready pulse.
        SetLocalInt(oPC, "pulse_ready", FALSE);
        // The cooldown, in seconds, of the pulse.
        float delay = GetLocalFloat(oPC, "pulse_cooldown");
        // Apply cooldown.
        DelayCommand(delay, ReadyPulse(oPC));
    }

    // Ensure no text appears above player.
    SetPCChatMessage("");
}
NCS V1.0B  C      ?    cur_dist      8,               J      @   !  ,                 >   @   !  ,                �  >�  @   !  ,                �  >�  @   !  ,                �  ?   @   !  ,                s  ?   @   !  ,                H  ?@  @   !  ,                  ?`  @   !        ����  ���� cur_dist      4����  ����     ]����  ��������    "    �����       �����  �������� ���� !����     "���� ���� ?   !!     S can_be_pulsed����   3    )����  pulse_effect               ^����  ���� ���!���� ?   !����  ��������  cur_dist      8����    ?   %!              �     ����  // The invisible pulse object that uses this script is referenced by its
// Blueprint ResRef, and must have two local variables:
//     float dist     = eighth of max pulse distance (sizeEnd in custom .mdl
//                      file for the related pulse; use a little less than
//                      half of the specified sizeEnd for the max distance)
//     float cur_dist = dist
//
// Other useful visual pulse modifications (in the custom .mdl file):
//     colorStart: initial pulse color, in RGB format
//     colorEnd: final pulse color, in RGB format
//     event (float) detonate: (float) seconds after pulse initialization
//                             in which a circle will appear; there is
//                             one of these lines for every circle

const float DISTANCE = 0.625;
const int CHECKS = 8;
const float TIME = 2.0;

void ActivateNextCircle()
{
    float obj_dist = 0.0;
    float cur_dist = GetLocalFloat(OBJECT_SELF, "cur_dist");

    object oLoop = GetFirstObjectInArea();

    // Keep going till every object in the area has been checked.
    while (oLoop != OBJECT_INVALID)
    {
        obj_dist = GetDistanceBetween(OBJECT_SELF, oLoop);

        // If the object is within the distance range of the current check...
        if ((obj_dist <= cur_dist) && (obj_dist > cur_dist - DISTANCE)) {
            // And it can be pulsed...
            if (GetLocalInt(oLoop, "can_be_pulsed")) {
                // Then execute the effect script on it.
                ExecuteScript("pulse_effect", oLoop);
            }
        }

        oLoop = GetNextObjectInArea();
    }

    // This local variable has changed, so update it in order to
    // make successive checks work properly.
    cur_dist += DISTANCE;
    SetLocalFloat(OBJECT_SELF, "cur_dist", cur_dist);

    // Remove invisible object if this is the last check.
    if (cur_dist > (CHECKS * DISTANCE)) {
        DestroyObject(OBJECT_SELF);
    }

}

// Four checks for affected objects will occur as the pulse expands, at
// equal quarter intervals of time and distance.
void main()
{
    SetLocalFloat(OBJECT_SELF, "cur_dist", DISTANCE);

    DelayCommand(0.000 * TIME, ActivateNextCircle());
    DelayCommand(0.125 * TIME, ActivateNextCircle());
    DelayCommand(0.250 * TIME, ActivateNextCircle());
    DelayCommand(0.375 * TIME, ActivateNextCircle());
    DelayCommand(0.500 * TIME, ActivateNextCircle());
    DelayCommand(0.625 * TIME, ActivateNextCircle());
    DelayCommand(0.750 * TIME, ActivateNextCircle());
    DelayCommand(0.875 * TIME, ActivateNextCircle());
}
UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     4B    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 1   ^J            audio_log_1                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     0B    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 2   ^J            audio_log_2                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     �A    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 3   ^J            audio_log_3                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     $B    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 4   ^J            audio_log_4                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     �B    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 5   ^J            audio_log_5                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          +         ?                               K                          	           
                                             u                                                                           
      L                                                                                         P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .         /      
   -   �      .         /     �B    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Audio Log 6   ^J            audio_log_6                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      D   5   �  5     o     �   S      ����    5   
                          2         F                               W                          	           
                                                                                                                        
      X                    �                                                                     \          ]      !   ^      "   _      #   `      $   a      %   b      &   c      '   d      (   e      )   f      *   g      +   h       ,           -           .           /           0          1   i      2   j       3       
   4   k   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_CenterAudioLog   �        	   Audio Log   F9             center_audio_log                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   UTP V3.28      D   5   �  5     k   {  �   O      ����    5   
                          2         F                               S                          	           
                                                                                                                        
      T                    �                                                                     X          Y      !   Z      "   [      #   \      $   ]      %   ^      &   _      '   `      (   a      )   b      *   c      +   d       ,           -           .          /           0          1   e      2   f       3       
   4   g   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_CenterPulse   �           Pulse Center   F9             center_pulse                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   UTP V3.28      D   5   �  5     n   ~  �   R      ����    5   
                          1         E                               V                          	           
                                                                                                                        
      W                    �                                                                     [          \      !   ]      "   ^      #   _      $   `      %   a      &   b      '   c      (   d      )   e      *   f      +   g       ,           -           .           /           0          1   h      2   i       3       
   4   j   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_CenterScannable   �           Sensors   F9             center_scannable                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   NCS V1.0B  [         ����  ��������   �"     ����        cam_type      5����  ����    ����  9    ����  8    ����  7����  topdown#    ?�ff����      ;- ����  puzzle#    A@  ����         ����  9   ����  8   ����  7 ����  // Locks the player's camera to a set height depending on the trigger
// they've entered.

void main()
{
    // Determine if entering object is the PC.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC)) return;

    string cam_type = GetLocalString(OBJECT_SELF, "cam_type");

    LockCameraDirection(oPC, FALSE);
    LockCameraDistance(oPC, FALSE);
    LockCameraPitch(oPC, FALSE);

    if (cam_type == "topdown") SetCameraHeight(oPC, 1.3);
    else if (cam_type == "puzzle") SetCameraHeight(oPC, 12.0);

    LockCameraDirection(oPC, TRUE);
    LockCameraDistance(oPC, TRUE);
    LockCameraPitch(oPC, TRUE);
}
NCS V1.0B   �          ����  ����    ����  9    ����  8    ����  7    A�  A�  B�    -   ����  9   ����  8   ����  7 ����  // Locks the player's camera to a set position.

void main()
{
    object oPC = OBJECT_SELF;

    LockCameraDirection(oPC, FALSE);
    LockCameraDistance(oPC, FALSE);
    LockCameraPitch(oPC, FALSE);

    SetCameraFacing(90.0, 25.0, 20.0);

    LockCameraDirection(oPC, TRUE);
    LockCameraDistance(oPC, TRUE);
    LockCameraPitch(oPC, TRUE);
}
ITP V3.28   @   8  �   �	     
  _   k
    �  ,  ����                                                               (          0          <          L          T          \          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                              $         ,         4         <         D         L         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �         �         �         �                                                  %                 �         0         &        L         '                  (                  )                  *                  d         X1                    @@
               �          	         8                  9                  :                          l         G         "         H         #         I         $         J         %         1        �         2                  3                  4                  5                  6                                    �          2         ,        �         -         
         .                  �         1         8                  ;        �         <                  =                  >                  +         /         ?                  /                  #        �         
                  B                  �                   D                  C                  k                   E         !         K        �                   &                   '                   (                   *                   )         !          +         #          ,         �          -                                                
               %           @@
      .   
      9         K           @@
      T         !                  "                  #                  $                  L         .   MAIN            STRREF          LIST            ID              RESREF          CR              FACTION         NAME            lion001   Hostile   Assassin Vinesvines001   Hostile   Assassin Vinesvines002   Hostile                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �         .   7   ?            
                           %   &                  	                                                                !   "   #   $      '   (   )   *   +   ,   -      /   0   1   2   3   4   5   6      8   ;   <   =   >      9   :   ITP V3.28      �      0     �  %   �  l   !  D   ����                                                    $          ,          4          <          D          L          T          \          d                                                            (   
                         !                  "                  #                  $                  N                  O        0         P                  �          	         Q                  R            MAIN            STRREF          LIST            ID              NAME            RESREF             Exit Module Doorexit_module_door                        	   
                                                               	                              
            ITP V3.28      �      �             X   t  4   ����                                                               (          0          8          @          H          P                       �                  �         	         �                  �                                                       !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                        	   
   NCS V1.0B  �      @   ����  ����  �   �����  ����,           ;D�� $  �  ���� ?   !  ����  MR_Intro_Forest#    C,             Illume - Area 2 �  ����      �- ����  MR_Melody_Puzzle#    C,             Illume - Area 3 �  ����      i- ����  MR_Floor_LU_Puzzle#    C,             Illume - Area 4 �  ����      - ����  MR_Forest_Reprise#    C,             Illume - Area 5 �  ����       �- ����  MR_Echo_Puzzle#    C,             Illume - Area 6 �  ����       ?- ,             Illume - Area 7 �  ����    ����  // Load the next module (by filename) depending
// on the tag of the current module.

void main()
{
    float time = 2.0;
    string tag = GetTag(GetModule());

    DelayCommand(time * 0.5, FadeToBlack(GetFirstPC(), FADE_SPEED_SLOWEST));

    if (tag == "MR_Intro_Forest") {
        DelayCommand(time, StartNewModule("Illume - Area 2"));
    }

    else if (tag == "MR_Melody_Puzzle") {
        DelayCommand(time, StartNewModule("Illume - Area 3"));
    }

    else if (tag == "MR_Floor_LU_Puzzle") {
        DelayCommand(time, StartNewModule("Illume - Area 4"));
    }

    else if (tag == "MR_Forest_Reprise") {
        DelayCommand(time, StartNewModule("Illume - Area 5"));
    }

    else if (tag == "MR_Echo_Puzzle") {
        DelayCommand(time, StartNewModule("Illume - Area 6"));
    }

    else DelayCommand(time, StartNewModule("Illume - Area 7"));
}
NCS V1.0B  �         ����  ��������   �"    G    ����  ��������   �"     ����           ����  turn_on_effects  ,           (����  cmd_cam_topdown    ?     ,           (����  cmd_cam_topdown    ?�        pulse_ready����   7@    pulse_cooldown����   8    hit_f1����   7       �  �����  ����    ���� ����      �����     �����  ��������  Forest#    4     WeatherRain  �����  ����    S- ����  Temple#    7     TempleAmbience  �����  ����    ����  � ����  // Custom script for OnEnter under:
// Edit -> Area Properties -> Events
//
// THIS SCRIPT MUST BE SET FOR EVERY MODULE IN THE GAME.
//
// This script applies any necessary effects and local variables to PC
// upon module start, as well as runs any necessary scripts. No
// default script for OnEnter.

void WaitForF1Hit(object oPC, effect eFreeze);

void main()
{
    // Determine if entering object is the PC. If not, this script may have
    // been called on the PC by another script.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC)) {
        oPC = OBJECT_SELF;
        if (!GetIsPC(oPC)) return;
    }

    // Turn on all of the continuous effects in the area.
    ExecuteScript("turn_on_effects", oPC);

    // Lock the camera after a small amount of time.
    DelayCommand(0.5, ExecuteScript("cmd_cam_topdown", oPC));
    DelayCommand(1.5, ExecuteScript("cmd_cam_topdown", oPC));

    // TRUE if pulse can currently be used.
    SetLocalInt(oPC, "pulse_ready", TRUE);

    // Wait time (in seconds) inbetween pulse calls.
    SetLocalFloat(oPC, "pulse_cooldown", 2.0);

    SetLocalInt(oPC, "hit_f1", 1);

    // The effect that makes it seem like the environment is really dark.
    effect darknessEffect = EffectVisualEffect(VFX_DUR_BLIND);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, darknessEffect, oPC);

    string tagArea = GetTag(GetArea(oPC));
    object ambience;

    // Play the rain sound only in the forest modules.
    if (tagArea == "Forest") ambience = GetObjectByTag("WeatherRain");
    else if (tagArea == "Temple") ambience = GetObjectByTag("TempleAmbience");

    SoundObjectPlay(ambience);
}

void WaitForF1Hit(object oPC, effect eFreeze)
{
    int hit_f1 = GetLocalInt(oPC, "hit_f1");

    if (hit_f1 == 1) DelayCommand(0.1, WaitForF1Hit(oPC, eFreeze));
    else RemoveEffect(oPC, eFreeze);
}
UTD V3.28      D   3   �  3   �  �   h  �   4      ����    3   
                          8         L                               ]                          	          
                                                                                                                         
      ^                              <         <                                                   b          q      !   r      "   s      #   t      $   u      %   v      &   w      '   �      (   �      )   �      *   �      +   �   
   ,   �       -          .          /         0   �       1       
   2   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         LinkedTo        LinkedToFlags   LoadScreenID    GenericType_New OnFailToOpen    PaletteID       Comment            Exit_Module_Door    �            Exit Module Door   t#             exit_module_door     keep_door_open      
end_module                                          	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   ARE V3.28   "  �  t  @�  4   ��  L   ̚  �-  ��  �  ����    *      �   
      �   
      �   
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
      	  
      @	  
      h	  
      �	  
      �	  
      �	  
      
  
      0
  
      X
  
      �
  
      �
  
      �
  
      �
  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
        
      8  
      `  
      �  
      �  
      �  
         
      (  
      P  
      x  
      �  
      �  
      �  
        
      @  
      h  
      �  
      �  
      �  
        
      0  
      X  
      �  
      �  
      �  
      �  
         
      H  
      p  
      �  
      �  
      �  
         
      8   
      `   
      �   
      �   
      �   
       !  
      (!  
      P!  
      x!  
      �!  
      �!  
      �!  
      "  
      @"  
      h"  
      �"  
      �"  
      �"  
      #  
      0#  
      X#  
      �#  
      �#  
      �#  
      �#  
       $  
      H$  
      p$  
      �$  
      �$  
      �$  
      %  
      8%  
      `%  
      �%  
      �%  
      �%  
       &  
      (&  
      P&  
      x&  
      �&  
      �&  
      �&  
      '  
      @'  
      h'  
      �'  
      �'  
      �'  
      (  
      0(  
      X(  
      �(  
      �(  
      �(  
      �(  
       )  
      H)  
      p)  
      �)  
      �)  
      �)  
      *  
      8*  
      `*  
      �*  
      �*  
      �*  
       +  
      (+  
      P+  
      x+  
      �+  
      �+  
      �+  
      ,  
      @,  
      h,  
      �,  
      �,  
      �,  
      -  
      0-  
      X-  
      �-  
      �-  
          ����      ����      1   
                
         $   
      0                          	          
                                                                 <<<       xxx                 <<<                             
                     4B                            d                   d                  w                   !         "         #         $   4      %   C      &   D      '   E      (   F      )         *   y      +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   #     +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   X      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   B      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   !     +          ,           -           .           /          0          1          2          3         *   "     +          ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3      ID              Creator_ID      Version         Tag             Name            ResRef          Comments        Expansion_List  Flags           ModSpotCheck    ModListenCheck  MoonAmbientColorMoonDiffuseColorMoonFogAmount   MoonFogColor    MoonShadows     SunAmbientColor SunDiffuseColor SunFogAmount    SunFogColor     SunShadows      IsNight         LightingScheme  ShadowOpacity   FogClipDist     SkyBox          DayNightCycle   ChanceRain      ChanceSnow      ChanceLightning WindPower       LoadScreenID    PlayerVsPlayer  NoRest          Width           Height          OnEnter         OnExit          OnHeartbeat     OnUserDefined   Tileset         Tile_List       Tile_ID         Tile_OrientationTile_Height     Tile_MainLight1 Tile_MainLight2 Tile_SrcLight1  Tile_SrcLight2  Tile_AnimLoop1  Tile_AnimLoop2  Tile_AnimLoop3     Forest   ����          Area 1introforest    tutorial_start   jac01                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   	  	  	  	  	  	  	  	  	  		  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	   	  !	  "	  #	  $	  %	  &	  '	  (	  )	  *	  +	  ,	  -	  .	  /	  0	  1	  2	  3	  4	  5	  6	  7	  8	  9	  :	  ;	  <	  =	  >	  ?	  @	  A	  B	  C	  D	  E	  F	  G	  H	  I	  J	  K	  L	  M	  N	  O	  P	  Q	  R	  S	  T	  U	  V	  W	  X	  Y	  Z	  [	  \	  ]	  ^	  _	  `	  a	  b	  c	  d	  e	  f	  g	  h	  i	  j	  k	  l	  m	  n	  o	  p	  q	  r	  s	  t	  u	  v	  w	  x	  y	  z	  {	  |	  }	  ~	  	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	   
  
  
  
  
  
  
  
  
  	
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
  !
  "
  #
  $
  %
  &
  '
  (
  )
  *
  +
  ,
  -
  .
  /
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
  :
  ;
  <
  =
  >
  ?
  @
  A
  B
  C
  D
  E
  F
  G
  H
  I
  J
  K
  L
  M
  N
  O
  P
  Q
  R
  S
  T
  U
  V
  W
  X
  Y
  Z
  [
  \
  ]
  ^
  _
  `
  a
  b
  c
  d
  e
  f
  g
  h
  i
  j
  k
  l
  m
  n
  o
  p
  q
  r
  s
  t
  u
  v
  w
  x
  y
  z
  {
  |
  }
  ~
  
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s      !                          	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  GIC V3.28   _   �  k   �	     `
    q  X   �  �  ����4   	                                 $         ,               	         	         	         	         	         	         	         	         	         	         	         	         	         	          	   !      	   "      	   #      	   $      	   %      	   &      	   '      	   (      	   )      	   *      	   +      	   ,      	   -      	   .      	   /      	   0      	   1      	   2      	   3      	   4      	   5      	   6      	   7      	   8      	   9      	   :      	   ;      	   <      	   =      	   >      	   ?      	   @      	   A      	   B      	   C      	   D      	   E      	   F      	   G      	   H      	   I      	   J      	   K      	   L      	   M      	   N      	   O      	   P      	   Q      	   R      	   S      	   T      	   U      	   V      	   W      	   X      	   Y      	   Z      	   [      	   \      	   ]      	   ^      	   _      	   `      	   a      	   b      	   c      	   d      	   e      	   f      	   g      	   h      	   i      	   j                          
                                               
                   
                   
                   
               (         ,   
            	   4      
   8   
         
         
          
      $   
      (   
      ,   
      0   
      4   
      8   
      <   
      @   
      D   
      H   
      L   
      P   
      T   
      X   
      \   
      `   
      d   
      h   
      l   
      p   
      t   
      x   
      |   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
         
        
        
        
        
        
        
        
         
      $  
      (  
      ,  
      0  
      4  
      8  
      <  
      @  
      P  
      `  
      k  
      v  
      �  
      �  
      �  
      �  
      �  
      �  
      �  
        
        Creature List   Door List       Comment         Encounter List  List            SoundList       PlayInToolset   StoreList       TriggerList     WaypointList    Placeable List                                                                                                                                                                                                                                                                                                                                     Desert Rocks   Desert Rocks   Boulder   Boulder   Desert Boulder 2   Desert Boulder 2   Desert Boulder 2   Desert Boulder 2   Boulder   Boulder   Desert Boulder   Desert Boulder 2   Boulder                             	   
                                                                                       X         	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   GIT V3.28   �  X  �  P/ y   �6 �9  �p �^  3� �  ����    
   d   (   	      L   5                [         �         w         �         �         d         �         �  #       \        h        t        �        �     	   �  8       x         �         �     	   �  8       |         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �	         �	         �	         �	         �	     	   �	  8       �
         �
         �
     	   �
  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �         �              	     8       �                                     $     	   0  8                         (         4         @     	   L  8       ,         8         D         P         \     	   h  8       H         T         `         l         x     	   �  8       d         p         |     	   �  8       h         t         �     	   �  8       l         x         �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �          �          �      	   �   8       �!         �!         �!     	   �!  8       �"         �"         �"     	    #  8       �#         �#         �#     	   $  8       �$         �$         �$     	   %  8       �%         �%          &     	   &  8       �&         �&         '     	   '  8       �'         �'         (     	   (  8       �(          )         )     	   )  8       �)         *         *     	   *  8       �*         +         +     	    +  8        ,         ,         ,         $,         0,     	   <,  8       -         (-         4-         @-         L-     	   X-  8       8.         D.         P.         \.         h.     	   t.  8       T/         `/         l/         x/         �/     	   �/  8       p0         |0         �0         �0         �0     	   �0  8       �1         �1         �1         �1         �1     	   �1  8       �2         �2         �2         �2         �2     	   �2  8       �3         �3         �3     	   �3  8       �4         �4         �4     	   �4  8       �5         �5         �5     	   �5  8       �6         �6         �6     	   �6  8       �7         �7         �7         �7         8     	   8  8       �8         �8         9         9          9     	   ,9  8       :         :         $:         0:         <:     	   H:  8       (;         4;         @;         L;         X;     	   d;  8       D<         P<         \<         h<         t<     	   �<  8       `=         l=         x=     	   �=  8       d>         p>         |>     	   �>  8       h?         t?         �?         �?         �?     	   �?  8       �@         �@         �@     	   �@  8       �A         �A         �A         �A         �A     	   �A  8       �B         �B         �B         �B         �B     	   �B  8       �C         �C         �C         �C         �C     	   �C  8       �D         �D         �D          E         E     	   E  8       �E         F         F         F         (F     	   4F  8       G          G         ,G         8G         DG     	   PG  8       0H         <H         HH         TH         `H     	   lH  8       LI         XI         dI         pI         |I     	   �I  8       hJ         tJ         �J         �J         �J     	   �J  8       �K         �K         �K         �K         �K     	   �K  8       �L         �L         �L         �L         �L     	   �L  8       �M         �M         �M         �M         �M     	   �M  8       �N         �N         �N         �N         O     	   O  8       �O          P         P         P         $P     	   0P  8       Q         Q         (Q         4Q     	   @Q  8        R         ,R         8R         DR     	   PR  7   	   ,S  7   	   T  7   	   �T  7   	   �U  7   	   �V  7   	   xW  7   	   TX  7   	   0Y  7   	   Z  7   	   �Z  7   	   �[  7   	   �\  7   	   |]  8       \^         h^         t^         �^         �^                                                                                                  	          
                
                         8         L                               ]                                                                                                                                                        !      
   "   ^       #          $          %   <      &   <       '          (          )           *          +   b      ,   q      -   r      .   s      /   t      0   u      1   v      2   w      3   �      4   �      5   �      6   �      7   �   
   8   �       9          :          ;         <   �      =     �B   >   ��B   ?   ffA   @      �   A         B         C      
      �         �         �       D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   (      X   �      Y          Z   ̹�B   [   ]�A   \    ��
      �         �               D           E           F          G           H           I          J     �?   K      A   L     �?   M          N          O          P          Q           R         S           T          U   $       V          W   0      X        Y          Z   tEB   [   ��@   \    ��
              '        E      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   8      X   P     Y          Z   ��*B   [   ���@   \    ��
      [        k        �      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   @      X   �     Y          Z   ,�A   [   �\5B   \     ��   ]   H      ^   L   
      �        �     _   �                          `          a       
   "   �  
   8   �      9          :                    b                                                                           !          .   �     4   �     7   �     c   �     d   �     e   �     f         g   T   
   h        b         i         Z   ��zB   [   jGB   \          j          k          l          m   \      n   �e��   o   ����   p   33��   n   (�uA   o   +�   p   33��   n   �j�A   o   ���   p   33��   n          o          p   33��   q   p      r   t   
                      @        T                              ]                                                                                                                                                        !       
   "   ^      #          $        %         &          '          (          )           *          +   b     ,   c     -   d     .   e     /   f     0   g     1   h     2   i     3   j     4   k     5   l     6   m     7   n     g   �  
   h   o     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �o�B   >   �.B   ?     ��   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -         .        /        0        1        2        3        4        5        6   	     7   
     g   �  
   h        b         i      
   h        b      
   i   *  
   h   4     b      
   i   =      s           t           u           b           v          w   E     x   F     =   �U�B   >   �m	B   ?    T�=   @      �
      G        S        x        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   m:�B   >   *OB   ?     ��   @      �
      �        �                &                              .                                                                                                                                                        !       
   "   /      #          $        %         &          '          (          )           *          +   3     ,   4     -   5     .   6     /   7     0   8     1   9     2   :     3   ;     4   <     5   =     6   >     7   ?     g     
   h   @     b         i      
   h   Q     b      
   i   _  
   h   h     b      
   i   q      s           t           u           b           v          w   {     x   |     =   ���B   >   92B   ?   l<O<   @      �
      }        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i         s           t           u           b           v          w        x        =   ���B   >   :�NB   ?     ��   @      �
                      G        [                              g                                                                                                                                                        !       
   "   h      #          $   v     %         &          '          (          )           *          +   l     ,   m     -   n     .   o     /   p     0   q     1   r     2   s     3   t     4   u     5   v     6   w     7   x     g   (  
   h   y     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   V�B   >   �x3B   ?   @LG=   @      �
      �        �                                              !                                                                                                                                                        !       
   "   "      #          $        %         &          '          (          )           *          +   &     ,   '     -   (     .   )     /   *     0   +     1   ,     2   -     3   .     4   /     5   0     6   1     7   2     g   @  
   h   3     b         i      
   h   D     b      
   i   R  
   h   [     b      
   i   d      s           t           u           b           v          w   n     x   o     =   ��eB   >   ?<B   ?     �5   @      �
      p        z        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   P  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w        x        =   6�dB   >   B!B   ?      �   @      �
                      4        H                              O                                                                                                                                                        !       
   "   P      #          $   u     %         &          '          (          )           *          +   T     ,   U     -   V     .   W     /   X     0   Y     1   Z     2   [     3   \     4   ]     5   ^     6   _     7   `     g   `  
   h   a     b         i      
   h   r     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   XiqB   >   _�A   ?     ��   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3         4        5        6        7        g   p  
   h        b         i      
   h        b      
   i   $  
   h   ,     b      
   i   5  
   h   >     b         i     �@
   h   F     b      
   i   O      s           t           u           b           v          w   _     x   `     =   jD�B   >   ^�B   ?      �   @      �
      a        m        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��B   >   ��B   ?      �   @      �
      �        	        ,	        @	                              H	                                                                                                                                                        !       
   "   I	      #          $        %         &          '          (          )           *          +   M	     ,   N	     -   O	     .   P	     /   Q	     0   R	     1   S	     2   T	     3   U	     4   V	     5   W	     6   X	     7   Y	     g   �  
   h   Z	     b         i      
   h   k	     b      
   i   y	  
   h   �	     b      
   i   �	      s           t           u           b           v          w   �	     x   �	     =   �gB   >   ���A   ?   ���<   @      �
      �	        �	        �	        �	                              �	                                                                                                                                                        !       
   "   �	      #          $   v     %         &          '          (          )           *          +   �	     ,   �	     -   �	     .   �	     /   �	     0   �	     1   �	     2   �	     3   �	     4   �	     5   �	     6   �	     7   �	     g   �  
   h    
     b         i      
   h   
     b      
   i   
  
   h   '
     b      
   i   0
  
   h   :
     b         i     �@
   h   B
     b      
   i   K
      s           t           u           b           v          w   [
     x   \
     =   ��B   >   !߀A   ?      �   @      �
      ]
        g
        �
        �
                              �
                                                                                                                                                        !       
   "   �
      #          $   v     %         &          '          (          )           *          +   �
     ,   �
     -   �
     .   �
     /   �
     0   �
     1   �
     2   �
     3   �
     4   �
     5   �
     6   �
     7   �
     g   �  
   h   �
     b         i      
   h   �
     b      
   i   �
  
   h   �
     b      
   i   �
  
   h   �
     b         i     �@
   h        b      
   i   
      s           t           u           b           v          w        x        =   �t�B   >   q?B   ?     ��   @      �
                       H        \                              g                                                                                                                                                        !       
   "   h      #          $   v     %         &          '          (          )           *          +   l     ,   m     -   n     .   o     /   p     0   q     1   r     2   s     3   t     4   u     5   v     6   w     7   x     g   �  
   h   y     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   =�B   >   �P�A   ?   9��   @      �
      �        �                                              "                                                                                                                                                        !       
   "   #      #          $   v     %         &          '          (          )           *          +   '     ,   (     -   )     .   *     /   +     0   ,     1   -     2   .     3   /     4   0     5   1     6   2     7   3     g   �  
   h   4     b         i      
   h   E     b      
   i   S  
   h   [     b      
   i   d  
   h   n     b         i     �@
   h   v     b      
   i         s           t           u           b           v          w   �     x   �     =   ޢ�B   >   ��A   ?      2   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   	     b      
   i     
   h        b      
   i   (  
   h   3     b         i     �@
   h   ;     b      
   i   D      s           t           u           b           v          w   T     x   U     =   �%UB   >   Ry�@   ?      �   @      �
      V        b        �        �                              �                                                                                 �                                                                     !       
   "   �      #          $   �     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g      
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �]CB   >   3XA   ?      �   @      �
      �        �        $        8                              A                                                                                                                                                        !       
   "   B      #          $        %         &          '          (          )           *          +   F     ,   G     -   H     .   I     /   J     0   K     1   L     2   M     3   N     4   O     5   P     6   Q     7   R     g   0  
   h   S     b         i      
   h   d     b      
   i   r  
   h   |     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �k�B   >   o��A   ?      �   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   @  
   h   �     b         i      
   h        b      
   i     
   h        b      
   i   &  
   h   /     b         i     �@
   h   7     b      
   i   @      s           t           u           b           v          w   P     x   Q     =   #�rB   >   ZG�A   ?   l� >   @      �
      R        \        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   X  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i         s           t           u           b           v          w        x        =   �fpB   >   y��A   ?   9��   @      �
                      I        ]                              j                                                                                                                                                        !       
   "   k      #          $   v     %         &          '          (          )           *          +   o     ,   p     -   q     .   r     /   s     0   t     1   u     2   v     3   w     4   x     5   y     6   z     7   {     g   p  
   h   |     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��^B   >   �B�A   ?     ��   @      �
      �        �        	                                      %                                                                                                                                                        !       
   "   &      #          $        %         &          '          (          )           *          +   *     ,   +     -   ,     .   -     /   .     0   /     1   0     2   1     3   2     4   3     5   4     6   5     7   6     g   �  
   h   7     b         i      
   h   H     b      
   i   V  
   h   _     b      
   i   h      s           t           u           b           v          w   r     x   s     =   tmB   >   ��KB   ?          @      �
      t        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i         s           t           u           b           v          w        x        =   �~B   >   .�A   ?      �   @      �
                      A        U                              ^                                                                                 �                                                                     !       
   "   _      #          $   �     %         &          '          (          )           *          +   c     ,   d     -   e     .   f     /   g     0   h     1   i     2   j     3   k     4   l     5   m     6   n     7   o     g   �  
   h   p     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��B   >   ��A   ?   Պg=   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +         ,        -        .        /        0        1        2        3        4   	     5   
     6        7        g   �  
   h        b         i      
   h        b      
   i   ,  
   h   6     b      
   i   ?      s           t           u           b           v          w   G     x   H     =   :��B   >   kٵA   ?      �   @      �
      I        T        x        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �O[B   >   �GGB   ?      6   @      �
      �        �                (                              1                                                                                                                                                        !       
   "   2      #          $        %         &          '          (          )           *          +   6     ,   7     -   8     .   9     /   :     0   ;     1   <     2   =     3   >     4   ?     5   @     6   A     7   B     g   �  
   h   C     b         i      
   h   T     b      
   i   b  
   h   l     b      
   i   u      s           t           u           b           v          w   }     x   ~     =   ��B   >    qB   ?     ж   @      �
              �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h        b      
   i         s           t           u           b           v          w        x        =   ��B   >   x�pB   ?      �   @      �
              '        L        `                              i                                                                                 �                                                                     !       
   "   j      #          $   �     %         &          '          (          )           *          +   n     ,   o     -   p     .   q     /   r     0   s     1   t     2   u     3   v     4   w     5   x     6   y     7   z     g   �  
   h   {     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ���B   >   5�xB   ?    �@=   @      �
      �        �        �        �                                                                                                               �                                                                     !       
   "         #          $   �     %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3        4        5        6        7        g     
   h        b         i      
   h   )     b      
   i   7  
   h   A     b      
   i   J      s           t           u           b           v          w   S     x   T     =   ;,�B   >   �|B   ?      5   @      �
      U        _        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   x��B   >   B"SB   ?     ��   @      �
      �        �                -                              4                                                                                                                                                        !       
   "   5      #          $   u     %         &          '          (          )           *          +   9     ,   :     -   ;     .   <     /   =     0   >     1   ?     2   @     3   A     4   B     5   C     6   D     7   E     g   (  
   h   F     b         i      
   h   W     b      
   i   e  
   h   m     b      
   i   v      s           t           u           b           v          w   �     x   �     =   g�GB   >   ?�>B   ?    G�<   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   8  
   h   �     b         i      
   h   �     b      
   i   �  
   h        b      
   i         s           t           u           b           v          w        x        =   ��KB   >   z�2B   ?     ��   @      �
              $        G        [                              b                                                                                                                                                        !       
   "   c      #          $   u     %         &          '          (          )           *          +   g     ,   h     -   i     .   j     /   k     0   l     1   m     2   n     3   o     4   p     5   q     6   r     7   s     g   H  
   h   t     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �DB   >   ��"B   ?    ��:   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -         .        /        0        1        2        3        4        5        6   	     7   
     g   X  
   h        b         i      
   h        b      
   i   *  
   h   2     b      
   i   ;      s           t           u           b           v          w   F     x   G     =    �/B   >   �"B   ?   @��=   @      �
      H        R        u        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   h  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   lt&B   >   `ECB   ?    ��:   @      �
      �        �                                               '                                                                                                                                                        !       
   "   (      #          $   u     %         &          '          (          )           *          +   ,     ,   -     -   .     .   /     /   0     0   1     1   2     2   3     3   4     4   5     5   6     6   7     7   8     g   x  
   h   9     b         i      
   h   J     b      
   i   X  
   h   `     b      
   i   i      s           t           u           b           v          w   t     x   u     =   fB   >   ��)B   ?     ��   @      �
      v        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h        b      
   i     
   h        b         i     �@
   h        b      
   i   &      s           t           u           b           v          w   6     x   7     =   l�B   >   EEbB   ?   @��>   @      �
      8        B        m        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ���B   >   �eB   ?    �d>   @      �
      �                2        F                              S                                                                                                                                                        !       
   "   T      #          $   v     %         &          '          (          )           *          +   X     ,   Y     -   Z     .   [     /   \     0   ]     1   ^     2   _     3   `     4   a     5   b     6   c     7   d     g   �  
   h   e     b         i      
   h   v     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �O�B   >   4�>B   ?     ��   @      �
      �        �        �                                                                                                                                                                                              !       
   "         #          $   v     %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3        4         5   !     6   "     7   #     g   �  
   h   $     b         i      
   h   5     b      
   i   C  
   h   K     b      
   i   T  
   h   ]     b         i     �@
   h   e     b      
   i   n      s           t           u           b           v          w   x     x   y     =   ;��B   >   &BB   ?     ��   @      �
      z        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h        b      
   i     
   h        b         i     �@
   h   !     b      
   i   *      s           t           u           b           v          w   :     x   ;     =   U)�B   >   P�UB   ?     ��   @      �
      <        F        q        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g      
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w         x        =   �-�B   >   
�TB   ?     ��   @      �
                      6        J                              W                                                                                                                                                        !       
   "   X      #          $   v     %         &          '          (          )           *          +   \     ,   ]     -   ^     .   _     /   `     0   a     1   b     2   c     3   d     4   e     5   f     6   g     7   h     g     
   h   i     b         i      
   h   z     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �B   >   ��RB   ?   �S=   @      �
      �        �        �        
                                                                                                                 �                                                                     !       
   "          #          $   �     %         &          '          (          )           *          +         ,         -         .         /         0         1         2         3          4   !      5   "      6   #      7   $      g   0  
   h   %      b         i      
   h   6      b      
   i   D   
   h   N      b      
   i   W       s           t           u           b           v          w   `      x   a      =   ���B   >   �8mB   ?    ,�<   @      �
      b         n         �         �                               �                                                                                                                                                         !       
   "   �       #          $        %         &          '          (          )           *          +   �      ,   �      -   �      .   �      /   �      0   �      1   �      2   �      3   �      4   �      5   �      6   �      7   �      g   @  
   h   �      b         i      
   h   �      b      
   i   �   
   h   �      b      
   i   �       s           t           u           b           v          w   �      x   �      =   ]=�B   >   ��]B   ?   ��?   @      �
      �         
!        /!        C!                              L!                                                                                 �                                                                     !       
   "   M!      #          $   �     %         &          '          (          )           *          +   Q!     ,   R!     -   S!     .   T!     /   U!     0   V!     1   W!     2   X!     3   Y!     4   Z!     5   [!     6   \!     7   ]!     g   P  
   h   ^!     b         i      
   h   o!     b      
   i   }!  
   h   �!     b      
   i   �!      s           t           u           b           v          w   �!     x   �!     =   �7�B   >   ��eB   ?      �   @      �
      �!        �!        �!        �!                              �!                                                                                                                                                        !       
   "   �!      #          $        %         &          '          (          )           *          +   �!     ,   �!     -   �!     .   �!     /   �!     0   �!     1   �!     2   �!     3   �!     4   �!     5   �!     6   �!     7   �!     g   `  
   h   �!     b         i      
   h   	"     b      
   i   "  
   h    "     b      
   i   )"      s           t           u           b           v          w   3"     x   4"     =   r��B   >   �"B   ?     ��   @      �
      5"        ?"        h"        |"                              �"                                                                                                                                                        !       
   "   �"      #          $   v     %         &          '          (          )           *          +   �"     ,   �"     -   �"     .   �"     /   �"     0   �"     1   �"     2   �"     3   �"     4   �"     5   �"     6   �"     7   �"     g   p  
   h   �"     b         i      
   h   �"     b      
   i   �"  
   h   �"     b      
   i   �"  
   h   �"     b         i     �@
   h   �"     b      
   i   �"      s           t           u           b           v          w   �"     x   �"     =   ���B   >   W�nB   ?      �   @      �
      �"        #        +#        ?#                              L#                                                                                                                                                        !       
   "   M#      #          $   v     %         &          '          (          )           *          +   Q#     ,   R#     -   S#     .   T#     /   U#     0   V#     1   W#     2   X#     3   Y#     4   Z#     5   [#     6   \#     7   ]#     g   �  
   h   ^#     b         i      
   h   o#     b      
   i   }#  
   h   �#     b      
   i   �#  
   h   �#     b         i     �@
   h   �#     b      
   i   �#      s           t           u           b           v          w   �#     x   �#     =   ���B   >   ��fB   ?   �bs>   @      �
      �#        �#        �#        $                              $                                                                                                                                                        !       
   "   $      #          $   v     %         &          '          (          )           *          +   $     ,   $     -   $     .   $     /   $     0   $     1   $     2   $     3   $     4   $     5    $     6   !$     7   "$     g   �  
   h   #$     b         i      
   h   4$     b      
   i   B$  
   h   J$     b      
   i   S$  
   h   \$     b         i     �@
   h   d$     b      
   i   m$      s           t           u           b           v          w   }$     x   ~$     =   ���B   >   2�NB   ?   ���=   @      �
      $        �$        �$        �$                              �$                                                                                                                                                        !       
   "   �$      #          $   v     %         &          '          (          )           *          +   �$     ,   �$     -   �$     .   �$     /   �$     0   �$     1   �$     2   �$     3   �$     4   �$     5   �$     6   �$     7   �$     g   �  
   h   �$     b         i      
   h   �$     b      
   i   %  
   h   %     b      
   i   %  
   h   "%     b         i     �@
   h   *%     b      
   i   3%      s           t           u           b           v          w   C%     x   D%     =   �S�B   >   >7SB   ?   �B�>   @      �
      E%        O%        y%        �%                              �%                                                                                                                                                        !       
   "   �%      #          $   v     %         &          '          (          )           *          +   �%     ,   �%     -   �%     .   �%     /   �%     0   �%     1   �%     2   �%     3   �%     4   �%     5   �%     6   �%     7   �%     g   �  
   h   �%     b         i      
   h   �%     b      
   i   �%  
   h   �%     b      
   i   �%  
   h   �%     b         i     �@
   h   �%     b      
   i   �%      s           t           u           b           v          w   &     x   &     =   ���B   >   �mB   ?      �   @      �
      &        &        9&        M&                              V&                                                                                                                                                        !       
   "   W&      #          $        %         &          '          (          )           *          +   [&     ,   \&     -   ]&     .   ^&     /   _&     0   `&     1   a&     2   b&     3   c&     4   d&     5   e&     6   f&     7   g&     g   �  
   h   h&     b         i      
   h   y&     b      
   i   �&  
   h   �&     b      
   i   �&      s           t           u           b           v          w   �&     x   �&     =   [��B   >   1�DB   ?     ж   @      �
      �&        �&        �&        �&                              �&                                                                                 �                                                                     !       
   "   �&      #          $   �     %         &          '          (          )           *          +   �&     ,   �&     -   �&     .   �&     /   �&     0   �&     1   �&     2   �&     3   �&     4    '     5   '     6   '     7   '     g   �  
   h   '     b         i      
   h   '     b      
   i   #'  
   h   -'     b      
   i   6'      s           t           u           b           v          w   ?'     x   @'     =   �h�B   >   $S]B   ?   ��>   @      �
      A'        K'        s'        �'                              �'                                                                                                                                                        !       
   "   �'      #          $   v     %         &          '          (          )           *          +   �'     ,   �'     -   �'     .   �'     /   �'     0   �'     1   �'     2   �'     3   �'     4   �'     5   �'     6   �'     7   �'     g     
   h   �'     b         i      
   h   �'     b      
   i   �'  
   h   �'     b      
   i   �'  
   h   �'     b         i     �@
   h   �'     b      
   i   �'      s           t           u           b           v          w   �'     x   �'     =   a��B   >   ϸRB   ?   �=�>   @      �
      �'        (        +(        ?(                              H(                                                                                                                                                        !       
   "   I(      #          $        %         &          '          (          )           *          +   M(     ,   N(     -   O(     .   P(     /   Q(     0   R(     1   S(     2   T(     3   U(     4   V(     5   W(     6   X(     7   Y(     g      
   h   Z(     b         i      
   h   k(     b      
   i   y(  
   h   �(     b      
   i   �(      s           t           u           b           v          w   �(     x   �(     =   �b�B   >   �HB   ?      �   @      �
      �(        �(        �(        �(                              �(                                                                                                                                                        !       
   "   �(      #          $   v     %         &          '          (          )           *          +   �(     ,   �(     -   �(     .   �(     /   �(     0   �(     1   �(     2   �(     3   �(     4   �(     5   �(     6   �(     7   �(     g   0  
   h   �(     b         i      
   h   )     b      
   i   )  
   h   $)     b      
   i   -)  
   h   8)     b         i     �@
   h   @)     b      
   i   I)      s           t           u           b           v          w   Y)     x   Z)     =   �XoB   >   \>�A   ?     ��   @      �
      [)        e)        �)        �)                              �)                                                                                                                                                        !       
   "   �)      #          $   v     %         &          '          (          )           *          +   �)     ,   �)     -   �)     .   �)     /   �)     0   �)     1   �)     2   �)     3   �)     4   �)     5   �)     6   �)     7   �)     g   H  
   h   �)     b         i      
   h   �)     b      
   i   �)  
   h   �)     b      
   i   �)  
   h   �)     b         i     �@
   h   *     b      
   i   *      s           t           u           b           v          w   *     x   *     =   L6RB   >   `�?A   ?   
$<   @      �
      *        (*        S*        g*                              u*                                                                                                                                                        !       
   "   v*      #          $   v     %         &          '          (          )           *          +   z*     ,   {*     -   |*     .   }*     /   ~*     0   *     1   �*     2   �*     3   �*     4   �*     5   �*     6   �*     7   �*     g   `  
   h   �*     b         i      
   h   �*     b      
   i   �*  
   h   �*     b      
   i   �*  
   h   �*     b         i     �@
   h   �*     b      
   i   �*      s           t           u           b           v          w   �*     x   �*     =   5�bB   >   y]+A   ?     ��   @      �
      �*        �*        +        ,+                              9+                                                                                                                                                        !       
   "   :+      #          $   v     %         &          '          (          )           *          +   >+     ,   ?+     -   @+     .   A+     /   B+     0   C+     1   D+     2   E+     3   F+     4   G+     5   H+     6   I+     7   J+     g   x  
   h   K+     b         i      
   h   \+     b      
   i   j+  
   h   r+     b      
   i   {+  
   h   �+     b         i     �@
   h   �+     b      
   i   �+      s           t           u           b           v          w   �+     x   �+     =   GUB   >   *�FA   ?   tO�<   @      �
      �+        �+        �+        �+                               ,                                                                                                                                                        !       
   "   ,      #          $   v     %         &          '          (          )           *          +   ,     ,   ,     -   ,     .   ,     /   	,     0   
,     1   ,     2   ,     3   ,     4   ,     5   ,     6   ,     7   ,     g   �  
   h   ,     b         i      
   h   #,     b      
   i   1,  
   h   9,     b      
   i   B,  
   h   L,     b         i     �@
   h   T,     b      
   i   ],      s           t           u           b           v          w   m,     x   n,     =   ?�B   >   }�)B   ?   @�q=   @      �
      o,        y,        �,        �,                              �,                                                                                                                                                        !       
   "   �,      #          $   v     %         &          '          (          )           *          +   �,     ,   �,     -   �,     .   �,     /   �,     0   �,     1   �,     2   �,     3   �,     4   �,     5   �,     6   �,     7   �,     g   �  
   h   �,     b         i      
   h   �,     b      
   i   �,  
   h   �,     b      
   i   -  
   h   -     b         i     �@
   h   -     b      
   i    -      s           t           u           b           v          w   0-     x   1-     =   =ԗB   >   T�B   ?     ��   @      �
      2-        <-        f-        z-                              �-                                                                                                                                                        !       
   "   �-      #          $   v     %         &          '          (          )           *          +   �-     ,   �-     -   �-     .   �-     /   �-     0   �-     1   �-     2   �-     3   �-     4   �-     5   �-     6   �-     7   �-     g   �  
   h   �-     b         i      
   h   �-     b      
   i   �-  
   h   �-     b      
   i   �-  
   h   �-     b         i     �@
   h   �-     b      
   i   �-      s           t           u           b           v          w   �-     x   �-     =   B��B   >   f�B   ?     ��   @      �
      �-        .        *.        >.                              J.                                                                                                                                                        !       
   "   K.      #          $   v     %         &          '          (          )           *          +   O.     ,   P.     -   Q.     .   R.     /   S.     0   T.     1   U.     2   V.     3   W.     4   X.     5   Y.     6   Z.     7   [.     g   �  
   h   \.     b         i      
   h   m.     b      
   i   {.  
   h   �.     b      
   i   �.  
   h   �.     b         i     �@
   h   �.     b      
   i   �.      s           t           u           b           v          w   �.     x   �.     =   �ѕB   >   ��:B   ?   9��   @      �
      �.        �.        �.        /                              /                                                                                                                                                        !       
   "   /      #          $   v     %         &          '          (          )           *          +   /     ,   /     -   /     .   /     /   /     0   /     1   /     2   /     3   /     4   /     5   /     6    /     7   !/     g   �  
   h   "/     b         i      
   h   3/     b      
   i   A/  
   h   I/     b      
   i   R/  
   h   \/     b         i     �@
   h   d/     b      
   i   m/      s           t           u           b           v          w   }/     x   ~/     =   �B   >   T�8B   ?   9��   @      �
      /        �/        �/        �/                              �/                                                                                                                                                        !       
   "   �/      #          $   v     %         &          '          (          )           *          +   �/     ,   �/     -   �/     .   �/     /   �/     0   �/     1   �/     2   �/     3   �/     4   �/     5   �/     6   �/     7   �/     g     
   h   �/     b         i      
   h   �/     b      
   i   0  
   h   0     b      
   i   0  
   h   !0     b         i     �@
   h   )0     b      
   i   20      s           t           u           b           v          w   B0     x   C0     =   ���B   >   �ICB   ?   �#<   @      �
      D0        N0        y0        �0                              �0                                                                                                                                                        !       
   "   �0      #          $   v     %         &          '          (          )           *          +   �0     ,   �0     -   �0     .   �0     /   �0     0   �0     1   �0     2   �0     3   �0     4   �0     5   �0     6   �0     7   �0     g      
   h   �0     b         i      
   h   �0     b      
   i   �0  
   h   �0     b      
   i   �0  
   h   �0     b         i     �@
   h   �0     b      
   i   �0      s           t           u           b           v          w   1     x   	1     =   �B   >   ��BB   ?          @      �
      
1        1        >1        R1                              _1                                                                                                                                                        !       
   "   `1      #          $   v     %         &          '          (          )           *          +   d1     ,   e1     -   f1     .   g1     /   h1     0   i1     1   j1     2   k1     3   l1     4   m1     5   n1     6   o1     7   p1     g   8  
   h   q1     b         i      
   h   �1     b      
   i   �1  
   h   �1     b      
   i   �1  
   h   �1     b         i     �@
   h   �1     b      
   i   �1      s           t           u           b           v          w   �1     x   �1     =   Y��B   >   [@B   ?   ��#<   @      �
      �1        �1        2        2                              "2                                                                                                                                                        !       
   "   #2      #          $   v     %         &          '          (          )           *          +   '2     ,   (2     -   )2     .   *2     /   +2     0   ,2     1   -2     2   .2     3   /2     4   02     5   12     6   22     7   32     g   P  
   h   42     b         i      
   h   E2     b      
   i   S2  
   h   [2     b      
   i   d2  
   h   m2     b         i     �@
   h   u2     b      
   i   ~2      s           t           u           b           v          w   �2     x   �2     =   �}B   >   ��GB   ?      �   @      �
      �2        �2        �2        �2                              �2                                                                                                                                                        !       
   "   �2      #          $   v     %         &          '          (          )           *          +   �2     ,   �2     -   �2     .   �2     /   �2     0   �2     1   �2     2   �2     3   �2     4   �2     5   �2     6   �2     7   �2     g   h  
   h   �2     b         i      
   h   
3     b      
   i   3  
   h    3     b      
   i   )3  
   h   33     b         i     �@
   h   ;3     b      
   i   D3      s           t           u           b           v          w   T3     x   U3     =   F"�B   >   �dB   ?   @"�>   @      �
      V3        b3        �3        �3                              �3                                                                                 �                                                                     !       
   "   �3      #          $   �     %         &          '          (          )           *          +   �3     ,   �3     -   �3     .   �3     /   �3     0   �3     1   �3     2   �3     3   �3     4   �3     5   �3     6   �3     7   �3     g   �  
   h   �3     b         i      
   h   �3     b      
   i   �3  
   h   �3     b         i     �@
   h   �3     b      
   i   �3      s           t           u           b           v          w   �3     x   �3     =   ))XB   >   x��@   ?     ��   @      �
      �3        4        &4        :4                              F4                                                                                 u                                                                     !       
   "   G4      #          $         %         &          '          (          )           *          +   K4     ,   L4     -   M4     .   N4     /   O4     0   P4     1   Q4     2   R4     3   S4     4   T4     5   U4     6   V4     7   W4     g   �  
   h   X4     b         i      
   h   i4     b      
   i   w4  
   h   �4     b         i      
   h   �4     b         i     4B    s           t           u           b           v          w   �4     x   �4     =   H�B   >   H��A   ?          @      �
      �4        �4        �4        �4                              �4                  ����                                                                                                                                   !       
   "   �4      #          $   '     %         &          '          (          )           *          +   �4     ,   �4     -   �4     .   �4     /   �4     0   �4     1   �4     2   �4     3   �4     4   �4     5   �4     6   �4     7   �4      s           t           u          b           v          w   �4     x   �4     =   �:�B   >   -ۏB   ?   jfA   @   �
�>
      �4        �4        5        5                              "5                  ����                                                                                                                                   !       
   "   #5      #          $   '     %         &          '          (          )           *          +   '5     ,   (5     -   )5     .   *5     /   +5     0   ,5     1   -5     2   .5     3   /5     4   05     5   15     6   25     7   35      s           t           u          b           v          w   45     x   55     =   ���B   >   [~�B   ?   jfA   @   �
�
      65        A5        M5        Y5                              e5                                                                                 &                                                                     !       
   "   f5      #          $   �      %         &          '          (          )           *          +   j5     ,   k5     -   l5     .   m5     /   n5     0   o5     1   p5     2   q5     3   r5     4   s5     5   t5     6   u5     7   v5      s           t           u          b           v          w   w5     x   x5     =   0�B   >   ��wB   ?     ��   @      �
      y5        �5        �5        �5                              �5                                                                                 &                                                                     !       
   "   �5      #          $   �      %         &          '          (          )           *          +   �5     ,   �5     -   �5     .   �5     /   �5     0   �5     1   �5     2   �5     3   �5     4   �5     5   �5     6   �5     7   �5      s           t           u          b           v          w   �5     x   �5     =   �p�B   >   �svB   ?     ��   @      �
      �5        �5        �5        �5                              �5                  ����                                                                                                                                 !       
   "   �5      #          $   )     %         &          '          (          )           *          +   �5     ,   �5     -    6     .   6     /   6     0   6     1   6     2   6     3   6     4   6     5   6     6   	6     7   
6      s           t           u          b           v          w   6     x   6     =   �\�B   >   �=zB   ?     ��   @      �
      6        !6        -6        96                              J6                  ����                                                                                                                                 !       
   "   K6      #          $   )     %         &          '          (          )           *          +   O6     ,   P6     -   Q6     .   R6     /   S6     0   T6     1   U6     2   V6     3   W6     4   X6     5   Y6     6   Z6     7   [6      s           t           u          b           v          w   \6     x   ]6     =   �!�B   >   f�{B   ?     �3   @      �
      ^6        r6        ~6        �6                              �6                  ����                                                                                                                                 !       
   "   �6      #          $   )     %         &          '          (          )           *          +   �6     ,   �6     -   �6     .   �6     /   �6     0   �6     1   �6     2   �6     3   �6     4   �6     5   �6     6   �6     7   �6      s           t           u          b           v          w   �6     x   �6     =   ��B   >   kzB   ?      5   @      �
      �6        �6        �6        �6                              �6                  ����                                                                                                                                 !       
   "   �6      #          $   )     %         &          '          (          )           *          +   �6     ,   �6     -   �6     .   �6     /   �6     0   �6     1   �6     2   �6     3   �6     4   �6     5   �6     6   �6     7   �6      s           t           u          b           v          w   �6     x   �6     =   :. C   >   �vB   ?    �=   @      �
       7        7        7        #7                              /7                                                                                 &                                                                     !       
   "   07      #          $   �      %         &          '          (          )           *          +   47     ,   57     -   67     .   77     /   87     0   97     1   :7     2   ;7     3   <7     4   =7     5   >7     6   ?7     7   @7      s           t           u          b           v          w   A7     x   B7     =   +P C   >   ĄoB   ?     ��   @      �
      C7        N7        Z7        f7                              r7                                                                                 &                                                                     !       
   "   s7      #          $   �      %         &          '          (          )           *          +   w7     ,   x7     -   y7     .   z7     /   {7     0   |7     1   }7     2   ~7     3   7     4   �7     5   �7     6   �7     7   �7      s           t           u          b           v          w   �7     x   �7     =   rC   >   ��kB   ?     ��   @      �
      �7        �7        �7        �7                              �7                  ����                                                                                                                                   !       
   "   �7      #          $   (     %         &          '          (          )           *          +   �7     ,   �7     -   �7     .   �7     /   �7     0   �7     1   �7     2   �7     3   �7     4   �7     5   �7     6   �7     7   �7      s           t           u          b           v          w   �7     x   �7     =   5�C   >   jhB   ?          @      �
      �7        �7        �7        8                              8                  ����                                                                                                                                 !       
   "   8      #          $   )     %         &          '          (          )           *          +   8     ,   8     -   8     .   8     /   8     0   8     1   8     2    8     3   !8     4   "8     5   #8     6   $8     7   %8      s           t           u          b           v          w   &8     x   '8     =   �rC   >   '9eB   ?      5   @      �
      (8        38        ?8        K8                              W8                                                                                 &                                                                     !       
   "   X8      #          $   �      %         &          '          (          )           *          +   \8     ,   ]8     -   ^8     .   _8     /   `8     0   a8     1   b8     2   c8     3   d8     4   e8     5   f8     6   g8     7   h8      s           t           u          b           v          w   i8     x   j8     =   <C   >   ��_B   ?      �   @      �
      k8        ~8        �8        �8                              �8                                                                                                                                                        !       
   "   �8      #          $   �      %         &          '          (          )           *          +   �8     ,   �8     -   �8     .   �8     /   �8     0   �8     1   �8     2   �8     3   �8     4   �8     5   �8     6   �8     7   �8     g   �  
   h   �8     b         i      
   h   �8     b      
   i   �8  
   h   X9     b      
   i   f9  
   h   s9     b      
   i   9  
   h   �9     b         i          s           t           u           b           v          w   �9     x   �9     =   �r3B   >   ^@8B   ?          @      �AreaProperties  AmbientSndDay   AmbientSndNight AmbientSndDayVolAmbientSndNitVolEnvAudio        MusicBattle     MusicDay        MusicNight      MusicDelay      Creature List   Door List       Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         LinkedTo        LinkedToFlags   LoadScreenID    GenericType_New OnFailToOpen    X               Y               Z               Bearing         Encounter List  List            SoundList       Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           GeneratedType   XPosition       YPosition       ZPosition       StoreList       TriggerList     LocalizedName   Cursor          HighlightHeight Type            ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           XOrientation    YOrientation    ZOrientation    Geometry        PointX          PointY          PointZ          WaypointList    Placeable List  HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed             Exit_Module_Door    �            Exit Module Door   t#             exit_module_door     keep_door_open      
end_module             log_1_sound   ����          Log 1 Soundlog_1_soundaudio_log_1   WeatherRain   ����          Weather Rainweather_rain
rain_sound
   intro_line   ����       
   Intro Line
intro_line
intro_line   scan_sound_1   ����          Scan Sound 1scan_sound_1scannable_1   log_1_triggerlog_1_trigger   �9            Log 1 Trigger            play_audio_log  
   log_number   m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note$   �E           Mushroom - Note, Red   �H            
m_note_red                     can_be_pulsed
   pulse_type   note   color   red_l   time   sound   note_C     m_Note$   �E           Mushroom - Note, Red   �H            
m_note_red                     can_be_pulsed
   pulse_type   note   color   red_l   time   sound   note_C     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Note&   �E           Mushroom - Note, Brown   �H            m_note_brown                     can_be_pulsed
   pulse_type   note   color   brown   time   sound   note_A_below     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note$   �E           Mushroom - Note, Red   �H            
m_note_red                     can_be_pulsed
   pulse_type   note   color   red_l   time   sound   note_C     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, Brown   �H            m_note_brown                     can_be_pulsed
   pulse_type   note   color   brown   time   sound   note_A_below     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, Brown   �H            m_note_brown                     can_be_pulsed
   pulse_type   note   color   brown   time   sound   note_A_below     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     m_Note$   �E           Mushroom - Note, Red   �H            
m_note_red                     can_be_pulsed
   pulse_type   note   color   red_l   time   sound   note_C     m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Note&   �E           Mushroom - Note, Brown   �H            m_note_brown                     can_be_pulsed
   pulse_type   note   color   brown   time   sound   note_A_below     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above     m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below     m_Beacon!   �E           Mushroom - Beacon   �H            m_beacon                     can_be_pulsed
   pulse_type   beacon   time   color   white     audioLog   QJ           Audio Log 1   ^J            audio_log_1                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time     x0_desertrocks   �        �     x0_desertrocks                       x0_desertrocks   �        �     x0_desertrocks                       Boulder   �         E     plc_boulder                       Boulder   �         E     plc_boulder                       x0_desertboulde2   �        E     x0_desertboulde2                       x0_desertboulde2   �        E     x0_desertboulde2                       x0_desertboulde2   �        E     x0_desertboulde2                       x0_desertboulde2   �        E     x0_desertboulde2                       Boulder   �         E     plc_boulder                       Boulder   �         E     plc_boulder                       x0_desertboulder   �        E     x0_desertboulder                       x0_desertboulde2   �        E     x0_desertboulde2                       Boulder   �         E     plc_boulder                       scannableObject$   H            Scan 1 - Tree Branch   9             s1_tree_branch                     can_be_pulsed   text`   A blue coloured branch with glowing berries. Their composition is cherry-like and likely edible.
   pulse_type	   scannable   dialogue'   Oh my god. We could actually live here.   scan_number      
      A   B   C   �   �   �   �                           	                                                                   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                             !  "  #  $  %  &  '  (  )  *                    +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  a  b  c  d  e  f  g  h  i  j  k  X  Y  Z  [  \  ]  ^  _  `  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                  $  %  &  '  (  )  *  +  ,  -  .               !  "  #  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  k  l  m  n  o  p  q  r  s  t  u  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  .  /  0  1  2  3  4  5  6  7  8  %  &  '  (  )  *  +  ,  -  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  u  v  w  x  y  z  {  |  }  ~    f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �       �  �  �  �  �  �  �  �  �                	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  >  ?  @  A  B  C  D  E  F  G  H  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  �  �  �  �  �  �  �  �  �  �  �  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  Z  [  \  ]  ^  _  `  a  b  c  d  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                    #  $  %  &  '  (  )  *  +  ,  -                             !  "  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  j  k  l  m  n  o  p  q  r  s  t  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  3  4  5  6  7  8  9  :  ;  <  =  *  +  ,  -  .  /  0  1  2  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  t  u  v  w  x  y  z  {  |  }  ~  k  l  m  n  o  p  q  r  s    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     �  �  �  �  �  �  �  �  �                  	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  7  8  9  :  ;  <  =  >  ?  @  A  .  /  0  1  2  3  4  5  6  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  x  y  z  {  |  }  ~    �  �  �  o  p  q  r  s  t  u  v  w  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   	  	  	  	  	  �  �  �  �  �  �  �  �  �  	  	  	  	  		  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	   	  !	  "	  #	  $	  %	  &	  '	  (	  )	  *	  +	  ,	  -	  .	  /	  0	  1	  ;	  <	  =	  >	  ?	  @	  A	  B	  C	  D	  E	  2	  3	  4	  5	  6	  7	  8	  9	  :	  F	  G	  H	  I	  J	  K	  L	  M	  N	  O	  P	  Q	  R	  S	  T	  U	  V	  W	  X	  Y	  Z	  [	  \	  ]	  ^	  _	  `	  a	  b	  c	  d	  e	  f	  g	  h	  i	  j	  k	  l	  m	  n	  o	  p	  q	  r	  |	  }	  ~	  	  �	  �	  �	  �	  �	  �	  �	  s	  t	  u	  v	  w	  x	  y	  z	  {	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	   
  
  
  
  
  
  
  
  
  �	  �	  �	  �	  �	  �	  �	  �	  �	  	
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   
  !
  "
  #
  $
  %
  &
  '
  (
  )
  *
  +
  ,
  -
  .
  /
  0
  1
  2
  3
  4
  5
  ?
  @
  A
  B
  C
  D
  E
  F
  G
  H
  I
  6
  7
  8
  9
  :
  ;
  <
  =
  >
  J
  K
  L
  M
  N
  O
  P
  Q
  R
  S
  T
  U
  V
  W
  X
  Y
  Z
  [
  \
  ]
  ^
  _
  `
  a
  b
  c
  d
  e
  f
  g
  h
  i
  j
  k
  l
  m
  n
  o
  p
  q
  r
  s
  t
  u
  v
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  w
  x
  y
  z
  {
  |
  }
  ~
  
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
  �
    	  
                  �
  �
  �
  �
  �
  �
  �
                                                !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  O  P  Q  R  S  T  U  V  W  X  Y  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                      $  %  &  '  (  )  *  +  ,  -  .                           !  "  #  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  k  l  m  n  o  p  q  r  s  t  u  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  4  5  6  7  8  9  :  ;  <  =  >  +  ,  -  .  /  0  1  2  3  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  u  v  w  x  y  z  {  |  }  ~    l  m  n  o  p  q  r  s  t  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                   �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  D  E  F  G  H  I  J  K  L  M  N  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  �  �  �  �  �  �  �  �  �  �  �  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	                   !  "  #  
                              $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Z  [  \  ]  ^  _  `  a  b  c  d  Q  R  S  T  U  V  W  X  Y  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                #  $  %  &  '  (  )  *  +  ,  -                 !  "  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  j  k  l  m  n  o  p  q  r  s  t  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �         �  �  �  �  �  �  �  �  �  �  �  �  �  �  �              	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  ?  @  A  B  C  D  E  F  G  H  I  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  �  �  �  �  �  �  �  �  �  �  �  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  [  \  ]  ^  _  `  a  b  c  d  e  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               0  1  2  3  4  5  6  7  8  9  :  !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  w  x  y  z  {  |  }  ~    �  �  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �          	  
            �  �  �  �  �  �  �  �  �  �                                                !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  I  J  K  L  M  N  O  P  Q  R  S  =  >  ?  @  A  B  C  D  E  F  G  H  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                	                        
                                      X               !   %   +   /   3   7   =   A   E   K   Q   W   ]   c   g   k   q   w   }   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �     	          #  '  -  3  9  ?  E  K  Q  W  ]  c  i  o  u  {  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                      "   #   $      &   '   (   )   *      ,   -   .      0   1   2      4   5   6      8   9   :   ;   <      >   ?   @      B   C   D      F   G   H   I   J      L   M   N   O   P      R   S   T   U   V      X   Y   Z   [   \      ^   _   `   a   b      d   e   f      h   i   j      l   m   n   o   p      r   s   t   u   v      x   y   z   {   |      ~      �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �   �   �      �   �                          
                                                   !  "     $  %  &     (  )  *  +  ,     .  /  0  1  2     4  5  6  7  8     :  ;  <  =  >     @  A  B  C  D     F  G  H  I  J     L  M  N  O  P     R  S  T  U  V     X  Y  Z  [  \     ^  _  `  a  b     d  e  f  g  h     j  k  l  m  n     p  q  r  s  t     v  w  x  y  z     |  }  ~       �  �  �  �     �  �  �  �  �  UTS V3.28      P      �     (  F   n  d   �     ����                 
                          ,                                                                        	     �?   
      A        �?                          �a        �                                                                               7             
      B   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment         
   intro_line   ����       
   Intro Line
intro_line
intro_line                                	   
                                                   ITP V3.28   Q     �   �       @   H  �  �  �  ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h         p         x         �                      O                  �                   �                  S         	         �                                    �         :         T        @         �                  U         
         V                  W        P         �         7         X                  �         ?         �         ;         �                  l   
                         �         8         t   
      '         3         8        |         �         <         �         �         Y                  �                  Z                  [                  �                  �F        @         �         9         ]        �         ^                  _                  \                  +                  a                  b                  �         6                 �                             !                  "                  #                  $                  L         5         �        �         d                e                  f                  g                  �                j                   h                  i                  k        ,        l         !         m         "         n         #         o         $         +         %         p         &         �        H        q         '         r         (         s         )         t         *         �         =         w         .         x         /         y        `        z         0         {         1         |         2         �         3         �        p        v         +         �         ,         �         -         �         >         �         4   MAIN            STRREF          LIST            ID              NAME            RESREF             assisin Propertiesit_creitemunh001   assissinit_crewpb006                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �               &   '   -   .                              	   
                                       	                  "   #   $   %                            !      (   )   *   +   ,   
   /   3   7   >   D   E   F   J   K   P      0   1   2      4   5   6      8   9   :   ;   <   =      ?   @   A   B   C      G   H   I      L   M   N   O   NCS V1.0B   .          ?�     � ,  void main()
{
    PlayAnimation(ANIMATION_DOOR_OPEN2);
}
UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_1_sound   ����          Log 1 Soundlog_1_soundaudio_log_1                                	   
                                                   NCS V1.0B  7      ,            6     Audio log 5-9 AF Crescent 2400.  �        ,            V     ?My name is Tabitha Raya, and I have made an enormous discovery.  �  @�33  ,            ?     (I left Earth to find us a place to live.  �  @���  ,            M     6The planet is near dead and won't keep us much longer.  �  A33  ,            o     XUnsurprising, given what we've done to it... but I suppose it doesn't matter in the end.  �  AC33  ,            R     ;We need to relocate, and quickly, or we will surely perish.  �  A���  ,            ;     $And I may have found just the place.  �  A�    ,            �     sA quick scan of the atmosphere indicates a near Earth-level oxygen content, and miraculously, an absence of toxins.  �  A���  ,            v     _Nearby flora is of similar composition to ours, likely edible. It's almost too good to be true.  �  A�    ,            I     2I leave behind this audio log only as contingency.  �  B    ,            s     \Of course I have every intention of returning to Earth with my findings... but all the same.  �  B    ,            T     =Just in case. History is touchy about who found things first.  �  B$      /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

"Audio log 5.9-1."
"My name is Tabitha Raya, and I have made the most important discovery of our time."
"The earth is poisoned beyond repair."
"But now, after millennia of looking up at the sky, searching the stars, I have found us a home among them."
"Nearby flora is nonlethal and pleasant."
"A quick scan shows Earth-level oxygen content and an absence of toxins."
"This planet will save us."
"I leave behind this audio log as contingency."
"I have every intention of returning to Earth with my findings... but just in case."
"History is touchy about who found things first."

*/

void main()
{
    DelayCommand(0.0,
        SpeakString("Audio log 5-9 AF Crescent 2400."));

    DelayCommand(4.1,
        SpeakString("My name is Tabitha Raya, and I have made an enormous discovery."));

    DelayCommand(7.4,
        SpeakString("I left Earth to find us a place to live."));

    DelayCommand(9.7,
        SpeakString("The planet is near dead and won't keep us much longer."));

    DelayCommand(12.2,
        SpeakString("Unsurprising, given what we've done to it... but I suppose it doesn't matter in the end."));

    DelayCommand(16.7,
        SpeakString("We need to relocate, and quickly, or we will surely perish."));

    DelayCommand(20.0,
        SpeakString("And I may have found just the place."));

    DelayCommand(22.1,
        SpeakString("A quick scan of the atmosphere indicates a near Earth-level oxygen content, and miraculously, an absence of toxins."));

    DelayCommand(28.5,
        SpeakString("Nearby flora is of similar composition to ours, likely edible. It's almost too good to be true."));

    DelayCommand(34.0,
        SpeakString("I leave behind this audio log only as contingency."));

    DelayCommand(37.0,
        SpeakString("Of course I have every intention of returning to Earth with my findings... but all the same."));

    DelayCommand(41.0,
        SpeakString("Just in case. History is touchy about who found things first."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_1_triggerlog_1_trigger   �9            Log 1 Trigger            play_audio_log  
   log_number                                	   
                                                                            UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_2_sound   ����          Log 2 Soundlog_2_soundaudio_log_2                                	   
                                                   NCS V1.0B  v      ,            7      Audio log 5-10 AF Crescent 9130.  �        ,            %     Extraordinary.  �  @�    ,            j     SNot only can this planet sustain life, but it appears sentience has even developed.  �  @�ff  ,            x     aI've just entered some sort of building after unlocking a mechanism that responded to my scanner.  �  A.ff  ,            R     ;A fresco lined the entryway, depicting bird-like creatures.  �  Avff  ,            3     Performing a ritual perhaps?  �  A���  ,            <     %What is this place? A burial chamber?  �  A�33  ,            E     .It doesn't display any characteristic markers.  �  A�    ,            B     +Maybe a museum, then. Or... an art gallery.  �  A���  ,            =     &I've never been so perfectly confused!  �  B��  ,            j     SThis is a heretofore un-encountered alien species; the usual analogues don't apply.  �  B    ,            6     My expertise means little here.  �  B ��    /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

"Audio log 6.4-4."
"This is beyond extraordinary. Not only is there life here, but sentience."
"I've just entered a building of some kind, with murals lining the entryway."
"Is it a burial chamber? It doesn't display any characteristic markers."
"So maybe a museum, then? Or... an art gallery."
"I've never been so perfectly confused!"
"This is a heretofore un-encountered alien species."
"My expertise means little."

*/

void main()
{
    DelayCommand(0.0,
        SpeakString("Audio log 5-10 AF Crescent 9130."));

    DelayCommand(5.0,
        SpeakString("Extraordinary."));

    DelayCommand(6.7,
        SpeakString("Not only can this planet sustain life, but it appears sentience has even developed."));

    DelayCommand(10.9,
        SpeakString("I've just entered some sort of building after unlocking a mechanism that responded to my scanner."));

    DelayCommand(15.4,
        SpeakString("A fresco lined the entryway, depicting bird-like creatures."));

    DelayCommand(18.7,
        SpeakString("Performing a ritual perhaps?"));

    DelayCommand(21.9,
        SpeakString("What is this place? A burial chamber?"));

    DelayCommand(24.0,
        SpeakString("It doesn't display any characteristic markers."));

    DelayCommand(27.1,
        SpeakString("Maybe a museum, then. Or... an art gallery."));

    DelayCommand(32.7,
        SpeakString("I've never been so perfectly confused!"));

    DelayCommand(35.0,
        SpeakString("This is a heretofore un-encountered alien species; the usual analogues don't apply."));

    DelayCommand(40.2,
        SpeakString("My expertise means little here."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_2_triggerlog_2_trigger   �9            Log 2 Trigger            play_audio_log  
   log_number                                	   
                                                                            UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_3_sound   ����          Log 3 Soundlog_3_soundaudio_log_3                                	   
                                                   NCS V1.0B  X      ,            6     Audio log 5-13 AF Quarter 0060.  �        ,            5     This artwork with its birds...  �  @���  ,            f     OIt offers some clue as to what this place is, but what is it trying to tell me?  �  @陚  ,            �     �The second one clearly showed a progression in means of living - from the ground to the tree, from hunting and gathering to an agrarian society.  �  A4��  ,            @     )Are these birds recounting their history?  �  A���  ,            8     !Curious it should be so familiar.  �  A���  ,            W     @Yet I suppose this could all be metaphorical. Like a fairy tale.  �  A�ff  ,            R     ;I am sure there are more than just four of these creatures.  �  A�      /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

"Audio log 8.7-5."
"Why is every room barred with puzzles?"
"Are these mere locks I'm opening, or do they serve some grander purpose?"
"Are they games? Are they trials?"
"Are they guarding something? Am I... being led?"
"I must know."

*/

void main()
{
    DelayCommand(0.0,
        SpeakString("Audio log 5-13 AF Quarter 0060."));

    DelayCommand(4.4,
        SpeakString("This artwork with its birds..."));

    DelayCommand(7.3,
        SpeakString("It offers some clue as to what this place is, but what is it trying to tell me?"));

    DelayCommand(11.3,
        SpeakString("The second one clearly showed a progression in means of living - from the ground to the tree, from hunting and gathering to an agrarian society."));

    DelayCommand(18.2,
        SpeakString("Are these birds recounting their history?"));

    DelayCommand(20.6,
        SpeakString("Curious it should be so familiar."));

    DelayCommand(23.3,
        SpeakString("Yet I suppose this could all be metaphorical. Like a fairy tale."));

    DelayCommand(27.0,
        SpeakString("I am sure there are more than just four of these creatures."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_3_triggerlog_3_trigger   �9            Log 3 Trigger            play_audio_log  
   log_number                                	   
                                                                            UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_4_sound   ����          Log 4 Soundlog_4_soundaudio_log_4                                	   
                                                   NCS V1.0B  ;      ,            6     Audio log 5-15 AF Quarter 3351.  �        ,            f     OThe bird people appear to have expanded out of their trees to the ground below.  �  @�33  ,            A     *Perhaps their population needed the space?  �  A33  ,            D     -Or the trees could not support the factories.  �  A;33  ,            Q     :I'll have to test local flora for weight bearing capacity.  �  Ak33  ,            �     �Either way, if these paintings are a historical recounting, then the bird people knowingly moved into dangerous territory, where the foxes could get them.  �  A���  ,            W     @I believe that's why they moved to the trees in the first place.  �  A�ff  ,            M     6They must have counted on the walls to keep them safe.  �  A�ff  ,            L     5I am reminded again of our own first-world expansion.  �  B    ,            ?     (It seems industry attracts many peoples.  �  B      /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

"Audio log 8.7-6."
"I've only been here a few short days, and already I feel at home."
"A million unanswered questions, the universe unfolding before me... I'm in my element."
"My father would laugh, if he were still here."
"Say this mission was tailor made for me."
"I wish I could suspend this moment, when the answers are before me but I don't yet know them."
"Sometimes the truth's a disappointment."

*/

void main()
{
    DelayCommand(0.0,
        SpeakString( "Audio log 5-15 AF Quarter 3351."));

    DelayCommand(4.6,
        SpeakString("The bird people appear to have expanded out of their trees to the ground below."));

    DelayCommand(8.7,
        SpeakString("Perhaps their population needed the space?"));

    DelayCommand(11.7,
        SpeakString("Or the trees could not support the factories."));

    DelayCommand(14.7,
        SpeakString("I'll have to test local flora for weight bearing capacity."));

    DelayCommand(18.2,
        SpeakString("Either way, if these paintings are a historical recounting, then the bird people knowingly moved into dangerous territory, where the foxes could get them."));

    DelayCommand(25.3,
        SpeakString("I believe that's why they moved to the trees in the first place."));

    DelayCommand(28.3,
        SpeakString("They must have counted on the walls to keep them safe."));

    DelayCommand(33.5,
        SpeakString("I am reminded again of our own first-world expansion."));

    DelayCommand(37.0,
        SpeakString("It seems industry attracts many peoples."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_4_triggerlog_4_trigger   �9            Log 4 Trigger            play_audio_log  
   log_number                                	   
                                                                            UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_5_sound   ����          Log 5 Soundlog_5_soundaudio_log_5                                	   
                                                   NCS V1.0B  �      ,            6     Audio log 5-20 AF Quarter 9207.  �        ,            _     HWhen I was a little girl my father told me I could be anything I wanted.  �  @�    ,            o     XI told him the problem wasn't my ability, but that I could be so good at so many things.  �  @�33  ,            +     How was I to choose?  �  A@    ,            C     ,He laughed at that. Took it as confirmation.  �  A\��  ,            ;     $I believe I was... four at the time?  �  A�33  ,            l     UFather passed away when I was twelve, from smog poisoning. Mother went shortly after.  �  A�    ,            k     TI remember thinking, standing in front of their tombstones: why do we bury the dead?  �  A���  ,            ^     GOr burn them up and stick them in the ground as we did with my parents?  �  A�  ,            '     Who is that for?  �  B��  ,            +     The dead? Or for us?  �  B
ff  ,            X     ATwelve year-old me wondered if she would make a good gravedigger.  �  B��  ,            �     �And now here I am, the first to discover a terra-formed planet outside our solar system, the first to discover a sentient alien species.  �  B&    ,            <     %And the one who can save humanity....  �  BC33  ,            D     -Sorry, I suppose that wasn't very scientific.  �  B_33  ,            L     5Just a bit of... background on a subjective observer.  �  Bl    ,            *     The foxes attacked.  �  B{��  ,            a     JThe bird people moved into dangerous territory, and got themselves killed.  �  B�ff  ,            C     ,It is unclear if there are any of them left.  �  B�ff  ,            J     3These paintings had to be drawn by someone, though.  �  B�      /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

*NOTE FROM SCHYLER*
The audio log is found next to a small tent, bedroll, and torch. It is apparent that Tabitha has been here.

"Audio log 9.0-1."
"Where have these beings gone to?"
"This place is centuries old and no sign of them remains, yet I cannot shake the feeling they are not all lost."
"They are so like humans in so many ways...."
"I can't believe that whatever happened to them has kept them down for long."
"I should like to meet one of these intelligent bird creatures."
"I wonder what I would say."

*/

void main()
{
    DelayCommand(0.0,
        SpeakString("Audio log 5-20 AF Quarter 9207."));

    DelayCommand(4.0,
        SpeakString("When I was a little girl my father told me I could be anything I wanted."));

    DelayCommand(7.6,
        SpeakString("I told him the problem wasn't my ability, but that I could be so good at so many things."));

    DelayCommand(12.0,
        SpeakString("How was I to choose?"));

    DelayCommand(13.8,
        SpeakString("He laughed at that. Took it as confirmation."));

    DelayCommand(16.9,
        SpeakString("I believe I was... four at the time?"));

    DelayCommand(20.0,
        SpeakString("Father passed away when I was twelve, from smog poisoning. Mother went shortly after."));

    DelayCommand(25.6,
        SpeakString("I remember thinking, standing in front of their tombstones: why do we bury the dead?"));

    DelayCommand(30.2,
        SpeakString("Or burn them up and stick them in the ground as we did with my parents?"));

    DelayCommand(33.4,
        SpeakString("Who is that for?"));

    DelayCommand(34.6,
        SpeakString("The dead? Or for us?"));

    DelayCommand(37.4,
        SpeakString("Twelve year-old me wondered if she would make a good gravedigger."));

    DelayCommand(41.5,
        SpeakString("And now here I am, the first to discover a terra-formed planet outside our solar system, the first to discover a sentient alien species."));

    DelayCommand(48.8,
        SpeakString("And the one who can save humanity...."));

    DelayCommand(55.8,
        SpeakString("Sorry, I suppose that wasn't very scientific."));

    DelayCommand(59.0,
        SpeakString("Just a bit of... background on a subjective observer."));

    DelayCommand(62.9,
        SpeakString("The foxes attacked."));

    DelayCommand(64.2,
        SpeakString("The bird people moved into dangerous territory, and got themselves killed."));

    DelayCommand(68.2,
        SpeakString("It is unclear if there are any of them left."));

    DelayCommand(71.5,
        SpeakString("These paintings had to be drawn by someone, though."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_5_triggerlog_5_trigger   �9            Log 5 Trigger            play_audio_log  
   log_number                                	   
                                                                            UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_6_sound   ����          Log 6 Soundlog_6_soundaudio_log_6                                	   
                                                   NCS V1.0B  �      ,            6     Audio log 5-20 AF Quarter 9207.  �        ,            _     HWhen I was a little girl my father told me I could be anything I wanted.  �  @�    ,            o     XI told him the problem wasn't my ability, but that I could be so good at so many things.  �  @�33  ,            +     How was I to choose?  �  A@    ,            C     ,He laughed at that. Took it as confirmation.  �  A\��  ,            ;     $I believe I was... four at the time?  �  A�33  ,            l     UFather passed away when I was twelve, from smog poisoning. Mother went shortly after.  �  A�    ,            k     TI remember thinking, standing in front of their tombstones: why do we bury the dead?  �  A���  ,            ^     GOr burn them up and stick them in the ground as we did with my parents?  �  A�  ,            '     Who is that for?  �  B��  ,            +     The dead? Or for us?  �  B
ff  ,            X     ATwelve year-old me wondered if she would make a good gravedigger.  �  B��  ,            �     �And now here I am, the first to discover a terra-formed planet outside our solar system, the first to discover a sentient alien species.  �  B&    ,            <     %And the one who can save humanity....  �  BC33  ,            D     -Sorry, I suppose that wasn't very scientific.  �  B_33  ,            L     5Just a bit of... background on a subjective observer.  �  Bl    ,            *     The foxes attacked.  �  B{��  ,            a     JThe bird people moved into dangerous territory, and got themselves killed.  �  B�ff  ,            C     ,It is unclear if there are any of them left.  �  B�ff  ,            J     3These paintings had to be drawn by someone, though.  �  B�      /*

For when we get the audio, here are all of the lines from the drive
broken into chunks. This should make setting up timing easier.

"Audio log 10.2-1."
"My thoughts turn to Earth."
"The situation there could scarcely be more desperate, so this discovery is nothing short of a miracle."
"Simply being here is the greatest wish of any scientist, and I am the one at the forefront."
"My one regret, if I have any, is what will happen to this place when humans arrive."
"We will make an attempt at researching these people, probably take the more interesting of their artifacts and put them in a museum, maybe even set up an institute...."
"But that will all take a backseat to our real reason for being here: setting up shop and continuing on with life."
"Things would be different, of course, if the bird people were still alive."
"We couldn't very well take their home away."
"But then, if they are dead, if the foxes killed them all... where did the paintings come from?"

*/

void main()
{
    DelayCommand(0.0,
        SpeakString("Audio log 5-20 AF Quarter 9207."));

    DelayCommand(4.0,
        SpeakString("When I was a little girl my father told me I could be anything I wanted."));

    DelayCommand(7.6,
        SpeakString("I told him the problem wasn't my ability, but that I could be so good at so many things."));

    DelayCommand(12.0,
        SpeakString("How was I to choose?"));

    DelayCommand(13.8,
        SpeakString("He laughed at that. Took it as confirmation."));

    DelayCommand(16.9,
        SpeakString("I believe I was... four at the time?"));

    DelayCommand(20.0,
        SpeakString("Father passed away when I was twelve, from smog poisoning. Mother went shortly after."));

    DelayCommand(25.6,
        SpeakString("I remember thinking, standing in front of their tombstones: why do we bury the dead?"));

    DelayCommand(30.2,
        SpeakString("Or burn them up and stick them in the ground as we did with my parents?"));

    DelayCommand(33.4,
        SpeakString("Who is that for?"));

    DelayCommand(34.6,
        SpeakString("The dead? Or for us?"));

    DelayCommand(37.4,
        SpeakString("Twelve year-old me wondered if she would make a good gravedigger."));

    DelayCommand(41.5,
        SpeakString("And now here I am, the first to discover a terra-formed planet outside our solar system, the first to discover a sentient alien species."));

    DelayCommand(48.8,
        SpeakString("And the one who can save humanity...."));

    DelayCommand(55.8,
        SpeakString("Sorry, I suppose that wasn't very scientific."));

    DelayCommand(59.0,
        SpeakString("Just a bit of... background on a subjective observer."));

    DelayCommand(62.9,
        SpeakString("The foxes attacked."));

    DelayCommand(64.2,
        SpeakString("The bird people moved into dangerous territory, and got themselves killed."));

    DelayCommand(68.2,
        SpeakString("It is unclear if there are any of them left."));

    DelayCommand(71.5,
        SpeakString("These paintings had to be drawn by someone, though."));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_6_triggerlog_6_trigger   �9            Log 6 Trigger            play_audio_log  
   log_number                                	   
                                                                            IFO V3.28   
   �   :   h  3   �  �  V  �   	  <   ����    1      /         1         2         3         4         5         6         7         8                 
                                             
      ?         R              
   	   ^      
   b           \B         A                            �?                                                                            \         
         n         o                  �         �         �         �          �      !   �      "   �      #   �      $   �      %   �      &   �      '   �      (        )        *        +   )     ,         -         .         /   7     0      
   1   C  
   1   R  
   1   _  
   1   l  
   1   |  
   1   �  
   1   �  
   1   �     2   8   Mod_ID          Mod_MinGameVer  Mod_Creator_ID  Mod_Version     Expansion_Pack  Mod_Name        Mod_Tag         Mod_Description Mod_IsSaveGame  Mod_CustomTlk   Mod_Entry_Area  Mod_Entry_X     Mod_Entry_Y     Mod_Entry_Z     Mod_Entry_Dir_X Mod_Entry_Dir_Y Mod_Expan_List  Mod_DawnHour    Mod_DuskHour    Mod_MinPerHour  Mod_StartMonth  Mod_StartDay    Mod_StartHour   Mod_StartYear   Mod_XPScale     Mod_OnHeartbeat Mod_OnModLoad   Mod_OnModStart  Mod_OnClientEntrMod_OnClientLeavMod_OnActvtItem Mod_OnAcquirItemMod_OnUsrDefinedMod_OnUnAqreItemMod_OnPlrDeath  Mod_OnPlrDying  Mod_OnPlrEqItm  Mod_OnPlrLvlUp  Mod_OnSpawnBtnDnMod_OnPlrRest   Mod_OnPlrUnEqItmMod_OnCutsnAbortMod_OnPlrChat   Mod_StartMovie  Mod_CutSceneListMod_GVar_List   Mod_Area_list   Area_Name       Mod_HakList     Mod_Hak         Mod_CacheNSSList   ֝!e���:?��i7�[   1.69   ����          Illume - Area 1   MR_Intro_Forest   ����        introforest x2_mod_def_load x3_mod_def_enter x2_mod_def_actx2_mod_def_aqu x2_mod_def_unaqunw_o0_deathnw_o0_dyingx2_mod_def_equ nw_o0_respawnx2_mod_def_restx2_mod_def_unequ activate_pulsemr_startmovieintroforest   mr_ambience	   mr_sounds	   mr_models   mr_remove_ui	   mr_dinger   jacobysjungle   jungle creatures   jungle sound                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   0   9                                             	       UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
                          1         E                               N                          	           
                                             �                                                                           
      O                    �                                                                    S          T      !   U      "   V      #   W      $   X      %   Y      &   Z      '   [      (   \      )   ]      *   ^      +   _      ,       
   -   `      .         /      
   -   q      .      
   /      
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Beacon!   �E           Mushroom - Beacon   �H            m_beacon                     can_be_pulsed
   pulse_type   beacon   time   color   white                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      h   ?   \  8   �  �   z  �   v     ����    6       �          �          �      
                          /         C                               K                          	           
                                             �                                                                           
      L                                                                                        P          Q      !   R      "   S      #   T      $   U      %   V      &   W      '   X      (   Y      )   Z      *   [      +   \      ,       
   -   ]      .         /      
   -   n      .      
   /   |   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Bunch    �E           Mushroom - Bunch   �H            m_bunch                     can_be_pulsed
   pulse_type   bunch   color   orange                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          1         E                               N                          	           
                                             �                                                                           
      O                    �                                                                    S          T      !   U      "   V      #   W      $   X      %   Y      &   Z      '   [      (   \      )   ]      *   ^      +   _      ,       
   -   `      .         /      
   -   q      .      
   /      
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 
         -         A                               H                          	           
                                             G                                                                           
      I                    u                                                                    M          N      !   O      "   P      #   Q      $   R      %   S      &   T      '   U      (   V      )   W      *   X      +   Y      ,       
   -   Z      .         /      
   -   k      .      
   /   y   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Drum   �E           Mushroom - Drum   �H            m_drum                     can_be_pulsed
   pulse_type   drum   color   magenta                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   k  �   g     ����    6       �          �          �      
                 
         -         A                               H                          	           
                                             H                                                                           
      I                    v                                                                    M          N      !   O      "   P      #   Q      $   R      %   S      &   T      '   U      (   V      )   W      *   X      +   Y      ,       
   -   Z      .         /      
   -   k      .      
   /   y   
   -   �      .         /     �@    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note   �E           Mushroom - Note   �H            m_note                     can_be_pulsed
   pulse_type   note   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      �   E   �  8   <  �       	     ����    6       �          �          �          �               
                 
         3         G                               S                          	           
                                             H                                                                           
      T                    v                                                                    X          Y      !   Z      "   [      #   \      $   ]      %   ^      &   _      '   `      (   a      )   b      *   c      +   d      ,       
   -   e      .         /      
   -   v      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  �       	     ����    6       �          �          �          �               
                 
         4         H                               U                          	           
                                             H                                                                           
      V                    v                                                                    Z          [      !   \      "   ]      #   ^      $   _      %   `      &   a      '   b      (   c      )   d      *   e      +   f      ,       
   -   g      .         /      
   -   x      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note&   �E           Mushroom - Note, Brown   �H            m_note_brown                     can_be_pulsed
   pulse_type   note   color   brown   time   sound   note_A_below                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  �       	     ����    6       �          �          �          �               
                 
         4         H                               U                          	           
                                             H                                                                           
      V                    v                                                                    Z          [      !   \      "   ]      #   ^      $   _      %   `      &   a      '   b      (   c      )   d      *   e      +   f      ,       
   -   g      .         /      
   -   x      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note&   �E           Mushroom - Note, Green   �H            m_note_green                     can_be_pulsed
   pulse_type   note   color   green_l   time   sound   note_D_above                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  �   �    	     ����    6       �          �          �          �               
                 
         2         F                               Q                          	           
                                             H                                                                           
      R                    v                                                                    V          W      !   X      "   Y      #   Z      $   [      %   \      &   ]      '   ^      (   _      )   `      *   a      +   b      ,       
   -   c      .         /      
   -   t      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note$   �E           Mushroom - Note, Red   �H            
m_note_red                     can_be_pulsed
   pulse_type   note   color   red_l   time   sound   note_C                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  �       	     ����    6       �          �          �          �               
                 
         4         H                               U                          	           
                                             H                                                                           
      V                    v                                                                    Z          [      !   \      "   ]      #   ^      $   _      %   `      &   a      '   b      (   c      )   d      *   e      +   f      ,       
   -   g      .         /      
   -   x      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note&   �E           Mushroom - Note, White   �H            m_note_white                     can_be_pulsed
   pulse_type   note   color   white   time   sound   note_G_above                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  �       	     ����    6       �          �          �          �               
                 
         5         I                               W                          	           
                                             H                                                                           
      X                    v                                                                    \          ]      !   ^      "   _      #   `      $   a      %   b      &   c      '   d      (   e      )   f      *   g      +   h      ,       
   -   i      .         /      
   -   z      .      
   /   �   
   -   �      .      
   /   �   
   -   �      .         /     �@
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Note'   �E           Mushroom - Note, Yellow   �H            m_note_yellow                     can_be_pulsed
   pulse_type   note   color   yellow   time   sound   note_F_below                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      h   ?   \  8   �  �   |  �   x     ����    6       �          �          �      
                          1         E                               N                          	           
                                             �                                                                           
      O                                                                                        S          T      !   U      "   V      #   W      $   X      %   Y      &   Z      '   [      (   \      )   ]      *   ^      +   _      ,       
   -   `      .         /      
   -   q      .      
   /      
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            m_Triple!   �E           Mushroom - Triple   �H            m_triple                     can_be_pulsed
   pulse_type   triple   color   cyan                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28   ?   ,  �   8	     �	  �  8     8    ����                                                               (          0          8          @          H          P          X          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                              $         ,         4         <         D         L         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                        /�                 ~                  �                  8         	         �         
         �                  �                  �#                  �#                          <                             T   
                   
               .   
      ;         F         !                  d   
      W         f   
      r         �   
      �         �   
      �         �   
      �         �   
      �         �   
      �           
               6  
      C        \  
      l        �  
      �        �  
      �        �  
      �        �        "                  �   
      �          
              *  
      2        G  
      P        c  
      j        }  
      �        �  
      �        �  
      �        �  
      �          
              4  
      A        \  
      j          
      �        �  
      �        �  
      �        �  
      �        �  
      �          
      
          
      (        <  
      F        Z  
      d        x  
      �        �        #                  $                  �                  �                 �         �                  �                                   ��                  <                 }            MAIN            STRREF          ID              LIST            NAME            RESREF          	   Audio Logcenter_audio_log   Pulse Centercenter_pulse   Sensorscenter_scannable   Audio Log 1audio_log_1   Audio Log 2audio_log_2   Audio Log 3audio_log_3   Audio Log 4audio_log_4   Audio Log 5audio_log_5   Audio Log 6audio_log_6   Scan 1 - Tree Branchs1_tree_branch   Scan 2 - Beak Rocks2_beak_rock   Scan 3 - Stuffed Dolls3_stuffed_doll   Scan 4 - Ceiling
s4_ceiling   Scan 5 - Necklaces5_necklace   Scan 6 - Plant Stalks6_plant_stalk   Scan 7 - Paintbrushs7_paintbrush   Mushroom - Beaconm_beacon   Mushroom - Bunchm_bunch   Mushroom - Doublem_double   Mushroom - Drumm_drum   Mushroom - Notem_note   Mushroom - Note, Bluem_note_blue   Mushroom - Note, Brownm_note_brown   Mushroom - Note, Greenm_note_green   Mushroom - Note, Red
m_note_red   Mushroom - Note, Whitem_note_white   Mushroom - Note, Yellowm_note_yellow   Mushroom - Triplem_triple   Torch - Lit, At_lit_a   Torch - Lit, Ct_lit_c   Torch - Lit, Dt_lit_d   Torch - Lit, Ft_lit_f   Torch - Lit, Gt_lit_g   Torch - Unlit, A	t_unlit_a   Torch - Unlit, C	t_unlit_c   Torch - Unlit, D	t_unlit_d   Torch - Unlit, F	t_unlit_f   Torch - Unlit, G	t_unlit_g                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �                              	   
      7   8   >               5   6                                                                   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4      9   :   ;   <   =   NCS V1.0B  �       
log_number      3����  ���� can_be_pulsed      3"    � 
audio_log_����   \#����  ����     ]����  ��������    "    m����  F���� #    1����  play_audio_log      +         ^����  ���� ����          � ����   � ����     log_����   \# _sound#����  ���� log_����   \# 
_subtitles#����  ����    ����   �����  ����   ����  �    ?   =���         �  �    play_attempt      3����  �������� "����     ����         � $ ����  ����       ����  �    ����  ����,           Ap       ����   ,           2,                	  ����           ,           @,           !        ����     ����     ?�    ,           3,           A�     8  ����     @�fg  ,           !        ����  �  @�     ����        in_cooldown      7            � center_audio_log   @  �����  ����    play_attempt      7    playing      7,           )    play_attempt      7  @     ,           &���� ���� ����    ^  @@     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����           9         8         7    ?�  ���� ?�    -        9        8        7 ����  ����  ����� ����    time      4����  ����,               ����   �  ���� @   !  ,               #  ����    ���� ����       in_cooldown      7     playing      7      U����  ��������   X    8����       W      V����  ���� ���� ����  // The script run by either the audio log or the audio log trigger. Plays
// an audio log depending on the number.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

// The height at which pulses are initiated from objects.
const float height = 0.5;

void ChangeZoom(float cam_height);
void StartPlaying(object oSound, string subtitle_script, object oCenter);
void RemoveCooldown();

void main()
{
    int log_number = GetLocalInt(OBJECT_SELF, "log_number");

    // If the trigger is calling this, find the audio log it triggers and
    // recursively call this script on it, then destroy the trigger.
    if (!GetLocalInt(OBJECT_SELF, "can_be_pulsed")) {
        // Find the correct object for the number.
        string ResRef = "audio_log_" + IntToString(log_number);

        // Keep going till every object in the area has been checked.
        object oLoop = GetFirstObjectInArea();
        while (oLoop != OBJECT_INVALID)
        {
            if (GetResRef(oLoop) == ResRef) {
                ExecuteScript("play_audio_log", oLoop);
                break;
            }
            oLoop = GetNextObjectInArea();
        }

        DestroyObject(OBJECT_SELF);
        return;
    }

    // Play the correct audio log for the number.
    string audio_log = "log_" + IntToString(log_number) + "_sound";
    string subtitle_script = "log_" + IntToString(log_number) + "_subtitles";

    object oSound = GetObjectByTag(audio_log);
    SoundObjectSetVolume(oSound, 127);
    // VFX_IMP_LOG_ACTIVATE
    TLVFXPillar(684, GetLocation(OBJECT_SELF), 1, 0.1, -height, 0.0);

    // Determine if this was the first time playing this log or not.
    int play_attempt = GetLocalInt(OBJECT_SELF, "play_attempt");
    if (!play_attempt && log_number == 1) {
        // If not, make the player walk to the log and wait for it to play.
        object oPC = GetFirstPC();
        SetCutsceneMode(oPC, TRUE);
        object oLog = OBJECT_SELF;
        AssignCommand(oPC, ChangeZoom(15.0));

        DelayCommand(0.00, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(1.00, AssignCommand(oPC, ActionMoveToObject(oLog, FALSE, 0.0)));
        DelayCommand(5.95, AssignCommand(oPC, ChangeZoom(25.0)));
        DelayCommand(6.00, SetCutsceneMode(oPC, FALSE));
    }

    // Object that will run the subtitles.
    SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
    object oCenter = CreateObject(OBJECT_TYPE_PLACEABLE, "center_audio_log", GetLocation(OBJECT_SELF));

    // Prepare to play the audio log.
    SetLocalInt(OBJECT_SELF, "play_attempt", 1);
    SetLocalInt(OBJECT_SELF, "playing", TRUE);
    DelayCommand(2.5, SetLocalInt(OBJECT_SELF, "play_attempt", 2));
    DelayCommand(3.0, StartPlaying(oSound, subtitle_script, oCenter));
}

// Quickly zoom the player's camera to a new height.
void ChangeZoom(float cam_height)
{
    LockCameraDirection(OBJECT_SELF, FALSE);
    LockCameraDistance(OBJECT_SELF, FALSE);
    LockCameraPitch(OBJECT_SELF, FALSE);

    SetCameraFacing(-1.0, cam_height, -1.0);

    LockCameraDirection(OBJECT_SELF, TRUE);
    LockCameraDistance(OBJECT_SELF, TRUE);
    LockCameraPitch(OBJECT_SELF, TRUE);
}

void StartPlaying(object oSound, string subtitle_script, object oCenter,)
{
    // The log is now playing.
    SoundObjectPlay(oSound);
    ExecuteScript(subtitle_script, oCenter);

    // Apply cooldown period in which log cannot be pulsed (duration of log).
    float time = GetLocalFloat(OBJECT_SELF, "time");
    DelayCommand(time - 2.5, DestroyObject(oCenter));
    DelayCommand(time, RemoveCooldown());
}

void RemoveCooldown()
{
    // Remove cooldown and reset variables.
    SetLocalInt(OBJECT_SELF, "in_cooldown", FALSE);
    SetLocalInt(OBJECT_SELF, "playing", FALSE);

    // Remove all existing effects on the log.
    effect eLoop = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eLoop)) {
        RemoveEffect(OBJECT_SELF, eLoop);
        eLoop = GetNextEffect(OBJECT_SELF);
    }
}
NCS V1.0B  6�       
pulse_type      5����  ��������  beacon#   � time      4����  ���� color      5����  ���� in_cooldown      3"   / small����        ����    �����  ����      �  �����  ����    ?   =���         �����    #I����     ����      �    in_cooldown      7,                  $�  ����   ?   ���� ����        $� ����     ����   �- ����  note#   " time      4����  ���� color      5����  ���� sound      5����  ��������   #   M      ����  ��������      ����     ����     ����      ����     ����     ����          A brown����  ���� note_A_below����  ����   A- ����     ����     ����     ����          B blue_l����  ���� note_B_above����  ����   �- ����     ����     ����     ����      ����     ����     ����          ; red_l����  ���� note_C����  ����   - ����     ����     ����     ����    	  ����     ����     ����    
      C green_l����  ���� note_D_above����  ����   e- ����     ����     ����     ����      ����     ����     ����          B yellow����  ���� note_F_below����  ����    �- ����     ����     ����     ����      ����     ����     ����          A white����  ���� note_G_above����  ����    ����  color      9����  sound      9 ����     in_cooldown      3"   . small����        �����    {����  ��������    $�����  ����    ?   =���         �����    ����     ����      �    in_cooldown      7,                  h  ����   ?   ���� ����        a ����     ����   
�- ����  drum#����     ����     ����  double# ����     ����     ����  triple# ����     ����     ����  bunch#    u color      5����  ���� sound      5����  ����?�  ����  ���� in_cooldown      3"   � small����        	�����  drum#    *����    $����  ����    �- ����  double#    *����    %�����  ����    �- ����  triple#    *����    '?����  ����    E- ����  bunch#    *����    (p����  ����    ����    ����  ����    ?   =���         �����    �����     ����      �    in_cooldown      7,                  (  ����    ����     ����   �- ����  torch#   q@�  ����  ���� yellow����  ���� sound      5����  ����       (�����    �����  ��������    )v����  ����    ?   =���         �����    c����     ����      �    in_cooldown      7,                  �  ����   ?   ���� ����        � ����   "- ����  	scannable#����     $ in_cooldown      3"    �            � center_scannable   @  �����  ���� $ ����  ���� text      5����  ����,           :,               ����   �  ����     >L��  ,           :,               ����   �  ����     @L��   	not_first      3"   � scan_number      3����  ����     scan_sound_����   \#  �����  ����   ����  � dialogue      5����  ����,           ����  �  @@    ,           :,               ����   �  ����     @@    ,           :,               ����   �  ����     @�    ,           6,                   �  ����     A         	not_first      7 ����        ?   =���         �  �   ;    in_cooldown      7,               ����   �  @�    ,                  �  A      ����   - ����  	audio_log#����     $ in_cooldown      3"     � 
log_number      3����  ���� log_����   \# _trigger#����  ����    ����   �����  ����    ����   �     play_audio_log   ����   -   �   �����  ��������  MR_Melody_Puzzle#    +     mel_pulse_effect      �- ����  MR_Floor_LU_Puzzle#    +     flu_pulse_effect      O- ����  MR_Echo_Puzzle#    +     ech_pulse_effect       ���� ����   lit����   3"    D���� ���� ����     .    lit����   7     ����  ����    4����  ����    ����  ��������  large#    >   ����  ��������    �����  ����    Y- ����  small#    >   ����  ��������    �����  ����        ���� ����      �����     -    ���� ����      �     ���� ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����  ����  blue#        �����  ����   �- ����  blue_d#        �����  ����   c- ����  blue_l#        �����  ����   -- ����  cyan#        �����  ����   �- ����  green#        �����  ����   �- ����  green_d#        �����  ����   �- ����  green_l#        �����  ����   V- ����  brown#        �����  ����   !- ����  orange#        �����  ����   �- ����  magenta#        �����  ����   �- ����  purple#        �����  ����   ~- ����  red#        �����  ����   K- ����  red_d#        �����  ����   - ����  red_l#        �����  ����    �- ����  white#        �����  ����    �- ����  yellow#        �����  ����    v- ����  yellow_d#        �����  ����    >- ����  yellow_l#        �����  ����        ����   �����  ����     ���� ���� ����  ����  blue#        �����  ����   �- ����  blue_d#        �����  ����   c- ����  blue_l#        �����  ����   -- ����  cyan#        �����  ����   �- ����  green#        �����  ����   �- ����  green_d#        �����  ����   �- ����  green_l#        �����  ����   V- ����  brown#        �����  ����   !- ����  orange#        �����  ����   �- ����  magenta#        �����  ����   �- ����  purple#        �����  ����   ~- ����  red#        �����  ����   K- ����  red_d#        �����  ����   - ����  red_l#        �����  ����    �- ����  white#        �����  ����    �- ����  yellow#        �����  ����    v- ����  yellow_d#        �����  ����    >- ����  yellow_l#        �����  ����        ����   �����  ����     ���� ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����       in_cooldown����   7 ����  ?   ����  ��������     �����  ����    ����  �������� ���� !  �����  ����,            >���� ���� ���� ���� ���� ����      ����    ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ���� ����      �    ���� =���   ����   �����  �������     ����  ����,           >���� ���� ���� ���� ���� ����  ���U  ����        ����  ����  note_A_below#       �����  ����   ,- ����  note_B_above#       �����  ����    �- ����  note_C#       �����  ����    �- ����  note_D_above#       �����  ����    ~- ����  note_F_below#       �����  ����    B- ����  note_G_above#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          $ drum_1����  ����    r- ����         $ drum_2����  ����    <- ����         $ drum_3����  ����    ����  sound      9 ����    ����  drum_1#       �����  ����    r- ����  drum_2#       �����  ����    <- ����  drum_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & double_1����  ����    v- ����         & double_2����  ����    >- ����         & double_3����  ����    ����  sound      9 ����    ����  double_1#       �����  ����    v- ����  double_2#       �����  ����    >- ����  double_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & triple_1����  ����    >- ����         & triple_2����  ����    ����  sound      9 ����    ����  triple_1#       �����  ����    >- ����  triple_2#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          % bunch_1����  ����    t- ����         % bunch_2����  ����    =- ����         % bunch_3����  ����    ����  sound      9 ����    ����  bunch_1#       �����  ����    t- ����  bunch_2#       �����  ����    =- ����  bunch_3#       �����  ����        ����   �����  ����     ���� ���� ����   lit����   3"    �       �  �����  ����    ���� ����      �,               ?�     � ,  ����       lit����   7 ����     ����  ����  torch_A#       ����  ����    �- ����  torch_C#       ����  ����    �- ����  torch_D#       ����  ����    t- ����  torch_F#       ����  ����    =- ����  torch_G#       ����  ����        ����   �����  ����     ���� ���� ����  // Any object to be affected by the pulse must have two local variables:
//     int    can_be_pulsed = 1
//     string pulse_type    = (custom tag to determine effect)

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"
#include "support_effects"
#include "support_sound"

// The height at which pulses are initiated from objects.
const float height = 0.5;

void main()
{
    // Figure out how the object should react to the pulse.
    string type = GetLocalString(OBJECT_SELF, "pulse_type");

    // Play a long hum and emit a pulse, light up and stay lit after a pulse.
    if (type == "beacon") {
        // Get necessary local variables.
        float time = GetLocalFloat(OBJECT_SELF, "time");
        string color = GetLocalString(OBJECT_SELF, "color");

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            // Will stay lit after the first pulse.
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color, "small");

            // Get and apply temporary pulse and sound effects.
            int ePulse = GetPulseEffectLarge(color);
            effect eSound = EffectVisualEffect(730); // VFX_DUR_BEACON
            TLVFXPillar(ePulse, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSound, OBJECT_SELF, time);

            // Apply cooldown period in which object will only emit mini-pulses.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown(OBJECT_SELF));
            SetupMiniPulse(OBJECT_SELF, color, time, height);
        }
    }

    // Play a single note and emit a pulse, light up and stay lit after a pulse.
    else if (type == "note") {
        // Get necessary local variables.
        float time = GetLocalFloat(OBJECT_SELF, "time");
        string color = GetLocalString(OBJECT_SELF, "color");
        string sound = GetLocalString(OBJECT_SELF, "sound");

        // Randomly set a color/sound pair if this hasn't been done yet.
        if (color == "") {
            int rand_num = Random(17);

            if (rand_num == 0 || rand_num == 1 || rand_num == 2) {
                color = "brown";
                sound = "note_A_below";
            }
            else if (rand_num == 3 || rand_num == 4) {
                color = "blue_l";
                sound = "note_B_above";
            }
            else if (rand_num == 5 || rand_num == 6 || rand_num == 7) {
                color = "red_l";
                sound = "note_C";
            }
            else if (rand_num == 8 || rand_num == 9 || rand_num == 10) {
                color = "green_l";
                sound = "note_D_above";
            }
            else if (rand_num == 11 || rand_num == 12 || rand_num == 13) {
                color = "yellow";
                sound = "note_F_below";
            }
            else if (rand_num == 14 || rand_num == 15 || rand_num == 16) {
                color = "white";
                sound = "note_G_above";
            }

            SetLocalString(OBJECT_SELF, "color", color);
            SetLocalString(OBJECT_SELF, "sound", sound);
        }

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            // Will stay lit after the first pulse.
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color, "small");

            // Get and apply temporary pulse and sound effects.
            int ePulse = GetPulseEffectLarge(color);
            effect eSound = GetSoundNote(sound);
            TLVFXPillar(ePulse, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSound, OBJECT_SELF, time);

            // Apply cooldown period in which object will only emit mini-pulses.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown(OBJECT_SELF));
            SetupMiniPulse(OBJECT_SELF, color, time, height);
        }
    }

    // Play a sound from a set and emit a pulse, light up and stay lit after a pulse.
    else if ( (type == "drum") || (type == "double") || (type == "triple") || (type == "bunch") ) {
        // Get necessary local variables.
        string color = GetLocalString(OBJECT_SELF, "color");
        string sound = GetLocalString(OBJECT_SELF, "sound");

        // Use constant time regardless of type.
        float time = 1.0;

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            // Will stay lit after the first pulse.
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color, "small");

           // Get temporary sound effect depending on the type of object.
            effect eSound;
            if (type == "drum") eSound = GetSoundDrum(sound);
            else if (type == "double") eSound = GetSoundDouble(sound);
            else if (type == "triple") eSound = GetSoundTriple(sound);
            else if (type == "bunch") eSound = GetSoundBunch(sound);

            // Get and apply temporary pulse effect, apply temporary sound effect.
            int ePulse = GetPulseEffectLarge(color);
            TLVFXPillar(ePulse, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSound, OBJECT_SELF, time);

            // Apply cooldown period in which object can't be pulsed.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown(OBJECT_SELF));
        }
    }

    // Light up a large area of effect torch and play a torch sound.
    else if (type == "torch") {
        float time = 4.5;
        string color = "yellow";
        string sound = GetLocalString(OBJECT_SELF, "sound");

        LightUpTorchIfUnlit(OBJECT_SELF);

        int ePulse = GetPulseEffectLarge(color);
        effect eSound = GetTorchSound(sound);
        TLVFXPillar(ePulse, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSound, OBJECT_SELF, time);

        // Apply cooldown period in which object can't be pulsed.
        SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
        DelayCommand(time, RemoveCooldown(OBJECT_SELF));
        SetupMiniPulse(OBJECT_SELF, color, time, height);
    }

    // A curious object that will display text when scanned.
    else if ( (type == "scannable") && (!GetLocalInt(OBJECT_SELF, "in_cooldown")) ) {
        object oCenter = CreateObject(OBJECT_TYPE_PLACEABLE, "center_scannable", GetLocation(OBJECT_SELF));
        object oPC = GetFirstPC();

        // Have the text appear above the scannable.
        string text = GetLocalString(OBJECT_SELF, "text");
        DelayCommand(0.2, AssignCommand(oCenter, SpeakString(text)));
        DelayCommand(3.2, AssignCommand(oCenter, SpeakString(text)));

        if (!GetLocalInt(OBJECT_SELF, "not_first")) {
            // Get the sound object for the dialogue the PC will speak.
            int scan_number = GetLocalInt(OBJECT_SELF, "scan_number");
            object oSound = GetObjectByTag("scan_sound_" + IntToString(scan_number));
            SoundObjectSetVolume(oSound, 127);

            // Have the PC speak their dialogue.
            string dialogue = GetLocalString(OBJECT_SELF, "dialogue");
            DelayCommand(3.0, SoundObjectPlay(oSound));
            DelayCommand(3.0, AssignCommand(oPC, SpeakString(dialogue)));
            DelayCommand(6.0, AssignCommand(oPC, SpeakString(dialogue)));
            DelayCommand(10.0, AssignCommand(oPC, SpeakString("")));

            // The dialogue will only be spoken the first pulse.
            SetLocalInt(OBJECT_SELF, "not_first", TRUE);
        }

        // VFX_IMP_SCANNABLE_PULSE
        TLVFXPillar(686, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

        // Apply cooldown period in which object will only emit mini-pulses.
        SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
        DelayCommand(7.0, DestroyObject(oCenter));
        DelayCommand(10.0, RemoveCooldown(OBJECT_SELF));
    }

    // An audio log object laying on the ground.
    else if ( (type == "audio_log") && (!GetLocalInt(OBJECT_SELF, "in_cooldown")) ) {
        int log_number = GetLocalInt(OBJECT_SELF, "log_number");
        string trigger = "log_" + IntToString(log_number) + "_trigger";

        // Get the trigger that activates this log and destroy it.
        object oTrigger = GetObjectByTag(trigger);
        DestroyObject(oTrigger);

        ExecuteScript("play_audio_log", OBJECT_SELF);
    }

    // Otherwise call a module specific script.
    else {
        string tagModule = GetTag(GetModule());
        if (tagModule == "MR_Melody_Puzzle") ExecuteScript("mel_pulse_effect", OBJECT_SELF);
        else if (tagModule == "MR_Floor_LU_Puzzle") ExecuteScript("flu_pulse_effect", OBJECT_SELF);
        else if (tagModule == "MR_Echo_Puzzle") ExecuteScript("ech_pulse_effect", OBJECT_SELF);
    }
}
UTT V3.28      P   !   �      �  w   S  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]            
      i             
      s   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            puzzle_camerapuzzle_camera   �9            Puzzle Camera            cmd_cam_switch     cam_type   puzzle                                	   
                                                                            FAC V3.28      p  M        �  5   �  4  �  l   ����<                                      $         0          D         P         \         h         t         �         �         �         �      	   �      
   �         �         �         �         �         �                                 (                      ����
                         ����
                        ����
                        ����
                        ����
      )                                                                           2                            2                            2                           d                                                                                                                                           d                           2                           d                                                       2                           d                           d                                                       2                           d                           d   FactionList     FactionParentID FactionName     FactionGlobal   RepList         FactionID1      FactionID2      FactionRep         PC   Hostile   Commoner   Merchant   Defender                        	   
                                                                          !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L                                 	   
                                                UTP V3.28      �   E   �  8   <  T  �    �	     ����    6       �          �          �          �               
                          ;         O                               ^                          	           
                                                                                                                          
      _                    �                                                                     c          d      !   e      "   f      #   g      $   h      %   i      &   j      '   k      (   l      )   m      *   n      +   o      ,       
   -   p      .         /      
   -   �      .      
   /   �   
   -   �      .      
   /   �   
   -        .      
   /     
   -   ?     .         /          0           1           2           .           3          4   N     5   O      6      
   7   P  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject$   H            Scan 1 - Tree Branch   9             s1_tree_branch                     can_be_pulsed   text`   A blue coloured branch with glowing berries. Their composition is cherry-like and likely edible.
   pulse_type	   scannable   dialogue'   Oh my god. We could actually live here.   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  M  �    �	     ����    6       �          �          �          �               
                          9         M                               Z                          	           
                                             T                                                                           
      [                    �                                                                    _          `      !   a      "   b      #   c      $   d      %   e      &   f      '   g      (   h      )   i      *   j      +   k      ,       
   -   l      .         /      
   -   }      .      
   /   �   
   -   �      .      
   /   
  
   -        .      
   /   #  
   -   8     .         /          0           1           2           .           3          4   G     5   H      6      
   7   I  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject"   H            Scan 2 - Beak Rock   9             s2_beak_rock                     can_be_pulsed   texts   A beak-shaped rock with berry shells scattered on the ground. The rock is well worn where something has gripped it.
   pulse_type	   scannable   dialogue   Hmm. A hand tool?   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  S  �    �	     ����    6       �          �          �          �               
                          <         P                               `                          	           
                                             w                                                                           
      a                                                                                         e          f      !   g      "   h      #   i      $   j      %   k      &   l      '   m      (   n      )   o      *   p      +   q      ,       
   -   r      .         /      
   -   �      .      
   /   �   
   -   �      .      
   /   
  
   -        .      
   /   #  
   -   >     .         /          0           1           2           .           3          4   M     5   N      6      
   7   O  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject%   H            Scan 3 - Stuffed Doll   9             s3_stuffed_doll                     can_be_pulsed   textm   A small, stuffed doll with wooden legs and wings. Given current surroundings, its presence here is anomalous.
   pulse_type	   scannable   dialogue   What's this doing here?   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  r  �    �	     ����    6       �          �          �          �               
                          7         K                               V                          	           
                                             �                                                                           
      W                    ;                                                                    [          \      !   ]      "   ^      #   _      $   `      %   a      &   b      '   c      (   d      )   e      *   f      +   g      ,       
   -   h      .         /      
   -   y      .      
   /   �   
   -   �      .      
   /   	  
   -        .      
   /   "  
   -   ]     .         /          0           1           2           .           3          4   l     5   m      6      
   7   n  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject    H            Scan 4 - Ceiling   9             
s4_ceiling                     can_be_pulsed   textv   The ceiling above this position opens up to night sky. With a high-powered telescope, the Sol system would be visible.
   pulse_type	   scannable   dialogue7   Looks like we're not the only ones looking up, Tabitha.   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  W  �    �	     ����    6       �          �          �          �               
                          8         L                               X                          	           
                                                                                                                          
      Y                    �                                                                     ]          ^      !   _      "   `      #   a      $   b      %   c      &   d      '   e      (   f      )   g      *   h      +   i      ,       
   -   j      .         /      
   -   {      .      
   /   �   
   -   �      .      
   /   �   
   -        .      
   /     
   -   B     .         /          0           1           2           .           3          4   Q     5   R      6      
   7   S  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject!   H            Scan 5 - Necklace   9             s5_necklace                     can_be_pulsed   textd   A necklace of unknown origin. It is made of materials both found on Earth and native to this planet.
   pulse_type	   scannable   dialogue,   Huh. Now is this Tabitha's, or the Aquila's?   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  k  �    �	     ����    6       �          �          �          �               
                          ;         O                               ^                          	           
                                             �                                                                           
      _                    5                                                                    c          d      !   e      "   f      #   g      $   h      %   i      &   j      '   k      (   l      )   m      *   n      +   o      ,       
   -   p      .         /      
   -   �      .      
   /   �   
   -        .      
   /   &  
   -   3     .      
   /   ?  
   -   V     .         /          0           1           2           .           3          4   e     5   f      6      
   7   g  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject$   H            Scan 6 - Plant Stalk   9             s6_plant_stalk                     can_be_pulsed   text�   A piece of dry stalk from a native cereal plant, tightly wound. Like other tree and woody plants found here, it bears a faint, blue colour.
   pulse_type	   scannable   dialogue   Straw. From a nest?   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTP V3.28      �   E   �  8   <  z  �    �	     ����    6       �          �          �          �               
                          :         N                               \                          	           
                                                                                                                          
      ]                    �                                                                     a          b      !   c      "   d      #   e      $   f      %   g      &   h      '   i      (   j      )   k      *   l      +   m      ,       
   -   n      .         /      
   -         .      
   /   �   
   -   (     .      
   /   6  
   -   C     .      
   /   O  
   -   e     .         /          0           1           2           .           3          4   t     5   u      6      
   7   v  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject#   H            Scan 7 - Paintbrush   9             s7_paintbrush                     can_be_pulsed   text�   A thin stick of bluish wood, clearly carved. The surface is scratched in several places. Bristles protrude from the end, covered in a dried orange substance.
   pulse_type	   scannable   dialogue   It's a paintbrush.   scan_number                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   <   =   >   ?   @   A   B   C   D   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;                     UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_1   ����          Scan Sound 1scan_sound_1scannable_1                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_2   ����          Scan Sound 2scan_sound_2scannable_2                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_3   ����          Scan Sound 3scan_sound_3scannable_3                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_4   ����          Scan Sound 4scan_sound_4scannable_4                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_5   ����          Scan Sound 5scan_sound_5scannable_5                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_6   ����          Scan Sound 6scan_sound_6scannable_6                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =              
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_7   ����          Scan Sound 7scan_sound_7scannable_7                                	   
                                                   ITP V3.28   #   �  J   T     �  B  �  $  	  �   ����                                                    $          ,          4          @          H          P          X          `          h          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                           &                      
                   
               #   
      /         8         9�                  �                  �                  0   
      >         N   
      V         a   
      i         t         �                          @                             X   
      |         �   
      �         �   
      �         �   
      �         �   
      �         �   
                
              .  
      ;        K  
      X        h  
      u        �  
      �        �  
      �        �  
      �        �        !                  �   
      �        �  
                      "                  �   
      )        7        #                  $                  �            MAIN            STRREF          ID              LIST            NAME            RESREF             Gorillagorilla   Jungle Birdsjunglebirds   Lionslions   Jungle Nightjungle3   Jungle1jungle1   Jungle2jungle2   Log 1 Soundlog_1_sound   Log 2 Soundlog_2_sound   Log 3 Soundlog_3_sound   Log 4 Soundlog_4_sound   Log 5 Soundlog_5_sound   Log 6 Soundlog_6_sound   Scan Sound 1scan_sound_1   Scan Sound 2scan_sound_2   Scan Sound 3scan_sound_3   Scan Sound 4scan_sound_4   Scan Sound 5scan_sound_5   Scan Sound 6scan_sound_6   Scan Sound 7scan_sound_7   Temple Ambiencetemple_ambience   Weather Rainweather_rain
   Intro Line
intro_line                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I                        "                     	   
                   !                                                            ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                       �                                                       !                  "                  #                  $            MAIN            STRREF          ID              LIST                                    	   
                                          // Script containing supporting functions dealing with color and
// colored effects.
//
// RGB Formats:
//     blue     = 0.0   0.0   1.0
//     blue_d   = "     "     "
//     blue_l   = "     "     "
//     brown    = 0.4   0.2   0.0
//     cyan     = 0.0   0.6   0.6
//     green    = 0.0   0.6   0.0
//     green_d  = "     "     "
//     green_l  = "     "     "
//     magenta  = 0.6   0.0   0.6
//     orange   = 0.6   0.3   0.0
//     purple   = 0.3   0.0   0.3
//     red      = 0.6   0.0   0.0
//     red_d    = "     "     "
//     red_l    = "     "     "
//     white    = 1.0   1.0   1.0
//     yellow   = 0.6   0.6   0.0
//     yellow_d = "     "     "
//     yellow_l = "     "     "

effect GetGlowEffect(string color)
{
    int value;

    if (color == "blue") value = VFX_DUR_AURA_BLUE;
    else if (color == "blue_d") value = VFX_DUR_AURA_BLUE_DARK;
    else if (color == "blue_l") value = VFX_DUR_AURA_BLUE_LIGHT;

    else if (color == "brown") value = VFX_DUR_AURA_BROWN;

    else if (color == "cyan") value = VFX_DUR_AURA_CYAN;

    else if (color == "green") value = VFX_DUR_AURA_GREEN;
    else if (color == "green_d") value = VFX_DUR_AURA_GREEN_DARK;
    else if (color == "green_l") value = VFX_DUR_AURA_GREEN_LIGHT;

    else if (color == "magenta") value = VFX_DUR_AURA_MAGENTA;

    else if (color == "orange") value = VFX_DUR_AURA_ORANGE;

    else if (color == "purple") value = VFX_DUR_AURA_PURPLE;

    else if (color == "red") value = VFX_DUR_AURA_RED;
    else if (color == "red_d") value = VFX_DUR_AURA_RED_DARK;
    else if (color == "red_l") value = VFX_DUR_AURA_RED_LIGHT;

    else if (color == "white") value = VFX_DUR_AURA_WHITE;

    else if (color == "yellow") value = VFX_DUR_AURA_YELLOW;
    else if (color == "yellow_d") value = VFX_DUR_AURA_YELLOW_DARK;
    else if (color == "yellow_l") value = VFX_DUR_AURA_YELLOW_LIGHT;

    return EffectVisualEffect(value);
}

effect GetLightEffectLarge(string color)
{
    int value;

    if (color == "blue") value = VFX_DUR_LIGHT_BLUE_20;
    else if (color == "blue_d") value = VFX_DUR_LIGHT_BLUE_20;
    else if (color == "blue_l") value = VFX_DUR_LIGHT_BLUE_20;
    else if (color == "cyan") value = VFX_DUR_LIGHT_BLUE_20;      // No cyan.

    else if (color == "green") value = VFX_DUR_LIGHT_GREY_20;     // Is actually
    else if (color == "green_d") value = VFX_DUR_LIGHT_GREY_20;   // green, NWN
    else if (color == "green_l") value = VFX_DUR_LIGHT_GREY_20;   // is just dumb.

    else if (color == "brown") value = VFX_DUR_LIGHT_ORANGE_20;   // No brown.
    else if (color == "orange") value = VFX_DUR_LIGHT_ORANGE_20;

    else if (color == "magenta") value = VFX_DUR_LIGHT_PURPLE_20; // No magenta.
    else if (color == "purple") value = VFX_DUR_LIGHT_PURPLE_20;

    else if (color == "red") value = VFX_DUR_LIGHT_RED_20;
    else if (color == "red_d") value = VFX_DUR_LIGHT_RED_20;
    else if (color == "red_l") value = VFX_DUR_LIGHT_RED_20;

    else if (color == "white") value = VFX_DUR_LIGHT_WHITE_20;

    else if (color == "yellow") value = VFX_DUR_LIGHT_YELLOW_20;
    else if (color == "yellow_d") value = VFX_DUR_LIGHT_YELLOW_20;
    else if (color == "yellow_l") value = VFX_DUR_LIGHT_YELLOW_20;

    return EffectVisualEffect(value);
}

effect GetLightEffectSmall(string color)
{
    int value;

    if (color == "blue") value = VFX_DUR_LIGHT_BLUE_5;
    else if (color == "blue_d") value = VFX_DUR_LIGHT_BLUE_5;
    else if (color == "blue_l") value = VFX_DUR_LIGHT_BLUE_5;
    else if (color == "cyan") value = VFX_DUR_LIGHT_BLUE_5;      // No cyan.

    else if (color == "green") value = VFX_DUR_LIGHT_GREY_5;     // Is actually
    else if (color == "green_d") value = VFX_DUR_LIGHT_GREY_5;   // green, NWN
    else if (color == "green_l") value = VFX_DUR_LIGHT_GREY_5;   // is just dumb.

    else if (color == "brown") value = VFX_DUR_LIGHT_ORANGE_5;   // No brown.
    else if (color == "orange") value = VFX_DUR_LIGHT_ORANGE_5;

    else if (color == "magenta") value = VFX_DUR_LIGHT_PURPLE_5; // No magenta.
    else if (color == "purple") value = VFX_DUR_LIGHT_PURPLE_5;

    else if (color == "red") value = VFX_DUR_LIGHT_RED_5;
    else if (color == "red_d") value = VFX_DUR_LIGHT_RED_5;
    else if (color == "red_l") value = VFX_DUR_LIGHT_RED_5;

    else if (color == "white") value = VFX_DUR_LIGHT_WHITE_5;

    else if (color == "yellow") value = VFX_DUR_LIGHT_YELLOW_5;
    else if (color == "yellow_d") value = VFX_DUR_LIGHT_YELLOW_5;
    else if (color == "yellow_l") value = VFX_DUR_LIGHT_YELLOW_5;

    return EffectVisualEffect(value);
}

int GetPulseEffectLarge(string color)
{
    int value;

    if (color == "blue") value = 700; // VFX_IMP_LARGE_BLUE
    else if (color == "blue_d") value = 700; // VFX_IMP_LARGE_BLUE
    else if (color == "blue_l") value = 700; // VFX_IMP_LARGE_BLUE

    else if (color == "brown") value = 701; // VFX_IMP_LARGE_BROWN

    else if (color == "cyan") value = 702; // VFX_IMP_LARGE_CYAN

    else if (color == "green") value = 703; // VFX_IMP_LARGE_GREEN
    else if (color == "green_d") value = 703; // VFX_IMP_LARGE_GREEN
    else if (color == "green_l") value = 703; // VFX_IMP_LARGE_GREEN

    else if (color == "magenta") value = 704; // VFX_IMP_LARGE_MAGENTA

    else if (color == "orange") value = 705; // VFX_IMP_LARGE_ORANGE

    else if (color == "purple") value = 706; // VFX_IMP_LARGE_PURPLE

    else if (color == "red") value = 707; // VFX_IMP_LARGE_RED
    else if (color == "red_d") value = 707; // VFX_IMP_LARGE_RED
    else if (color == "red_l") value = 707; // VFX_IMP_LARGE_RED

    else if (color == "white") value = 708; // VFX_IMP_LARGE_WHITE

    else if (color == "yellow") value = 709; // VFX_IMP_LARGE_YELLOW
    else if (color == "yellow_d") value = 709; // VFX_IMP_LARGE_YELLOW
    else if (color == "yellow_l") value = 709; // VFX_IMP_LARGE_YELLOW

    return value;
}

int GetPulseEffectSmall(string color)
{
    int value;

    if (color == "blue") value = 690; // VFX_IMP_SMALL_BLUE
    else if (color == "blue_d") value = 690; // VFX_IMP_SMALL_BLUE
    else if (color == "blue_l") value = 690; // VFX_IMP_SMALL_BLUE

    else if (color == "brown") value = 691; // VFX_IMP_SMALL_BROWN

    else if (color == "cyan") value = 692; // VFX_IMP_SMALL_CYAN

    else if (color == "green") value = 693; // VFX_IMP_SMALL_GREEN
    else if (color == "green_d") value = 693; // VFX_IMP_SMALL_GREEN
    else if (color == "green_l") value = 693; // VFX_IMP_SMALL_GREEN

    else if (color == "magenta") value = 694; // VFX_IMP_SMALL_MAGENTA

    else if (color == "orange") value = 695; // VFX_IMP_SMALL_ORANGE

    else if (color == "purple") value = 696; // VFX_IMP_SMALL_PURPLE

    else if (color == "red") value = 697; // VFX_IMP_SMALL_RED
    else if (color == "red_d") value = 697; // VFX_IMP_SMALL_RED
    else if (color == "red_l") value = 697; // VFX_IMP_SMALL_RED

    else if (color == "white") value = 698; // VFX_IMP_SMALL_WHITE

    else if (color == "yellow") value = 699; // VFX_IMP_SMALL_YELLOW
    else if (color == "yellow_d") value = 699; // VFX_IMP_SMALL_YELLOW
    else if (color == "yellow_l") value = 699; // VFX_IMP_SMALL_YELLOW

    return value;
}

effect GetTrailEffect(string color)
{
    int value;

    if (color == "green") value = 765; // VFX_DUR_GHOST_TRAIL_G
    else if (color == "blue") value = 766; // VFX_DUR_GHOST_TRAIL_B
    else if (color == "orange") value = 767; // VFX_DUR_GHOST_TRAIL_O
    else if (color == "magenta") value = 768; // VFX_DUR_GHOST_TRAIL_P

    return EffectVisualEffect(value);
}

int GetEchoUrnPulse(string color)
{
    int value;

    if (color == "blue") value = 714; // VFX_IMP_URN_PULSE_BLUE
    else if (color == "blue_d") value = 714; // VFX_IMP_URN_PULSE_BLUE
    else if (color == "blue_l") value = 714; // VFX_IMP_URN_PULSE_BLUE

    else if (color == "brown") value = 715; // VFX_IMP_URN_PULSE_BROWN

    else if (color == "cyan") value = 716; // VFX_IMP_URN_PULSE_CYAN

    else if (color == "green") value = 717; // VFX_IMP_URN_PULSE_GREEN
    else if (color == "green_d") value = 717; // VFX_IMP_URN_PULSE_GREEN
    else if (color == "green_l") value = 717; // VFX_IMP_URN_PULSE_GREEN

    else if (color == "magenta") value = 718; // VFX_IMP_URN_PULSE_MAGENTA

    else if (color == "orange") value = 719; // VFX_IMP_URN_PULSE_ORANGE

    else if (color == "purple") value = 720; // VFX_IMP_URN_PULSE_PURPLE

    else if (color == "red") value = 721; // VFX_IMP_URN_PULSE_RED
    else if (color == "red_d") value = 721; // VFX_IMP_URN_PULSE_RED
    else if (color == "red_l") value = 721; // VFX_IMP_URN_PULSE_RED

    else if (color == "white") value = 722; // VFX_IMP_URN_PULSE_WHITE

    else if (color == "yellow") value = 723; // VFX_IMP_URN_PULSE_YELLOW
    else if (color == "yellow_d") value = 723; // VFX_IMP_URN_PULSE_YELLOW
    else if (color == "yellow_l") value = 723; // VFX_IMP_URN_PULSE_YELLOW

    return value;
}
// Script containing supporting functions for repeated procedures.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

// For GenerateNewLocationFromLocation(location, float, float, float)
#include "x0_i0_position"

#include "support_color"

void RemoveCooldown(object oAffected)
{
    SetLocalInt(oAffected, "in_cooldown", FALSE);
}

void ApplyLightAndGlowEffectToObject(object oAffected, string color, string size)
{
    effect eGlow = GetGlowEffect(color);

    effect eLight;
    int light = FALSE;
    if (size == "large") {
        light = TRUE;
        eLight = GetLightEffectLarge(color);
    } else if (size == "small") {
        light = TRUE;
        eLight = GetLightEffectSmall(color);
    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oAffected);
    if (light) ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oAffected);
}

void ApplyLightAndGlowEffectIfUnlit(object oAffected, string color, string size)
{
    if (!GetLocalInt(oAffected, "lit")) {
        ApplyLightAndGlowEffectToObject(oAffected, color, size);

        // Set flag on object that it is lit up now.
        SetLocalInt(oAffected, "lit", TRUE);
    }
}

void LightUpTorchIfUnlit(object oAffected)
{
    if (!GetLocalInt(oAffected, "lit")) {
        effect eLight = EffectVisualEffect(VFX_DUR_LIGHT_ORANGE_20);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oAffected);
        AssignCommand(oAffected, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

        // Set flag on object that it is lit up now.
        SetLocalInt(oAffected, "lit", TRUE);
    }
}

void RemoveAllVisualEffects(object oAffected)
{
    effect eLoop = GetFirstEffect(oAffected);

    while (GetIsEffectValid(eLoop)) {
        if (GetEffectType(eLoop) == EFFECT_TYPE_VISUALEFFECT) {
            RemoveEffect(oAffected, eLoop);
        }
        eLoop = GetNextEffect(oAffected);
    }
}

void RemoveAllEffects(object oAffected)
{
    effect eLoop = GetFirstEffect(oAffected);

    while (GetIsEffectValid(eLoop)) {
        RemoveEffect(oAffected, eLoop);
        eLoop = GetNextEffect(oAffected);
    }
}

// Emit mini-pulses on a set interval until the max to emit has been reached.
void MiniPulse(object oAffected, int ePulse, float pulse_time, float height, int counter, int max)
{
    if (counter < max) {
        TLVFXPillar(ePulse, GetLocation(oAffected), 1, 0.1, height, 0.0);
        counter += 1;
        DelayCommand(pulse_time, MiniPulse(oAffected, ePulse, pulse_time, height, counter, max));
    }
}

// Based on the time the calling object stays on, and a set interval time,
// a max number of mini-pulses to emit over the time is calculated.
void SetupMiniPulse(object oAffected, string color, float time, float height)
{
    float pulse_time = 0.5;

    int ePulse = GetPulseEffectSmall(color);
    int counter = 0;
    int max = FloatToInt(time / pulse_time);

    DelayCommand(pulse_time, MiniPulse(oAffected, ePulse, pulse_time, height, counter, max));
}
NCS V1.0B           // Script containing supporting functions for sound effects.

// Get preset sound for "note" type objects.
effect GetSoundNote(string sound)
{
    int value;

    if (sound == "note_A_below") value = 733; // VFX_DUR_A_BELOW
    else if (sound == "note_B_above") value = 734; // VFX_DUR_B_ABOVE
    else if (sound == "note_C") value = 735; // VFX_DUR_C
    else if (sound == "note_D_above") value = 736; // VFX_DUR_D_ABOVE
    else if (sound == "note_F_below") value = 737; // VFX_DUR_F_BELOW
    else if (sound == "note_G_above") value = 738; // VFX_DUR_G_ABOVE

    return EffectVisualEffect(value);
}

// Get sound for "drum" type objects.
effect GetSoundDrum(string sound)
{
    // If this is the first pulse, pick a random sound and set it.
    if (sound == "") {
        int rand_num = Random(3);

        if (rand_num == 0) sound = "drum_1";
        else if (rand_num == 1) sound = "drum_2";
        else if (rand_num == 2) sound = "drum_3";

        SetLocalString(OBJECT_SELF, "sound", sound);
    }

    int value;

    if (sound == "drum_1") value = 741; // VFX_DUR_DRUM_1
    else if (sound == "drum_2") value = 742; // VFX_DUR_DRUM_2
    else if (sound == "drum_3") value = 743; // VFX_DUR_DRUM_3

    return EffectVisualEffect(value);
}

// Get sound for "double" type objects.
effect GetSoundDouble(string sound)
{
    // If this is the first pulse, pick a random sound and set it.
    if (sound == "") {
        int rand_num = Random(3);

        if (rand_num == 0) sound = "double_1";
        else if (rand_num == 1) sound = "double_2";
        else if (rand_num == 2) sound = "double_3";

        SetLocalString(OBJECT_SELF, "sound", sound);
    }

    int value;

    if (sound == "double_1") value = 746; // VFX_DUR_DOUBLE_1
    else if (sound == "double_2") value = 747; // VFX_DUR_DOUBLE_2
    else if (sound == "double_3") value = 748; // VFX_DUR_DOUBLE_3

    return EffectVisualEffect(value);
}

// Get sound for "triple" type objects.
effect GetSoundTriple(string sound)
{
    // If this is the first pulse, pick a random sound and set it.
    if (sound == "") {
        int rand_num = Random(2);

        if (rand_num == 0) sound = "triple_1";
        else if (rand_num == 1) sound = "triple_2";

        SetLocalString(OBJECT_SELF, "sound", sound);
    }

    int value;

    if (sound == "triple_1") value = 751; // VFX_DUR_TRIPLE_1
    else if (sound == "triple_2") value = 752; // VFX_DUR_TRIPLE_2

    return EffectVisualEffect(value);
}

// Get sound for "bunch" type objects.
effect GetSoundBunch(string sound)
{
    // If this is the first pulse, pick a random sound and set it.
    if (sound == "") {
        int rand_num = Random(3);

        if (rand_num == 0) sound = "bunch_1";
        else if (rand_num == 1) sound = "bunch_2";
        else if (rand_num == 2) sound = "bunch_3";

        SetLocalString(OBJECT_SELF, "sound", sound);
    }

    int value;

    if (sound == "bunch_1") value = 755; // VFX_DUR_BUNCH_1
    else if (sound == "bunch_2") value = 756; // VFX_DUR_BUNCH_2
    else if (sound == "bunch_3") value = 757; // VFX_DUR_BUNCH_3

    return EffectVisualEffect(value);
}

effect GetTorchSound(string sound)
{
    int value;

    if (sound == "torch_A") value = 771; // VFX_DUR_TORCH_A
    else if (sound == "torch_C") value = 772; // VFX_DUR_TORCH_C
    else if (sound == "torch_D") value = 773; // VFX_DUR_TORCH_D
    else if (sound == "torch_F") value = 774; // VFX_DUR_TORCH_F
    else if (sound == "torch_G") value = 775; // VFX_DUR_TORCH_G

    return EffectVisualEffect(value);
}

effect GetUrnSoundNote(string sound)
{
    int value;

    if (sound == "urn_A") value = 778; // VFX_DUR_URN_A
    else if (sound == "urn_B") value = 779; // VFX_DUR_URN_B
    else if (sound == "urn_C") value = 780; // VFX_DUR_URN_C
    else if (sound == "urn_D") value = 781; // VFX_DUR_URN_D
    else if (sound == "urn_F") value = 782; // VFX_DUR_URN_F
    else if (sound == "urn_G") value = 783; // VFX_DUR_URN_G

    return EffectVisualEffect(value);
}
UTS V3.28      P      �     (  V   ~  d   �     ����                 
                          5                                                                       	     �?   
      A        �?                                                                                                                     E             
      R   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            TempleAmbience   ����          Temple Ambiencetemple_ambiencetemple_sound                                	   
                                                   UTT V3.28      P   !   �      �  {   W  �   �     ����           x      
                          !                                            
      C   
      G       	          
                                                                                                           K         L         M         N         O         ^         _             
      `            
      l             
      w   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            topdown_cameratopdown_camera   �9            Topdown Camera            cmd_cam_switch     cam_type   topdown                                	   
                                                                            ITP V3.28      X  1   �       �   �  �   �  p   ����                                                               ,          4          <          D          L          T          \          h          p          x          �          �          �          �          �          �          �          �                       :                  �                  �#                                                       0   
                   
               0   
      >         O   
      ]         n   
      |         �   
      �         �         !                  L   
      �         �   
      �         �         "                  #                  $                  �        X         ��                  �                  �                  �                  ��            MAIN            STRREF          ID              LIST            NAME            RESREF             Log 1 Triggerlog_1_trigger   Log 2 Triggerlog_2_trigger   Log 3 Triggerlog_3_trigger   Log 4 Triggerlog_4_trigger   Log 5 Triggerlog_5_trigger   Log 6 Triggerlog_6_trigger   Puzzle Camerapuzzle_camera   Topdown Cameratopdown_camera                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0                                                   	   
                                 NCS V1.0B  
           ]����  ��������    "   �����   �����  ��������  scannableObject#    � initialized����   3"    � blue_l   -����  ����    ���� ����      �����    �    initialized����   7 ����       �- ����  audioLog#    f initialized����   3"    <����    =    initialized����   7       - ����  t_Lit#    ����    	�    �- ����  wisp#    �����    
� color����   5����  ��������     �����  ����    ���� ����      �����    
�����  ����    ���� ����      � ����         ^����  ���� ���� ���Y ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����  ,           9        =���   ����   �  �    �        ,           9        =���   ����   �  �    �  ?     ,           9        =���   ����   �  �    F  ?�    ,           ����  ����  ?�     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����   playing����   3����  ���� red ��������  �������� "    |@   ����  ����?@  ���� !���� ����      �    ?   =���   ����   �  � ����   	- ?������  ���� play_attempt����   3����  ��������             ����         A    ���� ����      �   ����  ����    ����         =    ?   =���   ����   �  � ����     ����,           ����  ���  ����    ���� ����   lit����   3"    �       �  �����  ����    ���� ����      �,               ?�     � ,  ����       lit����   7 ����     ����  ����   U����  ��������   X    <���� ����   W����   V����  ���� ���� ���� ����  ����  green#       �����  ����    �- ����  blue#       �����  ����    s- ����  orange#       �����  ����    =- ����  magenta#        ����  ����        ����   �����  ����     ���� ���� ����  // Finds all objects in an area that must have permanent effects initialized
// to them, and initiates said effects.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"
#include "support_effects"

// The height at which pulses are initiated from objects.
const float height = 0.5;

void ScannableObject(object oScan);
void AudioLog(object oLog);

void main()
{
    object oLoop = GetFirstObjectInArea();

    // Keep going till every object in the area has been checked.
    while (oLoop != OBJECT_INVALID)
    {

        string object_tag = GetTag(oLoop);

        // Scannable objects that will continuously emit mini-pulses.
        if (object_tag == "scannableObject") {
            if (!GetLocalInt(oLoop, "initialized")) {
                effect eGlow = GetGlowEffect("blue_l");
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oLoop);
                ScannableObject(oLoop);
                SetLocalInt(oLoop, "initialized", TRUE);
            }
        }

        else if (object_tag == "audioLog") {
            if (!GetLocalInt(oLoop, "initialized")) {
                AudioLog(oLoop);
                SetLocalInt(oLoop, "initialized", TRUE);
            }
        }

        else if (object_tag == "t_Lit") {
            LightUpTorchIfUnlit(oLoop);
        }

        else if (object_tag == "wisp") {
            RemoveAllEffects(oLoop);

            string color = GetLocalString(oLoop, "color");

            effect eGlow = GetGlowEffect(color);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oLoop);

            effect eGhost = GetTrailEffect(color);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oLoop);
        }

        oLoop = GetNextObjectInArea();
    }
}

// Indefinitely repeat an effect on a scannable object every set amount of time.
void ScannableObject(object oScan)
{
    // VFX_IMP_SCANNABLE_EFFECT
    DelayCommand(0.0, TLVFXPillar(687, GetLocation(oScan), 1, 0.1, 0.0, 0.0));
    DelayCommand(0.5, TLVFXPillar(687, GetLocation(oScan), 1, 0.1, 0.0, 0.0));
    DelayCommand(1.0, TLVFXPillar(687, GetLocation(oScan), 1, 0.1, 0.0, 0.0));

    DelayCommand(1.5, ScannableObject(oScan));
}

// Play effects on audio log depending on its state.
void AudioLog(object oLog)
{
    int playing = GetLocalInt(oLog, "playing");
    float time;
    effect eGlow = GetGlowEffect("red");

    // The "off" state.
    if (!playing) {
        time = 2.0;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlow, oLog, 0.75 * time);
        // VFX_IMP_LOG_PULSE_LARGE
        TLVFXPillar(683, GetLocation(oLog), 1, 0.1, height, 0.0);
    }

    // The "on" state.
    else {
        time = 0.6;
        int play_attempt = GetLocalInt(oLog, "play_attempt");

        // The player is walking towards the log at this point.
        if (play_attempt == 1) {}

        // Apply the glow effect that will last the duration of the pulse.
        if (play_attempt == 2) {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oLog);
            play_attempt = 3;
        }

        // This part gets repeated while the log is playing.
        if (play_attempt == 3) {
            // VFX_IMP_LOG_PULSE_SMALL
            TLVFXPillar(682, GetLocation(oLog), 1, 0.1, height, 0.0);
        }
    }

    DelayCommand(time, AudioLog(oLog));
}
NCS V1.0B  1      @`      �      U����  ��������   X    _����   �   J     %����       W    +          V����  ���� ���� ����   <My scanner shows a large, unnatural object to the northeast.����  ����     
intro_line  �����  ����   ����  � $ ����  ����,           :,               ����   �  ����     ����   ,           ����  �  ����   ,           6,                   �  ����     ���� @�  !   ���� ����  // Remove the freeze effect from the player and let them move again.

void DisplayIntroLine(float baseDelay);

void main()
{
    DisplayIntroLine(3.5f);
    effect eLoop = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eLoop)) {
        // There are two effects on the player at this point, the darkness
        // which we want to leave on and the freeze. The freeze is not a
        // visual effect.
        if (GetEffectType(eLoop) != EFFECT_TYPE_VISUALEFFECT) {
            RemoveEffect(OBJECT_SELF, eLoop);
            break;
        }
        eLoop = GetNextEffect(OBJECT_SELF);
    }
}

void DisplayIntroLine(float baseDelay)
{
    string text = "My scanner shows a large, unnatural object to the northeast.";
    object oSound = GetObjectByTag("intro_line");
    SoundObjectSetVolume(oSound, 127);

    object oPC = GetFirstPC();

    DelayCommand(baseDelay, AssignCommand(oPC, SpeakString(text)));
    DelayCommand(baseDelay, SoundObjectPlay(oSound));
    DelayCommand(baseDelay + 4.0f, AssignCommand(oPC, SpeakString("")));
}
NCS V1.0B  �         ����  ��������   �"     ����    �    ,           #����  
enter_area          ,           %     hit_f1����   7  =���   � ����  ����    ���� ����      �,           ����       @�     ����   hit_f1����   3        _    .-    ����  Hit F1 to pulse ,           ����  ����  @      ����  // Custom script for OnClientEnter under:
// Edit -> Module Properties -> Events
//
// This script runs our custom enter_module script, and also initiates a quick
// pulse tutorial. Default script for OnClientEnter is "x3_mod_def_enter".

void HitF1Prompt(object oPC);

void main()
{
    // Determine if entering object is the PC.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC)) return;

    DelayCommand(0.0, ExecuteScript("enter_area", oPC));
    DelayCommand(0.1, SetLocalInt(oPC, "hit_f1", 0));

    // Effect to immobilize the player for the tutorial.
    effect freezeEffect = EffectCutsceneImmobilize();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, freezeEffect, oPC);

    DelayCommand(5.0, HitF1Prompt(oPC));
}

// Keep prompting the player to hit F1 to use their pulse for the first time.
void HitF1Prompt(object oPC)
{
    if (GetLocalInt(oPC, "hit_f1"))
        return;
    else
        FloatingTextStringOnCreature("Hit F1 to pulse", oPC);

    // Recursively call itself on a delay to act as a pseudo-heartbeat.
    DelayCommand(2.0, HitF1Prompt(oPC));
}
UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 	         +         ?                               G                          	           
                                             �                                                                           
      H                    	                                                                    L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit, A   29             t_lit_a                     can_be_pulsed
   pulse_type   torch   sound   torch_A                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 	         +         ?                               G                          	           
                                             �                                                                           
      H                    	                                                                    L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit, C   29             t_lit_c                     can_be_pulsed
   pulse_type   torch   sound   torch_C                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 	         +         ?                               G                          	           
                                             �                                                                           
      H                    	                                                                    L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit, D   29             t_lit_d                     can_be_pulsed
   pulse_type   torch   sound   torch_D                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 	         +         ?                               G                          	           
                                             �                                                                           
      H                    	                                                                    L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit, F   29             t_lit_f                     can_be_pulsed
   pulse_type   torch   sound   torch_F                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   w  �   s     ����    6       �          �          �      
                 	         +         ?                               G                          	           
                                             �                                                                           
      H                    	                                                                    L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit, G   29             t_lit_g                     can_be_pulsed
   pulse_type   torch   sound   torch_G                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          /         C                               M                          	           
                                             �                                                                           
      N                    	                                                                    R          S      !   T      "   U      #   V      $   W      %   X      &   Y      '   Z      (   [      )   \      *   ]      +   ^      ,       
   -   _      .         /      
   -   p      .      
   /   ~   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit    39            Torch - Unlit, A   29             	t_unlit_a                     can_be_pulsed
   pulse_type   torch   sound   torch_A                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          /         C                               M                          	           
                                             �                                                                           
      N                    	                                                                    R          S      !   T      "   U      #   V      $   W      %   X      &   Y      '   Z      (   [      )   \      *   ]      +   ^      ,       
   -   _      .         /      
   -   p      .      
   /   ~   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit    39            Torch - Unlit, C   29             	t_unlit_c                     can_be_pulsed
   pulse_type   torch   sound   torch_C                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          /         C                               M                          	           
                                             �                                                                           
      N                    	                                                                    R          S      !   T      "   U      #   V      $   W      %   X      &   Y      '   Z      (   [      )   \      *   ]      +   ^      ,       
   -   _      .         /      
   -   p      .      
   /   ~   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit    39            Torch - Unlit, D   29             	t_unlit_d                     can_be_pulsed
   pulse_type   torch   sound   torch_D                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          /         C                               M                          	           
                                             �                                                                           
      N                    	                                                                    R          S      !   T      "   U      #   V      $   W      %   X      &   Y      '   Z      (   [      )   \      *   ]      +   ^      ,       
   -   _      .         /      
   -   p      .      
   /   ~   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit    39            Torch - Unlit, F   29             	t_unlit_f                     can_be_pulsed
   pulse_type   torch   sound   torch_F                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  �   }  �   y     ����    6       �          �          �      
                          /         C                               M                          	           
                                             �                                                                           
      N                    	                                                                    R          S      !   T      "   U      #   V      $   W      %   X      &   Y      '   Z      (   [      )   \      *   ]      +   ^      ,       
   -   _      .         /      
   -   p      .      
   /   ~   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit    39            Torch - Unlit, G   29             	t_unlit_g                     can_be_pulsed
   pulse_type   torch   sound   torch_G                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                                                            !                  "                  #                  $                  �            MAIN            STRREF          LIST            ID                                      	   
                                          UTS V3.28      P      �     (  K   s  d   �     ����                 
                          /                                                                       	     �?   
      A        �?                                                                                       $                              <             
      G   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            WeatherRain   ����          Weather Rainweather_rain
rain_sound                                	   
                                                   