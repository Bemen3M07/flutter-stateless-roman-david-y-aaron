import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// 🟦 1. FUNCIÓN PRINCIPAL
// ---------------------------------------------------------------------------
// Punto de entrada de la aplicación. Ejecuta la app de lista de la compra.
void main() => runApp(const ShoppingListApp());

// ---------------------------------------------------------------------------
// 🟦 2. WIDGET PRINCIPAL (StatelessWidget)
// ---------------------------------------------------------------------------
// Configura el MaterialApp y define la página inicial.
class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercici 2.6 - Llista de la compra', // Título para debugging
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Color principal de la app
      ),
      home: const ShoppingListPage(), // Página principal
    );
  }
}

// ---------------------------------------------------------------------------
// 🟦 3. MODELO DE DATOS
// ---------------------------------------------------------------------------
// Representa un elemento de la lista con nombre y cantidad
class ShoppingItem {
  final String name;
  final int quantity;

  ShoppingItem({required this.name, required this.quantity});
}

// ---------------------------------------------------------------------------
// 🟦 4. PÁGINA PRINCIPAL CON ESTADO
// ---------------------------------------------------------------------------
// Contiene la lógica para añadir y eliminar elementos de la lista.
class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  // Controladores de los campos de texto (nombre y cantidad)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // Lista que almacena los elementos añadidos
  final List<ShoppingItem> _items = [];

  @override
  void dispose() {
    // Liberar recursos de los controladores cuando se destruye el widget
    _nameController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------------------------
  // 🟦 5. MÉTODO PARA AÑADIR ELEMENTOS
  // -------------------------------------------------------------------------
  void _addItem() {
    final name = _nameController.text.trim(); // Nombre sin espacios
    final qtyText = _qtyController.text.trim(); // Cantidad como texto

    // Si el nombre está vacío, mostrar un mensaje y no añadir
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introdueix un nom')),
      );
      return;
    }

    // Convertir cantidad a número entero; si falla, usar 1
    int qty = 1;
    if (qtyText.isNotEmpty) {
      qty = int.tryParse(qtyText) ?? 1;
      if (qty <= 0) qty = 1; // Evitar cantidades no positivas
    }

    // Actualizar la lista y limpiar los campos de entrada
    setState(() {
      _items.add(ShoppingItem(name: name, quantity: qty));
      _nameController.clear();
      _qtyController.clear();
    });
  }

  // -------------------------------------------------------------------------
  // 🟦 6. MÉTODO PARA ELIMINAR ELEMENTOS
  // -------------------------------------------------------------------------
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index); // Elimina el elemento por índice
    });
  }

  // -------------------------------------------------------------------------
  // 🟦 7. CONSTRUCCIÓN DE LA INTERFAZ
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Llista de la compra'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Espaciado general
          child: Column(
            children: [
              // ---------------------------------------------------------------
              // 🟩 TARJETA CON CAMPOS DE ENTRADA Y BOTÓN "ADD"
              // ---------------------------------------------------------------
              Card(
                elevation: 2, // Sombra ligera
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      // Campo de texto para el nombre del artículo
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Campo de texto para la cantidad (numérico)
                      TextField(
                        controller: _qtyController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Botón para añadir el elemento a la lista
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: _addItem,
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(), // Botón redondeado
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // ---------------------------------------------------------------
              // 🟩 LISTA DE ELEMENTOS AÑADIDOS
              // ---------------------------------------------------------------
              Expanded(
                child: _items.isEmpty
                    // Texto indicativo si la lista está vacía
                    ? const Center(
                        child: Text('No hi ha elements. Afegeix-ne algun.'))
                    // Lista con separadores entre elementos
                    : ListView.separated(
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          return ListTile(
                            // Nombre del artículo
                            title: Text(item.name),
                            // Cantidad en un círculo
                            leading: CircleAvatar(
                              child: Text(item.quantity.toString()),
                            ),
                            // Botón para eliminar el elemento
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => _removeItem(index),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
