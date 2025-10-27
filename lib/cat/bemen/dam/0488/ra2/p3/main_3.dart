import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  final String fullName;
  final String email;
  final String phone;

  const Contact({
    required this.fullName,
    required this.email,
    required this.phone,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Creem l'objecte Contact amb les dades donades
    const contact = Contact(
      fullName: 'David el Madrid',
      email: 'david@gamil.com',
      phone: '934578484',
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(contact: contact),
    );
  }
}

class ContactPage extends StatelessWidget {
  final Contact contact;

  const ContactPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto de perfil
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'assets/images/davidtop.jpg', // Pots canviar la imatge
              ),
            ),
            const SizedBox(height: 16),
            // Nom complet
            Text(
              contact.fullName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Targeta amb email i telèfon
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 720),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email, size: 20),
                      const SizedBox(width: 8),
                      Text(contact.email),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 20),
                      const SizedBox(width: 8),
                      Text(contact.phone),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
