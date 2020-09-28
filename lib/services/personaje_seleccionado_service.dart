import 'package:breaking_bad_app/models/personajes.dart';
import 'package:flutter/material.dart';

class PersonajeSeleccionadoService with ChangeNotifier {
  Personajes _personaje;

  Personajes get personaje => _personaje;

  set personaje(personaje) => this._personaje = personaje;
}
