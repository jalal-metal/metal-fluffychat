import 'package:fluffychat/models/metal_member.dart';
import 'package:fluffychat/services/metal_api.dart';
import 'package:flutter/material.dart';

class MetalMemberBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, MetalMemebr? metalMember) builder;
  final String? userId;

  const MetalMemberBuilder({
    required this.builder,
    this.userId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId = this.userId;
    if (userId == null) return builder(context, null);

    return FutureBuilder<MetalMemebr>(
      future: MetalApi().fetchMetalMemberProfile(userId),
      builder: (context, snapshot) =>  builder(
          context,
          snapshot.data,
        ),
    );
  }
}
