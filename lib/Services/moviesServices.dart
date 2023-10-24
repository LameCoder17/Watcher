import 'package:http/http.dart' as http;
import 'package:watchlist/Models/categoriesModel.dart';
import '../Utils/URLs.dart';

class MovieServices {
  static Future<Categories> getMovieCategories() async {
    try {
      final response = await http
          .get(Uri.parse(movieCategoriesURL));

      print("Status Code GetMovieCategories: ${response.statusCode}");
      print("Response GetMovieCategories: ${response.body}");
      if (response.statusCode == 200) {
        final Categories movieCategories = categoriesFromJson(response.body);
        return movieCategories;
      } else {
        print("Error");
      }
    } catch (e) {}

    return Categories(genres: []);
  }
}