import 'package:breaking_bad_app/models/personajes.dart';
import 'package:breaking_bad_app/services/personaje_seleccionado_service.dart';
import 'package:breaking_bad_app/services/personajes_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersonajesService personajesService;
  @override
  Widget build(BuildContext context) {
    personajesService = Provider.of<PersonajesService>(context);
    personajesService.getPersonajes();
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking Bad App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff0D3E10),
      ),
      body: personajesService.cargando ? _crearCargando() : _crearListView(),
    );
  }

  _crearCargando() {
    return Center(
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0D3E10))));
  }

  ListView _crearListView() {
    List<Personajes> personajes = personajesService.personajes;
    return ListView.separated(
        itemBuilder: (context, index) {
          return _crearListTile(personajes[index]);
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: personajes.length);
  }

  ListTile _crearListTile(Personajes personaje) {
    return ListTile(
      onTap: () {
        final personajeSeleccionadoSerive =
            Provider.of<PersonajeSeleccionadoService>(context, listen: false);
        personajeSeleccionadoSerive.personaje = personaje;
        Navigator.pushNamed(context, 'personaje');
      },
      leading: Hero(
        tag: personaje.name,
        child: CircleAvatar(
          backgroundImage: NetworkImage(personaje.img),
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(personaje.name),
      subtitle: Text(personaje.nickname),
    );
  }
}
