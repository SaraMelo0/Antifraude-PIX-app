import 'package:antifraude_pix/screens/med-pix-page.dart';
import 'package:antifraude_pix/screens/pix-screens/chave-pix-page.dart';
import 'package:antifraude_pix/screens/pix-screens/valor-pix-page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home-page.dart';
import 'screens/notificacoes-page.dart';
import 'screens/historico-page.dart';
import 'providers/historico-provider.dart';
import 'screens/protocolo-screens/protocolo-page.dart';
import 'providers/protocolo-provider.dart';
import 'screens/protocolo-screens/detalhe-protocolo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoricoProvider()),
        ChangeNotifierProvider(create: (_) => ProtocoloProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Antifraude Pix',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/notificacoes': (context) => const NotificacoesPage(),
          '/historico': (context) => const HistoricoPage(),
          '/protocolo': (context) => const ProtocoloPage(),
          '/detalhesProtocolo': (context) => const DetalhesProtocoloPage(),
          '/MedPix': (context) => MedPixPage(),
          '/Pix': (context) => PixPage(),
          'ValorPix': (context) => ValorPixPage(),
        },
      ),
    );
  }
}
