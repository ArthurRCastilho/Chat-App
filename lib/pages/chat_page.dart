import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return NotificationPage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.notifications),
              ),
              if (Provider.of<ChatNotificationService>(context).itemsCount > 0)
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    maxRadius: 10,
                    backgroundColor: Colors.red.shade800,
                    child: Text(
                      '${Provider.of<ChatNotificationService>(context).itemsCount}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),

      // Criação de floatingActionButton a fins de testes de notificação

      // É necessário dois imports para testar
      // import 'dart:math';
      // import 'package:chat/core/models/chat_notification.dart';

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(context, listen: false)
      //         .add(ChatNotification(
      //       title: 'Uma nova notificação',
      //       body: Random().nextDouble().toString(),
      //     ));
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
