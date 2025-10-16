with Aircraft_Types;
package Aircraft_Status is
   use Aircraft_Types;


   -- procedures to manage flystatus
   procedure Set_FlyStatus(Aircraft : in out Aircraft_Stats; New_Status: in FlyStatus_Type)
      with
         Pre => (New_Status in FlyStatus_Type),
         Post => Aircraft.FlyStatus = New_Status;
   function Get_FlyStatus(Aircraft : Aircraft_Stats) return FlyStatus_Type;

   -- procedures to manage Door
   procedure Set_Door(Aircraft : in out Aircraft_Stats; New_Status: in Door_Type)
      with
         Pre => (New_Status in Door_Type),
         Post => Aircraft.Door = New_Status;
   function Get_Door(Aircraft : Aircraft_Stats) return Door_Type;

   -- procedures to manage Engine
   procedure Set_Engine(Aircraft : in out Aircraft_Stats; New_Status: in Engine_Type)
      with
         Pre => (New_Status in Engine_Type),
         Post =>Aircraft.Engine = New_Status;
   function Get_Engine(Aircraft : Aircraft_Stats) return Engine_Type
     with
   Post => Get_Engine'Result = Aircraft.Engine;

   -- procedures to manage AirSpeed
   procedure Set_AirSpeed(Aircraft : in out Aircraft_Stats; New_Speed: in SpeedRange)
      with

         Post =>Aircraft.AirSpeed = New_Speed;
   function Get_AirSpeed(Aircraft : Aircraft_Stats) return SpeedRange
     with
       Post => Get_AirSpeed'Result = Aircraft.AirSpeed;

   --procedures to manage AirAltitude
   procedure Set_AirAltitude(Aircraft : in out Aircraft_Stats; New_Altitude: in AltitudeRange)
      with

         Post => Aircraft.AirAltitude = New_Altitude;
   function Get_AirAltitude(Aircraft : Aircraft_Stats) return AltitudeRange
     with
       Post => (Get_AirAltitude'Result = Aircraft.AirAltitude);

   --procedures to manage FuelLevel
   procedure Set_FuelLevel(Aircraft : in out Aircraft_Stats; New_FuelLevel: in FuelRange)
      with

         Post => Aircraft.FuelLevel = New_FuelLevel;
   function Get_FuelLevel(Aircraft : Aircraft_Stats) return FuelRange
     with
       Post => (Get_FuelLevel'Result = Aircraft.FuelLevel);


end Aircraft_Status;
