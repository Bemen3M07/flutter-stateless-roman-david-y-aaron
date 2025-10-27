import 'dart:math';
import 'package:flutter/material.dart';

class Message {
  final String author;
  final String body;

  Message(this.author, this.body);
}

void main() {
  runApp(const MessageListApp());
}

class MessageListApp extends StatelessWidget {
  const MessageListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message List',
      home: const MessageListScreen(),
    );
  }
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final List<Message> _messages = [];
  final _random = Random();

  final List<String> _names = [
    "Ellison Curry",
    "Briggs Willis",
    "Alexa Murphy",
    "Cameron Berry",
    "Annabelle Villarreal",
    "Nikolai Wiley",
    "Lauryn Morrow",
    "Kyree Hardy",
    "Wells Wilson",
    "Luna Foster",
    "Kayden Taylor",
    "Sofia Mann",
    "Nehemiah Randall",
    "Christina Gordon",
    "Karter Kramer",
    "Hanna Morales",
    "Megan Delarosa",
    "Osiris Johnson",
    "Emma Atkins",
    "Cason McKee",
    "Kori Walls",
    "Larry Shepherd",
  ];

  static const String _body =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ac vestibulum nunc.";

  @override
  void initState() {
    super.initState();
    _loadMoreMessages();
  }

  void _loadMoreMessages() {
    final newMessages = List.generate(20, (index) {
      return Message(_names[_random.nextInt(_names.length)], _body);
    });
    setState(() {
      _messages.addAll(newMessages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message List')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _loadMoreMessages();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            final msg = _messages[index];
            return Container(
              margin: const EdgeInsets.only(
                top: 6,
                bottom: 6,
                left: 8,
                right: 60, // 👈 espacio extra a la derecha para que no ocupe todo el ancho
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(msg.body),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
