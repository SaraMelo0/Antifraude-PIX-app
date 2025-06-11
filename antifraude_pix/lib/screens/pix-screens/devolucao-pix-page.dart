import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class DevolucaoPixPage extends StatefulWidget {
  const DevolucaoPixPage({super.key});

  @override
  State<DevolucaoPixPage> createState() => _DevolucaoPixPageState();
}

class _DevolucaoPixPageState extends State<DevolucaoPixPage> {
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _motivoPersonalizadoController = TextEditingController();

  String? _motivoSelecionado;
  bool get _mostrarCampoPersonalizado => _motivoSelecionado == 'Outro (especificar)';

  final List<String> motivos = [
    'Solicitação do pagador',
    'Pagamento duplicado',
    'Serviço não prestado',
    'Valor incorreto',
    'Transação fraudulenta (suspeita)',
    'Transação fraudulenta (confirmada)',
    'Outro (especificar)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F5F6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Devolução via Pix',
          style: TextStyle(
            color: Color(0xFF0BBF6B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Pagar à'),
                  const Text(
                    'Fulaninho da Silva',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text('Instituição: Banco X'),
                  const Text('Chave: +55 (00) 12345-6789'),
                  const Text(
                    'Valor recebido: R\$ 1.000',
                    style: TextStyle(color: Color(0xFF0BBF6B)),
                  ),
                  const SizedBox(height: 24),

                  // Valor
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Valor do pagamento'),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFDADADA), width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _valorController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        CurrencyInputFormatter(
                          leadingSymbol: 'R\$',
                          useSymbolPadding: true,
                          thousandSeparator: ThousandSeparator.Period,
                          mantissaLength: 2,
                        ),
                      ],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0BBF6B),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'R\$ 0,00',
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // dropdown de motivo
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFDADADA), width: 1.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _motivoSelecionado,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Motivo da devolução (obrigatório)',
                      ),
                      items: motivos
                          .map((motivo) => DropdownMenuItem<String>(
                                value: motivo,
                                child: Text(motivo),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _motivoSelecionado = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // campo personalizado
                  Visibility(
                    visible: _mostrarCampoPersonalizado,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Motivo personalizado:'),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFDADADA)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: _motivoPersonalizadoController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: InputBorder.none,
                              hintText: 'Escreva aqui...',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // alerta de fraude
                  Visibility(
                    visible: _motivoSelecionado == 'Transação fraudulenta (suspeita)' ||
                            _motivoSelecionado == 'Transação fraudulenta (confirmada)',
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Atenção: recomendamos notificar a instituição financeira envolvida.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Botões
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final valorTexto = _valorController.text;
                      final motivo = _motivoSelecionado;
                      final motivoPersonalizado = _motivoPersonalizadoController.text.trim();

                      if (valorTexto.isEmpty || valorTexto == 'R\$ 0,00') {
                        _mostrarDialogoErro(context, 'Informe um valor válido para devolução.');
                        return;
                      }

                      if (motivo == null) {
                        _mostrarDialogoErro(context, 'Selecione um motivo para a devolução.');
                        return;
                      }

                      if (motivo == 'Outro (especificar)' && motivoPersonalizado.isEmpty) {
                        _mostrarDialogoErro(context, 'Especifique o motivo da devolução.');
                        return;
                      }

                      // aqui vai a chamada real de backend ou API (simulada abaixo)
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Sucesso'),
                          content: const Text('Devolução realizada com sucesso.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0BBF6B),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Continuar', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Cancelar', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDialogoErro(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Erro'),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}