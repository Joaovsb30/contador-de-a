import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contador_de_a/main.dart'; // Importe o arquivo principal do seu projeto

void main() {
  testWidgets('Verificar contagem de letra "A"', (WidgetTester tester) async {
    // Inicializa o Widget MyApp para teste.
    await tester.pumpWidget(const MyApp());

    // Encontra o TextField pelo seu tipo.
    final textField = find.byType(TextField);

    // Simula a digitação de um texto no TextField.
    await tester.enterText(textField, 'Olá Mundo! Aaa');

    // Encontra o botão pelo seu texto.
    final botaoContar = find.text('Encontrar "A"');

    // Simula um toque no botão.
    await tester.tap(botaoContar);

    // Reconstrói o Widget para aplicar as mudanças.
    await tester.pump();

    // Encontra o Widget Text que exibe o resultado.
    final resultadoTexto = find.text('A letra "a" aparece 4 vezes na frase.');

    // Verifica se o texto de resultado está presente na tela.
    expect(resultadoTexto, findsOneWidget);
  });

  testWidgets('Verificar se não há letra "A"', (WidgetTester tester) async {
    // Inicializa o Widget MyApp para teste.
    await tester.pumpWidget(const MyApp());

    // Encontra o TextField pelo seu tipo.
    final textField = find.byType(TextField);

    // Simula a digitação de um texto no TextField.
    await tester.enterText(textField, 'Olá Mundo!');

    // Encontra o botão pelo seu texto.
    final botaoContar = find.text('Encontrar "A"');

    // Simula um toque no botão.
    await tester.tap(botaoContar);

    // Reconstrói o Widget para aplicar as mudanças.
    await tester.pump();

    // Encontra o Widget Text que exibe o resultado.
    final resultadoTexto =
        find.text('A letra "a" não foi encontrada na frase.');

    // Verifica se o texto de resultado está presente na tela.
    expect(resultadoTexto, findsOneWidget);
  });
}
