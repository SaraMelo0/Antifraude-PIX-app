import 'package:antifraude_pix/screens/pix-screens/valor-pix-page.dart';
import 'package:flutter/material.dart';

class PixPage extends StatefulWidget {
  const PixPage({super.key});

  @override
  State<PixPage> createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  final TextEditingController _pixKeyController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _pixKeyController.addListener(() {
      final isValid = isValidPixKey(_pixKeyController.text.trim());
      setState(() {
        _isButtonEnabled = isValid;
      });
    });
  }

  @override
  void dispose() {
    _pixKeyController.dispose();
    super.dispose();
  }


  // valida a chave Pix com base em vários formatos possíveis
  bool isValidPixKey(String input) {
    final cpfReg = RegExp(r'^\d{11}$');
    final cnpjReg = RegExp(r'^\d{14}$');
    final emailReg = RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w{2,4}$');
    final phoneReg = RegExp(r'^(\+55|55)?\d{10,11}$');
    final uuidReg = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$',
    );

    return cpfReg.hasMatch(input) ||
        cnpjReg.hasMatch(input) ||
        emailReg.hasMatch(input) ||
        phoneReg.hasMatch(input) ||
        uuidReg.hasMatch(input);
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Qual a chave pix?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF7F3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _pixKeyController,
                    decoration: const InputDecoration(
                      hintText: 'Digite aqui',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ValorPixPage()),
                      );
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
