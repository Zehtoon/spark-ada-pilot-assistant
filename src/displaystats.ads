pragma SPARK_Mode;
with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;

package DisplayStats is
   procedure DisplayStats(Aircraft : in  Aircraft_Stats)
     with
       Global => (In_Out => (Standard_Output)),
   Depends => (Standard_Output => (Aircraft,Standard_Output));
   procedure DisplayChoices
     with
   Global => (In_Out => (Standard_Output)),
   Depends => (Standard_Output => Standard_Output);
end DisplayStats;
