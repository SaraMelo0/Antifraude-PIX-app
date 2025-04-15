import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/historico-provider.dart' as hp;

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  String _search = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<hp.HistoricoProvider>(context);
    final resultados = _search.isEmpty
        ? provider.itens
        : provider.pesquisar(_search);

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
          'Histórico de Denúncias',
          style: TextStyle(
            color: Color(0xFF0BBF6B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true, 
                fillColor: Colors.white,
                hintText: 'Pesquisar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _search = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultados.length,
              itemBuilder: (context, index) {
                final item = resultados[index];
                return _buildHistoricoItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoricoItem(hp.HistoricoItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),

      child: ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              item.date,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            Text(
              item.status,
              style: TextStyle(
                color: item.status.toLowerCase() == "resolvido"
                  ? Color(0xFF0BBF6B)
                  : Color(0xFFFDA722),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
