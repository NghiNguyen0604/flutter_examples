/*
 * Autogenerated header by File Header Comment extension - Donna Iwan
 * File:       theme_service.dart
 * Created on: Sun Dec 12 2021
 * Author:     Tong Vu Than Dan
 *
 * Copyright (c) 2021 Tong Vu Than Dan
 *
 * Description: manage theme and theme mode, use with riverpod 
 */

///Manage theme and theme mode
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Abstract interface for the ThemeService used to read and save theme
/// properties.
///
/// Also holds the key values used to persist the data and the default values
/// for each property.
abstract class ThemeService {
  /// ThemeService implementations may override this method to perform needed
  /// initialization and setup work.
  Future<void> init();
//!Thememode
  /// Key used to read and save the themeMode value.
  static const String keyThemeMode = 'themeMode';

  /// Default value for the themeMode, also used to reset settings, default is [ThemeMode.system]
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  /// Loads the ThemeMode
  Future<ThemeMode> themeMode();

  /// Persists the ThemeMode
  Future<void> saveThemeMode(ThemeMode value);
//!Theme type
  /// Key used to read and save the usedScheme value.
  static const String keyUsedScheme = 'usedScheme';

  /// Default value for the usedScheme, also used to reset settings, default is [FlexScheme.hippieBlue]
  static const FlexScheme defaultUsedScheme = FlexScheme.hippieBlue;

  /// Loads the used scheme setting
  Future<FlexScheme> usedScheme();

  /// Persists the used scheme setting
  Future<void> saveUsedScheme(FlexScheme value);

  /// Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';

  /// Default value for the schemeIndex, also used to reset settings.
  /// Defaults to 35,
  /// the default theme based on the [FlexColor.blueWhale] color scheme.
  static const int defaultSchemeIndex = 0;

  /// Loads used scheme index setting
  Future<int> schemeIndex();

  /// Persists the used scheme setting
  Future<void> saveSchemeIndex(int value);

  /*
  !For details theme info

  /// Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  /// Loads the use sub themes setting in  .
  Future<bool> useSubThemes();

  /// Persists the use sub themes setting in  .
  Future<void> saveUseSubThemes(bool value);

  /// Key used to read and save the useTextTheme value.
  static const String keyUseTextTheme = 'useTextTheme';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseTextTheme = true;

  /// Loads the useTextTheme setting.
  Future<bool> useTextTheme();

  /// Persists the useTextTheme setting
  Future<void> saveUseTextTheme(bool value);

 
  /// Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';

  /// Default value for the schemeIndex, also used to reset settings.
  /// Defaults to 35, 
  /// the default theme based on the [FlexColor.blueWhale] color scheme.
  static const int defaultSchemeIndex = 35;

  /// Loads used scheme index setting
  Future<int> schemeIndex();

  /// Persists the used scheme setting
  Future<void> saveSchemeIndex(int value);

  /// Key used to read and save the interactionEffects value.
  static const String keyInteractionEffects = 'interactionEffects';

  /// Default value for the interactionEffects, also used to reset settings.
  static const bool defaultInteractionEffects = true;

  /// Loads used themed effects setting  
  Future<bool> interactionEffects();

  /// Persists used themed effects setting  
  Future<void> saveInteractionEffects(bool value);

  /// Key used to read and save the useDefaultRadius value.
  static const String keyUseDefaultRadius = 'useDefaultRadius';

  /// Default value for the useDefaultRadius, also used to reset settings.
  static const bool defaultUseDefaultRadius = true;

  /// Loads used useDefaultRadius setting  
  Future<bool> useDefaultRadius();

  /// Persists the useDefaultRadius setting  
  Future<void> saveUseDefaultRadius(bool value);

  /// Key used to read and save the cornerRadius value.
  static const String keyCornerRadius = 'cornerRadius';

  /// Default value for the cornerRadius, also used to reset settings.
  static const double defaultCornerRadius = 16;

  /// Loads used corner radius setting  
  Future<double> cornerRadius();

  /// Persists the used corner radius setting  
  Future<void> saveCornerRadius(double value);

  /// Key used to read and save the inputDecoratorIsFilled value.
  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';

  /// Default value for the inputDecoratorIsFilled, also used to reset settings.
  static const bool defaultInputDecoratorIsFilled = true;

  /// Loads used inputDecoratorIsFilled setting  
  Future<bool> inputDecoratorIsFilled();

  /// Persists used inputDecoratorIsFilled setting  
  Future<void> saveInputDecoratorIsFilled(bool value);

  /// Key used to read and save the inputDecoratorBorderType value.
  static const String keyInputDecoratorBorderType = 'inputDecoratorBorderType';

  /// Default value for the inputDecoratorBorderType, also to reset settings.
  static const FlexInputBorderType defaultInputDecoratorBorderType = FlexInputBorderType.outline;

  /// Loads used inputDecoratorBorderType setting  
  Future<FlexInputBorderType> inputDecoratorBorderType();

  /// Persists used inputDecoratorBorderType setting  
  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value);

  /// Key used to read and save the inputDecoratorUnfocusedHasBorder value.
  static const String keyInputDecoratorUnfocusedHasBorder = 'inputDecoratorUnfocusedHasBorder';

  /// Default value for the inputDecoratorUnfocusedHasBorder, reset settings.
  static const bool defaultInputDecoratorUnfocusedHasBorder = true;

  /// Loads used inputDecoratorUnfocusedHasBorder setting  
  Future<bool> inputDecoratorUnfocusedHasBorder();

  /// Persists used inputDecoratorUnfocusedHasBorder setting  
  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value);

  /// Key used to read and save the surfaceMode value.
  static const String keySurfaceMode = 'surfaceMode';

  /// Default value for the surfaceMode, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceMode = FlexSurfaceMode.highScaffoldLowSurface;

  /// Loads used surface mode setting  
  Future<FlexSurfaceMode> surfaceMode();

  /// Persists the used surface mode setting  
  Future<void> saveSurfaceMode(FlexSurfaceMode value);

  /// Key used to read and save the blendLevel value.
  static const String keyBlendLevel = 'blendLevel';

  /// Default value for the blendLevel, also used to reset settings.
  ///
  /// Defaults to 18.
  static const int defaultBlendLevel = 18;

  /// Loads used surface blend level setting  
  Future<int> blendLevel();

  /// Persists the used surface blend level setting  
  Future<void> saveBlendLevel(int value);

  /// Key used to read and save the lightAppBarStyle value.
  static const String keyLightAppBarStyle = 'lightAppBarStyle';

  /// Default value for the lightAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultLightAppBarStyle = FlexAppBarStyle.primary;

  /// Loads used app bar style for light theme setting  
  Future<FlexAppBarStyle> lightAppBarStyle();

  /// Persists the used app bar style for light theme setting  
  Future<void> saveLightAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the darkAppBarStyle value.
  static const String keyDarkAppBarStyle = 'darkAppBarStyle';

  /// Default value for the darkAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultDarkAppBarStyle = FlexAppBarStyle.background;

  /// Loads used app bar style for dark theme setting  
  Future<FlexAppBarStyle> darkAppBarStyle();

  /// Persists the used app bar style for dark theme setting  
  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the appBarOpacity value.
  static const String keyAppBarOpacity = 'appBarOpacity';

  /// Default value for the appBarOpacity, also used to reset settings.
  static const double defaultAppBarOpacity = 0.95;

  /// Loads used app bar opacity setting  
  Future<double> appBarOpacity();

  /// Persists the used app bar opacity setting  
  Future<void> saveAppBarOpacity(double value);

  /// Key used to read and save the appBarElevation value.
  static const String keyAppBarElevation = 'appBarElevation';

  /// Default value for the appBarElevation, also used to reset settings.
  static const double defaultAppBarElevation = 0;

  /// Loads used app bar elevation setting  
  Future<double> appBarElevation();

  /// Persists the used app bar elevation setting  
  Future<void> saveAppBarElevation(double value);

  /// Key used to read and save the transparentStatusBar value.
  static const String keyTransparentStatusBar = 'transparentStatusBar';

  /// Default value for the transparentStatusBar, also used to reset settings.
  static const bool defaultTransparentStatusBar = true;

  /// Loads used status bar transparency setting  
  Future<bool> transparentStatusBar();

  /// Persists used status bar transparency setting  
  Future<void> saveTransparentStatusBar(bool value);

  /// Key used to read and save the tabBarStyle value.
  static const String keyTabBarStyle = 'tabBarStyle';

  /// Default value for the tabBarStyle, also used to reset settings.
  static const FlexTabBarStyle defaultTabBarStyle = FlexTabBarStyle.forAppBar;

  /// Loads used tab bar style setting  
  Future<FlexTabBarStyle> tabBarStyle();

  /// Persists used tab bar style setting  
  Future<void> saveTabBarStyle(FlexTabBarStyle value);

  /// Key used to read and save the bottomNavigationBarOpacity value.
  static const String keyBottomNavigationBarOpacity = 'bottomNavigationBarOpacity';

  /// Default value for the bottomNavigationBarOpacity, also to reset settings.
  static const double defaultBottomNavigationBarOpacity = 0.95;

  /// Loads used bottom navigation bar opacity setting  
  Future<double> bottomNavigationBarOpacity();

  /// Persists the used app bar opacity setting  
  Future<void> saveBottomNavigationBarOpacity(double value);

  /// Key used to read and save the bottomNavigationBarElevation value.
  static const String keyBottomNavigationBarElevation = 'bottomNavigationBarElevation';

  /// Default value for the bottomNavigationBarElevation, also reset settings.
  static const double defaultBottomNavigationBarElevation = 0;

  /// Loads used bottom navigation bar elevation setting  
  Future<double> bottomNavigationBarElevation();

  /// Persists the used app bar elevation setting  
  Future<void> saveBottomNavigationBarElevation(double value);

  /// Key used to read and save the navBarStyle value.
  static const String keyNavBarStyle = 'navBarStyle';

  /// Default value for the navBarStyle, also used to reset settings.
  static const FlexSystemNavBarStyle defaultNavBarStyle = FlexSystemNavBarStyle.background;

  /// Loads used navBarStyle setting  
  Future<FlexSystemNavBarStyle> navBarStyle();

  /// Persists used navBarStyle setting  
  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value);

  /// Key used to read and save the useNavDivider value.
  static const String keyUseNavDivider = 'useNavDivider';

  /// Default value for the useNavDivider, also to reset settings.
  static const bool defaultUseNavDivider = false;

  /// Loads used useNavDivider setting  
  Future<bool> useNavDivider();

  /// Persists useNavDivider setting  
  Future<void> saveUseNavDivider(bool value);

  /// Key used to read and save the tooltipsMatchBackground value.
  static const String keyTooltipsMatchBackground = 'tooltipsMatchBackground';

  /// Default value for the tooltipsMatchBackground, also to reset settings.
  static const bool defaultTooltipsMatchBackground = true;

  /// Loads used tooltip style setting  
  Future<bool> tooltipsMatchBackground();

  /// Persists used tooltip style setting  
  Future<void> saveTooltipsMatchBackground(bool value);

  /// Key used to read and save the swapLightColors value.
  static const String keySwapLightColors = 'swapLightColors';

  /// Default value for the swapLightColors, also to reset settings.
  static const bool defaultSwapLightColors = false;

  /// Loads swap primary/secondary colors in light mode,  
  Future<bool> swapLightColors();

  /// Persists swap primary/secondary colors in light mode,  
  Future<void> saveSwapLightColors(bool value);

  /// Key used to read and save the swapDarkColors value.
  static const String keySwapDarkColors = 'swapDarkColors';

  /// Default value for the swapDarkColors, also to reset settings.
  static const bool defaultSwapDarkColors = false;

  /// Loads swap primary/secondary colors in dark mode,  
  Future<bool> swapDarkColors();

  /// Persists swap primary/secondary colors in dark mode,  
  Future<void> saveSwapDarkColors(bool value);

  /// Key used to read and save the lightIsWhite value.
  static const String keyLightIsWhite = 'lightIsWhite';

  /// Default value for the lightIsWhite, also to reset settings.
  static const bool defaultLightIsWhite = false;

  /// Loads lightIsWhite setting,  
  Future<bool> lightIsWhite();

  /// Persists lightIsWhite setting,  
  Future<void> saveLightIsWhite(bool value);

  /// Key used to read and save the darkIsTrueBlack value.
  static const String keyDarkIsTrueBlack = 'darkIsTrueBlack';

  /// Default value for the darkIsTrueBlack, also to reset settings.
  static const bool defaultDarkIsTrueBlack = false;

  /// Loads dark uses true black setting in dark mode,  
  Future<bool> darkIsTrueBlack();

  /// Persists dark uses true black setting in dark mode,  
  Future<void> saveDarkIsTrueBlack(bool value);

  /// Key used to read and save the useToDarkMethod value.
  static const String keyUseToDarkMethod = 'useToDarkMethod';

  /// Default value for the useToDarkMethod, also to reset settings.
  static const bool defaultUseToDarkMethod = false;

  /// Loads use computed dark mode setting,  
  Future<bool> useToDarkMethod();

  /// Persists use computed dark mode setting,  
  Future<void> saveUseToDarkMethod(bool value);

  /// Key used to read and save the darkMethodLevel value.
  static const String keyDarkMethodLevel = 'darkMethodLevel';

  /// Default value for the darkMethodLevel, also used to reset settings.
  ///
  /// Defaults to 35.
  static const int defaultDarkMethodLevel = 35;

  /// Loads use computed dark mode level setting,  
  Future<int> darkMethodLevel();

  /// Persists use computed dark mode level setting,  
  Future<void> saveDarkMethodLevel(int value);

  /// Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';

  /// Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  /// Loads setting that turns ON/OFF FlexColorScheme theme,  
  Future<bool> useFlexColorScheme();

  /// Persists setting that turns ON/OFF FlexColorScheme theme,  
  Future<void> saveUseFlexColorScheme(bool value);

  /// Key used to read and save the blendLightOnColors value.
  static const String keyBlendLightOnColors = 'blendLightOnColors';

  /// Default value for the blendLightOnColors, also to reset settings.
  static const bool defaultBlendLightOnColors = true;

  /// Loads setting that blends light colors,  
  Future<bool> blendLightOnColors();

  /// Persists setting that blends light colors,  
  Future<void> saveBlendLightOnColors(bool value);

  /// Key used to read and save the blendDarkOnColors value.
  static const String keyBlendDarkOnColors = 'blendDarkOnColors';

  /// Default value for the blendDarkOnColors, also to reset settings.
  static const bool defaultBlendDarkOnColors = true;

  /// Loads setting that blends dark colors,  
  Future<bool> blendDarkOnColors();

  /// Persists setting that blends dark colors,  
  Future<void> saveBlendDarkOnColors(bool value);

  /// Key used to read and save the blendLightTextTheme value.
  static const String keyBlendLightTextTheme = 'blendLightTextTheme';

  /// Default value for the blendLightTextTheme, also to reset settings.
  static const bool defaultBlendLightTextTheme = true;

  /// Loads setting that blends light text theme,  
  Future<bool> blendLightTextTheme();

  /// Persists setting that blends light text theme,  
  Future<void> saveBlendLightTextTheme(bool value);

  /// Key used to read and save the blendDarkTextTheme value.
  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';

  /// Default value for the blendDarkTextTheme, also to reset settings.
  static const bool defaultBlendDarkTextTheme = true;

  /// Loads setting that blends dark text theme,  
  Future<bool> blendDarkTextTheme();

  /// Persists setting that blends dark text theme,  
  Future<void> saveBlendDarkTextTheme(bool value);

  /// Key used to read and save the fabUseShape value.
  static const String keyFabUseShape = 'fabUseShape';

  /// Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabUseShape = true;

  /// Loads setting for fabUseShape,  
  Future<bool> fabUseShape();

  /// Persists setting for fabUseShape,  
  Future<void> saveFabUseShape(bool value);

  /// Key used to read and save the primaryLight color value.
  static const String keyPrimaryLight = 'primaryLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryLight = FlexColor.materialLightPrimary;

  /// Loads setting for primaryLight color,  
  Future<Color> primaryLight();

  /// Persists setting for primaryLight color,  
  Future<void> savePrimaryLight(Color value);

  /// Key used to read and save the primaryVariantLight color value.
  static const String keyPrimaryVariantLight = 'primaryVariantLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryVariantLight = FlexColor.materialLightPrimaryVariant;

  /// Loads setting for primaryVariantLight color,  
  Future<Color> primaryVariantLight();

  /// Persists setting for primaryVariantLight color,  
  Future<void> savePrimaryVariantLight(Color value);

  /// Key used to read and save the secondaryLight color value.
  static const String keySecondaryLight = 'secondaryLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryLight = FlexColor.materialLightSecondary;

  /// Loads setting for secondaryLight color,  
  Future<Color> secondaryLight();

  /// Persists setting for secondaryLight color,  
  Future<void> saveSecondaryLight(Color value);

  /// Key used to read and save the secondaryVariantLight color value.
  static const String keySecondaryVariantLight = 'secondaryVariantLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryVariantLight = FlexColor.materialLightSecondaryVariant;

  /// Loads setting for secondaryVariantLight color,  
  Future<Color> secondaryVariantLight();

  /// Persists setting for secondaryVariantLight color,  
  Future<void> saveSecondaryVariantLight(Color value);

  /// Key used to read and save the primaryDark color value.
  static const String keyPrimaryDark = 'primaryDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryDark = FlexColor.materialDarkPrimary;

  /// Loads setting for primaryDark color,  
  Future<Color> primaryDark();

  /// Persists setting for primaryDark color,  
  Future<void> savePrimaryDark(Color value);

  /// Key used to read and save the primaryVariantDark color value.
  static const String keyPrimaryVariantDark = 'primaryVariantDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryVariantDark = FlexColor.materialDarkPrimaryVariant;

  /// Loads setting for primaryVariantDark color,  
  Future<Color> primaryVariantDark();

  /// Persists setting for primaryVariantDark color,  
  Future<void> savePrimaryVariantDark(Color value);

  /// Key used to read and save the secondaryDark color value.
  static const String keySecondaryDark = 'secondaryDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryDark = FlexColor.materialDarkSecondary;

  /// Loads setting for secondaryDark color,  
  Future<Color> secondaryDark();

  /// Persists setting for secondaryDark color,  
  Future<void> saveSecondaryDark(Color value);

  /// Key used to read and save the secondaryVariantDark color value.
  static const String keySecondaryVariantDark = 'secondaryVariantDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryVariantDark = FlexColor.materialDarkSecondaryVariant;

  /// Loads setting for secondaryVariantDark color,  
  Future<Color> secondaryVariantDark();

  /// Persists setting for secondaryVariantDark color,  
  Future<void> saveSecondaryVariantDark(Color value);
  */
}
