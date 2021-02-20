import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_samples/home/message.dart';
import 'package:flutter_basic_samples/home/message_item.dart';

class MessagesList extends StatelessWidget {
  final uId = FirebaseAuth.instance.currentUser.uid;
  final messages = [
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2',
      msg: 'Hi Hello Message Hello How are You Flutter Chat Message',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2l',
      msg: '.',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2',
      msg: 'Hi Hello Message Hello How are You Flutter Chat Message',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2l',
      msg: '.',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2',
      msg: 'Hi Hello Message Hello How are You Flutter Chat Message',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2l',
      msg: '.',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2',
      msg: 'Hi Hello Message Hello How are You Flutter Chat Message',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2l',
      msg: '.',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2',
      msg: 'Hi Hello Message Hello How are You Flutter Chat Message',
    ),
    Message(
      senderEmail: 'sureshsanjay805@gmail.com',
      senderUid: 'l6Ek83Cf8wgUgVTelZdFbe4GrRY2l',
      msg: '.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) => MessageItem(uId: uId, message: messages[index]),
    );
  }
}
