record ChassisRecord "Chassis Record"
  extends Modelica.Icons.Record;
  import Modelica.Units.SI;
  
  parameter SI.Length L = 3.6;
  parameter SI.Mass M = 1200;
  parameter SI.MomentOfInertia Iz = 1500;
  parameter SI.DimensionlessRatio weightSplit = 0.6;
  parameter SI.Length a = L*weightSplit;
  parameter SI.Length b = L - a;
  parameter SI.Length h = 0.5 "Height of CoM";
  parameter SI.Length tf = 2.0 "Front track width";
  parameter SI.Length tr = 2.0 "Real track width";


end ChassisRecord;
