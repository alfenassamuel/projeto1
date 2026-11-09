import 'package:flutter/material.dart';
import 'cores.dart';

Map<String, String> usuarios = {"admin@uniube.br": "123456"};

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmaController = TextEditingController();

  void mostrarMensagem(String titulo, String mensagem, {bool sucesso = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cartao,
        title: Text(titulo, style: TextStyle(color: amarelo)),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (sucesso) Navigator.pop(context);
            },
            child: Text("OK", style: TextStyle(color: ciano)),
          ),
        ],
      ),
    );
  }

  void cadastrar() {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim().toLowerCase();
    String senha = senhaController.text;
    String confirma = confirmaController.text;

    if (nome.isEmpty || email.isEmpty || senha.isEmpty || confirma.isEmpty) {
      mostrarMensagem("Erro", "Preencha todos os campos!");
    } else if (!email.contains("@") || !email.contains(".")) {
      mostrarMensagem("Erro", "Digite um email válido!");
    } else if (senha.length < 6) {
      mostrarMensagem("Erro", "A senha deve ter pelo menos 6 caracteres!");
    } else if (senha != confirma) {
      mostrarMensagem("Erro", "As senhas não coincidem!");
    } else if (usuarios.containsKey(email)) {
      mostrarMensagem("Erro", "Este email já está cadastrado!");
    } else {
      usuarios[email] = senha;
      mostrarMensagem("Sucesso", "Cadastro realizado! Faça o login.",
          sucesso: true);
    }
  }

  InputDecoration campo(String texto, IconData icone) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white12,
      labelText: texto,
      labelStyle: TextStyle(color: Colors.white70),
      prefixIcon: Icon(icone, color: ciano),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: amarelo, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: rosa,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: fundo),
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person_add, size: 80, color: amarelo),
                SizedBox(height: 20),
                TextField(
                  controller: nomeController,
                  style: TextStyle(color: Colors.white),
                  decoration: campo("Nome", Icons.person),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: campo("Email", Icons.email),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: senhaController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: campo("Senha", Icons.lock),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: confirmaController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: campo("Confirmar senha", Icons.lock_outline),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: rosa,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  onPressed: cadastrar,
                  child: Text(
                    "CADASTRAR",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}