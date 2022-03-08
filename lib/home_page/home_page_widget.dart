import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/share_options_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../profile/profile_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  String pasted;
  String uploadedFileUrl = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) =>
            usersRecord.where('email', isEqualTo: currentUserEmail),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        List<UsersRecord> homePageUsersRecordList = snapshot.data;
        final homePageUsersRecord = homePageUsersRecordList.isNotEmpty
            ? homePageUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome,',
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .dark900,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where('email',
                                            isEqualTo: currentUserEmail),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> textUsersRecordList =
                                        snapshot.data;
                                    // Return an empty Container when the document does not exist.
                                    if (snapshot.data.isEmpty) {
                                      return Container();
                                    }
                                    final textUsersRecord =
                                        textUsersRecordList.isNotEmpty
                                            ? textUsersRecordList.first
                                            : null;
                                    return Text(
                                      valueOrDefault<String>(
                                        homePageUsersRecord.displayName,
                                        'Tim E',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 32,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 500),
                                  child: ProfileWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: 70,
                              height: 70,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/undraw_profile_pic_ic5t.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    child: ShareOptionsWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'Send',
                          options: FFButtonOptions(
                            width: 230,
                            height: 80,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'Number of files: ${FFAppState().chosen.toString()}',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: AutoSizeText(
                          'What to send?',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                pasted = await actions.copyFromClipboard();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Pasted from clipboard: ${pasted}',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryColor,
                                  ),
                                );

                                setState(() {});
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Copy\nFrom\nClipboard',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .dark900,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                    allowVideo: true,
                                    pickerFontFamily: 'Lexend Deca',
                                  );
                                  if (selectedMedia != null &&
                                      validateFileFormat(
                                          selectedMedia.storagePath, context)) {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    final downloadUrl = await uploadData(
                                        selectedMedia.storagePath,
                                        selectedMedia.bytes);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    if (downloadUrl != null) {
                                      setState(
                                          () => uploadedFileUrl = downloadUrl);
                                      showUploadMessage(
                                        context,
                                        'Success!',
                                      );
                                    } else {
                                      showUploadMessage(
                                        context,
                                        'Failed to upload media',
                                      );
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Upload\nImage/Video',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .dark900,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Upload File',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .dark900,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                          child: Text(
                            'Recent Files',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().chosen =
                                    FFAppState().chosen + 1);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/image-attachment-icon.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: AutoSizeText(
                                          'coolpic.png',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark900,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().chosen =
                                    FFAppState().chosen + 1);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/image-attachment-icon.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: AutoSizeText(
                                          'mydog.jpeg',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark900,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().chosen =
                                    FFAppState().chosen + 1);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/video-file-attachment-icon.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: AutoSizeText(
                                          'grads.mp4',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark900,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().chosen =
                                    FFAppState().chosen + 1);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .tertiaryColor,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/zip-file-attachament-icon.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: AutoSizeText(
                                          'hw.zip',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark900,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
