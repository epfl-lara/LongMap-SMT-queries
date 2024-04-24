; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97034 () Bool)

(assert start!97034)

(declare-fun b_free!23167 () Bool)

(declare-fun b_next!23167 () Bool)

(assert (=> start!97034 (= b_free!23167 (not b_next!23167))))

(declare-fun tp!81452 () Bool)

(declare-fun b_and!37119 () Bool)

(assert (=> start!97034 (= tp!81452 b_and!37119)))

(declare-fun b!1102460 () Bool)

(declare-fun res!735289 () Bool)

(declare-fun e!629345 () Bool)

(assert (=> b!1102460 (=> (not res!735289) (not e!629345))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102460 (= res!735289 (validKeyInArray!0 k0!904))))

(declare-fun res!735299 () Bool)

(assert (=> start!97034 (=> (not res!735299) (not e!629345))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97034 (= res!735299 (validMask!0 mask!1414))))

(assert (=> start!97034 e!629345))

(assert (=> start!97034 tp!81452))

(assert (=> start!97034 true))

(declare-fun tp_is_empty!27217 () Bool)

(assert (=> start!97034 tp_is_empty!27217))

(declare-datatypes ((array!71389 0))(
  ( (array!71390 (arr!34352 (Array (_ BitVec 32) (_ BitVec 64))) (size!34889 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71389)

(declare-fun array_inv!26484 (array!71389) Bool)

(assert (=> start!97034 (array_inv!26484 _keys!1070)))

(declare-datatypes ((V!41417 0))(
  ( (V!41418 (val!13665 Int)) )
))
(declare-datatypes ((ValueCell!12899 0))(
  ( (ValueCellFull!12899 (v!16290 V!41417)) (EmptyCell!12899) )
))
(declare-datatypes ((array!71391 0))(
  ( (array!71392 (arr!34353 (Array (_ BitVec 32) ValueCell!12899)) (size!34890 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71391)

(declare-fun e!629347 () Bool)

(declare-fun array_inv!26485 (array!71391) Bool)

(assert (=> start!97034 (and (array_inv!26485 _values!874) e!629347)))

(declare-datatypes ((tuple2!17392 0))(
  ( (tuple2!17393 (_1!8707 (_ BitVec 64)) (_2!8707 V!41417)) )
))
(declare-datatypes ((List!24011 0))(
  ( (Nil!24008) (Cons!24007 (h!25225 tuple2!17392) (t!34216 List!24011)) )
))
(declare-datatypes ((ListLongMap!15369 0))(
  ( (ListLongMap!15370 (toList!7700 List!24011)) )
))
(declare-fun lt!494112 () ListLongMap!15369)

(declare-fun lt!494107 () ListLongMap!15369)

(declare-fun e!629349 () Bool)

(declare-fun lt!494115 () tuple2!17392)

(declare-fun b!1102461 () Bool)

(declare-fun +!3428 (ListLongMap!15369 tuple2!17392) ListLongMap!15369)

(assert (=> b!1102461 (= e!629349 (= lt!494107 (+!3428 lt!494112 lt!494115)))))

(declare-fun e!629350 () Bool)

(assert (=> b!1102461 e!629350))

(declare-fun res!735294 () Bool)

(assert (=> b!1102461 (=> (not res!735294) (not e!629350))))

(declare-fun lt!494116 () ListLongMap!15369)

(declare-fun lt!494111 () ListLongMap!15369)

(assert (=> b!1102461 (= res!735294 (= lt!494111 (+!3428 lt!494116 lt!494115)))))

(declare-fun minValue!831 () V!41417)

(assert (=> b!1102461 (= lt!494115 (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1102462 () Bool)

(declare-fun e!629352 () Bool)

(declare-fun mapRes!42610 () Bool)

(assert (=> b!1102462 (= e!629347 (and e!629352 mapRes!42610))))

(declare-fun condMapEmpty!42610 () Bool)

(declare-fun mapDefault!42610 () ValueCell!12899)

(assert (=> b!1102462 (= condMapEmpty!42610 (= (arr!34353 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12899)) mapDefault!42610)))))

(declare-fun b!1102463 () Bool)

(assert (=> b!1102463 (= e!629352 tp_is_empty!27217)))

(declare-fun b!1102464 () Bool)

(declare-fun res!735298 () Bool)

(declare-fun e!629351 () Bool)

(assert (=> b!1102464 (=> (not res!735298) (not e!629351))))

(declare-fun lt!494110 () array!71389)

(declare-datatypes ((List!24012 0))(
  ( (Nil!24009) (Cons!24008 (h!25226 (_ BitVec 64)) (t!34217 List!24012)) )
))
(declare-fun arrayNoDuplicates!0 (array!71389 (_ BitVec 32) List!24012) Bool)

(assert (=> b!1102464 (= res!735298 (arrayNoDuplicates!0 lt!494110 #b00000000000000000000000000000000 Nil!24009))))

(declare-fun b!1102465 () Bool)

(declare-fun res!735295 () Bool)

(assert (=> b!1102465 (=> (not res!735295) (not e!629345))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102465 (= res!735295 (= (select (arr!34352 _keys!1070) i!650) k0!904))))

(declare-fun b!1102466 () Bool)

(declare-fun res!735291 () Bool)

(assert (=> b!1102466 (=> (not res!735291) (not e!629345))))

(assert (=> b!1102466 (= res!735291 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24009))))

(declare-fun mapNonEmpty!42610 () Bool)

(declare-fun tp!81451 () Bool)

(declare-fun e!629346 () Bool)

(assert (=> mapNonEmpty!42610 (= mapRes!42610 (and tp!81451 e!629346))))

(declare-fun mapValue!42610 () ValueCell!12899)

(declare-fun mapKey!42610 () (_ BitVec 32))

(declare-fun mapRest!42610 () (Array (_ BitVec 32) ValueCell!12899))

(assert (=> mapNonEmpty!42610 (= (arr!34353 _values!874) (store mapRest!42610 mapKey!42610 mapValue!42610))))

(declare-fun b!1102467 () Bool)

(assert (=> b!1102467 (= e!629345 e!629351)))

(declare-fun res!735290 () Bool)

(assert (=> b!1102467 (=> (not res!735290) (not e!629351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71389 (_ BitVec 32)) Bool)

(assert (=> b!1102467 (= res!735290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494110 mask!1414))))

(assert (=> b!1102467 (= lt!494110 (array!71390 (store (arr!34352 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34889 _keys!1070)))))

(declare-fun b!1102468 () Bool)

(declare-fun res!735293 () Bool)

(assert (=> b!1102468 (=> (not res!735293) (not e!629345))))

(assert (=> b!1102468 (= res!735293 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34889 _keys!1070))))))

(declare-fun b!1102469 () Bool)

(declare-fun res!735292 () Bool)

(assert (=> b!1102469 (=> (not res!735292) (not e!629345))))

(assert (=> b!1102469 (= res!735292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42610 () Bool)

(assert (=> mapIsEmpty!42610 mapRes!42610))

(declare-fun b!1102470 () Bool)

(declare-fun res!735296 () Bool)

(assert (=> b!1102470 (=> (not res!735296) (not e!629345))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102470 (= res!735296 (and (= (size!34890 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34889 _keys!1070) (size!34890 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun lt!494108 () ListLongMap!15369)

(declare-fun b!1102471 () Bool)

(assert (=> b!1102471 (= e!629350 (= lt!494111 (+!3428 lt!494108 lt!494115)))))

(declare-fun b!1102472 () Bool)

(assert (=> b!1102472 (= e!629351 (not e!629349))))

(declare-fun res!735297 () Bool)

(assert (=> b!1102472 (=> res!735297 e!629349)))

(assert (=> b!1102472 (= res!735297 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41417)

(declare-fun getCurrentListMap!4403 (array!71389 array!71391 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) Int) ListLongMap!15369)

(assert (=> b!1102472 (= lt!494107 (getCurrentListMap!4403 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494109 () array!71391)

(assert (=> b!1102472 (= lt!494111 (getCurrentListMap!4403 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1102472 (and (= lt!494116 lt!494108) (= lt!494108 lt!494116))))

(declare-fun -!967 (ListLongMap!15369 (_ BitVec 64)) ListLongMap!15369)

(assert (=> b!1102472 (= lt!494108 (-!967 lt!494112 k0!904))))

(declare-datatypes ((Unit!36189 0))(
  ( (Unit!36190) )
))
(declare-fun lt!494114 () Unit!36189)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 (array!71389 array!71391 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36189)

(assert (=> b!1102472 (= lt!494114 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4244 (array!71389 array!71391 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) Int) ListLongMap!15369)

(assert (=> b!1102472 (= lt!494116 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2362 (Int (_ BitVec 64)) V!41417)

(assert (=> b!1102472 (= lt!494109 (array!71392 (store (arr!34353 _values!874) i!650 (ValueCellFull!12899 (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34890 _values!874)))))

(assert (=> b!1102472 (= lt!494112 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102472 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494113 () Unit!36189)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71389 (_ BitVec 64) (_ BitVec 32)) Unit!36189)

(assert (=> b!1102472 (= lt!494113 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102473 () Bool)

(assert (=> b!1102473 (= e!629346 tp_is_empty!27217)))

(assert (= (and start!97034 res!735299) b!1102470))

(assert (= (and b!1102470 res!735296) b!1102469))

(assert (= (and b!1102469 res!735292) b!1102466))

(assert (= (and b!1102466 res!735291) b!1102468))

(assert (= (and b!1102468 res!735293) b!1102460))

(assert (= (and b!1102460 res!735289) b!1102465))

(assert (= (and b!1102465 res!735295) b!1102467))

(assert (= (and b!1102467 res!735290) b!1102464))

(assert (= (and b!1102464 res!735298) b!1102472))

(assert (= (and b!1102472 (not res!735297)) b!1102461))

(assert (= (and b!1102461 res!735294) b!1102471))

(assert (= (and b!1102462 condMapEmpty!42610) mapIsEmpty!42610))

(assert (= (and b!1102462 (not condMapEmpty!42610)) mapNonEmpty!42610))

(get-info :version)

(assert (= (and mapNonEmpty!42610 ((_ is ValueCellFull!12899) mapValue!42610)) b!1102473))

(assert (= (and b!1102462 ((_ is ValueCellFull!12899) mapDefault!42610)) b!1102463))

(assert (= start!97034 b!1102462))

(declare-fun b_lambda!18075 () Bool)

(assert (=> (not b_lambda!18075) (not b!1102472)))

(declare-fun t!34215 () Bool)

(declare-fun tb!8025 () Bool)

(assert (=> (and start!97034 (= defaultEntry!882 defaultEntry!882) t!34215) tb!8025))

(declare-fun result!16597 () Bool)

(assert (=> tb!8025 (= result!16597 tp_is_empty!27217)))

(assert (=> b!1102472 t!34215))

(declare-fun b_and!37121 () Bool)

(assert (= b_and!37119 (and (=> t!34215 result!16597) b_and!37121)))

(declare-fun m!1022953 () Bool)

(assert (=> b!1102461 m!1022953))

(declare-fun m!1022955 () Bool)

(assert (=> b!1102461 m!1022955))

(declare-fun m!1022957 () Bool)

(assert (=> b!1102466 m!1022957))

(declare-fun m!1022959 () Bool)

(assert (=> b!1102467 m!1022959))

(declare-fun m!1022961 () Bool)

(assert (=> b!1102467 m!1022961))

(declare-fun m!1022963 () Bool)

(assert (=> b!1102472 m!1022963))

(declare-fun m!1022965 () Bool)

(assert (=> b!1102472 m!1022965))

(declare-fun m!1022967 () Bool)

(assert (=> b!1102472 m!1022967))

(declare-fun m!1022969 () Bool)

(assert (=> b!1102472 m!1022969))

(declare-fun m!1022971 () Bool)

(assert (=> b!1102472 m!1022971))

(declare-fun m!1022973 () Bool)

(assert (=> b!1102472 m!1022973))

(declare-fun m!1022975 () Bool)

(assert (=> b!1102472 m!1022975))

(declare-fun m!1022977 () Bool)

(assert (=> b!1102472 m!1022977))

(declare-fun m!1022979 () Bool)

(assert (=> b!1102472 m!1022979))

(declare-fun m!1022981 () Bool)

(assert (=> b!1102472 m!1022981))

(declare-fun m!1022983 () Bool)

(assert (=> b!1102471 m!1022983))

(declare-fun m!1022985 () Bool)

(assert (=> start!97034 m!1022985))

(declare-fun m!1022987 () Bool)

(assert (=> start!97034 m!1022987))

(declare-fun m!1022989 () Bool)

(assert (=> start!97034 m!1022989))

(declare-fun m!1022991 () Bool)

(assert (=> b!1102465 m!1022991))

(declare-fun m!1022993 () Bool)

(assert (=> b!1102460 m!1022993))

(declare-fun m!1022995 () Bool)

(assert (=> b!1102464 m!1022995))

(declare-fun m!1022997 () Bool)

(assert (=> b!1102469 m!1022997))

(declare-fun m!1022999 () Bool)

(assert (=> mapNonEmpty!42610 m!1022999))

(check-sat (not b!1102469) (not b!1102466) (not b!1102467) (not b_lambda!18075) (not b!1102472) (not b_next!23167) (not b!1102471) (not b!1102464) b_and!37121 (not mapNonEmpty!42610) tp_is_empty!27217 (not b!1102461) (not b!1102460) (not start!97034))
(check-sat b_and!37121 (not b_next!23167))
(get-model)

(declare-fun b_lambda!18081 () Bool)

(assert (= b_lambda!18075 (or (and start!97034 b_free!23167) b_lambda!18081)))

(check-sat (not b!1102469) (not b!1102466) (not b!1102467) (not b_lambda!18081) (not b!1102472) (not b_next!23167) (not b!1102471) (not b!1102464) b_and!37121 (not mapNonEmpty!42610) tp_is_empty!27217 (not b!1102461) (not b!1102460) (not start!97034))
(check-sat b_and!37121 (not b_next!23167))
(get-model)

(declare-fun bm!46199 () Bool)

(declare-fun call!46202 () Bool)

(declare-fun c!109179 () Bool)

(assert (=> bm!46199 (= call!46202 (arrayNoDuplicates!0 lt!494110 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109179 (Cons!24008 (select (arr!34352 lt!494110) #b00000000000000000000000000000000) Nil!24009) Nil!24009)))))

(declare-fun b!1102574 () Bool)

(declare-fun e!629411 () Bool)

(assert (=> b!1102574 (= e!629411 call!46202)))

(declare-fun b!1102575 () Bool)

(declare-fun e!629409 () Bool)

(declare-fun contains!6425 (List!24012 (_ BitVec 64)) Bool)

(assert (=> b!1102575 (= e!629409 (contains!6425 Nil!24009 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(declare-fun b!1102576 () Bool)

(declare-fun e!629412 () Bool)

(assert (=> b!1102576 (= e!629412 e!629411)))

(assert (=> b!1102576 (= c!109179 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(declare-fun d!131101 () Bool)

(declare-fun res!735372 () Bool)

(declare-fun e!629410 () Bool)

(assert (=> d!131101 (=> res!735372 e!629410)))

(assert (=> d!131101 (= res!735372 (bvsge #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (=> d!131101 (= (arrayNoDuplicates!0 lt!494110 #b00000000000000000000000000000000 Nil!24009) e!629410)))

(declare-fun b!1102577 () Bool)

(assert (=> b!1102577 (= e!629411 call!46202)))

(declare-fun b!1102578 () Bool)

(assert (=> b!1102578 (= e!629410 e!629412)))

(declare-fun res!735374 () Bool)

(assert (=> b!1102578 (=> (not res!735374) (not e!629412))))

(assert (=> b!1102578 (= res!735374 (not e!629409))))

(declare-fun res!735373 () Bool)

(assert (=> b!1102578 (=> (not res!735373) (not e!629409))))

(assert (=> b!1102578 (= res!735373 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(assert (= (and d!131101 (not res!735372)) b!1102578))

(assert (= (and b!1102578 res!735373) b!1102575))

(assert (= (and b!1102578 res!735374) b!1102576))

(assert (= (and b!1102576 c!109179) b!1102577))

(assert (= (and b!1102576 (not c!109179)) b!1102574))

(assert (= (or b!1102577 b!1102574) bm!46199))

(declare-fun m!1023097 () Bool)

(assert (=> bm!46199 m!1023097))

(declare-fun m!1023099 () Bool)

(assert (=> bm!46199 m!1023099))

(assert (=> b!1102575 m!1023097))

(assert (=> b!1102575 m!1023097))

(declare-fun m!1023101 () Bool)

(assert (=> b!1102575 m!1023101))

(assert (=> b!1102576 m!1023097))

(assert (=> b!1102576 m!1023097))

(declare-fun m!1023103 () Bool)

(assert (=> b!1102576 m!1023103))

(assert (=> b!1102578 m!1023097))

(assert (=> b!1102578 m!1023097))

(assert (=> b!1102578 m!1023103))

(assert (=> b!1102464 d!131101))

(declare-fun b!1102587 () Bool)

(declare-fun e!629421 () Bool)

(declare-fun e!629419 () Bool)

(assert (=> b!1102587 (= e!629421 e!629419)))

(declare-fun c!109182 () Bool)

(assert (=> b!1102587 (= c!109182 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102588 () Bool)

(declare-fun e!629420 () Bool)

(declare-fun call!46205 () Bool)

(assert (=> b!1102588 (= e!629420 call!46205)))

(declare-fun b!1102589 () Bool)

(assert (=> b!1102589 (= e!629419 e!629420)))

(declare-fun lt!494184 () (_ BitVec 64))

(assert (=> b!1102589 (= lt!494184 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494183 () Unit!36189)

(assert (=> b!1102589 (= lt!494183 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494184 #b00000000000000000000000000000000))))

(assert (=> b!1102589 (arrayContainsKey!0 _keys!1070 lt!494184 #b00000000000000000000000000000000)))

(declare-fun lt!494185 () Unit!36189)

(assert (=> b!1102589 (= lt!494185 lt!494183)))

(declare-fun res!735379 () Bool)

(declare-datatypes ((SeekEntryResult!9870 0))(
  ( (MissingZero!9870 (index!41851 (_ BitVec 32))) (Found!9870 (index!41852 (_ BitVec 32))) (Intermediate!9870 (undefined!10682 Bool) (index!41853 (_ BitVec 32)) (x!99022 (_ BitVec 32))) (Undefined!9870) (MissingVacant!9870 (index!41854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71389 (_ BitVec 32)) SeekEntryResult!9870)

(assert (=> b!1102589 (= res!735379 (= (seekEntryOrOpen!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9870 #b00000000000000000000000000000000)))))

(assert (=> b!1102589 (=> (not res!735379) (not e!629420))))

(declare-fun b!1102590 () Bool)

(assert (=> b!1102590 (= e!629419 call!46205)))

(declare-fun bm!46202 () Bool)

(assert (=> bm!46202 (= call!46205 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!131103 () Bool)

(declare-fun res!735380 () Bool)

(assert (=> d!131103 (=> res!735380 e!629421)))

(assert (=> d!131103 (= res!735380 (bvsge #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> d!131103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629421)))

(assert (= (and d!131103 (not res!735380)) b!1102587))

(assert (= (and b!1102587 c!109182) b!1102589))

(assert (= (and b!1102587 (not c!109182)) b!1102590))

(assert (= (and b!1102589 res!735379) b!1102588))

(assert (= (or b!1102588 b!1102590) bm!46202))

(declare-fun m!1023105 () Bool)

(assert (=> b!1102587 m!1023105))

(assert (=> b!1102587 m!1023105))

(declare-fun m!1023107 () Bool)

(assert (=> b!1102587 m!1023107))

(assert (=> b!1102589 m!1023105))

(declare-fun m!1023109 () Bool)

(assert (=> b!1102589 m!1023109))

(declare-fun m!1023111 () Bool)

(assert (=> b!1102589 m!1023111))

(assert (=> b!1102589 m!1023105))

(declare-fun m!1023113 () Bool)

(assert (=> b!1102589 m!1023113))

(declare-fun m!1023115 () Bool)

(assert (=> bm!46202 m!1023115))

(assert (=> b!1102469 d!131103))

(declare-fun b!1102591 () Bool)

(declare-fun e!629424 () Bool)

(declare-fun e!629422 () Bool)

(assert (=> b!1102591 (= e!629424 e!629422)))

(declare-fun c!109183 () Bool)

(assert (=> b!1102591 (= c!109183 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(declare-fun b!1102592 () Bool)

(declare-fun e!629423 () Bool)

(declare-fun call!46206 () Bool)

(assert (=> b!1102592 (= e!629423 call!46206)))

(declare-fun b!1102593 () Bool)

(assert (=> b!1102593 (= e!629422 e!629423)))

(declare-fun lt!494187 () (_ BitVec 64))

(assert (=> b!1102593 (= lt!494187 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(declare-fun lt!494186 () Unit!36189)

(assert (=> b!1102593 (= lt!494186 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494110 lt!494187 #b00000000000000000000000000000000))))

(assert (=> b!1102593 (arrayContainsKey!0 lt!494110 lt!494187 #b00000000000000000000000000000000)))

(declare-fun lt!494188 () Unit!36189)

(assert (=> b!1102593 (= lt!494188 lt!494186)))

(declare-fun res!735381 () Bool)

(assert (=> b!1102593 (= res!735381 (= (seekEntryOrOpen!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000) lt!494110 mask!1414) (Found!9870 #b00000000000000000000000000000000)))))

(assert (=> b!1102593 (=> (not res!735381) (not e!629423))))

(declare-fun b!1102594 () Bool)

(assert (=> b!1102594 (= e!629422 call!46206)))

(declare-fun bm!46203 () Bool)

(assert (=> bm!46203 (= call!46206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494110 mask!1414))))

(declare-fun d!131105 () Bool)

(declare-fun res!735382 () Bool)

(assert (=> d!131105 (=> res!735382 e!629424)))

(assert (=> d!131105 (= res!735382 (bvsge #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (=> d!131105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494110 mask!1414) e!629424)))

(assert (= (and d!131105 (not res!735382)) b!1102591))

(assert (= (and b!1102591 c!109183) b!1102593))

(assert (= (and b!1102591 (not c!109183)) b!1102594))

(assert (= (and b!1102593 res!735381) b!1102592))

(assert (= (or b!1102592 b!1102594) bm!46203))

(assert (=> b!1102591 m!1023097))

(assert (=> b!1102591 m!1023097))

(assert (=> b!1102591 m!1023103))

(assert (=> b!1102593 m!1023097))

(declare-fun m!1023117 () Bool)

(assert (=> b!1102593 m!1023117))

(declare-fun m!1023119 () Bool)

(assert (=> b!1102593 m!1023119))

(assert (=> b!1102593 m!1023097))

(declare-fun m!1023121 () Bool)

(assert (=> b!1102593 m!1023121))

(declare-fun m!1023123 () Bool)

(assert (=> bm!46203 m!1023123))

(assert (=> b!1102467 d!131105))

(declare-fun d!131107 () Bool)

(assert (=> d!131107 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!97034 d!131107))

(declare-fun d!131109 () Bool)

(assert (=> d!131109 (= (array_inv!26484 _keys!1070) (bvsge (size!34889 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!97034 d!131109))

(declare-fun d!131111 () Bool)

(assert (=> d!131111 (= (array_inv!26485 _values!874) (bvsge (size!34890 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!97034 d!131111))

(declare-fun d!131113 () Bool)

(declare-fun res!735387 () Bool)

(declare-fun e!629429 () Bool)

(assert (=> d!131113 (=> res!735387 e!629429)))

(assert (=> d!131113 (= res!735387 (= (select (arr!34352 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131113 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629429)))

(declare-fun b!1102599 () Bool)

(declare-fun e!629430 () Bool)

(assert (=> b!1102599 (= e!629429 e!629430)))

(declare-fun res!735388 () Bool)

(assert (=> b!1102599 (=> (not res!735388) (not e!629430))))

(assert (=> b!1102599 (= res!735388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34889 _keys!1070)))))

(declare-fun b!1102600 () Bool)

(assert (=> b!1102600 (= e!629430 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131113 (not res!735387)) b!1102599))

(assert (= (and b!1102599 res!735388) b!1102600))

(assert (=> d!131113 m!1023105))

(declare-fun m!1023125 () Bool)

(assert (=> b!1102600 m!1023125))

(assert (=> b!1102472 d!131113))

(declare-fun bm!46218 () Bool)

(declare-fun call!46226 () ListLongMap!15369)

(declare-fun call!46222 () ListLongMap!15369)

(assert (=> bm!46218 (= call!46226 call!46222)))

(declare-fun bm!46219 () Bool)

(declare-fun call!46225 () Bool)

(declare-fun lt!494249 () ListLongMap!15369)

(declare-fun contains!6426 (ListLongMap!15369 (_ BitVec 64)) Bool)

(assert (=> bm!46219 (= call!46225 (contains!6426 lt!494249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102643 () Bool)

(declare-fun c!109196 () Bool)

(assert (=> b!1102643 (= c!109196 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629457 () ListLongMap!15369)

(declare-fun e!629467 () ListLongMap!15369)

(assert (=> b!1102643 (= e!629457 e!629467)))

(declare-fun b!1102644 () Bool)

(declare-fun e!629460 () Bool)

(declare-fun call!46221 () Bool)

(assert (=> b!1102644 (= e!629460 (not call!46221))))

(declare-fun b!1102645 () Bool)

(declare-fun e!629465 () ListLongMap!15369)

(declare-fun call!46224 () ListLongMap!15369)

(assert (=> b!1102645 (= e!629465 (+!3428 call!46224 (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102646 () Bool)

(declare-fun call!46227 () ListLongMap!15369)

(assert (=> b!1102646 (= e!629457 call!46227)))

(declare-fun e!629469 () Bool)

(declare-fun b!1102647 () Bool)

(declare-fun apply!960 (ListLongMap!15369 (_ BitVec 64)) V!41417)

(declare-fun get!17682 (ValueCell!12899 V!41417) V!41417)

(assert (=> b!1102647 (= e!629469 (= (apply!960 lt!494249 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)) (get!17682 (select (arr!34353 _values!874) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34890 _values!874)))))

(assert (=> b!1102647 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(declare-fun b!1102648 () Bool)

(declare-fun e!629464 () Bool)

(assert (=> b!1102648 (= e!629464 e!629460)))

(declare-fun c!109199 () Bool)

(assert (=> b!1102648 (= c!109199 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102649 () Bool)

(declare-fun call!46223 () ListLongMap!15369)

(assert (=> b!1102649 (= e!629467 call!46223)))

(declare-fun bm!46220 () Bool)

(assert (=> bm!46220 (= call!46221 (contains!6426 lt!494249 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46221 () Bool)

(assert (=> bm!46221 (= call!46223 call!46226)))

(declare-fun b!1102650 () Bool)

(declare-fun e!629468 () Bool)

(declare-fun e!629462 () Bool)

(assert (=> b!1102650 (= e!629468 e!629462)))

(declare-fun res!735413 () Bool)

(assert (=> b!1102650 (= res!735413 call!46225)))

(assert (=> b!1102650 (=> (not res!735413) (not e!629462))))

(declare-fun b!1102651 () Bool)

(declare-fun e!629459 () Bool)

(assert (=> b!1102651 (= e!629459 (= (apply!960 lt!494249 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102652 () Bool)

(declare-fun res!735410 () Bool)

(assert (=> b!1102652 (=> (not res!735410) (not e!629464))))

(declare-fun e!629466 () Bool)

(assert (=> b!1102652 (= res!735410 e!629466)))

(declare-fun res!735408 () Bool)

(assert (=> b!1102652 (=> res!735408 e!629466)))

(declare-fun e!629461 () Bool)

(assert (=> b!1102652 (= res!735408 (not e!629461))))

(declare-fun res!735407 () Bool)

(assert (=> b!1102652 (=> (not res!735407) (not e!629461))))

(assert (=> b!1102652 (= res!735407 (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(declare-fun b!1102653 () Bool)

(assert (=> b!1102653 (= e!629467 call!46227)))

(declare-fun b!1102654 () Bool)

(declare-fun e!629458 () Unit!36189)

(declare-fun Unit!36191 () Unit!36189)

(assert (=> b!1102654 (= e!629458 Unit!36191)))

(declare-fun bm!46222 () Bool)

(assert (=> bm!46222 (= call!46222 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102655 () Bool)

(assert (=> b!1102655 (= e!629462 (= (apply!960 lt!494249 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46223 () Bool)

(assert (=> bm!46223 (= call!46227 call!46224)))

(declare-fun b!1102656 () Bool)

(assert (=> b!1102656 (= e!629465 e!629457)))

(declare-fun c!109197 () Bool)

(assert (=> b!1102656 (= c!109197 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102657 () Bool)

(declare-fun lt!494251 () Unit!36189)

(assert (=> b!1102657 (= e!629458 lt!494251)))

(declare-fun lt!494234 () ListLongMap!15369)

(assert (=> b!1102657 (= lt!494234 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494253 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494242 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494242 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494240 () Unit!36189)

(declare-fun addStillContains!664 (ListLongMap!15369 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36189)

(assert (=> b!1102657 (= lt!494240 (addStillContains!664 lt!494234 lt!494253 zeroValue!831 lt!494242))))

(assert (=> b!1102657 (contains!6426 (+!3428 lt!494234 (tuple2!17393 lt!494253 zeroValue!831)) lt!494242)))

(declare-fun lt!494244 () Unit!36189)

(assert (=> b!1102657 (= lt!494244 lt!494240)))

(declare-fun lt!494235 () ListLongMap!15369)

(assert (=> b!1102657 (= lt!494235 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494248 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494248 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494245 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494245 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494237 () Unit!36189)

(declare-fun addApplyDifferent!520 (ListLongMap!15369 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36189)

(assert (=> b!1102657 (= lt!494237 (addApplyDifferent!520 lt!494235 lt!494248 minValue!831 lt!494245))))

(assert (=> b!1102657 (= (apply!960 (+!3428 lt!494235 (tuple2!17393 lt!494248 minValue!831)) lt!494245) (apply!960 lt!494235 lt!494245))))

(declare-fun lt!494239 () Unit!36189)

(assert (=> b!1102657 (= lt!494239 lt!494237)))

(declare-fun lt!494233 () ListLongMap!15369)

(assert (=> b!1102657 (= lt!494233 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494236 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494241 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494241 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494246 () Unit!36189)

(assert (=> b!1102657 (= lt!494246 (addApplyDifferent!520 lt!494233 lt!494236 zeroValue!831 lt!494241))))

(assert (=> b!1102657 (= (apply!960 (+!3428 lt!494233 (tuple2!17393 lt!494236 zeroValue!831)) lt!494241) (apply!960 lt!494233 lt!494241))))

(declare-fun lt!494247 () Unit!36189)

(assert (=> b!1102657 (= lt!494247 lt!494246)))

(declare-fun lt!494254 () ListLongMap!15369)

(assert (=> b!1102657 (= lt!494254 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494252 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494252 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494250 () (_ BitVec 64))

(assert (=> b!1102657 (= lt!494250 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102657 (= lt!494251 (addApplyDifferent!520 lt!494254 lt!494252 minValue!831 lt!494250))))

(assert (=> b!1102657 (= (apply!960 (+!3428 lt!494254 (tuple2!17393 lt!494252 minValue!831)) lt!494250) (apply!960 lt!494254 lt!494250))))

(declare-fun b!1102658 () Bool)

(assert (=> b!1102658 (= e!629468 (not call!46225))))

(declare-fun d!131115 () Bool)

(assert (=> d!131115 e!629464))

(declare-fun res!735415 () Bool)

(assert (=> d!131115 (=> (not res!735415) (not e!629464))))

(assert (=> d!131115 (= res!735415 (or (bvsge #b00000000000000000000000000000000 (size!34889 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))))

(declare-fun lt!494243 () ListLongMap!15369)

(assert (=> d!131115 (= lt!494249 lt!494243)))

(declare-fun lt!494238 () Unit!36189)

(assert (=> d!131115 (= lt!494238 e!629458)))

(declare-fun c!109201 () Bool)

(declare-fun e!629463 () Bool)

(assert (=> d!131115 (= c!109201 e!629463)))

(declare-fun res!735411 () Bool)

(assert (=> d!131115 (=> (not res!735411) (not e!629463))))

(assert (=> d!131115 (= res!735411 (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> d!131115 (= lt!494243 e!629465)))

(declare-fun c!109200 () Bool)

(assert (=> d!131115 (= c!109200 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131115 (validMask!0 mask!1414)))

(assert (=> d!131115 (= (getCurrentListMap!4403 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494249)))

(declare-fun b!1102659 () Bool)

(assert (=> b!1102659 (= e!629466 e!629469)))

(declare-fun res!735414 () Bool)

(assert (=> b!1102659 (=> (not res!735414) (not e!629469))))

(assert (=> b!1102659 (= res!735414 (contains!6426 lt!494249 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102659 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(declare-fun b!1102660 () Bool)

(assert (=> b!1102660 (= e!629460 e!629459)))

(declare-fun res!735412 () Bool)

(assert (=> b!1102660 (= res!735412 call!46221)))

(assert (=> b!1102660 (=> (not res!735412) (not e!629459))))

(declare-fun b!1102661 () Bool)

(assert (=> b!1102661 (= e!629461 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46224 () Bool)

(assert (=> bm!46224 (= call!46224 (+!3428 (ite c!109200 call!46222 (ite c!109197 call!46226 call!46223)) (ite (or c!109200 c!109197) (tuple2!17393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102662 () Bool)

(declare-fun res!735409 () Bool)

(assert (=> b!1102662 (=> (not res!735409) (not e!629464))))

(assert (=> b!1102662 (= res!735409 e!629468)))

(declare-fun c!109198 () Bool)

(assert (=> b!1102662 (= c!109198 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102663 () Bool)

(assert (=> b!1102663 (= e!629463 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131115 c!109200) b!1102645))

(assert (= (and d!131115 (not c!109200)) b!1102656))

(assert (= (and b!1102656 c!109197) b!1102646))

(assert (= (and b!1102656 (not c!109197)) b!1102643))

(assert (= (and b!1102643 c!109196) b!1102653))

(assert (= (and b!1102643 (not c!109196)) b!1102649))

(assert (= (or b!1102653 b!1102649) bm!46221))

(assert (= (or b!1102646 bm!46221) bm!46218))

(assert (= (or b!1102646 b!1102653) bm!46223))

(assert (= (or b!1102645 bm!46218) bm!46222))

(assert (= (or b!1102645 bm!46223) bm!46224))

(assert (= (and d!131115 res!735411) b!1102663))

(assert (= (and d!131115 c!109201) b!1102657))

(assert (= (and d!131115 (not c!109201)) b!1102654))

(assert (= (and d!131115 res!735415) b!1102652))

(assert (= (and b!1102652 res!735407) b!1102661))

(assert (= (and b!1102652 (not res!735408)) b!1102659))

(assert (= (and b!1102659 res!735414) b!1102647))

(assert (= (and b!1102652 res!735410) b!1102662))

(assert (= (and b!1102662 c!109198) b!1102650))

(assert (= (and b!1102662 (not c!109198)) b!1102658))

(assert (= (and b!1102650 res!735413) b!1102655))

(assert (= (or b!1102650 b!1102658) bm!46219))

(assert (= (and b!1102662 res!735409) b!1102648))

(assert (= (and b!1102648 c!109199) b!1102660))

(assert (= (and b!1102648 (not c!109199)) b!1102644))

(assert (= (and b!1102660 res!735412) b!1102651))

(assert (= (or b!1102660 b!1102644) bm!46220))

(declare-fun b_lambda!18083 () Bool)

(assert (=> (not b_lambda!18083) (not b!1102647)))

(assert (=> b!1102647 t!34215))

(declare-fun b_and!37131 () Bool)

(assert (= b_and!37121 (and (=> t!34215 result!16597) b_and!37131)))

(declare-fun m!1023127 () Bool)

(assert (=> b!1102657 m!1023127))

(declare-fun m!1023129 () Bool)

(assert (=> b!1102657 m!1023129))

(assert (=> b!1102657 m!1023105))

(declare-fun m!1023131 () Bool)

(assert (=> b!1102657 m!1023131))

(declare-fun m!1023133 () Bool)

(assert (=> b!1102657 m!1023133))

(declare-fun m!1023135 () Bool)

(assert (=> b!1102657 m!1023135))

(declare-fun m!1023137 () Bool)

(assert (=> b!1102657 m!1023137))

(declare-fun m!1023139 () Bool)

(assert (=> b!1102657 m!1023139))

(assert (=> b!1102657 m!1023131))

(assert (=> b!1102657 m!1023137))

(assert (=> b!1102657 m!1022973))

(declare-fun m!1023141 () Bool)

(assert (=> b!1102657 m!1023141))

(declare-fun m!1023143 () Bool)

(assert (=> b!1102657 m!1023143))

(assert (=> b!1102657 m!1023127))

(declare-fun m!1023145 () Bool)

(assert (=> b!1102657 m!1023145))

(declare-fun m!1023147 () Bool)

(assert (=> b!1102657 m!1023147))

(declare-fun m!1023149 () Bool)

(assert (=> b!1102657 m!1023149))

(declare-fun m!1023151 () Bool)

(assert (=> b!1102657 m!1023151))

(assert (=> b!1102657 m!1023145))

(declare-fun m!1023153 () Bool)

(assert (=> b!1102657 m!1023153))

(declare-fun m!1023155 () Bool)

(assert (=> b!1102657 m!1023155))

(declare-fun m!1023157 () Bool)

(assert (=> b!1102651 m!1023157))

(assert (=> bm!46222 m!1022973))

(declare-fun m!1023159 () Bool)

(assert (=> bm!46220 m!1023159))

(declare-fun m!1023161 () Bool)

(assert (=> b!1102647 m!1023161))

(assert (=> b!1102647 m!1022963))

(declare-fun m!1023163 () Bool)

(assert (=> b!1102647 m!1023163))

(assert (=> b!1102647 m!1023105))

(assert (=> b!1102647 m!1023161))

(assert (=> b!1102647 m!1023105))

(declare-fun m!1023165 () Bool)

(assert (=> b!1102647 m!1023165))

(assert (=> b!1102647 m!1022963))

(declare-fun m!1023167 () Bool)

(assert (=> b!1102655 m!1023167))

(assert (=> d!131115 m!1022985))

(assert (=> b!1102663 m!1023105))

(assert (=> b!1102663 m!1023105))

(assert (=> b!1102663 m!1023107))

(declare-fun m!1023169 () Bool)

(assert (=> bm!46219 m!1023169))

(declare-fun m!1023171 () Bool)

(assert (=> b!1102645 m!1023171))

(assert (=> b!1102659 m!1023105))

(assert (=> b!1102659 m!1023105))

(declare-fun m!1023173 () Bool)

(assert (=> b!1102659 m!1023173))

(declare-fun m!1023175 () Bool)

(assert (=> bm!46224 m!1023175))

(assert (=> b!1102661 m!1023105))

(assert (=> b!1102661 m!1023105))

(assert (=> b!1102661 m!1023107))

(assert (=> b!1102472 d!131115))

(declare-fun bm!46225 () Bool)

(declare-fun call!46233 () ListLongMap!15369)

(declare-fun call!46229 () ListLongMap!15369)

(assert (=> bm!46225 (= call!46233 call!46229)))

(declare-fun bm!46226 () Bool)

(declare-fun call!46232 () Bool)

(declare-fun lt!494271 () ListLongMap!15369)

(assert (=> bm!46226 (= call!46232 (contains!6426 lt!494271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102664 () Bool)

(declare-fun c!109202 () Bool)

(assert (=> b!1102664 (= c!109202 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629470 () ListLongMap!15369)

(declare-fun e!629480 () ListLongMap!15369)

(assert (=> b!1102664 (= e!629470 e!629480)))

(declare-fun b!1102665 () Bool)

(declare-fun e!629473 () Bool)

(declare-fun call!46228 () Bool)

(assert (=> b!1102665 (= e!629473 (not call!46228))))

(declare-fun b!1102666 () Bool)

(declare-fun e!629478 () ListLongMap!15369)

(declare-fun call!46231 () ListLongMap!15369)

(assert (=> b!1102666 (= e!629478 (+!3428 call!46231 (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102667 () Bool)

(declare-fun call!46234 () ListLongMap!15369)

(assert (=> b!1102667 (= e!629470 call!46234)))

(declare-fun b!1102668 () Bool)

(declare-fun e!629482 () Bool)

(assert (=> b!1102668 (= e!629482 (= (apply!960 lt!494271 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)) (get!17682 (select (arr!34353 lt!494109) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34890 lt!494109)))))

(assert (=> b!1102668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(declare-fun b!1102669 () Bool)

(declare-fun e!629477 () Bool)

(assert (=> b!1102669 (= e!629477 e!629473)))

(declare-fun c!109205 () Bool)

(assert (=> b!1102669 (= c!109205 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102670 () Bool)

(declare-fun call!46230 () ListLongMap!15369)

(assert (=> b!1102670 (= e!629480 call!46230)))

(declare-fun bm!46227 () Bool)

(assert (=> bm!46227 (= call!46228 (contains!6426 lt!494271 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!46228 () Bool)

(assert (=> bm!46228 (= call!46230 call!46233)))

(declare-fun b!1102671 () Bool)

(declare-fun e!629481 () Bool)

(declare-fun e!629475 () Bool)

(assert (=> b!1102671 (= e!629481 e!629475)))

(declare-fun res!735422 () Bool)

(assert (=> b!1102671 (= res!735422 call!46232)))

(assert (=> b!1102671 (=> (not res!735422) (not e!629475))))

(declare-fun b!1102672 () Bool)

(declare-fun e!629472 () Bool)

(assert (=> b!1102672 (= e!629472 (= (apply!960 lt!494271 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102673 () Bool)

(declare-fun res!735419 () Bool)

(assert (=> b!1102673 (=> (not res!735419) (not e!629477))))

(declare-fun e!629479 () Bool)

(assert (=> b!1102673 (= res!735419 e!629479)))

(declare-fun res!735417 () Bool)

(assert (=> b!1102673 (=> res!735417 e!629479)))

(declare-fun e!629474 () Bool)

(assert (=> b!1102673 (= res!735417 (not e!629474))))

(declare-fun res!735416 () Bool)

(assert (=> b!1102673 (=> (not res!735416) (not e!629474))))

(assert (=> b!1102673 (= res!735416 (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(declare-fun b!1102674 () Bool)

(assert (=> b!1102674 (= e!629480 call!46234)))

(declare-fun b!1102675 () Bool)

(declare-fun e!629471 () Unit!36189)

(declare-fun Unit!36192 () Unit!36189)

(assert (=> b!1102675 (= e!629471 Unit!36192)))

(declare-fun bm!46229 () Bool)

(assert (=> bm!46229 (= call!46229 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102676 () Bool)

(assert (=> b!1102676 (= e!629475 (= (apply!960 lt!494271 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46230 () Bool)

(assert (=> bm!46230 (= call!46234 call!46231)))

(declare-fun b!1102677 () Bool)

(assert (=> b!1102677 (= e!629478 e!629470)))

(declare-fun c!109203 () Bool)

(assert (=> b!1102677 (= c!109203 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102678 () Bool)

(declare-fun lt!494273 () Unit!36189)

(assert (=> b!1102678 (= e!629471 lt!494273)))

(declare-fun lt!494256 () ListLongMap!15369)

(assert (=> b!1102678 (= lt!494256 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494275 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494275 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494264 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494264 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(declare-fun lt!494262 () Unit!36189)

(assert (=> b!1102678 (= lt!494262 (addStillContains!664 lt!494256 lt!494275 zeroValue!831 lt!494264))))

(assert (=> b!1102678 (contains!6426 (+!3428 lt!494256 (tuple2!17393 lt!494275 zeroValue!831)) lt!494264)))

(declare-fun lt!494266 () Unit!36189)

(assert (=> b!1102678 (= lt!494266 lt!494262)))

(declare-fun lt!494257 () ListLongMap!15369)

(assert (=> b!1102678 (= lt!494257 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494270 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494270 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494267 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494267 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(declare-fun lt!494259 () Unit!36189)

(assert (=> b!1102678 (= lt!494259 (addApplyDifferent!520 lt!494257 lt!494270 minValue!831 lt!494267))))

(assert (=> b!1102678 (= (apply!960 (+!3428 lt!494257 (tuple2!17393 lt!494270 minValue!831)) lt!494267) (apply!960 lt!494257 lt!494267))))

(declare-fun lt!494261 () Unit!36189)

(assert (=> b!1102678 (= lt!494261 lt!494259)))

(declare-fun lt!494255 () ListLongMap!15369)

(assert (=> b!1102678 (= lt!494255 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494258 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494263 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494263 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(declare-fun lt!494268 () Unit!36189)

(assert (=> b!1102678 (= lt!494268 (addApplyDifferent!520 lt!494255 lt!494258 zeroValue!831 lt!494263))))

(assert (=> b!1102678 (= (apply!960 (+!3428 lt!494255 (tuple2!17393 lt!494258 zeroValue!831)) lt!494263) (apply!960 lt!494255 lt!494263))))

(declare-fun lt!494269 () Unit!36189)

(assert (=> b!1102678 (= lt!494269 lt!494268)))

(declare-fun lt!494276 () ListLongMap!15369)

(assert (=> b!1102678 (= lt!494276 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494274 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494274 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494272 () (_ BitVec 64))

(assert (=> b!1102678 (= lt!494272 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(assert (=> b!1102678 (= lt!494273 (addApplyDifferent!520 lt!494276 lt!494274 minValue!831 lt!494272))))

(assert (=> b!1102678 (= (apply!960 (+!3428 lt!494276 (tuple2!17393 lt!494274 minValue!831)) lt!494272) (apply!960 lt!494276 lt!494272))))

(declare-fun b!1102679 () Bool)

(assert (=> b!1102679 (= e!629481 (not call!46232))))

(declare-fun d!131117 () Bool)

(assert (=> d!131117 e!629477))

(declare-fun res!735424 () Bool)

(assert (=> d!131117 (=> (not res!735424) (not e!629477))))

(assert (=> d!131117 (= res!735424 (or (bvsge #b00000000000000000000000000000000 (size!34889 lt!494110)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))))

(declare-fun lt!494265 () ListLongMap!15369)

(assert (=> d!131117 (= lt!494271 lt!494265)))

(declare-fun lt!494260 () Unit!36189)

(assert (=> d!131117 (= lt!494260 e!629471)))

(declare-fun c!109207 () Bool)

(declare-fun e!629476 () Bool)

(assert (=> d!131117 (= c!109207 e!629476)))

(declare-fun res!735420 () Bool)

(assert (=> d!131117 (=> (not res!735420) (not e!629476))))

(assert (=> d!131117 (= res!735420 (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (=> d!131117 (= lt!494265 e!629478)))

(declare-fun c!109206 () Bool)

(assert (=> d!131117 (= c!109206 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131117 (validMask!0 mask!1414)))

(assert (=> d!131117 (= (getCurrentListMap!4403 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494271)))

(declare-fun b!1102680 () Bool)

(assert (=> b!1102680 (= e!629479 e!629482)))

(declare-fun res!735423 () Bool)

(assert (=> b!1102680 (=> (not res!735423) (not e!629482))))

(assert (=> b!1102680 (= res!735423 (contains!6426 lt!494271 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(assert (=> b!1102680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(declare-fun b!1102681 () Bool)

(assert (=> b!1102681 (= e!629473 e!629472)))

(declare-fun res!735421 () Bool)

(assert (=> b!1102681 (= res!735421 call!46228)))

(assert (=> b!1102681 (=> (not res!735421) (not e!629472))))

(declare-fun b!1102682 () Bool)

(assert (=> b!1102682 (= e!629474 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(declare-fun bm!46231 () Bool)

(assert (=> bm!46231 (= call!46231 (+!3428 (ite c!109206 call!46229 (ite c!109203 call!46233 call!46230)) (ite (or c!109206 c!109203) (tuple2!17393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102683 () Bool)

(declare-fun res!735418 () Bool)

(assert (=> b!1102683 (=> (not res!735418) (not e!629477))))

(assert (=> b!1102683 (= res!735418 e!629481)))

(declare-fun c!109204 () Bool)

(assert (=> b!1102683 (= c!109204 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102684 () Bool)

(assert (=> b!1102684 (= e!629476 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(assert (= (and d!131117 c!109206) b!1102666))

(assert (= (and d!131117 (not c!109206)) b!1102677))

(assert (= (and b!1102677 c!109203) b!1102667))

(assert (= (and b!1102677 (not c!109203)) b!1102664))

(assert (= (and b!1102664 c!109202) b!1102674))

(assert (= (and b!1102664 (not c!109202)) b!1102670))

(assert (= (or b!1102674 b!1102670) bm!46228))

(assert (= (or b!1102667 bm!46228) bm!46225))

(assert (= (or b!1102667 b!1102674) bm!46230))

(assert (= (or b!1102666 bm!46225) bm!46229))

(assert (= (or b!1102666 bm!46230) bm!46231))

(assert (= (and d!131117 res!735420) b!1102684))

(assert (= (and d!131117 c!109207) b!1102678))

(assert (= (and d!131117 (not c!109207)) b!1102675))

(assert (= (and d!131117 res!735424) b!1102673))

(assert (= (and b!1102673 res!735416) b!1102682))

(assert (= (and b!1102673 (not res!735417)) b!1102680))

(assert (= (and b!1102680 res!735423) b!1102668))

(assert (= (and b!1102673 res!735419) b!1102683))

(assert (= (and b!1102683 c!109204) b!1102671))

(assert (= (and b!1102683 (not c!109204)) b!1102679))

(assert (= (and b!1102671 res!735422) b!1102676))

(assert (= (or b!1102671 b!1102679) bm!46226))

(assert (= (and b!1102683 res!735418) b!1102669))

(assert (= (and b!1102669 c!109205) b!1102681))

(assert (= (and b!1102669 (not c!109205)) b!1102665))

(assert (= (and b!1102681 res!735421) b!1102672))

(assert (= (or b!1102681 b!1102665) bm!46227))

(declare-fun b_lambda!18085 () Bool)

(assert (=> (not b_lambda!18085) (not b!1102668)))

(assert (=> b!1102668 t!34215))

(declare-fun b_and!37133 () Bool)

(assert (= b_and!37131 (and (=> t!34215 result!16597) b_and!37133)))

(declare-fun m!1023177 () Bool)

(assert (=> b!1102678 m!1023177))

(declare-fun m!1023179 () Bool)

(assert (=> b!1102678 m!1023179))

(assert (=> b!1102678 m!1023097))

(declare-fun m!1023181 () Bool)

(assert (=> b!1102678 m!1023181))

(declare-fun m!1023183 () Bool)

(assert (=> b!1102678 m!1023183))

(declare-fun m!1023185 () Bool)

(assert (=> b!1102678 m!1023185))

(declare-fun m!1023187 () Bool)

(assert (=> b!1102678 m!1023187))

(declare-fun m!1023189 () Bool)

(assert (=> b!1102678 m!1023189))

(assert (=> b!1102678 m!1023181))

(assert (=> b!1102678 m!1023187))

(assert (=> b!1102678 m!1022969))

(declare-fun m!1023191 () Bool)

(assert (=> b!1102678 m!1023191))

(declare-fun m!1023193 () Bool)

(assert (=> b!1102678 m!1023193))

(assert (=> b!1102678 m!1023177))

(declare-fun m!1023195 () Bool)

(assert (=> b!1102678 m!1023195))

(declare-fun m!1023197 () Bool)

(assert (=> b!1102678 m!1023197))

(declare-fun m!1023199 () Bool)

(assert (=> b!1102678 m!1023199))

(declare-fun m!1023201 () Bool)

(assert (=> b!1102678 m!1023201))

(assert (=> b!1102678 m!1023195))

(declare-fun m!1023203 () Bool)

(assert (=> b!1102678 m!1023203))

(declare-fun m!1023205 () Bool)

(assert (=> b!1102678 m!1023205))

(declare-fun m!1023207 () Bool)

(assert (=> b!1102672 m!1023207))

(assert (=> bm!46229 m!1022969))

(declare-fun m!1023209 () Bool)

(assert (=> bm!46227 m!1023209))

(declare-fun m!1023211 () Bool)

(assert (=> b!1102668 m!1023211))

(assert (=> b!1102668 m!1022963))

(declare-fun m!1023213 () Bool)

(assert (=> b!1102668 m!1023213))

(assert (=> b!1102668 m!1023097))

(assert (=> b!1102668 m!1023211))

(assert (=> b!1102668 m!1023097))

(declare-fun m!1023215 () Bool)

(assert (=> b!1102668 m!1023215))

(assert (=> b!1102668 m!1022963))

(declare-fun m!1023217 () Bool)

(assert (=> b!1102676 m!1023217))

(assert (=> d!131117 m!1022985))

(assert (=> b!1102684 m!1023097))

(assert (=> b!1102684 m!1023097))

(assert (=> b!1102684 m!1023103))

(declare-fun m!1023219 () Bool)

(assert (=> bm!46226 m!1023219))

(declare-fun m!1023221 () Bool)

(assert (=> b!1102666 m!1023221))

(assert (=> b!1102680 m!1023097))

(assert (=> b!1102680 m!1023097))

(declare-fun m!1023223 () Bool)

(assert (=> b!1102680 m!1023223))

(declare-fun m!1023225 () Bool)

(assert (=> bm!46231 m!1023225))

(assert (=> b!1102682 m!1023097))

(assert (=> b!1102682 m!1023097))

(assert (=> b!1102682 m!1023103))

(assert (=> b!1102472 d!131117))

(declare-fun bm!46236 () Bool)

(declare-fun call!46239 () ListLongMap!15369)

(assert (=> bm!46236 (= call!46239 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun bm!46237 () Bool)

(declare-fun call!46240 () ListLongMap!15369)

(assert (=> bm!46237 (= call!46240 (getCurrentListMapNoExtraKeys!4244 (array!71390 (store (arr!34352 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34889 _keys!1070)) (array!71392 (store (arr!34353 _values!874) i!650 (ValueCellFull!12899 (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34890 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun e!629488 () Bool)

(declare-fun b!1102692 () Bool)

(assert (=> b!1102692 (= e!629488 (= call!46240 (-!967 call!46239 k0!904)))))

(assert (=> b!1102692 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34890 _values!874)))))

(declare-fun b!1102693 () Bool)

(assert (=> b!1102693 (= e!629488 (= call!46240 call!46239))))

(assert (=> b!1102693 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34890 _values!874)))))

(declare-fun d!131119 () Bool)

(declare-fun e!629487 () Bool)

(assert (=> d!131119 e!629487))

(declare-fun res!735427 () Bool)

(assert (=> d!131119 (=> (not res!735427) (not e!629487))))

(assert (=> d!131119 (= res!735427 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34889 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34889 _keys!1070))))))))

(declare-fun lt!494279 () Unit!36189)

(declare-fun choose!1775 (array!71389 array!71391 (_ BitVec 32) (_ BitVec 32) V!41417 V!41417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36189)

(assert (=> d!131119 (= lt!494279 (choose!1775 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131119 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> d!131119 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!237 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494279)))

(declare-fun b!1102691 () Bool)

(assert (=> b!1102691 (= e!629487 e!629488)))

(declare-fun c!109210 () Bool)

(assert (=> b!1102691 (= c!109210 (bvsle #b00000000000000000000000000000000 i!650))))

(assert (= (and d!131119 res!735427) b!1102691))

(assert (= (and b!1102691 c!109210) b!1102692))

(assert (= (and b!1102691 (not c!109210)) b!1102693))

(assert (= (or b!1102692 b!1102693) bm!46236))

(assert (= (or b!1102692 b!1102693) bm!46237))

(declare-fun b_lambda!18087 () Bool)

(assert (=> (not b_lambda!18087) (not bm!46237)))

(assert (=> bm!46237 t!34215))

(declare-fun b_and!37135 () Bool)

(assert (= b_and!37133 (and (=> t!34215 result!16597) b_and!37135)))

(assert (=> bm!46236 m!1022973))

(assert (=> bm!46237 m!1022961))

(assert (=> bm!46237 m!1022963))

(assert (=> bm!46237 m!1022965))

(declare-fun m!1023227 () Bool)

(assert (=> bm!46237 m!1023227))

(declare-fun m!1023229 () Bool)

(assert (=> b!1102692 m!1023229))

(declare-fun m!1023231 () Bool)

(assert (=> d!131119 m!1023231))

(assert (=> b!1102472 d!131119))

(declare-fun d!131121 () Bool)

(declare-fun lt!494282 () ListLongMap!15369)

(assert (=> d!131121 (not (contains!6426 lt!494282 k0!904))))

(declare-fun removeStrictlySorted!84 (List!24011 (_ BitVec 64)) List!24011)

(assert (=> d!131121 (= lt!494282 (ListLongMap!15370 (removeStrictlySorted!84 (toList!7700 lt!494112) k0!904)))))

(assert (=> d!131121 (= (-!967 lt!494112 k0!904) lt!494282)))

(declare-fun bs!32343 () Bool)

(assert (= bs!32343 d!131121))

(declare-fun m!1023233 () Bool)

(assert (=> bs!32343 m!1023233))

(declare-fun m!1023235 () Bool)

(assert (=> bs!32343 m!1023235))

(assert (=> b!1102472 d!131121))

(declare-fun b!1102718 () Bool)

(declare-fun e!629504 () ListLongMap!15369)

(assert (=> b!1102718 (= e!629504 (ListLongMap!15370 Nil!24008))))

(declare-fun b!1102719 () Bool)

(declare-fun e!629509 () ListLongMap!15369)

(assert (=> b!1102719 (= e!629504 e!629509)))

(declare-fun c!109221 () Bool)

(assert (=> b!1102719 (= c!109221 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(declare-fun d!131123 () Bool)

(declare-fun e!629506 () Bool)

(assert (=> d!131123 e!629506))

(declare-fun res!735436 () Bool)

(assert (=> d!131123 (=> (not res!735436) (not e!629506))))

(declare-fun lt!494301 () ListLongMap!15369)

(assert (=> d!131123 (= res!735436 (not (contains!6426 lt!494301 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131123 (= lt!494301 e!629504)))

(declare-fun c!109219 () Bool)

(assert (=> d!131123 (= c!109219 (bvsge #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (=> d!131123 (validMask!0 mask!1414)))

(assert (=> d!131123 (= (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494301)))

(declare-fun b!1102720 () Bool)

(declare-fun call!46243 () ListLongMap!15369)

(assert (=> b!1102720 (= e!629509 call!46243)))

(declare-fun b!1102721 () Bool)

(declare-fun res!735437 () Bool)

(assert (=> b!1102721 (=> (not res!735437) (not e!629506))))

(assert (=> b!1102721 (= res!735437 (not (contains!6426 lt!494301 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102722 () Bool)

(declare-fun e!629508 () Bool)

(assert (=> b!1102722 (= e!629506 e!629508)))

(declare-fun c!109220 () Bool)

(declare-fun e!629505 () Bool)

(assert (=> b!1102722 (= c!109220 e!629505)))

(declare-fun res!735439 () Bool)

(assert (=> b!1102722 (=> (not res!735439) (not e!629505))))

(assert (=> b!1102722 (= res!735439 (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(declare-fun b!1102723 () Bool)

(declare-fun e!629503 () Bool)

(declare-fun isEmpty!973 (ListLongMap!15369) Bool)

(assert (=> b!1102723 (= e!629503 (isEmpty!973 lt!494301))))

(declare-fun b!1102724 () Bool)

(assert (=> b!1102724 (= e!629505 (validKeyInArray!0 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(assert (=> b!1102724 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102725 () Bool)

(declare-fun lt!494298 () Unit!36189)

(declare-fun lt!494303 () Unit!36189)

(assert (=> b!1102725 (= lt!494298 lt!494303)))

(declare-fun lt!494302 () (_ BitVec 64))

(declare-fun lt!494297 () V!41417)

(declare-fun lt!494300 () (_ BitVec 64))

(declare-fun lt!494299 () ListLongMap!15369)

(assert (=> b!1102725 (not (contains!6426 (+!3428 lt!494299 (tuple2!17393 lt!494300 lt!494297)) lt!494302))))

(declare-fun addStillNotContains!281 (ListLongMap!15369 (_ BitVec 64) V!41417 (_ BitVec 64)) Unit!36189)

(assert (=> b!1102725 (= lt!494303 (addStillNotContains!281 lt!494299 lt!494300 lt!494297 lt!494302))))

(assert (=> b!1102725 (= lt!494302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102725 (= lt!494297 (get!17682 (select (arr!34353 lt!494109) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102725 (= lt!494300 (select (arr!34352 lt!494110) #b00000000000000000000000000000000))))

(assert (=> b!1102725 (= lt!494299 call!46243)))

(assert (=> b!1102725 (= e!629509 (+!3428 call!46243 (tuple2!17393 (select (arr!34352 lt!494110) #b00000000000000000000000000000000) (get!17682 (select (arr!34353 lt!494109) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102726 () Bool)

(declare-fun e!629507 () Bool)

(assert (=> b!1102726 (= e!629508 e!629507)))

(assert (=> b!1102726 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(declare-fun res!735438 () Bool)

(assert (=> b!1102726 (= res!735438 (contains!6426 lt!494301 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)))))

(assert (=> b!1102726 (=> (not res!735438) (not e!629507))))

(declare-fun bm!46240 () Bool)

(assert (=> bm!46240 (= call!46243 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102727 () Bool)

(assert (=> b!1102727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (=> b!1102727 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34890 lt!494109)))))

(assert (=> b!1102727 (= e!629507 (= (apply!960 lt!494301 (select (arr!34352 lt!494110) #b00000000000000000000000000000000)) (get!17682 (select (arr!34353 lt!494109) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102728 () Bool)

(assert (=> b!1102728 (= e!629503 (= lt!494301 (getCurrentListMapNoExtraKeys!4244 lt!494110 lt!494109 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102729 () Bool)

(assert (=> b!1102729 (= e!629508 e!629503)))

(declare-fun c!109222 () Bool)

(assert (=> b!1102729 (= c!109222 (bvslt #b00000000000000000000000000000000 (size!34889 lt!494110)))))

(assert (= (and d!131123 c!109219) b!1102718))

(assert (= (and d!131123 (not c!109219)) b!1102719))

(assert (= (and b!1102719 c!109221) b!1102725))

(assert (= (and b!1102719 (not c!109221)) b!1102720))

(assert (= (or b!1102725 b!1102720) bm!46240))

(assert (= (and d!131123 res!735436) b!1102721))

(assert (= (and b!1102721 res!735437) b!1102722))

(assert (= (and b!1102722 res!735439) b!1102724))

(assert (= (and b!1102722 c!109220) b!1102726))

(assert (= (and b!1102722 (not c!109220)) b!1102729))

(assert (= (and b!1102726 res!735438) b!1102727))

(assert (= (and b!1102729 c!109222) b!1102728))

(assert (= (and b!1102729 (not c!109222)) b!1102723))

(declare-fun b_lambda!18089 () Bool)

(assert (=> (not b_lambda!18089) (not b!1102725)))

(assert (=> b!1102725 t!34215))

(declare-fun b_and!37137 () Bool)

(assert (= b_and!37135 (and (=> t!34215 result!16597) b_and!37137)))

(declare-fun b_lambda!18091 () Bool)

(assert (=> (not b_lambda!18091) (not b!1102727)))

(assert (=> b!1102727 t!34215))

(declare-fun b_and!37139 () Bool)

(assert (= b_and!37137 (and (=> t!34215 result!16597) b_and!37139)))

(assert (=> b!1102724 m!1023097))

(assert (=> b!1102724 m!1023097))

(assert (=> b!1102724 m!1023103))

(declare-fun m!1023237 () Bool)

(assert (=> b!1102723 m!1023237))

(declare-fun m!1023239 () Bool)

(assert (=> b!1102725 m!1023239))

(declare-fun m!1023241 () Bool)

(assert (=> b!1102725 m!1023241))

(declare-fun m!1023243 () Bool)

(assert (=> b!1102725 m!1023243))

(assert (=> b!1102725 m!1023239))

(declare-fun m!1023245 () Bool)

(assert (=> b!1102725 m!1023245))

(assert (=> b!1102725 m!1023097))

(assert (=> b!1102725 m!1022963))

(assert (=> b!1102725 m!1023211))

(assert (=> b!1102725 m!1023211))

(assert (=> b!1102725 m!1022963))

(assert (=> b!1102725 m!1023213))

(declare-fun m!1023247 () Bool)

(assert (=> d!131123 m!1023247))

(assert (=> d!131123 m!1022985))

(assert (=> b!1102719 m!1023097))

(assert (=> b!1102719 m!1023097))

(assert (=> b!1102719 m!1023103))

(declare-fun m!1023249 () Bool)

(assert (=> b!1102721 m!1023249))

(assert (=> b!1102726 m!1023097))

(assert (=> b!1102726 m!1023097))

(declare-fun m!1023251 () Bool)

(assert (=> b!1102726 m!1023251))

(declare-fun m!1023253 () Bool)

(assert (=> b!1102728 m!1023253))

(assert (=> bm!46240 m!1023253))

(assert (=> b!1102727 m!1023097))

(assert (=> b!1102727 m!1022963))

(assert (=> b!1102727 m!1023097))

(declare-fun m!1023255 () Bool)

(assert (=> b!1102727 m!1023255))

(assert (=> b!1102727 m!1023211))

(assert (=> b!1102727 m!1023211))

(assert (=> b!1102727 m!1022963))

(assert (=> b!1102727 m!1023213))

(assert (=> b!1102472 d!131123))

(declare-fun b!1102730 () Bool)

(declare-fun e!629511 () ListLongMap!15369)

(assert (=> b!1102730 (= e!629511 (ListLongMap!15370 Nil!24008))))

(declare-fun b!1102731 () Bool)

(declare-fun e!629516 () ListLongMap!15369)

(assert (=> b!1102731 (= e!629511 e!629516)))

(declare-fun c!109225 () Bool)

(assert (=> b!1102731 (= c!109225 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131125 () Bool)

(declare-fun e!629513 () Bool)

(assert (=> d!131125 e!629513))

(declare-fun res!735440 () Bool)

(assert (=> d!131125 (=> (not res!735440) (not e!629513))))

(declare-fun lt!494308 () ListLongMap!15369)

(assert (=> d!131125 (= res!735440 (not (contains!6426 lt!494308 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131125 (= lt!494308 e!629511)))

(declare-fun c!109223 () Bool)

(assert (=> d!131125 (= c!109223 (bvsge #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> d!131125 (validMask!0 mask!1414)))

(assert (=> d!131125 (= (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494308)))

(declare-fun b!1102732 () Bool)

(declare-fun call!46244 () ListLongMap!15369)

(assert (=> b!1102732 (= e!629516 call!46244)))

(declare-fun b!1102733 () Bool)

(declare-fun res!735441 () Bool)

(assert (=> b!1102733 (=> (not res!735441) (not e!629513))))

(assert (=> b!1102733 (= res!735441 (not (contains!6426 lt!494308 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102734 () Bool)

(declare-fun e!629515 () Bool)

(assert (=> b!1102734 (= e!629513 e!629515)))

(declare-fun c!109224 () Bool)

(declare-fun e!629512 () Bool)

(assert (=> b!1102734 (= c!109224 e!629512)))

(declare-fun res!735443 () Bool)

(assert (=> b!1102734 (=> (not res!735443) (not e!629512))))

(assert (=> b!1102734 (= res!735443 (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(declare-fun b!1102735 () Bool)

(declare-fun e!629510 () Bool)

(assert (=> b!1102735 (= e!629510 (isEmpty!973 lt!494308))))

(declare-fun b!1102736 () Bool)

(assert (=> b!1102736 (= e!629512 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102736 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1102737 () Bool)

(declare-fun lt!494305 () Unit!36189)

(declare-fun lt!494310 () Unit!36189)

(assert (=> b!1102737 (= lt!494305 lt!494310)))

(declare-fun lt!494307 () (_ BitVec 64))

(declare-fun lt!494309 () (_ BitVec 64))

(declare-fun lt!494306 () ListLongMap!15369)

(declare-fun lt!494304 () V!41417)

(assert (=> b!1102737 (not (contains!6426 (+!3428 lt!494306 (tuple2!17393 lt!494307 lt!494304)) lt!494309))))

(assert (=> b!1102737 (= lt!494310 (addStillNotContains!281 lt!494306 lt!494307 lt!494304 lt!494309))))

(assert (=> b!1102737 (= lt!494309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102737 (= lt!494304 (get!17682 (select (arr!34353 _values!874) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102737 (= lt!494307 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102737 (= lt!494306 call!46244)))

(assert (=> b!1102737 (= e!629516 (+!3428 call!46244 (tuple2!17393 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000) (get!17682 (select (arr!34353 _values!874) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1102738 () Bool)

(declare-fun e!629514 () Bool)

(assert (=> b!1102738 (= e!629515 e!629514)))

(assert (=> b!1102738 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(declare-fun res!735442 () Bool)

(assert (=> b!1102738 (= res!735442 (contains!6426 lt!494308 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102738 (=> (not res!735442) (not e!629514))))

(declare-fun bm!46241 () Bool)

(assert (=> bm!46241 (= call!46244 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102739 () Bool)

(assert (=> b!1102739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> b!1102739 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34890 _values!874)))))

(assert (=> b!1102739 (= e!629514 (= (apply!960 lt!494308 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)) (get!17682 (select (arr!34353 _values!874) #b00000000000000000000000000000000) (dynLambda!2362 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102740 () Bool)

(assert (=> b!1102740 (= e!629510 (= lt!494308 (getCurrentListMapNoExtraKeys!4244 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102741 () Bool)

(assert (=> b!1102741 (= e!629515 e!629510)))

(declare-fun c!109226 () Bool)

(assert (=> b!1102741 (= c!109226 (bvslt #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (= (and d!131125 c!109223) b!1102730))

(assert (= (and d!131125 (not c!109223)) b!1102731))

(assert (= (and b!1102731 c!109225) b!1102737))

(assert (= (and b!1102731 (not c!109225)) b!1102732))

(assert (= (or b!1102737 b!1102732) bm!46241))

(assert (= (and d!131125 res!735440) b!1102733))

(assert (= (and b!1102733 res!735441) b!1102734))

(assert (= (and b!1102734 res!735443) b!1102736))

(assert (= (and b!1102734 c!109224) b!1102738))

(assert (= (and b!1102734 (not c!109224)) b!1102741))

(assert (= (and b!1102738 res!735442) b!1102739))

(assert (= (and b!1102741 c!109226) b!1102740))

(assert (= (and b!1102741 (not c!109226)) b!1102735))

(declare-fun b_lambda!18093 () Bool)

(assert (=> (not b_lambda!18093) (not b!1102737)))

(assert (=> b!1102737 t!34215))

(declare-fun b_and!37141 () Bool)

(assert (= b_and!37139 (and (=> t!34215 result!16597) b_and!37141)))

(declare-fun b_lambda!18095 () Bool)

(assert (=> (not b_lambda!18095) (not b!1102739)))

(assert (=> b!1102739 t!34215))

(declare-fun b_and!37143 () Bool)

(assert (= b_and!37141 (and (=> t!34215 result!16597) b_and!37143)))

(assert (=> b!1102736 m!1023105))

(assert (=> b!1102736 m!1023105))

(assert (=> b!1102736 m!1023107))

(declare-fun m!1023257 () Bool)

(assert (=> b!1102735 m!1023257))

(declare-fun m!1023259 () Bool)

(assert (=> b!1102737 m!1023259))

(declare-fun m!1023261 () Bool)

(assert (=> b!1102737 m!1023261))

(declare-fun m!1023263 () Bool)

(assert (=> b!1102737 m!1023263))

(assert (=> b!1102737 m!1023259))

(declare-fun m!1023265 () Bool)

(assert (=> b!1102737 m!1023265))

(assert (=> b!1102737 m!1023105))

(assert (=> b!1102737 m!1022963))

(assert (=> b!1102737 m!1023161))

(assert (=> b!1102737 m!1023161))

(assert (=> b!1102737 m!1022963))

(assert (=> b!1102737 m!1023163))

(declare-fun m!1023267 () Bool)

(assert (=> d!131125 m!1023267))

(assert (=> d!131125 m!1022985))

(assert (=> b!1102731 m!1023105))

(assert (=> b!1102731 m!1023105))

(assert (=> b!1102731 m!1023107))

(declare-fun m!1023269 () Bool)

(assert (=> b!1102733 m!1023269))

(assert (=> b!1102738 m!1023105))

(assert (=> b!1102738 m!1023105))

(declare-fun m!1023271 () Bool)

(assert (=> b!1102738 m!1023271))

(declare-fun m!1023273 () Bool)

(assert (=> b!1102740 m!1023273))

(assert (=> bm!46241 m!1023273))

(assert (=> b!1102739 m!1023105))

(assert (=> b!1102739 m!1022963))

(assert (=> b!1102739 m!1023105))

(declare-fun m!1023275 () Bool)

(assert (=> b!1102739 m!1023275))

(assert (=> b!1102739 m!1023161))

(assert (=> b!1102739 m!1023161))

(assert (=> b!1102739 m!1022963))

(assert (=> b!1102739 m!1023163))

(assert (=> b!1102472 d!131125))

(declare-fun d!131127 () Bool)

(assert (=> d!131127 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494313 () Unit!36189)

(declare-fun choose!13 (array!71389 (_ BitVec 64) (_ BitVec 32)) Unit!36189)

(assert (=> d!131127 (= lt!494313 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131127 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131127 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494313)))

(declare-fun bs!32344 () Bool)

(assert (= bs!32344 d!131127))

(assert (=> bs!32344 m!1022967))

(declare-fun m!1023277 () Bool)

(assert (=> bs!32344 m!1023277))

(assert (=> b!1102472 d!131127))

(declare-fun d!131129 () Bool)

(declare-fun e!629519 () Bool)

(assert (=> d!131129 e!629519))

(declare-fun res!735449 () Bool)

(assert (=> d!131129 (=> (not res!735449) (not e!629519))))

(declare-fun lt!494323 () ListLongMap!15369)

(assert (=> d!131129 (= res!735449 (contains!6426 lt!494323 (_1!8707 lt!494115)))))

(declare-fun lt!494322 () List!24011)

(assert (=> d!131129 (= lt!494323 (ListLongMap!15370 lt!494322))))

(declare-fun lt!494324 () Unit!36189)

(declare-fun lt!494325 () Unit!36189)

(assert (=> d!131129 (= lt!494324 lt!494325)))

(declare-datatypes ((Option!673 0))(
  ( (Some!672 (v!16293 V!41417)) (None!671) )
))
(declare-fun getValueByKey!622 (List!24011 (_ BitVec 64)) Option!673)

(assert (=> d!131129 (= (getValueByKey!622 lt!494322 (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115)))))

(declare-fun lemmaContainsTupThenGetReturnValue!304 (List!24011 (_ BitVec 64) V!41417) Unit!36189)

(assert (=> d!131129 (= lt!494325 (lemmaContainsTupThenGetReturnValue!304 lt!494322 (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(declare-fun insertStrictlySorted!397 (List!24011 (_ BitVec 64) V!41417) List!24011)

(assert (=> d!131129 (= lt!494322 (insertStrictlySorted!397 (toList!7700 lt!494108) (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(assert (=> d!131129 (= (+!3428 lt!494108 lt!494115) lt!494323)))

(declare-fun b!1102746 () Bool)

(declare-fun res!735448 () Bool)

(assert (=> b!1102746 (=> (not res!735448) (not e!629519))))

(assert (=> b!1102746 (= res!735448 (= (getValueByKey!622 (toList!7700 lt!494323) (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115))))))

(declare-fun b!1102747 () Bool)

(declare-fun contains!6427 (List!24011 tuple2!17392) Bool)

(assert (=> b!1102747 (= e!629519 (contains!6427 (toList!7700 lt!494323) lt!494115))))

(assert (= (and d!131129 res!735449) b!1102746))

(assert (= (and b!1102746 res!735448) b!1102747))

(declare-fun m!1023279 () Bool)

(assert (=> d!131129 m!1023279))

(declare-fun m!1023281 () Bool)

(assert (=> d!131129 m!1023281))

(declare-fun m!1023283 () Bool)

(assert (=> d!131129 m!1023283))

(declare-fun m!1023285 () Bool)

(assert (=> d!131129 m!1023285))

(declare-fun m!1023287 () Bool)

(assert (=> b!1102746 m!1023287))

(declare-fun m!1023289 () Bool)

(assert (=> b!1102747 m!1023289))

(assert (=> b!1102471 d!131129))

(declare-fun d!131131 () Bool)

(assert (=> d!131131 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102460 d!131131))

(declare-fun bm!46242 () Bool)

(declare-fun call!46245 () Bool)

(declare-fun c!109227 () Bool)

(assert (=> bm!46242 (= call!46245 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109227 (Cons!24008 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000) Nil!24009) Nil!24009)))))

(declare-fun b!1102748 () Bool)

(declare-fun e!629522 () Bool)

(assert (=> b!1102748 (= e!629522 call!46245)))

(declare-fun b!1102749 () Bool)

(declare-fun e!629520 () Bool)

(assert (=> b!1102749 (= e!629520 (contains!6425 Nil!24009 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102750 () Bool)

(declare-fun e!629523 () Bool)

(assert (=> b!1102750 (= e!629523 e!629522)))

(assert (=> b!1102750 (= c!109227 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131133 () Bool)

(declare-fun res!735450 () Bool)

(declare-fun e!629521 () Bool)

(assert (=> d!131133 (=> res!735450 e!629521)))

(assert (=> d!131133 (= res!735450 (bvsge #b00000000000000000000000000000000 (size!34889 _keys!1070)))))

(assert (=> d!131133 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24009) e!629521)))

(declare-fun b!1102751 () Bool)

(assert (=> b!1102751 (= e!629522 call!46245)))

(declare-fun b!1102752 () Bool)

(assert (=> b!1102752 (= e!629521 e!629523)))

(declare-fun res!735452 () Bool)

(assert (=> b!1102752 (=> (not res!735452) (not e!629523))))

(assert (=> b!1102752 (= res!735452 (not e!629520))))

(declare-fun res!735451 () Bool)

(assert (=> b!1102752 (=> (not res!735451) (not e!629520))))

(assert (=> b!1102752 (= res!735451 (validKeyInArray!0 (select (arr!34352 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131133 (not res!735450)) b!1102752))

(assert (= (and b!1102752 res!735451) b!1102749))

(assert (= (and b!1102752 res!735452) b!1102750))

(assert (= (and b!1102750 c!109227) b!1102751))

(assert (= (and b!1102750 (not c!109227)) b!1102748))

(assert (= (or b!1102751 b!1102748) bm!46242))

(assert (=> bm!46242 m!1023105))

(declare-fun m!1023291 () Bool)

(assert (=> bm!46242 m!1023291))

(assert (=> b!1102749 m!1023105))

(assert (=> b!1102749 m!1023105))

(declare-fun m!1023293 () Bool)

(assert (=> b!1102749 m!1023293))

(assert (=> b!1102750 m!1023105))

(assert (=> b!1102750 m!1023105))

(assert (=> b!1102750 m!1023107))

(assert (=> b!1102752 m!1023105))

(assert (=> b!1102752 m!1023105))

(assert (=> b!1102752 m!1023107))

(assert (=> b!1102466 d!131133))

(declare-fun d!131135 () Bool)

(declare-fun e!629524 () Bool)

(assert (=> d!131135 e!629524))

(declare-fun res!735454 () Bool)

(assert (=> d!131135 (=> (not res!735454) (not e!629524))))

(declare-fun lt!494327 () ListLongMap!15369)

(assert (=> d!131135 (= res!735454 (contains!6426 lt!494327 (_1!8707 lt!494115)))))

(declare-fun lt!494326 () List!24011)

(assert (=> d!131135 (= lt!494327 (ListLongMap!15370 lt!494326))))

(declare-fun lt!494328 () Unit!36189)

(declare-fun lt!494329 () Unit!36189)

(assert (=> d!131135 (= lt!494328 lt!494329)))

(assert (=> d!131135 (= (getValueByKey!622 lt!494326 (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115)))))

(assert (=> d!131135 (= lt!494329 (lemmaContainsTupThenGetReturnValue!304 lt!494326 (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(assert (=> d!131135 (= lt!494326 (insertStrictlySorted!397 (toList!7700 lt!494112) (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(assert (=> d!131135 (= (+!3428 lt!494112 lt!494115) lt!494327)))

(declare-fun b!1102753 () Bool)

(declare-fun res!735453 () Bool)

(assert (=> b!1102753 (=> (not res!735453) (not e!629524))))

(assert (=> b!1102753 (= res!735453 (= (getValueByKey!622 (toList!7700 lt!494327) (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115))))))

(declare-fun b!1102754 () Bool)

(assert (=> b!1102754 (= e!629524 (contains!6427 (toList!7700 lt!494327) lt!494115))))

(assert (= (and d!131135 res!735454) b!1102753))

(assert (= (and b!1102753 res!735453) b!1102754))

(declare-fun m!1023295 () Bool)

(assert (=> d!131135 m!1023295))

(declare-fun m!1023297 () Bool)

(assert (=> d!131135 m!1023297))

(declare-fun m!1023299 () Bool)

(assert (=> d!131135 m!1023299))

(declare-fun m!1023301 () Bool)

(assert (=> d!131135 m!1023301))

(declare-fun m!1023303 () Bool)

(assert (=> b!1102753 m!1023303))

(declare-fun m!1023305 () Bool)

(assert (=> b!1102754 m!1023305))

(assert (=> b!1102461 d!131135))

(declare-fun d!131137 () Bool)

(declare-fun e!629525 () Bool)

(assert (=> d!131137 e!629525))

(declare-fun res!735456 () Bool)

(assert (=> d!131137 (=> (not res!735456) (not e!629525))))

(declare-fun lt!494331 () ListLongMap!15369)

(assert (=> d!131137 (= res!735456 (contains!6426 lt!494331 (_1!8707 lt!494115)))))

(declare-fun lt!494330 () List!24011)

(assert (=> d!131137 (= lt!494331 (ListLongMap!15370 lt!494330))))

(declare-fun lt!494332 () Unit!36189)

(declare-fun lt!494333 () Unit!36189)

(assert (=> d!131137 (= lt!494332 lt!494333)))

(assert (=> d!131137 (= (getValueByKey!622 lt!494330 (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115)))))

(assert (=> d!131137 (= lt!494333 (lemmaContainsTupThenGetReturnValue!304 lt!494330 (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(assert (=> d!131137 (= lt!494330 (insertStrictlySorted!397 (toList!7700 lt!494116) (_1!8707 lt!494115) (_2!8707 lt!494115)))))

(assert (=> d!131137 (= (+!3428 lt!494116 lt!494115) lt!494331)))

(declare-fun b!1102755 () Bool)

(declare-fun res!735455 () Bool)

(assert (=> b!1102755 (=> (not res!735455) (not e!629525))))

(assert (=> b!1102755 (= res!735455 (= (getValueByKey!622 (toList!7700 lt!494331) (_1!8707 lt!494115)) (Some!672 (_2!8707 lt!494115))))))

(declare-fun b!1102756 () Bool)

(assert (=> b!1102756 (= e!629525 (contains!6427 (toList!7700 lt!494331) lt!494115))))

(assert (= (and d!131137 res!735456) b!1102755))

(assert (= (and b!1102755 res!735455) b!1102756))

(declare-fun m!1023307 () Bool)

(assert (=> d!131137 m!1023307))

(declare-fun m!1023309 () Bool)

(assert (=> d!131137 m!1023309))

(declare-fun m!1023311 () Bool)

(assert (=> d!131137 m!1023311))

(declare-fun m!1023313 () Bool)

(assert (=> d!131137 m!1023313))

(declare-fun m!1023315 () Bool)

(assert (=> b!1102755 m!1023315))

(declare-fun m!1023317 () Bool)

(assert (=> b!1102756 m!1023317))

(assert (=> b!1102461 d!131137))

(declare-fun b!1102763 () Bool)

(declare-fun e!629531 () Bool)

(assert (=> b!1102763 (= e!629531 tp_is_empty!27217)))

(declare-fun mapNonEmpty!42619 () Bool)

(declare-fun mapRes!42619 () Bool)

(declare-fun tp!81467 () Bool)

(assert (=> mapNonEmpty!42619 (= mapRes!42619 (and tp!81467 e!629531))))

(declare-fun mapValue!42619 () ValueCell!12899)

(declare-fun mapRest!42619 () (Array (_ BitVec 32) ValueCell!12899))

(declare-fun mapKey!42619 () (_ BitVec 32))

(assert (=> mapNonEmpty!42619 (= mapRest!42610 (store mapRest!42619 mapKey!42619 mapValue!42619))))

(declare-fun b!1102764 () Bool)

(declare-fun e!629530 () Bool)

(assert (=> b!1102764 (= e!629530 tp_is_empty!27217)))

(declare-fun condMapEmpty!42619 () Bool)

(declare-fun mapDefault!42619 () ValueCell!12899)

(assert (=> mapNonEmpty!42610 (= condMapEmpty!42619 (= mapRest!42610 ((as const (Array (_ BitVec 32) ValueCell!12899)) mapDefault!42619)))))

(assert (=> mapNonEmpty!42610 (= tp!81451 (and e!629530 mapRes!42619))))

(declare-fun mapIsEmpty!42619 () Bool)

(assert (=> mapIsEmpty!42619 mapRes!42619))

(assert (= (and mapNonEmpty!42610 condMapEmpty!42619) mapIsEmpty!42619))

(assert (= (and mapNonEmpty!42610 (not condMapEmpty!42619)) mapNonEmpty!42619))

(assert (= (and mapNonEmpty!42619 ((_ is ValueCellFull!12899) mapValue!42619)) b!1102763))

(assert (= (and mapNonEmpty!42610 ((_ is ValueCellFull!12899) mapDefault!42619)) b!1102764))

(declare-fun m!1023319 () Bool)

(assert (=> mapNonEmpty!42619 m!1023319))

(declare-fun b_lambda!18097 () Bool)

(assert (= b_lambda!18083 (or (and start!97034 b_free!23167) b_lambda!18097)))

(declare-fun b_lambda!18099 () Bool)

(assert (= b_lambda!18095 (or (and start!97034 b_free!23167) b_lambda!18099)))

(declare-fun b_lambda!18101 () Bool)

(assert (= b_lambda!18089 (or (and start!97034 b_free!23167) b_lambda!18101)))

(declare-fun b_lambda!18103 () Bool)

(assert (= b_lambda!18087 (or (and start!97034 b_free!23167) b_lambda!18103)))

(declare-fun b_lambda!18105 () Bool)

(assert (= b_lambda!18093 (or (and start!97034 b_free!23167) b_lambda!18105)))

(declare-fun b_lambda!18107 () Bool)

(assert (= b_lambda!18091 (or (and start!97034 b_free!23167) b_lambda!18107)))

(declare-fun b_lambda!18109 () Bool)

(assert (= b_lambda!18085 (or (and start!97034 b_free!23167) b_lambda!18109)))

(check-sat (not d!131119) (not b!1102651) (not b!1102645) (not b!1102726) (not b!1102756) (not bm!46199) (not b!1102719) (not b!1102752) (not b!1102731) (not bm!46237) (not b!1102591) (not b!1102661) (not b!1102735) (not b!1102733) (not b!1102659) (not b!1102684) (not b!1102755) (not b_lambda!18107) (not b!1102657) (not b!1102655) (not d!131121) tp_is_empty!27217 (not d!131137) (not b!1102728) (not bm!46224) (not b!1102576) (not bm!46219) (not b!1102575) (not b!1102747) (not b_lambda!18081) (not b!1102736) (not b_lambda!18105) (not b!1102578) (not b!1102723) (not b!1102754) (not b!1102668) (not d!131123) (not d!131135) (not b!1102721) (not bm!46226) (not b_lambda!18099) (not b!1102678) (not b!1102725) (not b!1102587) (not b!1102753) (not b!1102724) (not bm!46227) (not b_lambda!18109) (not bm!46203) (not bm!46236) (not b_next!23167) (not b!1102692) (not b!1102600) (not b!1102593) (not d!131125) (not b!1102738) (not d!131127) (not bm!46222) (not d!131117) (not b!1102647) (not b!1102589) (not bm!46240) (not b_lambda!18097) (not b!1102666) (not b!1102727) (not d!131129) (not mapNonEmpty!42619) (not b!1102676) (not b!1102750) (not bm!46241) (not b!1102737) (not b_lambda!18101) (not b_lambda!18103) (not b!1102672) (not b!1102746) (not bm!46231) (not b!1102740) (not b!1102680) (not bm!46242) (not bm!46220) (not bm!46229) b_and!37143 (not b!1102663) (not b!1102749) (not b!1102739) (not bm!46202) (not d!131115) (not b!1102682))
(check-sat b_and!37143 (not b_next!23167))
