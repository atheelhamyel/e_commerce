import 'package:e_commerce/uitls/app_colors.dart';
import 'package:e_commerce/views/pages/settinds_page.dart';
import 'package:e_commerce/views/widget/cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final int orderTime = 0;
  final int discount = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.grey2,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.freepik.com/256/3372/3372009.png'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Atheel Hamayel',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 80),
                  CupertinoListTile(
                    leading: const Icon(Icons.shopping_cart_outlined),
                    title: const Text('Orders'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                    backgroundColor: AppColor.white,
                  ),
                  CupertinoListTile(
                    leading: const Icon(Icons.card_giftcard),
                    title: const Text('Copones'),
                    onTap: () {},
                    trailing: const Icon(Icons.arrow_forward_ios),
                    backgroundColor: AppColor.white,
                  ),
                  const SizedBox(height: 10),
                  CupertinoListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return const Settings();
                          },
                        ),
                      );
                    },
                    backgroundColor: AppColor.white,
                  ),
                  CupertinoListTile(
                    title: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: AppColor.red,
                          ),
                    ),
                    leading: const Icon(
                      Icons.logout,
                      color: AppColor.red,
                    ),
                    backgroundColor: AppColor.white,
                    onTap: () {
                      SystemNavigator.pop()  ;                  },
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          right: 20,
          top: 570,
          child: CartWiget (),
        ),
      ],
    );
  }
}
