// ignore_for_file: camel_case_types, duplicate_ignore, avoid_unnecessary_containers, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:tcc/paginas/POST.dart';

class lista_acervo_listview extends StatefulWidget {
  const lista_acervo_listview({Key? key}) : super(key: key);
  @override
  _lista_acervo_listviewState createState() => _lista_acervo_listviewState();
}

class _lista_acervo_listviewState extends State<lista_acervo_listview> {
  var historias;
  @override
  void initState() {
    super.initState();
    historias = FirebaseFirestore.instance.collection('Historias');
  }

  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];

    return Container(margin: EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                child: Text(
                  titulo,
                  style: TextStyle(height: 2, fontSize: 25),
                ),
              ),
              Container(
                child: Text(
                  subtitulo,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 7,
                  ),
                ),
                child: Image.asset('lib/Img/thumbnail.jpg'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 25.0,
                ),
                onPressed: () {
                  historias.doc(item.id).delete();
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  size: 25.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/NovaHistoria',
                      arguments: item.id);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.open_in_browser,
                  size: 25.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/post');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Publicações",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,

       
      ),
      backgroundColor: Colors.blue.shade300,
      body: StreamBuilder<QuerySnapshot>(
          stream: historias.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return exibirItemColecao(dados.docs[index]);
                    });
            }
          }),
   floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.yellow.shade600,
        backgroundColor: Colors.green.shade600,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/NovaHistoria');
        },
      ),

    );
  }
}
