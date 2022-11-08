
class Mascota {

  var _id;
  var _nombre;
  var _tipo;
  var _color;
  var _raza;
  var _sexo;
  var _foto;


  Mascota(this._id, this._nombre, this._tipo, this._color, this._raza,
      this._sexo, this._foto);

  Mascota.fromJson(Map<String, dynamic> data)
      : _id= data['id'],
        _nombre= data['nombre'],
        _tipo=data['tipo'],
        _color=data['color'],
        _raza=data['raza'],
        _sexo=data['sexo'],
        _foto=data['foto'];

  Map<String, dynamic> convertir() =>
      {
        'id': _id,
        'nombre': _nombre,
        'tipo': _tipo,
        'color': _color,
        'raza': _raza,
        'sexo': _sexo,
        'foto': _foto
      };

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }

  get sexo => _sexo;

  set sexo(value) {
    _sexo = value;
  }

  get raza => _raza;

  set raza(value) {
    _raza = value;
  }

  get color => _color;

  set color(value) {
    _color = value;
  }

  get tipo => _tipo;

  set tipo(value) {
    _tipo = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}