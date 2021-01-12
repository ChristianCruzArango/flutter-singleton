import 'package:singelton/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
  }
}

final usuarioService = new _UsuarioService();
