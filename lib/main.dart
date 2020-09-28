import 'package:breaking_bad_app/pages/home_page.dart';
import 'package:breaking_bad_app/pages/personaje_page.dart';
import 'package:breaking_bad_app/services/personaje_seleccionado_service.dart';
import 'package:breaking_bad_app/services/personajes_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PersonajesService()),
        ChangeNotifierProvider(create: (_) => PersonajeSeleccionadoService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'personaje': (_) => PersonajePage()
        },
      ),
    );
  }
}
