import 'package:fluffychat/models/metal_member.dart';
import 'package:fluffychat/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class MetalUtils {
  static List<Widget> getMemberInfoAsListofTiles(
    BuildContext context,
    MetalMemebr? metalMember,
  ) {
    if (metalMember == null) return List.empty();

    final List<String> address = [];
    if (metalMember.city.isNotEmpty) address.add(metalMember.city);
    if (metalMember.state.isNotEmpty) address.add(metalMember.state);
    if (metalMember.country.isNotEmpty) address.add(metalMember.country);

    return [
      if (metalMember.shortBio.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.person_outlined),
          subtitle: Text(metalMember.shortBio),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
      if (metalMember.interest.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.favorite_border_outlined),
          title: const Text('Interest'),
          subtitle: Text(metalMember.interest),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
      if (metalMember.email.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.mail_outline),
          title: Text(metalMember.email),
          onTap: () => UrlLauncher(
            context,
            'mailto:${metalMember.email}',
          ).launchUrl(),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
      if (metalMember.phone.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.phone_outlined),
          title: Text(metalMember.phone),
          onTap: () => UrlLauncher(
            context,
            'tel:${metalMember.phone}',
          ).launchUrl(),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
      if (metalMember.linkedin.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.link),
          title: const Text('LinkedIn'),
          subtitle: Text(metalMember.linkedin),
          onTap: () => UrlLauncher(
            context,
            metalMember.linkedin,
          ).launchUrl(),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
      if (address.isNotEmpty) ...[
        ListTile(
          leading: const Icon(Icons.location_pin),
          title: const Text('Address'),
          subtitle: Text(address.join(', ')),
        ),
        Divider(color: Theme.of(context).dividerColor),
      ],
    ];
  }
}
