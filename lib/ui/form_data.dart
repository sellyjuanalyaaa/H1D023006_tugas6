import 'package:flutter/material.dart';
import 'tampil_data.dart';

class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});

  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
	final _formKey = GlobalKey<FormState>();
	final TextEditingController _nameController = TextEditingController();
	final TextEditingController _nimController = TextEditingController();
	final TextEditingController _yearController = TextEditingController();

	@override
	void dispose() {
		_nameController.dispose();
		_nimController.dispose();
		_yearController.dispose();
		super.dispose();
	}

	void _submit() {
		if (_formKey.currentState?.validate() ?? false) {
			final name = _nameController.text.trim();
			final nim = _nimController.text.trim();
			final year = int.tryParse(_yearController.text.trim());

			if (year == null) {
				ScaffoldMessenger.of(context).showSnackBar(
					const SnackBar(content: Text('Tahun lahir harus berupa angka')),
				);
				return;
			}

			Navigator.push(
				context,
				MaterialPageRoute(
					builder: (context) => TampilData(
						name: name,
						nim: nim,
						birthYear: year,
					),
				),
			);
		}
	}

		@override
		Widget build(BuildContext context) {
			final primary = Theme.of(context).colorScheme.primary;

			return Scaffold(
						appBar: AppBar(
							title: const Text('Input Data', style: TextStyle(color: Colors.white)),
							elevation: 0,
					// subtle gradient
					flexibleSpace: Container(
						decoration: BoxDecoration(
							gradient: LinearGradient(
								colors: [primary, primary.withOpacity(0.85)],
								begin: Alignment.topLeft,
								end: Alignment.bottomRight,
							),
						),
					),
				),
				body: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Form(
						key: _formKey,
						child: SingleChildScrollView(
							child: Card(
								elevation: 6,
								shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
								child: Padding(
									padding: const EdgeInsets.all(16.0),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.stretch,
										children: [
											const Center(
												child: CircleAvatar(
													radius: 36,
													backgroundColor: Colors.white,
													child: Icon(Icons.person, size: 40, color: Colors.black54),
												),
											),
											const SizedBox(height: 12),
											Text(
												'Masukkan informasi Anda',
												textAlign: TextAlign.center,
												style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]),
											),
											const SizedBox(height: 16),
											TextFormField(
												controller: _nameController,
												decoration: InputDecoration(
													labelText: 'Nama',
													prefixIcon: const Icon(Icons.person),
													border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
													filled: true,
													fillColor: Colors.grey[50],
												),
												validator: (v) => (v == null || v.trim().isEmpty) ? 'Nama tidak boleh kosong' : null,
											),
											const SizedBox(height: 12),
											TextFormField(
												controller: _nimController,
												decoration: InputDecoration(
													labelText: 'NIM',
													prefixIcon: const Icon(Icons.badge),
													border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
													filled: true,
													fillColor: Colors.grey[50],
												),
												validator: (v) => (v == null || v.trim().isEmpty) ? 'NIM tidak boleh kosong' : null,
											),
											const SizedBox(height: 12),
											TextFormField(
												controller: _yearController,
												decoration: InputDecoration(
													labelText: 'Tahun Lahir',
													prefixIcon: const Icon(Icons.calendar_today),
													border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
													filled: true,
													fillColor: Colors.grey[50],
												),
												keyboardType: TextInputType.number,
												validator: (v) {
													if (v == null || v.trim().isEmpty) return 'Tahun lahir tidak boleh kosong';
													final parsed = int.tryParse(v.trim());
													if (parsed == null) return 'Masukkan angka yang valid';
													return null;
												},
											),
											const SizedBox(height: 20),
											ElevatedButton(
												onPressed: _submit,
												style: ElevatedButton.styleFrom(
													padding: const EdgeInsets.symmetric(vertical: 14),
													shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
													elevation: 4,
												),
												child: const Text('Simpan', style: TextStyle(fontSize: 16)),
											),
										],
									),
								),
							),
						),
					),
				),
			);
		}
}

