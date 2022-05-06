import 'package:flutter/material.dart';
import 'package:tcc/pages/menu/menu_do_usuario.dart';
import 'package:tcc/pages/menu/post_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var telaAtual = 0;
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: PageView(
        controller: pageController,
        children: const [
          lista_acervo_listview(),
          Painel_de_colecoes(),
        ],
        onPageChanged: (index) {
          setState(() {
           telaAtual = index;
          });
        },
      ),
      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.yellowAccent.withOpacity(.50),
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 40,
        //Index do Botão Selecionado
        currentIndex: telaAtual,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Opções',
          ),
        ],
        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}

class SystemChrome {
}
