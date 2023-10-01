import 'package:bakadart/bakadart.dart';

void main() async {
  BakaClient client = BakaClient("bakaServerUrl");
  await client.login("username", "password");
  print(await client.getSubjectsInfo());
}
