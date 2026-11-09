import 'package:flutter/material.dart';
import 'cores.dart';
import 'calendarpage.dart';
import 'cadastro.dart';

String email = "";
String senha = "";

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: fundo),
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.event_available, size: 90, color: amarelo),
                SizedBox(height: 10),
                Text(
                  "Minha Agenda",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.email, color: ciano),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: amarelo, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  onChanged: (text) {
                    senha = text;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white12,
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.lock, color: ciano),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: amarelo, width: 2),
                    ),
                  ),
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
                  onPressed: () {
                    String emailDigitado = email.trim().toLowerCase();
                    if (usuarios[emailDigitado] == senha) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: cartao,
                          title: Text("Erro", style: TextStyle(color: amarelo)),
                          content: Text("Email ou senha incorretos!"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK", style: TextStyle(color: ciano)),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastroPage()),
                    );
                  },
                  child: Text(
                    "Não tem conta? Cadastre-se",
                    style: TextStyle(color: amarelo, fontSize: 15),
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