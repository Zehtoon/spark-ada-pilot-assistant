with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;
procedure ShowStats(Aircraft :out Aircraft_Stats)
  with
    Global => (In_out=> (Standard_Output, Standard_Input)),
    Depends=> (Aircraft => Standard_Input, Standard_Output => (Standard_Output,Standard_Input), Standard_Input =>Standard_Input)
;
