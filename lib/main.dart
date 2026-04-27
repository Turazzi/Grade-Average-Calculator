  import 'package:flutter/material.dart';

  void main() => runApp(MyApp());

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "Calculadora de Média de Notas",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        useMaterial3: true
        ),
        home: const CalculadoraMediaPage(),
      );
    }
  }

  class CalculadoraMediaPage extends StatefulWidget {
    const CalculadoraMediaPage({super.key});

    @override
    State<CalculadoraMediaPage> createState() => _CalculadoraMediaPageState();
  }

  class _CalculadoraMediaPageState extends State<CalculadoraMediaPage> {

    final _formKey = GlobalKey<FormState>();

    final TextEditingController nomeController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nota1Controller = TextEditingController();
    final TextEditingController nota2Controller = TextEditingController();
    final TextEditingController nota3Controller = TextEditingController();

    String nomeExibido = "";
    String emailExibido = "";
    String notasExibidas = "-  -";
    String mediaExibida = "";

    void calcularMedia() {
      if (_formKey.currentState!.validate()) {

        double n1 = double.parse(nota1Controller.text.replaceAll(',', '.'));
        double n2 = double.parse(nota2Controller.text.replaceAll(',', '.'));
        double n3 = double.parse(nota3Controller.text.replaceAll(',', '.'));

        double media = (n1 + n2 + n3) / 3;

        setState(() {
          nomeExibido = nomeController.text;
          emailExibido = emailController.text;
          notasExibidas = "${n1.toStringAsFixed(1)} - ${n2.toStringAsFixed(1)} - ${n3.toStringAsFixed(1)}";
          mediaExibida = media.toStringAsFixed(1);
        });
      }
    }

    void limparCampos() {
      _formKey.currentState?.reset();

      nomeController.text = '';
      emailController.text = '';
      nota1Controller.text = '';
      nota2Controller.text = '';
      nota3Controller.text = '';

      setState(() {
        nomeExibido = "";
        emailExibido = "";
        notasExibidas = "-  -";
        mediaExibida = "";
      });
    }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de Média de Nota"),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'CALCULADOR DE MÉDIA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 15),

                TextFormField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Digite o nome';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Digite o email';
                    if (!value.contains('@')) return 'Email inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nota1Controller,
                        decoration: const InputDecoration(labelText: 'Nota 1', border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Vazio';
                          String valTratado = value.replaceAll(',', '.');
                          double? nota = double.tryParse(valTratado);
                          if (nota == null) return 'Inválido';
                          if (nota > 10) return 'Máx 10';
                          if (nota < 0) return 'Mín 0';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: nota2Controller,
                        decoration: const InputDecoration(labelText: 'Nota 2', border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Vazio';
                          String valTratado = value.replaceAll(',', '.');
                          double? nota = double.tryParse(valTratado);
                          if (nota == null) return 'Inválido';
                          if (nota > 10) return 'Máx 10';
                          if (nota < 0) return 'Mín 0';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: nota3Controller,
                        decoration: const InputDecoration(labelText: 'Nota 3', border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Vazio';
                          String valTratado = value.replaceAll(',', '.');
                          double? nota = double.tryParse(valTratado);
                          if (nota == null) return 'Inválido';
                          if (nota > 10) return 'Máx 10';
                          if (nota < 0) return 'Mín 0';
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: calcularMedia,
                  child: const Text('CALCULA MÉDIA'),
                ),
                const SizedBox(height: 20),

                const Text('Resultado:', style: TextStyle(fontSize: 16)),
                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      const TextSpan(text: 'Nome: '),
                      TextSpan(
                        text: nomeExibido,
                        style: const TextStyle(fontWeight: FontWeight.bold), 
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      const TextSpan(text: 'Email: '),
                      TextSpan(
                        text: emailExibido,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      const TextSpan(text: 'Notas: '),
                      TextSpan(
                        text: notasExibidas,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),

                Text.rich(
                  TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      const TextSpan(text: 'Média: '),
                      TextSpan(
                        text: mediaExibida,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: limparCampos,
                  child: const Text('APAGA OS CAMPOS'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }