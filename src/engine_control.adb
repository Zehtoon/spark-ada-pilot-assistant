pragma SPARK_Mode;
with AS_Io_Wrapper; use AS_Io_Wrapper;
with Aircraft_Status;

package body Engine_Control is
   procedure EngineOn(Aircraft : in out Aircraft_Stats) is
      Current_Status: constant Engine_Type := Aircraft_Status.Get_Engine(Aircraft);
   begin
      --AS_Init_Standard_Output;
      if Aircraft.FuelLevel > 0 then
         if Current_Status = Off then
            Aircraft_Status.Set_Engine(Aircraft, On);
            AS_Put_Line("Engine has been turned ON.");

         else
            AS_Put_Line("Engine is already ON.");
         end if;
      else
         AS_Put_Line("Not enought fuel to turn on the aircraft");
         --Aircraft_Status.Set_Engine(Aircraft, Off);
      end if;

   end EngineOn;

   procedure EngineOff(Aircraft: in out Aircraft_Stats) is
      Current_Status: constant Engine_Type := Aircraft_Status.Get_Engine(Aircraft);
   begin
      --AS_Init_Standard_Output;
      if Current_Status = off then
         AS_Put_Line("Engine is already OFF.");
      else
         Aircraft_Status.Set_Engine(Aircraft, off);
         AS_Put_Line("Engine has been turned OFF.");
      end if;
   end EngineOff;

   function FuelAircraft(Aircraft: Aircraft_Stats; fuel: in FuelRange) return FuelRange is
      Current_fuel: constant FuelRange := Aircraft_Status.Get_FuelLevel(Aircraft);
      New_Fuel_Level: FuelRange;
   begin
         if Current_fuel + fuel >= Max_Fuel then
            New_Fuel_Level := Max_Fuel;

         else
            New_Fuel_Level := Current_fuel + fuel;
      end if;

      return New_Fuel_Level;
   end FuelAircraft;

end Engine_Control;
