import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanlydaotao/common/widgets/image.dart';
import 'package:quanlydaotao/core/theme/app_colors.dart';
import 'package:quanlydaotao/core/theme/app_form_field.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    Key? key,
    this.controller,
    this.focusNode,
    this.validator,
    this.hintText,
  }) : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 60,
      child: TextFormField(
        // validator: _validatorAccount,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.tundora,
        ),
        controller: _controller,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {},

        decoration: AppFormField.inputDecorationLight.copyWith(
            hintText: widget.hintText ??"",
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray),
            prefixIcon: Container(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                Images.ic_person,
                height: 20,
                width: 20,
                // ignore: deprecated_member_use
                color: AppColors.grey666,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primaryHust, width: 1.0),
                borderRadius: BorderRadius.circular(15.0))),
      ),
    );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }
}
