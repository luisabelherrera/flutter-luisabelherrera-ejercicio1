import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildCard(
          context,
          imagePath: 'assets/vehicle_placeholder.png', 
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imagePath: 'assets/vehicle_placeholder.png',
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imagePath: 'assets/vehicle_placeholder.png',
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, {
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Editar'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Editar vehículo')),
                  );
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Eliminar'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Eliminar vehículo')),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}