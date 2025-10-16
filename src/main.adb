pragma SPARK_Mode;
with Ada.Text_IO; use Ada.Text_IO;
with AS_Io_Wrapper; use AS_Io_Wrapper;
with Aircraft_Types;use Aircraft_Types;
with ShowStats;

procedure Main is
   Aircraft: Aircraft_Types.Aircraft_Stats;

begin
   AS_Init_Standard_Input;
   AS_Init_Standard_Output;
   if Aircraft.FlyStatus = Landed then
      ShowStats(Aircraft);
      Put_Line("Aircraft FlyStatus: " & Aircraft.FlyStatus'Image);
   elsif Aircraft.FlyStatus = Flying then
      Put_Line("The pilot assistant must stay on");
   end if;

end Main;
