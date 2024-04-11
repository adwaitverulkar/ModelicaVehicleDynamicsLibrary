model Vehicle3DOF
  extends Modelica.Icons.Example;
  RigidChassisModel rigidChassisModel annotation(
    Placement(transformation(origin = {43, -38}, extent = {{43, -26}, {-43, 26}})));
  inner Modelica.Mechanics.MultiBody.World world(label2 = "z", n = {0, 0, -1})  annotation(
    Placement(transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}})));
  DriverModel driverModel annotation(
    Placement(transformation(origin = {-11, 65}, extent = {{-23, -21}, {23, 21}})));
  inner VehicleInterfaces.Roads.FlatRoad road annotation(
    Placement(transformation(origin = {-40, -82}, extent = {{-20, -10}, {20, 10}})));
  AutomaticTransmission5Speed automaticTransmission5Speed annotation(
    Placement(transformation(origin = {-48, -41}, extent = {{-18, -17}, {18, 17}})));
  EnginewPedal enginewPedal annotation(
    Placement(transformation(origin = {-139, -26}, extent = {{-23, -20}, {23, 20}})));
equation

  annotation(
    uses(Modelica(version = "4.0.0"), VehicleInterfaces(version = "2.0.1")));
end Vehicle3DOF;
