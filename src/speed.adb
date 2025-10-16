pragma SPARK_Mode;
with Aircraft_Status;

with AS_Io_Wrapper; use AS_Io_Wrapper;
package body speed is
   procedure IncreaseSpeed(Aircraft: in out Aircraft_Stats; New_Speed: In SpeedRange) is
   Current_speed: constant Integer := Aircraft_Status.Get_AirSpeed(Aircraft);
   begin

   --AS_Init_Standard_Output;
      if Aircraft.Engine = on then
         if Current_speed < New_Speed then
            --if Aircraft.FlyStatus = Takeoff and New_Speed > 200 then
              -- AS_Put_Line("Cannot increase speed more than 200km/h in takeoff mode");
            --elsif Aircraft.FlyStatus = Landing then
               --AS_Put_Line("Cannot increase speed when in Landing mode");
            --else
               Aircraft_Status.Set_AirSpeed(Aircraft, New_Speed);


         elsif Current_speed > New_Speed then
            AS_Put_Line("Current speed exceeds the desired speed.");
         end if;
      else
         AS_Put_Line("The aircraft must be on first!");
      end if;

   end IncreaseSpeed;

   procedure DecreaseSpeed(Aircraft: in out Aircraft_Stats; New_Speed: In SpeedRange) is
   Current_speed: constant SpeedRange := aircraft_Status.Get_AirSpeed(Aircraft);
   begin
      --AS_Init_Standard_Output;

      if Current_speed > New_Speed then
         Aircraft_Status.Set_AirSpeed(Aircraft, New_Speed);
      else
         AS_Put_Line ("Current speed is not above the desired speed.");
      end if;
   end DecreaseSpeed;
end Speed;
