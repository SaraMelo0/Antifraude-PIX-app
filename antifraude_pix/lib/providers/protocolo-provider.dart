import 'package:flutter/material.dart';
import '../models/protocolo-item.dart'; 

class ProtocoloProvider extends ChangeNotifier {
  final List<ProtocoloItem> _itens = [
    ProtocoloItem(
      title: "Protocolo: #20250212-004", 
      date: "12/02/2025", 
      status: "Em análise",
      atualizacoes: [
        Atualizacao(
          dataHora: "13/02/2025 09:10", 
          mensagem: "Sua denúncia foi encaminhada para análise da equipe de segurança."
        ),
        Atualizacao(
          dataHora: "14/02/2025 10:00", 
          mensagem: "Foi identificado um uso suspeito da chave PIX reportada. Estamos contatando os bancos envolvidos."
        ),
      ],
    ),
    ProtocoloItem(
      title: "Protocolo: #20252601-003", 
      date: "26/01/2025", 
      status: "Resolvido",
      atualizacoes: [
        Atualizacao(
          dataHora: "26/02/2025 09:10", 
          mensagem: "Recebemos sua solicitação e iniciamos a análise."
        ),
        Atualizacao(
          dataHora: "27/02/2025 09:47",
          mensagem: "Análise finalizada. Cliente informado.",
        ),
        Atualizacao(
          dataHora: "28/02/2025 10:00",
          mensagem: "Protocolo encerrado com sucesso.",
        ),
      ],
    ),
    ProtocoloItem(
      title: "Protocolo: #20251001-002", 
      date: "10/01/2025", 
      status: "Resolvido",
      atualizacoes: [],
    ),
    ProtocoloItem(
      title: "Protocolo: #20251212-001", 
      date: "12/12/2024", 
      status: "Resolvido",
      atualizacoes: [],
    ),
  ];

  List<ProtocoloItem> get itens => _itens;

  List<ProtocoloItem> pesquisar(String query) {
    return _itens.where((item) =>
      item.title.toLowerCase().contains(query.toLowerCase()) ||
      item.date.contains(query) ||
      item.status.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  void adicionarItem(ProtocoloItem item) {
    _itens.add(item);
    notifyListeners();
  }
}
