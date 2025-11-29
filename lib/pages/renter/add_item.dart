import 'package:flutter/material.dart';

class RenterAddItem extends StatefulWidget {
  const RenterAddItem({super.key});

  @override
  State<RenterAddItem> createState() => _RenterAddItemState();
}

class _RenterAddItemState extends State<RenterAddItem> {
  // 1. CONTROLLERS (To capture user input)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // 2. STATE VARIABLES
  String? _selectedCategory;
  final List<String> _categories = ['Electronic', 'Outdoor', 'Clothing', 'Furniture', 'Vehicles'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Details", // Or "Add Item"
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. IMAGE SECTION ---
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[50], // Very light grey placeholder
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // Placeholder Image
                      child: Image.network(
                        'https://m.media-amazon.com/images/I/41-aM730pFL._AC_UF894,1000_QL80_.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // "1/5" Indicator
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      "1 / 5",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Edit Pencil Button
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5D1049), // Burgundy
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. FORM FIELDS ---
            _buildLabel("Name"),
            _buildTextField(controller: _nameController, hint: "Insert here"),

            _buildLabel("Category"),
            _buildDropdown(),

            _buildLabel("Price"),
            _buildTextField(controller: _priceController, hint: "10", suffix: "RM/day"),

            _buildLabel("Deposit"),
            _buildTextField(controller: _depositController, hint: "20"),

            _buildLabel("Description"),
            _buildTextField(controller: _descriptionController, hint: "Insert here", maxLines: 5),

            _buildLabel("Location"),
            _buildTextField(controller: _locationController, hint: "Location"),

            const SizedBox(height: 30),

            // --- 3. BUTTONS (Save & Cancel) ---
            Row(
              children: [
                // SAVE BUTTON (Outlined)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      print("Save Clicked");
                      // TODO: Add Logic to Save to Firebase/Dummy
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF5D1049)), // Burgundy Border
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(color: Color(0xFF5D1049), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // CANCEL BUTTON (Filled)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5D1049), // Burgundy Fill
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---
  
  // 1. Label Helper
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  // 2. TextField Helper
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    String? suffix,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixText: suffix,
        suffixStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF5D1049)),
        ),
      ),
    );
  }

  // 3. Dropdown Helper
  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          hint: const Text("electronic", style: TextStyle(color: Colors.grey)),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: _categories.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
        ),
      ),
    );
  }
}