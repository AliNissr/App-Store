class AllProductsModel
{
 final dynamic id;
 final String title;
 final dynamic price;
 final String description;
 final String category;
 final String image;
 final RatingModel? rating ;

  AllProductsModel(
      { required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating
      });

  factory AllProductsModel.fromjson(jsondata){
    return AllProductsModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: jsondata['price'],
      description: jsondata['description'],
      category: jsondata['category'],
      image: jsondata['image'],
      rating: jsondata['rating'] == null
          ? null
          : RatingModel.fromjson(jsondata['rating']),
    );
  }
}
class RatingModel {
  final dynamic rate;
  final int count;
  
  RatingModel({required this.rate,required this.count});

 factory RatingModel.fromjson(jsondata){
   return RatingModel(rate: jsondata['rate'] , count: jsondata['count']);
 }
}