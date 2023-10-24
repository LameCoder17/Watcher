import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:watchlist/Models/categoriesModel.dart';
import 'package:watchlist/Services/moviesServices.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  TextEditingController _search = TextEditingController();
  Categories _movieCategories = Categories(genres: []);
  @override
  void initState() {
    MovieServices.getMovieCategories().then((value){
      setState(() {
        _movieCategories = value;
      });
      print('Done');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextField(
                controller: _search,
                decoration: const InputDecoration(
                  hintText: "Search"
                ),
              ),
            ),
            // Container(
            //   child: Row(
            //     children: List.generate(_movieCategories.genres!.length, (index){
            //       return Container(child: Text(_movieCategories.genres![index].name!),);
            //     }),
            //   ),
            // )
            Container(
              height: 20.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: _movieCategories.genres!.length,
                  itemBuilder: (context, index){
                  return Container(
                    height: 20.h,
                    width: 20.w,
                    child: Text(_movieCategories.genres![index].name!),);
                  }),
            )
          ],
        ),
      ),
    );
  }
}