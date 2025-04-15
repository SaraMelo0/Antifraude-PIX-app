import 'package:flutter/material.dart';
import '../../models/protocolo-item.dart'; 

class DetalhesProtocoloPage extends StatelessWidget {
  const DetalhesProtocoloPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProtocoloItem item = ModalRoute.of(context)!.settings.arguments as ProtocoloItem;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detalhes do Protocolo',
          style: TextStyle(
            color: Color(0xFF0BBF6B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF1F5F6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Status
              Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.black54),
                  const SizedBox(width: 8),
                  const Text('Status: ', style: TextStyle(fontSize: 14)),
                  Text(
                    item.status,
                    style: TextStyle(
                      fontSize: 14,
                      color: item.status.toLowerCase() == "resolvido"
                          ? const Color(0xFF0BBF6B)
                          : const Color(0xFFFDA722),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Data de abertura
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, color: Colors.black54),
                  const SizedBox(width: 8),
                  Text(
                    'Abertura: ${item.date}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Acompanhamento
              const Text(
                'Acompanhamento e Atualizações',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),

              ...item.atualizacoes.map((a) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '${a.dataHora} — ${a.mensagem}',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
