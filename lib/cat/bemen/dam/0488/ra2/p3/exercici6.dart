// Exercici 6: Llista de missatges amb AppBar amb accions i BottomAppBar personalitzada
// Afegim comentaris per descriure cada secció de la UI i la càrrega incremental.
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
      home: const MessageListScreen(), // Pantalla principal
    );
  }
}

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final List<Message> _messages = []; // Llista de missatges renderitzats
  final _random = Random(); // Per escollir autors aleatoris

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
    _loadMoreMessages(); // Carreguem un primer batch en iniciar
  }

  void _loadMoreMessages() {
    // Crea 20 missatges nous i els afegeix a la llista existent
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
      appBar: AppBar(
        title: const Text('Message List'),
        actions: const [
          Icon(Icons.search), // Acció de cerca (no implementada)
          SizedBox(width: 12),
          Icon(Icons.more_vert), // Menú d'opcions (no implementat)
          SizedBox(width: 8),
        ],
      ),

      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            // Arribem al final del llistat, carreguem més
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
                right: 60, // Deixem marge a la dreta per estètica
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
                  Text(msg.body), // Contingut del missatge
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Botó flotant (placeholder)
        child: const Icon(Icons.add),
      ),

      // 👇 BottomAppBar personalizada
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade700, // Color de fons
        shape: const CircularNotchedRectangle(), // Corba per al FAB (opcional)
        notchMargin: 6, // Espai per al botó flotant
        child: SizedBox(
          height: 65, // Alçada personalitzada
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home, color: Colors.white, size: 28),
              Icon(Icons.message, color: Colors.white, size: 28),
              Icon(Icons.notifications, color: Colors.white, size: 28),
              Icon(Icons.settings, color: Colors.white, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
