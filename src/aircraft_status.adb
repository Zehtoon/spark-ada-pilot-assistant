package body Aircraft_Status is

   --Flystatus
   procedure Set_FlyStatus(Aircraft : in out Aircraft_Stats; New_Status: in FlyStatus_Type)is
   begin
      Aircraft.FlyStatus := New_Status;
   end Set_FlyStatus;

   function Get_FlyStatus(Aircraft :  Aircraft_Stats ) return FlyStatus_Type is
   begin
      return Aircraft.FlyStatus;
   end Get_FlyStatus;

   --Door
   procedure Set_Door(Aircraft : in out Aircraft_Stats; New_Status: in Door_Type) is
   begin

      Aircraft.Door := New_Status;
   end Set_Door;

   function Get_Door(Aircraft :  Aircraft_Stats ) return Door_Type is
   begin
      return Aircraft.Door;
   end Get_Door;

   --Engine
   procedure Set_Engine(Aircraft : in out Aircraft_Stats; New_Status: in Engine_Type) is
   begin
      Aircraft.Engine:= New_Status;
   end Set_Engine;

   function Get_Engine(Aircraft : Aircraft_Stats ) return Engine_Type is
   begin
      return Aircraft.Engine;
   end Get_Engine;

   --AirSpeed
   procedure Set_AirSpeed(Aircraft : in out Aircraft_Stats; New_Speed: in SpeedRange) is
   begin
      Aircraft.AirSpeed := New_Speed;
   end Set_AirSpeed;

   function Get_AirSpeed(Aircraft : Aircraft_Stats ) return SpeedRange is
   begin
      return Aircraft.AirSpeed;
   end Get_AirSpeed;

   --AirAltitude
   procedure Set_AirAltitude(Aircraft : in out Aircraft_Stats; New_Altitude: in AltitudeRange) is
   begin
      Aircraft.AirAltitude := New_Altitude;
   end Set_AirAltitude;

   function Get_AirAltitude(Aircraft : Aircraft_Stats ) return AltitudeRange is
   begin
      return Aircraft.AirAltitude;
   end Get_AirAltitude;

   --FuelLevel
   procedure Set_FuelLevel(Aircraft : in out Aircraft_Stats; New_FuelLevel: in FuelRange) is
   begin
      Aircraft.FuelLevel := New_FuelLevel;
   end;

   function Get_FuelLevel(Aircraft : Aircraft_Stats) return FuelRange is
   begin
      return Aircraft.FuelLevel;
   end Get_FuelLevel;
end Aircraft_Status;
