import 'package:flutter/material.dart';
import '../../Components/Cards/ActionCard/action_card.dart';
import '../../Components/Cards/ActionCard/action_card_view_model.dart';



class cardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("card page Demo"),
      ),
      body: Text("Hi"),
    );
  }
}