class Atualizacao {
  final String dataHora;
  final String mensagem;

  Atualizacao({required this.dataHora, required this.mensagem});
}

class ProtocoloItem {
  final String title;
  final String date;
  final String status;
  final List<Atualizacao> atualizacoes;

  ProtocoloItem({
    required this.title,
    required this.date,
    required this.status,
    required this.atualizacoes,
  });
}
