import 'package:flutter/material.dart';
import 'notificacoes-page.dart';
import 'historico-page.dart';
import 'protocolo-screens/protocolo-page.dart';
import 'protocolo-screens/detalhe-protocolo.dart';
import 'med-pix-page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Alinha os itens à esquerda
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Logo do Banese
              Image.asset('assets/images/logo-banese.png'),

              const SizedBox(height: 20),

              // Grid de funcionalidades principais
              SizedBox(
                height: 250,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  children: [
                    // Botões de navegação
                    _buildBlock('assets/icons/bell-bold.png', "Notificações de Segurança", context, NotificacoesPage()),
                    _buildBlock('assets/icons/clock-clockwise-bold.png', "Histórico de Denúncias", context, HistoricoPage()),
                    _buildBlock('assets/icons/note-bold.png', "Protocolos", context, ProtocoloPage()),
                    _buildBlock('assets/icons/pix-logo-bold.png', "MED Pix", context, MedPixPage()),
                  ],
                ),
              ),

              // Card da Duda
              _buildCardDuda(),
            ],
          ),
        ),
      ),
    );
  }
}

// Para editar as funcionalidades 
Widget _buildBlock(String imagePath, String label, BuildContext context, Widget nextPage) {
  return GestureDetector(
    onTap: () {
      // Navega para a próxima página ao clicar no bloco
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage),
      );
    },
    // Decorações do blocos
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1), 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Alinha os itens à esquerda
        children: [
          Image.asset(imagePath, width: 20, height: 20),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

// Para decorar o card
Widget _buildCardDuda() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF21A668),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/duda.png',
          width: 106,
          height: 188,
        ),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Se a Maria Eduarda conseguiu seu dinheiro de volta pelo MedPix, você também pode!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Fique atento, denuncie e lute pelos seus direitos – fraudadores não vencerão!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
