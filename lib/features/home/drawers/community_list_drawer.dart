import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:phlox_animations/phlox_animations.dart';
import "package:reddit/core/common/error_text.dart";
import "package:reddit/core/common/loader.dart";
import "package:reddit/features/community/controller/community_controller.dart";
import "package:routemaster/routemaster.dart";
import "../../../models/community_model.dart";
import '../../../router.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({Key? key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: PhloxAnimations(
            duration: const Duration(milliseconds: 200),
            fromX: 100,
            child: Column(
              children: [
                PhloxAnimations(
                  duration: const Duration(seconds: 1),
                  fromX: 200,
                  child: ListTile(
                    title: const Text("Create a community"),
                    leading: const Icon(Icons.add),
                    onTap: () => navigateToCreateCommunity(context),
                  ),
                ),
                ref.watch(userCommunitiesProvider).when(
                    data: (communities) => Expanded(
                        child: ListView.builder(
                            itemCount: communities.length,
                            itemBuilder: (BuildContext context, int index) {
                              final community = communities[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(community.avatar),
                                ),
                                title: Text('r/${community.name}'),
                                onTap: () {
                                  navigateToCommunity(context, community);
                                },
                              );
                            })),
                    error: (error, StackTrace) => ErrorText(
                          error: error.toString(),
                        ),
                    loading: () => const Loader())
              ],
            )),
      ),
    );
  }
}
