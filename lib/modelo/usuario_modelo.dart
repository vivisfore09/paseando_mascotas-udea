
class Usuario{

  var _id;
  var _nombres;
  var _apellidos;
  var _email;
  var _telefono;
  var _direccion;
  var _genero;
  var _password;

  Usuario(this._id, this._nombres, this._apellidos, this._email, this._telefono,
      this._direccion, this._genero, this._password);

  Usuario.fromJson(Map<String, dynamic> data)
  : _id= data['id'],
    _nombres= data['nombres'],
    _apellidos=data['apellidos'],
    _email=data['email'],
    _telefono=data['telefono'],
    _direccion=data['direccion'],
    _genero=data['genero'],
    _password=data['password'];

  Map<String, dynamic> convertir() =>{
    'id':_id,
    'nombres': _nombres,
    'apellidos': _apellidos,
    'email': _email,
    'telefono': _telefono,
    'direccion':_direccion,
    'genero': _genero,
    'password': _password
  };

  get genero => _genero;

  set genero(value) {
    _genero = value;
  }

  get direccion => _direccion;

  set direccion(value) {
    _direccion = value;
  }

  get telefono => _telefono;

  set telefono(value) {
    _telefono = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get apellidos => _apellidos;

  set apellidos(value) {
    _apellidos = value;
  }

  get nombres => _nombres;

  set nombres(value) {
    _nombres = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }
}