import 'package:antifraude_pix/screens/protocolo-screens/protocolo-page.dart';
import 'package:flutter/material.dart';

class MedPixPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F6),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'MED Pix',
          style: TextStyle(
            color: Color(0xFF0BBF6B), 
            fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _sectionTitle('📌 O que é o MED PIX?'),
            const Text(
              'O MED PIX é um mecanismo do Banco Central que permite o bloqueio temporário de valores enviados via PIX em casos de suspeita de fraude.',
            ),
            const SizedBox(height: 16),
            _sectionTitle('⚠️ Quando posso acionar?'),
            _bullet('Se você foi vítima de um golpe via PIX.'),
            _bullet('Se identificou uma transação suspeita.'),
            _bullet('Se deseja contestar um PIX enviado.'),
            const SizedBox(height: 16),
            _sectionTitle('🔍 O que acontece depois?'),
            _step('1', 'Solicitação enviada → O banco analisa.'),
            _step('2', 'Se houver indícios de fraude, o valor pode ser bloqueado.'),
            _step('3', 'O banco investiga e pode liberar ou reverter o valor.'),
            _step('4', 'Você será notificado sobre o andamento.'),
            const SizedBox(height: 16),
            const Text(
              '❓ FAQ (Perguntas Frequentes)',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _faqTile(
              'Quanto tempo leva para o banco analisar?',
              'O prazo pode variar, mas geralmente a análise inicial ocorre em até X dias úteis. O banco pode solicitar mais informações se necessário.',
            ),
            _faqTile(
              'Posso recuperar todo o valor?',
              'Depende da conclusão da análise e do valor disponível na conta recebedora.',
            ),
            _faqTile(
              'O que acontece se a fraude não for comprovada?',
              'O valor pode ser liberado para o recebedor novamente.',
            ),
            _faqTile(
              'Posso cancelar uma solicitação de MED Pix?',
              'Em alguns casos sim, entre em contato com seu banco para verificar.',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProtocoloPage()),
                  );
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF21A668),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                  child: Text(
                    'Ver meus protocolos',
                    style: TextStyle(color: Color(0xFFF1F5F6)),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 4),
      child: Row(
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _step(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFF21A668),
            child: Text(
              number,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _faqTile(String title, String content) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 15)),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
          child: Text(content),
        ),
      ],
    );
  }
}