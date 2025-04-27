

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green, // Set your primary color here
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login()
      // login
      //Clothes(leftText: 'Clothes Section'),
      // Set Login screen as the initial screen
    );
  }
}

// Login Screen
class Login extends StatelessWidget {
  const Login({super.key});

  Widget buildTopPart() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Image.asset(
          'assets/images/pexels-sora-shimazaki-5926213.jpg', // Ensure this image exists in assets
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildInputField({required String label, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            contentPadding: const EdgeInsets.all(5),
            prefixIcon: icon != null ? Icon(icon) : null,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Use the primary color here
        title: const Center(
          child: Text(
            'Login Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(12.0),
            children: [
              buildTopPart(),
              buildInputField(label: 'Enter Your Name', icon: Icons.person),
              buildInputField(label: 'Enter Your Email', icon: Icons.mail),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MyButton(
                        text: 'Login',
                        color: Colors.blueAccent,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WelcomePage()), // Fixed the name of the page
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to Signup Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Signup Screen
class Signup extends StatelessWidget {
  const Signup({super.key});

  Widget buildTopPart() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Image.asset(
          'assets/images/pexels-sora-shimazaki-5926213.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildInputField({required String label, TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.all(12),
          ),
          keyboardType: inputType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Use the primary color here
        title: const Center(
          child: Text(
            'Sign Up Screen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopPart(),
                buildInputField(label: "Enter Your Name"),
                buildInputField(label: "Email", inputType: TextInputType.emailAddress),
                buildInputField(label: "Confirm Email", inputType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Signup action
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 10),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.white,
                        height: 2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook),
                      iconSize: 70,
                      color: Colors.blue,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.google),
                      iconSize: 70,
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.amazon),
                      iconSize: 70,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable Button Widget
class MyButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPress;

  const MyButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        height: 45,
        elevation: 0,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          borderSide: BorderSide.none,
        ),
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}

// Welcome Page


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // State variable for bottom navigation index
  int _currentIndex = 0;

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    HomeScreen(),      // Home screen with product grid and range slider
    CategoriesScreen(), // Categories screen placeholder
    CartScreen(),       // Cart screen placeholder
    ProfileScreen(),    // Profile screen placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Welcome to Shop'),
      ),
      body: _screens[_currentIndex], // Display the current screen based on index

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Placeholder Screens

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Categories Screen', style: TextStyle(fontSize: 24)));
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cart Screen', style: TextStyle(fontSize: 24)));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24)));
  }
}

// Home Screen with Product Grid and Price Range

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Product data (mimicking the one in ProductGrid)
  final List<Map<String, String>> products = [
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'First Product',
      'price': '200',
      'old price': '150'
    },
    {
      'image': 'https://images.pexels.com/photos/59523/pexels-photo-59523.jpeg',
      'Name': 'Second Product',
      'price': '300',
      'old price': '250'
    },
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'Third Product',
      'price': '400',
      'old price': '350'
    },
    {
      'image': 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      'Name': 'Fourth Product',
      'price': '700',
      'old price': '650'
    },
  ];

  late double _minPrice;
  late double _maxPrice;
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _initializePriceRange();
  }

  void _initializePriceRange() {
    // Parse product prices and find the min and max prices
    List<double> prices = products.map((product) => double.parse(product['price']!)).toList();
    _minPrice = prices.reduce((a, b) => a < b ? a : b);
    _maxPrice = prices.reduce((a, b) => a > b ? a : b);
    _currentRangeValues = RangeValues(_minPrice, _maxPrice);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

            max: _maxPrice,
            min: _minPrice,
            divisions: ((_maxPrice - _minPrice) / 50).round(),
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
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
                ElevatedButton(onPressed: () {}, child: Text('All')),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Clothes(leftText: '')));
                  },
                  child: Text('Clothes'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Furniture')),
                ElevatedButton(onPressed: () {}, child: Text('Toys')),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Product Grid
          ProductGrid(
            products: products,
            minPrice: _currentRangeValues.start,
            maxPrice: _currentRangeValues.end,
          ),
        ],
      ),
    );
  }
}

// Product Grid Widget

class ProductGrid extends StatelessWidget {
  final List<Map<String, String>> products;

  final double maxPrice;
  final double minPrice;

  ProductGrid({ required this.maxPrice ,required this.products, required this.minPrice,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.90,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          double productPrice = double.parse(products[index]['price']!);

          // Only show product if its price is within the selected range
          if (productPrice >= minPrice && productPrice <= maxPrice) {
            return Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(products[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      products[index]['Name']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '\$${products[index]['price']}',
                          style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '\$${products[index]['old price']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Product purchased!')),
                          );
                        },
                        child: Text(
                          'Buy now !',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(); // Do not display product if it's outside the selected price range
          }
        },
      ),
    );
  }
}



// clothes sect




// SingleProductModel Class
class SingleProductModel {
  final String productName;
  final String productImage;

  final double productPrice;
  final double productOldPrice;
  final String productModel;
  final String productSecondImage;
  final String productThirdImage;
  final String productFourthImage;

  SingleProductModel({
    required this.productName,
    required this.productImage,
    required this.productModel,
    required this.productPrice,
    required this.productOldPrice,
    required this.productSecondImage,
    required this.productThirdImage,
    required this.productFourthImage,
  });
}

// Clothes Class
class Clothes extends StatefulWidget {
  final String leftText;

  Clothes({super.key, required this.leftText});

  final List<SingleProductModel> singleproductdat = [
    SingleProductModel(
      productImage: 'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg',
      productModel: 'Winter Collection',
      productName: 'Buy now!',
      productPrice: 40.0,
      productOldPrice: 50.0,
      productSecondImage: '',
      productThirdImage: '',
      productFourthImage: '',
    ),
    SingleProductModel(
      productImage: 'https://images.pexels.com/photos/1488463/pexels-photo-1488463.jpeg',
      productName: 'Buy now!',
      productModel: 'Spring Collection',
      productPrice: 55.0,
      productOldPrice: 65.0,
      productSecondImage: '',
      productThirdImage: '',
      productFourthImage: '',
    ),
    SingleProductModel(
      productImage: 'https://images.pexels.com/photos/373564/pexels-photo-373564.jpeg',
      productName: 'Buy now!',
      productModel: 'Summer Collection',
      productPrice: 30.0,
      productOldPrice: 40.0,
      productSecondImage: '',
      productThirdImage: '',
      productFourthImage: '',
    ),
    SingleProductModel(
      productImage: 'https://images.pexels.com/photos/2878765/pexels-photo-2878765.jpeg',
      productName: 'Buy now!',
      productModel: 'Casual Wear',
      productPrice: 25.0,
      productOldPrice: 35.0,
      productSecondImage: '',
      productThirdImage: '',
      productFourthImage: '',
    ),
    SingleProductModel(
      productImage: 'https://images.pexels.com/photos/994527/pexels-photo-994527.jpeg',
      productName: 'Buy now!',
      productModel: 'Autumn Collection',
      productPrice: 70.0,
      productOldPrice: 90.0,
      productSecondImage: '',
      productThirdImage: '',
      productFourthImage: '',
    ),
  ];

  @override
  State<Clothes> createState() => _ClothesState();
}

// _ClothesState Class
class _ClothesState extends State<Clothes> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Set<int> favoriteIndices = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void toggleFavorite(int index) {
    setState(() {
      if (favoriteIndices.contains(index)) {
        favoriteIndices.remove(index);
      } else {
        favoriteIndices.add(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: const [
                Icon(Icons.check_circle_outline, color: Colors.white),
                SizedBox(width: 10),
                Text('Thank you for liking our product!'),
              ],
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Clothes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          itemCount: widget.singleproductdat.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.90, // Adjust aspect ratio for better layout
          ),
          itemBuilder: (context, index) {
            final product = widget.singleproductdat[index];
            final isFavorite = favoriteIndices.contains(index);

            return Card(
              color: Colors.white, // Set card background color to white
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.network(
                          product.productImage,
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: () => toggleFavorite(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productModel,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${product.productPrice}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '\$${product.productOldPrice}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Product purchased!')),
                                );
                              },
                              child: Text(
                                'Buy now !',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.green.shade200,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //   ),
                        //   onPressed: () {},
                        //   child: Text(
                        //     product.productName,
                        //     style: const TextStyle(
                        //       fontSize: 14,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

