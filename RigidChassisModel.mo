model RigidChassisModel
  extends VehicleInterfaces.Icons.Chassis;
  Modelica.Mechanics.MultiBody.Joints.Prismatic motionX(animation = false)  annotation(
    Placement(transformation(origin = {-118, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic motionY(n = {0, 1, 0}, animation = false) annotation(
    Placement(transformation(origin = {-90, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute FLSteeringAxis(phi(start = 0.7853981633974483), useAxisFlange = true) annotation(
    Placement(transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute FRSteeringAxis(phi(start = 0.7853981633974483), useAxisFlange = true)  annotation(
    Placement(transformation(origin = {110, -48}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body FRWheelInertia(m = 0.01, I_11 = 0.01, I_22 = 0.01, I_33 = 0.01)  annotation(
    Placement(transformation(origin = {158, -48}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Body body1(m = 0.01, I_11 = 0.01, I_22 = 0.01, I_33 = 0.01)  annotation(
    Placement(transformation(origin = {154, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Sources.Position steeringAngle annotation(
    Placement(transformation(origin = {100, -8}, extent = {{-10, -10}, {10, 10}})));
  VehicleInterfaces.Interfaces.ControlBus controlBus annotation(
    Placement(transformation(origin = {0, 140}, extent = {{-38, -37}, {38, 37}}), iconTransformation(origin = {0, 100}, extent = {{-38, -37}, {38, 37}})));
  Modelica.Blocks.Sources.Constant const(k = 0.78)  annotation(
    Placement(transformation(origin = {56, 60}, extent = {{-10, -10}, {10, 10}})));
  MFTire mFTire annotation(
    Placement(transformation(origin = {-82, 42}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  MFTire mFTire1 annotation(
    Placement(transformation(origin = {-88, -60}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  MFTire mFTire2 annotation(
    Placement(transformation(origin = {138, 60}, extent = {{-10, -10}, {10, 10}})));
  MFTire mFTire3 annotation(
    Placement(transformation(origin = {156, -84}, extent = {{-10, -10}, {10, 10}})));
protected
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(transformation(origin = {-136, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = chassisRecord.M, r_CM = {0, 0, chassisRecord.h}, I_11 = 1, I_22 = 1, I_33 = chassisRecord.Iz) annotation(
    Placement(transformation(origin = {0, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation CG2FrontAxle(r = {chassisRecord.a, 0, 0.35 - chassisRecord.h}) annotation(
    Placement(transformation(origin = {50, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation FLAxle(r = {0, chassisRecord.tf/2, 0}) annotation(
    Placement(transformation(origin = {60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation FRAxle(r = {0, -chassisRecord.tf/2, 0}) annotation(
    Placement(transformation(origin = {60, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation RRAxle(r = {0, -chassisRecord.tr/2, 0}) annotation(
    Placement(transformation(origin = {-60, -38}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation RLAxle(r = {0, chassisRecord.tr/2, 0}) annotation(
    Placement(transformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation CG2RearAxle(r = {chassisRecord.b, 0, chassisRecord.h - 0.35}) annotation(
    Placement(transformation(origin = {-50, -6}, extent = {{-10, -10}, {10, 10}})));
  ChassisRecord chassisRecord annotation(
    Placement(transformation(origin = {-142, -84}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation = false)  annotation(
    Placement(transformation(origin = {-36, 84}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
  VehicleInterfaces.Interfaces.ChassisBus chassisBus annotation(
    Placement(transformation(origin = {-130.5, -9.5}, extent = {{-23.5, -23.5}, {23.5, 23.5}}, rotation = 90), iconTransformation(origin = {88, 126}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(chassisBus.steeringAngle, steeringAngle.phi_ref);
  connect(fixed.frame_b, motionX.frame_a) annotation(
    Line(points = {{-136, 76}, {-137, 76}, {-137, 52}, {-128, 52}}, color = {95, 95, 95}));
  connect(motionX.frame_b, motionY.frame_a) annotation(
    Line(points = {{-108, 52}, {-90, 52}, {-90, 64}}, color = {95, 95, 95}));
  connect(body.frame_a, CG2FrontAxle.frame_a) annotation(
    Line(points = {{0, -6}, {40, -6}}, color = {95, 95, 95}));
  connect(FLAxle.frame_a, CG2FrontAxle.frame_b) annotation(
    Line(points = {{60, 12}, {60, -6}}, color = {95, 95, 95}));
  connect(CG2FrontAxle.frame_b, FRAxle.frame_a) annotation(
    Line(points = {{60, -6}, {60, -28}}, color = {95, 95, 95}));
  connect(CG2RearAxle.frame_a, RLAxle.frame_a) annotation(
    Line(points = {{-60, -6}, {-60, 12}}, color = {95, 95, 95}));
  connect(CG2RearAxle.frame_a, RRAxle.frame_a) annotation(
    Line(points = {{-60, -6}, {-60, -28}}, color = {95, 95, 95}));
  connect(CG2RearAxle.frame_b, body.frame_a) annotation(
    Line(points = {{-40, -6}, {0, -6}}, color = {95, 95, 95}));
  connect(FLAxle.frame_b, FLSteeringAxis.frame_a) annotation(
    Line(points = {{60, 32}, {100, 32}, {100, 30}}, color = {95, 95, 95}));
  connect(FRAxle.frame_b, FRSteeringAxis.frame_a) annotation(
    Line(points = {{60, -48}, {100, -48}}, color = {95, 95, 95}));
  connect(FRSteeringAxis.frame_b, FRWheelInertia.frame_a) annotation(
    Line(points = {{120, -48}, {148, -48}}, color = {95, 95, 95}));
  connect(FLSteeringAxis.frame_b, body1.frame_a) annotation(
    Line(points = {{120, 30}, {144, 30}}, color = {95, 95, 95}));
  connect(steeringAngle.flange, FLSteeringAxis.axis) annotation(
    Line(points = {{110, -8}, {110, 40}}));
  connect(steeringAngle.flange, FRSteeringAxis.axis) annotation(
    Line(points = {{110, -8}, {110, -38}}));
  connect(controlBus.chassisBus, chassisBus) annotation(
    Line(points = {{0, 140}, {-170, 140}, {-170, -10}, {-130, -10}}, thickness = 0.5));
  connect(motionY.frame_b, revolute.frame_a) annotation(
    Line(points = {{-90, 84}, {-46, 84}}, color = {95, 95, 95}));
  connect(revolute.frame_b, body.frame_a) annotation(
    Line(points = {{-26, 84}, {0, 84}, {0, -6}}, color = {95, 95, 95}));
  connect(const.y, steeringAngle.phi_ref) annotation(
    Line(points = {{68, 60}, {88, 60}, {88, -8}}, color = {0, 0, 127}));
  connect(mFTire.frame_a, RLAxle.frame_b) annotation(
    Line(points = {{-72, 42}, {-60, 42}, {-60, 32}}, color = {95, 95, 95}));
  connect(mFTire1.frame_a, RRAxle.frame_b) annotation(
    Line(points = {{-78, -60}, {-60, -60}, {-60, -48}}, color = {95, 95, 95}));
  connect(mFTire2.frame_a, FLSteeringAxis.frame_b) annotation(
    Line(points = {{128, 60}, {120, 60}, {120, 30}}, color = {95, 95, 95}));
  connect(mFTire3.frame_a, FRSteeringAxis.frame_b) annotation(
    Line(points = {{146, -84}, {120, -84}, {120, -48}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "4.0.0"), VehicleInterfaces(version = "2.0.1")));
end RigidChassisModel;
