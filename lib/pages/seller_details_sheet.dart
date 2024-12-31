// seller_details_sheet.dart

import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../utils/screen_size.dart';

class SellerDetailsSheet extends StatelessWidget {
  const SellerDetailsSheet({super.key});

  void showSellerDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: SizeUtil.heightPercentage(88),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeUtil.heightPercentage(15),
                        width: SizeUtil.heightPercentage(15),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/seller_logo.png",
                              width: SizeUtil.heightPercentage(8.3),
                              height: SizeUtil.heightPercentage(8.3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeUtil.spacing(1)),
                      Text(
                        "Peek shop",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeUtil.textSize(6.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: SizeUtil.spacing(1)),
                      Text(
                        "Royal Ln. Mesa, New Jersey",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeUtil.textSize(4),
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeUtil.spacing(4)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/rent_now.png',
                      height: SizeUtil.heightPercentage(10),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: SizeUtil.spacing(1)),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Invite your friends and get a discount!  Bringa friend and get a discount on your purchases.",
                        style: TextStyle(
                          fontSize: SizeUtil.textSize(4.8),
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: Text(
                    //     "The more friends, the bigger the discount!",
                    //     style: TextStyle(
                    //       fontSize: SizeUtil.textSize(4.8),
                    //       color: Colors.grey[600],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: SizeUtil.spacing(5)),
                    DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 2, // Épaisseur de la bordure
                      dashPattern: const [
                        6,
                        3
                      ], // Longueur des tirets et des espaces
                      borderType: BorderType
                          .RRect, // Type de bordure (Rect, RRect, Circle)
                      radius: const Radius.circular(
                          5), // Rayon des coins (si RRect)
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: SizeUtil.heightPercentage(8),
                        alignment: Alignment.center,
                        child: Text(
                          "YOUR DISCOUNT: 20%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeUtil.textSize(4),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Ajoutez ici le contenu de votre bottom sheet
                SizedBox(height: SizeUtil.spacing(8.5)),
                Row(
                  children: [
                    SizedBox(
                      child: Stack(
                        children: [
                          buildProfilePicture(
                            const AssetImage(
                              "assets/images/avatar.jpg",
                            ),
                            0,
                          ),
                          buildProfilePicture(
                            const AssetImage(
                              "assets/images/avatar4.jpg",
                            ),
                            51,
                          ),
                          buildProfilePicture(
                            const AssetImage(
                              "assets/images/avatar5.jpg",
                            ),
                            105,
                          ),
                          buildProfilePicture(
                            const AssetImage(
                              "assets/images/avatar6.jpg",
                            ),
                            155,
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    // Container(
                    //   width: 20,
                    //   height: 20,
                    //   decoration: BoxDecoration(
                    //     borderRadius:
                    //         BorderRadius.circular(10),
                    //     color: Colors.black,
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 4.8),
                    //     child: Image.asset(
                    //       "",
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () => showSellerDetails(context),
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
    );
  }

  Widget buildProfilePicture(ImageProvider imageProvider, double offset) {
    return Transform.translate(
      offset: Offset(offset, 0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildButton(context);
  }
}
