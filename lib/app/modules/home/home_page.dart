import 'package:cuidapet_mobile/app/core/rest_client/rest_client.dart';
import 'package:cuidapet_mobile/app/modules/core/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Home'),),
           body: Center(
             child: Column(
               children: [
                  TextButton(
                   onPressed: () async {
                     final result = await Modular.get<RestClient>().auth().get('/categories/');
                     print(result.data);
                   },
                   child: const Text('Teste Refresh Token'),
                 ),
                 TextButton(
                   onPressed: (){
                     Modular.get<AuthStore>().logout();
                   },
                   child: const Text('Logout'),
                 ),
               ],
             ),
           ),
       );
  }
}