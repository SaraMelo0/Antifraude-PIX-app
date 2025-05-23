import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:antifraude_pix/screens/pix-screens/devolucao-pix-page.dart';

class ValorPixPage extends StatefulWidget {
  const ValorPixPage({super.key});

  @override
  State<ValorPixPage> createState() => _ValorPixPageState();
}

class _ValorPixPageState extends State<ValorPixPage> {
  final TextEditingController _valueController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
      // ativa ou desativa o botão dependendo se o valor digitado é válido
    _valueController.addListener(() {
      setState(() {
        _isButtonEnabled = _valueController.text.trim().isNotEmpty &&
            _valueController.text.trim() != 'R\$ 0,00';
      });
    });
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

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
          'Pix',
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pagar à',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Fulaninho da Silva',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Instituição: Banco X'),
                const Text('Chave: +55 (00) 12345-6789'),
                const SizedBox(height: 24),
                const Text(
                  'Valor do pagamento',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),

                // campo de valor com borda verde e formatação em reais
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0BBF6B), width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _valueController,
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
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      _showConfirmDialog(context); // mostra o modal
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled
                    ? const Color(0xFF0BBF6B)
                    : Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// confimarção (modal)
void _showConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // impede fechar ao tocar fora do diálogo
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Color(0xFFDADADA), 
          ),
        ),
        contentPadding: const EdgeInsets.all(24),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Deseja devolver o PIX recebido?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Você está prestes a iniciar a devolução deste valor via PIX.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Atenção: ',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'esta não é a forma correta de devolução recomendada pelo sistema bancário.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Tem certeza de que deseja prosseguir?',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          // botão Cancelar
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Cancelar', style: TextStyle(color: Colors.white)),
          ),

          // botão Devolução
          TextButton(
            onPressed: () async {
              Navigator.of(context); // Para fechar o pop-up modal

              await Future.delayed(Duration.zero);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DevolucaoPixPage()), // Substitua por sua tela
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF0BBF6B),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Devolução', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
