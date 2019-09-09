import 'chatItemModel.dart';
import 'dart:math';

 class ChatHelper {

   var _chatArray = [
     ChatItemModel("Walter", "Olá", "11/09/2018"),
     ChatItemModel("Ana", "Consagrado", "10/03/2019"),
     ChatItemModel("Bianca", "Risada", "11/09/2018"),
     ChatItemModel("Rafaela", "Tcc", "11/09/2018"),
     ChatItemModel("Rafaela", "Cabo a ideia", "11/09/2018"),
   ];

   getChatItem(){
    return _chatArray[Random().nextInt(_chatArray.length)];
   }

   getListSize(){
    return _chatArray.length;
   }
}