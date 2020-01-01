import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/global.dart';
import 'package:shopping_app/ui/widgets/carouselproductslist.dart';
import 'package:shopping_app/ui/widgets/sizeselector.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              CarouselProductsList(
                productsList: products[id].images,
                type: CarouselTypes.details,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products[id].tags.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Chip(
                              backgroundColor: Colors.black,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              label: Text(
                                "${products[id].tags[i]}",
                                style:
                                    Theme.of(context).textTheme.button.copyWith(
                                          color: Colors.white,
                                        ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${products[id].title}",
                      style: Theme.of(context).textTheme.display1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    Text("${products[id].price}"),
                    Spacer(),
                    Text(
                      "Color:",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Container(
                      height: 25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products[id].colors.length,
                        itemBuilder: (ctx, i) {
                          return Container(
                            width: 75,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: products[id].colors[i],
                                border: Border.all(
                                    color: Colors.white, width: 5.0)),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Size:",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7.5),
                      height: 35,
                      child: SizeSelector(id: id),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: double.infinity,
                        child: RaisedButton(
                          child: Text(
                            "ADD TO BAG",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          onPressed: () {},
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
