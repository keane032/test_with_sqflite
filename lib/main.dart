import 'package:flutter/material.dart';
import 'package:myvocation/src/app_widget.dart';
import 'package:myvocation/src/provider/quest_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),   
      ],
      child: MyApp(),
    ), 
  );
} 

 