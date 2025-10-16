pragma SPARK_Mode;
with AS_Io_Wrapper; use AS_Io_Wrapper;

package body DisplayStats is
   procedure DisplayStats(Aircraft: in  Aircraft_Stats) is
   begin

      AS_Put_Line("Current Stats of the aircraft");
      AS_Put_Line("FuelLevel: " & Integer'Image(Aircraft.FuelLevel));
      AS_Put_Line("AirSpeed: " & Integer'Image(Aircraft.AirSpeed));
      AS_Put_Line("AirAltitude: " & Integer'Image(Aircraft.AirAltitude));
      AS_Put_Line("FlyStatus: " & FlyStatus_Type'Image(Aircraft.FlyStatus));
      AS_Put_Line("Door: " & Door_Type'Image(Aircraft.Door));
      AS_Put_Line("Engine: " & Engine_Type'Image(Aircraft.Engine));
      AS_Put_Line("Location: London Heathrow Airport");
      --AS_Put_Line("Destination:" & Destination'Image(Destinations(1)));
      AS_Put_Line("-------------------------------------------");

   end DisplayStats;
   procedure DisplayChoices is
   begin

      AS_Put_Line("Choose from the following options: ");
      AS_Put_Line("1. Fuel the aircraft");
      AS_Put_Line("2. Turn the engine on");
      AS_Put_Line("3. Turn the engine off");
      AS_Put_Line("4. Open doors");
      AS_Put_Line("5. Close doors");
      AS_Put_Line("6. Take off");
      AS_Put_Line("7. Board passengers");
      AS_Put_Line("8. Select a destination");
      AS_Put_Line("9. Increase Altitude");
      AS_Put_Line("10. Decrease Altitude");
      AS_Put_Line("11. Increase Speed");
      AS_Put_Line("12. Decrease Speed");
      AS_Put_Line("13. Set Fly Mode");
      AS_Put_Line("14. Set Landing mode");
   end DisplayChoices;
end DisplayStats;
