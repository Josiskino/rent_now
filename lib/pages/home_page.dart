import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/screen_size.dart';
import 'custom_bottom_bar.dart';
import 'magic_track_pad_card.dart';
import 'product_card.dart';

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
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ProductCard(
                    title: 'XBOX ONE S',
                    price: '\$204H',
                    imageAsset: 'assets/images/xbox.png',
                    isSelected: selectedProductIndex == 0,
                    onTap: () => setState(() => selectedProductIndex = 0),
                  ),
                  ProductCard(
                    title: 'APPLE VISION',
                    price: '\$534H',
                    imageAsset: 'assets/images/casqueVr.png',
                    isSelected: selectedProductIndex == 1,
                    onTap: () => setState(() => selectedProductIndex = 1),
                  ),
                  ProductCard(
                    title: 'SONY PRO',
                    price: '\$434H',
                    imageAsset: 'assets/images/cam.png',
                    isSelected: selectedProductIndex == 2,
                    onTap: () => setState(() => selectedProductIndex = 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
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
