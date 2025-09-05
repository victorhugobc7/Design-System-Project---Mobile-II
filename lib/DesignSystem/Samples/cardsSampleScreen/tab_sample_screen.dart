import 'package:flutter/material.dart';
import '../../Components/Cards/ActionCard/action_card.dart';
import '../../Components/Cards/ActionCard/action_card_view_model.dart';



class cardPage extends StatelessWidget {
  final const cardPage({super.key});

  var ActionCard actionCard = ActionCard.instantiate(viewModel: viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("card page Demo"),
      ),
      body: actionCard,
      )
    );
  }
}