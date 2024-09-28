import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final TextEditingController _textControl = TextEditingController();
  List<String> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white, fontFamily: 'FiraCode'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  textAlign: TextAlign.center,
                  softWrap: true,
                  'Olá, seja bem vindo! Adicione uma tarefa abaixo:',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'FiraCode',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'FiraCode'),
                      controller: _textControl,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontFamily: 'FiraCode'),
                        hintText: 'Digite a tarefa',
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_textControl.text.isNotEmpty) {
                        setState(() {
                          _tarefas.add(_textControl.text);
                          _textControl.clear();
                        });
                      }
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_tarefas.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Tarefas Pendentes:',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'FiraCode',
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            // Ajuste no ListView.builder dentro de um SingleChildScrollView
            ListView.builder(
              shrinkWrap:
                  true, // Permite que o ListView se ajuste dentro do SingleChildScrollView
              physics:
                  NeverScrollableScrollPhysics(), // Desativa a rolagem interna
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Aqui você pode marcar como concluída
                        },
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(.0),
                              child: Text(
                                _tarefas[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'FiraCode'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _tarefas.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.remove_circle, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Tarefas Concluídas',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Conteúdo adicional abaixo da lista
            SizedBox(height: 100), // Simulação de espaço extra
            Center(
              child: Text(
                'Mais conteúdo aqui...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
