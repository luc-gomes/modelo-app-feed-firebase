// ignore: avoid_web_libraries_in_flutter

// ignore_for_file: prefer_const_constructors

 

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc/ARQUIVO/feedblocos_prototipobase.dart';
import 'package:tcc/pages/Tela_sobre.dart';
import 'package:tcc/pages/listar_acervo.dart';
import 'package:tcc/pages/menu/home.dart';
import 'package:tcc/pages/menu/post_list.dart';
import 'package:tcc/pages/menu/minhas_opcoes.dart';
 

import 'ARQUIVO/cadastro_CAFE.dart';
 
 
import 'pages/menu/menu_do_usuario.dart';
import 'paginas/POST.dart';
import 'paginas/edit_post.dart';
Future<void> main() async {
  //
  // INICIALIZAR OS Plugins
  //
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/HOME',
      routes: {
        
      
        '/FeedBlocos01': (context) => FeedBlocos01(),
        '/cadastro': (context) => CadastroPage(),
        '/menu_opcoes': (context) => Painel_de_colecoes(),
        '/NovaHistoria': (context) => EditPost(),
        '/Listar_acervo': (context) => Listar_acervo(),
        '/HOME': (context) => HomePage(),
        '/sobre': (context) => Tela_sobre(),
        '/Minha_conta': (context) => Minha_conta(),
        '/AcervoListview': (context) => lista_acervo_listview(),
          
         '/post': (context) => ViewPost(),
  
      },
    ),
  );
}
