import 'package:dentalapp_UI/model/usermodel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<User> getUsers() async {
    const url =
        'https://dentalapp-cb238-default-rtdb.firebaseio.com/users.json';
    var respond = await http.get(Uri.parse(url));
    if (respond.statusCode == 200) {
      // var jsonData = jsonDecode(respond.body);
      User userData = userFromJson(respond.body) as User;
      print(userData);
      return userData;
    } else {
      return null;
    }
  }
}
