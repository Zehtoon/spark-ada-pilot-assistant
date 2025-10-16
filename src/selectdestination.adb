pragma SPARK_Mode;
with AS_IO_Wrapper; use AS_IO_Wrapper;
with Aircraft_Status;

package body SelectDestination is




   procedure SelectDestination(Aircraft: in Aircraft_Stats) is
      DestinationChoice: Integer;
      SelectedDest : Destination;

begin
   --AS_Init_Standard_Input;
   --AS_Init_Standard_Output;
   FuelLevel := Aircraft_Status.Get_FuelLevel(Aircraft);
   -- Displaying the available destinations
   AS_Put_Line("Available Destinations: ");
   for I in 1..5 loop
      AS_Put_Line(Integer'Image(I) & ". " & Destinations(I).Name);
   end loop;
   -- Asking for the destination choice
   AS_Put_Line("Enter you choice(1-5): ");
   AS_Get(DestinationChoice);

   if DestinationChoice < 1 or else DestinationChoice >5 then
      AS_Put_Line("Invalid choice, please select a valid destination.");
      return;
   end if;

   --Getting the selected destination details
   SelectedDest := Destinations(DestinationChoice);
   -- fetching the estimated travel time, distance, and required fuel
   AS_Put_Line("Destination: " & SelectedDest.Name);
   AS_Put_Line("Distance: " & Float'Image(SelectedDest.Distance) & "km");
   AS_Put_Line("Estimated Travel Time: " & Float'Image(SelectedDest.EstimatedTime) & "hours");
   AS_Put_Line("Required Fuel : " & Integer'Image(SelectedDest.RequiredFuel)& "liters");
   -- checking if the current fuel level is sufficient
   if FuelLevel < SelectedDest.RequiredFuel then
      AS_Put_Line("Warning: Insufficient fuel for the selected destination. Please refuel.");
   else
      AS_Put_Line("You have enough fuel for the journey.");
   end if;
   end SelectDestination;
end SelectDestination;
