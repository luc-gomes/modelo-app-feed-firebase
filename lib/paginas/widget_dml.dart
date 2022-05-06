// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class NovaPublicacao extends StatefulWidget {
  const NovaPublicacao({ Key? key }) : super(key: key);
  @override
   NovaPublicacaoState createState() =>  NovaPublicacaoState();
}

class  NovaPublicacaoState extends State<NovaPublicacao> {
  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();
  var txttexto = TextEditingController();

  //
  // RETORNAR um ÚNICO DOCUMENTO a partir do ID
  //
  getDocumentById(id) async{
    await FirebaseFirestore.instance.collection('teste_publicacao')
      .doc(id).get().then((doc) {
        txtTitulo.text = doc.get('titulo');
        txtSubtitulo.text = doc.get('subtitulo');
        txttexto.text = doc.get('texto');
       
      });
  }
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;
    if (id != null){ // TESTE DE EXISTENCIA DO DOCUMENTO NA BASE
      if (txtTitulo.text.isEmpty && txtSubtitulo.text.isEmpty && txttexto.text.isEmpty ){
        getDocumentById(id);
      }
    }
    //
    // INICIO DA INTERFACE DE CADASTRO DE NOVAS "HISTORIAS"
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca_S2'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField( // TITULO
            controller: txtTitulo,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 25),
            decoration: InputDecoration(
              labelText: 'Titulo',
              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
          ),
          SizedBox(height: 30),
          TextField( // SUBTITULO
            controller: txtSubtitulo,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 19),
            decoration: InputDecoration(
              labelText: 'Subtitulo',
              labelStyle: TextStyle(color: Color.fromARGB(255, 3, 3, 3), fontSize: 19),
            ),
          ),
          SizedBox(height: 50),
          
          TextField(// texto
            maxLines: 5,
            maxLength: 100,
            controller: txttexto,
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
            decoration: InputDecoration(
              labelText: 'escreva aqui:',
              labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
            ),
          ),
          SizedBox(height: 100),
          Row( // LINHA COM BOTOES DE AÇÃO
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // BOTOES DE AÇÃO
                padding: EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton(//BTN SALVAR
                   child: Text('Salvar',
                   style: TextStyle(
                           color: Colors.orange),
                      textAlign: TextAlign.center,
                      ),
                  onPressed: () {

                    if (id == null){
                      //
                      // ADICIONAR um NOVO DOCUMENTO
                      //
                      FirebaseFirestore.instance.collection('teste_publicacao').add({
                        'titulo': txtTitulo.text,
                        'subtitulo': txtSubtitulo.text,
                        'texto': txtTitulo.text,
                      });
                    }else{
                      //
                      // ATUALIZAR UM DOCUMENTO EXISTENTE
                      //
                      FirebaseFirestore.instance.collection('teste_publicacao').doc(id.toString()).set({
                        'titulo': txtTitulo.text,
                        'subtitulo': txtSubtitulo.text,
                        'texto': txtTitulo.text,
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                    },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: ElevatedButton( //BTN CANCELAR
                   child: Text('cancelar',
                   style: TextStyle(
                            color: Colors.orange),
                            textAlign: TextAlign.center,),
                    onPressed: () {
                      Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );

  }
}