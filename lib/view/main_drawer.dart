import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            Container(
              child: Card(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://www.clipartkey.com/mpngs/m/82-824693_dummy-image-of-user.png',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
