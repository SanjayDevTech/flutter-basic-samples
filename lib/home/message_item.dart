import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/home/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;
  final String uId;

  const MessageItem({this.uId, this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Bubble(
      margin: BubbleEdges.symmetric(horizontal: 4, vertical: 10),
      alignment:
          (uId != message.senderUid) ? Alignment.topLeft : Alignment.topRight,
      nip: (uId != message.senderUid) ? BubbleNip.leftTop : BubbleNip.rightTop,
      color: (uId != message.senderUid) ? Colors.blue : Colors.green,
      child: Container(
        constraints: BoxConstraints(minWidth: 50, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.senderEmail, style: TextStyle(color: Colors.white60, fontSize: 15),),
            Text(message.msg, style: TextStyle(color: Colors.white, fontSize: 20),),
          ],
        ),
      )
    );
  }
}
