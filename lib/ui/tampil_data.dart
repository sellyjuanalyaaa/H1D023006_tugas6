import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
	final String name;
	final String nim;
	final int birthYear;

	const TampilData({super.key, required this.name, required this.nim, required this.birthYear});

	@override
	Widget build(BuildContext context) {
		final currentYear = DateTime.now().year;
		final age = currentYear - birthYear;
		final primary = Theme.of(context).colorScheme.primary;

		return Scaffold(
					appBar: AppBar(
						title: const Text('Perkenalan', style: TextStyle(color: Colors.white)),
						backgroundColor: primary,
					),
				body: Center(
					child: Padding(
						padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
						child: Column(
							mainAxisSize: MainAxisSize.min,
							children: [
								Icon(Icons.person, size: 72, color: primary),
								const SizedBox(height: 20),
								Text(
									'Nama saya $name',
									textAlign: TextAlign.center,
									style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
								),
								const SizedBox(height: 8),
								Text(
									'NIM: $nim',
									style: const TextStyle(fontSize: 16, color: Colors.black54),
								),
								const SizedBox(height: 12),
								Text(
									'Umur: $age tahun',
									style: const TextStyle(fontSize: 16),
								),
								const SizedBox(height: 24),
								ElevatedButton(
									onPressed: () => Navigator.pop(context),
									child: const Text('Kembali'),
									style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12)),
								),
							],
						),
					),
				),
		);
	}
}

