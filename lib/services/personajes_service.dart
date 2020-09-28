import 'package:breaking_bad_app/models/personajes.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PersonajesService with ChangeNotifier {
  List<Personajes> _personajes = [];

  List<Personajes> get personajes => _personajes;

  String _url = 'https://www.breakingbadapi.com/api/characters';

  bool cargando = true;

  getPersonajes() async {
    final resp = await http.get(_url);
    this._personajes = personajesFromJson(resp.body);
    this.cargando = false;
    notifyListeners();
  }
}
