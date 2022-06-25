import 'package:provider/provider.dart';

import 'package:provider/single_child_widget.dart';
import 'package:ropstam_task/Models/post_model.dart';
import 'package:ropstam_task/Providers/posts.dart';
import 'package:ropstam_task/Providers/user.dart';
import 'package:ropstam_task/Services/auth_services.dart';

class ProvidersList {
  // gets all providers for the app
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(
        create: (ctx) => AuthServices(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => UserData(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => PostModel(),
      ),
      ChangeNotifierProvider(
        create: (ctx) => Posts(),
      ),
    ];
  }
}
