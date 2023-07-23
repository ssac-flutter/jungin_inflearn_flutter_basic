import 'package:flutter/material.dart';

class SearchResultBarWidget extends StatelessWidget {
  const SearchResultBarWidget({super.key});

  // const SearchResultBarWidget({
  //   super.key,
  //   required TextEditingController controller,
  // }) : _controller = controller;

  // final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Color(int.parse('0xFFF3F6FC')),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
          // child: TextField(
          //   controller: _controller,
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: Color(int.parse('0xFFF3F6FC')),
          //     border: const OutlineInputBorder(
          //       borderSide: BorderSide.none,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(4),
          //         topRight: Radius.circular(0),
          //         bottomRight: Radius.circular(0),
          //         bottomLeft: Radius.circular(4),
          //       ),
          //     ),
          //   ),
          // ),
        ),
        const Row(
          children: [
            Text(
              '대한민국 원',
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        )
      ],
    );
  }
}
