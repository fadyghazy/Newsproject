import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant.dart';
import '../../control/newsprovider/API.dart';
import '../../widgets/cardNews.dart';
class CategoryScreen extends StatefulWidget {
  String Category;
  CategoryScreen(this.Category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white ,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${widget.Category}",textAlign:TextAlign.start,style: TextStyle(fontSize:fontBigger,color:textColor,)
                ),
              ),
            ),

            Expanded(
                child:
                Consumer<NewsProvider>(
                  builder:(context, value, child){
                    return  (value.listDataModel==null)?Text(""): ListView.builder(
                      itemCount: value.listDataModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardNews(NetworkImageCard:'${value.listDataModel[index].urlToImage}', textCardCategories:"${value.listDataModel[index].title}", LinkNews:"${value.listDataModel[index].url}",);
                      },);
                  },)

            ),
          ],
        )
    );

  }
}