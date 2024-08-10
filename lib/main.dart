import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        hintColor: Colors.indigo[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ToDoListScreen(),
    );
  }
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<String> toDoList = [];
  final List<String> completedList = [];
  final TextEditingController _textController = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                toDoList.clear();
                completedList.clear();
                message = 'Listas foram limpas!';
              });
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'To do List',
                style: TextStyle(
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Digite uma nova tarefa',
                    hintStyle: TextStyle(color: Colors.indigo[300]),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.indigo[50],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    String newTask = _textController.text;
                    if (newTask.isNotEmpty) {
                      toDoList.add(newTask);
                      message = '"$newTask" foi adicionado à lista!';
                      _textController.clear();
                    } else {
                      message = 'Por favor, insira uma tarefa.';
                    }
                  });
                },
                child: Text('Adicionar', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
              if (toDoList.isNotEmpty) ...[
                Text(
                  'Tarefas pendentes:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo) ?? 
                         TextStyle(fontSize: 20.0, color: Colors.indigo),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    final task = toDoList[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {
                                  setState(() {
                                    toDoList.removeAt(index);
                                    completedList.add(task);
                                    message = '"$task" foi marcado como concluído!';
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  task,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    toDoList.removeAt(index);
                                    message = '"$task" foi removido da lista!';
                                  });
                                },
                                child: Text('Excluir', style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
              if (completedList.isNotEmpty) ...[
                Text(
                  'Tarefas concluídas:',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.indigo) ?? 
                         TextStyle(fontSize: 20.0, color: Colors.indigo),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: completedList.length,
                  itemBuilder: (context, index) {
                    final completedTask = completedList[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {
                                  setState(() {
                                    completedList.removeAt(index);
                                    toDoList.add(completedTask);
                                    message = '"$completedTask" foi retornado à lista de pendentes!';
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  completedTask,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.0),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    completedList.removeAt(index);
                                    message = '"$completedTask" foi removido da lista de concluídos!';
                                  });
                                },
                                child: Text('Excluir', style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
