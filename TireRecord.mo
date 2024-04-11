record TireRecord
  import Modelica.Units.SI;
  
  extends Modelica.Icons.Record;

  parameter SI.Length r_unloaded = 0.38;
  parameter SI.TranslationalSpringConstant k = 215600;
  parameter SI.Length r_ground = 0.35;

end TireRecord;
