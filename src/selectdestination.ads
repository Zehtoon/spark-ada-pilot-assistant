pragma SPARK_Mode;
with Aircraft_Types; use Aircraft_Types;
with SPARK.Text_IO; use SPARK.Text_IO;

package SelectDestination is
   type Destination is record
      Name: String(1..8);
      Distance: Float;
      EstimatedTime: Float;
      RequiredFuel: Integer;
   end record;
   Destinations: constant array(1..5) of Destination := (
                                                (Name => "Paris...", Distance => 343.0, EstimatedTime => 1.5, RequiredFuel => 300),
                                                (Name => "Berlin..", Distance => 930.0, EstimatedTime => 2.5, RequiredFuel => 500),
                                                (Name => "Rome....", Distance => 1200.0, EstimatedTime => 3.0, RequiredFuel => 600),
                                                (Name => "New York", Distance => 5600.0, EstimatedTime => 8.0, RequiredFuel => 2000),
                                                (Name => "Tokyo...", Distance => 9600.0, EstimatedTime => 12.0, RequiredFuel => 2500)
                                               );

   FuelLevel: FuelRange := 0;

   procedure SelectDestination(Aircraft: in Aircraft_Stats)
     with
       Global => (In_Out=>(Standard_Input, Standard_Output), Output =>(FuelLevel)),
       Depends => (FuelLevel =>Aircraft,  Standard_Input => (Standard_Input),Standard_Output=> ( Aircraft, Standard_Output, Standard_Input));

end SelectDestination;
