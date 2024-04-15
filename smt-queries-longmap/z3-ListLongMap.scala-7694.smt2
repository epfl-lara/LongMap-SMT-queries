; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96582 () Bool)

(assert start!96582)

(declare-fun b_free!23089 () Bool)

(declare-fun b_next!23089 () Bool)

(assert (=> start!96582 (= b_free!23089 (not b_next!23089))))

(declare-fun tp!81203 () Bool)

(declare-fun b_and!36857 () Bool)

(assert (=> start!96582 (= tp!81203 b_and!36857)))

(declare-fun b!1098297 () Bool)

(declare-fun e!626854 () Bool)

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1098297 (= e!626854 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904)))))

(declare-datatypes ((V!41313 0))(
  ( (V!41314 (val!13626 Int)) )
))
(declare-datatypes ((tuple2!17374 0))(
  ( (tuple2!17375 (_1!8698 (_ BitVec 64)) (_2!8698 V!41313)) )
))
(declare-datatypes ((List!23965 0))(
  ( (Nil!23962) (Cons!23961 (h!25170 tuple2!17374) (t!34091 List!23965)) )
))
(declare-datatypes ((ListLongMap!15343 0))(
  ( (ListLongMap!15344 (toList!7687 List!23965)) )
))
(declare-fun lt!491167 () ListLongMap!15343)

(declare-fun lt!491164 () ListLongMap!15343)

(declare-fun -!922 (ListLongMap!15343 (_ BitVec 64)) ListLongMap!15343)

(assert (=> b!1098297 (= (-!922 lt!491167 k0!904) lt!491164)))

(declare-fun lt!491174 () ListLongMap!15343)

(declare-datatypes ((Unit!35957 0))(
  ( (Unit!35958) )
))
(declare-fun lt!491169 () Unit!35957)

(declare-fun zeroValue!831 () V!41313)

(declare-fun addRemoveCommutativeForDiffKeys!117 (ListLongMap!15343 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!35957)

(assert (=> b!1098297 (= lt!491169 (addRemoveCommutativeForDiffKeys!117 lt!491174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!491161 () ListLongMap!15343)

(declare-fun lt!491172 () tuple2!17374)

(declare-fun +!3399 (ListLongMap!15343 tuple2!17374) ListLongMap!15343)

(assert (=> b!1098297 (= lt!491161 (+!3399 lt!491164 lt!491172))))

(declare-fun lt!491163 () ListLongMap!15343)

(declare-fun lt!491168 () tuple2!17374)

(assert (=> b!1098297 (= lt!491164 (+!3399 lt!491163 lt!491168))))

(declare-fun lt!491165 () ListLongMap!15343)

(assert (=> b!1098297 (= lt!491165 (+!3399 lt!491167 lt!491172))))

(assert (=> b!1098297 (= lt!491167 (+!3399 lt!491174 lt!491168))))

(declare-fun lt!491173 () ListLongMap!15343)

(assert (=> b!1098297 (= lt!491161 (+!3399 (+!3399 lt!491173 lt!491168) lt!491172))))

(declare-fun minValue!831 () V!41313)

(assert (=> b!1098297 (= lt!491172 (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098297 (= lt!491168 (tuple2!17375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098299 () Bool)

(declare-fun res!732997 () Bool)

(declare-fun e!626853 () Bool)

(assert (=> b!1098299 (=> (not res!732997) (not e!626853))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71098 0))(
  ( (array!71099 (arr!34218 (Array (_ BitVec 32) (_ BitVec 64))) (size!34756 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71098)

(assert (=> b!1098299 (= res!732997 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34756 _keys!1070))))))

(declare-fun mapNonEmpty!42478 () Bool)

(declare-fun mapRes!42478 () Bool)

(declare-fun tp!81202 () Bool)

(declare-fun e!626855 () Bool)

(assert (=> mapNonEmpty!42478 (= mapRes!42478 (and tp!81202 e!626855))))

(declare-datatypes ((ValueCell!12860 0))(
  ( (ValueCellFull!12860 (v!16249 V!41313)) (EmptyCell!12860) )
))
(declare-datatypes ((array!71100 0))(
  ( (array!71101 (arr!34219 (Array (_ BitVec 32) ValueCell!12860)) (size!34757 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71100)

(declare-fun mapRest!42478 () (Array (_ BitVec 32) ValueCell!12860))

(declare-fun mapValue!42478 () ValueCell!12860)

(declare-fun mapKey!42478 () (_ BitVec 32))

(assert (=> mapNonEmpty!42478 (= (arr!34219 _values!874) (store mapRest!42478 mapKey!42478 mapValue!42478))))

(declare-fun b!1098300 () Bool)

(declare-fun res!733000 () Bool)

(assert (=> b!1098300 (=> (not res!733000) (not e!626853))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71098 (_ BitVec 32)) Bool)

(assert (=> b!1098300 (= res!733000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1098301 () Bool)

(declare-fun e!626857 () Bool)

(assert (=> b!1098301 (= e!626853 e!626857)))

(declare-fun res!732998 () Bool)

(assert (=> b!1098301 (=> (not res!732998) (not e!626857))))

(declare-fun lt!491166 () array!71098)

(assert (=> b!1098301 (= res!732998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491166 mask!1414))))

(assert (=> b!1098301 (= lt!491166 (array!71099 (store (arr!34218 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34756 _keys!1070)))))

(declare-fun b!1098302 () Bool)

(declare-fun e!626856 () Bool)

(declare-fun e!626851 () Bool)

(assert (=> b!1098302 (= e!626856 (and e!626851 mapRes!42478))))

(declare-fun condMapEmpty!42478 () Bool)

(declare-fun mapDefault!42478 () ValueCell!12860)

(assert (=> b!1098302 (= condMapEmpty!42478 (= (arr!34219 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12860)) mapDefault!42478)))))

(declare-fun b!1098303 () Bool)

(declare-fun res!733003 () Bool)

(assert (=> b!1098303 (=> (not res!733003) (not e!626853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1098303 (= res!733003 (validKeyInArray!0 k0!904))))

(declare-fun b!1098304 () Bool)

(declare-fun res!732994 () Bool)

(assert (=> b!1098304 (=> (not res!732994) (not e!626853))))

(assert (=> b!1098304 (= res!732994 (= (select (arr!34218 _keys!1070) i!650) k0!904))))

(declare-fun b!1098298 () Bool)

(declare-fun tp_is_empty!27139 () Bool)

(assert (=> b!1098298 (= e!626851 tp_is_empty!27139)))

(declare-fun res!732999 () Bool)

(assert (=> start!96582 (=> (not res!732999) (not e!626853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96582 (= res!732999 (validMask!0 mask!1414))))

(assert (=> start!96582 e!626853))

(assert (=> start!96582 tp!81203))

(assert (=> start!96582 true))

(assert (=> start!96582 tp_is_empty!27139))

(declare-fun array_inv!26394 (array!71098) Bool)

(assert (=> start!96582 (array_inv!26394 _keys!1070)))

(declare-fun array_inv!26395 (array!71100) Bool)

(assert (=> start!96582 (and (array_inv!26395 _values!874) e!626856)))

(declare-fun mapIsEmpty!42478 () Bool)

(assert (=> mapIsEmpty!42478 mapRes!42478))

(declare-fun b!1098305 () Bool)

(declare-fun res!732995 () Bool)

(assert (=> b!1098305 (=> (not res!732995) (not e!626857))))

(declare-datatypes ((List!23966 0))(
  ( (Nil!23963) (Cons!23962 (h!25171 (_ BitVec 64)) (t!34092 List!23966)) )
))
(declare-fun arrayNoDuplicates!0 (array!71098 (_ BitVec 32) List!23966) Bool)

(assert (=> b!1098305 (= res!732995 (arrayNoDuplicates!0 lt!491166 #b00000000000000000000000000000000 Nil!23963))))

(declare-fun b!1098306 () Bool)

(declare-fun res!732996 () Bool)

(assert (=> b!1098306 (=> (not res!732996) (not e!626853))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1098306 (= res!732996 (and (= (size!34757 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34756 _keys!1070) (size!34757 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1098307 () Bool)

(assert (=> b!1098307 (= e!626855 tp_is_empty!27139)))

(declare-fun b!1098308 () Bool)

(assert (=> b!1098308 (= e!626857 (not e!626854))))

(declare-fun res!733001 () Bool)

(assert (=> b!1098308 (=> res!733001 e!626854)))

(assert (=> b!1098308 (= res!733001 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4308 (array!71098 array!71100 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) Int) ListLongMap!15343)

(assert (=> b!1098308 (= lt!491165 (getCurrentListMap!4308 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491171 () array!71100)

(assert (=> b!1098308 (= lt!491161 (getCurrentListMap!4308 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1098308 (and (= lt!491173 lt!491163) (= lt!491163 lt!491173))))

(assert (=> b!1098308 (= lt!491163 (-!922 lt!491174 k0!904))))

(declare-fun lt!491162 () Unit!35957)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!197 (array!71098 array!71100 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35957)

(assert (=> b!1098308 (= lt!491162 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!197 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4215 (array!71098 array!71100 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) Int) ListLongMap!15343)

(assert (=> b!1098308 (= lt!491173 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2284 (Int (_ BitVec 64)) V!41313)

(assert (=> b!1098308 (= lt!491171 (array!71101 (store (arr!34219 _values!874) i!650 (ValueCellFull!12860 (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34757 _values!874)))))

(assert (=> b!1098308 (= lt!491174 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1098308 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491170 () Unit!35957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71098 (_ BitVec 64) (_ BitVec 32)) Unit!35957)

(assert (=> b!1098308 (= lt!491170 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1098309 () Bool)

(declare-fun res!733002 () Bool)

(assert (=> b!1098309 (=> (not res!733002) (not e!626853))))

(assert (=> b!1098309 (= res!733002 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23963))))

(assert (= (and start!96582 res!732999) b!1098306))

(assert (= (and b!1098306 res!732996) b!1098300))

(assert (= (and b!1098300 res!733000) b!1098309))

(assert (= (and b!1098309 res!733002) b!1098299))

(assert (= (and b!1098299 res!732997) b!1098303))

(assert (= (and b!1098303 res!733003) b!1098304))

(assert (= (and b!1098304 res!732994) b!1098301))

(assert (= (and b!1098301 res!732998) b!1098305))

(assert (= (and b!1098305 res!732995) b!1098308))

(assert (= (and b!1098308 (not res!733001)) b!1098297))

(assert (= (and b!1098302 condMapEmpty!42478) mapIsEmpty!42478))

(assert (= (and b!1098302 (not condMapEmpty!42478)) mapNonEmpty!42478))

(get-info :version)

(assert (= (and mapNonEmpty!42478 ((_ is ValueCellFull!12860) mapValue!42478)) b!1098307))

(assert (= (and b!1098302 ((_ is ValueCellFull!12860) mapDefault!42478)) b!1098298))

(assert (= start!96582 b!1098302))

(declare-fun b_lambda!17815 () Bool)

(assert (=> (not b_lambda!17815) (not b!1098308)))

(declare-fun t!34090 () Bool)

(declare-fun tb!7947 () Bool)

(assert (=> (and start!96582 (= defaultEntry!882 defaultEntry!882) t!34090) tb!7947))

(declare-fun result!16431 () Bool)

(assert (=> tb!7947 (= result!16431 tp_is_empty!27139)))

(assert (=> b!1098308 t!34090))

(declare-fun b_and!36859 () Bool)

(assert (= b_and!36857 (and (=> t!34090 result!16431) b_and!36859)))

(declare-fun m!1017489 () Bool)

(assert (=> b!1098300 m!1017489))

(declare-fun m!1017491 () Bool)

(assert (=> b!1098297 m!1017491))

(declare-fun m!1017493 () Bool)

(assert (=> b!1098297 m!1017493))

(declare-fun m!1017495 () Bool)

(assert (=> b!1098297 m!1017495))

(declare-fun m!1017497 () Bool)

(assert (=> b!1098297 m!1017497))

(declare-fun m!1017499 () Bool)

(assert (=> b!1098297 m!1017499))

(declare-fun m!1017501 () Bool)

(assert (=> b!1098297 m!1017501))

(assert (=> b!1098297 m!1017493))

(declare-fun m!1017503 () Bool)

(assert (=> b!1098297 m!1017503))

(declare-fun m!1017505 () Bool)

(assert (=> b!1098297 m!1017505))

(declare-fun m!1017507 () Bool)

(assert (=> b!1098301 m!1017507))

(declare-fun m!1017509 () Bool)

(assert (=> b!1098301 m!1017509))

(declare-fun m!1017511 () Bool)

(assert (=> b!1098309 m!1017511))

(declare-fun m!1017513 () Bool)

(assert (=> start!96582 m!1017513))

(declare-fun m!1017515 () Bool)

(assert (=> start!96582 m!1017515))

(declare-fun m!1017517 () Bool)

(assert (=> start!96582 m!1017517))

(declare-fun m!1017519 () Bool)

(assert (=> mapNonEmpty!42478 m!1017519))

(declare-fun m!1017521 () Bool)

(assert (=> b!1098303 m!1017521))

(declare-fun m!1017523 () Bool)

(assert (=> b!1098308 m!1017523))

(declare-fun m!1017525 () Bool)

(assert (=> b!1098308 m!1017525))

(declare-fun m!1017527 () Bool)

(assert (=> b!1098308 m!1017527))

(declare-fun m!1017529 () Bool)

(assert (=> b!1098308 m!1017529))

(declare-fun m!1017531 () Bool)

(assert (=> b!1098308 m!1017531))

(declare-fun m!1017533 () Bool)

(assert (=> b!1098308 m!1017533))

(declare-fun m!1017535 () Bool)

(assert (=> b!1098308 m!1017535))

(declare-fun m!1017537 () Bool)

(assert (=> b!1098308 m!1017537))

(declare-fun m!1017539 () Bool)

(assert (=> b!1098308 m!1017539))

(declare-fun m!1017541 () Bool)

(assert (=> b!1098308 m!1017541))

(declare-fun m!1017543 () Bool)

(assert (=> b!1098304 m!1017543))

(declare-fun m!1017545 () Bool)

(assert (=> b!1098305 m!1017545))

(check-sat (not mapNonEmpty!42478) (not b!1098300) (not b!1098309) (not start!96582) (not b!1098305) tp_is_empty!27139 (not b_lambda!17815) (not b!1098308) (not b!1098303) (not b_next!23089) (not b!1098301) (not b!1098297) b_and!36859)
(check-sat b_and!36859 (not b_next!23089))
(get-model)

(declare-fun b_lambda!17821 () Bool)

(assert (= b_lambda!17815 (or (and start!96582 b_free!23089) b_lambda!17821)))

(check-sat (not mapNonEmpty!42478) (not b!1098300) (not b!1098308) (not b_lambda!17821) (not b!1098309) (not start!96582) (not b!1098305) tp_is_empty!27139 (not b!1098303) (not b_next!23089) (not b!1098301) (not b!1098297) b_and!36859)
(check-sat b_and!36859 (not b_next!23089))
(get-model)

(declare-fun b!1098404 () Bool)

(declare-fun e!626910 () Bool)

(declare-fun contains!6356 (List!23966 (_ BitVec 64)) Bool)

(assert (=> b!1098404 (= e!626910 (contains!6356 Nil!23963 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098405 () Bool)

(declare-fun e!626911 () Bool)

(declare-fun e!626909 () Bool)

(assert (=> b!1098405 (= e!626911 e!626909)))

(declare-fun c!108475 () Bool)

(assert (=> b!1098405 (= c!108475 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45879 () Bool)

(declare-fun call!45882 () Bool)

(assert (=> bm!45879 (= call!45882 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108475 (Cons!23962 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000) Nil!23963) Nil!23963)))))

(declare-fun d!130265 () Bool)

(declare-fun res!733070 () Bool)

(declare-fun e!626908 () Bool)

(assert (=> d!130265 (=> res!733070 e!626908)))

(assert (=> d!130265 (= res!733070 (bvsge #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> d!130265 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23963) e!626908)))

(declare-fun b!1098406 () Bool)

(assert (=> b!1098406 (= e!626909 call!45882)))

(declare-fun b!1098407 () Bool)

(assert (=> b!1098407 (= e!626909 call!45882)))

(declare-fun b!1098408 () Bool)

(assert (=> b!1098408 (= e!626908 e!626911)))

(declare-fun res!733071 () Bool)

(assert (=> b!1098408 (=> (not res!733071) (not e!626911))))

(assert (=> b!1098408 (= res!733071 (not e!626910))))

(declare-fun res!733072 () Bool)

(assert (=> b!1098408 (=> (not res!733072) (not e!626910))))

(assert (=> b!1098408 (= res!733072 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130265 (not res!733070)) b!1098408))

(assert (= (and b!1098408 res!733072) b!1098404))

(assert (= (and b!1098408 res!733071) b!1098405))

(assert (= (and b!1098405 c!108475) b!1098407))

(assert (= (and b!1098405 (not c!108475)) b!1098406))

(assert (= (or b!1098407 b!1098406) bm!45879))

(declare-fun m!1017663 () Bool)

(assert (=> b!1098404 m!1017663))

(assert (=> b!1098404 m!1017663))

(declare-fun m!1017665 () Bool)

(assert (=> b!1098404 m!1017665))

(assert (=> b!1098405 m!1017663))

(assert (=> b!1098405 m!1017663))

(declare-fun m!1017667 () Bool)

(assert (=> b!1098405 m!1017667))

(assert (=> bm!45879 m!1017663))

(declare-fun m!1017669 () Bool)

(assert (=> bm!45879 m!1017669))

(assert (=> b!1098408 m!1017663))

(assert (=> b!1098408 m!1017663))

(assert (=> b!1098408 m!1017667))

(assert (=> b!1098309 d!130265))

(declare-fun b!1098417 () Bool)

(declare-fun e!626919 () Bool)

(declare-fun e!626920 () Bool)

(assert (=> b!1098417 (= e!626919 e!626920)))

(declare-fun lt!491267 () (_ BitVec 64))

(assert (=> b!1098417 (= lt!491267 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491265 () Unit!35957)

(assert (=> b!1098417 (= lt!491265 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!491267 #b00000000000000000000000000000000))))

(assert (=> b!1098417 (arrayContainsKey!0 _keys!1070 lt!491267 #b00000000000000000000000000000000)))

(declare-fun lt!491266 () Unit!35957)

(assert (=> b!1098417 (= lt!491266 lt!491265)))

(declare-fun res!733077 () Bool)

(declare-datatypes ((SeekEntryResult!9908 0))(
  ( (MissingZero!9908 (index!42003 (_ BitVec 32))) (Found!9908 (index!42004 (_ BitVec 32))) (Intermediate!9908 (undefined!10720 Bool) (index!42005 (_ BitVec 32)) (x!98798 (_ BitVec 32))) (Undefined!9908) (MissingVacant!9908 (index!42006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71098 (_ BitVec 32)) SeekEntryResult!9908)

(assert (=> b!1098417 (= res!733077 (= (seekEntryOrOpen!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9908 #b00000000000000000000000000000000)))))

(assert (=> b!1098417 (=> (not res!733077) (not e!626920))))

(declare-fun bm!45882 () Bool)

(declare-fun call!45885 () Bool)

(assert (=> bm!45882 (= call!45885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1098418 () Bool)

(assert (=> b!1098418 (= e!626920 call!45885)))

(declare-fun b!1098419 () Bool)

(assert (=> b!1098419 (= e!626919 call!45885)))

(declare-fun d!130267 () Bool)

(declare-fun res!733078 () Bool)

(declare-fun e!626918 () Bool)

(assert (=> d!130267 (=> res!733078 e!626918)))

(assert (=> d!130267 (= res!733078 (bvsge #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> d!130267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626918)))

(declare-fun b!1098420 () Bool)

(assert (=> b!1098420 (= e!626918 e!626919)))

(declare-fun c!108478 () Bool)

(assert (=> b!1098420 (= c!108478 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130267 (not res!733078)) b!1098420))

(assert (= (and b!1098420 c!108478) b!1098417))

(assert (= (and b!1098420 (not c!108478)) b!1098419))

(assert (= (and b!1098417 res!733077) b!1098418))

(assert (= (or b!1098418 b!1098419) bm!45882))

(assert (=> b!1098417 m!1017663))

(declare-fun m!1017671 () Bool)

(assert (=> b!1098417 m!1017671))

(declare-fun m!1017673 () Bool)

(assert (=> b!1098417 m!1017673))

(assert (=> b!1098417 m!1017663))

(declare-fun m!1017675 () Bool)

(assert (=> b!1098417 m!1017675))

(declare-fun m!1017677 () Bool)

(assert (=> bm!45882 m!1017677))

(assert (=> b!1098420 m!1017663))

(assert (=> b!1098420 m!1017663))

(assert (=> b!1098420 m!1017667))

(assert (=> b!1098300 d!130267))

(declare-fun d!130269 () Bool)

(assert (=> d!130269 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098303 d!130269))

(declare-fun d!130271 () Bool)

(declare-fun res!733083 () Bool)

(declare-fun e!626925 () Bool)

(assert (=> d!130271 (=> res!733083 e!626925)))

(assert (=> d!130271 (= res!733083 (= (select (arr!34218 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130271 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626925)))

(declare-fun b!1098425 () Bool)

(declare-fun e!626926 () Bool)

(assert (=> b!1098425 (= e!626925 e!626926)))

(declare-fun res!733084 () Bool)

(assert (=> b!1098425 (=> (not res!733084) (not e!626926))))

(assert (=> b!1098425 (= res!733084 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34756 _keys!1070)))))

(declare-fun b!1098426 () Bool)

(assert (=> b!1098426 (= e!626926 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130271 (not res!733083)) b!1098425))

(assert (= (and b!1098425 res!733084) b!1098426))

(assert (=> d!130271 m!1017663))

(declare-fun m!1017679 () Bool)

(assert (=> b!1098426 m!1017679))

(assert (=> b!1098308 d!130271))

(declare-fun b!1098469 () Bool)

(declare-fun e!626962 () Bool)

(declare-fun lt!491323 () ListLongMap!15343)

(declare-fun apply!939 (ListLongMap!15343 (_ BitVec 64)) V!41313)

(assert (=> b!1098469 (= e!626962 (= (apply!939 lt!491323 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098470 () Bool)

(declare-fun e!626957 () ListLongMap!15343)

(declare-fun call!45903 () ListLongMap!15343)

(assert (=> b!1098470 (= e!626957 (+!3399 call!45903 (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun bm!45897 () Bool)

(declare-fun call!45904 () ListLongMap!15343)

(assert (=> bm!45897 (= call!45904 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098471 () Bool)

(declare-fun e!626953 () ListLongMap!15343)

(declare-fun call!45900 () ListLongMap!15343)

(assert (=> b!1098471 (= e!626953 call!45900)))

(declare-fun b!1098472 () Bool)

(declare-fun res!733104 () Bool)

(declare-fun e!626956 () Bool)

(assert (=> b!1098472 (=> (not res!733104) (not e!626956))))

(declare-fun e!626965 () Bool)

(assert (=> b!1098472 (= res!733104 e!626965)))

(declare-fun res!733108 () Bool)

(assert (=> b!1098472 (=> res!733108 e!626965)))

(declare-fun e!626961 () Bool)

(assert (=> b!1098472 (= res!733108 (not e!626961))))

(declare-fun res!733110 () Bool)

(assert (=> b!1098472 (=> (not res!733110) (not e!626961))))

(assert (=> b!1098472 (= res!733110 (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(declare-fun b!1098473 () Bool)

(declare-fun e!626955 () Bool)

(assert (=> b!1098473 (= e!626955 (= (apply!939 lt!491323 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098474 () Bool)

(declare-fun e!626963 () ListLongMap!15343)

(assert (=> b!1098474 (= e!626963 call!45900)))

(declare-fun b!1098475 () Bool)

(declare-fun res!733106 () Bool)

(assert (=> b!1098475 (=> (not res!733106) (not e!626956))))

(declare-fun e!626964 () Bool)

(assert (=> b!1098475 (= res!733106 e!626964)))

(declare-fun c!108491 () Bool)

(assert (=> b!1098475 (= c!108491 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098476 () Bool)

(assert (=> b!1098476 (= e!626964 e!626955)))

(declare-fun res!733103 () Bool)

(declare-fun call!45901 () Bool)

(assert (=> b!1098476 (= res!733103 call!45901)))

(assert (=> b!1098476 (=> (not res!733103) (not e!626955))))

(declare-fun b!1098477 () Bool)

(declare-fun e!626958 () Bool)

(declare-fun get!17617 (ValueCell!12860 V!41313) V!41313)

(assert (=> b!1098477 (= e!626958 (= (apply!939 lt!491323 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)) (get!17617 (select (arr!34219 _values!874) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34757 _values!874)))))

(assert (=> b!1098477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(declare-fun b!1098478 () Bool)

(declare-fun call!45905 () ListLongMap!15343)

(assert (=> b!1098478 (= e!626963 call!45905)))

(declare-fun b!1098479 () Bool)

(assert (=> b!1098479 (= e!626961 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098480 () Bool)

(declare-fun e!626959 () Bool)

(assert (=> b!1098480 (= e!626959 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098481 () Bool)

(declare-fun e!626954 () Unit!35957)

(declare-fun lt!491331 () Unit!35957)

(assert (=> b!1098481 (= e!626954 lt!491331)))

(declare-fun lt!491313 () ListLongMap!15343)

(assert (=> b!1098481 (= lt!491313 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491329 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491318 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491318 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491330 () Unit!35957)

(declare-fun addStillContains!652 (ListLongMap!15343 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!35957)

(assert (=> b!1098481 (= lt!491330 (addStillContains!652 lt!491313 lt!491329 zeroValue!831 lt!491318))))

(declare-fun contains!6357 (ListLongMap!15343 (_ BitVec 64)) Bool)

(assert (=> b!1098481 (contains!6357 (+!3399 lt!491313 (tuple2!17375 lt!491329 zeroValue!831)) lt!491318)))

(declare-fun lt!491316 () Unit!35957)

(assert (=> b!1098481 (= lt!491316 lt!491330)))

(declare-fun lt!491314 () ListLongMap!15343)

(assert (=> b!1098481 (= lt!491314 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491315 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491315 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491333 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491333 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491319 () Unit!35957)

(declare-fun addApplyDifferent!508 (ListLongMap!15343 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!35957)

(assert (=> b!1098481 (= lt!491319 (addApplyDifferent!508 lt!491314 lt!491315 minValue!831 lt!491333))))

(assert (=> b!1098481 (= (apply!939 (+!3399 lt!491314 (tuple2!17375 lt!491315 minValue!831)) lt!491333) (apply!939 lt!491314 lt!491333))))

(declare-fun lt!491312 () Unit!35957)

(assert (=> b!1098481 (= lt!491312 lt!491319)))

(declare-fun lt!491321 () ListLongMap!15343)

(assert (=> b!1098481 (= lt!491321 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491322 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491328 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491328 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!491325 () Unit!35957)

(assert (=> b!1098481 (= lt!491325 (addApplyDifferent!508 lt!491321 lt!491322 zeroValue!831 lt!491328))))

(assert (=> b!1098481 (= (apply!939 (+!3399 lt!491321 (tuple2!17375 lt!491322 zeroValue!831)) lt!491328) (apply!939 lt!491321 lt!491328))))

(declare-fun lt!491332 () Unit!35957)

(assert (=> b!1098481 (= lt!491332 lt!491325)))

(declare-fun lt!491324 () ListLongMap!15343)

(assert (=> b!1098481 (= lt!491324 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491327 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491327 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491326 () (_ BitVec 64))

(assert (=> b!1098481 (= lt!491326 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098481 (= lt!491331 (addApplyDifferent!508 lt!491324 lt!491327 minValue!831 lt!491326))))

(assert (=> b!1098481 (= (apply!939 (+!3399 lt!491324 (tuple2!17375 lt!491327 minValue!831)) lt!491326) (apply!939 lt!491324 lt!491326))))

(declare-fun bm!45899 () Bool)

(declare-fun call!45906 () Bool)

(assert (=> bm!45899 (= call!45906 (contains!6357 lt!491323 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098482 () Bool)

(declare-fun c!108494 () Bool)

(assert (=> b!1098482 (= c!108494 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1098482 (= e!626953 e!626963)))

(declare-fun bm!45898 () Bool)

(declare-fun call!45902 () ListLongMap!15343)

(assert (=> bm!45898 (= call!45905 call!45902)))

(declare-fun d!130273 () Bool)

(assert (=> d!130273 e!626956))

(declare-fun res!733111 () Bool)

(assert (=> d!130273 (=> (not res!733111) (not e!626956))))

(assert (=> d!130273 (= res!733111 (or (bvsge #b00000000000000000000000000000000 (size!34756 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))))

(declare-fun lt!491317 () ListLongMap!15343)

(assert (=> d!130273 (= lt!491323 lt!491317)))

(declare-fun lt!491320 () Unit!35957)

(assert (=> d!130273 (= lt!491320 e!626954)))

(declare-fun c!108496 () Bool)

(assert (=> d!130273 (= c!108496 e!626959)))

(declare-fun res!733109 () Bool)

(assert (=> d!130273 (=> (not res!733109) (not e!626959))))

(assert (=> d!130273 (= res!733109 (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> d!130273 (= lt!491317 e!626957)))

(declare-fun c!108492 () Bool)

(assert (=> d!130273 (= c!108492 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130273 (validMask!0 mask!1414)))

(assert (=> d!130273 (= (getCurrentListMap!4308 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491323)))

(declare-fun bm!45900 () Bool)

(assert (=> bm!45900 (= call!45901 (contains!6357 lt!491323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098483 () Bool)

(declare-fun e!626960 () Bool)

(assert (=> b!1098483 (= e!626960 (not call!45906))))

(declare-fun b!1098484 () Bool)

(assert (=> b!1098484 (= e!626956 e!626960)))

(declare-fun c!108495 () Bool)

(assert (=> b!1098484 (= c!108495 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45901 () Bool)

(assert (=> bm!45901 (= call!45902 call!45904)))

(declare-fun bm!45902 () Bool)

(declare-fun c!108493 () Bool)

(assert (=> bm!45902 (= call!45903 (+!3399 (ite c!108492 call!45904 (ite c!108493 call!45902 call!45905)) (ite (or c!108492 c!108493) (tuple2!17375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098485 () Bool)

(declare-fun Unit!35963 () Unit!35957)

(assert (=> b!1098485 (= e!626954 Unit!35963)))

(declare-fun b!1098486 () Bool)

(assert (=> b!1098486 (= e!626965 e!626958)))

(declare-fun res!733105 () Bool)

(assert (=> b!1098486 (=> (not res!733105) (not e!626958))))

(assert (=> b!1098486 (= res!733105 (contains!6357 lt!491323 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098486 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(declare-fun b!1098487 () Bool)

(assert (=> b!1098487 (= e!626957 e!626953)))

(assert (=> b!1098487 (= c!108493 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45903 () Bool)

(assert (=> bm!45903 (= call!45900 call!45903)))

(declare-fun b!1098488 () Bool)

(assert (=> b!1098488 (= e!626964 (not call!45901))))

(declare-fun b!1098489 () Bool)

(assert (=> b!1098489 (= e!626960 e!626962)))

(declare-fun res!733107 () Bool)

(assert (=> b!1098489 (= res!733107 call!45906)))

(assert (=> b!1098489 (=> (not res!733107) (not e!626962))))

(assert (= (and d!130273 c!108492) b!1098470))

(assert (= (and d!130273 (not c!108492)) b!1098487))

(assert (= (and b!1098487 c!108493) b!1098471))

(assert (= (and b!1098487 (not c!108493)) b!1098482))

(assert (= (and b!1098482 c!108494) b!1098474))

(assert (= (and b!1098482 (not c!108494)) b!1098478))

(assert (= (or b!1098474 b!1098478) bm!45898))

(assert (= (or b!1098471 bm!45898) bm!45901))

(assert (= (or b!1098471 b!1098474) bm!45903))

(assert (= (or b!1098470 bm!45901) bm!45897))

(assert (= (or b!1098470 bm!45903) bm!45902))

(assert (= (and d!130273 res!733109) b!1098480))

(assert (= (and d!130273 c!108496) b!1098481))

(assert (= (and d!130273 (not c!108496)) b!1098485))

(assert (= (and d!130273 res!733111) b!1098472))

(assert (= (and b!1098472 res!733110) b!1098479))

(assert (= (and b!1098472 (not res!733108)) b!1098486))

(assert (= (and b!1098486 res!733105) b!1098477))

(assert (= (and b!1098472 res!733104) b!1098475))

(assert (= (and b!1098475 c!108491) b!1098476))

(assert (= (and b!1098475 (not c!108491)) b!1098488))

(assert (= (and b!1098476 res!733103) b!1098473))

(assert (= (or b!1098476 b!1098488) bm!45900))

(assert (= (and b!1098475 res!733106) b!1098484))

(assert (= (and b!1098484 c!108495) b!1098489))

(assert (= (and b!1098484 (not c!108495)) b!1098483))

(assert (= (and b!1098489 res!733107) b!1098469))

(assert (= (or b!1098489 b!1098483) bm!45899))

(declare-fun b_lambda!17823 () Bool)

(assert (=> (not b_lambda!17823) (not b!1098477)))

(assert (=> b!1098477 t!34090))

(declare-fun b_and!36869 () Bool)

(assert (= b_and!36859 (and (=> t!34090 result!16431) b_and!36869)))

(declare-fun m!1017681 () Bool)

(assert (=> bm!45902 m!1017681))

(assert (=> b!1098479 m!1017663))

(assert (=> b!1098479 m!1017663))

(assert (=> b!1098479 m!1017667))

(declare-fun m!1017683 () Bool)

(assert (=> b!1098470 m!1017683))

(assert (=> bm!45897 m!1017535))

(declare-fun m!1017685 () Bool)

(assert (=> bm!45899 m!1017685))

(assert (=> d!130273 m!1017513))

(declare-fun m!1017687 () Bool)

(assert (=> b!1098469 m!1017687))

(assert (=> b!1098477 m!1017523))

(declare-fun m!1017689 () Bool)

(assert (=> b!1098477 m!1017689))

(assert (=> b!1098477 m!1017523))

(declare-fun m!1017691 () Bool)

(assert (=> b!1098477 m!1017691))

(assert (=> b!1098477 m!1017663))

(declare-fun m!1017693 () Bool)

(assert (=> b!1098477 m!1017693))

(assert (=> b!1098477 m!1017663))

(assert (=> b!1098477 m!1017689))

(assert (=> b!1098480 m!1017663))

(assert (=> b!1098480 m!1017663))

(assert (=> b!1098480 m!1017667))

(declare-fun m!1017695 () Bool)

(assert (=> bm!45900 m!1017695))

(declare-fun m!1017697 () Bool)

(assert (=> b!1098473 m!1017697))

(assert (=> b!1098486 m!1017663))

(assert (=> b!1098486 m!1017663))

(declare-fun m!1017699 () Bool)

(assert (=> b!1098486 m!1017699))

(declare-fun m!1017701 () Bool)

(assert (=> b!1098481 m!1017701))

(declare-fun m!1017703 () Bool)

(assert (=> b!1098481 m!1017703))

(declare-fun m!1017705 () Bool)

(assert (=> b!1098481 m!1017705))

(declare-fun m!1017707 () Bool)

(assert (=> b!1098481 m!1017707))

(declare-fun m!1017709 () Bool)

(assert (=> b!1098481 m!1017709))

(declare-fun m!1017711 () Bool)

(assert (=> b!1098481 m!1017711))

(declare-fun m!1017713 () Bool)

(assert (=> b!1098481 m!1017713))

(declare-fun m!1017715 () Bool)

(assert (=> b!1098481 m!1017715))

(declare-fun m!1017717 () Bool)

(assert (=> b!1098481 m!1017717))

(assert (=> b!1098481 m!1017705))

(declare-fun m!1017719 () Bool)

(assert (=> b!1098481 m!1017719))

(declare-fun m!1017721 () Bool)

(assert (=> b!1098481 m!1017721))

(assert (=> b!1098481 m!1017709))

(assert (=> b!1098481 m!1017663))

(declare-fun m!1017723 () Bool)

(assert (=> b!1098481 m!1017723))

(declare-fun m!1017725 () Bool)

(assert (=> b!1098481 m!1017725))

(declare-fun m!1017727 () Bool)

(assert (=> b!1098481 m!1017727))

(assert (=> b!1098481 m!1017713))

(declare-fun m!1017729 () Bool)

(assert (=> b!1098481 m!1017729))

(assert (=> b!1098481 m!1017535))

(assert (=> b!1098481 m!1017723))

(assert (=> b!1098308 d!130273))

(declare-fun call!45909 () ListLongMap!15343)

(declare-fun bm!45906 () Bool)

(assert (=> bm!45906 (= call!45909 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098515 () Bool)

(declare-fun e!626984 () Bool)

(declare-fun e!626985 () Bool)

(assert (=> b!1098515 (= e!626984 e!626985)))

(declare-fun c!108505 () Bool)

(assert (=> b!1098515 (= c!108505 (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(declare-fun b!1098516 () Bool)

(declare-fun lt!491351 () ListLongMap!15343)

(declare-fun isEmpty!969 (ListLongMap!15343) Bool)

(assert (=> b!1098516 (= e!626985 (isEmpty!969 lt!491351))))

(declare-fun b!1098517 () Bool)

(assert (=> b!1098517 (= e!626985 (= lt!491351 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098518 () Bool)

(declare-fun e!626982 () ListLongMap!15343)

(declare-fun e!626980 () ListLongMap!15343)

(assert (=> b!1098518 (= e!626982 e!626980)))

(declare-fun c!108507 () Bool)

(assert (=> b!1098518 (= c!108507 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(declare-fun b!1098519 () Bool)

(assert (=> b!1098519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (=> b!1098519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34757 lt!491171)))))

(declare-fun e!626981 () Bool)

(assert (=> b!1098519 (= e!626981 (= (apply!939 lt!491351 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)) (get!17617 (select (arr!34219 lt!491171) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098520 () Bool)

(assert (=> b!1098520 (= e!626984 e!626981)))

(assert (=> b!1098520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(declare-fun res!733120 () Bool)

(assert (=> b!1098520 (= res!733120 (contains!6357 lt!491351 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(assert (=> b!1098520 (=> (not res!733120) (not e!626981))))

(declare-fun b!1098521 () Bool)

(assert (=> b!1098521 (= e!626982 (ListLongMap!15344 Nil!23962))))

(declare-fun d!130275 () Bool)

(declare-fun e!626983 () Bool)

(assert (=> d!130275 e!626983))

(declare-fun res!733123 () Bool)

(assert (=> d!130275 (=> (not res!733123) (not e!626983))))

(assert (=> d!130275 (= res!733123 (not (contains!6357 lt!491351 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130275 (= lt!491351 e!626982)))

(declare-fun c!108508 () Bool)

(assert (=> d!130275 (= c!108508 (bvsge #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (=> d!130275 (validMask!0 mask!1414)))

(assert (=> d!130275 (= (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491351)))

(declare-fun b!1098514 () Bool)

(declare-fun res!733121 () Bool)

(assert (=> b!1098514 (=> (not res!733121) (not e!626983))))

(assert (=> b!1098514 (= res!733121 (not (contains!6357 lt!491351 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098522 () Bool)

(declare-fun lt!491352 () Unit!35957)

(declare-fun lt!491348 () Unit!35957)

(assert (=> b!1098522 (= lt!491352 lt!491348)))

(declare-fun lt!491349 () (_ BitVec 64))

(declare-fun lt!491353 () ListLongMap!15343)

(declare-fun lt!491350 () (_ BitVec 64))

(declare-fun lt!491354 () V!41313)

(assert (=> b!1098522 (not (contains!6357 (+!3399 lt!491353 (tuple2!17375 lt!491350 lt!491354)) lt!491349))))

(declare-fun addStillNotContains!275 (ListLongMap!15343 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!35957)

(assert (=> b!1098522 (= lt!491348 (addStillNotContains!275 lt!491353 lt!491350 lt!491354 lt!491349))))

(assert (=> b!1098522 (= lt!491349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098522 (= lt!491354 (get!17617 (select (arr!34219 lt!491171) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098522 (= lt!491350 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(assert (=> b!1098522 (= lt!491353 call!45909)))

(assert (=> b!1098522 (= e!626980 (+!3399 call!45909 (tuple2!17375 (select (arr!34218 lt!491166) #b00000000000000000000000000000000) (get!17617 (select (arr!34219 lt!491171) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098523 () Bool)

(declare-fun e!626986 () Bool)

(assert (=> b!1098523 (= e!626986 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(assert (=> b!1098523 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1098524 () Bool)

(assert (=> b!1098524 (= e!626980 call!45909)))

(declare-fun b!1098525 () Bool)

(assert (=> b!1098525 (= e!626983 e!626984)))

(declare-fun c!108506 () Bool)

(assert (=> b!1098525 (= c!108506 e!626986)))

(declare-fun res!733122 () Bool)

(assert (=> b!1098525 (=> (not res!733122) (not e!626986))))

(assert (=> b!1098525 (= res!733122 (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (= (and d!130275 c!108508) b!1098521))

(assert (= (and d!130275 (not c!108508)) b!1098518))

(assert (= (and b!1098518 c!108507) b!1098522))

(assert (= (and b!1098518 (not c!108507)) b!1098524))

(assert (= (or b!1098522 b!1098524) bm!45906))

(assert (= (and d!130275 res!733123) b!1098514))

(assert (= (and b!1098514 res!733121) b!1098525))

(assert (= (and b!1098525 res!733122) b!1098523))

(assert (= (and b!1098525 c!108506) b!1098520))

(assert (= (and b!1098525 (not c!108506)) b!1098515))

(assert (= (and b!1098520 res!733120) b!1098519))

(assert (= (and b!1098515 c!108505) b!1098517))

(assert (= (and b!1098515 (not c!108505)) b!1098516))

(declare-fun b_lambda!17825 () Bool)

(assert (=> (not b_lambda!17825) (not b!1098519)))

(assert (=> b!1098519 t!34090))

(declare-fun b_and!36871 () Bool)

(assert (= b_and!36869 (and (=> t!34090 result!16431) b_and!36871)))

(declare-fun b_lambda!17827 () Bool)

(assert (=> (not b_lambda!17827) (not b!1098522)))

(assert (=> b!1098522 t!34090))

(declare-fun b_and!36873 () Bool)

(assert (= b_and!36871 (and (=> t!34090 result!16431) b_and!36873)))

(declare-fun m!1017731 () Bool)

(assert (=> b!1098517 m!1017731))

(declare-fun m!1017733 () Bool)

(assert (=> b!1098516 m!1017733))

(declare-fun m!1017735 () Bool)

(assert (=> b!1098518 m!1017735))

(assert (=> b!1098518 m!1017735))

(declare-fun m!1017737 () Bool)

(assert (=> b!1098518 m!1017737))

(declare-fun m!1017739 () Bool)

(assert (=> d!130275 m!1017739))

(assert (=> d!130275 m!1017513))

(assert (=> b!1098523 m!1017735))

(assert (=> b!1098523 m!1017735))

(assert (=> b!1098523 m!1017737))

(declare-fun m!1017741 () Bool)

(assert (=> b!1098514 m!1017741))

(declare-fun m!1017743 () Bool)

(assert (=> b!1098522 m!1017743))

(assert (=> b!1098522 m!1017523))

(declare-fun m!1017745 () Bool)

(assert (=> b!1098522 m!1017745))

(declare-fun m!1017747 () Bool)

(assert (=> b!1098522 m!1017747))

(declare-fun m!1017749 () Bool)

(assert (=> b!1098522 m!1017749))

(assert (=> b!1098522 m!1017743))

(assert (=> b!1098522 m!1017523))

(assert (=> b!1098522 m!1017747))

(declare-fun m!1017751 () Bool)

(assert (=> b!1098522 m!1017751))

(declare-fun m!1017753 () Bool)

(assert (=> b!1098522 m!1017753))

(assert (=> b!1098522 m!1017735))

(assert (=> b!1098519 m!1017523))

(assert (=> b!1098519 m!1017743))

(assert (=> b!1098519 m!1017735))

(assert (=> b!1098519 m!1017743))

(assert (=> b!1098519 m!1017523))

(assert (=> b!1098519 m!1017745))

(assert (=> b!1098519 m!1017735))

(declare-fun m!1017755 () Bool)

(assert (=> b!1098519 m!1017755))

(assert (=> bm!45906 m!1017731))

(assert (=> b!1098520 m!1017735))

(assert (=> b!1098520 m!1017735))

(declare-fun m!1017757 () Bool)

(assert (=> b!1098520 m!1017757))

(assert (=> b!1098308 d!130275))

(declare-fun b!1098532 () Bool)

(declare-fun e!626991 () Bool)

(declare-fun call!45915 () ListLongMap!15343)

(declare-fun call!45914 () ListLongMap!15343)

(assert (=> b!1098532 (= e!626991 (= call!45915 call!45914))))

(assert (=> b!1098532 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34757 _values!874)))))

(declare-fun bm!45911 () Bool)

(assert (=> bm!45911 (= call!45914 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098533 () Bool)

(declare-fun e!626992 () Bool)

(assert (=> b!1098533 (= e!626992 e!626991)))

(declare-fun c!108511 () Bool)

(assert (=> b!1098533 (= c!108511 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1098534 () Bool)

(assert (=> b!1098534 (= e!626991 (= call!45915 (-!922 call!45914 k0!904)))))

(assert (=> b!1098534 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34757 _values!874)))))

(declare-fun bm!45912 () Bool)

(assert (=> bm!45912 (= call!45915 (getCurrentListMapNoExtraKeys!4215 (array!71099 (store (arr!34218 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34756 _keys!1070)) (array!71101 (store (arr!34219 _values!874) i!650 (ValueCellFull!12860 (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34757 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun d!130277 () Bool)

(assert (=> d!130277 e!626992))

(declare-fun res!733126 () Bool)

(assert (=> d!130277 (=> (not res!733126) (not e!626992))))

(assert (=> d!130277 (= res!733126 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34756 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34756 _keys!1070))))))))

(declare-fun lt!491357 () Unit!35957)

(declare-fun choose!1772 (array!71098 array!71100 (_ BitVec 32) (_ BitVec 32) V!41313 V!41313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35957)

(assert (=> d!130277 (= lt!491357 (choose!1772 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130277 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> d!130277 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!197 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!491357)))

(assert (= (and d!130277 res!733126) b!1098533))

(assert (= (and b!1098533 c!108511) b!1098534))

(assert (= (and b!1098533 (not c!108511)) b!1098532))

(assert (= (or b!1098534 b!1098532) bm!45911))

(assert (= (or b!1098534 b!1098532) bm!45912))

(declare-fun b_lambda!17829 () Bool)

(assert (=> (not b_lambda!17829) (not bm!45912)))

(assert (=> bm!45912 t!34090))

(declare-fun b_and!36875 () Bool)

(assert (= b_and!36873 (and (=> t!34090 result!16431) b_and!36875)))

(assert (=> bm!45911 m!1017535))

(declare-fun m!1017759 () Bool)

(assert (=> b!1098534 m!1017759))

(assert (=> bm!45912 m!1017509))

(assert (=> bm!45912 m!1017523))

(assert (=> bm!45912 m!1017525))

(declare-fun m!1017761 () Bool)

(assert (=> bm!45912 m!1017761))

(declare-fun m!1017763 () Bool)

(assert (=> d!130277 m!1017763))

(assert (=> b!1098308 d!130277))

(declare-fun d!130279 () Bool)

(declare-fun lt!491360 () ListLongMap!15343)

(assert (=> d!130279 (not (contains!6357 lt!491360 k0!904))))

(declare-fun removeStrictlySorted!80 (List!23965 (_ BitVec 64)) List!23965)

(assert (=> d!130279 (= lt!491360 (ListLongMap!15344 (removeStrictlySorted!80 (toList!7687 lt!491174) k0!904)))))

(assert (=> d!130279 (= (-!922 lt!491174 k0!904) lt!491360)))

(declare-fun bs!32243 () Bool)

(assert (= bs!32243 d!130279))

(declare-fun m!1017765 () Bool)

(assert (=> bs!32243 m!1017765))

(declare-fun m!1017767 () Bool)

(assert (=> bs!32243 m!1017767))

(assert (=> b!1098308 d!130279))

(declare-fun bm!45913 () Bool)

(declare-fun call!45916 () ListLongMap!15343)

(assert (=> bm!45913 (= call!45916 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1098536 () Bool)

(declare-fun e!626997 () Bool)

(declare-fun e!626998 () Bool)

(assert (=> b!1098536 (= e!626997 e!626998)))

(declare-fun c!108512 () Bool)

(assert (=> b!1098536 (= c!108512 (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(declare-fun b!1098537 () Bool)

(declare-fun lt!491364 () ListLongMap!15343)

(assert (=> b!1098537 (= e!626998 (isEmpty!969 lt!491364))))

(declare-fun b!1098538 () Bool)

(assert (=> b!1098538 (= e!626998 (= lt!491364 (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1098539 () Bool)

(declare-fun e!626995 () ListLongMap!15343)

(declare-fun e!626993 () ListLongMap!15343)

(assert (=> b!1098539 (= e!626995 e!626993)))

(declare-fun c!108514 () Bool)

(assert (=> b!1098539 (= c!108514 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1098540 () Bool)

(assert (=> b!1098540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> b!1098540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34757 _values!874)))))

(declare-fun e!626994 () Bool)

(assert (=> b!1098540 (= e!626994 (= (apply!939 lt!491364 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)) (get!17617 (select (arr!34219 _values!874) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1098541 () Bool)

(assert (=> b!1098541 (= e!626997 e!626994)))

(assert (=> b!1098541 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(declare-fun res!733127 () Bool)

(assert (=> b!1098541 (= res!733127 (contains!6357 lt!491364 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098541 (=> (not res!733127) (not e!626994))))

(declare-fun b!1098542 () Bool)

(assert (=> b!1098542 (= e!626995 (ListLongMap!15344 Nil!23962))))

(declare-fun d!130281 () Bool)

(declare-fun e!626996 () Bool)

(assert (=> d!130281 e!626996))

(declare-fun res!733130 () Bool)

(assert (=> d!130281 (=> (not res!733130) (not e!626996))))

(assert (=> d!130281 (= res!733130 (not (contains!6357 lt!491364 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130281 (= lt!491364 e!626995)))

(declare-fun c!108515 () Bool)

(assert (=> d!130281 (= c!108515 (bvsge #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (=> d!130281 (validMask!0 mask!1414)))

(assert (=> d!130281 (= (getCurrentListMapNoExtraKeys!4215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491364)))

(declare-fun b!1098535 () Bool)

(declare-fun res!733128 () Bool)

(assert (=> b!1098535 (=> (not res!733128) (not e!626996))))

(assert (=> b!1098535 (= res!733128 (not (contains!6357 lt!491364 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1098543 () Bool)

(declare-fun lt!491365 () Unit!35957)

(declare-fun lt!491361 () Unit!35957)

(assert (=> b!1098543 (= lt!491365 lt!491361)))

(declare-fun lt!491367 () V!41313)

(declare-fun lt!491363 () (_ BitVec 64))

(declare-fun lt!491362 () (_ BitVec 64))

(declare-fun lt!491366 () ListLongMap!15343)

(assert (=> b!1098543 (not (contains!6357 (+!3399 lt!491366 (tuple2!17375 lt!491363 lt!491367)) lt!491362))))

(assert (=> b!1098543 (= lt!491361 (addStillNotContains!275 lt!491366 lt!491363 lt!491367 lt!491362))))

(assert (=> b!1098543 (= lt!491362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1098543 (= lt!491367 (get!17617 (select (arr!34219 _values!874) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1098543 (= lt!491363 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1098543 (= lt!491366 call!45916)))

(assert (=> b!1098543 (= e!626993 (+!3399 call!45916 (tuple2!17375 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000) (get!17617 (select (arr!34219 _values!874) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1098544 () Bool)

(declare-fun e!626999 () Bool)

(assert (=> b!1098544 (= e!626999 (validKeyInArray!0 (select (arr!34218 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1098544 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1098545 () Bool)

(assert (=> b!1098545 (= e!626993 call!45916)))

(declare-fun b!1098546 () Bool)

(assert (=> b!1098546 (= e!626996 e!626997)))

(declare-fun c!108513 () Bool)

(assert (=> b!1098546 (= c!108513 e!626999)))

(declare-fun res!733129 () Bool)

(assert (=> b!1098546 (=> (not res!733129) (not e!626999))))

(assert (=> b!1098546 (= res!733129 (bvslt #b00000000000000000000000000000000 (size!34756 _keys!1070)))))

(assert (= (and d!130281 c!108515) b!1098542))

(assert (= (and d!130281 (not c!108515)) b!1098539))

(assert (= (and b!1098539 c!108514) b!1098543))

(assert (= (and b!1098539 (not c!108514)) b!1098545))

(assert (= (or b!1098543 b!1098545) bm!45913))

(assert (= (and d!130281 res!733130) b!1098535))

(assert (= (and b!1098535 res!733128) b!1098546))

(assert (= (and b!1098546 res!733129) b!1098544))

(assert (= (and b!1098546 c!108513) b!1098541))

(assert (= (and b!1098546 (not c!108513)) b!1098536))

(assert (= (and b!1098541 res!733127) b!1098540))

(assert (= (and b!1098536 c!108512) b!1098538))

(assert (= (and b!1098536 (not c!108512)) b!1098537))

(declare-fun b_lambda!17831 () Bool)

(assert (=> (not b_lambda!17831) (not b!1098540)))

(assert (=> b!1098540 t!34090))

(declare-fun b_and!36877 () Bool)

(assert (= b_and!36875 (and (=> t!34090 result!16431) b_and!36877)))

(declare-fun b_lambda!17833 () Bool)

(assert (=> (not b_lambda!17833) (not b!1098543)))

(assert (=> b!1098543 t!34090))

(declare-fun b_and!36879 () Bool)

(assert (= b_and!36877 (and (=> t!34090 result!16431) b_and!36879)))

(declare-fun m!1017769 () Bool)

(assert (=> b!1098538 m!1017769))

(declare-fun m!1017771 () Bool)

(assert (=> b!1098537 m!1017771))

(assert (=> b!1098539 m!1017663))

(assert (=> b!1098539 m!1017663))

(assert (=> b!1098539 m!1017667))

(declare-fun m!1017773 () Bool)

(assert (=> d!130281 m!1017773))

(assert (=> d!130281 m!1017513))

(assert (=> b!1098544 m!1017663))

(assert (=> b!1098544 m!1017663))

(assert (=> b!1098544 m!1017667))

(declare-fun m!1017775 () Bool)

(assert (=> b!1098535 m!1017775))

(assert (=> b!1098543 m!1017689))

(assert (=> b!1098543 m!1017523))

(assert (=> b!1098543 m!1017691))

(declare-fun m!1017777 () Bool)

(assert (=> b!1098543 m!1017777))

(declare-fun m!1017779 () Bool)

(assert (=> b!1098543 m!1017779))

(assert (=> b!1098543 m!1017689))

(assert (=> b!1098543 m!1017523))

(assert (=> b!1098543 m!1017777))

(declare-fun m!1017781 () Bool)

(assert (=> b!1098543 m!1017781))

(declare-fun m!1017783 () Bool)

(assert (=> b!1098543 m!1017783))

(assert (=> b!1098543 m!1017663))

(assert (=> b!1098540 m!1017523))

(assert (=> b!1098540 m!1017689))

(assert (=> b!1098540 m!1017663))

(assert (=> b!1098540 m!1017689))

(assert (=> b!1098540 m!1017523))

(assert (=> b!1098540 m!1017691))

(assert (=> b!1098540 m!1017663))

(declare-fun m!1017785 () Bool)

(assert (=> b!1098540 m!1017785))

(assert (=> bm!45913 m!1017769))

(assert (=> b!1098541 m!1017663))

(assert (=> b!1098541 m!1017663))

(declare-fun m!1017787 () Bool)

(assert (=> b!1098541 m!1017787))

(assert (=> b!1098308 d!130281))

(declare-fun b!1098547 () Bool)

(declare-fun e!627009 () Bool)

(declare-fun lt!491379 () ListLongMap!15343)

(assert (=> b!1098547 (= e!627009 (= (apply!939 lt!491379 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1098548 () Bool)

(declare-fun e!627004 () ListLongMap!15343)

(declare-fun call!45920 () ListLongMap!15343)

(assert (=> b!1098548 (= e!627004 (+!3399 call!45920 (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun call!45921 () ListLongMap!15343)

(declare-fun bm!45914 () Bool)

(assert (=> bm!45914 (= call!45921 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1098549 () Bool)

(declare-fun e!627000 () ListLongMap!15343)

(declare-fun call!45917 () ListLongMap!15343)

(assert (=> b!1098549 (= e!627000 call!45917)))

(declare-fun b!1098550 () Bool)

(declare-fun res!733132 () Bool)

(declare-fun e!627003 () Bool)

(assert (=> b!1098550 (=> (not res!733132) (not e!627003))))

(declare-fun e!627012 () Bool)

(assert (=> b!1098550 (= res!733132 e!627012)))

(declare-fun res!733136 () Bool)

(assert (=> b!1098550 (=> res!733136 e!627012)))

(declare-fun e!627008 () Bool)

(assert (=> b!1098550 (= res!733136 (not e!627008))))

(declare-fun res!733138 () Bool)

(assert (=> b!1098550 (=> (not res!733138) (not e!627008))))

(assert (=> b!1098550 (= res!733138 (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(declare-fun b!1098551 () Bool)

(declare-fun e!627002 () Bool)

(assert (=> b!1098551 (= e!627002 (= (apply!939 lt!491379 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1098552 () Bool)

(declare-fun e!627010 () ListLongMap!15343)

(assert (=> b!1098552 (= e!627010 call!45917)))

(declare-fun b!1098553 () Bool)

(declare-fun res!733134 () Bool)

(assert (=> b!1098553 (=> (not res!733134) (not e!627003))))

(declare-fun e!627011 () Bool)

(assert (=> b!1098553 (= res!733134 e!627011)))

(declare-fun c!108516 () Bool)

(assert (=> b!1098553 (= c!108516 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1098554 () Bool)

(assert (=> b!1098554 (= e!627011 e!627002)))

(declare-fun res!733131 () Bool)

(declare-fun call!45918 () Bool)

(assert (=> b!1098554 (= res!733131 call!45918)))

(assert (=> b!1098554 (=> (not res!733131) (not e!627002))))

(declare-fun b!1098555 () Bool)

(declare-fun e!627005 () Bool)

(assert (=> b!1098555 (= e!627005 (= (apply!939 lt!491379 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)) (get!17617 (select (arr!34219 lt!491171) #b00000000000000000000000000000000) (dynLambda!2284 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1098555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34757 lt!491171)))))

(assert (=> b!1098555 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(declare-fun b!1098556 () Bool)

(declare-fun call!45922 () ListLongMap!15343)

(assert (=> b!1098556 (= e!627010 call!45922)))

(declare-fun b!1098557 () Bool)

(assert (=> b!1098557 (= e!627008 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(declare-fun b!1098558 () Bool)

(declare-fun e!627006 () Bool)

(assert (=> b!1098558 (= e!627006 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(declare-fun b!1098559 () Bool)

(declare-fun e!627001 () Unit!35957)

(declare-fun lt!491387 () Unit!35957)

(assert (=> b!1098559 (= e!627001 lt!491387)))

(declare-fun lt!491369 () ListLongMap!15343)

(assert (=> b!1098559 (= lt!491369 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491385 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491385 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491374 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491374 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(declare-fun lt!491386 () Unit!35957)

(assert (=> b!1098559 (= lt!491386 (addStillContains!652 lt!491369 lt!491385 zeroValue!831 lt!491374))))

(assert (=> b!1098559 (contains!6357 (+!3399 lt!491369 (tuple2!17375 lt!491385 zeroValue!831)) lt!491374)))

(declare-fun lt!491372 () Unit!35957)

(assert (=> b!1098559 (= lt!491372 lt!491386)))

(declare-fun lt!491370 () ListLongMap!15343)

(assert (=> b!1098559 (= lt!491370 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491371 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491389 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491389 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(declare-fun lt!491375 () Unit!35957)

(assert (=> b!1098559 (= lt!491375 (addApplyDifferent!508 lt!491370 lt!491371 minValue!831 lt!491389))))

(assert (=> b!1098559 (= (apply!939 (+!3399 lt!491370 (tuple2!17375 lt!491371 minValue!831)) lt!491389) (apply!939 lt!491370 lt!491389))))

(declare-fun lt!491368 () Unit!35957)

(assert (=> b!1098559 (= lt!491368 lt!491375)))

(declare-fun lt!491377 () ListLongMap!15343)

(assert (=> b!1098559 (= lt!491377 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491378 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491378 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491384 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491384 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(declare-fun lt!491381 () Unit!35957)

(assert (=> b!1098559 (= lt!491381 (addApplyDifferent!508 lt!491377 lt!491378 zeroValue!831 lt!491384))))

(assert (=> b!1098559 (= (apply!939 (+!3399 lt!491377 (tuple2!17375 lt!491378 zeroValue!831)) lt!491384) (apply!939 lt!491377 lt!491384))))

(declare-fun lt!491388 () Unit!35957)

(assert (=> b!1098559 (= lt!491388 lt!491381)))

(declare-fun lt!491380 () ListLongMap!15343)

(assert (=> b!1098559 (= lt!491380 (getCurrentListMapNoExtraKeys!4215 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!491383 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!491382 () (_ BitVec 64))

(assert (=> b!1098559 (= lt!491382 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(assert (=> b!1098559 (= lt!491387 (addApplyDifferent!508 lt!491380 lt!491383 minValue!831 lt!491382))))

(assert (=> b!1098559 (= (apply!939 (+!3399 lt!491380 (tuple2!17375 lt!491383 minValue!831)) lt!491382) (apply!939 lt!491380 lt!491382))))

(declare-fun bm!45916 () Bool)

(declare-fun call!45923 () Bool)

(assert (=> bm!45916 (= call!45923 (contains!6357 lt!491379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098560 () Bool)

(declare-fun c!108519 () Bool)

(assert (=> b!1098560 (= c!108519 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1098560 (= e!627000 e!627010)))

(declare-fun bm!45915 () Bool)

(declare-fun call!45919 () ListLongMap!15343)

(assert (=> bm!45915 (= call!45922 call!45919)))

(declare-fun d!130283 () Bool)

(assert (=> d!130283 e!627003))

(declare-fun res!733139 () Bool)

(assert (=> d!130283 (=> (not res!733139) (not e!627003))))

(assert (=> d!130283 (= res!733139 (or (bvsge #b00000000000000000000000000000000 (size!34756 lt!491166)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))))

(declare-fun lt!491373 () ListLongMap!15343)

(assert (=> d!130283 (= lt!491379 lt!491373)))

(declare-fun lt!491376 () Unit!35957)

(assert (=> d!130283 (= lt!491376 e!627001)))

(declare-fun c!108521 () Bool)

(assert (=> d!130283 (= c!108521 e!627006)))

(declare-fun res!733137 () Bool)

(assert (=> d!130283 (=> (not res!733137) (not e!627006))))

(assert (=> d!130283 (= res!733137 (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (=> d!130283 (= lt!491373 e!627004)))

(declare-fun c!108517 () Bool)

(assert (=> d!130283 (= c!108517 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130283 (validMask!0 mask!1414)))

(assert (=> d!130283 (= (getCurrentListMap!4308 lt!491166 lt!491171 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!491379)))

(declare-fun bm!45917 () Bool)

(assert (=> bm!45917 (= call!45918 (contains!6357 lt!491379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1098561 () Bool)

(declare-fun e!627007 () Bool)

(assert (=> b!1098561 (= e!627007 (not call!45923))))

(declare-fun b!1098562 () Bool)

(assert (=> b!1098562 (= e!627003 e!627007)))

(declare-fun c!108520 () Bool)

(assert (=> b!1098562 (= c!108520 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45918 () Bool)

(assert (=> bm!45918 (= call!45919 call!45921)))

(declare-fun c!108518 () Bool)

(declare-fun bm!45919 () Bool)

(assert (=> bm!45919 (= call!45920 (+!3399 (ite c!108517 call!45921 (ite c!108518 call!45919 call!45922)) (ite (or c!108517 c!108518) (tuple2!17375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17375 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1098563 () Bool)

(declare-fun Unit!35964 () Unit!35957)

(assert (=> b!1098563 (= e!627001 Unit!35964)))

(declare-fun b!1098564 () Bool)

(assert (=> b!1098564 (= e!627012 e!627005)))

(declare-fun res!733133 () Bool)

(assert (=> b!1098564 (=> (not res!733133) (not e!627005))))

(assert (=> b!1098564 (= res!733133 (contains!6357 lt!491379 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(assert (=> b!1098564 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(declare-fun b!1098565 () Bool)

(assert (=> b!1098565 (= e!627004 e!627000)))

(assert (=> b!1098565 (= c!108518 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45920 () Bool)

(assert (=> bm!45920 (= call!45917 call!45920)))

(declare-fun b!1098566 () Bool)

(assert (=> b!1098566 (= e!627011 (not call!45918))))

(declare-fun b!1098567 () Bool)

(assert (=> b!1098567 (= e!627007 e!627009)))

(declare-fun res!733135 () Bool)

(assert (=> b!1098567 (= res!733135 call!45923)))

(assert (=> b!1098567 (=> (not res!733135) (not e!627009))))

(assert (= (and d!130283 c!108517) b!1098548))

(assert (= (and d!130283 (not c!108517)) b!1098565))

(assert (= (and b!1098565 c!108518) b!1098549))

(assert (= (and b!1098565 (not c!108518)) b!1098560))

(assert (= (and b!1098560 c!108519) b!1098552))

(assert (= (and b!1098560 (not c!108519)) b!1098556))

(assert (= (or b!1098552 b!1098556) bm!45915))

(assert (= (or b!1098549 bm!45915) bm!45918))

(assert (= (or b!1098549 b!1098552) bm!45920))

(assert (= (or b!1098548 bm!45918) bm!45914))

(assert (= (or b!1098548 bm!45920) bm!45919))

(assert (= (and d!130283 res!733137) b!1098558))

(assert (= (and d!130283 c!108521) b!1098559))

(assert (= (and d!130283 (not c!108521)) b!1098563))

(assert (= (and d!130283 res!733139) b!1098550))

(assert (= (and b!1098550 res!733138) b!1098557))

(assert (= (and b!1098550 (not res!733136)) b!1098564))

(assert (= (and b!1098564 res!733133) b!1098555))

(assert (= (and b!1098550 res!733132) b!1098553))

(assert (= (and b!1098553 c!108516) b!1098554))

(assert (= (and b!1098553 (not c!108516)) b!1098566))

(assert (= (and b!1098554 res!733131) b!1098551))

(assert (= (or b!1098554 b!1098566) bm!45917))

(assert (= (and b!1098553 res!733134) b!1098562))

(assert (= (and b!1098562 c!108520) b!1098567))

(assert (= (and b!1098562 (not c!108520)) b!1098561))

(assert (= (and b!1098567 res!733135) b!1098547))

(assert (= (or b!1098567 b!1098561) bm!45916))

(declare-fun b_lambda!17835 () Bool)

(assert (=> (not b_lambda!17835) (not b!1098555)))

(assert (=> b!1098555 t!34090))

(declare-fun b_and!36881 () Bool)

(assert (= b_and!36879 (and (=> t!34090 result!16431) b_and!36881)))

(declare-fun m!1017789 () Bool)

(assert (=> bm!45919 m!1017789))

(assert (=> b!1098557 m!1017735))

(assert (=> b!1098557 m!1017735))

(assert (=> b!1098557 m!1017737))

(declare-fun m!1017791 () Bool)

(assert (=> b!1098548 m!1017791))

(assert (=> bm!45914 m!1017529))

(declare-fun m!1017793 () Bool)

(assert (=> bm!45916 m!1017793))

(assert (=> d!130283 m!1017513))

(declare-fun m!1017795 () Bool)

(assert (=> b!1098547 m!1017795))

(assert (=> b!1098555 m!1017523))

(assert (=> b!1098555 m!1017743))

(assert (=> b!1098555 m!1017523))

(assert (=> b!1098555 m!1017745))

(assert (=> b!1098555 m!1017735))

(declare-fun m!1017797 () Bool)

(assert (=> b!1098555 m!1017797))

(assert (=> b!1098555 m!1017735))

(assert (=> b!1098555 m!1017743))

(assert (=> b!1098558 m!1017735))

(assert (=> b!1098558 m!1017735))

(assert (=> b!1098558 m!1017737))

(declare-fun m!1017799 () Bool)

(assert (=> bm!45917 m!1017799))

(declare-fun m!1017801 () Bool)

(assert (=> b!1098551 m!1017801))

(assert (=> b!1098564 m!1017735))

(assert (=> b!1098564 m!1017735))

(declare-fun m!1017803 () Bool)

(assert (=> b!1098564 m!1017803))

(declare-fun m!1017805 () Bool)

(assert (=> b!1098559 m!1017805))

(declare-fun m!1017807 () Bool)

(assert (=> b!1098559 m!1017807))

(declare-fun m!1017809 () Bool)

(assert (=> b!1098559 m!1017809))

(declare-fun m!1017811 () Bool)

(assert (=> b!1098559 m!1017811))

(declare-fun m!1017813 () Bool)

(assert (=> b!1098559 m!1017813))

(declare-fun m!1017815 () Bool)

(assert (=> b!1098559 m!1017815))

(declare-fun m!1017817 () Bool)

(assert (=> b!1098559 m!1017817))

(declare-fun m!1017819 () Bool)

(assert (=> b!1098559 m!1017819))

(declare-fun m!1017821 () Bool)

(assert (=> b!1098559 m!1017821))

(assert (=> b!1098559 m!1017809))

(declare-fun m!1017823 () Bool)

(assert (=> b!1098559 m!1017823))

(declare-fun m!1017825 () Bool)

(assert (=> b!1098559 m!1017825))

(assert (=> b!1098559 m!1017813))

(assert (=> b!1098559 m!1017735))

(declare-fun m!1017827 () Bool)

(assert (=> b!1098559 m!1017827))

(declare-fun m!1017829 () Bool)

(assert (=> b!1098559 m!1017829))

(declare-fun m!1017831 () Bool)

(assert (=> b!1098559 m!1017831))

(assert (=> b!1098559 m!1017817))

(declare-fun m!1017833 () Bool)

(assert (=> b!1098559 m!1017833))

(assert (=> b!1098559 m!1017529))

(assert (=> b!1098559 m!1017827))

(assert (=> b!1098308 d!130283))

(declare-fun d!130285 () Bool)

(assert (=> d!130285 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!491392 () Unit!35957)

(declare-fun choose!13 (array!71098 (_ BitVec 64) (_ BitVec 32)) Unit!35957)

(assert (=> d!130285 (= lt!491392 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130285 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130285 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!491392)))

(declare-fun bs!32244 () Bool)

(assert (= bs!32244 d!130285))

(assert (=> bs!32244 m!1017531))

(declare-fun m!1017835 () Bool)

(assert (=> bs!32244 m!1017835))

(assert (=> b!1098308 d!130285))

(declare-fun d!130287 () Bool)

(assert (=> d!130287 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96582 d!130287))

(declare-fun d!130289 () Bool)

(assert (=> d!130289 (= (array_inv!26394 _keys!1070) (bvsge (size!34756 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96582 d!130289))

(declare-fun d!130291 () Bool)

(assert (=> d!130291 (= (array_inv!26395 _values!874) (bvsge (size!34757 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96582 d!130291))

(declare-fun b!1098568 () Bool)

(declare-fun e!627015 () Bool)

(assert (=> b!1098568 (= e!627015 (contains!6356 Nil!23963 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(declare-fun b!1098569 () Bool)

(declare-fun e!627016 () Bool)

(declare-fun e!627014 () Bool)

(assert (=> b!1098569 (= e!627016 e!627014)))

(declare-fun c!108522 () Bool)

(assert (=> b!1098569 (= c!108522 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(declare-fun bm!45921 () Bool)

(declare-fun call!45924 () Bool)

(assert (=> bm!45921 (= call!45924 (arrayNoDuplicates!0 lt!491166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108522 (Cons!23962 (select (arr!34218 lt!491166) #b00000000000000000000000000000000) Nil!23963) Nil!23963)))))

(declare-fun d!130293 () Bool)

(declare-fun res!733140 () Bool)

(declare-fun e!627013 () Bool)

(assert (=> d!130293 (=> res!733140 e!627013)))

(assert (=> d!130293 (= res!733140 (bvsge #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (=> d!130293 (= (arrayNoDuplicates!0 lt!491166 #b00000000000000000000000000000000 Nil!23963) e!627013)))

(declare-fun b!1098570 () Bool)

(assert (=> b!1098570 (= e!627014 call!45924)))

(declare-fun b!1098571 () Bool)

(assert (=> b!1098571 (= e!627014 call!45924)))

(declare-fun b!1098572 () Bool)

(assert (=> b!1098572 (= e!627013 e!627016)))

(declare-fun res!733141 () Bool)

(assert (=> b!1098572 (=> (not res!733141) (not e!627016))))

(assert (=> b!1098572 (= res!733141 (not e!627015))))

(declare-fun res!733142 () Bool)

(assert (=> b!1098572 (=> (not res!733142) (not e!627015))))

(assert (=> b!1098572 (= res!733142 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(assert (= (and d!130293 (not res!733140)) b!1098572))

(assert (= (and b!1098572 res!733142) b!1098568))

(assert (= (and b!1098572 res!733141) b!1098569))

(assert (= (and b!1098569 c!108522) b!1098571))

(assert (= (and b!1098569 (not c!108522)) b!1098570))

(assert (= (or b!1098571 b!1098570) bm!45921))

(assert (=> b!1098568 m!1017735))

(assert (=> b!1098568 m!1017735))

(declare-fun m!1017837 () Bool)

(assert (=> b!1098568 m!1017837))

(assert (=> b!1098569 m!1017735))

(assert (=> b!1098569 m!1017735))

(assert (=> b!1098569 m!1017737))

(assert (=> bm!45921 m!1017735))

(declare-fun m!1017839 () Bool)

(assert (=> bm!45921 m!1017839))

(assert (=> b!1098572 m!1017735))

(assert (=> b!1098572 m!1017735))

(assert (=> b!1098572 m!1017737))

(assert (=> b!1098305 d!130293))

(declare-fun b!1098573 () Bool)

(declare-fun e!627018 () Bool)

(declare-fun e!627019 () Bool)

(assert (=> b!1098573 (= e!627018 e!627019)))

(declare-fun lt!491395 () (_ BitVec 64))

(assert (=> b!1098573 (= lt!491395 (select (arr!34218 lt!491166) #b00000000000000000000000000000000))))

(declare-fun lt!491393 () Unit!35957)

(assert (=> b!1098573 (= lt!491393 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!491166 lt!491395 #b00000000000000000000000000000000))))

(assert (=> b!1098573 (arrayContainsKey!0 lt!491166 lt!491395 #b00000000000000000000000000000000)))

(declare-fun lt!491394 () Unit!35957)

(assert (=> b!1098573 (= lt!491394 lt!491393)))

(declare-fun res!733143 () Bool)

(assert (=> b!1098573 (= res!733143 (= (seekEntryOrOpen!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000) lt!491166 mask!1414) (Found!9908 #b00000000000000000000000000000000)))))

(assert (=> b!1098573 (=> (not res!733143) (not e!627019))))

(declare-fun bm!45922 () Bool)

(declare-fun call!45925 () Bool)

(assert (=> bm!45922 (= call!45925 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!491166 mask!1414))))

(declare-fun b!1098574 () Bool)

(assert (=> b!1098574 (= e!627019 call!45925)))

(declare-fun b!1098575 () Bool)

(assert (=> b!1098575 (= e!627018 call!45925)))

(declare-fun d!130295 () Bool)

(declare-fun res!733144 () Bool)

(declare-fun e!627017 () Bool)

(assert (=> d!130295 (=> res!733144 e!627017)))

(assert (=> d!130295 (= res!733144 (bvsge #b00000000000000000000000000000000 (size!34756 lt!491166)))))

(assert (=> d!130295 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!491166 mask!1414) e!627017)))

(declare-fun b!1098576 () Bool)

(assert (=> b!1098576 (= e!627017 e!627018)))

(declare-fun c!108523 () Bool)

(assert (=> b!1098576 (= c!108523 (validKeyInArray!0 (select (arr!34218 lt!491166) #b00000000000000000000000000000000)))))

(assert (= (and d!130295 (not res!733144)) b!1098576))

(assert (= (and b!1098576 c!108523) b!1098573))

(assert (= (and b!1098576 (not c!108523)) b!1098575))

(assert (= (and b!1098573 res!733143) b!1098574))

(assert (= (or b!1098574 b!1098575) bm!45922))

(assert (=> b!1098573 m!1017735))

(declare-fun m!1017841 () Bool)

(assert (=> b!1098573 m!1017841))

(declare-fun m!1017843 () Bool)

(assert (=> b!1098573 m!1017843))

(assert (=> b!1098573 m!1017735))

(declare-fun m!1017845 () Bool)

(assert (=> b!1098573 m!1017845))

(declare-fun m!1017847 () Bool)

(assert (=> bm!45922 m!1017847))

(assert (=> b!1098576 m!1017735))

(assert (=> b!1098576 m!1017735))

(assert (=> b!1098576 m!1017737))

(assert (=> b!1098301 d!130295))

(declare-fun d!130297 () Bool)

(declare-fun e!627022 () Bool)

(assert (=> d!130297 e!627022))

(declare-fun res!733150 () Bool)

(assert (=> d!130297 (=> (not res!733150) (not e!627022))))

(declare-fun lt!491407 () ListLongMap!15343)

(assert (=> d!130297 (= res!733150 (contains!6357 lt!491407 (_1!8698 lt!491172)))))

(declare-fun lt!491404 () List!23965)

(assert (=> d!130297 (= lt!491407 (ListLongMap!15344 lt!491404))))

(declare-fun lt!491406 () Unit!35957)

(declare-fun lt!491405 () Unit!35957)

(assert (=> d!130297 (= lt!491406 lt!491405)))

(declare-datatypes ((Option!674 0))(
  ( (Some!673 (v!16252 V!41313)) (None!672) )
))
(declare-fun getValueByKey!623 (List!23965 (_ BitVec 64)) Option!674)

(assert (=> d!130297 (= (getValueByKey!623 lt!491404 (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172)))))

(declare-fun lemmaContainsTupThenGetReturnValue!299 (List!23965 (_ BitVec 64) V!41313) Unit!35957)

(assert (=> d!130297 (= lt!491405 (lemmaContainsTupThenGetReturnValue!299 lt!491404 (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(declare-fun insertStrictlySorted!392 (List!23965 (_ BitVec 64) V!41313) List!23965)

(assert (=> d!130297 (= lt!491404 (insertStrictlySorted!392 (toList!7687 lt!491167) (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(assert (=> d!130297 (= (+!3399 lt!491167 lt!491172) lt!491407)))

(declare-fun b!1098581 () Bool)

(declare-fun res!733149 () Bool)

(assert (=> b!1098581 (=> (not res!733149) (not e!627022))))

(assert (=> b!1098581 (= res!733149 (= (getValueByKey!623 (toList!7687 lt!491407) (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172))))))

(declare-fun b!1098582 () Bool)

(declare-fun contains!6358 (List!23965 tuple2!17374) Bool)

(assert (=> b!1098582 (= e!627022 (contains!6358 (toList!7687 lt!491407) lt!491172))))

(assert (= (and d!130297 res!733150) b!1098581))

(assert (= (and b!1098581 res!733149) b!1098582))

(declare-fun m!1017849 () Bool)

(assert (=> d!130297 m!1017849))

(declare-fun m!1017851 () Bool)

(assert (=> d!130297 m!1017851))

(declare-fun m!1017853 () Bool)

(assert (=> d!130297 m!1017853))

(declare-fun m!1017855 () Bool)

(assert (=> d!130297 m!1017855))

(declare-fun m!1017857 () Bool)

(assert (=> b!1098581 m!1017857))

(declare-fun m!1017859 () Bool)

(assert (=> b!1098582 m!1017859))

(assert (=> b!1098297 d!130297))

(declare-fun d!130299 () Bool)

(declare-fun e!627023 () Bool)

(assert (=> d!130299 e!627023))

(declare-fun res!733152 () Bool)

(assert (=> d!130299 (=> (not res!733152) (not e!627023))))

(declare-fun lt!491411 () ListLongMap!15343)

(assert (=> d!130299 (= res!733152 (contains!6357 lt!491411 (_1!8698 lt!491172)))))

(declare-fun lt!491408 () List!23965)

(assert (=> d!130299 (= lt!491411 (ListLongMap!15344 lt!491408))))

(declare-fun lt!491410 () Unit!35957)

(declare-fun lt!491409 () Unit!35957)

(assert (=> d!130299 (= lt!491410 lt!491409)))

(assert (=> d!130299 (= (getValueByKey!623 lt!491408 (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172)))))

(assert (=> d!130299 (= lt!491409 (lemmaContainsTupThenGetReturnValue!299 lt!491408 (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(assert (=> d!130299 (= lt!491408 (insertStrictlySorted!392 (toList!7687 lt!491164) (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(assert (=> d!130299 (= (+!3399 lt!491164 lt!491172) lt!491411)))

(declare-fun b!1098583 () Bool)

(declare-fun res!733151 () Bool)

(assert (=> b!1098583 (=> (not res!733151) (not e!627023))))

(assert (=> b!1098583 (= res!733151 (= (getValueByKey!623 (toList!7687 lt!491411) (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172))))))

(declare-fun b!1098584 () Bool)

(assert (=> b!1098584 (= e!627023 (contains!6358 (toList!7687 lt!491411) lt!491172))))

(assert (= (and d!130299 res!733152) b!1098583))

(assert (= (and b!1098583 res!733151) b!1098584))

(declare-fun m!1017861 () Bool)

(assert (=> d!130299 m!1017861))

(declare-fun m!1017863 () Bool)

(assert (=> d!130299 m!1017863))

(declare-fun m!1017865 () Bool)

(assert (=> d!130299 m!1017865))

(declare-fun m!1017867 () Bool)

(assert (=> d!130299 m!1017867))

(declare-fun m!1017869 () Bool)

(assert (=> b!1098583 m!1017869))

(declare-fun m!1017871 () Bool)

(assert (=> b!1098584 m!1017871))

(assert (=> b!1098297 d!130299))

(declare-fun d!130301 () Bool)

(declare-fun e!627024 () Bool)

(assert (=> d!130301 e!627024))

(declare-fun res!733154 () Bool)

(assert (=> d!130301 (=> (not res!733154) (not e!627024))))

(declare-fun lt!491415 () ListLongMap!15343)

(assert (=> d!130301 (= res!733154 (contains!6357 lt!491415 (_1!8698 lt!491168)))))

(declare-fun lt!491412 () List!23965)

(assert (=> d!130301 (= lt!491415 (ListLongMap!15344 lt!491412))))

(declare-fun lt!491414 () Unit!35957)

(declare-fun lt!491413 () Unit!35957)

(assert (=> d!130301 (= lt!491414 lt!491413)))

(assert (=> d!130301 (= (getValueByKey!623 lt!491412 (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168)))))

(assert (=> d!130301 (= lt!491413 (lemmaContainsTupThenGetReturnValue!299 lt!491412 (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130301 (= lt!491412 (insertStrictlySorted!392 (toList!7687 lt!491163) (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130301 (= (+!3399 lt!491163 lt!491168) lt!491415)))

(declare-fun b!1098585 () Bool)

(declare-fun res!733153 () Bool)

(assert (=> b!1098585 (=> (not res!733153) (not e!627024))))

(assert (=> b!1098585 (= res!733153 (= (getValueByKey!623 (toList!7687 lt!491415) (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168))))))

(declare-fun b!1098586 () Bool)

(assert (=> b!1098586 (= e!627024 (contains!6358 (toList!7687 lt!491415) lt!491168))))

(assert (= (and d!130301 res!733154) b!1098585))

(assert (= (and b!1098585 res!733153) b!1098586))

(declare-fun m!1017873 () Bool)

(assert (=> d!130301 m!1017873))

(declare-fun m!1017875 () Bool)

(assert (=> d!130301 m!1017875))

(declare-fun m!1017877 () Bool)

(assert (=> d!130301 m!1017877))

(declare-fun m!1017879 () Bool)

(assert (=> d!130301 m!1017879))

(declare-fun m!1017881 () Bool)

(assert (=> b!1098585 m!1017881))

(declare-fun m!1017883 () Bool)

(assert (=> b!1098586 m!1017883))

(assert (=> b!1098297 d!130301))

(declare-fun d!130303 () Bool)

(assert (=> d!130303 (= (-!922 (+!3399 lt!491174 (tuple2!17375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) k0!904) (+!3399 (-!922 lt!491174 k0!904) (tuple2!17375 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(declare-fun lt!491418 () Unit!35957)

(declare-fun choose!1773 (ListLongMap!15343 (_ BitVec 64) V!41313 (_ BitVec 64)) Unit!35957)

(assert (=> d!130303 (= lt!491418 (choose!1773 lt!491174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> d!130303 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> d!130303 (= (addRemoveCommutativeForDiffKeys!117 lt!491174 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904) lt!491418)))

(declare-fun bs!32245 () Bool)

(assert (= bs!32245 d!130303))

(declare-fun m!1017885 () Bool)

(assert (=> bs!32245 m!1017885))

(declare-fun m!1017887 () Bool)

(assert (=> bs!32245 m!1017887))

(assert (=> bs!32245 m!1017885))

(assert (=> bs!32245 m!1017527))

(declare-fun m!1017889 () Bool)

(assert (=> bs!32245 m!1017889))

(assert (=> bs!32245 m!1017527))

(declare-fun m!1017891 () Bool)

(assert (=> bs!32245 m!1017891))

(assert (=> b!1098297 d!130303))

(declare-fun d!130305 () Bool)

(declare-fun lt!491419 () ListLongMap!15343)

(assert (=> d!130305 (not (contains!6357 lt!491419 k0!904))))

(assert (=> d!130305 (= lt!491419 (ListLongMap!15344 (removeStrictlySorted!80 (toList!7687 lt!491167) k0!904)))))

(assert (=> d!130305 (= (-!922 lt!491167 k0!904) lt!491419)))

(declare-fun bs!32246 () Bool)

(assert (= bs!32246 d!130305))

(declare-fun m!1017893 () Bool)

(assert (=> bs!32246 m!1017893))

(declare-fun m!1017895 () Bool)

(assert (=> bs!32246 m!1017895))

(assert (=> b!1098297 d!130305))

(declare-fun d!130307 () Bool)

(declare-fun e!627025 () Bool)

(assert (=> d!130307 e!627025))

(declare-fun res!733156 () Bool)

(assert (=> d!130307 (=> (not res!733156) (not e!627025))))

(declare-fun lt!491423 () ListLongMap!15343)

(assert (=> d!130307 (= res!733156 (contains!6357 lt!491423 (_1!8698 lt!491172)))))

(declare-fun lt!491420 () List!23965)

(assert (=> d!130307 (= lt!491423 (ListLongMap!15344 lt!491420))))

(declare-fun lt!491422 () Unit!35957)

(declare-fun lt!491421 () Unit!35957)

(assert (=> d!130307 (= lt!491422 lt!491421)))

(assert (=> d!130307 (= (getValueByKey!623 lt!491420 (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172)))))

(assert (=> d!130307 (= lt!491421 (lemmaContainsTupThenGetReturnValue!299 lt!491420 (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(assert (=> d!130307 (= lt!491420 (insertStrictlySorted!392 (toList!7687 (+!3399 lt!491173 lt!491168)) (_1!8698 lt!491172) (_2!8698 lt!491172)))))

(assert (=> d!130307 (= (+!3399 (+!3399 lt!491173 lt!491168) lt!491172) lt!491423)))

(declare-fun b!1098587 () Bool)

(declare-fun res!733155 () Bool)

(assert (=> b!1098587 (=> (not res!733155) (not e!627025))))

(assert (=> b!1098587 (= res!733155 (= (getValueByKey!623 (toList!7687 lt!491423) (_1!8698 lt!491172)) (Some!673 (_2!8698 lt!491172))))))

(declare-fun b!1098588 () Bool)

(assert (=> b!1098588 (= e!627025 (contains!6358 (toList!7687 lt!491423) lt!491172))))

(assert (= (and d!130307 res!733156) b!1098587))

(assert (= (and b!1098587 res!733155) b!1098588))

(declare-fun m!1017897 () Bool)

(assert (=> d!130307 m!1017897))

(declare-fun m!1017899 () Bool)

(assert (=> d!130307 m!1017899))

(declare-fun m!1017901 () Bool)

(assert (=> d!130307 m!1017901))

(declare-fun m!1017903 () Bool)

(assert (=> d!130307 m!1017903))

(declare-fun m!1017905 () Bool)

(assert (=> b!1098587 m!1017905))

(declare-fun m!1017907 () Bool)

(assert (=> b!1098588 m!1017907))

(assert (=> b!1098297 d!130307))

(declare-fun d!130309 () Bool)

(declare-fun e!627026 () Bool)

(assert (=> d!130309 e!627026))

(declare-fun res!733158 () Bool)

(assert (=> d!130309 (=> (not res!733158) (not e!627026))))

(declare-fun lt!491427 () ListLongMap!15343)

(assert (=> d!130309 (= res!733158 (contains!6357 lt!491427 (_1!8698 lt!491168)))))

(declare-fun lt!491424 () List!23965)

(assert (=> d!130309 (= lt!491427 (ListLongMap!15344 lt!491424))))

(declare-fun lt!491426 () Unit!35957)

(declare-fun lt!491425 () Unit!35957)

(assert (=> d!130309 (= lt!491426 lt!491425)))

(assert (=> d!130309 (= (getValueByKey!623 lt!491424 (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168)))))

(assert (=> d!130309 (= lt!491425 (lemmaContainsTupThenGetReturnValue!299 lt!491424 (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130309 (= lt!491424 (insertStrictlySorted!392 (toList!7687 lt!491173) (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130309 (= (+!3399 lt!491173 lt!491168) lt!491427)))

(declare-fun b!1098589 () Bool)

(declare-fun res!733157 () Bool)

(assert (=> b!1098589 (=> (not res!733157) (not e!627026))))

(assert (=> b!1098589 (= res!733157 (= (getValueByKey!623 (toList!7687 lt!491427) (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168))))))

(declare-fun b!1098590 () Bool)

(assert (=> b!1098590 (= e!627026 (contains!6358 (toList!7687 lt!491427) lt!491168))))

(assert (= (and d!130309 res!733158) b!1098589))

(assert (= (and b!1098589 res!733157) b!1098590))

(declare-fun m!1017909 () Bool)

(assert (=> d!130309 m!1017909))

(declare-fun m!1017911 () Bool)

(assert (=> d!130309 m!1017911))

(declare-fun m!1017913 () Bool)

(assert (=> d!130309 m!1017913))

(declare-fun m!1017915 () Bool)

(assert (=> d!130309 m!1017915))

(declare-fun m!1017917 () Bool)

(assert (=> b!1098589 m!1017917))

(declare-fun m!1017919 () Bool)

(assert (=> b!1098590 m!1017919))

(assert (=> b!1098297 d!130309))

(declare-fun d!130311 () Bool)

(declare-fun e!627027 () Bool)

(assert (=> d!130311 e!627027))

(declare-fun res!733160 () Bool)

(assert (=> d!130311 (=> (not res!733160) (not e!627027))))

(declare-fun lt!491431 () ListLongMap!15343)

(assert (=> d!130311 (= res!733160 (contains!6357 lt!491431 (_1!8698 lt!491168)))))

(declare-fun lt!491428 () List!23965)

(assert (=> d!130311 (= lt!491431 (ListLongMap!15344 lt!491428))))

(declare-fun lt!491430 () Unit!35957)

(declare-fun lt!491429 () Unit!35957)

(assert (=> d!130311 (= lt!491430 lt!491429)))

(assert (=> d!130311 (= (getValueByKey!623 lt!491428 (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168)))))

(assert (=> d!130311 (= lt!491429 (lemmaContainsTupThenGetReturnValue!299 lt!491428 (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130311 (= lt!491428 (insertStrictlySorted!392 (toList!7687 lt!491174) (_1!8698 lt!491168) (_2!8698 lt!491168)))))

(assert (=> d!130311 (= (+!3399 lt!491174 lt!491168) lt!491431)))

(declare-fun b!1098591 () Bool)

(declare-fun res!733159 () Bool)

(assert (=> b!1098591 (=> (not res!733159) (not e!627027))))

(assert (=> b!1098591 (= res!733159 (= (getValueByKey!623 (toList!7687 lt!491431) (_1!8698 lt!491168)) (Some!673 (_2!8698 lt!491168))))))

(declare-fun b!1098592 () Bool)

(assert (=> b!1098592 (= e!627027 (contains!6358 (toList!7687 lt!491431) lt!491168))))

(assert (= (and d!130311 res!733160) b!1098591))

(assert (= (and b!1098591 res!733159) b!1098592))

(declare-fun m!1017921 () Bool)

(assert (=> d!130311 m!1017921))

(declare-fun m!1017923 () Bool)

(assert (=> d!130311 m!1017923))

(declare-fun m!1017925 () Bool)

(assert (=> d!130311 m!1017925))

(declare-fun m!1017927 () Bool)

(assert (=> d!130311 m!1017927))

(declare-fun m!1017929 () Bool)

(assert (=> b!1098591 m!1017929))

(declare-fun m!1017931 () Bool)

(assert (=> b!1098592 m!1017931))

(assert (=> b!1098297 d!130311))

(declare-fun b!1098600 () Bool)

(declare-fun e!627033 () Bool)

(assert (=> b!1098600 (= e!627033 tp_is_empty!27139)))

(declare-fun mapNonEmpty!42487 () Bool)

(declare-fun mapRes!42487 () Bool)

(declare-fun tp!81218 () Bool)

(declare-fun e!627032 () Bool)

(assert (=> mapNonEmpty!42487 (= mapRes!42487 (and tp!81218 e!627032))))

(declare-fun mapKey!42487 () (_ BitVec 32))

(declare-fun mapRest!42487 () (Array (_ BitVec 32) ValueCell!12860))

(declare-fun mapValue!42487 () ValueCell!12860)

(assert (=> mapNonEmpty!42487 (= mapRest!42478 (store mapRest!42487 mapKey!42487 mapValue!42487))))

(declare-fun condMapEmpty!42487 () Bool)

(declare-fun mapDefault!42487 () ValueCell!12860)

(assert (=> mapNonEmpty!42478 (= condMapEmpty!42487 (= mapRest!42478 ((as const (Array (_ BitVec 32) ValueCell!12860)) mapDefault!42487)))))

(assert (=> mapNonEmpty!42478 (= tp!81202 (and e!627033 mapRes!42487))))

(declare-fun b!1098599 () Bool)

(assert (=> b!1098599 (= e!627032 tp_is_empty!27139)))

(declare-fun mapIsEmpty!42487 () Bool)

(assert (=> mapIsEmpty!42487 mapRes!42487))

(assert (= (and mapNonEmpty!42478 condMapEmpty!42487) mapIsEmpty!42487))

(assert (= (and mapNonEmpty!42478 (not condMapEmpty!42487)) mapNonEmpty!42487))

(assert (= (and mapNonEmpty!42487 ((_ is ValueCellFull!12860) mapValue!42487)) b!1098599))

(assert (= (and mapNonEmpty!42478 ((_ is ValueCellFull!12860) mapDefault!42487)) b!1098600))

(declare-fun m!1017933 () Bool)

(assert (=> mapNonEmpty!42487 m!1017933))

(declare-fun b_lambda!17837 () Bool)

(assert (= b_lambda!17833 (or (and start!96582 b_free!23089) b_lambda!17837)))

(declare-fun b_lambda!17839 () Bool)

(assert (= b_lambda!17835 (or (and start!96582 b_free!23089) b_lambda!17839)))

(declare-fun b_lambda!17841 () Bool)

(assert (= b_lambda!17829 (or (and start!96582 b_free!23089) b_lambda!17841)))

(declare-fun b_lambda!17843 () Bool)

(assert (= b_lambda!17825 (or (and start!96582 b_free!23089) b_lambda!17843)))

(declare-fun b_lambda!17845 () Bool)

(assert (= b_lambda!17827 (or (and start!96582 b_free!23089) b_lambda!17845)))

(declare-fun b_lambda!17847 () Bool)

(assert (= b_lambda!17831 (or (and start!96582 b_free!23089) b_lambda!17847)))

(declare-fun b_lambda!17849 () Bool)

(assert (= b_lambda!17823 (or (and start!96582 b_free!23089) b_lambda!17849)))

(check-sat (not bm!45912) (not bm!45879) (not b_lambda!17843) (not b!1098477) (not d!130275) (not b_next!23089) (not b!1098587) (not d!130281) (not b!1098564) (not d!130297) (not b!1098543) (not b!1098404) (not b!1098479) (not b!1098584) (not b!1098581) (not b!1098586) (not bm!45902) (not b!1098522) (not bm!45916) (not bm!45917) (not bm!45900) (not b!1098469) (not b_lambda!17845) (not b!1098537) (not b!1098516) (not bm!45921) (not d!130303) (not b!1098582) (not b!1098520) (not b!1098534) (not b_lambda!17849) (not b!1098583) (not b!1098540) (not b!1098568) (not b_lambda!17839) (not bm!45913) (not b_lambda!17841) (not d!130299) (not bm!45899) (not bm!45882) (not b!1098569) (not b!1098576) (not d!130307) (not b!1098470) (not bm!45914) (not b!1098544) (not b!1098523) (not bm!45911) (not b!1098405) (not b!1098548) (not bm!45922) (not d!130273) (not d!130311) (not b_lambda!17821) (not b_lambda!17837) (not b!1098573) (not b!1098591) (not d!130283) (not bm!45919) (not b!1098481) (not mapNonEmpty!42487) (not b!1098588) (not b!1098417) (not d!130279) (not bm!45906) (not b!1098589) (not b!1098555) (not b!1098518) (not b!1098514) (not b!1098420) (not b_lambda!17847) (not b!1098558) (not b!1098557) (not b!1098547) (not d!130301) (not d!130285) (not d!130305) (not b!1098590) (not b!1098473) (not b!1098541) (not b!1098486) (not b!1098572) b_and!36881 (not b!1098480) (not b!1098539) (not b!1098559) (not d!130277) (not b!1098519) (not d!130309) (not b!1098551) (not b!1098517) tp_is_empty!27139 (not b!1098408) (not b!1098592) (not b!1098426) (not bm!45897) (not b!1098538) (not b!1098585) (not b!1098535))
(check-sat b_and!36881 (not b_next!23089))
