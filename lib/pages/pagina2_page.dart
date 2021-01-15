import 'package:flutter/material.dart';
import 'package:singelton/models/usuario.dart';
import 'package:singelton/services/usuario_services.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _usuarioNombre()),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text('Establecer Usuario',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  final nuevoUsuario =
                      new Usuario(nombre: 'Christian', edad: 29);

                  usuarioService.cargarUsuario(nuevoUsuario);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child:
                    Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioService.cambiarEdad(30);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text('Añadir Profesion',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {},
              )
            ],
          ),
        ));
  }

  Widget _usuarioNombre() {
    return StreamBuilder(
      stream: usuarioService.usuarioStream,
      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
        return snapshot.hasData
            ? Text('Nombre : ${snapshot.data.nombre}')
            : Text('Pagina 2');
      },
    );
  }
}
