
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

// ignore: camel_case_types
class Painel_de_colecoes extends StatefulWidget {
  const Painel_de_colecoes({ Key? key }) : super(key: key);

  @override
  _Painel_de_colecoesState createState() => _Painel_de_colecoesState();
}

// ignore: camel_case_types
class _Painel_de_colecoesState extends State<Painel_de_colecoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
      title: Text('Menu'),
      backgroundColor: Colors.red,
      ),
      body:
      //-----------------------------------------body----------------------------
          Container(
            color: Colors.blue.shade700,
            child: GridView.count(          
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[


              //---------------------------------------blocos menu---------------
              Container(// NOVA HISTORIA
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                               Navigator.pushNamed(context, '/NovaHistoria');
                               Icon(Icons.favorite_border_sharp);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text('Nova historia',
                          style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade200,
              ),

              //---------------------------------------bloco1--------------------
              Container(// minhas historias
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.book_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Listar_acervo');
                          setState(() {
                            // colocar alguma a????o aqui
                            Icon(Icons.headphones);
                          });
                        },
                      ),
                    ),
                    Container(//TEXTO
                      
                      child: Text(
                        'Minhas Hitorias',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade200,
              ),

              //-------------------------------------------bloco2---------------
              Container( // ajuda
                
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.help_center_sharp),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          setState(() {
                            // colocar alguma a????o aqui
                            Icon(Icons.help_center_sharp);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                      
                      child: Text(
                        'ajuda',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade400,
              ),
              //---------------------------------------bloco3-------------------
              Container(//sobre

                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        icon: Icon(Icons.info_rounded),
                        iconSize: 60,
                        color: Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/sobre');
                          setState(() {
                             
                        /*    var obj = Dados(
                             var nome.text,
                              email.text,
                              nickname.text,
                            );
                            
                            */
                          
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                       
                      child: Text(
                        'sobre',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade400,
              ),

              //-----------------------------------bloco4-----------------------
              Container(//conta
 
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(//INCONE
                      child: IconButton(
                        //icon button sconta
                        icon: Icon(Icons.account_box_sharp),
                        iconSize: 60,
                        color:Colors.lightGreen.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/Minha_conta');
                          setState(() {
                            // colocar alguma a????o aqui
                            Icon(Icons.account_box_sharp);
                          });
                        },
                      ),
                    ),
                    Container(// TEXTO
                    
                      
                      child: Text(
                        'conta',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                color: Colors.yellow.shade600,
              ),

              //-----------------------------------bloco5------------------------
            
              //---------------------------------------------------------------
            ],
    ),
          ),
      );
  }
}
