pragma SPARK_Mode;
with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;

package Engine_Control is

   procedure EngineOn(Aircraft: in out Aircraft_Stats)
   with
       Global => (In_Out => (Standard_Output)),
         Pre => Aircraft.Engine = off,
       Post => (if (Aircraft'Old.FuelLevel > 0 and Aircraft'Old.Engine = Off) then
                  Aircraft.Engine = On
                    else
                      Aircraft'Old.Engine = Aircraft.Engine),
         Depends => (Aircraft => Aircraft, (Standard_Output) =>(Aircraft, Standard_Output));
   procedure EngineOff(Aircraft: in out Aircraft_Stats)
      with
       Global => (In_Out => (Standard_Output)),
         Pre => Aircraft.Engine = on and
               Aircraft.FlyStatus = Landed,
         Post => Aircraft.Engine = off,
         Depends => (Aircraft => Aircraft, (Standard_Output) => (Aircraft, Standard_Output)); -- Aircraft in input dependency

   function FuelAircraft(Aircraft: Aircraft_Stats; fuel : in FuelRange) return FuelRange
     with
       Post => (FuelAircraft'Result = (if (Aircraft.FuelLevel + fuel >= Max_Fuel) then Max_Fuel else (Aircraft.FuelLevel + fuel)));

end Engine_Control;
