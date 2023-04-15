import 'package:chatapplication/constants.dart';
import 'package:chatapplication/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
        List<Message> messagesList=[];

 Future< void> sendMessage({required String message, required String email}) async {
    try {
    messages.add(
      {kMessage: message, kCreatedAt: DateTime.now(), 'id': email},
    );
    } on Exception catch (e) {
      
    }
  }
 
 void getMessages()
 {
messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
  for (var doc in event.docs) {
    messagesList.add(Message.fromJson(doc));
  }
  print('success');
  emit(ChatSuccess(messages: messagesList));
 });
 }

}
