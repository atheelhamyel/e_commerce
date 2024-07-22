
class CategoryModel {
  final String id;
  final String name;
  final String imgUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

List<CategoryModel> dummyCategories = [
  CategoryModel(
    id: '1',
    name: 'Shoes',
    imgUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSiVEKp3-2jtOEyFQVKz-XKi3rg6HbIDCSc8efXsUBvLZwtuBFZ',),
  CategoryModel(
    id: '2',
    name: 'Bag',
    imgUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQhZ4DbAIbTj_hBoUyohEerJ5gYTx_8oE3WAl3wK_6V5cYqeHNA',
  ),
  CategoryModel(
    id: '3',
    name: 'T-shirt',
    imgUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSdvY5Law7_FqZJjJuP1QEaLXKYujoAgY1jtnSdQmt7bnDQv8JF',
  ),
  CategoryModel(
    id: '4',
    name: 'Jacket',
    imgUrl: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSQ57M9h9MxDAAIA9-dzG2v3P0cIgB3VJv7_jaqHf7z4bhLSa3X',
  ),
  CategoryModel(
    id: '5',
    name: 'jeans',
    imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JIl94qaT99t0w35eVObJp1Y93_R7gX6SLBNdaFLAPsgXDKFm',
  ),
];
