import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ropstam_task/Screens/Home/components/post_item.dart';

import '../../../Providers/posts.dart';

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    //gets all  the posts from the posts class
    final posts = Provider.of<Posts>(context).posts;
    return ListView.separated(
      itemCount: posts.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      separatorBuilder: (context, index) => const Divider(),
      //I have used changenotifier just to show that it can be done with different  ways.
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: posts[index],
        child: PostItem(
          key: ValueKey(
            posts[index].id.toString(),
          ),
        ),
      ),
    );
  }
}
