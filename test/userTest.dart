import 'package:flutter_test/flutter_test.dart';
import 'package:hello_me/models/userData.dart';
import 'package:hello_me/util/http_client.dart';


void main() {
  test('Testing User Model', () async{
    Map<String, dynamic> res = await HttpAgent.getReq('http://13.233.149.203/api/register/readUser/5ed3d34f00549860be78aec3');
    var userObj = UserModel.fromJson( res['data'] );
    userObj.showUserDetail();
  });
}