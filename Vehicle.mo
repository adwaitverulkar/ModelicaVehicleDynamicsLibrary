model Vehicle
  RigidChassisModel rigidChassisModel annotation(
    Placement(transformation(origin = {23, 4}, extent = {{43, -26}, {-43, 26}})));
  inner Modelica.Mechanics.MultiBody.World world(label2 = "z", n = {0, 0, -1})  annotation(
    Placement(transformation(origin = {-60, -86}, extent = {{-10, -10}, {10, 10}})));
equation

annotation(
    uses(Modelica(version = "4.0.0"), VehicleInterfaces(version = "2.0.1")));
end Vehicle;
