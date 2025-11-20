import 'package:flutter/material.dart';

// Punto de entrada de la aplicación.
// Ejecuta la app que muestra la lista de la compra.
void main() => runApp(const ShoppingListApp());

// Widget principal sin estado que configura MaterialApp.
class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título que aparece en el árbol de widgets (útil para debugging).
      title: 'Exercici 2.6 - Llista de la compra',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // La página principal de la app es ShoppingListPage.
      home: const ShoppingListPage(),
    );
  }
}

// Modelo simple para representar un elemento de la lista: nombre y cantidad.
class ShoppingItem {
  final String name;
  final int quantity;

  ShoppingItem({required this.name, required this.quantity});
}

// Página con estado que contiene la lógica de añadir/mostrar elementos.
class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  // Controladores para los campos de texto (nombre y cantidad).
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();

  // Lista en memoria que guarda los elementos añadidos.
  final List<ShoppingItem> _items = [];

  @override
  void dispose() {
    // Liberar recursos de los controladores cuando el widget se destruye.
    _nameController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  // Añade un elemento a la lista. Valida el nombre y normaliza la cantidad.
  void _addItem() {
    final name = _nameController.text.trim();
    final qtyText = _qtyController.text.trim();

    // Si no hay nombre, mostramos un SnackBar y no hacemos nada.
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introdueix un nom')),
      );
      return;
    }

    // Intentamos obtener la cantidad como entero; si falla, usamos 1 por defecto.
    int qty = 1;
    if (qtyText.isNotEmpty) {
      qty = int.tryParse(qtyText) ?? 1;
      if (qty <= 0) qty = 1; // evitar cantidades no positivas.
    }

    // Actualizamos el estado: añadimos el nuevo elemento y limpiamos campos.
    setState(() {
      _items.add(ShoppingItem(name: name, quantity: qty));
      _nameController.clear();
      _qtyController.clear();
    });
  }

  // Elimina un elemento por su índice en la lista.
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Estructura principal de la pantalla: AppBar + formulario + lista.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Llista de la compra'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Tarjeta que contiene los campos de entrada y el botón "Add".
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      // Campo para el nombre del artículo.
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Campo para la cantidad; usa teclado numérico.
                      TextField(
                        controller: _qtyController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Botón para añadir el elemento: llama a _addItem.
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: _addItem,
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Área expandible donde se muestra la lista de elementos añadidos.
              Expanded(
                child: _items.isEmpty
                    // Texto indicativo si la lista está vacía.
                    ? const Center(child: Text('No hi ha elements. Afegeix-ne algun.'))
                    // ListView con separador entre elementos.
                    : ListView.separated(
                        itemCount: _items.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = _items[index];
                          // Cada entrada muestra nombre, cantidad y botón eliminar.
                          return ListTile(
                            title: Text(item.name),
                            leading: CircleAvatar(
                              child: Text(item.quantity.toString()),
                            ),
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
