import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareOptionsWidget extends StatefulWidget {
  const ShareOptionsWidget({Key key}) : super(key: key);

  @override
  _ShareOptionsWidgetState createState() => _ShareOptionsWidgetState();
}

class _ShareOptionsWidgetState extends State<ShareOptionsWidget> {
  String dropDownValue;
  String shareOutput;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DevicesRecord>>(
      stream: queryDevicesRecord(
        queryBuilder: (devicesRecord) => devicesRecord.where('user_reference',
            isEqualTo: currentUserReference),
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
        List<DevicesRecord> containerDevicesRecordList = snapshot.data;
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF262D34),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(0, -3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.send,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: AutoSizeText(
                          'mydog.png, graduation.mp4',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Color(0x80FFFFFF),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                    child: Text(
                      'My Devices:',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: StreamBuilder<List<DevicesRecord>>(
                    stream: queryDevicesRecord(
                      queryBuilder: (devicesRecord) => devicesRecord.where(
                          'user_reference',
                          isEqualTo: currentUserReference),
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
                      List<DevicesRecord> wrapDevicesRecordList = snapshot.data;
                      return Wrap(
                        spacing: 5,
                        runSpacing: 10,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(wrapDevicesRecordList.length,
                            (wrapIndex) {
                          final wrapDevicesRecord =
                              wrapDevicesRecordList[wrapIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      valueOrDefault<String>(
                                        wrapDevicesRecord.name,
                                        'default',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                  ToggleIcon(
                                    onPressed: () async {
                                      final devicesUpdateData =
                                          createDevicesRecordData(
                                        checkbox: !wrapDevicesRecord.checkbox,
                                      );
                                      await wrapDevicesRecord.reference
                                          .update(devicesUpdateData);
                                    },
                                    value: wrapDevicesRecord.checkbox,
                                    onIcon: Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                      size: 25,
                                    ),
                                    offIcon: Icon(
                                      Icons.check_box_outline_blank,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Divider(
                  thickness: 0.1,
                  color: Color(0x80FFFFFF),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                    child: Text(
                      'Conversation:',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                  child: StreamBuilder<List<ConversationsRecord>>(
                    stream: queryConversationsRecord(
                      queryBuilder: (conversationsRecord) => conversationsRecord
                          .where('users', arrayContains: currentUserReference),
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
                      List<ConversationsRecord> wrapConversationsRecordList =
                          snapshot.data;
                      return Wrap(
                        spacing: 10,
                        runSpacing: 15,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: List.generate(
                            wrapConversationsRecordList.length, (wrapIndex) {
                          final wrapConversationsRecord =
                              wrapConversationsRecordList[wrapIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Container(
                              width: 80,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Color(0xFF262D34),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 75,
                                          height: 75,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF5E4FEE),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                color: Color(0xFF8A80E9),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.chat_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            size: 36,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AutoSizeText(
                                          valueOrDefault<String>(
                                            wrapConversationsRecord.name,
                                            'default',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiaryColor,
                                                fontSize: 13,
                                              ),
                                        ),
                                        ToggleIcon(
                                          onPressed: () async {
                                            final conversationsUpdateData =
                                                createConversationsRecordData(
                                              checkbox: !wrapConversationsRecord
                                                  .checkbox,
                                            );
                                            await wrapConversationsRecord
                                                .reference
                                                .update(
                                                    conversationsUpdateData);
                                          },
                                          value:
                                              wrapConversationsRecord.checkbox,
                                          onIcon: Icon(
                                            Icons.check_box,
                                            color: Color(0xFF5E4FEE),
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color(0xFFF1F4F8),
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: FlutterFlowDropDown(
                    initialOption: dropDownValue ??= 'One Time Share',
                    options: ['One Time Share', 'Save to Cloud'].toList(),
                    onChanged: (val) => setState(() => dropDownValue = val),
                    width: 180,
                    height: 50,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).tertiaryColor,
                        ),
                    hintText: 'Saving option',
                    fillColor: Color(0x3B1D2429),
                    elevation: 30,
                    borderColor: FlutterFlowTheme.of(context).tertiaryColor,
                    borderWidth: 1,
                    borderRadius: 20,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                  child: StreamBuilder<List<ConversationsRecord>>(
                    stream: queryConversationsRecord(
                      queryBuilder: (conversationsRecord) => conversationsRecord
                          .where('users', arrayContains: currentUserReference),
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
                      List<ConversationsRecord> buttonConversationsRecordList =
                          snapshot.data;
                      return FFButtonWidget(
                        onPressed: () async {
                          shareOutput = await actions.shareMain(
                            containerDevicesRecordList.toList(),
                            buttonConversationsRecordList.toList(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                valueOrDefault<String>(
                                  shareOutput,
                                  'error with \"shareOutput\"',
                                ),
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFF9B93E6),
                            ),
                          );
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Confirm',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60,
                          color: Color(0xFF4B39EF),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 40,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
