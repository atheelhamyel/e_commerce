
import 'package:e_commerce/models/catogry_model.dart';

class ProductModel {
  final String id ;
  final String imgUrl ;
  final String name ;
  final String description ;
  final double price ;
  final CategoryModel category ;
  bool isFavorite; 
  bool orders ;
   int counter;
   int timeorder ;
   double discount;

  ProductModel({required this.id,
   required this.imgUrl, 
   required this.name, 
    this.description = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    required this.price,
     required this.category,
      this.isFavorite = false,
      this.orders=false,
      this.counter=1,
      this.timeorder=0,
      this.discount=0,
      });

}
List<ProductModel> dummyProducts = [
  ProductModel(
      id: '1',
      category: dummyCategories[0],
      name: 'Nike Shose',
      imgUrl:'https://cdn.thewirecutter.com/wp-content/media/2024/05/runningshoesforyou-2048px-2251.jpg?auto=webp&quality=75&width=1024',
      price: 6.99,
      timeorder: 25,
      discount: 5,
      ),
  ProductModel(
      id: '2',
      category: dummyCategories[0],
      name: 'Chicken Burger',
      imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZO3NEN2-7NNGN6dDnEoxQ_YWoH7pl4SFjKQ&s',
      price: 5.99,
      timeorder: 30,
      discount: 5,),
  ProductModel(
      id: '3',
      category: dummyCategories[0],
      name: 'Cheese Burger',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6fCiI3PHP6Q79Yv7XclcOUhnHXbxewn9juw&s',
      price: 7.99,
      timeorder: 20,
      discount: 5.4,),
 
  ProductModel(
      id: '5',
      category: dummyCategories[2],
      name: 'Margreta Pizza',
      imgUrl:
          'https://media-cldnry.s-nbcnews.com/image/upload/t_social_share_1200x630_center,f_auto,q_auto:best/newscms/2023_17/1989442/230428-nike-vl-2x1.jpg',
      price: 8.99,
      timeorder: 25,
      discount: 6.6),
  
  ProductModel(
      id: '7',
      category: dummyCategories[1],
      name: 'Koshary',
      imgUrl:'https://i.pinimg.com/736x/f5/22/24/f52224178fd0aebdf04cd5ed628f6d5b.jpg',
      price: 6.99,
      timeorder: 10,
      discount: 8.4),
  ProductModel(
      id: '8',
      category: dummyCategories[3],
      name: 'Fried Chicken',
      imgUrl:
          'https://xcdn.next.co.uk/COMMON/Items/Default/Default/ItemImages/AltItemShot/315x472/235459s2.jpg',
      price: 7.99,
      timeorder: 15,
      discount: 7.2),
  ProductModel(
      id: '9',
      category: dummyCategories[3],
      name: 'Grilled Chicken',
      imgUrl:
          'https://assets.ajio.com/medias/sys_master/root/20231214/xIDk/657ad736afa4cf41f5cff63e/-473Wx593H-464531848-navy-MODEL.jpg',
      price: 9.99,
      timeorder: 20,
      discount: 5.7),
       ProductModel(
      id: '10',
      category: dummyCategories[1],
      name: 'Chicken Taco',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaFPTO7FxJ64kt3kDzkK2MSZKHEBR0n_dQiA&s',
      price: 10.99,
      timeorder: 17,
      discount: 10.8),
      ProductModel(
      id: '11',
      category: dummyCategories[1],
      name: 'Beef Taco',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX9NqzwZJgN1Z5DkmmH-x4vRO95pJD-IhqcA&s',
      price: 12.59,
      timeorder: 25,
      discount: 8.3),
      ProductModel(
      id: '12',
      category: dummyCategories[4],
      name: 'Starbucks Pink Drink',
      imgUrl:
          'https://oldnavy.gap.com/webcontent/0055/837/502/cn55837502.jpg',
      price: 5.69,
      timeorder: 7,
      discount: 8.3),
       ProductModel(
      id: '13',
      category: dummyCategories[4],
      name: 'Yellow Bird Drink',
      imgUrl:
          'https://m.media-amazon.com/images/I/71fc200IzaL._AC_UY1000_.jpg',
      price: 7.55,
      timeorder: 10,
      discount: 6.2),
      ProductModel(
      id: '14',
      category: dummyCategories[4],
      name: 'Ice Coffe',
      imgUrl:
          'https://lsco.scene7.com/is/image/lsco/125010373-front-pdp-ld?fmt=jpeg&qlt=70&resMode=sharp2&fit=crop,1&op_usm=0.6,0.6,8&wid=2000&hei=1840',
      price: 10.99,
      timeorder: 5,
      discount: 9.5), 
];
