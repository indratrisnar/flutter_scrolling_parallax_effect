import 'package:flutter/material.dart';
import 'package:flutter_scrolling_parallax_effect/models/destination.dart';
import 'package:flutter_scrolling_parallax_effect/widgets/delegates/parallax_horizontal_flow_delegate.dart';

class DestinationParallax extends StatelessWidget {
  const DestinationParallax({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: destinations.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = destinations[index];
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: DestinationItem(destination: item),
          );
        },
      ),
    );
  }
}

@immutable
class DestinationItem extends StatelessWidget {
  DestinationItem({
    super.key,
    required this.destination,
  });

  final Destination destination;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            _buildParallaxBackground(context),
            _buildGradient(),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Positioned.fill(
      child: Flow(
        delegate: ParallaxHorizontalFlowDelegate(
          scrollable: Scrollable.of(context),
          listItemContext: context,
          backgroundImageKey: _backgroundImageKey,
        ),
        children: [
          Image.asset(
            destination.image,
            key: _backgroundImageKey,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      left: 12,
      bottom: 8,
      child: Text(
        destination.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
