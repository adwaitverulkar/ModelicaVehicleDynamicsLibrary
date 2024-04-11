model TireTest
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(transformation(origin = {-66, 2}, extent = {{-10, -10}, {10, 10}})));
  MFTire mFTire annotation(
    Placement(transformation(origin = {-22, 2}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(world.frame_b, mFTire.frame_a) annotation(
    Line(points = {{-56, 2}, {-32, 2}}, color = {95, 95, 95}));

annotation(
    uses(Modelica(version = "4.0.0")));
end TireTest;
