// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, avoid_unnecessary_containers, empty_statements, duplicate_ignore, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';



//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------

class feed_depublicacoes extends StatefulWidget {
  const feed_depublicacoes({Key? key}) : super(key: key);

  @override
  State<feed_depublicacoes> createState() => _feed_depublicacoesState();
}

class _feed_depublicacoesState extends State<feed_depublicacoes> {
  var historias;

  @override
  void initState() {
    super.initState();

    historias = FirebaseFirestore.instance.collection('Historias');
  }

  //
  // Especificar a aparência de cada elemento da List
  //
  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];

    return Container(
      child: Column(
        children: [
          Container(
            //TITULO
            child: Text(
              titulo,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Container(
            //SUBTITULO
            child: Text(
              subtitulo,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              border: Border.all(
                color: Colors.orange.shade300,
                width: 30,
              ),
            ),
            child: Image.asset('lib/Img/thumbnail.jpg'),
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/esqueleto_publicacao',
                        arguments: item.id);
                  },
                  child: Text('Continuar lendo'))
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
        title: Text('Acervo'),
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blue.shade900,

      //
      // LISTAR os documentos da COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>(
          //fonte de dados (coleção)
          stream: historias.snapshots(),

          //exibir os dados retornados
          builder: (context, snapshot) {
            //verificar o estado da conexão
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Text('Não foi possível conectar ao Firestore'),
                );

              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              //se os dados foram recebidos com sucesso
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return exibirItemColecao(dados.docs[index]);
                    });
            }
          }),
    );
  }
}

//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------

