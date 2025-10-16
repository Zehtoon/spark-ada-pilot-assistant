pragma SPARK_Mode;
with SPARK.Text_IO; use SPARK.Text_IO;
with Aircraft_Types; use Aircraft_Types;

package altitude is
   procedure IncreaseAltitude(Aircraft : in out Aircraft_Stats; New_Altitude: In AltitudeRange)
     with
       Global => (In_Out => (Standard_Output)),
       Post => (if Aircraft'Old.Engine = On then
                  (if Aircraft.AirAltitude'Old <= New_Altitude then
                    Aircraft.AirAltitude= New_Altitude
                      else Aircraft.AirAltitude = Aircraft'Old.AirAltitude)
              else
                    Aircraft.AirAltitude = Aircraft'Old.AirAltitude
               ),
       Depends => (Aircraft =>(Aircraft, New_Altitude), (Standard_Output) =>(Aircraft, New_Altitude, Standard_Output)) ;

   procedure DecreaseAltitude(Aircraft : in out Aircraft_Stats; New_Altitude: In AltitudeRange)
     with
       Global => (In_Out =>(Standard_Output)),
       Post => (if Aircraft'Old.Engine = On then
                  (if Aircraft'Old.AirAltitude >= New_Altitude then
                Aircraft.AirAltitude = New_Altitude
                  else
                             Aircraft.AirAltitude = Aircraft'Old.AirAltitude)
                    else
                      Aircraft.AirAltitude = Aircraft'Old.AirAltitude),
       Depends => (Aircraft =>(Aircraft, New_Altitude), (Standard_Output) => (Aircraft, New_Altitude, Standard_Output));

end altitude;
