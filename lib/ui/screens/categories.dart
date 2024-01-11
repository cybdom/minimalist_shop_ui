import 'package:flutter/material.dart';
import 'package:shopping_app/global.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedCat = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Categories",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(right: 15),
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCat = i;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 25.0),
                          // padding: const EdgeInsets.symmetric(vertical: 45.0),
                          width: 50,
                          constraints: BoxConstraints(minHeight: 101),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: _selectedCat == i ? Border.all() : Border(),
                            color: _selectedCat == i
                                ? Colors.transparent
                                : Colors.black,
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          // child: Transform.rotate(
                          //   angle: -pi / 2,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Text(
                              "${categories[i].title}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: _selectedCat == i
                                          ? Colors.black
                                          : Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: categories[_selectedCat].subCat.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  "${categories[_selectedCat].subCat[i].title}"),
                            ),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
