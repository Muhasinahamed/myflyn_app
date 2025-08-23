import 'package:flutter/material.dart';

class RequiredField extends StatefulWidget {
  final String title;
  final String? hint;
  final TextEditingController? controller;
  final bool obscure;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;

  const RequiredField({
    super.key,
    required this.title,
    this.hint,
    this.controller,
    this.obscure = false,
    this.onChanged,
    this.suffixIcon,
  });

  @override
  State<RequiredField> createState() => _RequiredFieldState();
}

class _RequiredFieldState extends State<RequiredField> {
  late final TextEditingController _ctrl;
  late final bool _ownController;

  @override
  void initState() {
    super.initState();
    _ownController = widget.controller == null;
    _ctrl = widget.controller ?? TextEditingController();
    _ctrl.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _ctrl.removeListener(_onTextChanged);
    if (_ownController) _ctrl.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {}); // to update suffix icon visibility if needed
    if (widget.onChanged != null) widget.onChanged!(_ctrl.text);
  }

  @override
  Widget build(BuildContext context) {
    // Title with required asterisk (orange)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: widget.title.replaceAll(' *', ''),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Color(0xFFFF8A00),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _ctrl,
          obscureText: widget.obscure,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: const OutlineInputBorder(),
            suffixIcon: _ctrl.text.isEmpty ? null : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
