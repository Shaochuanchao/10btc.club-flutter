

import 'package:client/tools/style/app_text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Center(
      child: Text("home hello",style: context.appBarTitle,),
    ));
  }
  
}