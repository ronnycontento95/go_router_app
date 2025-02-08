/*
The chat screen is intended to allow the user to chat with their matches
 */

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Color de fondo del AppBar
      ),
      body: Column(
        children: [
          // Lista de mensajes
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10, // Número de mensajes de ejemplo
              itemBuilder: (context, index) {
                // Alternar entre mensajes del usuario y del otro participante
                final isUserMessage = index % 2 == 0;
                return ChatBubble(
                  message: 'Mensaje de prueba $index',
                  isUserMessage: isUserMessage,
                );
              },
            ),
          ),

          // Campo de texto y botón de enviar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Campo de texto
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                    ),
                  ),
                ),

                // Botón de enviar
                const SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Lógica para enviar el mensaje
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para las burbujas de chat
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12.0),
            topRight: const Radius.circular(12.0),
            bottomLeft: isUserMessage
                ? const Radius.circular(12.0)
                : const Radius.circular(0),
            bottomRight: isUserMessage
                ? const Radius.circular(0)
                : const Radius.circular(12.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}