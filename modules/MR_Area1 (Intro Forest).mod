MOD V1.0        g   �   �   �  r   6  ����                                                                                                                    activate_pulse      �  activate_pulse     �  aoe_of_pulse       �  aoe_of_pulse       �  audio_log_1        �  audio_log_2        �  audio_log_3        �  audio_log_4        �  audio_log_5        �  audio_log_center	   �  cmd_cam_switch  
   �  cmd_cam_switch     �  cmd_cam_topdown    �  cmd_cam_topdown    �  creaturepalcus     �  doorpalcus         �  encounterpalcus    �  end_module         �  end_module         �  enter_area         �  enter_area         �  exit_module_door   �  introforest        �  introforest        �  introforest        �  intro_line         �  itempalcus         �  log_1_sound        �  log_1_subtitles    �  log_1_subtitles    �  log_1_trigger      �  log_2_sound        �  log_2_subtitles     �  log_2_subtitles !   �  log_2_trigger   "   �  log_3_sound     #   �  log_3_subtitles $   �  log_3_subtitles %   �  log_3_trigger   &   �  log_4_sound     '   �  log_4_subtitles (   �  log_4_subtitles )   �  log_4_trigger   *   �  log_5_sound     +   �  log_5_subtitles ,   �  log_5_subtitles -   �  log_5_trigger   .   �  module          /   �  m_beacon        0   �  m_bunch         1   �  m_double        2   �  m_drum          3   �  m_note          4   �  m_note_blue     5   �  m_note_brown    6   �  m_note_green    7   �  m_note_red      8   �  m_note_white    9   �  m_note_yellow   :   �  m_triple        ;   �  placeablepalcus <   �  play_audio_log  =   �  play_audio_log  >   �  pulse_center    ?   �  pulse_effect    @   �  pulse_effect    A   �  puzzle_camera   B   �  Repute          C   �  scannable_centerD   �  scan_beak_rock  E   �  scan_bird_tile  F   �  scan_buzz_sound G   �  scan_garment    H   �  scan_metal_gizmoI   �  scan_paint_brushJ   �  scan_sound_1    K   �  scan_sound_2    L   �  scan_sound_3    M   �  scan_sound_4    N   �  scan_sound_5    O   �  scan_telescope  P   �  scan_tree_branchQ   �  scan_wall_gears R   �  scan_wall_marks S   �  soundpalcus     T   �  storepalcus     U   �  support_color   V   �  support_effects W   �  support_sound   X   �  support_sound   Y   �  topdown_camera  Z   �  torch_center    [   �  triggerpalcus   \   �  turn_on_effects ]   �  turn_on_effects ^   �  tutorial_end    _   �  tutorial_end    `   �  tutorial_start  a   �  tutorial_start  b   �  t_lit           c   �  t_unlit         d   �  waypointpalcus  e   �  weather_rain    f   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �    �  s  I  �  "  "	  D'  �  0  �  �8  �  �A  �  xJ  �  ES  Q  �Z  [  �[  �  s^  �   5_  j  �`  �  Nn  e  �q  �  [t    qw  #  �{  �    h  ��  &  ��  @�  �[   i �� � �  a T  �* �  �. 7  �3 �  c9 �  :> �  B v  �F �  gK �  >P �  T X  tW �  [ �  �_ �  �c ;  �g �  �l �  _q �  =u �  } u  |� �  S� 3	  �� �  W� �  ݤ �  f� �  � w  `� .	  �� /	  �� 1	  �� %	  � /	  B� 2	  t� �  �� �  � �  �    �& '  �. �2  �a �   Z� �  9� a  �� V  � 	  �� E	  D� �  9� 	  I� D	  �� \	  �� �  �� �  �� �  �� �  m� �  N� !	  o� "	  �� I	  �� D	   �  � �  � �  -* !  N8    e8 �  E �  �I O  @Q �  W {  �k S  �~ �   � �  O� �  � �  �� 5  %� ;  `� �  H� �  NCS V1.0B         F ����  ��������   �����  ���� pulse_ready����   3   � hit_f1����   3        � hit_f1����   3����  ��������      hit_f1����   7����          )����  tutorial_end       ����        ?�  =���   ����   �    �      ����  pulse_center   @  �����  ��������  aoe_of_pulse       pulse_ready����   7 pulse_cooldown����   4����  ����,           ����    �  ����    ����       I ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����      pulse_ready����   7 ����  // Custom script for OnPlayerChat under:
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
        object center = CreateObject(OBJECT_TYPE_PLACEABLE, "pulse_center", oPC_loc);

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
NCS V1.0B  �       dist      4����  ����*     +  ����  @   ����  ����,              �      ���� !  ,                >�  ���� !  ,              R  ?   ���� !  ,              %  ?@  ���� !   ����      ����  ���� cur_dist      4����  ����     ]����  ��������    "    �����       �����  �������� ���� !����     $���� ���� '���� !!     S can_be_pulsed����   3    )����  pulse_effect               ^����  ���� ������� '���� !����  ��������  cur_dist      8����    '���� %!              �     ����  // The invisible pulse object that uses this script is referenced by its
// Blueprint ResRef, and must have two local variables:
//     float dist     = quarter of max pulse distance (sizeEnd in custom .mdl
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

float dist = GetLocalFloat(OBJECT_SELF, "dist");

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
        if ((obj_dist <= cur_dist) && (obj_dist > cur_dist - dist)) {
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
    cur_dist += dist;
    SetLocalFloat(OBJECT_SELF, "cur_dist", cur_dist);

    // Remove invisible object if this is the last check.
    if (cur_dist > (4 * dist)) {
        DestroyObject(OBJECT_SELF);
    }

}

// Four checks for affected objects will occur as the pulse expands, at
// equal quarter intervals of time and distance.
void main()
{
    float time = 2.0;

    DelayCommand(0.00 * time, ActivateNextCircle());
    DelayCommand(0.25 * time, ActivateNextCircle());
    DelayCommand(0.50 * time, ActivateNextCircle());
    DelayCommand(0.75 * time, ActivateNextCircle());
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
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  UTP V3.28      D   5   �  5     m   }  �   Q      ����    5   
                          0         D                               U                          	           
                                                                                                                        
      V                    �                                                                     Z          [      !   \      "   ]      #   ^      $   _      %   `      &   a      '   b      (   c      )   d      *   e      +   f       ,           -           .           /           0          1   g      2   h       3       
   4   i   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_AudioLogCenter   �           Tabitha   F9             audio_log_center                                                    	   
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
   NCS V1.0B        @   ����  ����  �   �����  ����,           ;D�� $  �  ���� ?   !  ����  MR_Intro_Forest#    L,           ) MR_Area2 (Melody Puzzle) �  ����      /- ����  MR_Melody_Puzzle#    M,           * MR_Area3 (Floor Light Up) �  ����      �- ����  MR_Floor_LU_Puzzle#    M,           * MR_Area4 (Forest Reprise) �  ����      S- ����  MR_Forest_Reprise#    J,           ' MR_Area5 (Echo Puzzle) �  ����       �- ����  MR_Echo_Puzzle#    I,           & MR_Area6 (Final Room) �  ����       �- ����  MR_Final_Room#    4,              4  ����       0- ,              4  ����    ����  // Load the next module (by filename) depending
// on the tag of the current module.

void main()
{
    float time = 2.0;
    string tag = GetTag(GetModule());

    DelayCommand(time * 0.5, FadeToBlack(GetFirstPC(), FADE_SPEED_SLOWEST));

    if (tag == "MR_Intro_Forest") {
        DelayCommand(time, StartNewModule("MR_Area2 (Melody Puzzle)"));
    }

    else if (tag == "MR_Melody_Puzzle") {
        DelayCommand(time, StartNewModule("MR_Area3 (Floor Light Up)"));
    }

    else if (tag == "MR_Floor_LU_Puzzle") {
        DelayCommand(time, StartNewModule("MR_Area4 (Forest Reprise)"));
    }

    else if (tag == "MR_Forest_Reprise") {
        DelayCommand(time, StartNewModule("MR_Area5 (Echo Puzzle)"));
    }

    else if (tag == "MR_Echo_Puzzle") {
        DelayCommand(time, StartNewModule("MR_Area6 (Final Room)"));
    }

    else if (tag == "MR_Final_Room") {
        DelayCommand(time, EndGame(""));
    }

    // Game will end if a module filename isn't found.
    else DelayCommand(time, EndGame(""));
}
NCS V1.0B  �         ����  ��������   �"    G    ����  ��������   �"     ����   ~        ����  turn_on_effects  ,           (����  cmd_cam_topdown    ?         pulse_ready����   7@    pulse_cooldown����   8    hit_f1����   7       �  �����  ����    ���� ����      �  �   �����  ��������  MR_Intro_Forest#����     ����     %����  MR_Forest_Reprise#     I     WeatherRain  �����  ��������  � ����    ����  MR_Intro_Forest#����     #����  MR_Final_Room#     ^ � ����  ����    ���� ����      ����� ����      ����     ����   hit_f1����   3����  ��������         ?,           ���� ����  ����  =���      - ���� ����   W ���� ����  // Custom script for OnEnter under:
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

    // TRUE if pulse can currently be used.
    SetLocalInt(oPC, "pulse_ready", TRUE);

    // Wait time (in seconds) inbetween pulse calls.
    SetLocalFloat(oPC, "pulse_cooldown", 2.0);

    SetLocalInt(oPC, "hit_f1", 1);

    // The effect that makes it seem like the environment is really dark.
    effect darknessEffect = EffectVisualEffect(VFX_DUR_BLIND);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, darknessEffect, oPC);

    string tagModule = GetTag(GetModule());

    // Play the rain sound only in the forest modules.
    if ( (tagModule == "MR_Intro_Forest") || (tagModule == "MR_Forest_Reprise") ) {
        object rain_sound = GetObjectByTag("WeatherRain");
        SoundObjectPlay(rain_sound);
    }

    // Freeze the player until they pulse a the nearby light source in the module.
    if ( (tagModule != "MR_Intro_Forest") && (tagModule != "MR_Final_Room") ) {
        effect eFreeze = EffectCutsceneImmobilize();
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eFreeze, oPC);
        WaitForF1Hit(oPC, eFreeze);
    }
}

void WaitForF1Hit(object oPC, effect eFreeze)
{
    int hit_f1 = GetLocalInt(oPC, "hit_f1");

    if (hit_f1 == 1) DelayCommand(0.1, WaitForF1Hit(oPC, eFreeze));
    else RemoveEffect(oPC, eFreeze);
}
UTD V3.28      D   3   �  3   �  �   Z  �   &      ����    3   
                          8         L                               ]                          	          
                                                                                                                         
      ^                              <         <                                                   b          c      !   d      "   e      #   f      $   g      %   h      &   i      '   t      (   u      )   v      *   w      +   x   
   ,   y       -          .          /         0   }       1       
   2   ~   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         LinkedTo        LinkedToFlags   LoadScreenID    GenericType_New OnFailToOpen    PaletteID       Comment            Exit_Module_Door    �            Exit Module Door   t#             exit_module_door            
end_module                                          	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   ARE V3.28   "  �  t  @�  4   ��  d   �  �-  ��  �  ����    *      �   
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
          ����      ����      +   
                         <   
      H                          	          
                                                                 <<<       xxx                 <<<                             
                     4B                            d                   d                  w                  !         "         #         $   L      %   [      &   \      '   ]      (   ^      )         *   y      +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   #     +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *   X      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   B      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +          ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   �      +         ,           -           .           /          0          1          2          3         *   {      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   ~      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *        +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   |      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   !     +          ,           -           .           /          0          1          2          3         *   "     +          ,           -           .           /          0          1          2          3         *   |      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   }      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   ~      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *   y      +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *   y      +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +          ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3         *         +         ,           -           .           /          0          1          2          3      ID              Creator_ID      Version         Tag             Name            ResRef          Comments        Expansion_List  Flags           ModSpotCheck    ModListenCheck  MoonAmbientColorMoonDiffuseColorMoonFogAmount   MoonFogColor    MoonShadows     SunAmbientColor SunDiffuseColor SunFogAmount    SunFogColor     SunShadows      IsNight         LightingScheme  ShadowOpacity   FogClipDist     SkyBox          DayNightCycle   ChanceRain      ChanceSnow      ChanceLightning WindPower       LoadScreenID    PlayerVsPlayer  NoRest          Width           Height          OnEnter         OnExit          OnHeartbeat     OnUserDefined   Tileset         Tile_List       Tile_ID         Tile_OrientationTile_Height     Tile_MainLight1 Tile_MainLight2 Tile_SrcLight1  Tile_SrcLight2  Tile_AnimLoop1  Tile_AnimLoop2  Tile_AnimLoop3     MR_Intro_Forest%   ����          Somewhere in space...introforest    tutorial_start   jac01                            	   
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
                                               !  GIC V3.28   V   @  f   	     �	  n  &  x   �  x  ����T   	                                 $         ,         4         <         D         L               	         	         	         	         	         	          	   !      	   "      	   #      	   $      	   %      	   &      	   '      	   (      	   )      	   *      	   +      	   ,      	   -      	   .      	   /      	   0      	   1      	   2      	   3      	   4      	   5      	   6      	   7      	   8      	   9      	   :      	   ;      	   <      	   =      	   >      	   ?      	   @      	   A      	   B      	   C      	   D      	   E      	   F      	   G      	   H      	   I      	   J      	   K      	   L      	   M      	   N      	   O      	   P      	   Q      	   R      	   S      	   T      	   U      	   V      	   W      	   X      	   Y      	   Z      	   [      	   \      	   ]      	   ^      	   _      	   `      	   a      	   b      	   c      	   d      	   e                          
                                               
                   
                   
                   
                   
                   
                   
                   
                8         <   
      $      	   D      
   H   
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
      D  
      H  
      L  
      P  Creature List   Door List       Comment         Encounter List  List            SoundList       PlayInToolset   StoreList       TriggerList     WaypointList    Placeable List                                                                                                                                                                                                                                                                                                                                                     (branch from a berry bush)                         	   
                                                                                                          	          
       K                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   GIT V3.28   �    I  p y     �6  �P U  ҥ �  ����    
   d   (   	      L   5                [         �         w         �         �         d         �         �         �         <         �         �                                  �  #                       $        0        <     	   H  8       (         4         @     	   L  8       ,         8         D     	   P  8       0         <         H     	   T  8       4	         @	         L	     	   X	  8       8
         D
         P
     	   \
  8       <         H         T         `         l     	   x  8       X         d         p     	   |  8       \         h         t     	   �  8       `         l         x     	   �  8       d         p         |         �         �     	   �  8       �         �         �     	   �  8       �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �         �         �     	   �  8       �         �         �                        	     8       �                                    (     	   4  8                          ,     	   8  8                $         0     	   <  8                (         4         @         L     	   X  8       8         D         P         \         h     	   t  8       T         `         l         x         �     	   �  8       p         |         �     	   �  8       t         �         �     	   �  8       x         �         �     	   �  8       |          �          �      	   �   8       �!         �!         �!     	   �!  8       �"         �"         �"     	   �"  8       �#         �#         �#     	   �#  8       �$         �$         �$     	   �$  8       �%         �%         �%     	   �%  8       �&         �&         �&     	   �&  8       �'         �'         �'     	   �'  8       �(         �(         �(     	   �(  8       �)         �)         �)     	   �)  8       �*         �*         �*     	   �*  8       �+         �+         �+     	   �+  8       �,         �,         �,     	   �,  8       �-         �-         �-         �-         �-     	   �-  8       �.         �.         �.         �.         �.     	   /  8       �/         �/          0         0         0     	   $0  8       1         1         1         (1         41     	   @1  8        2         ,2         82         D2         P2     	   \2  8       <3         H3         T3         `3         l3     	   x3  8       X4         d4         p4         |4         �4     	   �4  8       t5         �5         �5     	   �5  8       x6         �6         �6     	   �6  8       |7         �7         �7     	   �7  8       �8         �8         �8     	   �8  8       �9         �9         �9         �9         �9     	   �9  8       �:         �:         �:         �:         �:     	   �:  8       �;         �;         �;         �;         �;     	   �;  8       �<         �<         �<         �<         =     	   =  8       �=          >         >         >         $>     	   0>  8       ?         ?         (?     	   4?  8       @          @         ,@     	   8@  8       A         $A         0A         <A         HA     	   TA  8       4B         @B         LB     	   XB  8       8C         DC         PC         \C         hC     	   tC  8       TD         `D         lD         xD         �D     	   �D  8       pE         |E         �E         �E         �E     	   �E  8       �F         �F         �F         �F         �F     	   �F  8       �G         �G         �G         �G         �G     	   �G  8       �H         �H         �H         �H         �H     	    I  8       �I         �I         �I         J         J     	   J  8       �J         K         K          K         ,K     	   8K  8       L         $L         0L         <L         HL     	   TL  8       4M         @M         LM         XM         dM     	   pM  8       PN         \N         hN         tN         �N     	   �N  8       lO         xO         �O         �O         �O     	   �O  8       �P         �P         �P         �P         �P     	   �P  8       �Q         �Q         �Q         �Q         �Q     	   �Q  8       �R         �R         �R         �R     	   �R  8       �S         �S         �S         �S     	    T  8       �T         �T         �T                                                                                                  	          
                
                         8         L                               ]                                                                                                                                                        !      
   "   ^       #          $          %   <      &   <       '          (          )           *          +   b      ,   c      -   d      .   e      /   f      0   g      1   h      2   i      3   t      4   u      5   v      6   w      7   x   
   8   y       9          :          ;         <   }      =     �B   >   ��B   ?   ffA   @      �   A         B         C      
      ~         �         �       D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   8      X   �      Y          Z   �(B   [   N0Y@   \    ��
      �         �         �       D           E           F          G           H           I          J     �?   K      A   L     �?   M          N          O          P          Q           R         S           T          U   $       V          W   @      X         Y          Z   ��1B   [   {q[@   \    ��
                      ;      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   H      X   H     Y          Z   �RB   [   ��@   \     ��
      T        d        �      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   P      X   �     Y          Z   ��B   [   B��@   \   ����
      �        �        �      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   X      X   �     Y          Z   p"B   [   �M�@   \   ����
      �        �              D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   `      X   #     Y          Z   >�*B   [   ��@   \    ��
      /        ?        _      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   h      X   l     Y          Z   -�3B   [   �M�@   \   ����
      x        �        �      D           E           F           G           H           I          J     �?   K      A   L     �?   M          N          O   �a     P   �     Q           R         S           T          U          V          W   p      X   �     Y          Z   i�B   [   �mT@   \   ����   ]   x      ^   |   
      �        �     _   �                          `          a       
   "   �  
   8   �      9          :                    b                                                                           !          .        4        7        c        d        e        f        g   �   
   h        b         i         Z   ��zB   [   jGB   \          j          k          l          m   �      n   �e��   o   ����   p   33��   n   (�uA   o   +�   p   33��   n   �j�A   o   ���   p   33��   n          o          p   33��   q   �      r   �   
      %        1        V        j                              s                                                                                                                                                        !       
   "   t      #          $        %         &          '          (          )           *          +   x     ,   y     -   z     .   {     /   |     0   }     1   ~     2        3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �o�B   >   �.B   ?     ��   @      �
      �        �        �                                                                                                                                                                                              !       
   "         #          $        %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3        4        5        6        7         g   �  
   h   !     b         i      
   h   2     b      
   i   @  
   h   J     b      
   i   S      s           t           u           b           v          w   [     x   \     =   �U�B   >   �m	B   ?    T�=   @      �
      ]        i        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   m:�B   >   *OB   ?     ��   @      �
      �                (        <                              D                                                                                                                                                        !       
   "   E      #          $        %         &          '          (          )           *          +   I     ,   J     -   K     .   L     /   M     0   N     1   O     2   P     3   Q     4   R     5   S     6   T     7   U     g     
   h   V     b         i      
   h   g     b      
   i   u  
   h   ~     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ���B   >   92B   ?   l<O<   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   �     b      
   i     
   h        b      
   i         s           t           u           b           v          w   (     x   )     =   ���B   >   :�NB   ?     ��   @      �
      *        4        ]        q                              }                                                                                                                                                        !       
   "   ~      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   $  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   V�B   >   �x3B   ?   @LG=   @      �
      �        �                /                              7                                                                                                                                                        !       
   "   8      #          $        %         &          '          (          )           *          +   <     ,   =     -   >     .   ?     /   @     0   A     1   B     2   C     3   D     4   E     5   F     6   G     7   H     g   <  
   h   I     b         i      
   h   Z     b      
   i   h  
   h   q     b      
   i   z      s           t           u           b           v          w   �     x   �     =   ��eB   >   ?<B   ?     �5   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   L  
   h   �     b         i      
   h   �     b      
   i   �  
   h        b      
   i         s           t           u           b           v          w        x        =   6�dB   >   B!B   ?      �   @      �
              '        J        ^                              e                                                                                                                                                        !       
   "   f      #          $   u     %         &          '          (          )           *          +   j     ,   k     -   l     .   m     /   n     0   o     1   p     2   q     3   r     4   s     5   t     6   u     7   v     g   \  
   h   w     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   XiqB   >   _�A   ?     ��   @      �
      �        �        �        �                              		                                                                                                                                                        !       
   "   
	      #          $   v     %         &          '          (          )           *          +   	     ,   	     -   	     .   	     /   	     0   	     1   	     2   	     3   	     4   	     5   	     6   	     7   	     g   l  
   h   	     b         i      
   h   ,	     b      
   i   :	  
   h   B	     b      
   i   K	  
   h   T	     b         i     �@
   h   \	     b      
   i   e	      s           t           u           b           v          w   u	     x   v	     =   jD�B   >   ^�B   ?      �   @      �
      w	        �	        �	        �	                              �	                                                                                                                                                        !       
   "   �	      #          $        %         &          '          (          )           *          +   �	     ,   �	     -   �	     .   �	     /   �	     0   �	     1   �	     2   �	     3   �	     4   �	     5   �	     6   �	     7   �	     g   �  
   h   �	     b         i      
   h   �	     b      
   i   �	  
   h    
     b      
   i   	
      s           t           u           b           v          w   
     x   
     =   ��B   >   ��B   ?      �   @      �
      
        
        B
        V
                              ^
                                                                                                                                                        !       
   "   _
      #          $        %         &          '          (          )           *          +   c
     ,   d
     -   e
     .   f
     /   g
     0   h
     1   i
     2   j
     3   k
     4   l
     5   m
     6   n
     7   o
     g   �  
   h   p
     b         i      
   h   �
     b      
   i   �
  
   h   �
     b      
   i   �
      s           t           u           b           v          w   �
     x   �
     =   �gB   >   ���A   ?   ���<   @      �
      �
        �
        �
        �
                                                                                                                                                                                      !       
   "         #          $   v     %         &          '          (          )           *          +   	     ,   
     -        .        /        0        1        2        3        4        5        6        7        g   �  
   h        b         i      
   h   '     b      
   i   5  
   h   =     b      
   i   F  
   h   P     b         i     �@
   h   X     b      
   i   a      s           t           u           b           v          w   q     x   r     =   ��B   >   !߀A   ?      �   @      �
      s        }        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i     
   h        b         i     �@
   h        b      
   i          s           t           u           b           v          w   *     x   +     =   �t�B   >   q?B   ?     ��   @      �
      ,        6        ^        r                              }                                                                                                                                                        !       
   "   ~      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   =�B   >   �P�A   ?   9��   @      �
      �        �                ,                              8                                                                                                                                                        !       
   "   9      #          $   v     %         &          '          (          )           *          +   =     ,   >     -   ?     .   @     /   A     0   B     1   C     2   D     3   E     4   F     5   G     6   H     7   I     g   �  
   h   J     b         i      
   h   [     b      
   i   i  
   h   q     b      
   i   z  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ޢ�B   >   ��A   ?      2   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3   	     4   
     5        6        7        g     
   h        b         i      
   h        b      
   i   -  
   h   5     b      
   i   >  
   h   I     b         i     �@
   h   Q     b      
   i   Z      s           t           u           b           v          w   j     x   k     =   �%UB   >   Ry�@   ?      �   @      �
      l        x        �        �                              �                                                                                 �                                                                     !       
   "   �      #          $   �     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w        x        =   �]CB   >   3XA   ?      �   @      �
      	                :        N                              W                                                                                                                                                        !       
   "   X      #          $        %         &          '          (          )           *          +   \     ,   ]     -   ^     .   _     /   `     0   a     1   b     2   c     3   d     4   e     5   f     6   g     7   h     g   ,  
   h   i     b         i      
   h   z     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �k�B   >   o��A   ?      �   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,         -        .        /        0        1        2        3        4        5   	     6   
     7        g   <  
   h        b         i      
   h        b      
   i   +  
   h   3     b      
   i   <  
   h   E     b         i     �@
   h   M     b      
   i   V      s           t           u           b           v          w   f     x   g     =   #�rB   >   ZG�A   ?   l� >   @      �
      h        r        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   T  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h        b         i     �@
   h        b      
   i         s           t           u           b           v          w   )     x   *     =   �fpB   >   y��A   ?   9��   @      �
      +        5        _        s                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   l  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��^B   >   �B�A   ?     ��   @      �
      �        �                3                              ;                                                                                                                                                        !       
   "   <      #          $        %         &          '          (          )           *          +   @     ,   A     -   B     .   C     /   D     0   E     1   F     2   G     3   H     4   I     5   J     6   K     7   L     g   �  
   h   M     b         i      
   h   ^     b      
   i   l  
   h   u     b      
   i   ~      s           t           u           b           v          w   �     x   �     =   tmB   >   ��KB   ?          @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   	  
   h        b      
   i         s           t           u           b           v          w   $     x   %     =   �~B   >   .�A   ?      �   @      �
      &        2        W        k                              t                                                                                 �                                                                     !       
   "   u      #          $   �     %         &          '          (          )           *          +   y     ,   z     -   {     .   |     /   }     0   ~     1        2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��B   >   ��A   ?   Պg=   @      �
      �        �        �                                                                                                                                                                                              !       
   "         #          $        %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3        4        5         6   !     7   "     g   �  
   h   #     b         i      
   h   4     b      
   i   B  
   h   L     b      
   i   U      s           t           u           b           v          w   ]     x   ^     =   :��B   >   kٵA   ?      �   @      �
      _        j        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �O[B   >   �GGB   ?      6   @      �
      �                *        >                              G                                                                                                                                                        !       
   "   H      #          $        %         &          '          (          )           *          +   L     ,   M     -   N     .   O     /   P     0   Q     1   R     2   S     3   T     4   U     5   V     6   W     7   X     g   �  
   h   Y     b         i      
   h   j     b      
   i   x  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ��B   >    qB   ?     ж   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $        %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h        b      
   i     
   h        b      
   i   '      s           t           u           b           v          w   /     x   0     =   ��B   >   x�pB   ?      �   @      �
      1        =        b        v                                                                                                               �                                                                     !       
   "   �      #          $   �     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ���B   >   5�xB   ?    �@=   @      �
      �        �        �                                                                                                                       �                                                                     !       
   "         #          $   �     %         &          '          (          )           *          +   !     ,   "     -   #     .   $     /   %     0   &     1   '     2   (     3   )     4   *     5   +     6   ,     7   -     g     
   h   .     b         i      
   h   ?     b      
   i   M  
   h   W     b      
   i   `      s           t           u           b           v          w   i     x   j     =   ;,�B   >   �|B   ?      5   @      �
      k        u        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g     
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w         x        =   x��B   >   B"SB   ?     ��   @      �
                      /        C                              J                                                                                                                                                        !       
   "   K      #          $   u     %         &          '          (          )           *          +   O     ,   P     -   Q     .   R     /   S     0   T     1   U     2   V     3   W     4   X     5   Y     6   Z     7   [     g   $  
   h   \     b         i      
   h   m     b      
   i   {  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   g�GB   >   ?�>B   ?    G�<   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   4  
   h   �     b         i      
   h        b      
   i     
   h        b      
   i   #      s           t           u           b           v          w   .     x   /     =   ��KB   >   z�2B   ?     ��   @      �
      0        :        ]        q                              x                                                                                                                                                        !       
   "   y      #          $   u     %         &          '          (          )           *          +   }     ,   ~     -        .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   D  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �DB   >   ��"B   ?    ��:   @      �
      �        �        �                                                                                                                                                                                              !       
   "         #          $   u     %         &          '          (          )           *          +        ,        -        .        /        0        1        2        3        4        5        6        7         g   T  
   h   !     b         i      
   h   2     b      
   i   @  
   h   H     b      
   i   Q      s           t           u           b           v          w   \     x   ]     =    �/B   >   �"B   ?   @��=   @      �
      ^        h        �        �                              �                                                                                                                                                        !       
   "   �      #          $   u     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   d  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   lt&B   >   `ECB   ?    ��:   @      �
      �        �        "        6                              =                                                                                                                                                        !       
   "   >      #          $   u     %         &          '          (          )           *          +   B     ,   C     -   D     .   E     /   F     0   G     1   H     2   I     3   J     4   K     5   L     6   M     7   N     g   t  
   h   O     b         i      
   h   `     b      
   i   n  
   h   v     b      
   i         s           t           u           b           v          w   �     x   �     =   fB   >   ��)B   ?     ��   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h        b      
   i     
   h        b      
   i   !  
   h   +     b         i     �@
   h   3     b      
   i   <      s           t           u           b           v          w   L     x   M     =   l�B   >   EEbB   ?   @��>   @      �
      N        X        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i         s           t           u           b           v          w        x        =   ���B   >   �eB   ?    �d>   @      �
                      H        \                              i                                                                                                                                                        !       
   "   j      #          $   v     %         &          '          (          )           *          +   n     ,   o     -   p     .   q     /   r     0   s     1   t     2   u     3   v     4   w     5   x     6   y     7   z     g   �  
   h   {     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i   �      s           t           u           b           v          w   �     x   �     =   �O�B   >   4�>B   ?     ��   @      �
      �        �        	                                      (                                                                                                                                                        !       
   "   )      #          $   v     %         &          '          (          )           *          +   -     ,   .     -   /     .   0     /   1     0   2     1   3     2   4     3   5     4   6     5   7     6   8     7   9     g   �  
   h   :     b         i      
   h   K     b      
   i   Y  
   h   a     b      
   i   j  
   h   s     b         i     �@
   h   {     b      
   i   �      s           t           u           b           v          w   �     x   �     =   ;��B   >   &BB   ?     ��   @      �
      �        �        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h        b      
   i     
   h        b      
   i   %  
   h   /     b         i     �@
   h   7     b      
   i   @      s           t           u           b           v          w   P     x   Q     =   U)�B   >   P�UB   ?     ��   @      �
      R        \        �        �                              �                                                                                                                                                        !       
   "   �      #          $   v     %         &          '          (          )           *          +   �     ,   �     -   �     .   �     /   �     0   �     1   �     2   �     3   �     4   �     5   �     6   �     7   �     g   �  
   h   �     b         i      
   h   �     b      
   i   �  
   h   �     b      
   i   �  
   h   �     b         i     �@
   h   �     b      
   i          s           t           u           b           v          w         x         =   �-�B   >   
�TB   ?     ��   @      �
               "         L         `                               m                                                                                                                                                         !       
   "   n       #          $   v     %         &          '          (          )           *          +   r      ,   s      -   t      .   u      /   v      0   w      1   x      2   y      3   z      4   {      5   |      6   }      7   ~      g     
   h         b         i      
   h   �      b      
   i   �   
   h   �      b      
   i   �   
   h   �      b         i     �@
   h   �      b      
   i   �       s           t           u           b           v          w   �      x   �      =   �B   >   ��RB   ?   �S=   @      �
      �         �         !         !                              )!                                                                                 �                                                                     !       
   "   *!      #          $   �     %         &          '          (          )           *          +   .!     ,   /!     -   0!     .   1!     /   2!     0   3!     1   4!     2   5!     3   6!     4   7!     5   8!     6   9!     7   :!     g   ,  
   h   ;!     b         i      
   h   L!     b      
   i   Z!  
   h   d!     b      
   i   m!      s           t           u           b           v          w   v!     x   w!     =   ���B   >   �8mB   ?    ,�<   @      �
      x!        �!        �!        �!                              �!                                                                                                                                                        !       
   "   �!      #          $        %         &          '          (          )           *          +   �!     ,   �!     -   �!     .   �!     /   �!     0   �!     1   �!     2   �!     3   �!     4   �!     5   �!     6   �!     7   �!     g   <  
   h   �!     b         i      
   h   �!     b      
   i   �!  
   h   "     b      
   i   
"      s           t           u           b           v          w   "     x   "     =   ]=�B   >   ��]B   ?   ��?   @      �
      "         "        E"        Y"                              b"                                                                                 �                                                                     !       
   "   c"      #          $   �     %         &          '          (          )           *          +   g"     ,   h"     -   i"     .   j"     /   k"     0   l"     1   m"     2   n"     3   o"     4   p"     5   q"     6   r"     7   s"     g   L  
   h   t"     b         i      
   h   �"     b      
   i   �"  
   h   �"     b      
   i   �"      s           t           u           b           v          w   �"     x   �"     =   �7�B   >   ��eB   ?      �   @      �
      �"        �"        �"        �"                              �"                                                                                                                                                        !       
   "   �"      #          $        %         &          '          (          )           *          +   #     ,   #     -   #     .   #     /   #     0   #     1   #     2   #     3   	#     4   
#     5   #     6   #     7   #     g   \  
   h   #     b         i      
   h   #     b      
   i   -#  
   h   6#     b      
   i   ?#      s           t           u           b           v          w   I#     x   J#     =   r��B   >   �"B   ?     ��   @      �
      K#        U#        ~#        �#                              �#                                                                                                                                                        !       
   "   �#      #          $   v     %         &          '          (          )           *          +   �#     ,   �#     -   �#     .   �#     /   �#     0   �#     1   �#     2   �#     3   �#     4   �#     5   �#     6   �#     7   �#     g   l  
   h   �#     b         i      
   h   �#     b      
   i   �#  
   h   �#     b      
   i   �#  
   h   �#     b         i     �@
   h   �#     b      
   i   �#      s           t           u           b           v          w   $     x   $     =   ���B   >   W�nB   ?      �   @      �
      $        $        A$        U$                              b$                                                                                                                                                        !       
   "   c$      #          $   v     %         &          '          (          )           *          +   g$     ,   h$     -   i$     .   j$     /   k$     0   l$     1   m$     2   n$     3   o$     4   p$     5   q$     6   r$     7   s$     g   �  
   h   t$     b         i      
   h   �$     b      
   i   �$  
   h   �$     b      
   i   �$  
   h   �$     b         i     �@
   h   �$     b      
   i   �$      s           t           u           b           v          w   �$     x   �$     =   ���B   >   ��fB   ?   �bs>   @      �
      �$        �$        %        %                              '%                                                                                                                                                        !       
   "   (%      #          $   v     %         &          '          (          )           *          +   ,%     ,   -%     -   .%     .   /%     /   0%     0   1%     1   2%     2   3%     3   4%     4   5%     5   6%     6   7%     7   8%     g   �  
   h   9%     b         i      
   h   J%     b      
   i   X%  
   h   `%     b      
   i   i%  
   h   r%     b         i     �@
   h   z%     b      
   i   �%      s           t           u           b           v          w   �%     x   �%     =   ���B   >   2�NB   ?   ���=   @      �
      �%        �%        �%        �%                              �%                                                                                                                                                        !       
   "   �%      #          $   v     %         &          '          (          )           *          +   �%     ,   �%     -   �%     .   �%     /   �%     0   �%     1   �%     2   �%     3   �%     4   �%     5   �%     6   �%     7   �%     g   �  
   h   �%     b         i      
   h   &     b      
   i   &  
   h   %&     b      
   i   .&  
   h   8&     b         i     �@
   h   @&     b      
   i   I&      s           t           u           b           v          w   Y&     x   Z&     =   �S�B   >   >7SB   ?   �B�>   @      �
      [&        e&        �&        �&                              �&                                                                                                                                                        !       
   "   �&      #          $   v     %         &          '          (          )           *          +   �&     ,   �&     -   �&     .   �&     /   �&     0   �&     1   �&     2   �&     3   �&     4   �&     5   �&     6   �&     7   �&     g   �  
   h   �&     b         i      
   h   �&     b      
   i   �&  
   h   �&     b      
   i   �&  
   h   �&     b         i     �@
   h   '     b      
   i   '      s           t           u           b           v          w   '     x   '     =   ���B   >   �mB   ?      �   @      �
      '        *'        O'        c'                              l'                                                                                                                                                        !       
   "   m'      #          $        %         &          '          (          )           *          +   q'     ,   r'     -   s'     .   t'     /   u'     0   v'     1   w'     2   x'     3   y'     4   z'     5   {'     6   |'     7   }'     g   �  
   h   ~'     b         i      
   h   �'     b      
   i   �'  
   h   �'     b      
   i   �'      s           t           u           b           v          w   �'     x   �'     =   [��B   >   1�DB   ?     ж   @      �
      �'        �'        �'        �'                              (                                                                                 �                                                                     !       
   "   	(      #          $   �     %         &          '          (          )           *          +   (     ,   (     -   (     .   (     /   (     0   (     1   (     2   (     3   (     4   (     5   (     6   (     7   (     g   �  
   h   (     b         i      
   h   +(     b      
   i   9(  
   h   C(     b      
   i   L(      s           t           u           b           v          w   U(     x   V(     =   �h�B   >   $S]B   ?   ��>   @      �
      W(        a(        �(        �(                              �(                                                                                                                                                        !       
   "   �(      #          $   v     %         &          '          (          )           *          +   �(     ,   �(     -   �(     .   �(     /   �(     0   �(     1   �(     2   �(     3   �(     4   �(     5   �(     6   �(     7   �(     g     
   h   �(     b         i      
   h   �(     b      
   i   �(  
   h   �(     b      
   i   �(  
   h   �(     b         i     �@
   h   �(     b      
   i   )      s           t           u           b           v          w   )     x   )     =   a��B   >   ϸRB   ?   �=�>   @      �
      )        )        A)        U)                              ^)                                                                                                                                                        !       
   "   _)      #          $        %         &          '          (          )           *          +   c)     ,   d)     -   e)     .   f)     /   g)     0   h)     1   i)     2   j)     3   k)     4   l)     5   m)     6   n)     7   o)     g     
   h   p)     b         i      
   h   �)     b      
   i   �)  
   h   �)     b      
   i   �)      s           t           u           b           v          w   �)     x   �)     =   �b�B   >   �HB   ?      �   @      �
      �)        �)        �)        �)                              *                                                                                                                                                        !       
   "   *      #          $   v     %         &          '          (          )           *          +   *     ,   *     -   *     .   	*     /   
*     0   *     1   *     2   *     3   *     4   *     5   *     6   *     7   *     g   ,  
   h   *     b         i      
   h   $*     b      
   i   2*  
   h   :*     b      
   i   C*  
   h   N*     b         i     �@
   h   V*     b      
   i   _*      s           t           u           b           v          w   o*     x   p*     =   �XoB   >   \>�A   ?     ��   @      �
      q*        {*        �*        �*                              �*                                                                                                                                                        !       
   "   �*      #          $   v     %         &          '          (          )           *          +   �*     ,   �*     -   �*     .   �*     /   �*     0   �*     1   �*     2   �*     3   �*     4   �*     5   �*     6   �*     7   �*     g   D  
   h   �*     b         i      
   h   �*     b      
   i   �*  
   h   �*     b      
   i   +  
   h   +     b         i     �@
   h   +     b      
   i   "+      s           t           u           b           v          w   2+     x   3+     =   L6RB   >   `�?A   ?   
$<   @      �
      4+        >+        i+        }+                              �+                                                                                                                                                        !       
   "   �+      #          $   v     %         &          '          (          )           *          +   �+     ,   �+     -   �+     .   �+     /   �+     0   �+     1   �+     2   �+     3   �+     4   �+     5   �+     6   �+     7   �+     g   \  
   h   �+     b         i      
   h   �+     b      
   i   �+  
   h   �+     b      
   i   �+  
   h   �+     b         i     �@
   h   �+     b      
   i   �+      s           t           u           b           v          w   �+     x   �+     =   5�bB   >   y]+A   ?     ��   @      �
      �+        ,        .,        B,                              O,                                                                                                                                                        !       
   "   P,      #          $   v     %         &          '          (          )           *          +   T,     ,   U,     -   V,     .   W,     /   X,     0   Y,     1   Z,     2   [,     3   \,     4   ],     5   ^,     6   _,     7   `,     g   t  
   h   a,     b         i      
   h   r,     b      
   i   �,  
   h   �,     b      
   i   �,  
   h   �,     b         i     �@
   h   �,     b      
   i   �,      s           t           u           b           v          w   �,     x   �,     =   GUB   >   *�FA   ?   tO�<   @      �
      �,        �,        �,        -                              -                                                                                                                                                        !       
   "   -      #          $   v     %         &          '          (          )           *          +   -     ,   -     -   -     .   -     /   -     0    -     1   !-     2   "-     3   #-     4   $-     5   %-     6   &-     7   '-     g   �  
   h   (-     b         i      
   h   9-     b      
   i   G-  
   h   O-     b      
   i   X-  
   h   b-     b         i     �@
   h   j-     b      
   i   s-      s           t           u           b           v          w   �-     x   �-     =   ?�B   >   }�)B   ?   @�q=   @      �
      �-        �-        �-        �-                              �-                                                                                                                                                        !       
   "   �-      #          $   v     %         &          '          (          )           *          +   �-     ,   �-     -   �-     .   �-     /   �-     0   �-     1   �-     2   �-     3   �-     4   �-     5   �-     6   �-     7   �-     g   �  
   h   �-     b         i      
   h   �-     b      
   i   .  
   h   .     b      
   i   .  
   h   %.     b         i     �@
   h   -.     b      
   i   6.      s           t           u           b           v          w   F.     x   G.     =   =ԗB   >   T�B   ?     ��   @      �
      H.        R.        |.        �.                              �.                                                                                                                                                        !       
   "   �.      #          $   v     %         &          '          (          )           *          +   �.     ,   �.     -   �.     .   �.     /   �.     0   �.     1   �.     2   �.     3   �.     4   �.     5   �.     6   �.     7   �.     g   �  
   h   �.     b         i      
   h   �.     b      
   i   �.  
   h   �.     b      
   i   �.  
   h   �.     b         i     �@
   h   �.     b      
   i   �.      s           t           u           b           v          w   /     x   /     =   B��B   >   f�B   ?     ��   @      �
      /        /        @/        T/                              `/                                                                                                                                                        !       
   "   a/      #          $   v     %         &          '          (          )           *          +   e/     ,   f/     -   g/     .   h/     /   i/     0   j/     1   k/     2   l/     3   m/     4   n/     5   o/     6   p/     7   q/     g   �  
   h   r/     b         i      
   h   �/     b      
   i   �/  
   h   �/     b      
   i   �/  
   h   �/     b         i     �@
   h   �/     b      
   i   �/      s           t           u           b           v          w   �/     x   �/     =   �ѕB   >   ��:B   ?   9��   @      �
      �/        �/        0        0                              &0                                                                                                                                                        !       
   "   '0      #          $   v     %         &          '          (          )           *          +   +0     ,   ,0     -   -0     .   .0     /   /0     0   00     1   10     2   20     3   30     4   40     5   50     6   60     7   70     g   �  
   h   80     b         i      
   h   I0     b      
   i   W0  
   h   _0     b      
   i   h0  
   h   r0     b         i     �@
   h   z0     b      
   i   �0      s           t           u           b           v          w   �0     x   �0     =   �B   >   T�8B   ?   9��   @      �
      �0        �0        �0        �0                              �0                                                                                                                                                        !       
   "   �0      #          $   v     %         &          '          (          )           *          +   �0     ,   �0     -   �0     .   �0     /   �0     0   �0     1   �0     2   �0     3   �0     4   �0     5   �0     6   �0     7   �0     g     
   h   �0     b         i      
   h   1     b      
   i   1  
   h   #1     b      
   i   ,1  
   h   71     b         i     �@
   h   ?1     b      
   i   H1      s           t           u           b           v          w   X1     x   Y1     =   ���B   >   �ICB   ?   �#<   @      �
      Z1        d1        �1        �1                              �1                                                                                                                                                        !       
   "   �1      #          $   v     %         &          '          (          )           *          +   �1     ,   �1     -   �1     .   �1     /   �1     0   �1     1   �1     2   �1     3   �1     4   �1     5   �1     6   �1     7   �1     g     
   h   �1     b         i      
   h   �1     b      
   i   �1  
   h   �1     b      
   i   �1  
   h   �1     b         i     �@
   h   2     b      
   i   2      s           t           u           b           v          w   2     x   2     =   �B   >   ��BB   ?          @      �
       2        *2        T2        h2                              u2                                                                                                                                                        !       
   "   v2      #          $   v     %         &          '          (          )           *          +   z2     ,   {2     -   |2     .   }2     /   ~2     0   2     1   �2     2   �2     3   �2     4   �2     5   �2     6   �2     7   �2     g   4  
   h   �2     b         i      
   h   �2     b      
   i   �2  
   h   �2     b      
   i   �2  
   h   �2     b         i     �@
   h   �2     b      
   i   �2      s           t           u           b           v          w   �2     x   �2     =   Y��B   >   [@B   ?   ��#<   @      �
      �2        �2        3        +3                              83                                                                                                                                                        !       
   "   93      #          $   v     %         &          '          (          )           *          +   =3     ,   >3     -   ?3     .   @3     /   A3     0   B3     1   C3     2   D3     3   E3     4   F3     5   G3     6   H3     7   I3     g   L  
   h   J3     b         i      
   h   [3     b      
   i   i3  
   h   q3     b      
   i   z3  
   h   �3     b         i     �@
   h   �3     b      
   i   �3      s           t           u           b           v          w   �3     x   �3     =   �}B   >   ��GB   ?      �   @      �
      �3        �3        �3        �3                              �3                                                                                                                                                        !       
   "   �3      #          $   v     %         &          '          (          )           *          +   4     ,   4     -   4     .   4     /   4     0   4     1   4     2   	4     3   
4     4   4     5   4     6   4     7   4     g   d  
   h   4     b         i      
   h    4     b      
   i   .4  
   h   64     b      
   i   ?4  
   h   I4     b         i     �@
   h   Q4     b      
   i   Z4      s           t           u           b           v          w   j4     x   k4     =   F"�B   >   �dB   ?   @"�>   @      �
      l4        x4        �4        �4                              �4                                                                                 �                                                                     !       
   "   �4      #          $   �     %         &          '          (          )           *          +   �4     ,   �4     -   �4     .   �4     /   �4     0   �4     1   �4     2   �4     3   �4     4   �4     5   �4     6   �4     7   �4     g   |  
   h   �4     b         i      
   h   �4     b      
   i   �4  
   h   �4     b         i     �@
   h   �4     b      
   i   5      s           t           u           b           v          w   5     x   5     =   ))XB   >   x��@   ?     ��   @      �
      5        5        <5        P5                              \5                                                                                 u                                                                     !       
   "   ]5      #          $         %         &          '          (          )           *          +   a5     ,   b5     -   c5     .   d5     /   e5     0   f5     1   g5     2   h5     3   i5     4   j5     5   k5     6   l5     7   m5     g   �  
   h   n5     b         i      
   h   5     b      
   i   �5  
   h   �5     b         i      
   h   �5     b         i     4B    s           t           u           b           v          w   �5     x   �5     =   H�B   >   H��A   ?          @      �
      �5        �5        �5        6                              6                                                                                                                                                      !       
   "   6      #          $   �      %         &          '          (          )           *          +   6     ,   6     -   6     .   6     /   6     0   6     1   6     2   6     3   6     4    6     5   !6     6   "6     7   #6     g   �  
   h   $6     b         i      
   h   56     b      
   i   =6  
   h   �6     b      
   i   �6      s           t           u           b           v          w   �6     x   �6     =   �G4B   >   �(6B   ?          @      �AreaProperties  AmbientSndDay   AmbientSndNight AmbientSndDayVolAmbientSndNitVolEnvAudio        MusicBattle     MusicDay        MusicNight      MusicDelay      Creature List   Door List       Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         LinkedTo        LinkedToFlags   LoadScreenID    GenericType_New OnFailToOpen    X               Y               Z               Bearing         Encounter List  List            SoundList       Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           GeneratedType   XPosition       YPosition       ZPosition       StoreList       TriggerList     LocalizedName   Cursor          HighlightHeight Type            ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           XOrientation    YOrientation    ZOrientation    Geometry        PointX          PointY          PointZ          WaypointList    Placeable List  HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed             Exit_Module_Door    �            Exit Module Door   t#             exit_module_door            
end_module             log_1_sound   ����          Log 1 Soundlog_1_soundaudio_log_1   WeatherRain   ����          Weather Rainweather_rain
rain_sound   scan_sound_1   ����          Scan Sound 1scan_sound_1scannable_1   scan_sound_2   ����          Scan Sound 2scan_sound_2scannable_2   scan_sound_3   ����          Scan Sound 3scan_sound_3scannable_3   scan_sound_4   ����          Scan Sound 4scan_sound_4scannable_4   scan_sound_5   ����          Scan Sound 5scan_sound_5scannable_5
   intro_line   ����       
   Intro Line
intro_line
intro_line   log_1_triggerlog_1_trigger   �9            Log 1 Trigger            play_audio_log  
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
   log_number   time     scannableObject$   H            Scan 1 - Tree Branch   9             scan_tree_branch                     can_be_pulsed   textp   A blue coloured branch with glowing berries. Sensors indicate a cherry-like composition. They are likely edible.
   pulse_type	   scannable      
      A   B   C   $  %  X  Y                          	                                                                   !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                    	  
                                             !  "  #  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  E  F  G  H  I  J  K  B  C  D  L  M  N  O  P  Q  R  S  T  U  V  W  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  S  T  U  V  W  X  Y  Z  [  \  ]  J  K  L  M  N  O  P  Q  R  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                             !  "  #  $  %  &                    '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  ]  ^  _  `  a  b  c  d  e  f  g  T  U  V  W  X  Y  Z  [  \  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                      &  '  (  )  *  +  ,  -  .  /  0           !  "  #  $  %  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  g  h  i  j  k  l  m  n  o  p  q  ^  _  `  a  b  c  d  e  f  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  <  =  >  ?  @  A  B  C  D  E  F  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  �  �  �  �  �  �  �  �  �  �  �  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  L  M  N  O  P  Q  R  S  T  U  V  C  D  E  F  G  H  I  J  K  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                !  "  #  $  %  &  '  (  )  *  +                                 ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  b  c  d  e  f  g  h  i  j  k  l  Y  Z  [  \  ]  ^  _  `  a  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                    %  &  '  (  )  *  +  ,  -  .  /             !  "  #  $  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  f  g  h  i  j  k  l  m  n  o  p  ]  ^  _  `  a  b  c  d  e  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   	  	  	  	  	  	  	  	  	  		  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  )	  *	  +	  ,	  -	  .	  /	  0	  1	  2	  3	   	  !	  "	  #	  $	  %	  &	  '	  (	  4	  5	  6	  7	  8	  9	  :	  ;	  <	  =	  >	  ?	  @	  A	  B	  C	  D	  E	  F	  G	  H	  I	  J	  K	  L	  M	  N	  O	  P	  Q	  R	  S	  T	  U	  V	  W	  X	  Y	  Z	  [	  \	  ]	  ^	  _	  `	  j	  k	  l	  m	  n	  o	  p	  q	  r	  s	  t	  a	  b	  c	  d	  e	  f	  g	  h	  i	  u	  v	  w	  x	  y	  z	  {	  |	  }	  ~	  	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	   
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
  $
  %
  &
  '
  (
  )
  *
  +
  ,
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
  e
  f
  g
  h
  i
  j
  k
  l
  m
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
                                               !  "  #  $  %  &  '  1  2  3  4  5  6  7  8  9  :  ;  (  )  *  +  ,  -  .  /  0  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  x  y  z  {  |  }  ~    �  �  �  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        	  
              �  �  �  �  �  �  �  �  �                                                !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  M  N  O  P  Q  R  S  T  U  V  W  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                  "  #  $  %  &  '  (  )  *  +  ,                               !  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  c  d  e  f  g  h  i  j  k  l  m  Z  [  \  ]  ^  _  `  a  b  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                      &  '  (  )  *  +  ,  -  .  /  0           !  "  #  $  %  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  m  n  o  p  q  r  s  t  u  v  w  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �               �  �  �  �  �  �  �  �  �  �  �  �  �  �  �        	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  B  C  D  E  F  G  H  I  J  K  L  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  �  �  �  �  �  �  �  �  �  �  �  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  R  S  T  U  V  W  X  Y  Z  [  \  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                !  "  #  $  %  &  '  (  )  *  +                                 ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  h  i  j  k  l  m  n  o  p  q  r  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �     �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                  	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  =  >  ?  @  A  B  C  D  E  F  G  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  �  �  �  �  �  �  �  �  �  �  �  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  Y  Z  [  \  ]  ^  _  `  a  b  c  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                          .  /  0  1  2  3  4  5  6  7  8       !  "  #  $  %  &  '  (  )  *  +  ,  -  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  u  v  w  x  y  z  {  |  }  ~    f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                   �  �  �  �  �  �  �  �  �  �  �  �    	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  >  ?  @  A  B  C  D  E  F  G  H  5  6  7  8  9  :  ;  <  =                                	                                    
                                                              K         !   %   )   -   3   7   ;   ?   E   I   M   S   Y   _   e   k   o   s   y      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �             !  %  +  /  5  ;  A  G  M  S  Y  _  e  k  q  w  }  �  �  �                              "   #   $      &   '   (      *   +   ,      .   /   0   1   2      4   5   6      8   9   :      <   =   >      @   A   B   C   D      F   G   H      J   K   L      N   O   P   Q   R      T   U   V   W   X      Z   [   \   ]   ^      `   a   b   c   d      f   g   h   i   j      l   m   n      p   q   r      t   u   v   w   x      z   {   |   }   ~      �   �   �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �   �   �      �   �   �      �   �   �      �   �   �      �   �   �                          	  
                                                      "  #  $     &  '  (  )  *     ,  -  .     0  1  2  3  4     6  7  8  9  :     <  =  >  ?  @     B  C  D  E  F     H  I  J  K  L     N  O  P  Q  R     T  U  V  W  X     Z  [  \  ]  ^     `  a  b  c  d     f  g  h  i  j     l  m  n  o  p     r  s  t  u  v     x  y  z  {  |     ~    �  �  �     �  �  �  �     �  �  �  �     �  �  �  UTS V3.28      P      �     (  F   n  d   �     ����                 
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
   /   3   7   >   D   E   F   J   K   P      0   1   2      4   5   6      8   9   :   ;   <   =      ?   @   A   B   C      G   H   I      L   M   N   O   UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_1_sound   ����          Log 1 Soundlog_1_soundaudio_log_1                                	   
                                                   NCS V1.0B  7      ,            6     Audio log 5-9 AF Crescent 2400.  �        ,            V     ?My name is Tabitha Raya, and I have made an enormous discovery.  �  @�33  ,            ?     (I left Earth to find us a place to live.  �  @���  ,            M     6The planet is near dead and won't keep us much longer.  �  A33  ,            o     XUnsurprising, given what we've done to it... but I suppose it doesn't matter in the end.  �  AC33  ,            R     ;We need to relocate, and quickly, or we will surely perish.  �  A���  ,            ;     $And I may have found just the place.  �  A�    ,            �     sA quick scan of the atmosphere indicates a near Earth-level oxygen content, and miraculously, an absence of toxins.  �  A���  ,            v     _Nearby flora is of similar composition to ours, likely edible. It's almost too good to be true.  �  A�    ,            I     2I leave behind this audio log only as contingency.  �  B    ,            s     \Of course I have every intention of returning to Earth with my findings... but all the same.  �  B    ,            T     =Just in case. History is touchy about who found things first.  �  B$      void main()
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
                                                   NCS V1.0B  v      ,            7      Audio log 5-10 AF Crescent 9130.  �        ,            %     Extraordinary.  �  @�    ,            j     SNot only can this planet sustain life, but it appears sentience has even developed.  �  @�ff  ,            x     aI've just entered some sort of building after unlocking a mechanism that responded to my scanner.  �  A.ff  ,            R     ;A fresco lined the entryway, depicting bird-like creatures.  �  Avff  ,            3     Performing a ritual perhaps?  �  A���  ,            <     %What is this place? A burial chamber?  �  A�33  ,            E     .It doesn't display any characteristic markers.  �  A�    ,            B     +Maybe a museum, then. Or... an art gallery.  �  A���  ,            =     &I've never been so perfectly confused!  �  B��  ,            j     SThis is a heretofore un-encountered alien species; the usual analogues don't apply.  �  B    ,            6     My expertise means little here.  �  B ��    void main()
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
                                                   NCS V1.0B  X      ,            6     Audio log 5-13 AF Quarter 0060.  �        ,            5     This artwork with its birds...  �  @���  ,            f     OIt offers some clue as to what this place is, but what is it trying to tell me?  �  @陚  ,            �     �The second one clearly showed a progression in means of living - from the ground to the tree, from hunting and gathering to an agrarian society.  �  A4��  ,            @     )Are these birds recounting their history?  �  A���  ,            8     !Curious it should be so familiar.  �  A���  ,            W     @Yet I suppose this could all be metaphorical. Like a fairy tale.  �  A�ff  ,            R     ;I am sure there are more than just four of these creatures.  �  A�      void main()
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
                                                   NCS V1.0B  ;      ,            6     Audio log 5-15 AF Quarter 3351.  �        ,            f     OThe bird people appear to have expanded out of their trees to the ground below.  �  @�33  ,            A     *Perhaps their population needed the space?  �  A33  ,            D     -Or the trees could not support the factories.  �  A;33  ,            Q     :I'll have to test local flora for weight bearing capacity.  �  Ak33  ,            �     �Either way, if these paintings are a historical recounting, then the bird people knowingly moved into dangerous territory, where the foxes could get them.  �  A���  ,            W     @I believe that's why they moved to the trees in the first place.  �  A�ff  ,            M     6They must have counted on the walls to keep them safe.  �  A�ff  ,            L     5I am reminded again of our own first-world expansion.  �  B    ,            ?     (It seems industry attracts many peoples.  �  B      void main()
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
ff  ,            X     ATwelve year-old me wondered if she would make a good gravedigger.  �  B��  ,            �     �And now here I am, the first to discover a terra-formed planet outside our solar system, the first to discover a sentient alien species.  �  B&    ,            <     %And the one who can save humanity....  �  BC33  ,            D     -Sorry, I suppose that wasn't very scientific.  �  B_33  ,            L     5Just a bit of... background on a subjective observer.  �  Bl    ,            *     The foxes attacked.  �  B{��  ,            a     JThe bird people moved into dangerous territory, and got themselves killed.  �  B�ff  ,            C     ,It is unclear if there are any of them left.  �  B�ff  ,            J     3These paintings had to be drawn by someone, though.  �  B�      void main()
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
                                                                            IFO V3.28   	   �   9   P  3   �  �  7  �   �  8   ����    1      /         1         2         3         4         5         6         7                 
                                             
      G         Z              
   	   f      
   j           \B         A                            �?                                                                            \         
         v         w         �         �         �         �         �          �      !   �      "   �      #   �      $   �      %   �      &   �      '         (        )   !     *   "     +   1     ,         -         .         /   ?     0      
   1   K  
   1   X  
   1   e  
   1   u  
   1   �  
   1   �  
   1   �     2   4   Mod_ID          Mod_MinGameVer  Mod_Creator_ID  Mod_Version     Expansion_Pack  Mod_Name        Mod_Tag         Mod_Description Mod_IsSaveGame  Mod_CustomTlk   Mod_Entry_Area  Mod_Entry_X     Mod_Entry_Y     Mod_Entry_Z     Mod_Entry_Dir_X Mod_Entry_Dir_Y Mod_Expan_List  Mod_DawnHour    Mod_DuskHour    Mod_MinPerHour  Mod_StartMonth  Mod_StartDay    Mod_StartHour   Mod_StartYear   Mod_XPScale     Mod_OnHeartbeat Mod_OnModLoad   Mod_OnModStart  Mod_OnClientEntrMod_OnClientLeavMod_OnActvtItem Mod_OnAcquirItemMod_OnUsrDefinedMod_OnUnAqreItemMod_OnPlrDeath  Mod_OnPlrDying  Mod_OnPlrEqItm  Mod_OnPlrLvlUp  Mod_OnSpawnBtnDnMod_OnPlrRest   Mod_OnPlrUnEqItmMod_OnCutsnAbortMod_OnPlrChat   Mod_StartMovie  Mod_CutSceneListMod_GVar_List   Mod_Area_list   Area_Name       Mod_HakList     Mod_Hak         Mod_CacheNSSList   ֝!e���:?��i7�[   1.69'   ����          MR_Area1 (Intro Forest)   MR_Intro_Forest   ����        introforest x2_mod_def_load x3_mod_def_enter x2_mod_def_actx2_mod_def_aqu x2_mod_def_unaqunw_o0_deathnw_o0_dyingx2_mod_def_equ nw_o0_respawnx2_mod_def_restx2_mod_def_unequ activate_pulsemr_startmovieintroforest	   mr_sounds	   mr_models   mr_remove_ui	   mr_dinger   jacobysjungle   jungle creatures   jungle sound                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   0   8                                                 UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
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
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28   :   �  w   �     �  ;    �  �  �   ����                                                               (          0          8          @          H          P          X          d          l          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                               $         ,         4         <         D         L         T         \         d         l         t         |         �         �         �         �         �         �         �         �         �         �                                        /�                 ~                  �                  8         	         �         
         �                  �                  �#                  �#                          <                             T   
                   
               (   
      9         I   
      V         e         !                  h   
      v         �   
      �         �   
      �         �   
      �         �   
      �         �   
      �           
      &        <  
      K        a  
      p        �  
      �        �  
      �        �  
      �        �  
                
      -        E  
      V        m        "                  �   
      }        �  
      �        �  
      �        �  
      �        �  
      �          
      	        "  
      .        H  
      U        o  
      |        �  
      �        �  
      �        �  
      �          
                
      "        3        #                  $                  �                  �                 �         �                  �                                   ��                  <                 }            MAIN            STRREF          ID              LIST            NAME            RESREF             Pulse Centerpulse_center   Tabithaaudio_log_center   Torch Centertorch_center   You observescannable_center   Audio Log 1audio_log_1   Audio Log 2audio_log_2   Audio Log 3audio_log_3   Audio Log 4audio_log_4   Audio Log 5audio_log_5   Scan 1 - Tree Branchscan_tree_branch   Scan 2 - Beak Rockscan_beak_rock   Scan 2 - Bird Tilescan_bird_tile   Scan 3 - Buzz Soundscan_buzz_sound   Scan 3 - Wall Marksscan_wall_marks   Scan 4 - Garmentscan_garment   Scan 4 - Telescopescan_telescope   Scan 5 - Metal Gizmoscan_metal_gizmo   Scan 5 - Paint Brushscan_paint_brush   Scan 5 - Wall Gearsscan_wall_gears   Mushroom - Beaconm_beacon   Mushroom - Bunchm_bunch   Mushroom - Doublem_double   Mushroom - Drumm_drum   Mushroom - Notem_note   Mushroom - Note, Bluem_note_blue   Mushroom - Note, Brownm_note_brown   Mushroom - Note, Greenm_note_green   Mushroom - Note, Red
m_note_red   Mushroom - Note, Whitem_note_white   Mushroom - Note, Yellowm_note_yellow   Mushroom - Triplem_triple   Torch - Litt_lit   Torch - Unlitt_unlit                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v                              	   
      2   3   9            !   0   1                                                                      "   #   $   %   &   '   (   )   *   +   ,   -   .   /      4   5   6   7   8   NCS V1.0B  �       
log_number      3����  ���� can_be_pulsed      3"    � 
audio_log_����   \#����  ����     ]����  ��������    "    m����  F���� #    1����  play_audio_log      +         ^����  ���� ����          � ����   � ����     log_����   \# _sound#����  ���� log_����   \# 
_subtitles#����  ����    ����   �����  ����   ����  �    ?   =���         �  �    play_attempt      3����  �������� "����     ����         � $ ����  ����       ����  �    ����  ����,           Ap       ����   ,           2,                	  ����           ,           @,           !        ����     ����     ?�    ,           3,           A�     8  ����     @�fg  ,           !        ����  �  @�     ����        in_cooldown      7            � audio_log_center   @  �����  ����    play_attempt      7    playing      7,           )    play_attempt      7  @     ,           &���� ���� ����    ^  @@     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����           9         8         7    ?�  ���� ?�    -        9        8        7 ����  ����  ����� ����    time      4����  ����,               ����   �  ���� @   !  ,               #  ����    ���� ����       in_cooldown      7     playing      7      U����  ��������   X    8����       W      V����  ���� ���� ����  // The script run by either the audio log or the audio log trigger. Plays
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
    object oCenter = CreateObject(OBJECT_TYPE_PLACEABLE, "audio_log_center", GetLocation(OBJECT_SELF));

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
UTP V3.28      \   <   ,  8   �     +  �        ����    6       �          �      
                          2         F                               S                          	           
                                                                                                                        
      T                    �                                                                     X          Y      !   Z      "   [      #   \      $   ]      %   ^      &   _      '   `      (   a      )   b      *   c      +   d      ,       
   -   e      .         /     �?
   -   q      .         /     �?    0           1           2          .           3          4   y      5   z       6       
   7   {   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_PulseCenter   �           Pulse Center   F9             pulse_center                     cur_dist   dist                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   3   4   5   6   7   8   9   :   ;   -   .   /   0   1   2            NCS V1.0B  2�       
pulse_type      5����  ��������  beacon#   � time      4����  ���� color      5����  ���� in_cooldown      3"   &����        m����    I����  ����      �  �����  ����    ?   =���         �����    �����     ����      �    in_cooldown      7,                  5  ����   ?   ���� ����        . ����     ����   M- ����  note#    time      4����  ���� color      5����  ���� sound      5����  ��������   #   M      ����  ��������      ����     ����     ����      ����     ����     ����          A brown����  ���� note_A_below����  ����   A- ����     ����     ����     ����          B blue_l����  ���� note_B_above����  ����   �- ����     ����     ����     ����      ����     ����     ����          ; red_l����  ���� note_C����  ����   - ����     ����     ����     ����    	  ����     ����     ����    
      C green_l����  ���� note_D_above����  ����   e- ����     ����     ����     ����      ����     ����     ����          B yellow����  ���� note_F_below����  ����    �- ����     ����     ����     ����      ����     ����     ����          A white����  ���� note_G_above����  ����    ����  color      9����  sound      9 ����     in_cooldown      3"   %����        
?����    ����  ��������    i����  ����    ?   =���         �����    �����     ����      �    in_cooldown      7,                    ����   ?   ���� ����         ����     ����   	 - ����  drum#����     ����     ����  double# ����     ����     ����  triple# ����     ����     ����  bunch#    l color      5����  ���� sound      5����  ����?�  ����  ���� in_cooldown      3"   �����        �����  drum#    *����    �����  ����    �- ����  double#    *����    H����  ����    �- ����  triple#    *����     �����  ����    E- ����  bunch#    *����    "����  ����    ����    �����  ����    ?   =���         �����    |����     ����      �    in_cooldown      7,                  �  ����    ����     ����   - ����  torch#   O?�  ����  ���� yellow����  ���� sound      5����  ����       "�����    t����  ��������    _����  ����    ?   =���         �����    ����     ����      �    in_cooldown      7,                  a  ����    ����   �- ����  	scannable#����     $ in_cooldown      3"    S            � scannable_center   @  �����  ����          ����  ���� scan_sound_����   \#����  ����    ����   �����  ����   ����  �����  �    ?   =���         �  �   B text      5����  ����,           :,               ����   �  ����     >L��  ,           :,               ����   �  ����     @L��      in_cooldown      7,               ����   �  @�    ,                  �  A     ����   - ����  	audio_log#����     $ in_cooldown      3"     � 
log_number      3����  ���� log_����   \# _trigger#����  ����    ����   �����  ����    ����   �     play_audio_log   ����   -   �   �����  ��������  MR_Melody_Puzzle#    +     mel_pulse_effect      �- ����  MR_Floor_LU_Puzzle#    +     flu_pulse_effect      O- ����  MR_Echo_Puzzle#    +     ech_pulse_effect       ���� ����   lit����   3"    <���� ����     .    lit����   7     ����  ����     �����  ��������    f����  ����    ���� ����      �    ���� ����      � ���� ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����  ����  blue#        �����  ����   �- ����  blue_d#        �����  ����   c- ����  blue_l#        �����  ����   -- ����  cyan#        �����  ����   �- ����  green#        �����  ����   �- ����  green_d#        �����  ����   �- ����  green_l#        �����  ����   V- ����  brown#        �����  ����   !- ����  orange#        �����  ����   �- ����  magenta#        �����  ����   �- ����  purple#        �����  ����   ~- ����  red#        �����  ����   K- ����  red_d#        �����  ����   - ����  red_l#        �����  ����    �- ����  white#        �����  ����    �- ����  yellow#        �����  ����    v- ����  yellow_d#        �����  ����    >- ����  yellow_l#        �����  ����        ����   �����  ����     ���� ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����       in_cooldown����   7 ����  ?   ����  ��������     �����  ����    ����  �������� ���� !  �����  ����,            >���� ���� ���� ���� ���� ����      ����    ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ���� ����      �    ���� =���   ����   �����  �������     ����  ����,           >���� ���� ���� ���� ���� ����  ���U  ����        ����  ����  note_A_below#       �����  ����   ,- ����  note_B_above#       �����  ����    �- ����  note_C#       �����  ����    �- ����  note_D_above#       �����  ����    ~- ����  note_F_below#       �����  ����    B- ����  note_G_above#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          $ drum_1����  ����    r- ����         $ drum_2����  ����    <- ����         $ drum_3����  ����    ����  sound      9 ����    ����  drum_1#       �����  ����    r- ����  drum_2#       �����  ����    <- ����  drum_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & double_1����  ����    v- ����         & double_2����  ����    >- ����         & double_3����  ����    ����  sound      9 ����    ����  double_1#       �����  ����    v- ����  double_2#       �����  ����    >- ����  double_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & triple_1����  ����    >- ����         & triple_2����  ����    ����  sound      9 ����    ����  triple_1#       �����  ����    >- ����  triple_2#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          % bunch_1����  ����    t- ����         % bunch_2����  ����    =- ����         % bunch_3����  ����    ����  sound      9 ����    ����  bunch_1#       �����  ����    t- ����  bunch_2#       �����  ����    =- ����  bunch_3#       �����  ����        ����   �����  ����     ���� ���� ����   lit����   3"   �����   �����  ����@�  ����  ����    ����  ����       �  �����  �������� ����     ���� ����    ���� ���� B�  ���� ����     ����� ���� C4  ���� ����     ����� ���� C�  ���� ����     �    ���� ����      �,               ?�     � ,  ����       lit����   7 ����     ����  ���� ���� ���� ����     �����  ����      ����  torch_center   @  �����  ����    ���� ����      � ���� ����  ����   �����  �������� ���� ����   �    Y����  �������� ���� ����   �����  ����     ���� ���� ����  ���� !   ����  �������� !    ���� ����    !����  �������� !        !    ,���� !    ����  ����    ���� !   ���� ����     �!����  �������� !       !    ,���� !   ����  ����    ���� ����  ����     ���� ���� ����  ���� ����   D!����  ����     ���� ����  ���� ����   E!����  ����     ���� ����  // Any object to be affected by the pulse must have two local variables:
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
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color);

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
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color);

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
            ApplyLightAndGlowEffectIfUnlit(OBJECT_SELF, color);

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

    // Light up a large area of effect torch and play a drum sound.
    else if (type == "torch") {
        float time = 1.0;
        string color = "yellow";
        string sound = GetLocalString(OBJECT_SELF, "sound");

        LightUpTorchIfUnlit(OBJECT_SELF);

        int ePulse = GetPulseEffectLarge(color);
        effect eSound = GetSoundDrum(sound);
        TLVFXPillar(ePulse, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSound, OBJECT_SELF, time);

        // Apply cooldown period in which object can't be pulsed.
        SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
        DelayCommand(time, RemoveCooldown(OBJECT_SELF));
    }

    // A curious object that will display text when scanned.
    else if ( (type == "scannable") && (!GetLocalInt(OBJECT_SELF, "in_cooldown")) ) {
        object oCenter = CreateObject(OBJECT_TYPE_PLACEABLE, "scannable_center", GetLocation(OBJECT_SELF));

        // Get a random number from 1-5 to pick a random sound.
        int rand_num = Random(5) + 1;
        string scan_sound = "scan_sound_" + IntToString(rand_num);

        object oSound = GetObjectByTag(scan_sound);
        SoundObjectSetVolume(oSound, 127);
        SoundObjectPlay(oSound);

        // VFX_IMP_SCANNABLE_PULSE
        TLVFXPillar(686, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

        string text = GetLocalString(OBJECT_SELF, "text");
        DelayCommand(0.2, AssignCommand(oCenter, SpeakString(text)));
        DelayCommand(3.2, AssignCommand(oCenter, SpeakString(text)));

        // Apply cooldown period in which object will only emit mini-pulses.
        SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
        DelayCommand(7.0, DestroyObject(oCenter));
        DelayCommand(9.5, RemoveCooldown(OBJECT_SELF));
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
                                                UTP V3.28      D   5   �  5     r   �  �   V      ����    5   
                          5         I                               Z                          	           
                                                                                                                        
      [                    �                                                                     _          `      !   a      "   b      #   c      $   d      %   e      &   f      '   g      (   h      )   i      *   j      +   k       ,           -           .           /           0          1   l      2   m       3       
   4   n   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_ScannableCenter   �           You observe   F9             scannable_center                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   UTP V3.28      h   ?   \  8   �  '    �   �     ����    6       �          �          �      
                          9         M                               \                          	           
                                                                                                                        
      ]                    �                                                                     a          b      !   c      "   d      #   e      $   f      %   g      &   h      '   i      (   j      )   k      *   l      +   m      ,       
   -   n      .         /      
   -         .      
   /   �   
   -   �      .      
   /   �       0           1           2           .           3          4        5         6      
   7   	  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject"   H            Scan 2 - Beak Rock   9             scan_beak_rock                     can_be_pulsed   texta   A rock shaped and painted like a beak. Shells of the glowing berries lie scattered on the ground.
   pulse_type	   scannable     (branch from a berry bush)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  ]  9  �   5	     ����    6       �          �          �      
                          9         M                               \                          	           
                                                                                                                        
      ]                    �                                                                     a          b      !   c      "   d      #   e      $   f      %   g      &   h      '   i      (   j      )   k      *   l      +   m      ,       
   -   n      .         /      
   -         .      
   /   �   
   -   "     .      
   /   0      0           1           2           .           3          4   =     5   >      6      
   7   ?  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject"   H            Scan 2 - Bird Tile   9             scan_bird_tile                     can_be_pulsed   text�   A tile with a bird-like figure carved into it. Its eyes are significantly larger than those in the fresco. It appears to be looking out into the chasm.
   pulse_type	   scannable     (branch from a berry bush)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �    �  �   �     ����    6       �          �          �      
                          :         N                               ^                          	           
                                                                                                                        
      _                    �                                                                     c          d      !   e      "   f      #   g      $   h      %   i      &   j      '   k      (   l      )   m      *   n      +   o      ,       
   -   p      .         /      
   -   �      .      
   /   �   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject#   H            Scan 3 - Buzz Sound   9             scan_buzz_sound                     can_be_pulsed   text8   There is nothing here. A faint buzzing can now be heard.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  (    �    	     ����    6       �          �          �      
                          7         K                               X                          	           
                                                                                                                        
      Y                    �                                                                     ]          ^      !   _      "   `      #   a      $   b      %   c      &   d      '   e      (   f      )   g      *   h      +   i      ,       
   -   j      .         /      
   -   {      .      
   /   �   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject    H            Scan 4 - Garment   9             scan_garment                     can_be_pulsed   textY   A tailored garment made entirely of coloured feathers. The sleeves and collar are gilded.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  \  8  �   4	     ����    6       �          �          �      
                          ;         O                               `                          	           
                                                                                                                        
      a                    �                                                                     e          f      !   g      "   h      #   i      $   j      %   k      &   l      '   m      (   n      )   o      *   p      +   q      ,       
   -   r      .         /      
   -   �      .      
   /   �   
   -        .      
   /   "      0           1           2           .           3          4   /     5   0      6      
   7   1  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject$   H            Scan 5 - Metal Gizmo   9             scan_metal_gizmo                     can_be_pulsed   text�   A small gizmo with many parts. It is metallic and cube-shaped, with bevelled edges. Given its size, it exudes a large amount of heat.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  t  P  �   L	     ����    6       �          �          �      
                          ;         O                               `                          	           
                                                                                                                        
      a                    �                                                                     e          f      !   g      "   h      #   i      $   j      %   k      &   l      '   m      (   n      )   o      *   p      +   q      ,       
   -   r      .         /      
   -   �      .      
   /   �   
   -   ,     .      
   /   :      0           1           2           .           3          4   G     5   H      6      
   7   I  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject$   H            Scan 5 - Paint Brush   9             scan_paint_brush                     can_be_pulsed   text�   A thin stick of bluish wood, clearly carved. The surface is scratched in several places. Bristles protrude from the end, covered in a dried orange substance.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =             
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_1   ����          Scan Sound 1scan_sound_1scannable_1                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =             
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_2   ����          Scan Sound 2scan_sound_2scannable_2                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =             
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_3   ����          Scan Sound 3scan_sound_3scannable_3                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =             
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_4   ����          Scan Sound 4scan_sound_4scannable_4                                	   
                                                   UTS V3.28      P      �     (  M   u  d   �     ����                 
                          0                                                                        	     �?   
      A        �?                          �a        �                                                                               =             
      I   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            scan_sound_5   ����          Scan Sound 5scan_sound_5scannable_5                                	   
                                                   UTP V3.28      h   ?   \  8   �  9    �   	     ����    6       �          �          �      
                          9         M                               \                          	           
                                                                                                                        
      ]                    �                                                                     a          b      !   c      "   d      #   e      $   f      %   g      &   h      '   i      (   j      )   k      *   l      +   m      ,       
   -   n      .         /      
   -         .      
   /   �   
   -   �      .      
   /   �       0           1           2           .           3          4        5         6      
   7     Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject"   H            Scan 4 - Telescope   9             scan_telescope                     can_be_pulsed   textf   Clearly a telescope, though of tiny proportion. It is made of bluish wood. A crack runs down the side.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  :    �   	     ����    6       �          �          �      
                          ;         O                               `                          	           
                                                                                                                        
      a                    �                                                                     e          f      !   g      "   h      #   i      $   j      %   k      &   l      '   m      (   n      )   o      *   p      +   q      ,       
   -   r      .         /      
   -   �      .      
   /   �   
   -   �      .      
   /         0           1           2           .           3          4        5         6      
   7     Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject$   H            Scan 1 - Tree Branch   9             scan_tree_branch                     can_be_pulsed   textp   A blue coloured branch with glowing berries. Sensors indicate a cherry-like composition. They are likely edible.
   pulse_type	   scannable     (branch from a berry bush)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  a  =  �   9	     ����    6       �          �          �      
                          :         N                               ^                          	           
                                                                                                                        
      _                    �                                                                     c          d      !   e      "   f      #   g      $   h      %   i      &   j      '   k      (   l      )   m      *   n      +   o      ,       
   -   p      .         /      
   -   �      .      
   /   �   
   -        .      
   /   '      0           1           2           .           3          4   4     5   5      6      
   7   6  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject#   H            Scan 5 - Wall Gears   9             scan_wall_gears                     can_be_pulsed   text�   A wall section covered in gears. None of them are moving but a few glow faintly. It is impossible to tell if it is decorative or functional.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  \  8  �   4	     ����    6       �          �          �      
                          :         N                               ^                          	           
                                                                                                                        
      _                    �                                                                     c          d      !   e      "   f      #   g      $   h      %   i      &   j      '   k      (   l      )   m      *   n      +   o      ,       
   -   p      .         /      
   -   �      .      
   /   �   
   -        .      
   /   "      0           1           2           .           3          4   /     5   0      6      
   7   1  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject#   H            Scan 3 - Wall Marks   9             scan_wall_marks                     can_be_pulsed   text�   A wall covered in markings. A large spiral shape is made up of a series of smaller spirals, each of them different in shape and colour.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28      �  B   �     $  �  �    �  �   ����                                                    $          ,          4          @          H          P          X          `          h          t          |          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                       &                      
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
      �         �         !                  p   
                
               0  
      =        M  
      Z        j  
      w        �  
      �        �        "                  �   
      �        �        #                  $                  �            MAIN            STRREF          ID              LIST            NAME            RESREF             Gorillagorilla   Jungle Birdsjunglebirds   Lionslions   Jungle Nightjungle3   Jungle1jungle1   Jungle2jungle2   Log 1 Soundlog_1_sound   Log 2 Soundlog_2_sound   Log 3 Soundlog_3_sound   Log 4 Soundlog_4_sound   Log 5 Soundlog_5_sound   Scan Sound 1scan_sound_1   Scan Sound 2scan_sound_2   Scan Sound 3scan_sound_3   Scan Sound 4scan_sound_4   Scan Sound 5scan_sound_5   Weather Rainweather_rain
   Intro Line
intro_line                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A                                             	   
                                                                  ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                       �                                                       !                  "                  #                  $            MAIN            STRREF          ID              LIST                                    	   
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

effect GetLightEffect(string color)
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

    if (color == "magenta") value = 712; // VFX_IMP_URN_PULSE_MAGENTA
    else if (color == "green") value = 713; // VFX_IMP_URN_PULSE_GREEN
    else if (color == "orange") value = 714; // VFX_IMP_URN_PULSE_ORANGE
    else if (color == "brown") value = 715; // VFX_IMP_URN_PULSE_BROWN
    else if (color == "yellow") value = 716; // VFX_IMP_URN_PULSE_YELLOW

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

void ApplyLightAndGlowEffectToObject(object oAffected, string color)
{
    effect eGlow = GetGlowEffect(color);
    effect eLight = GetLightEffect(color);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oAffected);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oAffected);
}

void ApplyLightAndGlowEffectIfUnlit(object oAffected, string color)
{
    if (!GetLocalInt(oAffected, "lit")) {
        ApplyLightAndGlowEffectToObject(oAffected, color);

        // Set flag on object that it is lit up now.
        SetLocalInt(oAffected, "lit", TRUE);
    }
}

void ApplyLightAtNewLocation(location source, float distance, float angle, float facing, effect eLight)
{
    location target = GenerateNewLocationFromLocation(source, distance, angle, facing);
    object oCenter = CreateObject(OBJECT_TYPE_PLACEABLE, "torch_center", target);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oCenter);
}

void LightUpTorchIfUnlit(object oAffected)
{
    if (!GetLocalInt(oAffected, "lit")) {
        location torch_loc = GetLocation(oAffected);
        float distance = 7.0;
        float facing = 0.0;
        effect eLight = EffectVisualEffect(VFX_DUR_LIGHT_YELLOW_20);

        ApplyLightAtNewLocation(torch_loc, distance, 0.0, facing, eLight);
        ApplyLightAtNewLocation(torch_loc, distance, 90.0, facing, eLight);
        ApplyLightAtNewLocation(torch_loc, distance, 180.0, facing, eLight);
        ApplyLightAtNewLocation(torch_loc, distance, 270.0, facing, eLight);

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
UTT V3.28      P   !   �      �  {   W  �   �     ����           x      
                          !                                            
      C   
      G       	          
                                                                                                           K         L         M         N         O         ^         _             
      `            
      l             
      w   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            topdown_cameratopdown_camera   �9            Topdown Camera            cmd_cam_switch     cam_type   topdown                                	   
                                                                            UTP V3.28      D   5   �  5     k   {  �   O      ����    5   
                          2         F                               S                          	           
                                                                                                                        
      T                    �                                                                     X          Y      !   Z      "   [      #   \      $   ]      %   ^      &   _      '   `      (   a      )   b      *   c      +   d       ,           -           .           /           0          1   e      2   f       3       
   4   g   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            ot_TorchCenter   �           Torch Center   F9             torch_center                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   ITP V3.28      L  /   �     �  �   �  �   s  l   ����                                                               ,          4          <          D          L          T          `          h          p          x          �          �          �          �          �          �          �                       :                  �                  �#                                                       0   
                   
               0   
      >         O   
      ]         n   
      |         �         !                  H   
      �         �   
      �         �         "                  #                  $                  �        T         ��                  �                  �                  �                  ��            MAIN            STRREF          ID              LIST            NAME            RESREF             Log 1 Triggerlog_1_trigger   Log 2 Triggerlog_2_trigger   Log 3 Triggerlog_3_trigger   Log 4 Triggerlog_4_trigger   Log 5 Triggerlog_5_trigger   Puzzle Camerapuzzle_camera   Topdown Cameratopdown_camera                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .                                                   	   
                              NCS V1.0B  {           ]����  ��������    "   �����   �����  ��������  scannableObject#    � initialized����   3"    � blue_l   8����  ����    ���� ����      �����    �    initialized����   7 ����       �- ����  audioLog#    f initialized����   3"    <����    	�    initialized����   7       - ����  t_Lit#    ����    E   �- ����  Echo_Pedestal_On#    � initialized����   3"    � color����   5����  ��������    �����  ����    ���� ����      �    initialized����   7 ����       - ����  Echo_Pedestal_Vary#    initialized����   3"    � color����   5����  ���� 	time_glow����   4����  ���� 	time_next����   4����  ����   ���� ���� ���� ����    $    initialized����   7 ����        �- ����  wisp#    �����    � color����   5����  ��������     �����  ����    ���� ����      �����    �����  ����    ���� ����      � ����         ^����  ���� ���� ���N ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����          =���   ����   �  �    9,           ����  ����  ?�     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,       8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����   playing����   3����  ���� red ��������  �������� "    |@   ����  ����?@  ���� !���� ����      �    ?   =���   ����   �  � ����   	- ?������  ���� play_attempt����   3����  ��������             ����         A    ���� ����      �   ����  ����    ����         =    ?   =���   ����   �  � ����     ����,           ����  ���  ����    ���� ����   lit����   3"   �����   �����  ����@�  ����  ����    ����  ����       �  �����  �������� ����     ���� ����    ���� ���� B�  ���� ����     ����� ���� C4  ���� ����     ����� ���� C�  ���� ����     �    ���� ����      �,               ?�     � ,  ����       lit����   7 ����     ����  ���� ���� ���� ����     �����  ����      ����  torch_center   @  �����  ����    ���� ����      � ���� ����  ����   �����  �������� ���� ����   �    Y����  �������� ���� ����   �����  ����     ���� ���� ����  ���� !   ����  �������� !    ���� ����    !����  �������� !        !    ,���� !    ����  ����    ���� !   ���� ����     �!����  �������� !       !    ,���� !   ����  ����    ���� ����  ����     ���� ���� ����  ���� ����   D!����  ����     ���� ����  ���� ����   E!����  ����     ���� ����  ����     X     inverted����   7,           ����     �  ����       ����  �������  �������� ���� ����      �,           6���� ���� ���� ���� ����  ���%  ����    ���� ����      inverted����   7 ����  ����   U����  ��������   X    <���� ����   W����   V����  ���� ���� ���� ����  ����  green#       �����  ����    �- ����  blue#       �����  ����    s- ����  orange#       �����  ����    =- ����  magenta#        ����  ����        ����   �����  ����     ���� ���� ����  // Finds all objects in an area that must have permanent effects initialized
// to them, and initiates said effects.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"
#include "support_effects"

// The height at which pulses are initiated from objects.
const float height = 0.5;

void ScannableObject(object oScan);
void AudioLog(object oLog);
void BlinkGlow(object oGlow, float time_glow, float time_next, string color, int invert);
void Invert(object oGlow);

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

        else if (object_tag == "Echo_Pedestal_On") {
            if (!GetLocalInt(oLoop, "initialized")) {
                string color = GetLocalString(oLoop, "color");
                effect eGlow = GetGlowEffect(color);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oLoop);
                SetLocalInt(oLoop, "initialized", TRUE);
            }
        }

        else if (object_tag == "Echo_Pedestal_Vary") {
            if (!GetLocalInt(oLoop, "initialized")) {
                string color = GetLocalString(oLoop, "color");
                float time_glow = GetLocalFloat(oLoop, "time_glow");
                float time_next = GetLocalFloat(oLoop, "time_next");
                BlinkGlow(oLoop, time_glow, time_next, color, TRUE);
                SetLocalInt(oLoop, "initialized", TRUE);
            }
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
    TLVFXPillar(687, GetLocation(oScan), 1, 0.1, 0.0, 0.0);

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

// Indefinitely turn a glow on and off on an object every set amount of time.
void BlinkGlow(object oGlow, float time_glow, float time_next, string color, int invert)
{
    // Will make object react differently to pulse only for duration of glow.
    if (invert) {
        SetLocalInt(oGlow, "inverted", FALSE);
        DelayCommand(time_glow, Invert(oGlow));
    }

    effect eGlow = GetGlowEffect(color);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGlow, oGlow, time_glow);

    DelayCommand(time_next, BlinkGlow(oGlow, time_glow, time_next, color, invert));
}

void Invert(object oGlow)
{
    SetLocalInt(oGlow, "inverted", TRUE);
}
NCS V1.0B   �            U����  ��������   X    _����   �   J     %����       W    +          V����  ���� ���� ����  // Remove the freeze effect from the player and let them move again.

void PromptAgain();

void main()
{
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

//    DelayCommand(8.0, PromptAgain());
}

/*
// Will start looping prompt again if player doesn't hit F1 within certain
// time after first hitting it.
void PromptAgain()
{
    int hit_f1 = GetLocalInt(OBJECT_SELF, "hit_f1");

    if (hit_f1 < 2) {
        FloatingTextStringOnCreature("Hit F1 to pulse", OBJECT_SELF);
        DelayCommand(2.0, PromptAgain());
    }
}
NCS V1.0B  �         ����  ��������   �"     ����   �    ,           #����  
enter_area          ,           *     pulse_ready����   7  =���  ,           %     hit_f1����   7  >L��   � ����  ����    ���� ����      � <My scanner shows a large, unnatural object to the northeast.����  ����     
intro_line  �����  ����   ����  �,           :,               ����   �  ����     @     ,           ����  �  @     ,           6,                   �  ����     @�    ,           *    pulse_ready����   7  @�    ,           ����       A     ����   hit_f1����   3����  �������� "    2   ����  Hit F1 to pulse     ����      ����    =    ,           ����  ���e  @      ���� ����  // Custom script for OnClientEnter under:
// Edit -> Module Properties -> Events
//
// This script runs our custom enter_module script, and also initiates a quick
// pulse tutorial. Default script for OnClientEnter is "x3_mod_def_enter".

// For GetMyArea(object)
#include "nw_i0_henchman"

void HitF1Prompt(object oPC);

void main()
{
    // Determine if entering object is the PC.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC)) return;

    DelayCommand(0.0, ExecuteScript("enter_area", oPC));
    DelayCommand(0.1, SetLocalInt(oPC, "pulse_ready", FALSE));
    DelayCommand(0.2, SetLocalInt(oPC, "hit_f1", 0));

    // Effect to immobilize the player for the tutorial.
    effect freezeEffect = EffectCutsceneImmobilize();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, freezeEffect, oPC);

    string text = "My scanner shows a large, unnatural object to the northeast.";
    object oSound = GetObjectByTag("intro_line");
    SoundObjectSetVolume(oSound, 127);

    DelayCommand(2.5, AssignCommand(oPC, SpeakString(text)));
    DelayCommand(2.5, SoundObjectPlay(oSound));
    DelayCommand(6.5, AssignCommand(oPC, SpeakString("")));
    DelayCommand(6.5, SetLocalInt(oPC, "pulse_ready", TRUE));
    DelayCommand(9.0, HitF1Prompt(oPC));
}

// Keep prompting the player to hit F1 to use their pulse for the first time.
void HitF1Prompt(object oPC)
{
    int hit_f1 = GetLocalInt(oPC, "hit_f1");

    // Prompt the player if F1 hasn't been hit.
    if (!hit_f1) FloatingTextStringOnCreature("Hit F1 to pulse", oPC);

    // End this pseudo-heartbeat when F1 is hit.
    if (hit_f1) return;

    // Recursively call itself on a delay to act as a pseudo-heartbeat.
    DelayCommand(2.0, HitF1Prompt(oPC));
}
UTP V3.28      \   <   ,  8   �  �   9  �   )     ����    6       �          �      
                 	         (         <                               B                          	           
                                             �                                                                           
      C                    	                                                                    G          H      !   I      "   J      #   K      $   L      %   M      &   N      '   O      (   P      )   Q      *   R      +   S      ,       
   -   T      .         /      
   -   e      .      
   /   s       0           1           2           .           3          4   |      5   }       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Lit   39            Torch - Lit   29             t_lit                     can_be_pulsed
   pulse_type   torch nw_02_onoff                                	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   3   4   5   6   7   8   9   :   ;   -   .   /   0   1   2            UTP V3.28      \   <   ,  8   �  �   ?  �   /     ����    6       �          �      
                          ,         @                               H                          	           
                                             �                                                                           
      I                    	                                                                    M          N      !   O      "   P      #   Q      $   R      %   S      &   T      '   U      (   V      )   W      *   X      +   Y      ,       
   -   Z      .         /      
   -   k      .      
   /   y       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            t_Unlit   39            Torch - Unlit   29             t_unlit                     can_be_pulsed
   pulse_type   torch nw_02_onoff                                	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   3   4   5   6   7   8   9   :   ;   -   .   /   0   1   2            ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                                                            !                  "                  #                  $                  �            MAIN            STRREF          LIST            ID                                      	   
                                          UTS V3.28      P      �     (  K   s  d   �     ����                 
                          /                                                                       	     �?   
      A        �?                                                                                       $                              <             
      G   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            WeatherRain   ����          Weather Rainweather_rain
rain_sound                                	   
                                                   