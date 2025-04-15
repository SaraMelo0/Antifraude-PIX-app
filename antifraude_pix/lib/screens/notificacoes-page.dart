import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({super.key});

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
          'Notificações de Segurança',
          style: TextStyle(
            color: Color(0xFF0BBF6B), 
            fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
            // Notificações
          _buildNotificationItem(
            "Suspeita de Fraude Detectada: Identificamos um possível golpe relacionado a uma transação PIX em sua conta.",
            '12 fev. às 14:35',
          ),
          _buildNotificationItem(
            "Sua solicitação de bloqueio de valores via MED PIX foi registrada. A análise está em andamento.",
            '13 fev. às 09:10',
          ),
          _buildNotificationItem(
            "Seu protocolo de contestação foi atualizado.",
            '14 fev. às 10:00',
          ),
          _buildNotificationItem(
            "O banco identificou irregularidades na conta para a qual você enviou um PIX recentemente. Se não reconhece a transação, entre em contato.",
            '24 jan. às 18:00',
          ),
        ],
      ),
    );
  }

  // Para editar e decorar as funcionalidades
  Widget _buildNotificationItem(String text, String date) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1), 
      ),
      child: ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            const SizedBox(height: 4),
            Text(
              date,
              style: const TextStyle(
                fontSize: 12, 
                color: Colors.black54
                ),
            ),
          ],
        ),
        // trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Navegar para detalhes da notificação
        },
      ),
    );
  }
}