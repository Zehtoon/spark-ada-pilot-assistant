package Aircraft_Types is
   type FlyStatus_Type is (Takeoff, Flying, Landing, Landed);
   type Door_Type is (Open, Closed);
   type Engine_Type is (On, Off);
   Max_Fuel : constant Integer := 18000;
   Max_Speed: constant Integer := 900;
   Max_Altitude: constant Integer:= 12000;
   subtype FuelRange is Integer range 0..Max_Fuel;
   subtype SpeedRange is Integer range 0..Max_Speed;
   subtype AltitudeRange is Integer range 0..Max_Altitude;


   type Aircraft_Stats is record
      FuelLevel: FuelRange := 0;
      AirSpeed: SpeedRange := 0;
      AirAltitude: AltitudeRange := 0;
      FlyStatus: FlyStatus_Type := Landed;
      Door: Door_Type := Closed;
      Engine: Engine_Type := Off;
      --FDestination: Destination:= Destinations(1);
   end record;
end Aircraft_Types;
