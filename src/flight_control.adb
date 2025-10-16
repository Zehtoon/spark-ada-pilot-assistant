pragma SPARK_Mode;
with AS_Io_Wrapper; use AS_Io_Wrapper;

package body flight_control is
   procedure SetTakeOff(Aircraft : in out Aircraft_Stats) is
   begin
      --AS_Init_Standard_Output;
      if Aircraft.FuelLevel < 500 then
         AS_Put_Line("Insufficient fuel for takeoff. Please refuel");
         return;
      elsif Aircraft.FlyStatus /= Landed then
         AS_Put_Line("Aircraft must be in Landed mode for takeoff");
         return;
      elsif Aircraft.Door /= Closed then
         AS_Put_Line("Doors must be closed for takeoff");
         return;
      elsif Aircraft.Engine /= on then
         AS_Put_Line("Engine must be on for takeoff");
         return;
      end if;
      -- Transitioning to the desired mode
      Aircraft.FlyStatus := Takeoff;
      Aircraft.AirSpeed := 300;
      AS_Put_Line("Aircraft is now in takeoff mode.");

   end SetTakeOff;

   procedure SetFlying(Aircraft : in out Aircraft_Stats) is
   begin
      --AS_Init_Standard_Output;
      if Aircraft.FlyStatus /= TakeOff then
         AS_Put_Line("Aircraft must be in takeoff mode to transition to Flying mode.");
         return;
      elsif Aircraft.AirAltitude < 5000 then
         AS_Put_Line("Aircraft altitude must be at least 5000 meters for Flying mode.");
         return;
      elsif Aircraft.AirSpeed < 500 then
         AS_Put_Line("Aircraft speed must be at least 500 km/h for Flying mode.");
         return;
      end if;
      Aircraft.FlyStatus := Flying;
      AS_Put_Line("Aircraft is now in Flying mode.");
   end SetFlying;

   procedure SetLanding(Aircraft : in out Aircraft_Stats) is
   begin
      --AS_Init_Standard_Output;
      if Aircraft.FlyStatus /= Flying then
         AS_Put_Line("Aircraft must be in Flying mode to initiate landing.");
         return;
      elsif Aircraft.AirAltitude > 2000 then
         AS_Put_Line("Aircraft altitude must be below 2000 meters to start landing");
         return;
      elsif Aircraft.AirSpeed > 300 then
         AS_Put_Line("Aircraft speed must be below 300 km/h to start landing");
         return;
      end if;
      Aircraft.FlyStatus := Landing;
      Aircraft.AirSpeed := 150; --Reducing the speed
      AS_Put_Line("Aircraft is now in Landing mode.");
   end SetLanding;

   procedure SetLanded(Aircraft : in out Aircraft_Stats) is
   begin
      --AS_Init_Standard_Output;
      if Aircraft.FlyStatus /= Landing then
         AS_Put_Line("Aircraft must be in Landing mode to transition to landed.");
         return;
      elsif Aircraft.AirAltitude /= 0 then
         AS_Put_Line("Aircraft altitude must be 0 meters to switch to landed.");
         return;
      elsif Aircraft.AirSpeed /= 0 then
         AS_Put_Line("Aircraft speed must be 0 to transition to landed");
         return;
      end if;

      Aircraft.FlyStatus := Landed;
      AS_Put_Line("Aircraft is now in Landed mode.");

   end SetLanded;
end Flight_Control;








