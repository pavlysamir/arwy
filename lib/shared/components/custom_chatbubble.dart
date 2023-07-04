
import 'package:flutter/material.dart';
class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text('hi mother fucker ' ,style: TextStyle(
            color: Colors.black
        ),
        ),
      ),
    );
  }
}
