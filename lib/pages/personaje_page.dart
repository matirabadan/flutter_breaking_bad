import 'package:breaking_bad_app/models/personajes.dart';
import 'package:breaking_bad_app/services/personaje_seleccionado_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personajeSeleccionadoSerive =
        Provider.of<PersonajeSeleccionadoService>(context);
    final personaje = personajeSeleccionadoSerive.personaje;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0D3E10),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: personaje.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    personaje.img,
                    height: size.height / 3.5,
                    width: size.width / 3.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: size.width / 20),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      personaje.name,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      personaje.nickname,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      personaje.occupation[0],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(birthdayValues.reverse[personaje.birthday]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(statusValues.reverse[personaje.status])
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
