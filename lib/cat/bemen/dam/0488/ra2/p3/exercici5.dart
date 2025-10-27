import 'dart:math';
import 'package:flutter/material.dart';

class Message {
  final String author;
  final String body;

  const Message(this.author, this.body);
}

/// Pantalla d'exercici 5
/// - Llista de missatges amb scroll infinit
/// - Botó flotant sense funcionalitat
class Exercici5 extends StatelessWidget {
  const Exercici5({super.key});

  // Dades de mostra
  static final List<String> _names = [
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

  // Generem una col·lecció de missatges aleatòria però estable
  static final List<Message> _seedMessages = (() {
    final rnd = Random(1337);
    return List.generate(
      100,
      (index) => Message(_names[rnd.nextInt(_names.length)], _body),
    );
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercici 5 · Missatges'),
      ),
      body: ListView.builder(
        // Sense itemCount per permetre scroll infinit
        itemBuilder: (context, index) {
          final msg = _seedMessages[index % _seedMessages.length];
          // Alternem costat per fer l'efecte de conversa
          final isMe = index % 5 == 0; // cada 5, com si fos teu
          return _MessageBubble(
            author: msg.author,
            body: msg.body,
            isMe: isMe,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // sense cap funcionalitat
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Exercici5App extends StatelessWidget {
  const Exercici5App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercici 5',
      home: const Exercici5(),
    );
  }
}

void main() {
  runApp(const Exercici5App());
}

class _MessageBubble extends StatelessWidget {
  final String author;
  final String body;
  final bool isMe;

  const _MessageBubble({
    required this.author,
    required this.body,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe
        ? Theme.of(context).colorScheme.primary
        : Colors.grey.shade300;
    final textColor = isMe ? Colors.white : Colors.black87;
    final crossAlign =
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    final avatar = CircleAvatar(
      child: Text(author.isNotEmpty ? author[0] : '?'),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) avatar,
          if (!isMe) const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: crossAlign,
              children: [
                Text(
                  author,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.circular(12).copyWith(
                      bottomLeft: Radius.circular(isMe ? 12 : 0),
                      bottomRight: Radius.circular(isMe ? 0 : 12),
                    ),
                  ),
                  child: Text(
                    body,
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          ),
          if (isMe) const SizedBox(width: 8),
          if (isMe) avatar,
        ],
      ),
    );
  }
}
