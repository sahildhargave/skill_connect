import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:reddit/features/community/controller/community_controller.dart";

import "../../core/common/error_text.dart";
import "../../core/common/loader.dart";
import "../../core/common/post_card.dart";
import "../post/controller/post_controller.dart";

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(userPostsProvider(communities)).when(
              data: (data) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = data[index];
                      return PostCard(post: post);
                    });
              },
              error: (error, stackTrace) {
                if (kDebugMode) print(error);
                return ErrorText(
                  error: error.toString(),
                );
              },
              loading: () => const Loader()),
          error: (error, stackTrace) => ErrorText(
            error: error.toString(),
          ),
          loading: () => const Loader(),
        );
  }
}
