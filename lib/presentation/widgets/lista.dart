import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
        const SizedBox(height: 16),
        _buildCard(
          context,
          imageType: ImageType.asset,
          imagePath: 'assets/R.png',
          title: 'Placa: ERF888',
          subtitle: 'Conductor: Juan Carlos\nEmpresa: XYZ',
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, {
    required ImageType imageType,
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
            leading: _buildImage(imageType, imagePath),
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

  Widget _buildImage(ImageType imageType, String imagePath) {
    switch (imageType) {
      case ImageType.asset:
        return Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Detailed error loading image: $error');
            print('StackTrace: $stackTrace');
            print('Image path attempted: $imagePath');
            return Icon(Icons.error, color: Colors.red);
          },
        );
      case ImageType.icon:
        return Icon(Icons.car_repair, size: 50, color: Colors.grey);
      case ImageType.network:
        return Image.network(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            print('Error loading network image: $error');
            print('StackTrace: $stackTrace');
            return Icon(Icons.error, color: Colors.red);
          },
        );
    }
  }
}

enum ImageType { asset, icon, network }