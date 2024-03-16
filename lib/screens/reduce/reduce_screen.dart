// ignore_for_file: avoid_dynamic_calls

import 'package:CCHAIN/helpers/colors.dart';
import 'package:CCHAIN/helpers/text_theme.dart';
import 'package:CCHAIN/screens/Sink/Sink_portal.dart';
import 'package:CCHAIN/screens/home/startScreen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

class ReduceEmissionScreen extends StatefulWidget {
  static const routeName = "/reduce-carbon-footprint";

  @override
  _ReduceEmissionScreenState createState() => _ReduceEmissionScreenState();
}

class _ReduceEmissionScreenState extends State<ReduceEmissionScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showButtons = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _showButtons = true;
      });
    } else {
      setState(() {
        _showButtons = false;
      });
    }
  }

  List<Widget> getWidgetTree(BuildContext context) {
    final List reduceCarbonFootPrintmsgs = [
      {
        'icon': Icons.build_sharp,
        'title': 'Reduce carbon emissions in Manufacturing Unit',
        'videoPath': 'assets/video/carbon_1.mp4',
      },
      {
        'icon': Icons.car_crash,
        'title': 'Reduce carbon emissions in Transport Unit',
        'videoPath': 'assets/video/carbon_2.mp4',
      },
      {
        'icon': Icons.recycling,
        'title': 'Reduce emissions due to recycling activities',
        'videoPath': 'assets/video/carbon_3.mp4',
      },
    ];

    final List<Widget> parentWidgetTree = [];

    for (final reduceEmissionData in reduceCarbonFootPrintmsgs) {
      List<Widget> widgetTree = [];

      widgetTree.add(
        const SizedBox(
          height: 15,
        ),
      );

      final Widget cardHeader = ListTile(
        leading: Icon(
          reduceEmissionData['icon'],
          color: ColorPallete.color3,
        ),
        title: CoolText(
          reduceEmissionData['title'],
          fontSize: 17,
          letterSpacing: 0,
        ),
      );

      widgetTree.add(cardHeader);

      final List<Widget> sectionDivider = [
        const SizedBox(
          height: 8,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
            color: ColorPallete.color6,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ];

      widgetTree = [...widgetTree, ...sectionDivider];

      if (reduceEmissionData.containsKey('videoPath')) {
        final Widget videoWidget = AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayerWidget(videoPath: reduceEmissionData['videoPath']),
        );

        widgetTree.add(videoWidget);
      } else {
        for (final option in reduceEmissionData['options']) {
          final Widget optionWidget = ListTile(
            leading: Icon(
              option['icon'],
              color: ColorPallete.color3,
            ),
            title: Text(
              option['message'],
              style: const TextStyle(
                color: ColorPallete.color3,
              ),
            ),
          );

          widgetTree.add(optionWidget);
        }
      }

      widgetTree.add(
        const SizedBox(
          height: 10,
        ),
      );

      final Widget parentWidget = Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: ColorPallete.cardBackground,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgetTree,
            ),
          ),
        ),
      );

      parentWidgetTree.add(parentWidget);
    }

    return parentWidgetTree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ...getWidgetTree(context),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _showButtons
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: FloatingActionButton.extended(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: ColorPallete.cardBackground.withBlue(150),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  StartScreen.routeName,
                );
              },
              label: const Text(
                "Home",
                style: TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
              icon: const Icon(
                Icons.home,
                color: ColorPallete.color3,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: FloatingActionButton.extended(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: ColorPallete.cardBackground.withBlue(150),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SinkPortal.routeName,
                );
              },
              label: const Text(
                "News",
                style: TextStyle(
                  color: ColorPallete.color3,
                ),
              ),
              icon: const Icon(
                Icons.eco,
                color: ColorPallete.color3,
              ),
            ),
          ),
        ],
      )
          : null,
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
    _isPlaying = false;
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources
    _controller.dispose();
    super.dispose();
  }

  void _togglePlaying() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = _controller.value.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _togglePlaying,
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        Positioned(
          left: 8.0,
          bottom: 8.0,
          child: AnimatedOpacity(
            opacity: _isPlaying ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: FloatingActionButton(
              onPressed: _togglePlaying,
              mini: true,
              backgroundColor: ColorPallete.color3,
              child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ),
        ),
      ],
    );
  }
}
