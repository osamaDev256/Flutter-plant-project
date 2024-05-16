import 'package:boot_camp_project/model/users.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

  Future<List<Users>> getAllUsers() async {
    final data =
        // await supabase.from("student").select().match({"email": "A@a.com"});
        await supabase.from("plnats_users").select();
    // print(const JsonEncoder.withIndent("  ").convert(data));
    List<Users> allUser = [];
    for (var element in data) {
      allUser.add(Users.fromJson(element));
    }
    return allUser;
  }

  Future<List> getSpecificUser(
      {required String name, required String email}) async {
    final data = await supabase
        .from("plnats_users")
        .select()
        .match({"email": email, "user_name": name});

    return data;
  }

  // ---------------------------

  insertUser(Users user) async {
    await supabase.from("plnats_users").insert(user.toJson());
  }
}