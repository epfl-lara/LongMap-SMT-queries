; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96882 () Bool)

(assert start!96882)

(declare-fun b_free!23199 () Bool)

(declare-fun b_next!23199 () Bool)

(assert (=> start!96882 (= b_free!23199 (not b_next!23199))))

(declare-fun tp!81553 () Bool)

(declare-fun b_and!37201 () Bool)

(assert (=> start!96882 (= tp!81553 b_and!37201)))

(declare-fun b!1102238 () Bool)

(declare-fun res!735477 () Bool)

(declare-fun e!629128 () Bool)

(assert (=> b!1102238 (=> (not res!735477) (not e!629128))))

(declare-datatypes ((array!71419 0))(
  ( (array!71420 (arr!34371 (Array (_ BitVec 32) (_ BitVec 64))) (size!34907 (_ BitVec 32))) )
))
(declare-fun lt!494475 () array!71419)

(declare-datatypes ((List!24017 0))(
  ( (Nil!24014) (Cons!24013 (h!25222 (_ BitVec 64)) (t!34262 List!24017)) )
))
(declare-fun arrayNoDuplicates!0 (array!71419 (_ BitVec 32) List!24017) Bool)

(assert (=> b!1102238 (= res!735477 (arrayNoDuplicates!0 lt!494475 #b00000000000000000000000000000000 Nil!24014))))

(declare-fun res!735482 () Bool)

(declare-fun e!629131 () Bool)

(assert (=> start!96882 (=> (not res!735482) (not e!629131))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96882 (= res!735482 (validMask!0 mask!1414))))

(assert (=> start!96882 e!629131))

(assert (=> start!96882 tp!81553))

(assert (=> start!96882 true))

(declare-fun tp_is_empty!27249 () Bool)

(assert (=> start!96882 tp_is_empty!27249))

(declare-fun _keys!1070 () array!71419)

(declare-fun array_inv!26474 (array!71419) Bool)

(assert (=> start!96882 (array_inv!26474 _keys!1070)))

(declare-datatypes ((V!41459 0))(
  ( (V!41460 (val!13681 Int)) )
))
(declare-datatypes ((ValueCell!12915 0))(
  ( (ValueCellFull!12915 (v!16312 V!41459)) (EmptyCell!12915) )
))
(declare-datatypes ((array!71421 0))(
  ( (array!71422 (arr!34372 (Array (_ BitVec 32) ValueCell!12915)) (size!34908 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71421)

(declare-fun e!629129 () Bool)

(declare-fun array_inv!26475 (array!71421) Bool)

(assert (=> start!96882 (and (array_inv!26475 _values!874) e!629129)))

(declare-fun b!1102239 () Bool)

(declare-fun res!735476 () Bool)

(assert (=> b!1102239 (=> (not res!735476) (not e!629131))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102239 (= res!735476 (validKeyInArray!0 k0!904))))

(declare-fun b!1102240 () Bool)

(declare-fun res!735480 () Bool)

(assert (=> b!1102240 (=> (not res!735480) (not e!629131))))

(assert (=> b!1102240 (= res!735480 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24014))))

(declare-fun b!1102241 () Bool)

(declare-fun e!629130 () Bool)

(assert (=> b!1102241 (= e!629130 tp_is_empty!27249)))

(declare-fun b!1102242 () Bool)

(declare-fun res!735484 () Bool)

(assert (=> b!1102242 (=> (not res!735484) (not e!629131))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102242 (= res!735484 (= (select (arr!34371 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42664 () Bool)

(declare-fun mapRes!42664 () Bool)

(assert (=> mapIsEmpty!42664 mapRes!42664))

(declare-fun b!1102243 () Bool)

(declare-datatypes ((tuple2!17402 0))(
  ( (tuple2!17403 (_1!8712 (_ BitVec 64)) (_2!8712 V!41459)) )
))
(declare-datatypes ((List!24018 0))(
  ( (Nil!24015) (Cons!24014 (h!25223 tuple2!17402) (t!34263 List!24018)) )
))
(declare-datatypes ((ListLongMap!15371 0))(
  ( (ListLongMap!15372 (toList!7701 List!24018)) )
))
(declare-fun lt!494476 () ListLongMap!15371)

(declare-fun lt!494469 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!494473 () ListLongMap!15371)

(assert (=> b!1102243 (= e!629128 (not (or (and (not lt!494469) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494469) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494469) (= lt!494476 lt!494473))))))

(assert (=> b!1102243 (= lt!494469 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41459)

(declare-fun lt!494467 () ListLongMap!15371)

(declare-fun zeroValue!831 () V!41459)

(declare-fun getCurrentListMap!4405 (array!71419 array!71421 (_ BitVec 32) (_ BitVec 32) V!41459 V!41459 (_ BitVec 32) Int) ListLongMap!15371)

(assert (=> b!1102243 (= lt!494467 (getCurrentListMap!4405 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494468 () array!71421)

(assert (=> b!1102243 (= lt!494476 (getCurrentListMap!4405 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494474 () ListLongMap!15371)

(assert (=> b!1102243 (and (= lt!494473 lt!494474) (= lt!494474 lt!494473))))

(declare-fun lt!494472 () ListLongMap!15371)

(declare-fun -!984 (ListLongMap!15371 (_ BitVec 64)) ListLongMap!15371)

(assert (=> b!1102243 (= lt!494474 (-!984 lt!494472 k0!904))))

(declare-datatypes ((Unit!36220 0))(
  ( (Unit!36221) )
))
(declare-fun lt!494470 () Unit!36220)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!231 (array!71419 array!71421 (_ BitVec 32) (_ BitVec 32) V!41459 V!41459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36220)

(assert (=> b!1102243 (= lt!494470 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4201 (array!71419 array!71421 (_ BitVec 32) (_ BitVec 32) V!41459 V!41459 (_ BitVec 32) Int) ListLongMap!15371)

(assert (=> b!1102243 (= lt!494473 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2336 (Int (_ BitVec 64)) V!41459)

(assert (=> b!1102243 (= lt!494468 (array!71422 (store (arr!34372 _values!874) i!650 (ValueCellFull!12915 (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34908 _values!874)))))

(assert (=> b!1102243 (= lt!494472 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102243 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494471 () Unit!36220)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71419 (_ BitVec 64) (_ BitVec 32)) Unit!36220)

(assert (=> b!1102243 (= lt!494471 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102244 () Bool)

(declare-fun e!629127 () Bool)

(assert (=> b!1102244 (= e!629127 tp_is_empty!27249)))

(declare-fun b!1102245 () Bool)

(declare-fun res!735479 () Bool)

(assert (=> b!1102245 (=> (not res!735479) (not e!629131))))

(assert (=> b!1102245 (= res!735479 (and (= (size!34908 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34907 _keys!1070) (size!34908 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102246 () Bool)

(declare-fun res!735481 () Bool)

(assert (=> b!1102246 (=> (not res!735481) (not e!629131))))

(assert (=> b!1102246 (= res!735481 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34907 _keys!1070))))))

(declare-fun mapNonEmpty!42664 () Bool)

(declare-fun tp!81554 () Bool)

(assert (=> mapNonEmpty!42664 (= mapRes!42664 (and tp!81554 e!629130))))

(declare-fun mapKey!42664 () (_ BitVec 32))

(declare-fun mapValue!42664 () ValueCell!12915)

(declare-fun mapRest!42664 () (Array (_ BitVec 32) ValueCell!12915))

(assert (=> mapNonEmpty!42664 (= (arr!34372 _values!874) (store mapRest!42664 mapKey!42664 mapValue!42664))))

(declare-fun b!1102247 () Bool)

(assert (=> b!1102247 (= e!629131 e!629128)))

(declare-fun res!735483 () Bool)

(assert (=> b!1102247 (=> (not res!735483) (not e!629128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71419 (_ BitVec 32)) Bool)

(assert (=> b!1102247 (= res!735483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494475 mask!1414))))

(assert (=> b!1102247 (= lt!494475 (array!71420 (store (arr!34371 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34907 _keys!1070)))))

(declare-fun b!1102248 () Bool)

(declare-fun res!735478 () Bool)

(assert (=> b!1102248 (=> (not res!735478) (not e!629131))))

(assert (=> b!1102248 (= res!735478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102249 () Bool)

(assert (=> b!1102249 (= e!629129 (and e!629127 mapRes!42664))))

(declare-fun condMapEmpty!42664 () Bool)

(declare-fun mapDefault!42664 () ValueCell!12915)

(assert (=> b!1102249 (= condMapEmpty!42664 (= (arr!34372 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12915)) mapDefault!42664)))))

(assert (= (and start!96882 res!735482) b!1102245))

(assert (= (and b!1102245 res!735479) b!1102248))

(assert (= (and b!1102248 res!735478) b!1102240))

(assert (= (and b!1102240 res!735480) b!1102246))

(assert (= (and b!1102246 res!735481) b!1102239))

(assert (= (and b!1102239 res!735476) b!1102242))

(assert (= (and b!1102242 res!735484) b!1102247))

(assert (= (and b!1102247 res!735483) b!1102238))

(assert (= (and b!1102238 res!735477) b!1102243))

(assert (= (and b!1102249 condMapEmpty!42664) mapIsEmpty!42664))

(assert (= (and b!1102249 (not condMapEmpty!42664)) mapNonEmpty!42664))

(get-info :version)

(assert (= (and mapNonEmpty!42664 ((_ is ValueCellFull!12915) mapValue!42664)) b!1102241))

(assert (= (and b!1102249 ((_ is ValueCellFull!12915) mapDefault!42664)) b!1102244))

(assert (= start!96882 b!1102249))

(declare-fun b_lambda!18157 () Bool)

(assert (=> (not b_lambda!18157) (not b!1102243)))

(declare-fun t!34261 () Bool)

(declare-fun tb!8065 () Bool)

(assert (=> (and start!96882 (= defaultEntry!882 defaultEntry!882) t!34261) tb!8065))

(declare-fun result!16673 () Bool)

(assert (=> tb!8065 (= result!16673 tp_is_empty!27249)))

(assert (=> b!1102243 t!34261))

(declare-fun b_and!37203 () Bool)

(assert (= b_and!37201 (and (=> t!34261 result!16673) b_and!37203)))

(declare-fun m!1022533 () Bool)

(assert (=> b!1102239 m!1022533))

(declare-fun m!1022535 () Bool)

(assert (=> b!1102238 m!1022535))

(declare-fun m!1022537 () Bool)

(assert (=> b!1102247 m!1022537))

(declare-fun m!1022539 () Bool)

(assert (=> b!1102247 m!1022539))

(declare-fun m!1022541 () Bool)

(assert (=> b!1102240 m!1022541))

(declare-fun m!1022543 () Bool)

(assert (=> mapNonEmpty!42664 m!1022543))

(declare-fun m!1022545 () Bool)

(assert (=> start!96882 m!1022545))

(declare-fun m!1022547 () Bool)

(assert (=> start!96882 m!1022547))

(declare-fun m!1022549 () Bool)

(assert (=> start!96882 m!1022549))

(declare-fun m!1022551 () Bool)

(assert (=> b!1102243 m!1022551))

(declare-fun m!1022553 () Bool)

(assert (=> b!1102243 m!1022553))

(declare-fun m!1022555 () Bool)

(assert (=> b!1102243 m!1022555))

(declare-fun m!1022557 () Bool)

(assert (=> b!1102243 m!1022557))

(declare-fun m!1022559 () Bool)

(assert (=> b!1102243 m!1022559))

(declare-fun m!1022561 () Bool)

(assert (=> b!1102243 m!1022561))

(declare-fun m!1022563 () Bool)

(assert (=> b!1102243 m!1022563))

(declare-fun m!1022565 () Bool)

(assert (=> b!1102243 m!1022565))

(declare-fun m!1022567 () Bool)

(assert (=> b!1102243 m!1022567))

(declare-fun m!1022569 () Bool)

(assert (=> b!1102243 m!1022569))

(declare-fun m!1022571 () Bool)

(assert (=> b!1102242 m!1022571))

(declare-fun m!1022573 () Bool)

(assert (=> b!1102248 m!1022573))

(check-sat (not b_lambda!18157) (not b!1102243) (not b!1102247) (not start!96882) (not mapNonEmpty!42664) (not b_next!23199) (not b!1102238) b_and!37203 (not b!1102240) tp_is_empty!27249 (not b!1102239) (not b!1102248))
(check-sat b_and!37203 (not b_next!23199))
(get-model)

(declare-fun b_lambda!18161 () Bool)

(assert (= b_lambda!18157 (or (and start!96882 b_free!23199) b_lambda!18161)))

(check-sat (not b!1102243) (not start!96882) (not mapNonEmpty!42664) (not b_next!23199) (not b!1102247) (not b_lambda!18161) (not b!1102238) b_and!37203 (not b!1102240) tp_is_empty!27249 (not b!1102239) (not b!1102248))
(check-sat b_and!37203 (not b_next!23199))
(get-model)

(declare-fun b!1102300 () Bool)

(declare-fun e!629161 () Bool)

(declare-fun contains!6407 (List!24017 (_ BitVec 64)) Bool)

(assert (=> b!1102300 (= e!629161 (contains!6407 Nil!24014 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102301 () Bool)

(declare-fun e!629160 () Bool)

(declare-fun call!46227 () Bool)

(assert (=> b!1102301 (= e!629160 call!46227)))

(declare-fun b!1102302 () Bool)

(declare-fun e!629158 () Bool)

(declare-fun e!629159 () Bool)

(assert (=> b!1102302 (= e!629158 e!629159)))

(declare-fun res!735519 () Bool)

(assert (=> b!1102302 (=> (not res!735519) (not e!629159))))

(assert (=> b!1102302 (= res!735519 (not e!629161))))

(declare-fun res!735518 () Bool)

(assert (=> b!1102302 (=> (not res!735518) (not e!629161))))

(assert (=> b!1102302 (= res!735518 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46224 () Bool)

(declare-fun c!108871 () Bool)

(assert (=> bm!46224 (= call!46227 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108871 (Cons!24013 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000) Nil!24014) Nil!24014)))))

(declare-fun d!130723 () Bool)

(declare-fun res!735520 () Bool)

(assert (=> d!130723 (=> res!735520 e!629158)))

(assert (=> d!130723 (= res!735520 (bvsge #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> d!130723 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24014) e!629158)))

(declare-fun b!1102303 () Bool)

(assert (=> b!1102303 (= e!629159 e!629160)))

(assert (=> b!1102303 (= c!108871 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102304 () Bool)

(assert (=> b!1102304 (= e!629160 call!46227)))

(assert (= (and d!130723 (not res!735520)) b!1102302))

(assert (= (and b!1102302 res!735518) b!1102300))

(assert (= (and b!1102302 res!735519) b!1102303))

(assert (= (and b!1102303 c!108871) b!1102301))

(assert (= (and b!1102303 (not c!108871)) b!1102304))

(assert (= (or b!1102301 b!1102304) bm!46224))

(declare-fun m!1022617 () Bool)

(assert (=> b!1102300 m!1022617))

(assert (=> b!1102300 m!1022617))

(declare-fun m!1022619 () Bool)

(assert (=> b!1102300 m!1022619))

(assert (=> b!1102302 m!1022617))

(assert (=> b!1102302 m!1022617))

(declare-fun m!1022621 () Bool)

(assert (=> b!1102302 m!1022621))

(assert (=> bm!46224 m!1022617))

(declare-fun m!1022623 () Bool)

(assert (=> bm!46224 m!1022623))

(assert (=> b!1102303 m!1022617))

(assert (=> b!1102303 m!1022617))

(assert (=> b!1102303 m!1022621))

(assert (=> b!1102240 d!130723))

(declare-fun b!1102313 () Bool)

(declare-fun e!629169 () Bool)

(declare-fun e!629170 () Bool)

(assert (=> b!1102313 (= e!629169 e!629170)))

(declare-fun c!108874 () Bool)

(assert (=> b!1102313 (= c!108874 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102314 () Bool)

(declare-fun e!629168 () Bool)

(assert (=> b!1102314 (= e!629170 e!629168)))

(declare-fun lt!494514 () (_ BitVec 64))

(assert (=> b!1102314 (= lt!494514 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494515 () Unit!36220)

(assert (=> b!1102314 (= lt!494515 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494514 #b00000000000000000000000000000000))))

(assert (=> b!1102314 (arrayContainsKey!0 _keys!1070 lt!494514 #b00000000000000000000000000000000)))

(declare-fun lt!494513 () Unit!36220)

(assert (=> b!1102314 (= lt!494513 lt!494515)))

(declare-fun res!735525 () Bool)

(declare-datatypes ((SeekEntryResult!9916 0))(
  ( (MissingZero!9916 (index!42035 (_ BitVec 32))) (Found!9916 (index!42036 (_ BitVec 32))) (Intermediate!9916 (undefined!10728 Bool) (index!42037 (_ BitVec 32)) (x!99138 (_ BitVec 32))) (Undefined!9916) (MissingVacant!9916 (index!42038 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71419 (_ BitVec 32)) SeekEntryResult!9916)

(assert (=> b!1102314 (= res!735525 (= (seekEntryOrOpen!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9916 #b00000000000000000000000000000000)))))

(assert (=> b!1102314 (=> (not res!735525) (not e!629168))))

(declare-fun d!130725 () Bool)

(declare-fun res!735526 () Bool)

(assert (=> d!130725 (=> res!735526 e!629169)))

(assert (=> d!130725 (= res!735526 (bvsge #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> d!130725 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629169)))

(declare-fun bm!46227 () Bool)

(declare-fun call!46230 () Bool)

(assert (=> bm!46227 (= call!46230 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1102315 () Bool)

(assert (=> b!1102315 (= e!629170 call!46230)))

(declare-fun b!1102316 () Bool)

(assert (=> b!1102316 (= e!629168 call!46230)))

(assert (= (and d!130725 (not res!735526)) b!1102313))

(assert (= (and b!1102313 c!108874) b!1102314))

(assert (= (and b!1102313 (not c!108874)) b!1102315))

(assert (= (and b!1102314 res!735525) b!1102316))

(assert (= (or b!1102316 b!1102315) bm!46227))

(assert (=> b!1102313 m!1022617))

(assert (=> b!1102313 m!1022617))

(assert (=> b!1102313 m!1022621))

(assert (=> b!1102314 m!1022617))

(declare-fun m!1022625 () Bool)

(assert (=> b!1102314 m!1022625))

(declare-fun m!1022627 () Bool)

(assert (=> b!1102314 m!1022627))

(assert (=> b!1102314 m!1022617))

(declare-fun m!1022629 () Bool)

(assert (=> b!1102314 m!1022629))

(declare-fun m!1022631 () Bool)

(assert (=> bm!46227 m!1022631))

(assert (=> b!1102248 d!130725))

(declare-fun d!130727 () Bool)

(assert (=> d!130727 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96882 d!130727))

(declare-fun d!130729 () Bool)

(assert (=> d!130729 (= (array_inv!26474 _keys!1070) (bvsge (size!34907 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96882 d!130729))

(declare-fun d!130731 () Bool)

(assert (=> d!130731 (= (array_inv!26475 _values!874) (bvsge (size!34908 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96882 d!130731))

(declare-fun d!130733 () Bool)

(assert (=> d!130733 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102239 d!130733))

(declare-fun d!130735 () Bool)

(declare-fun res!735531 () Bool)

(declare-fun e!629175 () Bool)

(assert (=> d!130735 (=> res!735531 e!629175)))

(assert (=> d!130735 (= res!735531 (= (select (arr!34371 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130735 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629175)))

(declare-fun b!1102321 () Bool)

(declare-fun e!629176 () Bool)

(assert (=> b!1102321 (= e!629175 e!629176)))

(declare-fun res!735532 () Bool)

(assert (=> b!1102321 (=> (not res!735532) (not e!629176))))

(assert (=> b!1102321 (= res!735532 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34907 _keys!1070)))))

(declare-fun b!1102322 () Bool)

(assert (=> b!1102322 (= e!629176 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130735 (not res!735531)) b!1102321))

(assert (= (and b!1102321 res!735532) b!1102322))

(assert (=> d!130735 m!1022617))

(declare-fun m!1022633 () Bool)

(assert (=> b!1102322 m!1022633))

(assert (=> b!1102243 d!130735))

(declare-fun call!46251 () ListLongMap!15371)

(declare-fun c!108889 () Bool)

(declare-fun call!46245 () ListLongMap!15371)

(declare-fun call!46248 () ListLongMap!15371)

(declare-fun bm!46242 () Bool)

(declare-fun call!46246 () ListLongMap!15371)

(declare-fun c!108887 () Bool)

(declare-fun +!3404 (ListLongMap!15371 tuple2!17402) ListLongMap!15371)

(assert (=> bm!46242 (= call!46251 (+!3404 (ite c!108887 call!46246 (ite c!108889 call!46245 call!46248)) (ite (or c!108887 c!108889) (tuple2!17403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102365 () Bool)

(declare-fun e!629214 () Bool)

(declare-fun e!629212 () Bool)

(assert (=> b!1102365 (= e!629214 e!629212)))

(declare-fun res!735557 () Bool)

(declare-fun call!46247 () Bool)

(assert (=> b!1102365 (= res!735557 call!46247)))

(assert (=> b!1102365 (=> (not res!735557) (not e!629212))))

(declare-fun bm!46243 () Bool)

(declare-fun lt!494569 () ListLongMap!15371)

(declare-fun contains!6408 (ListLongMap!15371 (_ BitVec 64)) Bool)

(assert (=> bm!46243 (= call!46247 (contains!6408 lt!494569 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46244 () Bool)

(declare-fun call!46250 () Bool)

(assert (=> bm!46244 (= call!46250 (contains!6408 lt!494569 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102366 () Bool)

(declare-fun e!629205 () Unit!36220)

(declare-fun Unit!36222 () Unit!36220)

(assert (=> b!1102366 (= e!629205 Unit!36222)))

(declare-fun bm!46245 () Bool)

(declare-fun call!46249 () ListLongMap!15371)

(assert (=> bm!46245 (= call!46249 call!46251)))

(declare-fun b!1102367 () Bool)

(declare-fun lt!494574 () Unit!36220)

(assert (=> b!1102367 (= e!629205 lt!494574)))

(declare-fun lt!494580 () ListLongMap!15371)

(assert (=> b!1102367 (= lt!494580 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494566 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494573 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494573 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494572 () Unit!36220)

(declare-fun addStillContains!666 (ListLongMap!15371 (_ BitVec 64) V!41459 (_ BitVec 64)) Unit!36220)

(assert (=> b!1102367 (= lt!494572 (addStillContains!666 lt!494580 lt!494566 zeroValue!831 lt!494573))))

(assert (=> b!1102367 (contains!6408 (+!3404 lt!494580 (tuple2!17403 lt!494566 zeroValue!831)) lt!494573)))

(declare-fun lt!494560 () Unit!36220)

(assert (=> b!1102367 (= lt!494560 lt!494572)))

(declare-fun lt!494568 () ListLongMap!15371)

(assert (=> b!1102367 (= lt!494568 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494567 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494575 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494575 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494576 () Unit!36220)

(declare-fun addApplyDifferent!526 (ListLongMap!15371 (_ BitVec 64) V!41459 (_ BitVec 64)) Unit!36220)

(assert (=> b!1102367 (= lt!494576 (addApplyDifferent!526 lt!494568 lt!494567 minValue!831 lt!494575))))

(declare-fun apply!953 (ListLongMap!15371 (_ BitVec 64)) V!41459)

(assert (=> b!1102367 (= (apply!953 (+!3404 lt!494568 (tuple2!17403 lt!494567 minValue!831)) lt!494575) (apply!953 lt!494568 lt!494575))))

(declare-fun lt!494577 () Unit!36220)

(assert (=> b!1102367 (= lt!494577 lt!494576)))

(declare-fun lt!494578 () ListLongMap!15371)

(assert (=> b!1102367 (= lt!494578 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494561 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494571 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494571 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494563 () Unit!36220)

(assert (=> b!1102367 (= lt!494563 (addApplyDifferent!526 lt!494578 lt!494561 zeroValue!831 lt!494571))))

(assert (=> b!1102367 (= (apply!953 (+!3404 lt!494578 (tuple2!17403 lt!494561 zeroValue!831)) lt!494571) (apply!953 lt!494578 lt!494571))))

(declare-fun lt!494564 () Unit!36220)

(assert (=> b!1102367 (= lt!494564 lt!494563)))

(declare-fun lt!494581 () ListLongMap!15371)

(assert (=> b!1102367 (= lt!494581 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494570 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494565 () (_ BitVec 64))

(assert (=> b!1102367 (= lt!494565 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102367 (= lt!494574 (addApplyDifferent!526 lt!494581 lt!494570 minValue!831 lt!494565))))

(assert (=> b!1102367 (= (apply!953 (+!3404 lt!494581 (tuple2!17403 lt!494570 minValue!831)) lt!494565) (apply!953 lt!494581 lt!494565))))

(declare-fun b!1102368 () Bool)

(declare-fun e!629213 () Bool)

(declare-fun get!17665 (ValueCell!12915 V!41459) V!41459)

(assert (=> b!1102368 (= e!629213 (= (apply!953 lt!494569 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)) (get!17665 (select (arr!34372 _values!874) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34908 _values!874)))))

(assert (=> b!1102368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(declare-fun b!1102369 () Bool)

(declare-fun e!629209 () Bool)

(assert (=> b!1102369 (= e!629209 (not call!46250))))

(declare-fun b!1102370 () Bool)

(declare-fun res!735552 () Bool)

(declare-fun e!629203 () Bool)

(assert (=> b!1102370 (=> (not res!735552) (not e!629203))))

(declare-fun e!629207 () Bool)

(assert (=> b!1102370 (= res!735552 e!629207)))

(declare-fun res!735556 () Bool)

(assert (=> b!1102370 (=> res!735556 e!629207)))

(declare-fun e!629204 () Bool)

(assert (=> b!1102370 (= res!735556 (not e!629204))))

(declare-fun res!735558 () Bool)

(assert (=> b!1102370 (=> (not res!735558) (not e!629204))))

(assert (=> b!1102370 (= res!735558 (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(declare-fun b!1102371 () Bool)

(assert (=> b!1102371 (= e!629203 e!629214)))

(declare-fun c!108891 () Bool)

(assert (=> b!1102371 (= c!108891 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102372 () Bool)

(assert (=> b!1102372 (= e!629204 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102373 () Bool)

(declare-fun e!629211 () ListLongMap!15371)

(assert (=> b!1102373 (= e!629211 (+!3404 call!46251 (tuple2!17403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102374 () Bool)

(assert (=> b!1102374 (= e!629212 (= (apply!953 lt!494569 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46246 () Bool)

(assert (=> bm!46246 (= call!46248 call!46245)))

(declare-fun b!1102375 () Bool)

(declare-fun e!629215 () ListLongMap!15371)

(assert (=> b!1102375 (= e!629211 e!629215)))

(assert (=> b!1102375 (= c!108889 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130737 () Bool)

(assert (=> d!130737 e!629203))

(declare-fun res!735559 () Bool)

(assert (=> d!130737 (=> (not res!735559) (not e!629203))))

(assert (=> d!130737 (= res!735559 (or (bvsge #b00000000000000000000000000000000 (size!34907 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))))

(declare-fun lt!494579 () ListLongMap!15371)

(assert (=> d!130737 (= lt!494569 lt!494579)))

(declare-fun lt!494562 () Unit!36220)

(assert (=> d!130737 (= lt!494562 e!629205)))

(declare-fun c!108888 () Bool)

(declare-fun e!629210 () Bool)

(assert (=> d!130737 (= c!108888 e!629210)))

(declare-fun res!735551 () Bool)

(assert (=> d!130737 (=> (not res!735551) (not e!629210))))

(assert (=> d!130737 (= res!735551 (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> d!130737 (= lt!494579 e!629211)))

(assert (=> d!130737 (= c!108887 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130737 (validMask!0 mask!1414)))

(assert (=> d!130737 (= (getCurrentListMap!4405 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494569)))

(declare-fun bm!46247 () Bool)

(assert (=> bm!46247 (= call!46245 call!46246)))

(declare-fun b!1102376 () Bool)

(declare-fun e!629208 () ListLongMap!15371)

(assert (=> b!1102376 (= e!629208 call!46248)))

(declare-fun b!1102377 () Bool)

(declare-fun c!108890 () Bool)

(assert (=> b!1102377 (= c!108890 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102377 (= e!629215 e!629208)))

(declare-fun b!1102378 () Bool)

(declare-fun e!629206 () Bool)

(assert (=> b!1102378 (= e!629206 (= (apply!953 lt!494569 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102379 () Bool)

(assert (=> b!1102379 (= e!629208 call!46249)))

(declare-fun b!1102380 () Bool)

(assert (=> b!1102380 (= e!629210 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102381 () Bool)

(assert (=> b!1102381 (= e!629214 (not call!46247))))

(declare-fun b!1102382 () Bool)

(declare-fun res!735554 () Bool)

(assert (=> b!1102382 (=> (not res!735554) (not e!629203))))

(assert (=> b!1102382 (= res!735554 e!629209)))

(declare-fun c!108892 () Bool)

(assert (=> b!1102382 (= c!108892 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102383 () Bool)

(assert (=> b!1102383 (= e!629209 e!629206)))

(declare-fun res!735555 () Bool)

(assert (=> b!1102383 (= res!735555 call!46250)))

(assert (=> b!1102383 (=> (not res!735555) (not e!629206))))

(declare-fun bm!46248 () Bool)

(assert (=> bm!46248 (= call!46246 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102384 () Bool)

(assert (=> b!1102384 (= e!629207 e!629213)))

(declare-fun res!735553 () Bool)

(assert (=> b!1102384 (=> (not res!735553) (not e!629213))))

(assert (=> b!1102384 (= res!735553 (contains!6408 lt!494569 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102384 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(declare-fun b!1102385 () Bool)

(assert (=> b!1102385 (= e!629215 call!46249)))

(assert (= (and d!130737 c!108887) b!1102373))

(assert (= (and d!130737 (not c!108887)) b!1102375))

(assert (= (and b!1102375 c!108889) b!1102385))

(assert (= (and b!1102375 (not c!108889)) b!1102377))

(assert (= (and b!1102377 c!108890) b!1102379))

(assert (= (and b!1102377 (not c!108890)) b!1102376))

(assert (= (or b!1102379 b!1102376) bm!46246))

(assert (= (or b!1102385 bm!46246) bm!46247))

(assert (= (or b!1102385 b!1102379) bm!46245))

(assert (= (or b!1102373 bm!46247) bm!46248))

(assert (= (or b!1102373 bm!46245) bm!46242))

(assert (= (and d!130737 res!735551) b!1102380))

(assert (= (and d!130737 c!108888) b!1102367))

(assert (= (and d!130737 (not c!108888)) b!1102366))

(assert (= (and d!130737 res!735559) b!1102370))

(assert (= (and b!1102370 res!735558) b!1102372))

(assert (= (and b!1102370 (not res!735556)) b!1102384))

(assert (= (and b!1102384 res!735553) b!1102368))

(assert (= (and b!1102370 res!735552) b!1102382))

(assert (= (and b!1102382 c!108892) b!1102383))

(assert (= (and b!1102382 (not c!108892)) b!1102369))

(assert (= (and b!1102383 res!735555) b!1102378))

(assert (= (or b!1102383 b!1102369) bm!46244))

(assert (= (and b!1102382 res!735554) b!1102371))

(assert (= (and b!1102371 c!108891) b!1102365))

(assert (= (and b!1102371 (not c!108891)) b!1102381))

(assert (= (and b!1102365 res!735557) b!1102374))

(assert (= (or b!1102365 b!1102381) bm!46243))

(declare-fun b_lambda!18163 () Bool)

(assert (=> (not b_lambda!18163) (not b!1102368)))

(assert (=> b!1102368 t!34261))

(declare-fun b_and!37209 () Bool)

(assert (= b_and!37203 (and (=> t!34261 result!16673) b_and!37209)))

(declare-fun m!1022635 () Bool)

(assert (=> bm!46244 m!1022635))

(assert (=> b!1102368 m!1022551))

(declare-fun m!1022637 () Bool)

(assert (=> b!1102368 m!1022637))

(assert (=> b!1102368 m!1022551))

(declare-fun m!1022639 () Bool)

(assert (=> b!1102368 m!1022639))

(assert (=> b!1102368 m!1022617))

(declare-fun m!1022641 () Bool)

(assert (=> b!1102368 m!1022641))

(assert (=> b!1102368 m!1022617))

(assert (=> b!1102368 m!1022637))

(declare-fun m!1022643 () Bool)

(assert (=> b!1102378 m!1022643))

(declare-fun m!1022645 () Bool)

(assert (=> b!1102374 m!1022645))

(assert (=> b!1102384 m!1022617))

(assert (=> b!1102384 m!1022617))

(declare-fun m!1022647 () Bool)

(assert (=> b!1102384 m!1022647))

(declare-fun m!1022649 () Bool)

(assert (=> bm!46242 m!1022649))

(assert (=> b!1102380 m!1022617))

(assert (=> b!1102380 m!1022617))

(assert (=> b!1102380 m!1022621))

(assert (=> b!1102367 m!1022553))

(declare-fun m!1022651 () Bool)

(assert (=> b!1102367 m!1022651))

(declare-fun m!1022653 () Bool)

(assert (=> b!1102367 m!1022653))

(declare-fun m!1022655 () Bool)

(assert (=> b!1102367 m!1022655))

(declare-fun m!1022657 () Bool)

(assert (=> b!1102367 m!1022657))

(declare-fun m!1022659 () Bool)

(assert (=> b!1102367 m!1022659))

(declare-fun m!1022661 () Bool)

(assert (=> b!1102367 m!1022661))

(declare-fun m!1022663 () Bool)

(assert (=> b!1102367 m!1022663))

(declare-fun m!1022665 () Bool)

(assert (=> b!1102367 m!1022665))

(declare-fun m!1022667 () Bool)

(assert (=> b!1102367 m!1022667))

(assert (=> b!1102367 m!1022617))

(declare-fun m!1022669 () Bool)

(assert (=> b!1102367 m!1022669))

(assert (=> b!1102367 m!1022669))

(declare-fun m!1022671 () Bool)

(assert (=> b!1102367 m!1022671))

(declare-fun m!1022673 () Bool)

(assert (=> b!1102367 m!1022673))

(declare-fun m!1022675 () Bool)

(assert (=> b!1102367 m!1022675))

(assert (=> b!1102367 m!1022655))

(assert (=> b!1102367 m!1022663))

(declare-fun m!1022677 () Bool)

(assert (=> b!1102367 m!1022677))

(assert (=> b!1102367 m!1022661))

(declare-fun m!1022679 () Bool)

(assert (=> b!1102367 m!1022679))

(declare-fun m!1022681 () Bool)

(assert (=> bm!46243 m!1022681))

(assert (=> bm!46248 m!1022553))

(assert (=> d!130737 m!1022545))

(declare-fun m!1022683 () Bool)

(assert (=> b!1102373 m!1022683))

(assert (=> b!1102372 m!1022617))

(assert (=> b!1102372 m!1022617))

(assert (=> b!1102372 m!1022621))

(assert (=> b!1102243 d!130737))

(declare-fun d!130739 () Bool)

(declare-fun lt!494584 () ListLongMap!15371)

(assert (=> d!130739 (not (contains!6408 lt!494584 k0!904))))

(declare-fun removeStrictlySorted!87 (List!24018 (_ BitVec 64)) List!24018)

(assert (=> d!130739 (= lt!494584 (ListLongMap!15372 (removeStrictlySorted!87 (toList!7701 lt!494472) k0!904)))))

(assert (=> d!130739 (= (-!984 lt!494472 k0!904) lt!494584)))

(declare-fun bs!32342 () Bool)

(assert (= bs!32342 d!130739))

(declare-fun m!1022685 () Bool)

(assert (=> bs!32342 m!1022685))

(declare-fun m!1022687 () Bool)

(assert (=> bs!32342 m!1022687))

(assert (=> b!1102243 d!130739))

(declare-fun bm!46249 () Bool)

(declare-fun c!108895 () Bool)

(declare-fun c!108893 () Bool)

(declare-fun call!46253 () ListLongMap!15371)

(declare-fun call!46258 () ListLongMap!15371)

(declare-fun call!46252 () ListLongMap!15371)

(declare-fun call!46255 () ListLongMap!15371)

(assert (=> bm!46249 (= call!46258 (+!3404 (ite c!108893 call!46253 (ite c!108895 call!46252 call!46255)) (ite (or c!108893 c!108895) (tuple2!17403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102386 () Bool)

(declare-fun e!629227 () Bool)

(declare-fun e!629225 () Bool)

(assert (=> b!1102386 (= e!629227 e!629225)))

(declare-fun res!735566 () Bool)

(declare-fun call!46254 () Bool)

(assert (=> b!1102386 (= res!735566 call!46254)))

(assert (=> b!1102386 (=> (not res!735566) (not e!629225))))

(declare-fun bm!46250 () Bool)

(declare-fun lt!494594 () ListLongMap!15371)

(assert (=> bm!46250 (= call!46254 (contains!6408 lt!494594 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46251 () Bool)

(declare-fun call!46257 () Bool)

(assert (=> bm!46251 (= call!46257 (contains!6408 lt!494594 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102387 () Bool)

(declare-fun e!629218 () Unit!36220)

(declare-fun Unit!36223 () Unit!36220)

(assert (=> b!1102387 (= e!629218 Unit!36223)))

(declare-fun bm!46252 () Bool)

(declare-fun call!46256 () ListLongMap!15371)

(assert (=> bm!46252 (= call!46256 call!46258)))

(declare-fun b!1102388 () Bool)

(declare-fun lt!494599 () Unit!36220)

(assert (=> b!1102388 (= e!629218 lt!494599)))

(declare-fun lt!494605 () ListLongMap!15371)

(assert (=> b!1102388 (= lt!494605 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494591 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494598 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494598 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(declare-fun lt!494597 () Unit!36220)

(assert (=> b!1102388 (= lt!494597 (addStillContains!666 lt!494605 lt!494591 zeroValue!831 lt!494598))))

(assert (=> b!1102388 (contains!6408 (+!3404 lt!494605 (tuple2!17403 lt!494591 zeroValue!831)) lt!494598)))

(declare-fun lt!494585 () Unit!36220)

(assert (=> b!1102388 (= lt!494585 lt!494597)))

(declare-fun lt!494593 () ListLongMap!15371)

(assert (=> b!1102388 (= lt!494593 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494592 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494592 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494600 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494600 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(declare-fun lt!494601 () Unit!36220)

(assert (=> b!1102388 (= lt!494601 (addApplyDifferent!526 lt!494593 lt!494592 minValue!831 lt!494600))))

(assert (=> b!1102388 (= (apply!953 (+!3404 lt!494593 (tuple2!17403 lt!494592 minValue!831)) lt!494600) (apply!953 lt!494593 lt!494600))))

(declare-fun lt!494602 () Unit!36220)

(assert (=> b!1102388 (= lt!494602 lt!494601)))

(declare-fun lt!494603 () ListLongMap!15371)

(assert (=> b!1102388 (= lt!494603 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494586 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494596 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494596 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(declare-fun lt!494588 () Unit!36220)

(assert (=> b!1102388 (= lt!494588 (addApplyDifferent!526 lt!494603 lt!494586 zeroValue!831 lt!494596))))

(assert (=> b!1102388 (= (apply!953 (+!3404 lt!494603 (tuple2!17403 lt!494586 zeroValue!831)) lt!494596) (apply!953 lt!494603 lt!494596))))

(declare-fun lt!494589 () Unit!36220)

(assert (=> b!1102388 (= lt!494589 lt!494588)))

(declare-fun lt!494606 () ListLongMap!15371)

(assert (=> b!1102388 (= lt!494606 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494595 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494595 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494590 () (_ BitVec 64))

(assert (=> b!1102388 (= lt!494590 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(assert (=> b!1102388 (= lt!494599 (addApplyDifferent!526 lt!494606 lt!494595 minValue!831 lt!494590))))

(assert (=> b!1102388 (= (apply!953 (+!3404 lt!494606 (tuple2!17403 lt!494595 minValue!831)) lt!494590) (apply!953 lt!494606 lt!494590))))

(declare-fun b!1102389 () Bool)

(declare-fun e!629226 () Bool)

(assert (=> b!1102389 (= e!629226 (= (apply!953 lt!494594 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)) (get!17665 (select (arr!34372 lt!494468) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102389 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34908 lt!494468)))))

(assert (=> b!1102389 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(declare-fun b!1102390 () Bool)

(declare-fun e!629222 () Bool)

(assert (=> b!1102390 (= e!629222 (not call!46257))))

(declare-fun b!1102391 () Bool)

(declare-fun res!735561 () Bool)

(declare-fun e!629216 () Bool)

(assert (=> b!1102391 (=> (not res!735561) (not e!629216))))

(declare-fun e!629220 () Bool)

(assert (=> b!1102391 (= res!735561 e!629220)))

(declare-fun res!735565 () Bool)

(assert (=> b!1102391 (=> res!735565 e!629220)))

(declare-fun e!629217 () Bool)

(assert (=> b!1102391 (= res!735565 (not e!629217))))

(declare-fun res!735567 () Bool)

(assert (=> b!1102391 (=> (not res!735567) (not e!629217))))

(assert (=> b!1102391 (= res!735567 (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(declare-fun b!1102392 () Bool)

(assert (=> b!1102392 (= e!629216 e!629227)))

(declare-fun c!108897 () Bool)

(assert (=> b!1102392 (= c!108897 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102393 () Bool)

(assert (=> b!1102393 (= e!629217 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102394 () Bool)

(declare-fun e!629224 () ListLongMap!15371)

(assert (=> b!1102394 (= e!629224 (+!3404 call!46258 (tuple2!17403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102395 () Bool)

(assert (=> b!1102395 (= e!629225 (= (apply!953 lt!494594 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46253 () Bool)

(assert (=> bm!46253 (= call!46255 call!46252)))

(declare-fun b!1102396 () Bool)

(declare-fun e!629228 () ListLongMap!15371)

(assert (=> b!1102396 (= e!629224 e!629228)))

(assert (=> b!1102396 (= c!108895 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!130741 () Bool)

(assert (=> d!130741 e!629216))

(declare-fun res!735568 () Bool)

(assert (=> d!130741 (=> (not res!735568) (not e!629216))))

(assert (=> d!130741 (= res!735568 (or (bvsge #b00000000000000000000000000000000 (size!34907 lt!494475)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))))

(declare-fun lt!494604 () ListLongMap!15371)

(assert (=> d!130741 (= lt!494594 lt!494604)))

(declare-fun lt!494587 () Unit!36220)

(assert (=> d!130741 (= lt!494587 e!629218)))

(declare-fun c!108894 () Bool)

(declare-fun e!629223 () Bool)

(assert (=> d!130741 (= c!108894 e!629223)))

(declare-fun res!735560 () Bool)

(assert (=> d!130741 (=> (not res!735560) (not e!629223))))

(assert (=> d!130741 (= res!735560 (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (=> d!130741 (= lt!494604 e!629224)))

(assert (=> d!130741 (= c!108893 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130741 (validMask!0 mask!1414)))

(assert (=> d!130741 (= (getCurrentListMap!4405 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494594)))

(declare-fun bm!46254 () Bool)

(assert (=> bm!46254 (= call!46252 call!46253)))

(declare-fun b!1102397 () Bool)

(declare-fun e!629221 () ListLongMap!15371)

(assert (=> b!1102397 (= e!629221 call!46255)))

(declare-fun b!1102398 () Bool)

(declare-fun c!108896 () Bool)

(assert (=> b!1102398 (= c!108896 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1102398 (= e!629228 e!629221)))

(declare-fun b!1102399 () Bool)

(declare-fun e!629219 () Bool)

(assert (=> b!1102399 (= e!629219 (= (apply!953 lt!494594 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1102400 () Bool)

(assert (=> b!1102400 (= e!629221 call!46256)))

(declare-fun b!1102401 () Bool)

(assert (=> b!1102401 (= e!629223 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102402 () Bool)

(assert (=> b!1102402 (= e!629227 (not call!46254))))

(declare-fun b!1102403 () Bool)

(declare-fun res!735563 () Bool)

(assert (=> b!1102403 (=> (not res!735563) (not e!629216))))

(assert (=> b!1102403 (= res!735563 e!629222)))

(declare-fun c!108898 () Bool)

(assert (=> b!1102403 (= c!108898 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102404 () Bool)

(assert (=> b!1102404 (= e!629222 e!629219)))

(declare-fun res!735564 () Bool)

(assert (=> b!1102404 (= res!735564 call!46257)))

(assert (=> b!1102404 (=> (not res!735564) (not e!629219))))

(declare-fun bm!46255 () Bool)

(assert (=> bm!46255 (= call!46253 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102405 () Bool)

(assert (=> b!1102405 (= e!629220 e!629226)))

(declare-fun res!735562 () Bool)

(assert (=> b!1102405 (=> (not res!735562) (not e!629226))))

(assert (=> b!1102405 (= res!735562 (contains!6408 lt!494594 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(assert (=> b!1102405 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(declare-fun b!1102406 () Bool)

(assert (=> b!1102406 (= e!629228 call!46256)))

(assert (= (and d!130741 c!108893) b!1102394))

(assert (= (and d!130741 (not c!108893)) b!1102396))

(assert (= (and b!1102396 c!108895) b!1102406))

(assert (= (and b!1102396 (not c!108895)) b!1102398))

(assert (= (and b!1102398 c!108896) b!1102400))

(assert (= (and b!1102398 (not c!108896)) b!1102397))

(assert (= (or b!1102400 b!1102397) bm!46253))

(assert (= (or b!1102406 bm!46253) bm!46254))

(assert (= (or b!1102406 b!1102400) bm!46252))

(assert (= (or b!1102394 bm!46254) bm!46255))

(assert (= (or b!1102394 bm!46252) bm!46249))

(assert (= (and d!130741 res!735560) b!1102401))

(assert (= (and d!130741 c!108894) b!1102388))

(assert (= (and d!130741 (not c!108894)) b!1102387))

(assert (= (and d!130741 res!735568) b!1102391))

(assert (= (and b!1102391 res!735567) b!1102393))

(assert (= (and b!1102391 (not res!735565)) b!1102405))

(assert (= (and b!1102405 res!735562) b!1102389))

(assert (= (and b!1102391 res!735561) b!1102403))

(assert (= (and b!1102403 c!108898) b!1102404))

(assert (= (and b!1102403 (not c!108898)) b!1102390))

(assert (= (and b!1102404 res!735564) b!1102399))

(assert (= (or b!1102404 b!1102390) bm!46251))

(assert (= (and b!1102403 res!735563) b!1102392))

(assert (= (and b!1102392 c!108897) b!1102386))

(assert (= (and b!1102392 (not c!108897)) b!1102402))

(assert (= (and b!1102386 res!735566) b!1102395))

(assert (= (or b!1102386 b!1102402) bm!46250))

(declare-fun b_lambda!18165 () Bool)

(assert (=> (not b_lambda!18165) (not b!1102389)))

(assert (=> b!1102389 t!34261))

(declare-fun b_and!37211 () Bool)

(assert (= b_and!37209 (and (=> t!34261 result!16673) b_and!37211)))

(declare-fun m!1022689 () Bool)

(assert (=> bm!46251 m!1022689))

(assert (=> b!1102389 m!1022551))

(declare-fun m!1022691 () Bool)

(assert (=> b!1102389 m!1022691))

(assert (=> b!1102389 m!1022551))

(declare-fun m!1022693 () Bool)

(assert (=> b!1102389 m!1022693))

(declare-fun m!1022695 () Bool)

(assert (=> b!1102389 m!1022695))

(declare-fun m!1022697 () Bool)

(assert (=> b!1102389 m!1022697))

(assert (=> b!1102389 m!1022695))

(assert (=> b!1102389 m!1022691))

(declare-fun m!1022699 () Bool)

(assert (=> b!1102399 m!1022699))

(declare-fun m!1022701 () Bool)

(assert (=> b!1102395 m!1022701))

(assert (=> b!1102405 m!1022695))

(assert (=> b!1102405 m!1022695))

(declare-fun m!1022703 () Bool)

(assert (=> b!1102405 m!1022703))

(declare-fun m!1022705 () Bool)

(assert (=> bm!46249 m!1022705))

(assert (=> b!1102401 m!1022695))

(assert (=> b!1102401 m!1022695))

(declare-fun m!1022707 () Bool)

(assert (=> b!1102401 m!1022707))

(assert (=> b!1102388 m!1022559))

(declare-fun m!1022709 () Bool)

(assert (=> b!1102388 m!1022709))

(declare-fun m!1022711 () Bool)

(assert (=> b!1102388 m!1022711))

(declare-fun m!1022713 () Bool)

(assert (=> b!1102388 m!1022713))

(declare-fun m!1022715 () Bool)

(assert (=> b!1102388 m!1022715))

(declare-fun m!1022717 () Bool)

(assert (=> b!1102388 m!1022717))

(declare-fun m!1022719 () Bool)

(assert (=> b!1102388 m!1022719))

(declare-fun m!1022721 () Bool)

(assert (=> b!1102388 m!1022721))

(declare-fun m!1022723 () Bool)

(assert (=> b!1102388 m!1022723))

(declare-fun m!1022725 () Bool)

(assert (=> b!1102388 m!1022725))

(assert (=> b!1102388 m!1022695))

(declare-fun m!1022727 () Bool)

(assert (=> b!1102388 m!1022727))

(assert (=> b!1102388 m!1022727))

(declare-fun m!1022729 () Bool)

(assert (=> b!1102388 m!1022729))

(declare-fun m!1022731 () Bool)

(assert (=> b!1102388 m!1022731))

(declare-fun m!1022733 () Bool)

(assert (=> b!1102388 m!1022733))

(assert (=> b!1102388 m!1022713))

(assert (=> b!1102388 m!1022721))

(declare-fun m!1022735 () Bool)

(assert (=> b!1102388 m!1022735))

(assert (=> b!1102388 m!1022719))

(declare-fun m!1022737 () Bool)

(assert (=> b!1102388 m!1022737))

(declare-fun m!1022739 () Bool)

(assert (=> bm!46250 m!1022739))

(assert (=> bm!46255 m!1022559))

(assert (=> d!130741 m!1022545))

(declare-fun m!1022741 () Bool)

(assert (=> b!1102394 m!1022741))

(assert (=> b!1102393 m!1022695))

(assert (=> b!1102393 m!1022695))

(assert (=> b!1102393 m!1022707))

(assert (=> b!1102243 d!130741))

(declare-fun b!1102431 () Bool)

(declare-fun e!629243 () Bool)

(declare-fun e!629246 () Bool)

(assert (=> b!1102431 (= e!629243 e!629246)))

(declare-fun c!108908 () Bool)

(declare-fun e!629245 () Bool)

(assert (=> b!1102431 (= c!108908 e!629245)))

(declare-fun res!735579 () Bool)

(assert (=> b!1102431 (=> (not res!735579) (not e!629245))))

(assert (=> b!1102431 (= res!735579 (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(declare-fun b!1102432 () Bool)

(declare-fun e!629248 () ListLongMap!15371)

(declare-fun call!46261 () ListLongMap!15371)

(assert (=> b!1102432 (= e!629248 call!46261)))

(declare-fun b!1102433 () Bool)

(assert (=> b!1102433 (= e!629245 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(assert (=> b!1102433 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102434 () Bool)

(declare-fun e!629247 () Bool)

(declare-fun lt!494622 () ListLongMap!15371)

(declare-fun isEmpty!971 (ListLongMap!15371) Bool)

(assert (=> b!1102434 (= e!629247 (isEmpty!971 lt!494622))))

(declare-fun b!1102435 () Bool)

(declare-fun lt!494625 () Unit!36220)

(declare-fun lt!494626 () Unit!36220)

(assert (=> b!1102435 (= lt!494625 lt!494626)))

(declare-fun lt!494624 () (_ BitVec 64))

(declare-fun lt!494623 () (_ BitVec 64))

(declare-fun lt!494627 () ListLongMap!15371)

(declare-fun lt!494621 () V!41459)

(assert (=> b!1102435 (not (contains!6408 (+!3404 lt!494627 (tuple2!17403 lt!494624 lt!494621)) lt!494623))))

(declare-fun addStillNotContains!281 (ListLongMap!15371 (_ BitVec 64) V!41459 (_ BitVec 64)) Unit!36220)

(assert (=> b!1102435 (= lt!494626 (addStillNotContains!281 lt!494627 lt!494624 lt!494621 lt!494623))))

(assert (=> b!1102435 (= lt!494623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102435 (= lt!494621 (get!17665 (select (arr!34372 lt!494468) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102435 (= lt!494624 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(assert (=> b!1102435 (= lt!494627 call!46261)))

(assert (=> b!1102435 (= e!629248 (+!3404 call!46261 (tuple2!17403 (select (arr!34371 lt!494475) #b00000000000000000000000000000000) (get!17665 (select (arr!34372 lt!494468) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102436 () Bool)

(declare-fun res!735578 () Bool)

(assert (=> b!1102436 (=> (not res!735578) (not e!629243))))

(assert (=> b!1102436 (= res!735578 (not (contains!6408 lt!494622 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102437 () Bool)

(declare-fun e!629244 () ListLongMap!15371)

(assert (=> b!1102437 (= e!629244 e!629248)))

(declare-fun c!108909 () Bool)

(assert (=> b!1102437 (= c!108909 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102439 () Bool)

(assert (=> b!1102439 (= e!629247 (= lt!494622 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102440 () Bool)

(assert (=> b!1102440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (=> b!1102440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34908 lt!494468)))))

(declare-fun e!629249 () Bool)

(assert (=> b!1102440 (= e!629249 (= (apply!953 lt!494622 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)) (get!17665 (select (arr!34372 lt!494468) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46258 () Bool)

(assert (=> bm!46258 (= call!46261 (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102441 () Bool)

(assert (=> b!1102441 (= e!629246 e!629249)))

(assert (=> b!1102441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(declare-fun res!735577 () Bool)

(assert (=> b!1102441 (= res!735577 (contains!6408 lt!494622 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(assert (=> b!1102441 (=> (not res!735577) (not e!629249))))

(declare-fun b!1102442 () Bool)

(assert (=> b!1102442 (= e!629244 (ListLongMap!15372 Nil!24015))))

(declare-fun d!130743 () Bool)

(assert (=> d!130743 e!629243))

(declare-fun res!735580 () Bool)

(assert (=> d!130743 (=> (not res!735580) (not e!629243))))

(assert (=> d!130743 (= res!735580 (not (contains!6408 lt!494622 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130743 (= lt!494622 e!629244)))

(declare-fun c!108910 () Bool)

(assert (=> d!130743 (= c!108910 (bvsge #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (=> d!130743 (validMask!0 mask!1414)))

(assert (=> d!130743 (= (getCurrentListMapNoExtraKeys!4201 lt!494475 lt!494468 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494622)))

(declare-fun b!1102438 () Bool)

(assert (=> b!1102438 (= e!629246 e!629247)))

(declare-fun c!108907 () Bool)

(assert (=> b!1102438 (= c!108907 (bvslt #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (= (and d!130743 c!108910) b!1102442))

(assert (= (and d!130743 (not c!108910)) b!1102437))

(assert (= (and b!1102437 c!108909) b!1102435))

(assert (= (and b!1102437 (not c!108909)) b!1102432))

(assert (= (or b!1102435 b!1102432) bm!46258))

(assert (= (and d!130743 res!735580) b!1102436))

(assert (= (and b!1102436 res!735578) b!1102431))

(assert (= (and b!1102431 res!735579) b!1102433))

(assert (= (and b!1102431 c!108908) b!1102441))

(assert (= (and b!1102431 (not c!108908)) b!1102438))

(assert (= (and b!1102441 res!735577) b!1102440))

(assert (= (and b!1102438 c!108907) b!1102439))

(assert (= (and b!1102438 (not c!108907)) b!1102434))

(declare-fun b_lambda!18167 () Bool)

(assert (=> (not b_lambda!18167) (not b!1102435)))

(assert (=> b!1102435 t!34261))

(declare-fun b_and!37213 () Bool)

(assert (= b_and!37211 (and (=> t!34261 result!16673) b_and!37213)))

(declare-fun b_lambda!18169 () Bool)

(assert (=> (not b_lambda!18169) (not b!1102440)))

(assert (=> b!1102440 t!34261))

(declare-fun b_and!37215 () Bool)

(assert (= b_and!37213 (and (=> t!34261 result!16673) b_and!37215)))

(assert (=> b!1102440 m!1022695))

(declare-fun m!1022743 () Bool)

(assert (=> b!1102440 m!1022743))

(assert (=> b!1102440 m!1022691))

(assert (=> b!1102440 m!1022551))

(assert (=> b!1102440 m!1022693))

(assert (=> b!1102440 m!1022695))

(assert (=> b!1102440 m!1022691))

(assert (=> b!1102440 m!1022551))

(declare-fun m!1022745 () Bool)

(assert (=> b!1102435 m!1022745))

(declare-fun m!1022747 () Bool)

(assert (=> b!1102435 m!1022747))

(declare-fun m!1022749 () Bool)

(assert (=> b!1102435 m!1022749))

(assert (=> b!1102435 m!1022691))

(assert (=> b!1102435 m!1022551))

(assert (=> b!1102435 m!1022693))

(assert (=> b!1102435 m!1022695))

(declare-fun m!1022751 () Bool)

(assert (=> b!1102435 m!1022751))

(assert (=> b!1102435 m!1022745))

(assert (=> b!1102435 m!1022691))

(assert (=> b!1102435 m!1022551))

(assert (=> b!1102441 m!1022695))

(assert (=> b!1102441 m!1022695))

(declare-fun m!1022753 () Bool)

(assert (=> b!1102441 m!1022753))

(assert (=> b!1102437 m!1022695))

(assert (=> b!1102437 m!1022695))

(assert (=> b!1102437 m!1022707))

(assert (=> b!1102433 m!1022695))

(assert (=> b!1102433 m!1022695))

(assert (=> b!1102433 m!1022707))

(declare-fun m!1022755 () Bool)

(assert (=> b!1102436 m!1022755))

(declare-fun m!1022757 () Bool)

(assert (=> b!1102439 m!1022757))

(declare-fun m!1022759 () Bool)

(assert (=> b!1102434 m!1022759))

(declare-fun m!1022761 () Bool)

(assert (=> d!130743 m!1022761))

(assert (=> d!130743 m!1022545))

(assert (=> bm!46258 m!1022757))

(assert (=> b!1102243 d!130743))

(declare-fun b!1102449 () Bool)

(declare-fun e!629254 () Bool)

(declare-fun call!46267 () ListLongMap!15371)

(declare-fun call!46266 () ListLongMap!15371)

(assert (=> b!1102449 (= e!629254 (= call!46267 call!46266))))

(assert (=> b!1102449 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34908 _values!874)))))

(declare-fun d!130745 () Bool)

(declare-fun e!629255 () Bool)

(assert (=> d!130745 e!629255))

(declare-fun res!735583 () Bool)

(assert (=> d!130745 (=> (not res!735583) (not e!629255))))

(assert (=> d!130745 (= res!735583 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34907 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34907 _keys!1070))))))))

(declare-fun lt!494630 () Unit!36220)

(declare-fun choose!1772 (array!71419 array!71421 (_ BitVec 32) (_ BitVec 32) V!41459 V!41459 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36220)

(assert (=> d!130745 (= lt!494630 (choose!1772 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130745 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> d!130745 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494630)))

(declare-fun bm!46263 () Bool)

(assert (=> bm!46263 (= call!46266 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102450 () Bool)

(assert (=> b!1102450 (= e!629254 (= call!46267 (-!984 call!46266 k0!904)))))

(assert (=> b!1102450 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34908 _values!874)))))

(declare-fun b!1102451 () Bool)

(assert (=> b!1102451 (= e!629255 e!629254)))

(declare-fun c!108913 () Bool)

(assert (=> b!1102451 (= c!108913 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun bm!46264 () Bool)

(assert (=> bm!46264 (= call!46267 (getCurrentListMapNoExtraKeys!4201 (array!71420 (store (arr!34371 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34907 _keys!1070)) (array!71422 (store (arr!34372 _values!874) i!650 (ValueCellFull!12915 (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34908 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130745 res!735583) b!1102451))

(assert (= (and b!1102451 c!108913) b!1102450))

(assert (= (and b!1102451 (not c!108913)) b!1102449))

(assert (= (or b!1102450 b!1102449) bm!46263))

(assert (= (or b!1102450 b!1102449) bm!46264))

(declare-fun b_lambda!18171 () Bool)

(assert (=> (not b_lambda!18171) (not bm!46264)))

(assert (=> bm!46264 t!34261))

(declare-fun b_and!37217 () Bool)

(assert (= b_and!37215 (and (=> t!34261 result!16673) b_and!37217)))

(declare-fun m!1022763 () Bool)

(assert (=> d!130745 m!1022763))

(assert (=> bm!46263 m!1022553))

(declare-fun m!1022765 () Bool)

(assert (=> b!1102450 m!1022765))

(assert (=> bm!46264 m!1022539))

(assert (=> bm!46264 m!1022551))

(assert (=> bm!46264 m!1022555))

(declare-fun m!1022767 () Bool)

(assert (=> bm!46264 m!1022767))

(assert (=> b!1102243 d!130745))

(declare-fun b!1102452 () Bool)

(declare-fun e!629256 () Bool)

(declare-fun e!629259 () Bool)

(assert (=> b!1102452 (= e!629256 e!629259)))

(declare-fun c!108915 () Bool)

(declare-fun e!629258 () Bool)

(assert (=> b!1102452 (= c!108915 e!629258)))

(declare-fun res!735586 () Bool)

(assert (=> b!1102452 (=> (not res!735586) (not e!629258))))

(assert (=> b!1102452 (= res!735586 (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(declare-fun b!1102453 () Bool)

(declare-fun e!629261 () ListLongMap!15371)

(declare-fun call!46268 () ListLongMap!15371)

(assert (=> b!1102453 (= e!629261 call!46268)))

(declare-fun b!1102454 () Bool)

(assert (=> b!1102454 (= e!629258 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102454 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102455 () Bool)

(declare-fun e!629260 () Bool)

(declare-fun lt!494632 () ListLongMap!15371)

(assert (=> b!1102455 (= e!629260 (isEmpty!971 lt!494632))))

(declare-fun b!1102456 () Bool)

(declare-fun lt!494635 () Unit!36220)

(declare-fun lt!494636 () Unit!36220)

(assert (=> b!1102456 (= lt!494635 lt!494636)))

(declare-fun lt!494634 () (_ BitVec 64))

(declare-fun lt!494637 () ListLongMap!15371)

(declare-fun lt!494633 () (_ BitVec 64))

(declare-fun lt!494631 () V!41459)

(assert (=> b!1102456 (not (contains!6408 (+!3404 lt!494637 (tuple2!17403 lt!494634 lt!494631)) lt!494633))))

(assert (=> b!1102456 (= lt!494636 (addStillNotContains!281 lt!494637 lt!494634 lt!494631 lt!494633))))

(assert (=> b!1102456 (= lt!494633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102456 (= lt!494631 (get!17665 (select (arr!34372 _values!874) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102456 (= lt!494634 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102456 (= lt!494637 call!46268)))

(assert (=> b!1102456 (= e!629261 (+!3404 call!46268 (tuple2!17403 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000) (get!17665 (select (arr!34372 _values!874) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102457 () Bool)

(declare-fun res!735585 () Bool)

(assert (=> b!1102457 (=> (not res!735585) (not e!629256))))

(assert (=> b!1102457 (= res!735585 (not (contains!6408 lt!494632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102458 () Bool)

(declare-fun e!629257 () ListLongMap!15371)

(assert (=> b!1102458 (= e!629257 e!629261)))

(declare-fun c!108916 () Bool)

(assert (=> b!1102458 (= c!108916 (validKeyInArray!0 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102460 () Bool)

(assert (=> b!1102460 (= e!629260 (= lt!494632 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102461 () Bool)

(assert (=> b!1102461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> b!1102461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34908 _values!874)))))

(declare-fun e!629262 () Bool)

(assert (=> b!1102461 (= e!629262 (= (apply!953 lt!494632 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)) (get!17665 (select (arr!34372 _values!874) #b00000000000000000000000000000000) (dynLambda!2336 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!46265 () Bool)

(assert (=> bm!46265 (= call!46268 (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102462 () Bool)

(assert (=> b!1102462 (= e!629259 e!629262)))

(assert (=> b!1102462 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(declare-fun res!735584 () Bool)

(assert (=> b!1102462 (= res!735584 (contains!6408 lt!494632 (select (arr!34371 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102462 (=> (not res!735584) (not e!629262))))

(declare-fun b!1102463 () Bool)

(assert (=> b!1102463 (= e!629257 (ListLongMap!15372 Nil!24015))))

(declare-fun d!130747 () Bool)

(assert (=> d!130747 e!629256))

(declare-fun res!735587 () Bool)

(assert (=> d!130747 (=> (not res!735587) (not e!629256))))

(assert (=> d!130747 (= res!735587 (not (contains!6408 lt!494632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130747 (= lt!494632 e!629257)))

(declare-fun c!108917 () Bool)

(assert (=> d!130747 (= c!108917 (bvsge #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (=> d!130747 (validMask!0 mask!1414)))

(assert (=> d!130747 (= (getCurrentListMapNoExtraKeys!4201 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494632)))

(declare-fun b!1102459 () Bool)

(assert (=> b!1102459 (= e!629259 e!629260)))

(declare-fun c!108914 () Bool)

(assert (=> b!1102459 (= c!108914 (bvslt #b00000000000000000000000000000000 (size!34907 _keys!1070)))))

(assert (= (and d!130747 c!108917) b!1102463))

(assert (= (and d!130747 (not c!108917)) b!1102458))

(assert (= (and b!1102458 c!108916) b!1102456))

(assert (= (and b!1102458 (not c!108916)) b!1102453))

(assert (= (or b!1102456 b!1102453) bm!46265))

(assert (= (and d!130747 res!735587) b!1102457))

(assert (= (and b!1102457 res!735585) b!1102452))

(assert (= (and b!1102452 res!735586) b!1102454))

(assert (= (and b!1102452 c!108915) b!1102462))

(assert (= (and b!1102452 (not c!108915)) b!1102459))

(assert (= (and b!1102462 res!735584) b!1102461))

(assert (= (and b!1102459 c!108914) b!1102460))

(assert (= (and b!1102459 (not c!108914)) b!1102455))

(declare-fun b_lambda!18173 () Bool)

(assert (=> (not b_lambda!18173) (not b!1102456)))

(assert (=> b!1102456 t!34261))

(declare-fun b_and!37219 () Bool)

(assert (= b_and!37217 (and (=> t!34261 result!16673) b_and!37219)))

(declare-fun b_lambda!18175 () Bool)

(assert (=> (not b_lambda!18175) (not b!1102461)))

(assert (=> b!1102461 t!34261))

(declare-fun b_and!37221 () Bool)

(assert (= b_and!37219 (and (=> t!34261 result!16673) b_and!37221)))

(assert (=> b!1102461 m!1022617))

(declare-fun m!1022769 () Bool)

(assert (=> b!1102461 m!1022769))

(assert (=> b!1102461 m!1022637))

(assert (=> b!1102461 m!1022551))

(assert (=> b!1102461 m!1022639))

(assert (=> b!1102461 m!1022617))

(assert (=> b!1102461 m!1022637))

(assert (=> b!1102461 m!1022551))

(declare-fun m!1022771 () Bool)

(assert (=> b!1102456 m!1022771))

(declare-fun m!1022773 () Bool)

(assert (=> b!1102456 m!1022773))

(declare-fun m!1022775 () Bool)

(assert (=> b!1102456 m!1022775))

(assert (=> b!1102456 m!1022637))

(assert (=> b!1102456 m!1022551))

(assert (=> b!1102456 m!1022639))

(assert (=> b!1102456 m!1022617))

(declare-fun m!1022777 () Bool)

(assert (=> b!1102456 m!1022777))

(assert (=> b!1102456 m!1022771))

(assert (=> b!1102456 m!1022637))

(assert (=> b!1102456 m!1022551))

(assert (=> b!1102462 m!1022617))

(assert (=> b!1102462 m!1022617))

(declare-fun m!1022779 () Bool)

(assert (=> b!1102462 m!1022779))

(assert (=> b!1102458 m!1022617))

(assert (=> b!1102458 m!1022617))

(assert (=> b!1102458 m!1022621))

(assert (=> b!1102454 m!1022617))

(assert (=> b!1102454 m!1022617))

(assert (=> b!1102454 m!1022621))

(declare-fun m!1022781 () Bool)

(assert (=> b!1102457 m!1022781))

(declare-fun m!1022783 () Bool)

(assert (=> b!1102460 m!1022783))

(declare-fun m!1022785 () Bool)

(assert (=> b!1102455 m!1022785))

(declare-fun m!1022787 () Bool)

(assert (=> d!130747 m!1022787))

(assert (=> d!130747 m!1022545))

(assert (=> bm!46265 m!1022783))

(assert (=> b!1102243 d!130747))

(declare-fun d!130749 () Bool)

(assert (=> d!130749 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494640 () Unit!36220)

(declare-fun choose!13 (array!71419 (_ BitVec 64) (_ BitVec 32)) Unit!36220)

(assert (=> d!130749 (= lt!494640 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130749 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130749 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494640)))

(declare-fun bs!32343 () Bool)

(assert (= bs!32343 d!130749))

(assert (=> bs!32343 m!1022561))

(declare-fun m!1022789 () Bool)

(assert (=> bs!32343 m!1022789))

(assert (=> b!1102243 d!130749))

(declare-fun b!1102464 () Bool)

(declare-fun e!629264 () Bool)

(declare-fun e!629265 () Bool)

(assert (=> b!1102464 (= e!629264 e!629265)))

(declare-fun c!108918 () Bool)

(assert (=> b!1102464 (= c!108918 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102465 () Bool)

(declare-fun e!629263 () Bool)

(assert (=> b!1102465 (= e!629265 e!629263)))

(declare-fun lt!494642 () (_ BitVec 64))

(assert (=> b!1102465 (= lt!494642 (select (arr!34371 lt!494475) #b00000000000000000000000000000000))))

(declare-fun lt!494643 () Unit!36220)

(assert (=> b!1102465 (= lt!494643 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494475 lt!494642 #b00000000000000000000000000000000))))

(assert (=> b!1102465 (arrayContainsKey!0 lt!494475 lt!494642 #b00000000000000000000000000000000)))

(declare-fun lt!494641 () Unit!36220)

(assert (=> b!1102465 (= lt!494641 lt!494643)))

(declare-fun res!735588 () Bool)

(assert (=> b!1102465 (= res!735588 (= (seekEntryOrOpen!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000) lt!494475 mask!1414) (Found!9916 #b00000000000000000000000000000000)))))

(assert (=> b!1102465 (=> (not res!735588) (not e!629263))))

(declare-fun d!130751 () Bool)

(declare-fun res!735589 () Bool)

(assert (=> d!130751 (=> res!735589 e!629264)))

(assert (=> d!130751 (= res!735589 (bvsge #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (=> d!130751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494475 mask!1414) e!629264)))

(declare-fun bm!46266 () Bool)

(declare-fun call!46269 () Bool)

(assert (=> bm!46266 (= call!46269 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494475 mask!1414))))

(declare-fun b!1102466 () Bool)

(assert (=> b!1102466 (= e!629265 call!46269)))

(declare-fun b!1102467 () Bool)

(assert (=> b!1102467 (= e!629263 call!46269)))

(assert (= (and d!130751 (not res!735589)) b!1102464))

(assert (= (and b!1102464 c!108918) b!1102465))

(assert (= (and b!1102464 (not c!108918)) b!1102466))

(assert (= (and b!1102465 res!735588) b!1102467))

(assert (= (or b!1102467 b!1102466) bm!46266))

(assert (=> b!1102464 m!1022695))

(assert (=> b!1102464 m!1022695))

(assert (=> b!1102464 m!1022707))

(assert (=> b!1102465 m!1022695))

(declare-fun m!1022791 () Bool)

(assert (=> b!1102465 m!1022791))

(declare-fun m!1022793 () Bool)

(assert (=> b!1102465 m!1022793))

(assert (=> b!1102465 m!1022695))

(declare-fun m!1022795 () Bool)

(assert (=> b!1102465 m!1022795))

(declare-fun m!1022797 () Bool)

(assert (=> bm!46266 m!1022797))

(assert (=> b!1102247 d!130751))

(declare-fun b!1102468 () Bool)

(declare-fun e!629269 () Bool)

(assert (=> b!1102468 (= e!629269 (contains!6407 Nil!24014 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102469 () Bool)

(declare-fun e!629268 () Bool)

(declare-fun call!46270 () Bool)

(assert (=> b!1102469 (= e!629268 call!46270)))

(declare-fun b!1102470 () Bool)

(declare-fun e!629266 () Bool)

(declare-fun e!629267 () Bool)

(assert (=> b!1102470 (= e!629266 e!629267)))

(declare-fun res!735591 () Bool)

(assert (=> b!1102470 (=> (not res!735591) (not e!629267))))

(assert (=> b!1102470 (= res!735591 (not e!629269))))

(declare-fun res!735590 () Bool)

(assert (=> b!1102470 (=> (not res!735590) (not e!629269))))

(assert (=> b!1102470 (= res!735590 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun bm!46267 () Bool)

(declare-fun c!108919 () Bool)

(assert (=> bm!46267 (= call!46270 (arrayNoDuplicates!0 lt!494475 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108919 (Cons!24013 (select (arr!34371 lt!494475) #b00000000000000000000000000000000) Nil!24014) Nil!24014)))))

(declare-fun d!130753 () Bool)

(declare-fun res!735592 () Bool)

(assert (=> d!130753 (=> res!735592 e!629266)))

(assert (=> d!130753 (= res!735592 (bvsge #b00000000000000000000000000000000 (size!34907 lt!494475)))))

(assert (=> d!130753 (= (arrayNoDuplicates!0 lt!494475 #b00000000000000000000000000000000 Nil!24014) e!629266)))

(declare-fun b!1102471 () Bool)

(assert (=> b!1102471 (= e!629267 e!629268)))

(assert (=> b!1102471 (= c!108919 (validKeyInArray!0 (select (arr!34371 lt!494475) #b00000000000000000000000000000000)))))

(declare-fun b!1102472 () Bool)

(assert (=> b!1102472 (= e!629268 call!46270)))

(assert (= (and d!130753 (not res!735592)) b!1102470))

(assert (= (and b!1102470 res!735590) b!1102468))

(assert (= (and b!1102470 res!735591) b!1102471))

(assert (= (and b!1102471 c!108919) b!1102469))

(assert (= (and b!1102471 (not c!108919)) b!1102472))

(assert (= (or b!1102469 b!1102472) bm!46267))

(assert (=> b!1102468 m!1022695))

(assert (=> b!1102468 m!1022695))

(declare-fun m!1022799 () Bool)

(assert (=> b!1102468 m!1022799))

(assert (=> b!1102470 m!1022695))

(assert (=> b!1102470 m!1022695))

(assert (=> b!1102470 m!1022707))

(assert (=> bm!46267 m!1022695))

(declare-fun m!1022801 () Bool)

(assert (=> bm!46267 m!1022801))

(assert (=> b!1102471 m!1022695))

(assert (=> b!1102471 m!1022695))

(assert (=> b!1102471 m!1022707))

(assert (=> b!1102238 d!130753))

(declare-fun mapIsEmpty!42670 () Bool)

(declare-fun mapRes!42670 () Bool)

(assert (=> mapIsEmpty!42670 mapRes!42670))

(declare-fun mapNonEmpty!42670 () Bool)

(declare-fun tp!81563 () Bool)

(declare-fun e!629274 () Bool)

(assert (=> mapNonEmpty!42670 (= mapRes!42670 (and tp!81563 e!629274))))

(declare-fun mapKey!42670 () (_ BitVec 32))

(declare-fun mapValue!42670 () ValueCell!12915)

(declare-fun mapRest!42670 () (Array (_ BitVec 32) ValueCell!12915))

(assert (=> mapNonEmpty!42670 (= mapRest!42664 (store mapRest!42670 mapKey!42670 mapValue!42670))))

(declare-fun condMapEmpty!42670 () Bool)

(declare-fun mapDefault!42670 () ValueCell!12915)

(assert (=> mapNonEmpty!42664 (= condMapEmpty!42670 (= mapRest!42664 ((as const (Array (_ BitVec 32) ValueCell!12915)) mapDefault!42670)))))

(declare-fun e!629275 () Bool)

(assert (=> mapNonEmpty!42664 (= tp!81554 (and e!629275 mapRes!42670))))

(declare-fun b!1102479 () Bool)

(assert (=> b!1102479 (= e!629274 tp_is_empty!27249)))

(declare-fun b!1102480 () Bool)

(assert (=> b!1102480 (= e!629275 tp_is_empty!27249)))

(assert (= (and mapNonEmpty!42664 condMapEmpty!42670) mapIsEmpty!42670))

(assert (= (and mapNonEmpty!42664 (not condMapEmpty!42670)) mapNonEmpty!42670))

(assert (= (and mapNonEmpty!42670 ((_ is ValueCellFull!12915) mapValue!42670)) b!1102479))

(assert (= (and mapNonEmpty!42664 ((_ is ValueCellFull!12915) mapDefault!42670)) b!1102480))

(declare-fun m!1022803 () Bool)

(assert (=> mapNonEmpty!42670 m!1022803))

(declare-fun b_lambda!18177 () Bool)

(assert (= b_lambda!18173 (or (and start!96882 b_free!23199) b_lambda!18177)))

(declare-fun b_lambda!18179 () Bool)

(assert (= b_lambda!18163 (or (and start!96882 b_free!23199) b_lambda!18179)))

(declare-fun b_lambda!18181 () Bool)

(assert (= b_lambda!18169 (or (and start!96882 b_free!23199) b_lambda!18181)))

(declare-fun b_lambda!18183 () Bool)

(assert (= b_lambda!18167 (or (and start!96882 b_free!23199) b_lambda!18183)))

(declare-fun b_lambda!18185 () Bool)

(assert (= b_lambda!18165 (or (and start!96882 b_free!23199) b_lambda!18185)))

(declare-fun b_lambda!18187 () Bool)

(assert (= b_lambda!18175 (or (and start!96882 b_free!23199) b_lambda!18187)))

(declare-fun b_lambda!18189 () Bool)

(assert (= b_lambda!18171 (or (and start!96882 b_free!23199) b_lambda!18189)))

(check-sat (not b!1102471) (not b!1102367) (not b!1102303) (not bm!46242) (not bm!46249) (not d!130743) (not b!1102464) (not bm!46243) (not b!1102433) (not mapNonEmpty!42670) (not b!1102313) (not bm!46265) (not b!1102373) (not d!130737) (not bm!46258) (not b_lambda!18181) (not b!1102435) (not b!1102454) (not bm!46266) (not b!1102441) (not b!1102401) (not bm!46255) (not bm!46251) (not bm!46244) (not b!1102450) (not b!1102468) (not b!1102461) (not b!1102434) b_and!37221 (not b_lambda!18183) (not bm!46267) (not b_lambda!18161) (not b!1102322) (not b!1102456) (not b!1102460) (not bm!46224) (not b!1102372) (not bm!46248) (not b!1102458) (not b!1102437) (not b!1102457) (not b_lambda!18177) (not b!1102439) (not bm!46250) (not b!1102380) (not b!1102384) (not b!1102455) (not b_lambda!18185) (not b!1102368) (not d!130745) (not d!130739) (not bm!46227) (not b!1102314) (not b!1102440) (not b!1102405) (not bm!46264) (not b!1102374) (not b!1102462) (not b!1102393) (not b_next!23199) (not b!1102395) (not b!1102388) (not b!1102378) (not d!130749) (not b!1102389) (not b!1102302) (not b!1102470) (not b!1102436) (not b!1102399) (not d!130741) (not b!1102300) (not b_lambda!18187) tp_is_empty!27249 (not b_lambda!18189) (not bm!46263) (not d!130747) (not b!1102394) (not b!1102465) (not b_lambda!18179))
(check-sat b_and!37221 (not b_next!23199))
