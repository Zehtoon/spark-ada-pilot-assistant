with AS_Io_Wrapper;use AS_Io_Wrapper;
with Aircraft_Status;
with Aircraft_Types;
with altitude;
with DisplayStats;
with Speed; use Speed;
with Engine_Control;
with Flight_Control;
with SelectDestination;

procedure ShowStats(Aircraft: out Aircraft_Stats) is
   --UserChoice: String(1..10) := (others => ' ');
   UserChoice_Int: Integer := 0;
   --Current_Door: Door_Type := Aircraft_Status.Get_Door(Aircraft);
   fuel: FuelRange := 0;
   fuel_input: Integer := 0;

   altitudeDesired:  AltitudeRange :=0;
   altitude_Input: Integer:= 0;
   speedDesired:  SpeedRange := 0;
   speed_Input: Integer:= 0;

begin
   --AS_Init_Standard_Input;
   --AS_Init_Standard_Output;
   AS_Put_Line("===========================================");
   AS_Put_Line("      Welcome to Pilot Assistant 1.0       ");
   AS_Put_Line("-------------------------------------------");
   DisplayStats.DisplayStats(Aircraft);
   DisplayStats.DisplayChoices;
   AS_Put_Line("Enter your choice(1-14, or 0 to exit): ");
   loop

      AS_Get(UserChoice_Int);

      if UserChoice_Int =0 then
         AS_Put_Line("Exiting the program. Goodbye!");
         exit;
      end if;
      --handle the user's choice
      case UserChoice_Int is
      when 1 =>

         AS_Put_Line("Enter the amount of fuel added (gallons): ");
         AS_Get(fuel_input);
         fuel:= FuelRange(fuel_input);

         Aircraft.FuelLevel := Engine_Control.FuelAircraft(Aircraft, fuel);
         delay 1.0;
      when 2 =>
         Engine_Control.EngineOn(Aircraft);
         delay 1.0;

      when 3 =>
         Engine_Control.EngineOff(Aircraft);
         delay 1.0;

      when 4 =>
         if Aircraft.FlyStatus = Landed then
            Aircraft_Status.Set_Door(Aircraft, Open);

         else
               AS_Put_Line("Aircraft is not Stationary, Can't open doors");
         end if;
         delay 1.0;
      when 5 =>
         Aircraft_Status.Set_Door(Aircraft, Closed);
         delay 1.0;
         AS_Put_Line("Doors have been Closed");

      when 6 =>
         Flight_Control.SetTakeOff(Aircraft);
         delay 1.0;

      when 7 =>
         AS_Put_Line("Boarding the passengers now");
      when 8 =>
         SelectDestination.SelectDestination(Aircraft);
         delay 1.0;
      when 9 =>
         AS_Put_Line("The desired altitude: ");
         AS_Get(altitude_Input);
         altitudeDesired := AltitudeRange(altitude_Input);
         altitude.IncreaseAltitude(Aircraft, altitudeDesired);
         delay 1.0;
      when 10 =>
         AS_Put_Line("The desired altitude: ");
         AS_Get(altitude_Input);
         altitudeDesired := AltitudeRange(altitude_Input);
         altitude.DecreaseAltitude(Aircraft, altitudeDesired);
         delay 1.0;
      when 11 =>
         AS_Put_Line("The desired speed: ");
         AS_Get(speed_Input);
         speedDesired:= SpeedRange(speed_Input);
         speed.IncreaseSpeed(Aircraft, speedDesired);
         delay 1.0;
      when 12 =>
         AS_Put_Line("The desired speed: ");
         AS_Get(speed_Input);
         speedDesired := SpeedRange(speed_Input);
         DecreaseSpeed(Aircraft, speedDesired);
         delay 1.0;
      when 13=>
         AS_Put_Line("Fly Mode successfuly activated");
         Flight_Control.SetFlying(Aircraft);
      when 14 =>
         AS_Put_Line("Landing mode successfully activated");
         Flight_Control.SetLanding(Aircraft);
      when others =>
         AS_Put_Line("Invalid choice, please select a valid option.");
      end case;
      AS_Put_Line("");
      AS_Put_Line("");
      DisplayStats.DisplayStats(Aircraft);
      AS_Put_Line("Enter your choice(1-14, or 0 to exit): ");
   end loop;

end ShowStats;
