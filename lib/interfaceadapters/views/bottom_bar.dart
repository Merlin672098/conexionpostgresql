
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/global_variables.dart';
import '../../domain/provider/user_provider.dart';
import '../service/login_service.dart';


class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final userCartLen = context.watch<UserProvider>().user.cart.length;
    //String selectedUserId = Provider.of<UserProvider>(context, listen: false).user.type;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('E-Gob GAMT', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), 
            onPressed: () {
              LoginService().signOut(context); 
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio',style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              onTap: () {
                updatePage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file),
              title: const Text('Reclamos',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              onTap: () {
                updatePage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.adb),
              title: const Text('BOT',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              onTap: () {
                updatePage(2);
                Navigator.pop(context);
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.file_copy),
              title: const Text('Mis Reclamos',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              onTap: () {
                updatePage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _page,
        children: [
          //TokenPrinterWidget(),
          //Sepuedebanda(),
          //ListarHijosScreen(),
          //BotScreen(),

         // MisReclamosScreen(onNavigate: updatePage),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: GlobalVariables.backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_outlined,
                  color: _page == 0
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.unselectedNavBarColor),
              onPressed: () => updatePage(0),
            ),
           /*IconButton(
              icon: Icon(Icons.person_outline_outlined,
                  color: _page == 1
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.unselectedNavBarColor),
              onPressed: () => updatePage(1),
            ),*//*
/* */
            // ...

            badges.Badge(
              //badgeContent: Text(userCartLen.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined,
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor),
                onPressed: () => updatePage(2),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
