model MFTire
  import Modelica.Mechanics.MultiBody.Visualizers;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Units.SI;
  
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

  parameter Boolean animation=true "= true, if animation shall be enabled";

  parameter SI.Radius rTire=0.25 "Radius of the tire";
  parameter SI.Radius rRim= 0.14 "Radius of the rim";
  parameter SI.Radius width=0.25 "Width of the tire";
  parameter SI.Radius rCurvature=0.30 "Radius of the tire's cross section";

  parameter Modelica.Mechanics.MultiBody.Types.RealColor color={64,64,64}
    "Color of tire" annotation(Dialog(enable=animation, colorSelector=true, group="Material properties"));
  parameter Types.SpecularCoefficient specularCoefficient = 0.5
    "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog(enable=animation, group="Material properties"));
  parameter Integer n_rTire=40 "Number of points along rTire" annotation(Dialog(enable=animation, tab="Discretization"));
  parameter Integer n_rCurvature=20 "Number of points along rCurvature" annotation(Dialog(enable=animation, tab="Discretization"));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation tireRadius(r = {0, 0, -tireRecord.r_ground})  annotation(
    Placement(transformation(origin = {-54, 56}, extent = {{-10, -10}, {10, 10}})));
  TireRecord tireRecord annotation(
    Placement(transformation(origin = {-82, -80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_b)  annotation(
    Placement(transformation(origin = {-4, 56}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Constant const[3](k = {800, 400, 0})  annotation(
    Placement(transformation(origin = {54, 56}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
protected
  parameter SI.Radius rw = (width/2);
  parameter SI.Radius rCurvature2 = if rCurvature > rw then rCurvature else rw;
  final parameter Real kw = rw/rCurvature2 "Regularized width ratio (0...1)";
  parameter SI.Radius h =     sqrt(1 - kw*kw) * rCurvature2;
  parameter SI.Length ri =  rTire-rCurvature2;
  parameter SI.Radius rRim2 = if rRim < 0 then 0 else if rRim > ri+h then ri+h else rRim;

    Visualizers.Advanced.Shape pipe(
    shapeType="pipe",
    color=color,
    length=width,
    width=2*(ri + h),
    height=2*(ri + h),
    lengthDirection={0,1,0},
    widthDirection={0,0,1},
    extra=(rRim2)/(ri + h),
    r=frame_a.r_0,
    r_shape=-{0,1,0}*(width/2),
    R=frame_a.R,
    specularCoefficient=specularCoefficient) if world.enableAnimation and animation annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

    Visualizers.Advanced.Surface torus(
    redeclare function surfaceCharacteristic = Modelica.Mechanics.MultiBody.Visualizers.Advanced.SurfaceCharacteristics.torus (
        R=ri,
        r=rCurvature2,
        opening=Modelica.Constants.pi - Modelica.Math.asin(kw)),
    nu=n_rTire,
    nv=n_rCurvature,
    multiColoredSurface=false,
    wireframe=false,
    color=color,
    specularCoefficient=specularCoefficient,
    transparency=0,
    R=frame_a.R,
    r_0=frame_a.r_0) if world.enableAnimation and animation annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(frame_a, tireRadius.frame_a) annotation(
    Line(points = {{-100, 0}, {-80, 0}, {-80, 56}, {-64, 56}}));
  connect(force.frame_b, tireRadius.frame_b) annotation(
    Line(points = {{-14, 56}, {-44, 56}}, color = {95, 95, 95}));
  connect(const.y, force.force) annotation(
    Line(points = {{44, 56}, {8, 56}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Icon(graphics = {Polygon(lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.Sphere, points = {{-40, 80}, {-20, 90}, {15, 90}, {40, 85}, {58.776, 73.91}, {70.456, 56.568}, {74.951, 44.383}, {78.26, 30.614}, {80.302, 15.68}, {81, 0}, {81, 0}, {80.302, -15.68}, {78.26, -30.614}, {74.951, -44.383}, {70.456, -56.568}, {58.776, -73.91}, {40, -85}, {15, -90}, {-20, -90}, {-40, -80}, {-48.776, -73.91}, {-60.456, -56.568}, {-64.951, -44.383}, {-68.26, -30.614}, {-70.302, -15.68}, {-71, 0}, {-71, 0}, {-70.302, 15.68}, {-68.26, 30.614}, {-64.951, 44.383}, {-60.456, 56.568}, {-48.776, 73.91}}, smooth = Smooth.Bezier), Polygon(lineColor = {64, 64, 64}, fillColor = {64, 64, 64}, fillPattern = FillPattern.Solid, points = {{1, 0}, {0.302, 15.68}, {-1.74, 30.614}, {-5.049, 44.383}, {-9.544, 56.568}, {-21.224, 73.91}, {-35, 80}, {-48.776, 73.91}, {-60.456, 56.568}, {-64.951, 44.383}, {-68.26, 30.614}, {-70.302, 15.68}, {-71, 0}, {-70.302, -15.68}, {-68.26, -30.614}, {-64.951, -44.383}, {-60.456, -56.568}, {-48.776, -73.91}, {-35, -80}, {-21.224, -73.91}, {-9.544, -56.568}, {-5.049, -44.383}, {-1.74, -30.614}, {0.302, -15.68}, {1, 0}}, smooth = Smooth.Bezier), Polygon(lineColor = {64, 64, 64}, fillColor = {191, 191, 191}, fillPattern = FillPattern.HorizontalCylinder, points = {{-12.5, 0}, {-14.213, -19.134}, {-19.09, -35.355}, {-26.39, -46.194}, {-35, -50}, {-43.61, -46.194}, {-50.91, -35.355}, {-55.787, -19.134}, {-57.5, 0}, {-55.787, 19.134}, {-50.91, 35.355}, {-43.61, 46.194}, {-35, 50}, {-26.39, 46.194}, {-19.09, 35.355}, {-14.213, 19.134}, {-12.5, 0}}, smooth = Smooth.Bezier), Text(textColor = {0, 0, 255}, extent = {{-150, 100}, {150, 140}}, textString = "%name"), Rectangle(origin = {6.091, 0}, lineColor = {95, 95, 95}, fillColor = {215, 215, 215}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-102.091, -8}, {-19.142, 8}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true)),
    uses(Modelica(version = "4.0.0")));
end MFTire;
