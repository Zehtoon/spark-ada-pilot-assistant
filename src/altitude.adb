pragma SPARK_Mode;
with Aircraft_Status;
with AS_Io_Wrapper; use AS_Io_Wrapper;
package body altitude is
   --procedure to increase altitude
   procedure IncreaseAltitude(Aircraft : in out Aircraft_Stats;New_Altitude: In AltitudeRange) is
   Current_Altitude: constant AltitudeRange := Aircraft_Status.Get_AirAltitude(Aircraft);
   begin

      --AS_Init_Standard_Output;
      if Aircraft.Engine = On then

         if New_Altitude >= Current_Altitude then
            Aircraft_Status.Set_AirAltitude(Aircraft, New_Altitude);
         else
            --Aircraft_Status.Set_AirAltitude(Aircraft, Current_Altitude);
            AS_Put_Line("cannot change the altitude");
         end if;
      else
         Aircraft_Status.Set_AirAltitude(Aircraft, Current_Altitude);
        AS_Put_Line("The Aircraft must be on");

      end if;


   end IncreaseAltitude;

   procedure DecreaseAltitude(Aircraft : in out Aircraft_Stats;New_Altitude: In AltitudeRange) is
   Current_Altitude:constant AltitudeRange := aircraft_Status.Get_AirAltitude(Aircraft);
   begin
      --AS_Init_Standard_Output;
      if Aircraft.Engine = On then

         if New_Altitude <= Current_Altitude  then
            Aircraft_Status.Set_AirAltitude(Aircraft, New_Altitude);
         else
            --Aircraft_Status.Set_AirAltitude(Aircraft, Current_Altitude);
            AS_Put_Line("cannot change the altitude");
         end if;
      else
         AS_Put_Line("The Aircraft must be on");
      end if;



   end DecreaseAltitude;
end altitude;
