pragma SPARK_Mode;
with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;

package Flight_Control is
   procedure SetTakeOff(Aircraft : in out Aircraft_Stats)
   with
       Global => (In_Out => (Standard_Output)),
      Pre => Aircraft.FuelLevel >=500 and
            Aircraft.FlyStatus = Landed and
            Aircraft.Door = Closed and
            Aircraft.Engine = On,
      Post => Aircraft.FlyStatus = Takeoff and
       Aircraft.Airspeed = 300,
         Depends => (Aircraft => Aircraft, Standard_Output => (Standard_Output,Aircraft));
   procedure SetFlying(Aircraft : in out Aircraft_Stats)
   with
       Global => (In_Out => (Standard_Output)),
      Pre => Aircraft.FlyStatus = Takeoff and
            Aircraft.Airspeed >= 500 and
            Aircraft.AirAltitude >= 5000,
       Post => Aircraft.FlyStatus = Flying,
       Depends => (Aircraft => Aircraft, Standard_Output => (Aircraft,Standard_Output));

   procedure SetLanding(Aircraft : in out Aircraft_Stats)
   with
       Global => (In_Out => (Standard_Output)),
      Pre => Aircraft.FlyStatus = Flying and
           Aircraft.AirAltitude <= 2000 and
            Aircraft.AirSpeed <= 300 ,
      Post => Aircraft.FlyStatus = Landing and
       Aircraft.AirSpeed = 150,
       Depends => (Aircraft => Aircraft, Standard_Output => (Aircraft, Standard_Output));

   procedure SetLanded(Aircraft : in out Aircraft_Stats)
     with
      Global => (In_Out => (Standard_Output)),
      Pre => Aircraft.FlyStatus =Landing and
            Aircraft.AirSpeed = 0 and
            Aircraft.AirAltitude = 0 ,
       Post => Aircraft.FlyStatus = Landed,
       Depends => (Aircraft => Aircraft, Standard_Output => (Standard_Output,Aircraft));

end Flight_Control;
