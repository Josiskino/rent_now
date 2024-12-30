import 'package:flutter/material.dart';

import '../utils/screen_size.dart';

class MagicTrackpadCard extends StatefulWidget {
  const MagicTrackpadCard({super.key});

  @override
  State<MagicTrackpadCard> createState() => _MagicTrackpadCardState();
}

class _MagicTrackpadCardState extends State<MagicTrackpadCard>
    with SingleTickerProviderStateMixin {
  bool isTrackpadVisible = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTrackpad() {
    setState(() {
      isTrackpadVisible = !isTrackpadVisible;
      if (isTrackpadVisible) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/images/img1.jpeg',
              height: SizeUtil.heightPercentage(50),
              fit: BoxFit.fitHeight,
            ),
          ),
          // Premier point marron avec cercle blanc
          Positioned(
            top: SizeUtil.heightPercentage(10.5),
            left: SizeUtil.widthPercentage(55.4),
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                color: Color.fromARGB(158, 238, 238, 238),
                //color: Color.fromARGB(220, 139, 69, 19), 
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          // Deuxième point marron avec cercle blanc
          Positioned(
            top: SizeUtil.heightPercentage(7.8),
            left: SizeUtil.widthPercentage(31),
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                //color: Color.fromARGB(220, 139, 69, 19),
                color: Color.fromARGB(158, 238, 238, 238),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          // Bouton de fermeture/ouverture
          Positioned(
            top: 275,
            right: 50,
            child: GestureDetector(
              onTap: _toggleTrackpad,
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(185, 224, 224, 224),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isTrackpadVisible ? Icons.close : Icons.remove_red_eye_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          // Container du Trackpad avec animation
          Positioned(
            top: 16,
            left: 10,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                height: SizeUtil.heightPercentage(25),
                width: SizeUtil.widthPercentage(30),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeUtil.heightPercentage(18),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/trackpad.png',
                          height: SizeUtil.heightPercentage(14),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeUtil.spacing(1)),
                    Text(
                      'MAGIC TRACK PAD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtil.textSize(2.8),
                      ),
                    ),
                    Text(
                      '\$134.4',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtil.textSize(2.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}