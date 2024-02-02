import 'package:flutter/material.dart';

class SearchBarInput extends StatefulWidget {
  final String label;

  const SearchBarInput({Key? key, required this.label}) : super(key: key);

  @override
  State<SearchBarInput> createState() => _SearchBarInputState();
}

class _SearchBarInputState extends State<SearchBarInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(top: 20),
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          hintText: widget.label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
