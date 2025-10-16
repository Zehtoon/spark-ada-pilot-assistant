pragma SPARK_Mode;
with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;
package Speed is


   procedure IncreaseSpeed(Aircraft: in out Aircraft_Stats;New_Speed: SpeedRange)
     with
       Global =>(In_Out => Standard_Output),
       Pre => Aircraft.Engine = On,
       Post => (if Aircraft'Old.AirSpeed <= New_Speed then
                  Aircraft.AirSpeed = New_Speed
                    else
                      Aircraft.AirSpeed = Aircraft'Old.AirSpeed),
   Depends => (Standard_Output => (Aircraft, New_Speed, Standard_Output), Aircraft => (Aircraft, New_Speed));


   procedure DecreaseSpeed(Aircraft: in out Aircraft_Stats; New_Speed: SpeedRange)
     with
       Global =>(In_Out => Standard_Output),
       Pre => Aircraft.Engine = On,
       Post => (if Aircraft'Old.AirSpeed >= New_Speed then
                  Aircraft.AirSpeed = New_Speed
                    else
                      Aircraft.AirSpeed = Aircraft'Old.AirSpeed);
end Speed;
