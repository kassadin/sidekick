import 'package:flutter/material.dart';
import 'package:pub_api_client/pub_api_client.dart';
import 'package:sidekick/components/atoms/typography.dart';

class PackageScoreDisplay extends StatelessWidget {
  final PackageScore score;
  const PackageScoreDisplay({
    this.score,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(score.likeCount.toString()),
              const Caption('Likes'),
            ],
          ),
          const VerticalDivider(width: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(score.grantedPoints.toString()),
              const Caption('Pub Points'),
            ],
          ),
          const VerticalDivider(width: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading('${(score.popularityScore * 100).toStringAsFixed(0)}%'),
              const Caption('Popularity'),
            ],
          ),
        ],
      ),
    );
  }
}
