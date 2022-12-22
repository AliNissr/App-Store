import 'package:flutter/material.dart';
import 'package:storeapp/models/all_products_model.dart';
import 'package:storeapp/pages/product_the_page.dart';
class WidgetContainerCard extends StatelessWidget {
  // WidgetContainerCard({required this.product});
  //List<AllProductsModel> product;
  WidgetContainerCard(this.product);
  AllProductsModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductThePages.id , arguments: product);
      },
      child: Container(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    /*
                    * 1- هذه ال (boxShadow) الخاصية تعمل على طلب لست من نوع البوكس شادو وفيها تفاصيل عديده
                    * أ- هذه ال (Colors.purple.withOpacity(.6)) هذه الفكشن تاخذ قيم double محصورة بين 1 _ 0 تقوم بزيادة وتقليل شدة اللون
                    * ب_ هذه ال ( blurRadius: 10) خاصية تعمل على تثخين وتخفيف الضل
                    * ج_ هذه ال ( spreadRadius: 10) الخاصية تعمل على زيادة ونقصان حجم الضلال
                    * د_ هذه ال (offset: Offset(10 , 100)) الخاصية تعمل على تحريك الضلال على المحورين x , y */
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(.2),
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(10, 10),
                      )
                    ]),
                child: Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10 , left: 10 , bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.substring(1 ,15),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // هنا تعتبر ال $ من الكيبورد فعندما اريد ان اجعلها سترنك اضهع بعدها حرف ال r
                            Text(r'$' '${product.price}'),
                            Icon(Icons.favorite)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 20,
                  top: -37,
                  child: Image.network( product.image, height: 100, width: 100,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
