import 'package:flutter/material.dart';
import 'package:flutter_scrolling_parallax_effect/models/city.dart';
import 'package:flutter_scrolling_parallax_effect/widgets/delegates/parallax_vertical_flow_delegate.dart';

class CityParallax extends StatelessWidget {
  const CityParallax({super.key, required this.listViewHomePageContext});
  final BuildContext listViewHomePageContext;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = cities[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CityItem(
            city: item,
            listViewHomePageContext: listViewHomePageContext,
          ),
        );
      },
    );
  }
}

@immutable
class CityItem extends StatelessWidget {
  CityItem({
    super.key,
    required this.city,
    required this.listViewHomePageContext,
  });

  final Destination city;
  final BuildContext listViewHomePageContext;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            _buildParallaxBackground(),
            _buildGradient(),
            _buildTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildParallaxBackground() {
    return Positioned.fill(
      child: Flow(
        delegate: ParallaxVerticalFlowDelegate(
          scrollable: Scrollable.of(listViewHomePageContext),
          listItemContext: listViewHomePageContext,
          backgroundImageKey: _backgroundImageKey,
        ),
        children: [
          Image.asset(
            city.image,
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
      left: 20,
      bottom: 20,
      child: Text(
        city.name,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
