// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class NovaHistoria extends StatefulWidget {
  const NovaHistoria({Key? key}) : super(key: key);

  @override
  NovaHistoriaState createState() => NovaHistoriaState();
}

class NovaHistoriaState extends State<NovaHistoria> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txtAutor = TextEditingController();
  var txtSinopse = TextEditingController();
  //
  // RETORNAR um ÚNICO DOCUMENTO a partir do ID
  //
  getDocumentById(id) async {
    await FirebaseFirestore.instance
        .collection('Historias')
        .doc(id)
        .get()
        .then((doc) {
      txtTitulo.text = doc.get('titulo');
      txtSubtitulo.text = doc.get('subtitulo');
      txtAutor.text = doc.get('autor');
      txtSinopse.text = doc.get('sinopse');
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR o ID do Café que foi selecionado pelo usuário
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      // TESTE DE EXISTENCIA DO DOCUMENTO NA BASE
      if (txtTitulo.text.isEmpty &&
          txtSubtitulo.text.isEmpty &&
          txtAutor.text.isEmpty &&
          txtSinopse.text.isEmpty) {
        getDocumentById(id);
      }
    }
    //
    // INICIO DA INTERFACE DE CADASTRO DE NOVAS "HISTORIAS"
    //

    //metodo publico dentro da classe
    Future<void> SalvarDocumento() async {
      if (id == null) {
        //
        // ADICIONAR um NOVO DOCUMENTO
        //
        FirebaseFirestore.instance.collection('Historias').add({
          'autor': txtAutor.text,
          'sinopse': txtSinopse.text,
          'subtitulo': txtSubtitulo.text,
          'titulo': txtTitulo.text,
        });
      } else {
        //
        // ATUALIZAR UM DOCUMENTO EXISTENTE
        //
        FirebaseFirestore.instance
            .collection('Historias')
            .doc(id.toString())
            .set({
          'autor': txtAutor.text,
          'sinopse': txtSinopse.text,
          'subtitulo': txtSubtitulo.text,
          'titulo': txtTitulo.text,
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Operação realizada com sucesso!'),
          duration: Duration(seconds: 2),
        ),
      );
      Navigator.pop(context);
   
   
   
   
   
    }

    return Scaffold(
      

      // ignore: unnecessary_new
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
              // ignore: unnecessary_new
              title: new Text(
                "Hello World",
                style: TextStyle(color: Colors.red.shade900),
              ),
        automaticallyImplyLeading: false,
 
   ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
            children: [
            TextField(
            // TITULO
              controller: txtTitulo,
              style: TextStyle(color: Colors.red.shade900, fontSize: 15),
              decoration: InputDecoration(
              labelText: 'Titulo',
              labelStyle: TextStyle(color:Colors.red.shade900, fontSize: 12),
              ),
            ),
          SizedBox(height: 30),
              TextField(
            // SUBTITULO
              controller: txtSubtitulo,
              style: TextStyle(color: Colors.red.shade900, fontSize: 15),
              decoration: InputDecoration(
              labelText: 'Subtitulo',
              labelStyle: TextStyle(color:Colors.red.shade900, fontSize: 12),
            ),
          ),
          SizedBox(height: 50),
              TextField(
            // AUTOR
              controller: txtAutor,
              style: TextStyle(color:Colors.red.shade900, fontSize: 15),
              decoration: InputDecoration(
              labelText: 'Autor',
              labelStyle: TextStyle(color: Colors.red.shade900, fontSize: 12),
            ),
          ),
          SizedBox(height: 50),
              TextField(
            // SINOPSE
              maxLines: 5,
              maxLength: 5000,
              controller: txtSinopse,
              style: TextStyle(color: Colors.red.shade900, fontSize: 15),
              decoration: InputDecoration(
              labelText: 'Sinopse',
              labelStyle: TextStyle(color: Colors.red.shade900, fontSize: 12),
            ),
          ),
          SizedBox(height: 120),
              Row(
            // LINHA COM BOTOES DE AÇÃO
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(// BOTOES DE AÇÃO
                  padding: EdgeInsets.all(5),
                  width: 150,
                  child: ElevatedButton(//BTN SALVAR
                  child:
                    Text('Salvar',
                      style: TextStyle(color: Colors.orange),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      SalvarDocumento();
                    },
                ),
              ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: 150,
                  child:
                    ElevatedButton(//BTN CANCELAR
                      child: Text('cancelar',
                      style: TextStyle(color: Colors.orange),
                      textAlign: TextAlign.center,
                  ),
                    onPressed: () {
                      
                      Navigator.pop(context);
                  
                  },
                ),
              ),
            ],
          ),

          
        ]),

        
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
           SalvarDocumento();
          // Add your onPressed code here!
        },
        label: const Text('Salvar Publicação'),
        icon: const Icon(Icons.save_as_rounded),
        backgroundColor: Colors.red,
      ),
    );
  }
}
