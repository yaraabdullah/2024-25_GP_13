import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const HomePageWidget(),
        ),
        FFRoute(
          name: 'Homepage22',
          path: '/homepage22',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Homepage22')
              : const Homepage22Widget(),
        ),
        FFRoute(
          name: 'DoctorDeatils',
          path: '/doctorDeatils',
          builder: (context, params) => DoctorDeatilsWidget(
            docID: params.getParam(
              'docID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Doctors'],
            ),
          ),
        ),
        FFRoute(
          name: 'BackgroundSound',
          path: '/backgroundSound',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: BackgroundSoundWidget(),
          ),
        ),
        FFRoute(
          name: 'myBookings',
          path: '/myBookings',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'myBookings')
              : const NavBarPage(
                  initialPage: 'myBookings',
                  page: MyBookingsWidget(),
                ),
        ),
        FFRoute(
          name: 'chatbot',
          path: '/chatbot',
          builder: (context, params) => const ChatbotWidget(),
        ),
        FFRoute(
          name: 'ST_2',
          path: '/st2',
          builder: (context, params) => const St2Widget(),
        ),
        FFRoute(
          name: 'ST_Results',
          path: '/sTResults',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: STResultsWidget(),
          ),
        ),
        FFRoute(
          name: 'BackgroundSound2',
          path: '/backgroundSound2',
          builder: (context, params) => const BackgroundSound2Widget(),
        ),
        FFRoute(
          name: 'Profile-Doctor',
          path: '/profileDoctor',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ProfileDoctorWidget(),
          ),
        ),
        FFRoute(
          name: 'auth_3_Create',
          path: '/auth3Create',
          builder: (context, params) => Auth3CreateWidget(
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_3_Login',
          path: '/auth3Login',
          builder: (context, params) => const Auth3LoginWidget(),
        ),
        FFRoute(
          name: 'auth_3_verifyPhone',
          path: '/auth3VerifyPhone',
          builder: (context, params) => Auth3VerifyPhoneWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_3_ForgotPassword',
          path: '/auth3ForgotPassword',
          builder: (context, params) => Auth3ForgotPasswordWidget(
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Profile-Student',
          path: '/profileStudent',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Profile-Student')
              : const ProfileStudentWidget(),
        ),
        FFRoute(
          name: 'myBookings2doc',
          path: '/myBookings2doc',
          builder: (context, params) => const MyBookings2docWidget(),
        ),
        FFRoute(
          name: 'auth_3_Create_2',
          path: '/auth3Create2',
          builder: (context, params) => const Auth3Create2Widget(),
        ),
        FFRoute(
          name: 'auth_3_Login_2',
          path: '/auth3Login2',
          builder: (context, params) => const Auth3Login2Widget(),
        ),
        FFRoute(
          name: 'auth_3_phone_2',
          path: '/auth3Phone2',
          builder: (context, params) => const Auth3Phone2Widget(),
        ),
        FFRoute(
          name: 'auth_3_verifyPhone_2',
          path: '/auth3VerifyPhone2',
          builder: (context, params) => Auth3VerifyPhone2Widget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'auth_3_ForgotPassword_2',
          path: '/auth3ForgotPassword2',
          builder: (context, params) => const Auth3ForgotPassword2Widget(),
        ),
        FFRoute(
          name: 'DeatilsCopy',
          path: '/deatilsCopy',
          builder: (context, params) => const DeatilsCopyWidget(),
        ),
        FFRoute(
          name: 'Success',
          path: '/success',
          builder: (context, params) => const SuccessWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'AssessmentCategory',
          path: '/assessmentCategory',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: AssessmentCategoryWidget(),
          ),
        ),
        FFRoute(
          name: 'AssessmentResult',
          path: '/assessmentResult',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: AssessmentResultWidget(),
          ),
        ),
        FFRoute(
          name: 'Results_viewMore',
          path: '/resultsViewMore',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ResultsViewMoreWidget(),
          ),
        ),
        FFRoute(
          name: 'Album',
          path: '/album',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Album') : const AlbumWidget(),
        ),
        FFRoute(
          name: 'Smile-recognition',
          path: '/smileRecognition',
          builder: (context, params) => const SmileRecognitionWidget(),
        ),
        FFRoute(
          name: 'report_rating',
          path: '/reportRating',
          builder: (context, params) => const ReportRatingWidget(),
        ),
        FFRoute(
          name: 'Editprofile',
          path: '/editprofile',
          builder: (context, params) => const EditprofileWidget(),
        ),
        FFRoute(
          name: 'EditNotificationSettings',
          path: '/editNotificationSettings',
          builder: (context, params) => const EditNotificationSettingsWidget(),
        ),
        FFRoute(
          name: 'ReservatonsPageCopy',
          path: '/reservatonsPageCopy',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ReservatonsPageCopyWidget(),
          ),
        ),
        FFRoute(
          name: 'success2',
          path: '/success2',
          builder: (context, params) => const Success2Widget(),
        ),
        FFRoute(
          name: 'ReservationDeatils',
          path: '/reservationDeatils',
          builder: (context, params) => ReservationDeatilsWidget(
            docID: params.getParam(
              'docID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Doctors'],
            ),
          ),
        ),
        FFRoute(
          name: 'ReservatonsPageCopyCopy',
          path: '/reservatonsPageCopyCopy',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: ReservatonsPageCopyCopyWidget(),
          ),
        ),
        FFRoute(
          name: 'ST_ResultsCopy',
          path: '/sTResultsCopy',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: STResultsCopyWidget(),
          ),
        ),
        FFRoute(
          name: 'you',
          path: '/you',
          builder: (context, params) => const YouWidget(),
        ),
        FFRoute(
          name: 'DeatilsCopyCopy',
          path: '/deatilsCopyCopy',
          builder: (context, params) => const DeatilsCopyCopyWidget(),
        ),
        FFRoute(
          name: 'ReservationDeatilsCopy',
          path: '/reservationDeatilsCopy',
          builder: (context, params) => ReservationDeatilsCopyWidget(
            docID: params.getParam(
              'docID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Doctors'],
            ),
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Doctors', 'availableSlots'],
            ),
          ),
        ),
        FFRoute(
          name: 'ReservationDeatilsCopyCopy',
          path: '/reservationDeatilsCopyCopy',
          builder: (context, params) => ReservationDeatilsCopyCopyWidget(
            docID: params.getParam(
              'docID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Doctors'],
            ),
          ),
        ),
        FFRoute(
          name: 'List06UserSearch',
          path: '/list06UserSearch',
          builder: (context, params) => const List06UserSearchWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/homePage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
