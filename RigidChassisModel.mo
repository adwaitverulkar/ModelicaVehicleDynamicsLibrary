model RigidChassisModel
  extends VehicleInterfaces.Icons.Chassis;
  Modelica.Blocks.Sources.Constant FLTireForce[3](k = {800, 400, 0})  annotation(
    Placement(transformation(origin = {-142, 12}, extent = {{-10, -10}, {10, 10}})));  protected Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
    Placement(transformation(origin = {-136, 58}, extent = {{-10, -10}, {10, 10}}, rotation = -90))); Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic annotation(
    Placement(transformation(origin = {-118, 40}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, 1, 0}) annotation(
    Placement(transformation(origin = {-90, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90))); Modelica.Mechanics.MultiBody.Parts.Body body(m = chassisRecord.M, r_CM = {0, 0, 0}, I_11 = 1, I_22 = 1, I_33 = chassisRecord.Iz) annotation(
    Placement(transformation(origin = {0, -28}, extent = {{-10, -10}, {10, 10}}, rotation = -90))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, 0, chassisRecord.h}) annotation(
    Placement(transformation(origin = {-50, 80}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {chassisRecord.a, 0, 0.35 - chassisRecord.h}) annotation(
    Placement(transformation(origin = {50, -18}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {0, chassisRecord.tf/2, 0}) annotation(
    Placement(transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(r = {0, -chassisRecord.tf/2, 0}) annotation(
    Placement(transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(r = {0, -chassisRecord.tr/2, 0}) annotation(
    Placement(transformation(origin = {-60, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 90))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {0, chassisRecord.tr/2, 0}) annotation(
    Placement(transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90))); Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = {chassisRecord.b, 0, chassisRecord.h - 0.35}) annotation(
    Placement(transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}}))); ChassisRecord chassisRecord annotation(
    Placement(transformation(origin = {-134, -84}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Joints.Revolute revolute annotation(
    Placement(transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90))); Modelica.Mechanics.MultiBody.Forces.WorldForce FLTire annotation(
    Placement(transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Forces.WorldForce FRTire annotation(
    Placement(transformation(origin = {50, -80}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Forces.WorldForce RRTire annotation(
    Placement(transformation(origin = {-70, -80}, extent = {{-10, -10}, {10, 10}}))); Modelica.Mechanics.MultiBody.Forces.WorldForce RLTire annotation(
    Placement(transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(fixed.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-136, 48}, {-137, 48}, {-137, 40}, {-128, 40}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{-108, 40}, {-90, 40}, {-90, 52}}, color = {95, 95, 95}));
  connect(body.frame_a, fixedTranslation1.frame_a) annotation(
    Line(points = {{0, -18}, {40, -18}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_a, fixedTranslation1.frame_b) annotation(
    Line(points = {{60, 0}, {60, -18}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedTranslation3.frame_a) annotation(
    Line(points = {{60, -18}, {60, -40}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_a, fixedTranslation5.frame_a) annotation(
    Line(points = {{-60, -18}, {-60, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_a, fixedTranslation4.frame_a) annotation(
    Line(points = {{-60, -18}, {-60, -40}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_b, body.frame_a) annotation(
    Line(points = {{-40, -18}, {0, -18}}, color = {95, 95, 95}));
  connect(prismatic1.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-90, 72}, {-90, 80}, {-60, 80}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, revolute.frame_a) annotation(
    Line(points = {{-40, 80}, {0, 80}, {0, 60}}, color = {95, 95, 95}));
  connect(revolute.frame_b, body.frame_a) annotation(
    Line(points = {{0, 40}, {0, -18}}, color = {95, 95, 95}));
  connect(FLTire.frame_b, fixedTranslation2.frame_b) annotation(
    Line(points = {{60, 40}, {60, 20}}, color = {95, 95, 95}));
  connect(FRTire.frame_b, fixedTranslation3.frame_b) annotation(
    Line(points = {{60, -80}, {60, -60}}, color = {95, 95, 95}));
  connect(RRTire.frame_b, fixedTranslation4.frame_b) annotation(
    Line(points = {{-60, -80}, {-60, -60}}, color = {95, 95, 95}));
  connect(RLTire.frame_b, fixedTranslation5.frame_b) annotation(
    Line(points = {{-60, 40}, {-60, 20}}, color = {95, 95, 95}));
  connect(FLTireForce.y, RLTire.force) annotation(
    Line(points = {{-130, 12}, {-82, 12}, {-82, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(FLTireForce.y, RRTire.force) annotation(
    Line(points = {{-130, 12}, {-82, 12}, {-82, -80}}, color = {0, 0, 127}, thickness = 0.5));
  connect(FLTireForce.y, FLTire.force) annotation(
    Line(points = {{-130, 12}, {38, 12}, {38, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(FLTireForce.y, FRTire.force) annotation(
    Line(points = {{-130, 12}, {38, 12}, {38, -80}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "4.0.0"), VehicleInterfaces(version = "2.0.1")));
end RigidChassisModel;
