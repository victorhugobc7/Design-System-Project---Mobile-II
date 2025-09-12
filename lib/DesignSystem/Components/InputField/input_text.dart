import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/shared/colors.dart';
import 'package:untitled/DesignSystem/shared/spacing.dart';
import 'package:untitled/DesignSystem/shared/styles.dart';
import 'input_text_view_model.dart';

class StyledInputField extends StatefulWidget {
  final InputTextViewModel viewModel;

  const StyledInputField._({Key? key, required this.viewModel}) : super(key: key);

  @override
  StyledInputFieldState createState() => StyledInputFieldState();

  static Widget instantiate({required InputTextViewModel viewModel}) {
    return StyledInputField._(viewModel: viewModel);
  }
}

class StyledInputFieldState extends State<StyledInputField> {
  late bool obscureText;
  String? errorMsg;

  @override
  void initState() {
    super.initState();
    obscureText = widget.viewModel.password;
    widget.viewModel.controller.addListener(validateInput);
  }

  void validateInput() {
    final errorText = widget.viewModel.validator?.call(widget.viewModel.controller.text);
    setState(() {
      errorMsg = errorText;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void dispose() {
    widget.viewModel.controller.removeListener(validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: extraSmall, horizontal: 24),
      filled: true,
      suffixIcon: widget.viewModel.password
          ? IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: togglePasswordVisibility,
            )
          : widget.viewModel.suffixIcon,
      fillColor: widget.viewModel.isEnabled ? white : gray_100,
      labelText: widget.viewModel.placeholder.isNotEmpty ? widget.viewModel.placeholder : null,
      labelStyle: labelTextStyle,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: gray_600),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: red_error),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: blue_500),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: gray_600),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: gray_500),
      ),
      errorText: errorMsg,
    );


    return Row(
      children: [
      widget.viewModel.title?.isNotEmpty != null ? Text(widget.viewModel.title as String, style: labelTextStyle) : SizedBox(),
      TextFormField(
        controller: widget.viewModel.controller,
          obscureText: obscureText,
          decoration: decoration,
          style: labelTextStyle,
          enabled: widget.viewModel.isEnabled,
        ),
      ],
    );
  }
}
