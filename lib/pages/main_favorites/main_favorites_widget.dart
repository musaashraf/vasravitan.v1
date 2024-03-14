import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_list/loading_list_widget.dart';
import '/components/product_list_view/product_list_view_widget.dart';
import '/components/top_nav/top_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_favorites_model.dart';
export 'main_favorites_model.dart';

class MainFavoritesWidget extends StatefulWidget {
  const MainFavoritesWidget({super.key});

  @override
  State<MainFavoritesWidget> createState() => _MainFavoritesWidgetState();
}

class _MainFavoritesWidgetState extends State<MainFavoritesWidget> {
  late MainFavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainFavoritesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.topNavModel,
                  updateCallback: () => setState(() {}),
                  child: TopNavWidget(),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'My Favorites',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 0.0),
                          child: Text(
                            'Below are your items that you have favorited.',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 32.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final favoriteItems = (currentUserDocument
                                            ?.favoriteItems
                                            ?.toList() ??
                                        [])
                                    .toList();
                                if (favoriteItems.isEmpty) {
                                  return Center(
                                    child: Container(
                                      width: 300.0,
                                      height: 300.0,
                                      child: LoadingListWidget(
                                        title: 'No Favorites',
                                        bodyText:
                                            'You don\'t have any products in your favorite list.',
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: favoriteItems.length,
                                  itemBuilder: (context, favoriteItemsIndex) {
                                    final favoriteItemsItem =
                                        favoriteItems[favoriteItemsIndex];
                                    return FutureBuilder<ProductsRecord>(
                                      future: ProductsRecord.getDocumentOnce(
                                          favoriteItemsItem),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final productListViewProductsRecord =
                                            snapshot.data!;
                                        return wrapWithModel(
                                          model: _model.productListViewModels
                                              .getModel(
                                            productListViewProductsRecord
                                                .reference.id,
                                            favoriteItemsIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: ProductListViewWidget(
                                            key: Key(
                                              'Keyxyi_${productListViewProductsRecord.reference.id}',
                                            ),
                                            productRef:
                                                productListViewProductsRecord,
                                            favorited: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
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
    );
  }
}
