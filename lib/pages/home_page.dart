import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../entity/product.dart';
import '../utils/screen_size.dart';
import 'custom_bottom_bar.dart';
import 'magic_track_pad_card.dart';
import 'product_card.dart';
import 'product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int selectedProductIndex = -1;

  final List<String> categories = [
    'ELECTRONICS',
    'TOOLS',
    'SPORTS',
    'ADVENTURE'
  ];

  final List<Product> products = [
    Product(
      name: 'Xbox One S',
      price: '\$204H',
      images: [
        'assets/images/xbox.png',
        'assets/images/JoyStick.png',
        'assets/images/game_box.png',
        'assets/images/game.png',
      ],
      status: 'Available',
      time: '2:43 PM',
      description:
          'Here you find a wide range of goods necessary for comfortable life and work. We offer quality equipment from leading brands designed to meet your every need. Our Xbox One S rental includes everything you need for an exceptional gaming experience. The sleek design of the console complements its powerful performance, delivering stunning 4K resolution for movies and smooth gameplay. Whether you\'re diving into thrilling adventures or hosting multiplayer nights with friends, the Xbox One S is the perfect choice. With access to a vast library of games and entertainment apps, this console ensures endless entertainment. Renting with us means convenience and affordability, with flexible plans to suit your schedule. Experience the best in gaming without the upfront cost—reserve your Xbox One S today!',
    ),
    Product(
      name: 'APPLE VISION',
      price: '\$534H',
      images: [
        'assets/images/casqueVr.png',
        'assets/images/VR2.png',
        'assets/images/VR3.png',
        'assets/images/VR1.png',
      ],
      status: 'Available',
      time: '11:30 AM',
      description:
          'Here you find a wide range of goods necessary for comfortable life and work. We offer quality equipment from leading brands designed to meet your every need. Our Xbox One S rental includes everything you need for an exceptional gaming experience. The sleek design of the console complements its powerful performance, delivering stunning 4K resolution for movies and smooth gameplay. Whether you\'re diving into thrilling adventures or hosting multiplayer nights with friends, the Xbox One S is the perfect choice. With access to a vast library of games and entertainment apps, this console ensures endless entertainment. Renting with us means convenience and affordability, with flexible plans to suit your schedule. Experience the best in gaming without the upfront cost—reserve your Xbox One S today!',
    ),
    Product(
      name: 'SONY PRO',
      price: '\$434H',
      images: [
        'assets/images/cam.png',
        'assets/images/Sony1.png',
        'assets/images/Sony3.png',
        'assets/images/Sony2.png',
      ],
      status: 'Available',
      time: '09:30 AM',
      description:
          'Here you find a wide range of goods necessary for comfortable life and work. We offer quality equipment from leading brands designed to meet your every need. Our Xbox One S rental includes everything you need for an exceptional gaming experience. The sleek design of the console complements its powerful performance, delivering stunning 4K resolution for movies and smooth gameplay. Whether you\'re diving into thrilling adventures or hosting multiplayer nights with friends, the Xbox One S is the perfect choice. With access to a vast library of games and entertainment apps, this console ensures endless entertainment. Renting with us means convenience and affordability, with flexible plans to suit your schedule. Experience the best in gaming without the upfront cost—reserve your Xbox One S today!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/rent_now.png',
          width: SizeUtil.widthPercentage(25),
          height: SizeUtil.heightPercentage(15),
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            icon: const Icon(Iconsax.setting),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Catégories horizontales
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemBuilder: (context, index) => _buildCategoryItem(
                    categories[index],
                    index == selectedIndex,
                    index,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Section principale avec l'image
            const MagicTrackpadCard(),

            const SizedBox(height: 8),

            // Section "New"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New',
                    style: TextStyle(
                      fontSize: SizeUtil.textSize(5),
                      fontWeight: FontWeight.bold,
                      //color: Color(0xFFF37E36),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'VIEW ALL',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 58, 136, 61),
                        fontSize: SizeUtil.textSize(3.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Liste horizontale de produits
            SizedBox(
              height: SizeUtil.heightPercentage(38),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product.name,
                    price: product.price,
                    imageAsset: product.images[0],
                    isSelected: selectedProductIndex == index,
                    onTap: () {
                      setState(() => selectedProductIndex = index);
                      // Navigation vers la page de détails
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }

  Widget _buildCategoryItem(String label, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 58, 136, 61)
              : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF18191D),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
