// Exercici 5: Llista de missatges amb càrrega incremental en fer scroll al final
// En aquest fitxer afegim comentaris per descriure la lògica i els widgets utilitzats.
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
      home: const MessageListScreen(), // Pantalla principal amb la llista de missatges
    );
  }
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final List<Message> _messages = []; // Emmagatzema els missatges que es mostren
  final _random = Random(); // Utilitzat per triar noms aleatòriament

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
    _loadMoreMessages(); // Carrega un primer lot de missatges en iniciar la pantalla
  }

  void _loadMoreMessages() {
    // Genera un conjunt de missatges nous amb autors aleatoris
    final newMessages = List.generate(20, (index) {
      return Message(_names[_random.nextInt(_names.length)], _body);
    });
    setState(() {
      _messages.addAll(newMessages); // Afegeix els nous missatges a la llista existent
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message List')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          // Quan arriben al final del scroll, carreguem més missatges
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
                right: 60, // Espai extra a la dreta per no ocupar tot l'ample
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Color de fons del missatge
                borderRadius: BorderRadius.circular(8), // Cantonades arrodonides
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    msg.author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, // Destaquem el nom de l'autor
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(msg.body), // Cos del missatge
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Botó flotant (sense acció per ara)
        child: const Icon(Icons.add),
      ),
    );
  }
}
