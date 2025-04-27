import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Product Data
  List<Map<String, String>> product = [
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'First Product',
      'buybutton': 'Buy',
      'price': '\$200',
      'old price': '\$150'
    },
    {
      'image': 'https://images.pexels.com/photos/59523/pexels-photo-59523.jpeg',
      'Name': 'Second Product',
      'buybutton': 'Buy',
      'price': '\$300',
      'old price': '\$250'
    },
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'Third Product',
      'buybutton': 'Buy',
      'price': '\$400',
      'old price': '\$350'
    },
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'Fourth Product',
      'buybutton': 'Buy',
      'price': '\$600',
      'old price': '\$550'
    },
  ];

  // Range slider initial values
  RangeValues _currentRangeValues = const RangeValues(100, 700);

  // State variable to track the selected category
  String _selectedCategory = 'All';

  // Helper function to filter products based on the selected price range
  List<Map<String, String>> get filteredProducts {
    return product.where((item) {
      // Extract the numerical value from the price string
      int price = int.parse(item['price']!.replaceAll(RegExp(r'[^0-9]'), ''));
      return price >= _currentRangeValues.start && price <= _currentRangeValues.end;
    }).toList();
  }

  // Define the category button widget
  Widget categoryButton(String title) {
    bool isSelected = _selectedCategory == title;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = title;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected category: $title')),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        side: BorderSide(color: isSelected ? Colors.green : Colors.white, width: 2),
      ),
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                TextSpan(
                  text: 'To ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                TextSpan(
                  text: 'Shop',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
          // Price Range Selector
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Select Price Range:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        RangeSlider(
          activeColor: Colors.green,
          values: _currentRangeValues,
          min: 100,
          max: 700,
          divisions: 6,
          labels: RangeLabels(
            '\$${_currentRangeValues.start.round()}',
            '\$${_currentRangeValues.end.round()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),

        // Category Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryButton('All'),
              categoryButton('Clothes'),
              categoryButton('Furniture'),
              categoryButton('Toys'),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Product Grid with Filtered Products
        Padding(
        padding: const EdgeInsets.all(15),
    child: GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 12.0,
    mainAxisSpacing: 12.0,
    childAspectRatio: 1.0,
    ),
    itemCount: filteredProducts.length,
    itemBuilder: (context, index) {
    final products = filteredProducts[index];
    return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    image: DecorationImage(
    image: NetworkImage(products['image']!),
    fit: BoxFit.cover,
    ),
    ),
    ),
    const SizedBox(height: 8),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Text(
    products['Name']!,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
    overflow: TextOverflow.ellipsis,
    ),
    ),
    const SizedBox(height: 4),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    products['price']!,
    style: const TextStyle(fontSize: 14, color: Colors.green, fontWeight: FontWeight.bold),
    ),
    Text(
    products['old price']!,
    style: const TextStyle(fontSize: 12, color: Colors.red, decoration: TextDecoration.lineThrough),
    ),
    ],
    ),
    ),
    const SizedBox(height: 8),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green.shade200,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    child: const Text(
    'Buy now!',
    style: TextStyle(
    fontSize: 14,
    fontWeight: Font





    RangeValues _currentRangeValues = const RangeValues(200, 700);

    // Helper function to filter Welcome section products based on price range
    List<Map<String, String>> get filteredWelcomeProducts {
    return welcomeProducts.where((item) {
    int price = int.parse(item['price']!.replaceAll(RegExp(r'[^0-9]'), ''));
    return price >= _currentRangeValues.start && price <= _currentRangeValues.end;
    }).toList();
    }
