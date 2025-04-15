import 'package:flutter/material.dart';

class HistoricoItem {
  final String title;
  final String date;
  final String status;

  HistoricoItem({required this.title, required this.date, required this.status});
}

class HistoricoProvider extends ChangeNotifier {
  final List<HistoricoItem> _itens = [
    HistoricoItem(
      title: "Chave PIX Suspeita", 
      date: "12/02/2025", 
      status: "Em análise"),
  ];

  List<HistoricoItem> get itens => _itens;

  List<HistoricoItem> pesquisar(String query) {
    return _itens.where((item) =>
      item.title.toLowerCase().contains(query.toLowerCase()) ||
      item.date.contains(query) ||
      item.status.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  void adicionarItem(HistoricoItem item) {
    _itens.add(item);
    notifyListeners();
  }
}
