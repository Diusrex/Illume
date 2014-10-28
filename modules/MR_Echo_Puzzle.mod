MOD V1.0      G   �   �   �	  r   ,  ����                                                                                                                            activate_pulse      �  activate_pulse     �  aoe_of_pulse       �  aoe_of_pulse       �  audio_log_1        �  cmd_cam_switch     �  cmd_cam_switch     �  cmd_cam_topdown    �  cmd_cam_topdown    �  creaturepalcus  	   �  doorpalcus      
   �  ech_aoe_of_pulse   �  ech_aoe_of_pulse   �  ech_gong           �  ech_ped_on         �  ech_ped_vary       �  ech_platform       �  ech_pulse_effect   �  ech_pulse_effect   �  encounterpalcus    �  end_module         �  end_module         �  enter_area         �  enter_area         �  itempalcus         �  log_1_sound        �  log_1_subtitles    �  log_1_subtitles    �  log_1_trigger      �  module             �  m_beacon           �  m_bunch            �  m_double            �  m_drum          !   �  m_note          "   �  m_note_blue     #   �  m_note_brown    $   �  m_note_green    %   �  m_note_red      &   �  m_note_white    '   �  m_note_yellow   (   �  m_triple        )   �  placeablepalcus *   �  play_audio_log  +   �  play_audio_log  ,   �  pulse_center    -   �  pulse_effect    .   �  pulse_effect    /   �  puzzle_camera   0   �  Repute          1   �  scannable_branch2   �  scannable_brush 3   �  soundpalcus     4   �  stepstones      5   �  stepstones      6   �  stepstones      7   �  storepalcus     8   �  support_color   9   �  support_effects :   �  support_sound   ;   �  support_sound   <   �  topdown_camera  =   �  triggerpalcus   >   �  turn_on_effects ?   �  turn_on_effects @   �  tutorial_end    A   �  tutorial_end    B   �  tutorial_start  C   �  tutorial_start  D   �  waypointpalcus  E   �  weather_rain    F   �                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          �  H    m  u  �  N  "	  p"  �  9+  �  �,  �  b/  �   I0  �  �1  �  �=  �  �@  �  �C  b
  �M  ~  hV  q	  �_  
  �i  O  9q  Y  �  �  9�  �  �  *   �  /   :�  E  �    ��  l  �  �  �     �  
  �  �  Ƕ  �  ��  �  ��  �  �  �  ��  �  !�  w  ��  .	  ��  /	  ��  1	  & %	  K /	  z 2	  �! �  4* �  6 S  T>   mM '  �U �*  C� �  � �  ̟ a  -� 	  1� ;	  l� �  $� |2  �� �  8� ��  
� �  �� y  k� �  ��    � �  �� �  � �  ; �  � _  O( W  �) �  ^- f  �/ �  T5 �  <7 �  NCS V1.0B  H      ?�  ����  ����*     +  ����   F ����  ��������   �����  ���� pulse_ready����   3   � hit_f1����   3        � hit_f1����   3����  ��������      hit_f1����   7����          )����  tutorial_end       ����        '���� =���   ����   �    �      ����  pulse_center   @  �����  ��������  aoe_of_pulse       pulse_ready����   7 pulse_cooldown����   4����  ����,          ����    �  ����    ����       I ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,      8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����      pulse_ready����   7 ����  // Custom script for OnPlayerChat under:
// Edit -> Module Properties -> Events
//
// This script starts the chain of scripts that encompasses a pulse.
// No default script for OnPlayerChat.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

// The height at which pulses are initiated from objects.
float height = 1.0;

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
                          '         ;                               G                          	           
                                             u                                                                           
      H                                                                                         L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .         /      
   -   �      .         /     �A    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            audioLog   QJ           Tabitha   ^J            audio_log_1                     can_be_pulsed
   pulse_type	   audio_log
   log_number   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   9   :   ;   <   =   >   ?   @   A   -   .   /   0   1   2   3   4   5   6   7   8                  NCS V1.0B  �         ����  ��������   �"     ����   9    ����       ����        cam_type      5����  ����    ����  9    ����  8    ����  7����  topdown#    ?�ff����      ;- ����  puzzle#    A@  ����         ����  9   ����  8   ����  7 ����  // Locks the player's camera to a set height depending on the trigger
// they've entered.

void main()
{
    // Determine if entering object is the PC.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC)) return;
    if (GetCutsceneMode(oPC)) return;

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
NCS V1.0B   �          ����  ��������       ����    �        ����  9    ����  8    ����  7    A�  A�  B�    -   ����  9   ����  8   ����  7 ����  // Locks the player's camera to a set position.

void main()
{
    object oPC = OBJECT_SELF;
    if (GetCutsceneMode(oPC)) return;

    LockCameraDirection(oPC, FALSE);
    LockCameraDistance(oPC, FALSE);
    LockCameraPitch(oPC, FALSE);

    SetCameraFacing(90.0, 25.0, 20.0);

    LockCameraDirection(oPC, TRUE);
    LockCameraDistance(oPC, TRUE);
    LockCameraPitch(oPC, TRUE);
}
ITP V3.28   =     y   �      	       	  �  �
    ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �                      %                 �         0         &        L         '                  (                  )                  *                  �          	         8                  9                  :                          d         G         "         H         #         I         $         J         %         1        x         2                  3                  4                  5                  6                                    �          2         ,        �         -         
         .                  �         1         8                  ;        �         <                  =                  >                  +         /         ?                  /                  #        �         
                  B                  �                   D                  C                  k                   E         !         K        �                   &                   '                   (                   *                   )         !          +         #          ,         �          -                                              !                  "                  #                  $                  L         .   MAIN            STRREF          LIST            ID                                      	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x         -   6   <            	   
                        $   %                                                                               !   "   #      &   '   (   )   *   +   ,      .   /   0   1   2   3   4   5      7   8   9   :   ;   ITP V3.28      �            @      @  `   �  <   ����                                                               (          0          8          @          H          P          X                                                            !                  "                  #                  $                  N                  O        (         P                  �          	         Q                  R            MAIN            STRREF          LIST            ID                                      	   
                                                                              	   
         NCS V1.0B  �       dist      4����  ����*     +  ����  ?�  ����  ����,                    ���� !  ,              R  >�  ���� !  ,              %  ?   ���� !   ����      ����  ���� cur_dist      4����  ����     ]����  ��������    "    �����     "    �����       �����  �������� ���� !����     $���� ���� '���� !!     W can_be_pulsed����   3    -����  ech_pulse_effect                   ^����  ���� �������� '���� !����  ��������  cur_dist      8����    '���� %!    +'����  cur_dist      8     ����  // The pedestal object that uses this script must have six local variables:
//     int can_be_pulsed = 1
//     string pulse_type = pedestal
//     float dist        = quarter of max pulse distance (sizeEnd in custom .mdl
//                         file for the related pulse; use a little less than
//                         half of the specified sizeEnd for the max distance)
//     float cur_dist    = dist
//     float time        = around double the duration of the pedestal pulse
//                         (lifeExp in custom .mdl file)
//     string color      = one of 16 colors for the glow and light
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
        // It could find itself, which is bad.
        if (oLoop != OBJECT_SELF) {
            obj_dist = GetDistanceBetween(OBJECT_SELF, oLoop);

            // If the object is within the distance range of the current check...
            if ((obj_dist <= cur_dist) && (obj_dist > cur_dist - dist)) {
                // And it can be pulsed...
                if (GetLocalInt(oLoop, "can_be_pulsed")) {
                    // Then execute the effect script on it.
                    ExecuteScript("ech_pulse_effect", oLoop);
                }
            }
        }

        oLoop = GetNextObjectInArea();
    }

    // This local variable has changed, so update it in order to
    // make successive checks work properly.
    cur_dist += dist;
    SetLocalFloat(OBJECT_SELF, "cur_dist", cur_dist);

    // Reset cur_dist if this is the last check.
    if (cur_dist > (3 * dist)) {
        SetLocalFloat(OBJECT_SELF, "cur_dist", dist);
    }

}

// Three checks for affected objects will occur as the pulse expands, at
// equal quarter intervals of time and distance.
void main()
{
    float time = 1.5;

    DelayCommand(0.00 * time, ActivateNextCircle());
    DelayCommand(0.25 * time, ActivateNextCircle());
    DelayCommand(0.50 * time, ActivateNextCircle());
}
UTP V3.28      h   ?   \  8   �  �   r  �   n     ����    6       �          �          �      
                          *         >                               G                          	           
                                             �                                                                           
      H                    C                                                                     L          M      !   N      "   O      #   P      $   Q      %   R      &   S      '   T      (   U      )   V      *   W      +   X      ,       
   -   Y      .         /      
   -   j      .      
   /   x   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment         	   Echo_Gong   M         	   Echo Gong   89             ech_gong                     can_be_pulsed
   pulse_type   gong   color   red                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      �   H   �  8   l  �   5     U	     ����    6       �          �          �          �                        
                          :         N                               Y                          	           
                                             �                                                                           
      Z                    L                                                                     ^          _      !   `      "   a      #   b      $   c      %   d      &   e      '   f      (   g      )   h      *   i      +   j      ,       
   -   k      .      
   /   y   
   -   �      .         /      
   -   �      .      
   /   �   
   -   �      .         /     @?
   -   �      .         /     @?
   -   �      .         /     �@    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   ?   @   A   B   C   D   E   F   G   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >                        UTP V3.28   	   �   N   L  8   �  �   �  8  �	  $   ����    6       �          �          �          �                                      ,     
                          >         R                               _                          	           
                                             �                                                                           
      `                    L                                                                     d          e      !   f      "   g      #   h      $   i      %   j      &   k      '   l      (   m      )   n      *   o      +   p      ,       
   -   q      .      
   /      
   -   �      .         /      
   -   �      .      
   /   �   
   -   �      .         /     @?
   -   �      .         /     @?
   -   �      .         /     �@
   -   �      .         /      ?
   -   �      .         /     @@    0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            Echo_Pedestal_Vary$   V            Echo Pedestal - Vary   Y9             ech_ped_vary                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time	   time_glow	   time_next                                  	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   E   F   G   H   I   J   K   L   M   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D                              UTP V3.28      D   5   �  5     k   {  �   O      ����    5   
                          2         F                               S                          	           
                                             �                                                                           
      T                    0                                                                    X          Y      !   Z      "   [      #   \      $   ]      %   ^      &   _      '   `      (   a      )   b      *   c      +   d       ,           -           .           /           0          1   e      2   f       3      
   4   g   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         HasInventory    BodyBag         Static          Type            Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            Echo_Platform   �           Echo Platform   "            ech_platform                                                    	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   NCS V1.0B  Y      ?   ����  ����*     +  ����   
pulse_type      5����  ��������  pedestal#   A time      4����  ���� color      5����  ���� in_cooldown      3"   �      � Echo_Pedestal_On#    �      U����  ��������   X    _����   Z        %����       W    +          V����  ���� ���� Echo_Pedestal_On����  ���� ����    ����    �����  ��������     ����      �    '���� =���         �  �   �    in_cooldown      7,          ����      ����        ech_aoe_of_pulse   ����     ����   - ����  gong#    � color      5����  ���� in_cooldown      3"    q����     �����  ����        ����      �    in_cooldown      7 ����        '���� =���         �  �    ����     ����  ����  blue#        �����  ����   �- ����  blue_d#        �����  ����   c- ����  blue_l#        �����  ����   -- ����  cyan#        �����  ����   �- ����  green#        �����  ����   �- ����  green_d#        �����  ����   �- ����  green_l#        �����  ����   V- ����  brown#        �����  ����   !- ����  orange#        �����  ����   �- ����  magenta#        �����  ����   �- ����  purple#        �����  ����   ~- ����  red#        �����  ����   K- ����  red_d#        �����  ����   - ����  red_l#        �����  ����    �- ����  white#        �����  ����    �- ����  yellow#        �����  ����    v- ����  yellow_d#        �����  ����    >- ����  yellow_l#        �����  ����        ����   �����  ����     ���� ���� ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,      8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����       in_cooldown      7����  Echo_Pedestal_On#    � color      5����  ��������     b����  ��������   q����  ����        ����      � ����     ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����  // Any object to be affected by the pulse must have two local variables:
//     int    can_be_pulsed = 1
//     string pulse_type    = (custom tag to determine effect)

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"
#include "support_sound"

// The height at which pulses are initiated from objects.
float height = 0.5;

void RemoveCooldown(string type);

void main()
{
    // Figure out how the object should react to the pulse.
    string type = GetLocalString(OBJECT_SELF, "pulse_type");

    if (type == "pedestal") {
        // Get necessary local variables.
        float time = GetLocalFloat(OBJECT_SELF, "time");
        string color = GetLocalString(OBJECT_SELF, "color");

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            // Remove the glow effect, but only for the pedestals that stay lit.
            if (GetTag(OBJECT_SELF) == "Echo_Pedestal_On") {
                effect eLoop = GetFirstEffect(OBJECT_SELF);
                while (GetIsEffectValid(eLoop))
                {
                    if (GetEffectSubType(eLoop) == SUBTYPE_SUPERNATURAL) {
                        RemoveEffect(OBJECT_SELF, eLoop);
                        break;
                    }
                    eLoop = GetNextEffect(OBJECT_SELF);
                }
                type = "Echo_Pedestal_On";
            }

            effect lightEffect = GetLightEffect(color);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, lightEffect, OBJECT_SELF, time);
            // VFX_IMP_PEDESTAL_PULSE
            TLVFXPillar(711, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

            // Apply cooldown period in which object will not respond.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown(type));

            ExecuteScript("ech_aoe_of_pulse", OBJECT_SELF);
        }
    }

    else if (type == "gong") {
        // Get necessary local variables.
        string color = GetLocalString(OBJECT_SELF, "color");

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            effect lightEffect = GetLightEffect(color);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, lightEffect, OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
        }

        // VFX_IMP_GONG_PULSE
        TLVFXPillar(712, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
    }
}

void RemoveCooldown(string type)
{
    SetLocalInt(OBJECT_SELF, "in_cooldown", FALSE);

    if (type == "Echo_Pedestal_On") {
        string color = GetLocalString(OBJECT_SELF, "color");
        effect glowEffect = GetGlowEffect(color);

        // Made supernatural to distinguish between possible
        // multiple effects later.
        glowEffect = SupernaturalEffect(glowEffect);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, glowEffect, OBJECT_SELF);
    }
}
ITP V3.28      �      �             X   t  4   ����                                                               (          0          8          @          H          P                       �                  �         	         �                  �                                                       !                  "                  #                  $                  �            MAIN            STRREF          ID              LIST                                    	   
                                                                        	   
   NCS V1.0B   *       
MR_fresco1 4  void main()
{
    EndGame("MR_fresco1");
}
NCS V1.0B  E         ����  ��������   �"    G    ����  ��������   �"     ����   �        ����  turn_on_effects  ,           (����  cmd_cam_topdown    ?         pulse_ready����   7@    pulse_cooldown����   8    hit_f1����   7       �  �����  ����    ���� ����      �����     �����  ��������  MR_Intro_Forest#    I     WeatherRain  �����  ��������  � ����     ����  ����     �����  ����     ���� ����  // Custom script for OnEnter under:
// Edit -> Area Properties -> Events
//
// THIS SCRIPT MUST BE SET FOR EVERY MODULE IN THE GAME.
//
// This script applies any necessary effects and local variables to PC
// upon module start, as well as runs any necessary scripts. No
// default script for OnEnter.

// For GetMyArea(object)
#include "nw_i0_henchman"

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

    SetLocalInt(oPC, "hit_f1", 2);

    // The effect that makes it seem like the environment is really dark.
    effect darknessEffect = EffectVisualEffect(VFX_DUR_BLIND);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, darknessEffect, oPC);

    // Play the rain sound only in the Intro Forest area.
    string area_tag = GetMyArea(oPC);
    if (area_tag == "MR_Intro_Forest") {
        object rain_sound = GetObjectByTag("WeatherRain");
        SoundObjectPlay(rain_sound);
    }
}
ITP V3.28   O   �  �   H     �      �  p  �  t  ����                                                               (          0          8          @          H          P          X          `          h          p          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                                         (         0         8         @         H         P         X         `         h         p         x         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �         �                                                        (         0         8         @         H         P         X         `         h                      O                  �                   �                  S         	         �                                    �         :         T        @         �                  U         
         V                  W        P         �         7         X                  �         ?         �         ;         �                  �         8         8        l         �         <         �         �         Y                  �                  Z                  [                  �                  �F        @         �         9         ]        �         ^                  _                  \                  +                  a                  b                  �         6                 �                             !                  "                  #                  $                  L         5         �        �         d        �         e                  f                  g                  �                j                   h                  i                  k                l         !         m         "         n         #         o         $         +         %         p         &         �        8        q         '         r         (         s         )         t         *         �         =         w         .         x         /         y        P        z         0         {         1         |         2         �         3         �        `        v         +         �         ,         �         -         �         >         �         4   MAIN            STRREF          LIST            ID                                      	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �               $   %   +   ,                              	   
                           	                      !   "   #                                 &   '   (   )   *   
   -   1   5   <   B   C   D   H   I   N      .   /   0      2   3   4      6   7   8   9   :   ;      =   >   ?   @   A      E   F   G      J   K   L   M   UTS V3.28      P      �     (  J   r  d   �     ����                 
                          .                                                                        	     �?   
      A        �?                          �a        �                                                                               :              
      F   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            log_1_sound   ����          Log 1 Soundlog_1_soundaudio_log_1                                	   
                                                   NCS V1.0B          FHello, my name is Tabitha Raya, and I have made an enormous discovery.����  ���� `I am one of several individuals charged with discovering habitable planets in the deep of space.����  ���� GThe Earth has run dry of resources and is too polluted to sustain life.����  ���� QHumanity is in need of a new place to live, and it seems I may have found us one.����  ���� 2I leave behind this audio log only as contingency.����  ���� hOf course I have every intention of returning to Earth with my findings, but all the same, just in case.����  ���� /History is touchy about who found things first.����  ����,               ����   �  ?�    ,               ����   �  @�    ,               ����   �  A33  ,               ����   �  AS33  ,               ����   �  A���  ,               ����   �  A���  ,               ����   �  Ař�   ����  void main()
{
    string text_1 = "Hello, my name is Tabitha Raya, and I have made an enormous discovery.";
    string text_2 = "I am one of several individuals charged with discovering habitable planets in the deep of space.";
    string text_3 = "The Earth has run dry of resources and is too polluted to sustain life.";
    string text_4 = "Humanity is in need of a new place to live, and it seems I may have found us one.";
    string text_5 = "I leave behind this audio log only as contingency.";
    string text_6 = "Of course I have every intention of returning to Earth with my findings, but all the same, just in case.";
    string text_7 = "History is touchy about who found things first.";

    DelayCommand(1.0, SpeakString(text_1));
    DelayCommand(5.0, SpeakString(text_2));
    DelayCommand(9.7, SpeakString(text_3));
    DelayCommand(13.2, SpeakString(text_4));
    DelayCommand(17.2, SpeakString(text_5));
    DelayCommand(20.2, SpeakString(text_6));
    DelayCommand(24.7, SpeakString(text_7));
}
UTT V3.28      P   !   �      �  o   K  �   �     ����           x      
                                                                      
      @   
      D       	          
                                                                                                           H         I         J         K         L         [         \             
      ]                                
      k   Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           PaletteID       Comment            log_1_triggerlog_1_trigger   �9            Log 1 Trigger            play_audio_log  
   log_number                                	   
                                                                            IFO V3.28      �   8   8  3   h  �  �  �   �  4   ����    1      /         1         2         3         4         5         6                 
                                             
      >         P              
   	   d      
   h           B        �@                            �?                                                                            \         
         s         t         �         �         �         �         �          �      !   �      "   �      #   �      $   �      %   �      &   �      '   �      (        )        *        +   .     ,         -         .         /   /     0      
   1   :  
   1   J  
   1   W  
   1   d  
   1   q  
   1   �     2   0   Mod_ID          Mod_MinGameVer  Mod_Creator_ID  Mod_Version     Expansion_Pack  Mod_Name        Mod_Tag         Mod_Description Mod_IsSaveGame  Mod_CustomTlk   Mod_Entry_Area  Mod_Entry_X     Mod_Entry_Y     Mod_Entry_Z     Mod_Entry_Dir_X Mod_Entry_Dir_Y Mod_Expan_List  Mod_DawnHour    Mod_DuskHour    Mod_MinPerHour  Mod_StartMonth  Mod_StartDay    Mod_StartHour   Mod_StartYear   Mod_XPScale     Mod_OnHeartbeat Mod_OnModLoad   Mod_OnModStart  Mod_OnClientEntrMod_OnClientLeavMod_OnActvtItem Mod_OnAcquirItemMod_OnUsrDefinedMod_OnUnAqreItemMod_OnPlrDeath  Mod_OnPlrDying  Mod_OnPlrEqItm  Mod_OnPlrLvlUp  Mod_OnSpawnBtnDnMod_OnPlrRest   Mod_OnPlrUnEqItmMod_OnCutsnAbortMod_OnPlrChat   Mod_StartMovie  Mod_CutSceneListMod_GVar_List   Mod_Area_list   Area_Name       Mod_HakList     Mod_Hak         Mod_CacheNSSList   ֝!e���:>�Κe�   1.69   ����          MR Echo Puzzle   MR_Echo_Puzzle   ����               
stepstones x2_mod_def_load x3_mod_def_enter x2_mod_def_actx2_mod_def_aqu x2_mod_def_unaqunw_o0_deathnw_o0_dyingx2_mod_def_equ nw_o0_respawnx2_mod_def_restx2_mod_def_unequ activate_pulse 
stepstones   mr_remove_ui	   mr_dinger	   mr_models	   mr_sounds   cep2_add_tiles1   cep2_add_tiles2                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   0   7                                              UTP V3.28      t   B   �  8     �   �    �     ����    6       �          �          �          �      
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
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28   -   T  ^   �       q  �	  t    �   ����                                                               (          0          8          @          H          P          X          d          l          x          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �          �                                               (         0         8         D         L         T         \         d         l                                        /�                 ~                  �                  8         	         �         
         �                  �                  �#                  �#                          <                             T   
                         !                  \   
               &   
      7         @   
      P         [         "                  l   
      g         |   
      �         �   
      �         �   
      �         �   
      �         �   
      �           
              2  
      ?        Y  
      f        ~  
      �        �  
      �        �  
      �        �        #                  �   
      �          
              #  
      .        F  
      S        d        $                  �                  �                 �         �                  �                                   ��                  <                 }            MAIN            STRREF          ID              LIST            NAME            RESREF             Pulse Centerpulse_center   Susanscannable_branch   Susanscannable_brush   Tabithaaudio_log_1   Mushroom - Beaconm_beacon   Mushroom - Bunchm_bunch   Mushroom - Doublem_double   Mushroom - Drumm_drum   Mushroom - Notem_note   Mushroom - Note, Bluem_note_blue   Mushroom - Note, Brownm_note_brown   Mushroom - Note, Greenm_note_green   Mushroom - Note, Red
m_note_red   Mushroom - Note, Whitem_note_white   Mushroom - Note, Yellowm_note_yellow   Mushroom - Triplem_triple	   Echo Gongech_gong   Echo Pedestal - On
ech_ped_on   Echo Pedestal - Varyech_ped_vary   Echo Platformech_platform                        	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]                              	   
      %   &   ,                  $                                                                   !   "   #      '   (   )   *   +   NCS V1.0B  S      ?   ����  ����*     +  ����   
log_number      3����  ���� can_be_pulsed      3"   ����         ) audio_log_1����  ����         ]����  ��������    "    m����  F���� #    1����  play_audio_log      +         ^����  ���� ����          � ����   ? ����    ����         J log_1_sound����  ���� log_1_subtitles����  ����        ����   �����  ����   ����  �    '���� =���         �  �   n play_attempt      3����  �������� "����     ����         � $ ����  ����       ����  �    ����  ����,          Ap     e  ����   ,          2,               	  ����           ,          @,          !        ����     ����     ?�    ,          3,          A�     �  ����     @�fg  ,          !        ����  �  @�     ����        play_attempt      7    playing      7,          ���� ����    ^  @@     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,      8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����           9         8         7    ?�  ���� ?�    -        9        8        7 ����      play_attempt      7����  �    ����       in_cooldown      7 time      4����  ����,              #  ����    ���� ����       in_cooldown      7     playing      7      U����  ��������   X    8����       W      V����  ���� ���� ����  // The script run by either the audio log or the audio log trigger. Plays
// an audio log depending on the number.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

// The height at which pulses are initiated from objects.
float height = 0.5;

void ChangeZoom(float cam_height);
void StartPlaying(object oSound, string subtitle_script);
void RemoveCooldown();

void main()
{
    int log_number = GetLocalInt(OBJECT_SELF, "log_number");

    // If the trigger is calling this, find the audio log it triggers and
    // recursively call this script on it, then destroy the trigger.
    if (!GetLocalInt(OBJECT_SELF, "can_be_pulsed")) {
        string ResRef;

        // Find the correct object for the number.
        if (log_number == 1) ResRef = "audio_log_1";

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

    string audio_log;
    string subtitle_script;

    // Play the correct audio log for the number.
    if (log_number == 1) {
        audio_log = "log_1_sound";
        subtitle_script = "log_1_subtitles";
    }

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

    // Prepare to play the audio log.
    SetLocalInt(OBJECT_SELF, "play_attempt", 1);
    SetLocalInt(OBJECT_SELF, "playing", TRUE);
    DelayCommand(3.0, StartPlaying(oSound, subtitle_script));
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

void StartPlaying(object oSound, string subtitle_script)
{
    // The log is now playing.
    SetLocalInt(OBJECT_SELF, "play_attempt", 2);
    SoundObjectPlay(oSound);
    ExecuteScript(subtitle_script, OBJECT_SELF);

    // Apply cooldown period in which log cannot be pulsed (duration of log).
    SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
    float time = GetLocalFloat(OBJECT_SELF, "time");
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
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   3   4   5   6   7   8   9   :   ;   -   .   /   0   1   2            NCS V1.0B  *�      ?   ����  ����*     +  ����   
pulse_type      5����  ��������  beacon#   � time      4����  ���� color      5����  ���� in_cooldown      3"   ����          �  �����  ��������    �����  ��������     ����      �    '���� =���         �����    1    in_cooldown      7,             �  ����   '���� ���� ����    � ����     ����   �- ����  note#    time      4����  ���� color      5����  ���� sound      5����  ��������   #   M      ����  ��������      ����     ����     ����      ����     ����     ����          A brown����  ���� note_A_below����  ����   A- ����     ����     ����     ����          B blue_l����  ���� note_B_above����  ����   �- ����     ����     ����     ����      ����     ����     ����          ; red_l����  ���� note_C����  ����   - ����     ����     ����     ����    	  ����     ����     ����    
      C green_l����  ���� note_D_above����  ����   e- ����     ����     ����     ����      ����     ����     ����          B yellow����  ���� note_F_below����  ����    �- ����     ����     ����     ����      ����     ����     ����          A white����  ���� note_G_above����  ����    ����  color      9����  sound      9 ����     in_cooldown      3"   ����    �����    �����  ��������    }����  ��������     ����      �    '���� =���         �����        in_cooldown      7,             �  ����   '���� ���� ����    � ����     ����   �- ����  drum#����     ����     ����  double# ����     ����     ����  triple# ����     ����     ����  bunch#    ~ color      5����  ���� sound      5����  ����@   ����  ���� in_cooldown      3"   �����    �����  drum#    *����    *����  ����    �- ����  double#    *����    �����  ����    �- ����  triple#    *����    ^����  ����    E- ����  bunch#    *����    �����  ����    ����    T����  ����?�      ����      �    '���� =���         �����    �    in_cooldown      7,             g  ����   '���� ���� ����    \ ����     ����   �- ����  	scannable#    y text      5����  ����    ����   �    '���� =���         �  �   � ����   - ����  	audio_log#����     $ in_cooldown      3"     � 
log_number      3����  ��������         + log_1_trigger����  ����        ����   �����  ����    ����   �     play_audio_log   ����   -   �   �����  ��������  MR_Melody_Puzzle#    +     mel_pulse_effect      �- ����  MR_Floor_LU_Puzzle#    +     flu_pulse_effect      O- ����  MR_Echo_Puzzle#    +     ech_pulse_effect       ���� ����   lit      3"    �����     �����  ��������    �����  ����        ����      �        ����      �    lit      7 ����     ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����  ����  blue#        �����  ����   �- ����  blue_d#        �����  ����   c- ����  blue_l#        �����  ����   -- ����  cyan#        �����  ����   �- ����  green#        �����  ����   �- ����  green_d#        �����  ����   �- ����  green_l#        �����  ����   V- ����  brown#        �����  ����   !- ����  orange#        �����  ����   �- ����  magenta#        �����  ����   �- ����  purple#        �����  ����   ~- ����  red#        �����  ����   K- ����  red_d#        �����  ����   - ����  red_l#        �����  ����    �- ����  white#        �����  ����    �- ����  yellow#        �����  ����    v- ����  yellow_d#        �����  ����    >- ����  yellow_l#        �����  ����        ����   �����  ����     ���� ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,      8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����       in_cooldown      7  ?�  ����  ��������     �����  ����    ����  �������� ���� !  �����  ����,          6���� ���� ���� ���� ����      ����    ���� ����  ����  blue#       �����  ����   �- ����  blue_d#       �����  ����   c- ����  blue_l#       �����  ����   -- ����  brown#       �����  ����   �- ����  cyan#       �����  ����   �- ����  green#       �����  ����   �- ����  green_d#       �����  ����   X- ����  green_l#       �����  ����   !- ����  magenta#       �����  ����   �- ����  orange#       �����  ����   �- ����  purple#       �����  ����   ~- ����  red#       �����  ����   K- ����  red_d#       �����  ����   - ����  red_l#       �����  ����    �- ����  white#       �����  ����    �- ����  yellow#       �����  ����    v- ����  yellow_d#       �����  ����    >- ����  yellow_l#       �����  ����    ���� ����  ����     ���� ���� ����  ���� ����      �    ���� =���         �����  ���"����     ����  ����,          6���� ���� ���� ���� ����  ���_  ����        ����  ����  note_A_below#       �����  ����   ,- ����  note_B_above#       �����  ����    �- ����  note_C#       �����  ����    �- ����  note_D_above#       �����  ����    ~- ����  note_F_below#       �����  ����    B- ����  note_G_above#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          $ drum_1����  ����    r- ����         $ drum_2����  ����    <- ����         $ drum_3����  ����    ����  sound      9 ����    ����  drum_1#       �����  ����    r- ����  drum_2#       �����  ����    <- ����  drum_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & double_1����  ����    v- ����         & double_2����  ����    >- ����         & double_3����  ����    ����  sound      9 ����    ����  double_1#       �����  ����    v- ����  double_2#       �����  ����    >- ����  double_3#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          & triple_1����  ����    >- ����         & triple_2����  ����    ����  sound      9 ����    ����  triple_1#       �����  ����    >- ����  triple_2#       �����  ����        ����   �����  ����     ���� ���� ����  ����   #    �      ����  ��������          % bunch_1����  ����    t- ����         % bunch_2����  ����    =- ����         % bunch_3����  ����    ����  sound      9 ����    ����  bunch_1#       �����  ����    t- ����  bunch_2#       �����  ����    =- ����  bunch_3#       �����  ����        ����   �����  ����     ���� ���� ����  // Any object to be affected by the pulse must have two local variables:
//     int    can_be_pulsed = 1
//     string pulse_type    = (custom tag to determine effect)

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"
#include "support_effects"
#include "support_sound"

// The height at which pulses are initiated from objects.
float height = 0.5;

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
            ApplyLightAndGlowEffectIfUnlit(color);

            // Get and apply temporary pulse and sound effects.
            effect soundEffect = EffectVisualEffect(730); // VFX_DUR_BEACON
            int pulseEffect = GetPulseEffectLarge(color);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, soundEffect, OBJECT_SELF, time);
            TLVFXPillar(pulseEffect, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

            // Apply cooldown period in which object will only emit mini-pulses.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown());
            SetupMiniPulse(color, time, height);
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
            ApplyLightAndGlowEffectIfUnlit(color);

            // Get and apply temporary pulse and sound effects.
            effect soundEffect = GetSoundNote(sound);
            int pulseEffect = GetPulseEffectLarge(color);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, soundEffect, OBJECT_SELF, time);
            TLVFXPillar(pulseEffect, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

            // Apply cooldown period in which object will only emit mini-pulses.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown());
            SetupMiniPulse(color, time, height);
        }
    }

    // Play a sound from a set and emit a pulse, light up and stay lit after a pulse.
    else if ( (type == "drum") || (type == "double") || (type == "triple") || (type == "bunch") ) {
        // Get necessary local variables.
        string color = GetLocalString(OBJECT_SELF, "color");
        string sound = GetLocalString(OBJECT_SELF, "sound");

        // Use constant time regardless of type.
        float time = 2.0;

        if (!GetLocalInt(OBJECT_SELF, "in_cooldown")) {
            // Will stay lit after the first pulse.
            ApplyLightAndGlowEffectIfUnlit(color);

           // Get temporary sound effect depending on the type of object.
            effect soundEffect;
            if (type == "drum") soundEffect = GetSoundDrum(sound);
            else if (type == "double") soundEffect = GetSoundDouble(sound);
            else if (type == "triple") soundEffect = GetSoundTriple(sound);
            else if (type == "bunch") soundEffect = GetSoundBunch(sound);

            // Get and apply temporary pulse effect, apply temporary sound effect.
            int pulseEffect = GetPulseEffectLarge(color);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, soundEffect, OBJECT_SELF, 1.0);
            TLVFXPillar(pulseEffect, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);

            // Apply cooldown period in which object will only emit mini-pulses.
            SetLocalInt(OBJECT_SELF, "in_cooldown", TRUE);
            DelayCommand(time, RemoveCooldown());
            SetupMiniPulse(color, time, height);
        }
    }

    // A curious object that will display text when scanned.
    else if (type == "scannable") {
        string text = GetLocalString(OBJECT_SELF, "text");
        SpeakString(text);
        // VFX_IMP_SCANNABLE_PULSE
        TLVFXPillar(686, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
    }

    // An audio log object laying on the ground.
    else if ((type == "audio_log") && (!GetLocalInt(OBJECT_SELF, "in_cooldown"))) {
        int log_number = GetLocalInt(OBJECT_SELF, "log_number");
        string trigger;

        if (log_number == 1) trigger = "log_1_trigger";

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
                                                UTP V3.28      h   ?   \  8   �    �  �   �     ����    6       �          �          �      
                          ,         @                               Q                          	           
                                                                                                                          
      R                    �                                                                     V          W      !   X      "   Y      #   Z      $   [      %   \      &   ]      '   ^      (   _      )   `      *   a      +   b      ,       
   -   c      .         /      
   -   t      .      
   /   |   
   -   �      .      
   /   �       0           1           2           .           3          4   �      5   �       6      
   7   �   Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject   H            Susan   9             scannable_branch                     can_be_pulsed   texta   A blue coloured branch with glowing berries. Sensors indicate a cherry-like chemical composition.
   pulse_type	   scannable     (branch from a berry bush)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               UTP V3.28      h   ?   \  8   �  S  /  �   +	     ����    6       �          �          �      
                          ,         @                               P                          	           
                                                                                                                          
      Q                    �                                                                     U          V      !   W      "   X      #   Y      $   Z      %   [      &   \      '   ]      (   ^      )   _      *   `      +   a      ,       
   -   b      .         /      
   -   s      .      
   /   {   
   -        .      
   /         0           1           2           .           3          4   &     5   '      6      
   7   (  Tag             LocName         Description     TemplateResRef  AutoRemoveKey   CloseLockDC     Conversation    Interruptable   Faction         Plot            KeyRequired     Lockable        Locked          OpenLockDC      PortraitId      TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        KeyName         AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnDisarm        OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnTrapTriggered OnUnlock        OnUserDefined   OnClick         VarTable        Name            Type            Value           HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          PaletteID       Comment            scannableObject   H            Susan   9             scannable_brush                     can_be_pulsed   text�   A thin, carved stick of bluish wood. Bristles protrude from the end, covered in a dried orange substance. It has not been used in some time.
   pulse_type	   scannable  '   (paintbrush, used to paint the frescos)                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   6   7   8   9   :   ;   <   =   >   -   .   /   0   1   2   3   4   5               ITP V3.28      �      `     �  8   �  x   p  H   ����                                                               (          0          <          D          P          X          `          h          p                       &                  9�                  �                  �                  �                                                        8   
                         !                  @   
               +         "                  #                  $                  �            MAIN            STRREF          ID              LIST            NAME            RESREF             Log 1 Soundlog_1_sound   Weather Rainweather_rain                        	   
                                                                                             	                     
   ARE V3.28   A   D  �  <#  4   |&  P   �&  �
  t1    ����    *      �   
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
          ����      ����         
                         -   
      8                         	          
                                                                 22d       ���                  h~�                                       2           4B                                                                    P                  !         "         #         $   <      %   G      &   H      '   I      (   J      )         *         +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +          ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +          ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +          ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   �      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   l      +          ,           -           .           /           0           1          2          3         *   l      +          ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +          ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +          ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   l      +          ,           -           .           /           0           1          2          3         *   l      +         ,           -           .           /           0           1          2          3         *   	      +          ,           -           .           /           0           1          2          3         *         +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *   	      +         ,           -           .           /           0           1          2          3         *         +          ,           -           .           /           0           1          2          3      ID              Creator_ID      Version         Tag             Name            ResRef          Comments        Expansion_List  Flags           ModSpotCheck    ModListenCheck  MoonAmbientColorMoonDiffuseColorMoonFogAmount   MoonFogColor    MoonShadows     SunAmbientColor SunDiffuseColor SunFogAmount    SunFogColor     SunShadows      IsNight         LightingScheme  ShadowOpacity   FogClipDist     SkyBox          DayNightCycle   ChanceRain      ChanceSnow      ChanceLightning WindPower       LoadScreenID    PlayerVsPlayer  NoRest          Width           Height          OnEnter         OnExit          OnHeartbeat     OnUserDefined   Tileset         Tile_List       Tile_ID         Tile_OrientationTile_Height     Tile_MainLight1 Tile_MainLight2 Tile_SrcLight1  Tile_SrcLight2  Tile_AnimLoop1  Tile_AnimLoop2  Tile_AnimLoop3  
   StepStones   ����          Echo Puzzle
stepstones    
enter_area   tdr01                            	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _   `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o   p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �                      	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �      @                           	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?   @   GIC V3.28   )   $  1   p  
     �   �  $   �  �   ����    	                     	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	         	          	   !      	   "      	   #      	   $      	   %      	   &      	   '      	   (      	   )      	   *      	   +      	   ,      	   -      	   .      	   /      	   0                                                                       
          
               $      	   (   
         
         
         
         
         
         
          
      $   
      (   
      ,   
      0   
      4   
      8   
      <   
      @   
      D   
      H   
      L   
      P   
      T   
      X   
      \   
      `   
      d   
      h   
      l   
      p   
      t   
      x   
      |   
      �   
      �   
      �   
      �   
      �   
      �   
      �   
      �   Creature List   Door List       Encounter List  List            SoundList       StoreList       TriggerList     Comment         WaypointList    Placeable List                                                                                                                                                                                        	   
                                        &                     	   
                                                                      !   "   #   $   %   &   '   (   GIT V3.28   �   d
  �
  ��  a   ��  �  �  �*  ��    ����    
   d   (   	      L   #       �         �         �         �                   #       �        �        �        �        �     	   �  8       �         �         �         �         �     	   �  8       �         �         �         �              	     8       �                                     $     	   0  8                         (         4         @     	   L  8       ,         8         D         P         \     	   h  8       H         T         `     	   l  7   	   H	  7   	   $
  7   	      7   	   �  7   	   �  7   	   �  7   	   p  7   	   L  7   	   (  8                               	   ,  8                         $     	   0  8                         (     	   4  8                          ,         8         D         P         \         h     	   t  8       T         `         l         x         �         �         �         �     	   �  8       �         �         �         �         �         �         �         �     	   �  8       �         �         �         �                                    (     	   4  8                          ,         8         D         P     	   \  8       <         H         T         `         l         x     	   �  8       d         p         |         �         �         �     	   �  8       �         �         �         �         �         �     	   �  8       �         �         �         �         �         �     	   �  8       �         �         �                                 	   $  8                                     (          4          @      	   L   8       ,!         8!         D!         P!         \!         h!     	   t!  8       T"         `"         l"         x"         �"         �"     	   �"  8       |#         �#         �#         �#         �#         �#     	   �#  8       �$         �$         �$         �$         �$         �$     	   �$  8       �%         �%         �%         �%         �%         &     	   &  8       �&          '         '         '         $'         0'     	   <'  8       (         ((         4(         @(         L(         X(     	   d(  8       D)         P)         \)         h)         t)         �)     	   �)  8       l*         x*         �*         �*         �*         �*                                                                                                  	   �_    
                                                             
                                                                     
      @   
      D                                                                                !           "           #          $          %   H      &   I      '   J      (   K      )   L      *   [      +   \      ,   $   
   -   ]            
   .   i      /   �\�A   0   ���A   1          2          3          4          5   ,      6    hּ   7   X�&�   8   ff��   6   �#�A   7   �70�   8   ff��   6   �P�A   7    ���   8   ff��   6          7          8   ff��
      s         �         �                                            
      �   
      �                                                                                !           "           #          $          %   �      &   �      '   �      (   �      )   �      *   �      +   �      ,   @   
   -   �            
   .   �      /   ;��A   0   [-�A   1          2          3          4          5   H      6   �� �   7   �	�   8   ff��   6   Ŏ�A   7   x�
�   8   ff��   6   o:�A   7    >   8   ff��   6          7          8   ff��   9   \      :   `   
      �      ;   �      <           1                 =          >   =      ?                   @           A           B           C           D                                                    !          "           #          $       
      >      E          F   v     G         H          I          J          K           L          M   B     N   C     O   D     %   E     P   F     Q   G     R   H     S   I     T   J     &   K     U   L     V   M     '   N     ,   �   
   -   O              .      
   -   `           
   .   n  
   -   v           
   .     
   -   �              .     �@
   -   �           
   .   �      W           X           Y                      Z          [   �     \   �     ]   9��A   ^   �?�A   _     ��   `      �
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D                                                    !          "           #          $       
             E          F   v     G         H          I          J          K           L          M        N        O        %        P        Q   	     R   
     S        T        &        U        V        '        ,     
   -                 .      
   -   "           
   .   0  
   -   8           
   .   A  
   -   K              .     �@
   -   S           
   .   \      W           X           Y                      Z          [   l     \   m     ]   � B   ^   �A   _     �5   `      �
      n     ;   x     <   �        �                 =          >   �      ?                   @           A           B           C           D                                                    !          "           #          $       
      �      E          F   v     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   ,  
   -   �              .      
   -   �           
   .   �  
   -   �           
   .     
   -                 .     �@
   -              
   .         W           X           Y                      Z          [   .     \   /     ]   |�HB   ^   �T�A   _          `      �
      0     ;   :     <   c        w                 =          >   �      ?                   @           A           B           C           D                                                    !          "           #          $       
      �      E          F   v     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   D  
   -   �              .      
   -   �           
   .   �  
   -   �           
   .   �  
   -   �              .     �@
   -   �           
   .   �      W           X           Y                      Z          [   �     \   �     ]    B   ^   L��A   _     T:   `      �
      �     ;   �     <   %        9                 =          >   E      ?                   @           A           B           C           D                                                    !          "           #          $       
      F      E          F   v     G         H          I          J          K           L          M   J     N   K     O   L     %   M     P   N     Q   O     R   P     S   Q     T   R     &   S     U   T     V   U     '   V     ,   \  
   -   W              .      
   -   h           
   .   v  
   -   ~           
   .   �  
   -   �              .     �@
   -   �           
   .   �      W           X           Y                      Z          [   �     \   �     ]   � B   ^   $WA   _     ж   `      �
      �     ;   �     <   �        �                 =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   �     G         H          I          J          K           L          M        N        O   	     %   
     P        Q        R        S        T        &        U        V        '        ,   t  
   -                 .      
   -   %           
   .   3  
   -   =           
   .   F      W           X           Y                      Z          [   O     \   P     ]   �B   ^   r��@   _     ж   `      �
      Q     ;   b     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   0     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]     HB   ^     B   _          `   ��?
      �     ;   �     <   �        �                 =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   0     G         H          I          J          K           L          M        N        O        %        P        Q        R        S        T        &        U        V        '         W           X           Y                      Z          [        \        ]     HB   ^     $B   _          `   �ɿ
           ;   0     <   Q        e                 =          >   r      ?                   @           A           B           C           D            �                                      !          "           #          $       
      s      E          F   0     G         H          I          J          K           L          M   w     N   x     O   y     %   z     P   {     Q   |     R   }     S   ~     T        &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]      B   ^     B   _          `   �I�
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   0     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]      B   ^     B   _          `      �
      �     ;   �     <           3                 =          >   @      ?                   @           A           B           C           D            �                                      !          "           #          $       
      A      E          F   0     G         H          I          J          K           L          M   E     N   F     O   G     %   H     P   I     Q   J     R   K     S   L     T   M     &   N     U   O     V   P     '   Q      W           X           Y                      Z          [   R     \   S     ]      B   ^     .B   _          `   �ɿ
      T     ;   e     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   0     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]     �A   ^     B   _          `      �
      �     ;   �     <   �                         =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   0     G         H          I          J          K           L          M        N        O        %        P        Q        R        S        T        &        U        V        '         W           X           Y                      Z          [         \   !     ]     �A   ^     $B   _          `   �ɿ
      "     ;   3     <   T        h                 =          >   u      ?                   @           A           B           C           D            �                                      !          "           #          $       
      v      E          F   0     G         H          I          J          K           L          M   z     N   {     O   |     %   }     P   ~     Q        R   �     S   �     T   �     &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]     �A   ^     6B   _          `      �
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   0     G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �      W           X           Y                      Z          [   �     \   �     ]     �A   ^     HB   _          `   �I�
      �     ;   �     <   	        .	                 =          >   7	      ?                   @           A           B           C           D            �                                      !          "           #          $       
      8	      E          F   C      G         H          I          J          K           L          M   <	     N   =	     O   >	     %   ?	     P   @	     Q   A	     R   B	     S   C	     T   D	     &   E	     U   F	     V   G	     '   H	     ,   �  
   -   I	              .      
   -   Z	           
   .   h	  
   -   p	           
   .   y	      W           X           Y                      Z          [   �	     \   �	     ]     HB   ^     $B   _          `      �
      �	     ;   �	     <   �	        �	                 =          >   �	      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �	      E          F   C      G         H          I          J          K           L          M   �	     N   �	     O   �	     %   �	     P   �	     Q   �	     R   �	     S   �	     T   �	     &   �	     U   �	     V   �	     '   �	     ,   �  
   -   �	              .      
   -   �	           
   .   �	  
   -   
           
   .   
      W           X           Y                      Z          [   
     \   
     ]      B   ^     0B   _          `      �
      
     ;   !
     <   >
        R
                 =          >   [
      ?                   @           A           B           C           D            �                                      !          "           #          $       
      \
      E          F   C      G         H          I          J          K           L          M   `
     N   a
     O   b
     %   c
     P   d
     Q   e
     R   f
     S   g
     T   h
     &   i
     U   j
     V   k
     '   l
     ,   �  
   -   m
              .      
   -   ~
           
   .   �
  
   -   �
           
   .   �
      W           X           Y                      Z          [   �
     \   �
     ]     �A   ^     HB   _          `      �
      �
     ;   �
     <   �
        �
                 =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   L      G         H          I          J          K           L          M   
     N        O        %        P        Q        R        S        T        &        U        V        '        ,   �  
   -              
   .   %  
   -   1              .      
   -   B           
   .   K  
   -   S              .     @?
   -   _              .     @?
   -   g              .     �@
   -   o              .      ?
   -   |              .     @@    W           X           Y                      Z          [   �     \   �     ]      B   ^     $B   _          `      �
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .   
  
   -                 .      
   -   '           
   .   0  
   -   8              .     @?
   -   D              .     @?
   -   L              .     @@
   -   T              .     �>
   -   a              .     �?    W           X           Y                      Z          [   n     \   o     ]     HB   ^     B   _          `      �
      p     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .   �  
   -   �              .      
   -              
   .     
   -                 .     @?
   -   )              .     @?
   -   1              .     �@
   -   9              .     �?
   -   F              .     �@    W           X           Y                      Z          [   S     \   T     ]     �A   ^     B   _          `      �
      U     ;   k     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,      
   -   �           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -                 .     @?
   -                 .     @?
   -                 .     �@
   -                 .      ?
   -   +              .     @@    W           X           Y                      Z          [   8     \   9     ]     �A   ^     0B   _          `      �
      :     ;   N     <   t        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   D  
   -   �           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     �A   ^     B   _          `      �
      �     ;        <   9        M                 =          >   X      ?                   @           A           B           C           D            �                                      !          "           #          $       
      Y      E          F   L      G         H          I          J          K           L          M   ]     N   ^     O   _     %   `     P   a     Q   b     R   c     S   d     T   e     &   f     U   g     V   h     '   i     ,   `  
   -   j           
   .   x  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     �A   ^     B   _          `      �
      �     ;   �     <   �                         =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   L      G         H          I          J          K           L          M   "     N   #     O   $     %   %     P   &     Q   '     R   (     S   )     T   *     &   +     U   ,     V   -     '   .     ,   |  
   -   /           
   .   =  
   -   I              .      
   -   Z           
   .   c  
   -   k              .     @?
   -   w              .     @?
   -                 .     �@    W           X           Y                      Z          [   �     \   �     ]     �A   ^     B   _          `      �
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .     
   -                 .      
   -              
   .   (  
   -   0              .     @?
   -   <              .     @?
   -   D              .     �@    W           X           Y                      Z          [   L     \   M     ]     �A   ^     $B   _          `      �
      N     ;   b     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -                 .     @?
   -   	              .     �@    W           X           Y                      Z          [        \        ]     �A   ^     *B   _          `      �
           ;   '     <   M        a                 =          >   l      ?                   @           A           B           C           D            �                                      !          "           #          $       
      m      E          F   L      G         H          I          J          K           L          M   q     N   r     O   s     %   t     P   u     Q   v     R   w     S   x     T   y     &   z     U   {     V   |     '   }     ,   �  
   -   ~           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     �A   ^     6B   _          `      �
      �     ;   �     <           &                 =          >   1      ?                   @           A           B           C           D            �                                      !          "           #          $       
      2      E          F   L      G         H          I          J          K           L          M   6     N   7     O   8     %   9     P   :     Q   ;     R   <     S   =     T   >     &   ?     U   @     V   A     '   B     ,   �  
   -   C           
   .   Q  
   -   ]              .      
   -   n           
   .   w  
   -                 .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     �A   ^     <B   _          `      �
      �     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q         R        S        T        &        U        V        '        ,     
   -              
   .     
   -   "              .      
   -   3           
   .   <  
   -   D              .     @?
   -   P              .     @?
   -   X              .     �@    W           X           Y                      Z          [   `     \   a     ]     �A   ^     BB   _          `      �
      b     ;   v     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   $  
   -   �           
   .   �  
   -   �              .      
   -   �           
   .     
   -   	              .     @?
   -                 .     @?
   -                 .     �@    W           X           Y                      Z          [   %     \   &     ]      B   ^     B   _          `      �
      '     ;   ;     <   a        u                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   @  
   -   �           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]      B   ^     B   _          `      �
      �     ;         <   &        :                 =          >   E      ?                   @           A           B           C           D            �                                      !          "           #          $       
      F      E          F   L      G         H          I          J          K           L          M   J     N   K     O   L     %   M     P   N     Q   O     R   P     S   Q     T   R     &   S     U   T     V   U     '   V     ,   \  
   -   W           
   .   e  
   -   q              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]      B   ^     B   _          `      �
      �     ;   �     <   �        �                 =          >   
      ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   L      G         H          I          J          K           L          M        N        O        %        P        Q        R        S        T        &        U        V        '        ,   x  
   -              
   .   *  
   -   6              .      
   -   G           
   .   P  
   -   X              .     @?
   -   d              .     @?
   -   l              .     �@    W           X           Y                      Z          [   t     \   u     ]      B   ^     B   _          `      �
      v     ;   �     <   �        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .   �  
   -   �              .      
   -              
   .     
   -                 .     @?
   -   )              .     @?
   -   1              .     �@    W           X           Y                      Z          [   9     \   :     ]      B   ^     *B   _          `      �
      ;     ;   O     <   u        �                 =          >   �      ?                   @           A           B           C           D            �                                      !          "           #          $       
      �      E          F   L      G         H          I          J          K           L          M   �     N   �     O   �     %   �     P   �     Q   �     R   �     S   �     T   �     &   �     U   �     V   �     '   �     ,   �  
   -   �           
   .   �  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     HB   ^     B   _          `      �
            ;        <   :        N                 =          >   Y      ?                   @           A           B           C           D            �                                      !          "           #          $       
      Z      E          F   L      G         H          I          J          K           L          M   ^     N   _     O   `     %   a     P   b     Q   c     R   d     S   e     T   f     &   g     U   h     V   i     '   j     ,   �  
   -   k           
   .   y  
   -   �              .      
   -   �           
   .   �  
   -   �              .     @?
   -   �              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     HB   ^     B   _          `      �
      �     ;   �     <   �                         =          >         ?                   @           A           B           C           D            �                                      !          "           #          $       
            E          F   L      G         H          I          J          K           L          M   #     N   $     O   %     %   &     P   '     Q   (     R   )     S   *     T   +     &   ,     U   -     V   .     '   /     ,   �  
   -   0           
   .   >  
   -   J              .      
   -   [           
   .   d  
   -   l              .     @?
   -   x              .     @?
   -   �              .     �@    W           X           Y                      Z          [   �     \   �     ]     HB   ^     B   _          `      �AreaProperties  AmbientSndDay   AmbientSndNight AmbientSndDayVolAmbientSndNitVolEnvAudio        MusicBattle     MusicDay        MusicNight      MusicDelay      Creature List   Door List       Encounter List  List            SoundList       StoreList       TriggerList     Tag             TemplateResRef  LocalizedName   AutoRemoveKey   Faction         Cursor          HighlightHeight KeyName         LinkedTo        LinkedToFlags   LoadScreenID    PortraitId      Type            TrapDetectable  TrapDetectDC    TrapDisarmable  DisarmDC        TrapFlag        TrapOneShot     TrapType        OnDisarm        OnTrapTriggered OnClick         ScriptHeartbeat ScriptOnEnter   ScriptOnExit    ScriptUserDefineVarTable        Name            Value           XPosition       YPosition       ZPosition       XOrientation    YOrientation    ZOrientation    Geometry        PointX          PointY          PointZ          WaypointList    Placeable List  LocName         Description     CloseLockDC     Conversation    Interruptable   Plot            KeyRequired     Lockable        Locked          OpenLockDC      AnimationState  Appearance      HP              CurrentHP       Hardness        Fort            Ref             Will            OnClosed        OnDamaged       OnDeath         OnHeartbeat     OnLock          OnMeleeAttacked OnOpen          OnSpellCastAt   OnUnlock        OnUserDefined   HasInventory    BodyBag         Static          Useable         OnInvDisturbed  OnUsed          X               Y               Z               Bearing            puzzle_camerapuzzle_camera   �9            Puzzle Camera            cmd_cam_switch     cam_type   puzzle   topdown_cameratopdown_camera   �9            Topdown Camera            cmd_cam_switch     cam_type   topdown   m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Note%   �E           Mushroom - Note, Blue   �H            m_note_blue                     can_be_pulsed
   pulse_type   note   color   blue_l   time   sound   note_B_above     m_Double!   �E           Mushroom - Double   �H            m_double                     can_be_pulsed
   pulse_type   double   color   green     Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                       Echo_Platform   �           Echo Platform   "            ech_platform                    	   Echo_Gong   M         	   Echo Gong   89             ech_gong                     can_be_pulsed
   pulse_type   gong   color   red  	   Echo_Gong   M         	   Echo Gong   89             ech_gong                     can_be_pulsed
   pulse_type   gong   color   red  	   Echo_Gong   M         	   Echo Gong   89             ech_gong                     can_be_pulsed
   pulse_type   gong   color   red     Echo_Pedestal_Vary$   V            Echo Pedestal - Vary   Y9             ech_ped_vary                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time	   time_glow	   time_next     Echo_Pedestal_Vary$   V            Echo Pedestal - Vary   Y9             ech_ped_vary                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time	   time_glow	   time_next     Echo_Pedestal_Vary$   V            Echo Pedestal - Vary   Y9             ech_ped_vary                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time	   time_glow	   time_next     Echo_Pedestal_Vary$   V            Echo Pedestal - Vary   Y9             ech_ped_vary                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time	   time_glow	   time_next     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time     Echo_Pedestal_On"   V            Echo Pedestal - On   Y9             
ech_ped_on                  
   pulse_type   pedestal   can_be_pulsed   color   cyan   cur_dist   dist   time      
                     u   v                           	                                                    !   "   #   $   %   &   '   (   )   *   +   ,   0   1   2   3   4   5   6   -   .   /   7   8   9   :   ;   <   =   >   ?   @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   b   c   d   e   f   g   h   _   `   a   i   j   k   l   m   n   o   p   q   r   s   t   w   x   y   z   {   |   }   ~      �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �   �              �   �   �   �   �   �   �   �   �   �   �   �   �   �   �           	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  A  B  C  D  E  F  G  H  I  J  K  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  �  �  �  �  �  �  �  �  �  �  �  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                           	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                                               !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  @  A  B  C  D  E  F  G  H  I  J  7  8  9  :  ;  <  =  >  ?  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  �  �  �  �  �  �  �  �  �  �  �  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                        �  �  �  �  �  �                     	  
                         !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  b  c  d  e  f  g  h  i  j  k  l  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                	  
      �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                                                !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  L  M  N  O  P  Q  R  S  T  U  V  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  W  X  Y  Z  [  \  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �                     	  
                            *  +  ,  -  .  /  0  1  2  3  4                     !  "  #  $  %  &  '  (  )  5  6  7  8  9  :  ;  <  =  >  ?  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  [  \  ]  ^  _  `  a  t  u  v  w  x  y  z  {  |  }  ~  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �    	  
                  �  �  �  �  �  �  �  �  �  �                                                !  "  #  $  %  &  '  (  )  *  +  ,  -  .  /  0  1  2  3  4  5  6  7  8  9  :  ;  <  =  >  ?  R  S  T  U  V  W  X  Y  Z  [  \  @  A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  ]  ^  _  `  a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  {  |  }  ~    �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �   	  	  	  	  	  	  	  	  	  		  
	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  0	  1	  2	  3	  4	  5	  6	  7	  8	  9	  :	  	  	   	  !	  "	  #	  $	  %	  &	  '	  (	  )	  *	  +	  ,	  -	  .	  /	  ;	  <	  =	  >	  ?	  @	  A	  B	  C	  D	  E	  F	  G	  H	  I	  J	  K	  L	  M	  N	  O	  P	  Q	  R	  S	  T	  U	  V	  W	  X	  Y	  Z	  [	  \	  ]	  ^	  _	  `	  a	  b	  c	  d	  e	  f	  g	  z	  {	  |	  }	  ~	  	  �	  �	  �	  �	  �	  h	  i	  j	  k	  l	  m	  n	  o	  p	  q	  r	  s	  t	  u	  v	  w	  x	  y	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  
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
  �	  �	  �	  �	   
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
                                                           	      
                &                &   ,   0   1   2   3   4   5   6   7   8   9   =   A   E   N   W   `   i   p   w   ~   �   �   �   �   �   �   �   �   �   �   �   �                                                            !   "   #   $   %      '   (   )   *   +      -   .   /      :   ;   <      >   ?   @      B   C   D      F   G   H   I   J   K   L   M      O   P   Q   R   S   T   U   V      X   Y   Z   [   \   ]   ^   _      a   b   c   d   e   f   g   h      j   k   l   m   n   o      q   r   s   t   u   v      x   y   z   {   |   }         �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �      �   �   �   �   �   �   ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                       �                                                       !                  "                  #                  $            MAIN            STRREF          ID              LIST                                    	   
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

    if (color == "blue") value = VFX_DUR_LIGHT_BLUE_15;
    else if (color == "blue_d") value = VFX_DUR_LIGHT_BLUE_15;
    else if (color == "blue_l") value = VFX_DUR_LIGHT_BLUE_15;
    else if (color == "cyan") value = VFX_DUR_LIGHT_BLUE_15;      // No cyan.

    else if (color == "green") value = VFX_DUR_LIGHT_GREY_15;     // Is actually
    else if (color == "green_d") value = VFX_DUR_LIGHT_GREY_15;   // green, NWN
    else if (color == "green_l") value = VFX_DUR_LIGHT_GREY_15;   // is just dumb.

    else if (color == "brown") value = VFX_DUR_LIGHT_ORANGE_15;   // No brown.
    else if (color == "orange") value = VFX_DUR_LIGHT_ORANGE_15;

    else if (color == "magenta") value = VFX_DUR_LIGHT_PURPLE_15; // No magenta.
    else if (color == "purple") value = VFX_DUR_LIGHT_PURPLE_15;

    else if (color == "red") value = VFX_DUR_LIGHT_RED_15;
    else if (color == "red_d") value = VFX_DUR_LIGHT_RED_15;
    else if (color == "red_l") value = VFX_DUR_LIGHT_RED_15;

    else if (color == "white") value = VFX_DUR_LIGHT_WHITE_15;

    else if (color == "yellow") value = VFX_DUR_LIGHT_YELLOW_15;
    else if (color == "yellow_d") value = VFX_DUR_LIGHT_YELLOW_15;
    else if (color == "yellow_l") value = VFX_DUR_LIGHT_YELLOW_15;

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
// Script containing supporting functions for repeated procedures.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"

void RemoveCooldown()
{
    SetLocalInt(OBJECT_SELF, "in_cooldown", FALSE);
}

void ApplyLightAndGlowEffectIfUnlit(string color)
{
    if (!GetLocalInt(OBJECT_SELF, "lit")) {
        // Get and apply permanent lighting effects.
        effect glowEffect = GetGlowEffect(color);
        effect lightEffect = GetLightEffect(color);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, glowEffect, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, lightEffect, OBJECT_SELF);

        // Set flag on object that it is lit up now.
        SetLocalInt(OBJECT_SELF, "lit", TRUE);
    }
}

void RemoveAllVisualEffects()
{
    effect eLoop = GetFirstEffect(OBJECT_SELF);

    while (GetIsEffectValid(eLoop)) {
        if (GetEffectType(eLoop) == EFFECT_TYPE_VISUALEFFECT) {
            RemoveEffect(OBJECT_SELF, eLoop);
        }
        eLoop = GetNextEffect(OBJECT_SELF);
    }
}

void RemoveAllEffects()
{
    effect eLoop = GetFirstEffect(OBJECT_SELF);

    while (GetIsEffectValid(eLoop)) {
        RemoveEffect(OBJECT_SELF, eLoop);
        eLoop = GetNextEffect(OBJECT_SELF);
    }
}

// Emit mini-pulses on a set interval until the max to emit has been reached.
void MiniPulse(int pulseEffect, float pulse_time, float height, int counter, int max)
{
    if (counter < max) {
        TLVFXPillar(pulseEffect, GetLocation(OBJECT_SELF), 1, 0.1, height, 0.0);
        counter += 1;
        DelayCommand(pulse_time, MiniPulse(pulseEffect, pulse_time, height, counter, max));
    }
}

// Based on the time the calling object stays on, and a set interval time,
// a max number of mini-pulses to emit over the time is calculated.
void SetupMiniPulse(string color, float time, float height)
{
    float pulse_time = 1.0;

    int pulseEffect = GetPulseEffectSmall(color);
    int counter = 0;
    int max = FloatToInt(time / pulse_time);

    DelayCommand(pulse_time, MiniPulse(pulseEffect, pulse_time, height, counter, max));
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
                                                                            ITP V3.28        '   �     P  _   �  �   G  \   ����                                                               ,          4          @          H          P          X          `          h          p          x          �          �          �                       :                  �                  �#                                                       0   
                         !                  8   
               0   
      >         P         "                  #                  $                  �        D         ��                  �                  �                  �                  ��            MAIN            STRREF          ID              LIST            NAME            RESREF             Log 1 Triggerlog_1_trigger   Puzzle Camerapuzzle_camera   Topdown Cameratopdown_camera                        	   
                                                                      !   "   #   $   %   &                              
                     	                     NCS V1.0B  �      ?   ����  ����*     +  ����       ]����  ��������    "   �����   �����  ��������  scannableObject#    � initialized����   3"    � blue_l   }����  ����    ���� ����      �����    B    initialized����   7 ����       �- ����  audioLog#    f initialized����   3"    <����    �    initialized����   7       a- ����  Echo_Pedestal_On#����     ����     ����  	Echo_Gong#     � initialized����   3"    � color����   5����  ��������    �����  ��������   q����  ����    ���� ����      �    initialized����   7 ����       ,- ����  Echo_Pedestal_Vary#    initialized����   3"    � color����   5����  ���� 	time_glow����   4����  ���� 	time_next����   4����  ����   ���� ���� ���� ����    �    initialized����   7 ����             ^����  ���� ���� ���	 ����  ����  blue#       &����  ����   �- ����  blue_d#       2����  ����   c- ����  blue_l#       3����  ����   -- ����  brown#       +����  ����   �- ����  cyan#       -����  ����   �- ����  green#       %����  ����   �- ����  green_d#       .����  ����   X- ����  green_l#       /����  ����   !- ����  magenta#       '����  ����   �- ����  orange#       *����  ����   �- ����  purple#       ,����  ����   ~- ����  red#       $����  ����   K- ����  red_d#       0����  ����   - ����  red_l#       1����  ����    �- ����  white#       )����  ����    �- ����  yellow#       (����  ����    v- ����  yellow_d#       4����  ����    >- ����  yellow_l#       5����  ����        ����   �����  ����     ���� ���� ����          =���   ����   �  �    9,          ����  ����  ?�     ����  ����   �����  �������� ����  �������� !   ���� !����  ����    ����  �������� ����         ���� ����   �  �����  ��������     !    a,      8    4    ����     ����   �      �  ���� ���� &      4-     ����     ����   �      ����� !   ���� !����  �������� $���� ���� ���� ���� ����   playing����   3����  ���� red ��������  �������� "    ~@   ����  ����?@  ���� !���� ����      �    '���� =���   ����   �  � ����   - ?������  ���� play_attempt����   3����  ��������             ����         A    ���� ����      �   ����  ����    ����         ?    '���� =���   ����   �  � ����     ����,          ����  ���  ����    ���� ����  ����     ]    can_be_pulsed����   7,          ����     �  ����       ����  ���f����  �������� ���� ����      �,          6���� ���� ���� ���� ����  ���   ����    ���� ����       can_be_pulsed����   7 ����  // Finds all objects in an area that must have permanent effects initialized
// to them, and initiates said effects.

// For TLVFXPillar(int, location, int, float, float, float)
#include "x2_inc_toollib"

#include "support_color"

// The height at which pulses are initiated from objects.
float height = 0.5;

void ScannableObject(object oScan);
void AudioLog(object oLog);
void BlinkGlow(object oGlow, float time_glow, float time_next, string color, int disable);
void Disable(object oGlow);

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
                effect glowEffect = GetGlowEffect("blue_l");
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, glowEffect, oLoop);
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

        else if (object_tag == "Echo_Pedestal_On" || object_tag == "Echo_Gong") {
            if (!GetLocalInt(oLoop, "initialized")) {
                string color = GetLocalString(oLoop, "color");
                effect glowEffect = GetGlowEffect(color);

                // Made supernatural to distinguish between possible
                // multiple effects later.
                glowEffect = SupernaturalEffect(glowEffect);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, glowEffect, oLoop);
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

        oLoop = GetNextObjectInArea();
    }
}

// Indefinitely emit a pulse from a scannable object every set amount of time.
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
    effect glowEffect = GetGlowEffect("red");

    // The "off" state.
    if (!playing) {
        time = 2.0;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, glowEffect, oLog, 0.75 * time);
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
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, glowEffect, oLog);
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
void BlinkGlow(object oGlow, float time_glow, float time_next, string color, int disable)
{
    // Will enable object to be pulseable only for duration of glow.
    if (disable) {
        SetLocalInt(oGlow, "can_be_pulsed", TRUE);
        DelayCommand(time_glow, Disable(oGlow));
    }

    effect glowEffect = GetGlowEffect(color);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, glowEffect, oGlow, time_glow);

    DelayCommand(time_next, BlinkGlow(oGlow, time_glow, time_next, color, disable));
}

// Set an object to be unpulseable.
void Disable(object oGlow)
{
    SetLocalInt(oGlow, "can_be_pulsed", FALSE);
}
NCS V1.0B  W            U����  ��������   X    _����   �   J     %����       W    +          V����  ���� ����,                 A      ����   hit_f1      3����  ��������         S        Hit F1 to pulse ,            ����  @          ����  // Remove the freeze effect from the player and let them move again.

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

    DelayCommand(8.0, PromptAgain());
}

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
NCS V1.0B  f         ����  ��������   �"     ����   c    ,           #����  
enter_area          ,           *     pulse_ready����   7  =���  ,           %     hit_f1����   7  >L��   � ����  ����    ���� ����      �,           *    pulse_ready����   7  @��  ,           ����       @      ����   hit_f1����   3����  �������� "    2   ����  Hit F1 to pulse     ����      ����    =    ,           ����  ���e  @      ���� ����  // Custom script for OnClientEnter under:
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

    DelayCommand(2.45, SetLocalInt(oPC, "pulse_ready", TRUE));
    DelayCommand(2.50, HitF1Prompt(oPC));
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
ITP V3.28      �      L     �      �  8   �  $   ����                                                               (          0                                                            !                  "                  #                  $                  �            MAIN            STRREF          LIST            ID                                      	   
                                          UTS V3.28      P      �     (  K   s  d   �     ����                 
                          /                                                                       	     �?   
      A        �?                                                                                       $                              <             
      G   Tag             LocName         TemplateResRef  Active          Continuous      Looping         Positional      RandomPosition  Random          Elevation       MaxDistance     MinDistance     RandomRangeX    RandomRangeY    Interval        IntervalVrtn    PitchVariation  Priority        Hours           Times           Volume          VolumeVrtn      Sounds          Sound           PaletteID       Comment            WeatherRain   ����          Weather Rainweather_rain
rain_sound                                	   
                                                   