import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaInicial()));
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("App da 3G"),
        actions: [Text("Aqui tem butão...")],
      ),
      body: ListView(
        reverse: true,
        children: [
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
          Text("Ola 5"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaFormulario()),
          ).then((aluno) {
            debugPrint("esse é meu aluno: " + aluno.nome);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TelaFormulario extends StatelessWidget {
  const TelaFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController telefone = TextEditingController();
    TextEditingController matricula = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("nome:"),
          TextField(controller: nome),
          Text("telefone:"),
          TextField(controller: telefone),
          Text("matricula:"),
          TextField(controller: matricula),
          ElevatedButton(
            onPressed: () {
              if (nome.text != '' &&
                  telefone.text != '' &&
                  matricula.text != '') {
                Aluno info = Aluno(nome.text, telefone.text, matricula.text);
                Navigator.pop(context, info);
              } else {
                debugPrint("Preencha todos os campos burrão");
              }
            },
            child: Text("Salvar"),
          ),
        ],
      ),
    );
  }
}

class Aluno {
  String nome;
  String telefone;
  String matricula;

  Aluno(this.nome, this.telefone, this.matricula);
}
