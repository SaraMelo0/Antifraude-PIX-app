import 'package:flutter/material.dart';

class HistoricoItem {
  final String title;
  final String date;
  final String status;

  HistoricoItem({required this.title, required this.date, required this.status});
}

// histórico
class HistoricoProvider extends ChangeNotifier {
  final List<HistoricoItem> _itens = [
    HistoricoItem(
      title: "Chave PIX Suspeita", 
      date: "12/02/2025", 
      status: "Em análise"),

    HistoricoItem(
      title: "Pix Fraudulento com Chave Aleatória", 
      date: "08/02/2025", 
      status: "Resolvido"),

    HistoricoItem(
      title: "Transferência Fraudulenta de Pix", 
      date: "10/01/2025", 
      status: "Resolvido"),
  ];

  List<HistoricoItem> get itens => _itens;

  List<HistoricoItem> aplicarFiltros({
    String? search,
    String? status,
    String? data,
    bool ordemCrescente = true,
  }) {
    List<HistoricoItem> resultados = [..._itens];

    if (search != null && search.isNotEmpty) {
      resultados = resultados.where((item) =>
        item.title.toLowerCase().contains(search.toLowerCase()) ||
        item.date.contains(search) ||
        item.status.toLowerCase().contains(search.toLowerCase())
      ).toList();
    }

    // filtrar por status
    if (status != null && status.isNotEmpty) {
      resultados = resultados.where((item) =>
        item.status.toLowerCase() == status.toLowerCase()).toList();
    }
    
    // filtrar por data
    if (data != null && data.isNotEmpty) {
      resultados = resultados.where((item) => item.date == data).toList();
    }

    // ordenar por data
    resultados.sort((a, b) {
      final dataA = DateTime.parse(a.date.split('/').reversed.join('-'));
      final dataB = DateTime.parse(b.date.split('/').reversed.join('-'));
      return ordemCrescente ? dataA.compareTo(dataB) : dataB.compareTo(dataA);
    });

    return resultados;
  }

  // adiciona um novo item à lista e notifica
  void adicionarItem(HistoricoItem item) {
    _itens.add(item);
    notifyListeners();
  }
}