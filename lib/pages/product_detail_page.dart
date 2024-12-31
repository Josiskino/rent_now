import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../utils/screen_size.dart';
import '../entity/product.dart';
import 'seller_details_sheet.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.product.name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: SizeUtil.heightPercentage(6.5),
            width: SizeUtil.widthPercentage(6.5),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 58, 136, 61),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 18,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              // Container principal avec l'image et la galerie
              Container(
                width: double.infinity,
                height: SizeUtil.heightPercentage(60),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: Stack(
                  alignment: Alignment.topCenter, // Aligne les éléments en haut
                  children: [
                    // Image principale
                    Positioned(
                      top:
                          SizeUtil.heightPercentage(2), // Position à 5% du haut
                      child: SizedBox(
                        height: SizeUtil.heightPercentage(43),
                        width: SizeUtil.widthPercentage(95),
                        child: Image.asset(
                          widget.product.images[selectedImageIndex],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // Time container
                    Positioned(
                      top: 18,
                      left: 11,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: const Color.fromARGB(244, 252, 141, 72),
                          borderRadius: BorderRadius.circular(1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.product.time,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),

                    // Status container
                    Positioned(
                      top: 18,
                      left: 90,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: const Color.fromARGB(255, 58, 136, 61),
                          borderRadius: BorderRadius.circular(1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.product.status,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),

                    // Galerie d'images en bas
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: SizeUtil.heightPercentage(13),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.product.images.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImageIndex = index;
                                });
                              },
                              child: Container(
                                width: SizeUtil.widthPercentage(18),
                                height: SizeUtil.heightPercentage(12),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImageIndex == index
                                        ? const Color.fromARGB(255, 58, 136, 61)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors
                                      .white, // Fond blanc pour les miniatures
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    widget.product.images[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Détails du produit
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         widget.product.name,
              //         style: const TextStyle(
              //           fontSize: 24,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       Text(
              //         widget.product.price,
              //         style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.grey[700],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(height: SizeUtil.spacing(3)),
              //Information du vendeur
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 247, 244, 244),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Permet à la colonne de s'adapter à son contenu
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: SizeUtil.heightPercentage(13),
                          width: SizeUtil.widthPercentage(13),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/seller_logo.png",
                              fit: BoxFit.contain,
                              height: 36,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Peek shop',
                              style: TextStyle(
                                fontSize: SizeUtil.textSize(3.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color:
                                        const Color.fromARGB(255, 245, 144, 49),
                                    size: SizeUtil.iconSize(4),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                        fontSize: SizeUtil.textSize(3.2),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Créez une instance de SellerDetailsSheet
                            const sellerSheet = SellerDetailsSheet();
                            // Appelez la méthode showSellerDetails
                            sellerSheet.showSellerDetails(context);
                          },
                          child: Container(
                            height: SizeUtil.heightPercentage(5),
                            width: SizeUtil.widthPercentage(9),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: const Color.fromARGB(178, 158, 158, 158),
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    ReadMoreText(
                      widget.product.description,
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      lessStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      style: TextStyle(
                        fontSize: SizeUtil.textSize(3),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: SizeUtil.heightPercentage(13),
                    width: SizeUtil.widthPercentage(29),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(
                        color: const Color.fromARGB(178, 158, 158, 158),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HOURLY",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: SizeUtil.spacing(6)),
                          Text(
                            "\$20/H",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: SizeUtil.heightPercentage(13),
                    width: SizeUtil.widthPercentage(29),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 58, 136, 61),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DAILY",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: SizeUtil.spacing(6)),
                          Text(
                            "\$50/D",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: SizeUtil.heightPercentage(13),
                    width: SizeUtil.widthPercentage(29),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(
                        color: const Color.fromARGB(178, 158, 158, 158),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MONTHLY",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: SizeUtil.spacing(6)),
                          Text(
                            "\$200/M",
                            style: TextStyle(
                              fontSize: SizeUtil.textSize(3.8),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
