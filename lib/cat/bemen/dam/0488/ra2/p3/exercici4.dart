// Exercici 4: Targeta de contacte bàsica amb avatar, nom i dades de contacte
// Afegim comentaris per documentar l'estructura i els widgets emprats sense canviar la lògica.
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
    // Creem l'objecte Contact amb les dades donades (immutable gràcies a const)
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
      backgroundColor: Colors.grey[100], // Color de fons suau per destacar la targeta
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto de perfil dins d'un cercle
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                'assets/images/davidtop.jpg', // Pots canviar la imatge
              ),
            ),
            const SizedBox(height: 16),
            // Nom complet del contacte
            Text(
              contact.fullName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Contenidor que simula una targeta amb email i telèfon
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 720), // Marge horitzontal ampli (maquetació d'exemple)
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.email, size: 20), // Icona per al correu
                      const SizedBox(width: 8),
                      Text(contact.email),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 20), // Icona per al telèfon
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
