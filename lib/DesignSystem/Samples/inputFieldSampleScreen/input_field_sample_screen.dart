import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/shared/styles.dart';
import '../../Components/InputField/input_text.dart';
import '../../Components/InputField/input_text_view_model.dart';

class InputFieldPage extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController passwordController3 = TextEditingController();
  
  InputFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styled Input Field Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('First Box', style: labelTextStyle,),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                  controller: passwordController1,
                  placeholder: '',
                  title: 'Tests',
                  password: true,
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Esse campo é obrigatório';
                    }
                    return null;
                  }
              ),
            )
            ]
        ),
      ),
    );
  }
}