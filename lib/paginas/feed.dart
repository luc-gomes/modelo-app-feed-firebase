// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class feedconteudo extends StatefulWidget {
  const feedconteudo({ Key? key }) : super(key: key);

  @override
  State<feedconteudo> createState() => _feedconteudoState();
}

class _feedconteudoState extends State<feedconteudo> {
 var telaAtual = 0;
 var pageController = PageController();
 @override
 Widget build(BuildContext context) {
       return Scaffold(
        body: PageView(
        controller: pageController,
        children: 
        [
           
          Feed_historias(),
        ],
        onPageChanged: (index) {
        
          setState(() {
        
            telaAtual = index;
        
          });
        },
      ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Color.fromARGB(255, 155, 155, 153).withOpacity(.50),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
        currentIndex: telaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Opções',
          ),
        ],
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );

      
    
  }
}
//------------------------------------------------------------------------------

class Feed_historias extends StatefulWidget {
  const Feed_historias({ Key? key }) : super(key: key);

  @override
  _Feed_historiasState createState() => _Feed_historiasState();
}

class _Feed_historiasState extends State<Feed_historias> {
  var teste_publicacao;
  @override
  void initState() {
  super.initState();
  teste_publicacao = FirebaseFirestore.instance.collection('teste_publicacao');
  }
  exibirItemColecao(item) {
  String Titulo = item.data()['titulo'];
  String subtitulo = item.data()['subtitulo '];
   String texto = item.data()['texto'];
     //   String data = item.data()['data'];
  return Container(
      child: Column(
        children: 
        [
          Container(//TITULO 
          child:  Text(Titulo,
          style: const TextStyle(fontSize: 25),
          ),),
         
          Container(//SUBTITULO
            child: Text(subtitulo,
            style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
             child: Text(texto,
            style: const TextStyle(fontSize: 15),
            ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
              border: Border.all(
              color: Colors.orange.shade300,
              width: 30,
              
              
          ),
              ),
           // child:Image.asset('lib/Img/thumbnail.jpg'),
        ),
          
      Row(
        children:
        [
          IconButton(
            icon: const Icon(Icons.delete,
            size: 18.0,
            ),
            onPressed: () {
             teste_publicacao.doc(item.id).delete();
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit,
            size: 18.0,
            ),
            onPressed: (){
            Navigator.pushNamed(context, '/NovaPublicacao', arguments: item.id);
          },),
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
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        actions: [
         /* IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),*/
        ],
      ),
      backgroundColor: Color.fromARGB(255, 125, 157, 204),
      body: StreamBuilder<QuerySnapshot>(
          stream: teste_publicacao.snapshots(),
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
          Navigator.pushNamed(context, '/NovaPublicacao');
        },
      ),
    );
  }
}
