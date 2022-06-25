import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ropstam_task/Models/post_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    // gets the specific the post for which I just used the changeNotifier value provider.
    final post = Provider.of<PostModel>(context);
    return ListTile(
      onTap: () {},
      title: Text(
        post.title!,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      subtitle: Text(
        post.body!,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
