import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselHome extends StatefulWidget {
  const CarouselHome({super.key});

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  
  final List<String> imgList = [
    'https://img.freepik.com/free-photo/close-up-woman-holding-shopping-bags_23-2149220711.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1719014400&semt=ais_user',
    'https://img.freepik.com/free-photo/sale-retail-with-with-special-offer_23-2149656613.jpg?size=626&ext=jpg&ga=GA1.1.471830546.1721057613&semt=ais_user',
    'https://img.freepik.com/premium-vector/sale-girl-is-shouting-into-mouthpiece-about-start-shopping-sales_491047-267.jpg?w=1060',
    'https://img.freepik.com/free-photo/3d-rendering-3d-discount-numbers_52683-92343.jpg?ga=GA1.1.471830546.1721057613&semt=ais_user'
    'https://img.freepik.com/premium-photo/sale-products-with-discount_23-2150296321.jpg?ga=GA1.1.471830546.1721057613&semt=ais_user'
  ];

  List<Widget> get imageSliders => imgList
      .map((item) => Center(
        child: Image.network(item, fit: BoxFit.cover, width: 1000),
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}