import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_video/bloc/app_bloc.dart';
import 'package:interactive_video/data/data.dart';
import 'package:interactive_video/models/entity/entity.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        Data(),
      )..add(InitializeSession()),
      child: MaterialApp(
        title: 'Interactive Video',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(''),
    )..initialize().then((value) {
        setState(() {});
      });
    startPositionStream();
  }

  // void videoListener() {
  //   _controller.position.asStream().listen((event) async {
  //     print('//');
  //     if (mounted) {
  //       context.read<AppBloc>().add(
  //             RuntimeBroker(
  //               position: (event?.inSeconds ?? 0).toDouble(),
  //             ),
  //           );
  //     }
  //   });
  // }

  void startPositionStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final position = await _controller.position;
      if (mounted) {
        context.read<AppBloc>().add(
              RuntimeBroker(
                position: (position?.inSeconds ?? 0).toDouble(),
              ),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Non-Linear Video Session'),
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) async {
          final activeVideo =
              state.session?.entities[state.currentIndex].mediaLink;
          if (_controller.dataSource != activeVideo) {
            _controller = VideoPlayerController.networkUrl(
              Uri.parse(
                activeVideo ?? '',
              ),
            );

            await _controller.initialize();
            _controller.play();
          }

          if (state.restartChapter) {
            _controller.seekTo(Duration.zero);
            if (mounted) {
              context.read<AppBloc>().add(const RestartChapter(val: false));
            }
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    if (state.showChoices &&
                        (state.session?.entities[state.currentIndex].choices ??
                                <Entity>[])
                            .isNotEmpty)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black54,
                        ),
                      ),
                    if (state.showChoices &&
                        (state.session?.entities[state.currentIndex].choices ??
                                <Entity>[])
                            .isNotEmpty)
                      Positioned.fill(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: (state
                                  .session!.entities[state.currentIndex])
                              .choices!
                              .asMap()
                              .entries
                              .map(
                                (e) => ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<AppBloc>()
                                        .add(ChoiceSelection(entity: e.value));
                                  },
                                  child: SizedBox(
                                    width: 80,
                                    height: 40,
                                    child: Center(
                                      child: Text(
                                        e.value.title,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width *
                          (state.currentPosition /
                              (state.session?.duration ?? 1)),
                      color: Colors.amber,
                    ),
                    ...state.breakpoints
                        .map(
                          (e) => Positioned(
                            left: MediaQuery.of(context).size.width *
                                (e / (state.session?.duration ?? 1)),
                            child: Container(
                              height: 20,
                              width: 2,
                              color: Colors.red,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Session Controlls',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<AppBloc>().add(RestartSession());
                          },
                          child: const Text(
                            'Restart Session',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AppBloc>().add(
                                  const RestartChapter(val: true),
                                );
                          },
                          child: const Text(
                            'Restart Chapter',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AppBloc>().add(GoPreviousChapter());
                          },
                          child: const Text(
                            'Previous Chapter',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Stats for nerds',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Current Position: ${state.currentPosition.toString()}'),
                    Text('Est. Session Duration: ${state.session?.duration}'),
                    Text(
                        'Current Chapter Seek: ${state.currentVideoSeek.toString()}'),
                    Text('Breakpoints: ${state.breakpoints.toString()}'),
                    Text('Show choices: ${state.showChoices}'),
                    Text(
                      'Session chapters: ${state.session?.entities.map((e) => e.title).toList().toString()}',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
