import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_task/Constants/colors.dart';
import 'package:ropstam_task/Providers/posts.dart';
import 'package:ropstam_task/Screens/Home/components/posts_list.dart';
import 'package:ropstam_task/Services/auth_services.dart';
import 'package:ropstam_task/Widgets/dialogs.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final dialogResult = await customDialog(
                context: context,
                title: 'Are you sure?',
                content: 'You want to Log Out?',
              );
              if (dialogResult) {
                await Provider.of<AuthServices>(context, listen: false)
                    .logOut();
              }
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),

      //Future builder to call and get all the posts.
      body: FutureBuilder(
        future: Provider.of<Posts>(context, listen: false).getPosts(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // postList is widget where all the data is displayed
          // to make the code cleaned I have seperated it.
          return const PostsList();
        }),
      ),
    );
  }
}
