import 'package:hive/hive.dart';

part 'paseadores_local.g.dart';

@HiveType(typeId: 0)
class PaseadoresLocal extends HiveObject{

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? contacto;
  @HiveField(3)
  String? ciudad;
  @HiveField(4)
  String? foto;
  @HiveField(5)
  String? perfil;

}