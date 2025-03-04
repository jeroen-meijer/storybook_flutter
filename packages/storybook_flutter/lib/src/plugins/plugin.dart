import 'package:flutter/widgets.dart';

import 'contents.dart';
import 'device_frame.dart';
import 'knobs.dart';
import 'theme_mode.dart';

export 'contents.dart';
export 'device_frame.dart';
export 'knobs.dart';
export 'theme_mode.dart';

/// Use this method to initialize and customize built-in plugins.
List<Plugin> initializePlugins({
  bool enableContents = true,
  bool enableKnobs = true,
  bool enableThemeMode = true,
  bool enableDeviceFrame = true,
  DeviceFrameData initialDeviceFrameData = const DeviceFrameData(),
  bool contentsSidePanel = false,
  bool knobsSidePanel = false,
}) =>
    [
      if (enableContents) ContentsPlugin(sidePanel: contentsSidePanel),
      if (enableKnobs) KnobsPlugin(sidePanel: knobsSidePanel),
      if (enableThemeMode) themeModePlugin,
      if (enableDeviceFrame)
        DeviceFramePlugin(initialData: initialDeviceFrameData),
    ];

typedef OnPluginButtonPressed = void Function(BuildContext);

class Plugin {
  const Plugin({
    this.wrapperBuilder,
    this.panelBuilder,
    this.storyBuilder,
    this.icon,
    this.onPressed,
  });

  /// Optional wrapper that will be inserted above the whole storybook content,
  /// including panel.
  ///
  /// E.g. `ContentsPlugin` uses this builder to add side panel.
  final TransitionBuilder? wrapperBuilder;

  /// Optional builder that will be used to display panel popup. It appears when
  /// user clicks on the [icon].
  ///
  /// For it to be used, [icon] must be provided.
  final WidgetBuilder? panelBuilder;

  /// Optional wrapper that will be inserted above each story.
  ///
  /// E.g. `DeviceFramePlugin` uses this builder to display device frame.
  final TransitionBuilder? storyBuilder;

  /// Optional icon that will be displayed on the bottom panel.
  final WidgetBuilder? icon;

  /// Optional callback that will be called when user clicks on the [icon].
  ///
  /// For it to be used, [icon] must be provided.
  final OnPluginButtonPressed? onPressed;
}
