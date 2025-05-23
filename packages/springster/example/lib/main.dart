import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:springster_example/2d_redirection.dart';
import 'package:springster_example/draggable_icons.dart';
import 'package:springster_example/flip-card.dart';
import 'package:springster_example/one_dimension.dart';
import 'package:springster_example/pip.dart';

void main() async {
  runApp(
    CupertinoApp.router(
      routerConfig: router.config(),
    ),
  );
}

final springsterRoutes = [
  NamedRouteDef(
    name: 'Springster Examples',
    path: '',
    type: RouteType.cupertino(),
    builder: (context, state) => const SpringsterExample(),
  ),
  NamedRouteDef(
    name: OneDimensionExample.name,
    path: OneDimensionExample.path,
    type: RouteType.cupertino(),
    builder: (context, state) => OneDimensionExample(),
  ),
  NamedRouteDef(
    name: TwoDimensionRedirectionExample.name,
    path: TwoDimensionRedirectionExample.path,
    type: RouteType.cupertino(),
    builder: (context, state) => TwoDimensionRedirectionExample(),
  ),
  NamedRouteDef(
    name: DraggableIconsExample.name,
    path: DraggableIconsExample.path,
    type: RouteType.cupertino(),
    builder: (context, state) => DraggableIconsExample(),
  ),
  NamedRouteDef(
    name: PipExample.name,
    path: PipExample.path,
    type: RouteType.cupertino(),
    builder: (context, state) => PipExample(),
  ),
  NamedRouteDef(
    name: FlipCardExample.name,
    path: FlipCardExample.path,
    type: RouteType.cupertino(),
    builder: (context, state) => FlipCardExample(),
  ),
];

final router = RootStackRouter.build(
  routes: [
    NamedRouteDef.shell(
      name: 'Home',
      path: '/',
      type: RouteType.cupertino(),
      children: springsterRoutes,
    ),
  ],
);

class SpringsterExample extends StatelessWidget {
  const SpringsterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  buildDestinationButton(
                    context,
                    OneDimensionExample.name,
                  ),
                  buildDestinationButton(
                    context,
                    TwoDimensionRedirectionExample.name,
                  ),
                  buildDestinationButton(
                    context,
                    DraggableIconsExample.name,
                  ),
                  buildDestinationButton(
                    context,
                    PipExample.name,
                  ),
                  buildDestinationButton(
                    context,
                    FlipCardExample.name,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDestinationButton(BuildContext context, String name) {
    return CupertinoButton.filled(
      onPressed: () => context.navigateTo(NamedRoute(name)),
      child: Text(name),
    );
  }
}
