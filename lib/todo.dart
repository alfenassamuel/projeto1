import 'package:flutter/material.dart';
import 'cores.dart';

Map<String, List<Map<String, dynamic>>> tarefasPorDia = {};

class TodoPage extends StatefulWidget {
  final DateTime dia;

  TodoPage({Key? key, required this.dia}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController controller = TextEditingController();

  String get chave =>
      "${widget.dia.year}-${widget.dia.month}-${widget.dia.day}";

  List<Map<String, dynamic>> get tarefas {
    return tarefasPorDia.putIfAbsent(chave, () => []);
  }

  List<Map<String, dynamic>> get tarefasOrdenadas {
    List<Map<String, dynamic>> lista = List.from(tarefas);
    lista.sort((a, b) {
      if (a["feita"] != b["feita"]) {
        return a["feita"] ? 1 : -1;
      }
      return a["titulo"].toString().toLowerCase().compareTo(
            b["titulo"].toString().toLowerCase(),
          );
    });
    return lista;
  }

  void adicionar() {
    if (controller.text.isEmpty) return;
    setState(() {
      tarefas.add({"titulo": controller.text, "feita": false});
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final lista = tarefasOrdenadas;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarefas de ${widget.dia.day}/${widget.dia.month}/${widget.dia.year}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: rosa,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: fundo),
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      labelText: "Nova tarefa",
                      labelStyle: TextStyle(color: Colors.white70),
                      prefixIcon: Icon(Icons.edit, color: ciano),
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
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: amarelo,
                    foregroundColor: Colors.black,
                    minimumSize: Size(60, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: adicionar,
                  child: Icon(Icons.add, size: 28),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final tarefa = lista[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: cartao,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: tarefa["feita"] ? verde : vermelho,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(
                          tarefa["feita"] ? Icons.check_circle : Icons.cancel,
                          color: tarefa["feita"] ? verde : vermelho,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            tarefa["feita"] = !tarefa["feita"];
                          });
                        },
                      ),
                      title: Text(
                        tarefa["titulo"],
                        style: TextStyle(
                          color: tarefa["feita"] ? Colors.white54 : Colors.white,
                          fontSize: 16,
                          decoration: tarefa["feita"]
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: amarelo),
                        onPressed: () {
                          setState(() {
                            tarefas.remove(tarefa);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}