import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey, // Define a cor base do tema.
        ),
        useMaterial3: true,
      ),
      title: 'Contador de Letra "A"', // Título do aplicativo.
      home: const ContadorDeA(), // Define o Widget inicial da tela.
    );
  }
}

class ContadorDeA extends StatefulWidget {
  const ContadorDeA({super.key});

  @override
  _ContadorDeAState createState() => _ContadorDeAState();
}

class _ContadorDeAState extends State<ContadorDeA> {
  // Controlador para o campo de texto, permitindo gerenciar o seu valor.
  final TextEditingController _textEditingController = TextEditingController();
  // String que armazena o resultado da contagem de letras "A".
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Letra "A"'), // Título da barra de app.
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para o usuário digitar a frase.
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: 'Digite uma frase', // Rótulo do campo de texto.
              ),
            ),
            const SizedBox(height: 20),
            // Linha para organizar o botão horizontalmente.
            Row(
              children: [
                // Widget Expanded para ocupar o espaço disponível na linha.
                Expanded(
                  child: ElevatedButton.icon(
                    // Botão com estilo customizado.
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey, // Cor de fundo.
                        elevation: 0,
                        shape: const RoundedRectangleBorder()),
                    // Função chamada ao pressionar o botão.
                    onPressed: () {
                      _contarLetraA();
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    // Texto do botão.
                    label: const Text(
                      'Encontrar "A"',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Texto que exibe o resultado da contagem.
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18), // Estilo do texto.
            ),
          ],
        ),
      ),
    );
  }

  // Função que conta as ocorrências da letra "A" na frase digitada.
  void _contarLetraA() {
    // Obtém o texto do campo de texto e converte para minúsculas.
    String texto = _textEditingController.text.toLowerCase();
    // Conta as ocorrências da letra "a" usando split.
    int contagem = texto.split('a').length - 1;

    // Atualiza o estado do Widget com o resultado da contagem.
    setState(() {
      if (contagem > 0) {
        _resultado = 'A letra "a" aparece $contagem vezes na frase.';
      } else {
        _resultado = 'A letra "a" não foi encontrada na frase.';
      }
    });
  }
}
