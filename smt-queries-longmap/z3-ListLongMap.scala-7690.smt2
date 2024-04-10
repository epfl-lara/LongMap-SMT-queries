; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96488 () Bool)

(assert start!96488)

(declare-fun b_free!23067 () Bool)

(declare-fun b_next!23067 () Bool)

(assert (=> start!96488 (= b_free!23067 (not b_next!23067))))

(declare-fun tp!81128 () Bool)

(declare-fun b_and!36797 () Bool)

(assert (=> start!96488 (= tp!81128 b_and!36797)))

(declare-fun b!1097364 () Bool)

(declare-fun e!626304 () Bool)

(declare-fun tp_is_empty!27117 () Bool)

(assert (=> b!1097364 (= e!626304 tp_is_empty!27117)))

(declare-fun b!1097365 () Bool)

(declare-fun res!732436 () Bool)

(declare-fun e!626303 () Bool)

(assert (=> b!1097365 (=> (not res!732436) (not e!626303))))

(declare-datatypes ((array!71145 0))(
  ( (array!71146 (arr!34244 (Array (_ BitVec 32) (_ BitVec 64))) (size!34780 (_ BitVec 32))) )
))
(declare-fun lt!490518 () array!71145)

(declare-datatypes ((List!23914 0))(
  ( (Nil!23911) (Cons!23910 (h!25119 (_ BitVec 64)) (t!34027 List!23914)) )
))
(declare-fun arrayNoDuplicates!0 (array!71145 (_ BitVec 32) List!23914) Bool)

(assert (=> b!1097365 (= res!732436 (arrayNoDuplicates!0 lt!490518 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun b!1097366 () Bool)

(declare-fun e!626300 () Bool)

(declare-fun e!626299 () Bool)

(declare-fun mapRes!42436 () Bool)

(assert (=> b!1097366 (= e!626300 (and e!626299 mapRes!42436))))

(declare-fun condMapEmpty!42436 () Bool)

(declare-datatypes ((V!41283 0))(
  ( (V!41284 (val!13615 Int)) )
))
(declare-datatypes ((ValueCell!12849 0))(
  ( (ValueCellFull!12849 (v!16236 V!41283)) (EmptyCell!12849) )
))
(declare-datatypes ((array!71147 0))(
  ( (array!71148 (arr!34245 (Array (_ BitVec 32) ValueCell!12849)) (size!34781 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71147)

(declare-fun mapDefault!42436 () ValueCell!12849)

(assert (=> b!1097366 (= condMapEmpty!42436 (= (arr!34245 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12849)) mapDefault!42436)))))

(declare-fun b!1097367 () Bool)

(declare-fun res!732428 () Bool)

(declare-fun e!626305 () Bool)

(assert (=> b!1097367 (=> (not res!732428) (not e!626305))))

(declare-fun _keys!1070 () array!71145)

(assert (=> b!1097367 (= res!732428 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun b!1097368 () Bool)

(declare-fun res!732433 () Bool)

(assert (=> b!1097368 (=> (not res!732433) (not e!626305))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097368 (= res!732433 (validKeyInArray!0 k0!904))))

(declare-fun b!1097369 () Bool)

(declare-fun e!626301 () Bool)

(assert (=> b!1097369 (= e!626303 (not e!626301))))

(declare-fun res!732430 () Bool)

(assert (=> b!1097369 (=> res!732430 e!626301)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097369 (= res!732430 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41283)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17292 0))(
  ( (tuple2!17293 (_1!8657 (_ BitVec 64)) (_2!8657 V!41283)) )
))
(declare-datatypes ((List!23915 0))(
  ( (Nil!23912) (Cons!23911 (h!25120 tuple2!17292) (t!34028 List!23915)) )
))
(declare-datatypes ((ListLongMap!15261 0))(
  ( (ListLongMap!15262 (toList!7646 List!23915)) )
))
(declare-fun lt!490522 () ListLongMap!15261)

(declare-fun zeroValue!831 () V!41283)

(declare-fun getCurrentListMap!4366 (array!71145 array!71147 (_ BitVec 32) (_ BitVec 32) V!41283 V!41283 (_ BitVec 32) Int) ListLongMap!15261)

(assert (=> b!1097369 (= lt!490522 (getCurrentListMap!4366 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490524 () ListLongMap!15261)

(declare-fun lt!490525 () array!71147)

(assert (=> b!1097369 (= lt!490524 (getCurrentListMap!4366 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490523 () ListLongMap!15261)

(declare-fun lt!490520 () ListLongMap!15261)

(assert (=> b!1097369 (and (= lt!490523 lt!490520) (= lt!490520 lt!490523))))

(declare-fun lt!490517 () ListLongMap!15261)

(declare-fun -!936 (ListLongMap!15261 (_ BitVec 64)) ListLongMap!15261)

(assert (=> b!1097369 (= lt!490520 (-!936 lt!490517 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!36104 0))(
  ( (Unit!36105) )
))
(declare-fun lt!490519 () Unit!36104)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!192 (array!71145 array!71147 (_ BitVec 32) (_ BitVec 32) V!41283 V!41283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36104)

(assert (=> b!1097369 (= lt!490519 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4162 (array!71145 array!71147 (_ BitVec 32) (_ BitVec 32) V!41283 V!41283 (_ BitVec 32) Int) ListLongMap!15261)

(assert (=> b!1097369 (= lt!490523 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2297 (Int (_ BitVec 64)) V!41283)

(assert (=> b!1097369 (= lt!490525 (array!71148 (store (arr!34245 _values!874) i!650 (ValueCellFull!12849 (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34781 _values!874)))))

(assert (=> b!1097369 (= lt!490517 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097369 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490521 () Unit!36104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71145 (_ BitVec 64) (_ BitVec 32)) Unit!36104)

(assert (=> b!1097369 (= lt!490521 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097370 () Bool)

(assert (=> b!1097370 (= e!626299 tp_is_empty!27117)))

(declare-fun b!1097371 () Bool)

(assert (=> b!1097371 (= e!626305 e!626303)))

(declare-fun res!732427 () Bool)

(assert (=> b!1097371 (=> (not res!732427) (not e!626303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71145 (_ BitVec 32)) Bool)

(assert (=> b!1097371 (= res!732427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490518 mask!1414))))

(assert (=> b!1097371 (= lt!490518 (array!71146 (store (arr!34244 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34780 _keys!1070)))))

(declare-fun b!1097372 () Bool)

(declare-fun res!732435 () Bool)

(assert (=> b!1097372 (=> (not res!732435) (not e!626305))))

(assert (=> b!1097372 (= res!732435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42436 () Bool)

(assert (=> mapIsEmpty!42436 mapRes!42436))

(declare-fun res!732434 () Bool)

(assert (=> start!96488 (=> (not res!732434) (not e!626305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96488 (= res!732434 (validMask!0 mask!1414))))

(assert (=> start!96488 e!626305))

(assert (=> start!96488 tp!81128))

(assert (=> start!96488 true))

(assert (=> start!96488 tp_is_empty!27117))

(declare-fun array_inv!26382 (array!71145) Bool)

(assert (=> start!96488 (array_inv!26382 _keys!1070)))

(declare-fun array_inv!26383 (array!71147) Bool)

(assert (=> start!96488 (and (array_inv!26383 _values!874) e!626300)))

(declare-fun b!1097363 () Bool)

(declare-fun res!732432 () Bool)

(assert (=> b!1097363 (=> (not res!732432) (not e!626305))))

(assert (=> b!1097363 (= res!732432 (= (select (arr!34244 _keys!1070) i!650) k0!904))))

(declare-fun b!1097373 () Bool)

(declare-fun +!3356 (ListLongMap!15261 tuple2!17292) ListLongMap!15261)

(assert (=> b!1097373 (= e!626301 (= lt!490524 (+!3356 (+!3356 lt!490523 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun mapNonEmpty!42436 () Bool)

(declare-fun tp!81127 () Bool)

(assert (=> mapNonEmpty!42436 (= mapRes!42436 (and tp!81127 e!626304))))

(declare-fun mapRest!42436 () (Array (_ BitVec 32) ValueCell!12849))

(declare-fun mapValue!42436 () ValueCell!12849)

(declare-fun mapKey!42436 () (_ BitVec 32))

(assert (=> mapNonEmpty!42436 (= (arr!34245 _values!874) (store mapRest!42436 mapKey!42436 mapValue!42436))))

(declare-fun b!1097374 () Bool)

(declare-fun res!732431 () Bool)

(assert (=> b!1097374 (=> (not res!732431) (not e!626305))))

(assert (=> b!1097374 (= res!732431 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34780 _keys!1070))))))

(declare-fun b!1097375 () Bool)

(declare-fun res!732429 () Bool)

(assert (=> b!1097375 (=> (not res!732429) (not e!626305))))

(assert (=> b!1097375 (= res!732429 (and (= (size!34781 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34780 _keys!1070) (size!34781 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96488 res!732434) b!1097375))

(assert (= (and b!1097375 res!732429) b!1097372))

(assert (= (and b!1097372 res!732435) b!1097367))

(assert (= (and b!1097367 res!732428) b!1097374))

(assert (= (and b!1097374 res!732431) b!1097368))

(assert (= (and b!1097368 res!732433) b!1097363))

(assert (= (and b!1097363 res!732432) b!1097371))

(assert (= (and b!1097371 res!732427) b!1097365))

(assert (= (and b!1097365 res!732436) b!1097369))

(assert (= (and b!1097369 (not res!732430)) b!1097373))

(assert (= (and b!1097366 condMapEmpty!42436) mapIsEmpty!42436))

(assert (= (and b!1097366 (not condMapEmpty!42436)) mapNonEmpty!42436))

(get-info :version)

(assert (= (and mapNonEmpty!42436 ((_ is ValueCellFull!12849) mapValue!42436)) b!1097364))

(assert (= (and b!1097366 ((_ is ValueCellFull!12849) mapDefault!42436)) b!1097370))

(assert (= start!96488 b!1097366))

(declare-fun b_lambda!17725 () Bool)

(assert (=> (not b_lambda!17725) (not b!1097369)))

(declare-fun t!34026 () Bool)

(declare-fun tb!7933 () Bool)

(assert (=> (and start!96488 (= defaultEntry!882 defaultEntry!882) t!34026) tb!7933))

(declare-fun result!16389 () Bool)

(assert (=> tb!7933 (= result!16389 tp_is_empty!27117)))

(assert (=> b!1097369 t!34026))

(declare-fun b_and!36799 () Bool)

(assert (= b_and!36797 (and (=> t!34026 result!16389) b_and!36799)))

(declare-fun m!1016841 () Bool)

(assert (=> b!1097373 m!1016841))

(assert (=> b!1097373 m!1016841))

(declare-fun m!1016843 () Bool)

(assert (=> b!1097373 m!1016843))

(declare-fun m!1016845 () Bool)

(assert (=> b!1097368 m!1016845))

(declare-fun m!1016847 () Bool)

(assert (=> b!1097369 m!1016847))

(declare-fun m!1016849 () Bool)

(assert (=> b!1097369 m!1016849))

(declare-fun m!1016851 () Bool)

(assert (=> b!1097369 m!1016851))

(declare-fun m!1016853 () Bool)

(assert (=> b!1097369 m!1016853))

(declare-fun m!1016855 () Bool)

(assert (=> b!1097369 m!1016855))

(declare-fun m!1016857 () Bool)

(assert (=> b!1097369 m!1016857))

(declare-fun m!1016859 () Bool)

(assert (=> b!1097369 m!1016859))

(declare-fun m!1016861 () Bool)

(assert (=> b!1097369 m!1016861))

(declare-fun m!1016863 () Bool)

(assert (=> b!1097369 m!1016863))

(declare-fun m!1016865 () Bool)

(assert (=> b!1097369 m!1016865))

(declare-fun m!1016867 () Bool)

(assert (=> mapNonEmpty!42436 m!1016867))

(declare-fun m!1016869 () Bool)

(assert (=> b!1097363 m!1016869))

(declare-fun m!1016871 () Bool)

(assert (=> start!96488 m!1016871))

(declare-fun m!1016873 () Bool)

(assert (=> start!96488 m!1016873))

(declare-fun m!1016875 () Bool)

(assert (=> start!96488 m!1016875))

(declare-fun m!1016877 () Bool)

(assert (=> b!1097371 m!1016877))

(declare-fun m!1016879 () Bool)

(assert (=> b!1097371 m!1016879))

(declare-fun m!1016881 () Bool)

(assert (=> b!1097367 m!1016881))

(declare-fun m!1016883 () Bool)

(assert (=> b!1097365 m!1016883))

(declare-fun m!1016885 () Bool)

(assert (=> b!1097372 m!1016885))

(check-sat (not b!1097367) (not b!1097372) b_and!36799 (not b_lambda!17725) (not start!96488) (not b!1097369) (not b_next!23067) (not b!1097368) (not b!1097373) (not b!1097371) tp_is_empty!27117 (not b!1097365) (not mapNonEmpty!42436))
(check-sat b_and!36799 (not b_next!23067))
(get-model)

(declare-fun b_lambda!17729 () Bool)

(assert (= b_lambda!17725 (or (and start!96488 b_free!23067) b_lambda!17729)))

(check-sat (not b!1097372) b_and!36799 (not start!96488) (not b!1097369) (not b_lambda!17729) (not b!1097367) (not b_next!23067) (not b!1097368) (not b!1097373) (not b!1097371) tp_is_empty!27117 (not b!1097365) (not mapNonEmpty!42436))
(check-sat b_and!36799 (not b_next!23067))
(get-model)

(declare-fun d!130293 () Bool)

(assert (=> d!130293 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96488 d!130293))

(declare-fun d!130295 () Bool)

(assert (=> d!130295 (= (array_inv!26382 _keys!1070) (bvsge (size!34780 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96488 d!130295))

(declare-fun d!130297 () Bool)

(assert (=> d!130297 (= (array_inv!26383 _values!874) (bvsge (size!34781 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96488 d!130297))

(declare-fun b!1097427 () Bool)

(declare-fun e!626335 () Bool)

(declare-fun call!45767 () Bool)

(assert (=> b!1097427 (= e!626335 call!45767)))

(declare-fun b!1097428 () Bool)

(declare-fun e!626333 () Bool)

(assert (=> b!1097428 (= e!626333 call!45767)))

(declare-fun b!1097429 () Bool)

(declare-fun e!626334 () Bool)

(assert (=> b!1097429 (= e!626334 e!626335)))

(declare-fun c!108361 () Bool)

(assert (=> b!1097429 (= c!108361 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097430 () Bool)

(assert (=> b!1097430 (= e!626335 e!626333)))

(declare-fun lt!490559 () (_ BitVec 64))

(assert (=> b!1097430 (= lt!490559 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490561 () Unit!36104)

(assert (=> b!1097430 (= lt!490561 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!490559 #b00000000000000000000000000000000))))

(assert (=> b!1097430 (arrayContainsKey!0 _keys!1070 lt!490559 #b00000000000000000000000000000000)))

(declare-fun lt!490560 () Unit!36104)

(assert (=> b!1097430 (= lt!490560 lt!490561)))

(declare-fun res!732472 () Bool)

(declare-datatypes ((SeekEntryResult!9906 0))(
  ( (MissingZero!9906 (index!41995 (_ BitVec 32))) (Found!9906 (index!41996 (_ BitVec 32))) (Intermediate!9906 (undefined!10718 Bool) (index!41997 (_ BitVec 32)) (x!98710 (_ BitVec 32))) (Undefined!9906) (MissingVacant!9906 (index!41998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71145 (_ BitVec 32)) SeekEntryResult!9906)

(assert (=> b!1097430 (= res!732472 (= (seekEntryOrOpen!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1097430 (=> (not res!732472) (not e!626333))))

(declare-fun bm!45764 () Bool)

(assert (=> bm!45764 (= call!45767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun d!130299 () Bool)

(declare-fun res!732471 () Bool)

(assert (=> d!130299 (=> res!732471 e!626334)))

(assert (=> d!130299 (= res!732471 (bvsge #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> d!130299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!626334)))

(assert (= (and d!130299 (not res!732471)) b!1097429))

(assert (= (and b!1097429 c!108361) b!1097430))

(assert (= (and b!1097429 (not c!108361)) b!1097427))

(assert (= (and b!1097430 res!732472) b!1097428))

(assert (= (or b!1097428 b!1097427) bm!45764))

(declare-fun m!1016933 () Bool)

(assert (=> b!1097429 m!1016933))

(assert (=> b!1097429 m!1016933))

(declare-fun m!1016935 () Bool)

(assert (=> b!1097429 m!1016935))

(assert (=> b!1097430 m!1016933))

(declare-fun m!1016937 () Bool)

(assert (=> b!1097430 m!1016937))

(declare-fun m!1016939 () Bool)

(assert (=> b!1097430 m!1016939))

(assert (=> b!1097430 m!1016933))

(declare-fun m!1016941 () Bool)

(assert (=> b!1097430 m!1016941))

(declare-fun m!1016943 () Bool)

(assert (=> bm!45764 m!1016943))

(assert (=> b!1097372 d!130299))

(declare-fun d!130301 () Bool)

(declare-fun res!732480 () Bool)

(declare-fun e!626347 () Bool)

(assert (=> d!130301 (=> res!732480 e!626347)))

(assert (=> d!130301 (= res!732480 (bvsge #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> d!130301 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23911) e!626347)))

(declare-fun b!1097441 () Bool)

(declare-fun e!626345 () Bool)

(declare-fun call!45770 () Bool)

(assert (=> b!1097441 (= e!626345 call!45770)))

(declare-fun bm!45767 () Bool)

(declare-fun c!108364 () Bool)

(assert (=> bm!45767 (= call!45770 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108364 (Cons!23910 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000) Nil!23911) Nil!23911)))))

(declare-fun b!1097442 () Bool)

(assert (=> b!1097442 (= e!626345 call!45770)))

(declare-fun b!1097443 () Bool)

(declare-fun e!626346 () Bool)

(assert (=> b!1097443 (= e!626347 e!626346)))

(declare-fun res!732481 () Bool)

(assert (=> b!1097443 (=> (not res!732481) (not e!626346))))

(declare-fun e!626344 () Bool)

(assert (=> b!1097443 (= res!732481 (not e!626344))))

(declare-fun res!732479 () Bool)

(assert (=> b!1097443 (=> (not res!732479) (not e!626344))))

(assert (=> b!1097443 (= res!732479 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097444 () Bool)

(declare-fun contains!6377 (List!23914 (_ BitVec 64)) Bool)

(assert (=> b!1097444 (= e!626344 (contains!6377 Nil!23911 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097445 () Bool)

(assert (=> b!1097445 (= e!626346 e!626345)))

(assert (=> b!1097445 (= c!108364 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130301 (not res!732480)) b!1097443))

(assert (= (and b!1097443 res!732479) b!1097444))

(assert (= (and b!1097443 res!732481) b!1097445))

(assert (= (and b!1097445 c!108364) b!1097441))

(assert (= (and b!1097445 (not c!108364)) b!1097442))

(assert (= (or b!1097441 b!1097442) bm!45767))

(assert (=> bm!45767 m!1016933))

(declare-fun m!1016945 () Bool)

(assert (=> bm!45767 m!1016945))

(assert (=> b!1097443 m!1016933))

(assert (=> b!1097443 m!1016933))

(assert (=> b!1097443 m!1016935))

(assert (=> b!1097444 m!1016933))

(assert (=> b!1097444 m!1016933))

(declare-fun m!1016947 () Bool)

(assert (=> b!1097444 m!1016947))

(assert (=> b!1097445 m!1016933))

(assert (=> b!1097445 m!1016933))

(assert (=> b!1097445 m!1016935))

(assert (=> b!1097367 d!130301))

(declare-fun d!130303 () Bool)

(declare-fun e!626350 () Bool)

(assert (=> d!130303 e!626350))

(declare-fun res!732487 () Bool)

(assert (=> d!130303 (=> (not res!732487) (not e!626350))))

(declare-fun lt!490573 () ListLongMap!15261)

(declare-fun contains!6378 (ListLongMap!15261 (_ BitVec 64)) Bool)

(assert (=> d!130303 (= res!732487 (contains!6378 lt!490573 (_1!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lt!490571 () List!23915)

(assert (=> d!130303 (= lt!490573 (ListLongMap!15262 lt!490571))))

(declare-fun lt!490572 () Unit!36104)

(declare-fun lt!490570 () Unit!36104)

(assert (=> d!130303 (= lt!490572 lt!490570)))

(declare-datatypes ((Option!669 0))(
  ( (Some!668 (v!16238 V!41283)) (None!667) )
))
(declare-fun getValueByKey!618 (List!23915 (_ BitVec 64)) Option!669)

(assert (=> d!130303 (= (getValueByKey!618 lt!490571 (_1!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!668 (_2!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun lemmaContainsTupThenGetReturnValue!295 (List!23915 (_ BitVec 64) V!41283) Unit!36104)

(assert (=> d!130303 (= lt!490570 (lemmaContainsTupThenGetReturnValue!295 lt!490571 (_1!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun insertStrictlySorted!388 (List!23915 (_ BitVec 64) V!41283) List!23915)

(assert (=> d!130303 (= lt!490571 (insertStrictlySorted!388 (toList!7646 (+!3356 lt!490523 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (_1!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) (_2!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(assert (=> d!130303 (= (+!3356 (+!3356 lt!490523 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)) lt!490573)))

(declare-fun b!1097450 () Bool)

(declare-fun res!732486 () Bool)

(assert (=> b!1097450 (=> (not res!732486) (not e!626350))))

(assert (=> b!1097450 (= res!732486 (= (getValueByKey!618 (toList!7646 lt!490573) (_1!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))) (Some!668 (_2!8657 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))))

(declare-fun b!1097451 () Bool)

(declare-fun contains!6379 (List!23915 tuple2!17292) Bool)

(assert (=> b!1097451 (= e!626350 (contains!6379 (toList!7646 lt!490573) (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(assert (= (and d!130303 res!732487) b!1097450))

(assert (= (and b!1097450 res!732486) b!1097451))

(declare-fun m!1016949 () Bool)

(assert (=> d!130303 m!1016949))

(declare-fun m!1016951 () Bool)

(assert (=> d!130303 m!1016951))

(declare-fun m!1016953 () Bool)

(assert (=> d!130303 m!1016953))

(declare-fun m!1016955 () Bool)

(assert (=> d!130303 m!1016955))

(declare-fun m!1016957 () Bool)

(assert (=> b!1097450 m!1016957))

(declare-fun m!1016959 () Bool)

(assert (=> b!1097451 m!1016959))

(assert (=> b!1097373 d!130303))

(declare-fun d!130305 () Bool)

(declare-fun e!626351 () Bool)

(assert (=> d!130305 e!626351))

(declare-fun res!732489 () Bool)

(assert (=> d!130305 (=> (not res!732489) (not e!626351))))

(declare-fun lt!490577 () ListLongMap!15261)

(assert (=> d!130305 (= res!732489 (contains!6378 lt!490577 (_1!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(declare-fun lt!490575 () List!23915)

(assert (=> d!130305 (= lt!490577 (ListLongMap!15262 lt!490575))))

(declare-fun lt!490576 () Unit!36104)

(declare-fun lt!490574 () Unit!36104)

(assert (=> d!130305 (= lt!490576 lt!490574)))

(assert (=> d!130305 (= (getValueByKey!618 lt!490575 (_1!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!668 (_2!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130305 (= lt!490574 (lemmaContainsTupThenGetReturnValue!295 lt!490575 (_1!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130305 (= lt!490575 (insertStrictlySorted!388 (toList!7646 lt!490523) (_1!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) (_2!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))))

(assert (=> d!130305 (= (+!3356 lt!490523 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)) lt!490577)))

(declare-fun b!1097452 () Bool)

(declare-fun res!732488 () Bool)

(assert (=> b!1097452 (=> (not res!732488) (not e!626351))))

(assert (=> b!1097452 (= res!732488 (= (getValueByKey!618 (toList!7646 lt!490577) (_1!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))) (Some!668 (_2!8657 (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))))

(declare-fun b!1097453 () Bool)

(assert (=> b!1097453 (= e!626351 (contains!6379 (toList!7646 lt!490577) (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831)))))

(assert (= (and d!130305 res!732489) b!1097452))

(assert (= (and b!1097452 res!732488) b!1097453))

(declare-fun m!1016961 () Bool)

(assert (=> d!130305 m!1016961))

(declare-fun m!1016963 () Bool)

(assert (=> d!130305 m!1016963))

(declare-fun m!1016965 () Bool)

(assert (=> d!130305 m!1016965))

(declare-fun m!1016967 () Bool)

(assert (=> d!130305 m!1016967))

(declare-fun m!1016969 () Bool)

(assert (=> b!1097452 m!1016969))

(declare-fun m!1016971 () Bool)

(assert (=> b!1097453 m!1016971))

(assert (=> b!1097373 d!130305))

(declare-fun d!130307 () Bool)

(declare-fun res!732494 () Bool)

(declare-fun e!626356 () Bool)

(assert (=> d!130307 (=> res!732494 e!626356)))

(assert (=> d!130307 (= res!732494 (= (select (arr!34244 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130307 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!626356)))

(declare-fun b!1097458 () Bool)

(declare-fun e!626357 () Bool)

(assert (=> b!1097458 (= e!626356 e!626357)))

(declare-fun res!732495 () Bool)

(assert (=> b!1097458 (=> (not res!732495) (not e!626357))))

(assert (=> b!1097458 (= res!732495 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34780 _keys!1070)))))

(declare-fun b!1097459 () Bool)

(assert (=> b!1097459 (= e!626357 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130307 (not res!732494)) b!1097458))

(assert (= (and b!1097458 res!732495) b!1097459))

(assert (=> d!130307 m!1016933))

(declare-fun m!1016973 () Bool)

(assert (=> b!1097459 m!1016973))

(assert (=> b!1097369 d!130307))

(declare-fun b!1097502 () Bool)

(declare-fun e!626390 () Bool)

(declare-fun e!626387 () Bool)

(assert (=> b!1097502 (= e!626390 e!626387)))

(declare-fun res!732517 () Bool)

(declare-fun call!45786 () Bool)

(assert (=> b!1097502 (= res!732517 call!45786)))

(assert (=> b!1097502 (=> (not res!732517) (not e!626387))))

(declare-fun b!1097503 () Bool)

(declare-fun e!626386 () Bool)

(assert (=> b!1097503 (= e!626386 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097504 () Bool)

(declare-fun e!626393 () Bool)

(declare-fun call!45787 () Bool)

(assert (=> b!1097504 (= e!626393 (not call!45787))))

(declare-fun bm!45782 () Bool)

(declare-fun call!45785 () ListLongMap!15261)

(assert (=> bm!45782 (= call!45785 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097505 () Bool)

(declare-fun e!626396 () ListLongMap!15261)

(declare-fun e!626389 () ListLongMap!15261)

(assert (=> b!1097505 (= e!626396 e!626389)))

(declare-fun c!108377 () Bool)

(assert (=> b!1097505 (= c!108377 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097506 () Bool)

(declare-fun e!626392 () Bool)

(assert (=> b!1097506 (= e!626393 e!626392)))

(declare-fun res!732520 () Bool)

(assert (=> b!1097506 (= res!732520 call!45787)))

(assert (=> b!1097506 (=> (not res!732520) (not e!626392))))

(declare-fun call!45788 () ListLongMap!15261)

(declare-fun c!108381 () Bool)

(declare-fun call!45790 () ListLongMap!15261)

(declare-fun bm!45783 () Bool)

(declare-fun call!45789 () ListLongMap!15261)

(assert (=> bm!45783 (= call!45788 (+!3356 (ite c!108381 call!45785 (ite c!108377 call!45790 call!45789)) (ite (or c!108381 c!108377) (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097507 () Bool)

(declare-fun c!108378 () Bool)

(assert (=> b!1097507 (= c!108378 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626388 () ListLongMap!15261)

(assert (=> b!1097507 (= e!626389 e!626388)))

(declare-fun b!1097508 () Bool)

(declare-fun e!626394 () Bool)

(declare-fun e!626395 () Bool)

(assert (=> b!1097508 (= e!626394 e!626395)))

(declare-fun res!732522 () Bool)

(assert (=> b!1097508 (=> (not res!732522) (not e!626395))))

(declare-fun lt!490624 () ListLongMap!15261)

(assert (=> b!1097508 (= res!732522 (contains!6378 lt!490624 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097508 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun b!1097509 () Bool)

(declare-fun res!732518 () Bool)

(declare-fun e!626391 () Bool)

(assert (=> b!1097509 (=> (not res!732518) (not e!626391))))

(assert (=> b!1097509 (= res!732518 e!626394)))

(declare-fun res!732515 () Bool)

(assert (=> b!1097509 (=> res!732515 e!626394)))

(assert (=> b!1097509 (= res!732515 (not e!626386))))

(declare-fun res!732521 () Bool)

(assert (=> b!1097509 (=> (not res!732521) (not e!626386))))

(assert (=> b!1097509 (= res!732521 (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun b!1097510 () Bool)

(assert (=> b!1097510 (= e!626396 (+!3356 call!45788 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1097511 () Bool)

(assert (=> b!1097511 (= e!626391 e!626393)))

(declare-fun c!108379 () Bool)

(assert (=> b!1097511 (= c!108379 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45784 () Bool)

(assert (=> bm!45784 (= call!45786 (contains!6378 lt!490624 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097512 () Bool)

(declare-fun apply!943 (ListLongMap!15261 (_ BitVec 64)) V!41283)

(declare-fun get!17611 (ValueCell!12849 V!41283) V!41283)

(assert (=> b!1097512 (= e!626395 (= (apply!943 lt!490624 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)) (get!17611 (select (arr!34245 _values!874) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34781 _values!874)))))

(assert (=> b!1097512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun bm!45785 () Bool)

(assert (=> bm!45785 (= call!45790 call!45785)))

(declare-fun bm!45786 () Bool)

(assert (=> bm!45786 (= call!45787 (contains!6378 lt!490624 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097513 () Bool)

(declare-fun e!626385 () Unit!36104)

(declare-fun lt!490630 () Unit!36104)

(assert (=> b!1097513 (= e!626385 lt!490630)))

(declare-fun lt!490640 () ListLongMap!15261)

(assert (=> b!1097513 (= lt!490640 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490629 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490629 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490638 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490638 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490631 () Unit!36104)

(declare-fun addStillContains!656 (ListLongMap!15261 (_ BitVec 64) V!41283 (_ BitVec 64)) Unit!36104)

(assert (=> b!1097513 (= lt!490631 (addStillContains!656 lt!490640 lt!490629 zeroValue!831 lt!490638))))

(assert (=> b!1097513 (contains!6378 (+!3356 lt!490640 (tuple2!17293 lt!490629 zeroValue!831)) lt!490638)))

(declare-fun lt!490625 () Unit!36104)

(assert (=> b!1097513 (= lt!490625 lt!490631)))

(declare-fun lt!490626 () ListLongMap!15261)

(assert (=> b!1097513 (= lt!490626 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490628 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490628 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490633 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490633 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490622 () Unit!36104)

(declare-fun addApplyDifferent!516 (ListLongMap!15261 (_ BitVec 64) V!41283 (_ BitVec 64)) Unit!36104)

(assert (=> b!1097513 (= lt!490622 (addApplyDifferent!516 lt!490626 lt!490628 minValue!831 lt!490633))))

(assert (=> b!1097513 (= (apply!943 (+!3356 lt!490626 (tuple2!17293 lt!490628 minValue!831)) lt!490633) (apply!943 lt!490626 lt!490633))))

(declare-fun lt!490642 () Unit!36104)

(assert (=> b!1097513 (= lt!490642 lt!490622)))

(declare-fun lt!490637 () ListLongMap!15261)

(assert (=> b!1097513 (= lt!490637 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490639 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490639 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490635 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490635 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!490641 () Unit!36104)

(assert (=> b!1097513 (= lt!490641 (addApplyDifferent!516 lt!490637 lt!490639 zeroValue!831 lt!490635))))

(assert (=> b!1097513 (= (apply!943 (+!3356 lt!490637 (tuple2!17293 lt!490639 zeroValue!831)) lt!490635) (apply!943 lt!490637 lt!490635))))

(declare-fun lt!490632 () Unit!36104)

(assert (=> b!1097513 (= lt!490632 lt!490641)))

(declare-fun lt!490636 () ListLongMap!15261)

(assert (=> b!1097513 (= lt!490636 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490634 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490634 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490643 () (_ BitVec 64))

(assert (=> b!1097513 (= lt!490643 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097513 (= lt!490630 (addApplyDifferent!516 lt!490636 lt!490634 minValue!831 lt!490643))))

(assert (=> b!1097513 (= (apply!943 (+!3356 lt!490636 (tuple2!17293 lt!490634 minValue!831)) lt!490643) (apply!943 lt!490636 lt!490643))))

(declare-fun bm!45787 () Bool)

(declare-fun call!45791 () ListLongMap!15261)

(assert (=> bm!45787 (= call!45791 call!45788)))

(declare-fun b!1097514 () Bool)

(declare-fun Unit!36106 () Unit!36104)

(assert (=> b!1097514 (= e!626385 Unit!36106)))

(declare-fun bm!45788 () Bool)

(assert (=> bm!45788 (= call!45789 call!45790)))

(declare-fun b!1097515 () Bool)

(assert (=> b!1097515 (= e!626388 call!45789)))

(declare-fun b!1097516 () Bool)

(assert (=> b!1097516 (= e!626390 (not call!45786))))

(declare-fun b!1097517 () Bool)

(declare-fun res!732516 () Bool)

(assert (=> b!1097517 (=> (not res!732516) (not e!626391))))

(assert (=> b!1097517 (= res!732516 e!626390)))

(declare-fun c!108382 () Bool)

(assert (=> b!1097517 (= c!108382 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097518 () Bool)

(declare-fun e!626384 () Bool)

(assert (=> b!1097518 (= e!626384 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097519 () Bool)

(assert (=> b!1097519 (= e!626388 call!45791)))

(declare-fun b!1097520 () Bool)

(assert (=> b!1097520 (= e!626387 (= (apply!943 lt!490624 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097521 () Bool)

(assert (=> b!1097521 (= e!626392 (= (apply!943 lt!490624 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097522 () Bool)

(assert (=> b!1097522 (= e!626389 call!45791)))

(declare-fun d!130309 () Bool)

(assert (=> d!130309 e!626391))

(declare-fun res!732514 () Bool)

(assert (=> d!130309 (=> (not res!732514) (not e!626391))))

(assert (=> d!130309 (= res!732514 (or (bvsge #b00000000000000000000000000000000 (size!34780 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))))

(declare-fun lt!490627 () ListLongMap!15261)

(assert (=> d!130309 (= lt!490624 lt!490627)))

(declare-fun lt!490623 () Unit!36104)

(assert (=> d!130309 (= lt!490623 e!626385)))

(declare-fun c!108380 () Bool)

(assert (=> d!130309 (= c!108380 e!626384)))

(declare-fun res!732519 () Bool)

(assert (=> d!130309 (=> (not res!732519) (not e!626384))))

(assert (=> d!130309 (= res!732519 (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> d!130309 (= lt!490627 e!626396)))

(assert (=> d!130309 (= c!108381 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130309 (validMask!0 mask!1414)))

(assert (=> d!130309 (= (getCurrentListMap!4366 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490624)))

(assert (= (and d!130309 c!108381) b!1097510))

(assert (= (and d!130309 (not c!108381)) b!1097505))

(assert (= (and b!1097505 c!108377) b!1097522))

(assert (= (and b!1097505 (not c!108377)) b!1097507))

(assert (= (and b!1097507 c!108378) b!1097519))

(assert (= (and b!1097507 (not c!108378)) b!1097515))

(assert (= (or b!1097519 b!1097515) bm!45788))

(assert (= (or b!1097522 bm!45788) bm!45785))

(assert (= (or b!1097522 b!1097519) bm!45787))

(assert (= (or b!1097510 bm!45785) bm!45782))

(assert (= (or b!1097510 bm!45787) bm!45783))

(assert (= (and d!130309 res!732519) b!1097518))

(assert (= (and d!130309 c!108380) b!1097513))

(assert (= (and d!130309 (not c!108380)) b!1097514))

(assert (= (and d!130309 res!732514) b!1097509))

(assert (= (and b!1097509 res!732521) b!1097503))

(assert (= (and b!1097509 (not res!732515)) b!1097508))

(assert (= (and b!1097508 res!732522) b!1097512))

(assert (= (and b!1097509 res!732518) b!1097517))

(assert (= (and b!1097517 c!108382) b!1097502))

(assert (= (and b!1097517 (not c!108382)) b!1097516))

(assert (= (and b!1097502 res!732517) b!1097520))

(assert (= (or b!1097502 b!1097516) bm!45784))

(assert (= (and b!1097517 res!732516) b!1097511))

(assert (= (and b!1097511 c!108379) b!1097506))

(assert (= (and b!1097511 (not c!108379)) b!1097504))

(assert (= (and b!1097506 res!732520) b!1097521))

(assert (= (or b!1097506 b!1097504) bm!45786))

(declare-fun b_lambda!17731 () Bool)

(assert (=> (not b_lambda!17731) (not b!1097512)))

(assert (=> b!1097512 t!34026))

(declare-fun b_and!36805 () Bool)

(assert (= b_and!36799 (and (=> t!34026 result!16389) b_and!36805)))

(assert (=> b!1097518 m!1016933))

(assert (=> b!1097518 m!1016933))

(assert (=> b!1097518 m!1016935))

(declare-fun m!1016975 () Bool)

(assert (=> b!1097520 m!1016975))

(assert (=> b!1097512 m!1016847))

(declare-fun m!1016977 () Bool)

(assert (=> b!1097512 m!1016977))

(assert (=> b!1097512 m!1016933))

(declare-fun m!1016979 () Bool)

(assert (=> b!1097512 m!1016979))

(assert (=> b!1097512 m!1016977))

(assert (=> b!1097512 m!1016847))

(declare-fun m!1016981 () Bool)

(assert (=> b!1097512 m!1016981))

(assert (=> b!1097512 m!1016933))

(assert (=> b!1097503 m!1016933))

(assert (=> b!1097503 m!1016933))

(assert (=> b!1097503 m!1016935))

(assert (=> bm!45782 m!1016865))

(assert (=> b!1097508 m!1016933))

(assert (=> b!1097508 m!1016933))

(declare-fun m!1016983 () Bool)

(assert (=> b!1097508 m!1016983))

(declare-fun m!1016985 () Bool)

(assert (=> bm!45783 m!1016985))

(assert (=> d!130309 m!1016871))

(declare-fun m!1016987 () Bool)

(assert (=> b!1097521 m!1016987))

(declare-fun m!1016989 () Bool)

(assert (=> bm!45786 m!1016989))

(declare-fun m!1016991 () Bool)

(assert (=> bm!45784 m!1016991))

(declare-fun m!1016993 () Bool)

(assert (=> b!1097510 m!1016993))

(declare-fun m!1016995 () Bool)

(assert (=> b!1097513 m!1016995))

(declare-fun m!1016997 () Bool)

(assert (=> b!1097513 m!1016997))

(declare-fun m!1016999 () Bool)

(assert (=> b!1097513 m!1016999))

(declare-fun m!1017001 () Bool)

(assert (=> b!1097513 m!1017001))

(declare-fun m!1017003 () Bool)

(assert (=> b!1097513 m!1017003))

(assert (=> b!1097513 m!1016999))

(declare-fun m!1017005 () Bool)

(assert (=> b!1097513 m!1017005))

(declare-fun m!1017007 () Bool)

(assert (=> b!1097513 m!1017007))

(assert (=> b!1097513 m!1016933))

(assert (=> b!1097513 m!1016865))

(declare-fun m!1017009 () Bool)

(assert (=> b!1097513 m!1017009))

(declare-fun m!1017011 () Bool)

(assert (=> b!1097513 m!1017011))

(declare-fun m!1017013 () Bool)

(assert (=> b!1097513 m!1017013))

(declare-fun m!1017015 () Bool)

(assert (=> b!1097513 m!1017015))

(declare-fun m!1017017 () Bool)

(assert (=> b!1097513 m!1017017))

(assert (=> b!1097513 m!1017001))

(declare-fun m!1017019 () Bool)

(assert (=> b!1097513 m!1017019))

(declare-fun m!1017021 () Bool)

(assert (=> b!1097513 m!1017021))

(assert (=> b!1097513 m!1016997))

(declare-fun m!1017023 () Bool)

(assert (=> b!1097513 m!1017023))

(assert (=> b!1097513 m!1017019))

(assert (=> b!1097369 d!130309))

(declare-fun d!130311 () Bool)

(declare-fun lt!490646 () ListLongMap!15261)

(assert (=> d!130311 (not (contains!6378 lt!490646 k0!904))))

(declare-fun removeStrictlySorted!77 (List!23915 (_ BitVec 64)) List!23915)

(assert (=> d!130311 (= lt!490646 (ListLongMap!15262 (removeStrictlySorted!77 (toList!7646 lt!490517) k0!904)))))

(assert (=> d!130311 (= (-!936 lt!490517 k0!904) lt!490646)))

(declare-fun bs!32254 () Bool)

(assert (= bs!32254 d!130311))

(declare-fun m!1017025 () Bool)

(assert (=> bs!32254 m!1017025))

(declare-fun m!1017027 () Bool)

(assert (=> bs!32254 m!1017027))

(assert (=> b!1097369 d!130311))

(declare-fun call!45796 () ListLongMap!15261)

(declare-fun bm!45793 () Bool)

(assert (=> bm!45793 (= call!45796 (getCurrentListMapNoExtraKeys!4162 (array!71146 (store (arr!34244 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34780 _keys!1070)) (array!71148 (store (arr!34245 _values!874) i!650 (ValueCellFull!12849 (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34781 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097529 () Bool)

(declare-fun e!626402 () Bool)

(declare-fun e!626401 () Bool)

(assert (=> b!1097529 (= e!626402 e!626401)))

(declare-fun c!108385 () Bool)

(assert (=> b!1097529 (= c!108385 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1097530 () Bool)

(declare-fun call!45797 () ListLongMap!15261)

(assert (=> b!1097530 (= e!626401 (= call!45796 (-!936 call!45797 k0!904)))))

(assert (=> b!1097530 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34781 _values!874)))))

(declare-fun bm!45794 () Bool)

(assert (=> bm!45794 (= call!45797 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097531 () Bool)

(assert (=> b!1097531 (= e!626401 (= call!45796 call!45797))))

(assert (=> b!1097531 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34781 _values!874)))))

(declare-fun d!130313 () Bool)

(assert (=> d!130313 e!626402))

(declare-fun res!732525 () Bool)

(assert (=> d!130313 (=> (not res!732525) (not e!626402))))

(assert (=> d!130313 (= res!732525 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34780 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34780 _keys!1070))))))))

(declare-fun lt!490649 () Unit!36104)

(declare-fun choose!1761 (array!71145 array!71147 (_ BitVec 32) (_ BitVec 32) V!41283 V!41283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36104)

(assert (=> d!130313 (= lt!490649 (choose!1761 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130313 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> d!130313 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!192 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!490649)))

(assert (= (and d!130313 res!732525) b!1097529))

(assert (= (and b!1097529 c!108385) b!1097530))

(assert (= (and b!1097529 (not c!108385)) b!1097531))

(assert (= (or b!1097530 b!1097531) bm!45794))

(assert (= (or b!1097530 b!1097531) bm!45793))

(declare-fun b_lambda!17733 () Bool)

(assert (=> (not b_lambda!17733) (not bm!45793)))

(assert (=> bm!45793 t!34026))

(declare-fun b_and!36807 () Bool)

(assert (= b_and!36805 (and (=> t!34026 result!16389) b_and!36807)))

(assert (=> bm!45793 m!1016879))

(assert (=> bm!45793 m!1016847))

(assert (=> bm!45793 m!1016851))

(declare-fun m!1017029 () Bool)

(assert (=> bm!45793 m!1017029))

(declare-fun m!1017031 () Bool)

(assert (=> b!1097530 m!1017031))

(assert (=> bm!45794 m!1016865))

(declare-fun m!1017033 () Bool)

(assert (=> d!130313 m!1017033))

(assert (=> b!1097369 d!130313))

(declare-fun b!1097532 () Bool)

(declare-fun e!626409 () Bool)

(declare-fun e!626406 () Bool)

(assert (=> b!1097532 (= e!626409 e!626406)))

(declare-fun res!732529 () Bool)

(declare-fun call!45799 () Bool)

(assert (=> b!1097532 (= res!732529 call!45799)))

(assert (=> b!1097532 (=> (not res!732529) (not e!626406))))

(declare-fun b!1097533 () Bool)

(declare-fun e!626405 () Bool)

(assert (=> b!1097533 (= e!626405 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097534 () Bool)

(declare-fun e!626412 () Bool)

(declare-fun call!45800 () Bool)

(assert (=> b!1097534 (= e!626412 (not call!45800))))

(declare-fun bm!45795 () Bool)

(declare-fun call!45798 () ListLongMap!15261)

(assert (=> bm!45795 (= call!45798 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1097535 () Bool)

(declare-fun e!626415 () ListLongMap!15261)

(declare-fun e!626408 () ListLongMap!15261)

(assert (=> b!1097535 (= e!626415 e!626408)))

(declare-fun c!108386 () Bool)

(assert (=> b!1097535 (= c!108386 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1097536 () Bool)

(declare-fun e!626411 () Bool)

(assert (=> b!1097536 (= e!626412 e!626411)))

(declare-fun res!732532 () Bool)

(assert (=> b!1097536 (= res!732532 call!45800)))

(assert (=> b!1097536 (=> (not res!732532) (not e!626411))))

(declare-fun bm!45796 () Bool)

(declare-fun call!45803 () ListLongMap!15261)

(declare-fun call!45801 () ListLongMap!15261)

(declare-fun call!45802 () ListLongMap!15261)

(declare-fun c!108390 () Bool)

(assert (=> bm!45796 (= call!45801 (+!3356 (ite c!108390 call!45798 (ite c!108386 call!45803 call!45802)) (ite (or c!108390 c!108386) (tuple2!17293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1097537 () Bool)

(declare-fun c!108387 () Bool)

(assert (=> b!1097537 (= c!108387 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!626407 () ListLongMap!15261)

(assert (=> b!1097537 (= e!626408 e!626407)))

(declare-fun b!1097538 () Bool)

(declare-fun e!626413 () Bool)

(declare-fun e!626414 () Bool)

(assert (=> b!1097538 (= e!626413 e!626414)))

(declare-fun res!732534 () Bool)

(assert (=> b!1097538 (=> (not res!732534) (not e!626414))))

(declare-fun lt!490652 () ListLongMap!15261)

(assert (=> b!1097538 (= res!732534 (contains!6378 lt!490652 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(assert (=> b!1097538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun b!1097539 () Bool)

(declare-fun res!732530 () Bool)

(declare-fun e!626410 () Bool)

(assert (=> b!1097539 (=> (not res!732530) (not e!626410))))

(assert (=> b!1097539 (= res!732530 e!626413)))

(declare-fun res!732527 () Bool)

(assert (=> b!1097539 (=> res!732527 e!626413)))

(assert (=> b!1097539 (= res!732527 (not e!626405))))

(declare-fun res!732533 () Bool)

(assert (=> b!1097539 (=> (not res!732533) (not e!626405))))

(assert (=> b!1097539 (= res!732533 (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun b!1097540 () Bool)

(assert (=> b!1097540 (= e!626415 (+!3356 call!45801 (tuple2!17293 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1097541 () Bool)

(assert (=> b!1097541 (= e!626410 e!626412)))

(declare-fun c!108388 () Bool)

(assert (=> b!1097541 (= c!108388 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45797 () Bool)

(assert (=> bm!45797 (= call!45799 (contains!6378 lt!490652 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097542 () Bool)

(assert (=> b!1097542 (= e!626414 (= (apply!943 lt!490652 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)) (get!17611 (select (arr!34245 lt!490525) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34781 lt!490525)))))

(assert (=> b!1097542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun bm!45798 () Bool)

(assert (=> bm!45798 (= call!45803 call!45798)))

(declare-fun bm!45799 () Bool)

(assert (=> bm!45799 (= call!45800 (contains!6378 lt!490652 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1097543 () Bool)

(declare-fun e!626404 () Unit!36104)

(declare-fun lt!490658 () Unit!36104)

(assert (=> b!1097543 (= e!626404 lt!490658)))

(declare-fun lt!490668 () ListLongMap!15261)

(assert (=> b!1097543 (= lt!490668 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490657 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490666 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490666 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(declare-fun lt!490659 () Unit!36104)

(assert (=> b!1097543 (= lt!490659 (addStillContains!656 lt!490668 lt!490657 zeroValue!831 lt!490666))))

(assert (=> b!1097543 (contains!6378 (+!3356 lt!490668 (tuple2!17293 lt!490657 zeroValue!831)) lt!490666)))

(declare-fun lt!490653 () Unit!36104)

(assert (=> b!1097543 (= lt!490653 lt!490659)))

(declare-fun lt!490654 () ListLongMap!15261)

(assert (=> b!1097543 (= lt!490654 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490656 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490656 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490661 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490661 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(declare-fun lt!490650 () Unit!36104)

(assert (=> b!1097543 (= lt!490650 (addApplyDifferent!516 lt!490654 lt!490656 minValue!831 lt!490661))))

(assert (=> b!1097543 (= (apply!943 (+!3356 lt!490654 (tuple2!17293 lt!490656 minValue!831)) lt!490661) (apply!943 lt!490654 lt!490661))))

(declare-fun lt!490670 () Unit!36104)

(assert (=> b!1097543 (= lt!490670 lt!490650)))

(declare-fun lt!490665 () ListLongMap!15261)

(assert (=> b!1097543 (= lt!490665 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490667 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490663 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490663 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(declare-fun lt!490669 () Unit!36104)

(assert (=> b!1097543 (= lt!490669 (addApplyDifferent!516 lt!490665 lt!490667 zeroValue!831 lt!490663))))

(assert (=> b!1097543 (= (apply!943 (+!3356 lt!490665 (tuple2!17293 lt!490667 zeroValue!831)) lt!490663) (apply!943 lt!490665 lt!490663))))

(declare-fun lt!490660 () Unit!36104)

(assert (=> b!1097543 (= lt!490660 lt!490669)))

(declare-fun lt!490664 () ListLongMap!15261)

(assert (=> b!1097543 (= lt!490664 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490662 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490662 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!490671 () (_ BitVec 64))

(assert (=> b!1097543 (= lt!490671 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(assert (=> b!1097543 (= lt!490658 (addApplyDifferent!516 lt!490664 lt!490662 minValue!831 lt!490671))))

(assert (=> b!1097543 (= (apply!943 (+!3356 lt!490664 (tuple2!17293 lt!490662 minValue!831)) lt!490671) (apply!943 lt!490664 lt!490671))))

(declare-fun bm!45800 () Bool)

(declare-fun call!45804 () ListLongMap!15261)

(assert (=> bm!45800 (= call!45804 call!45801)))

(declare-fun b!1097544 () Bool)

(declare-fun Unit!36107 () Unit!36104)

(assert (=> b!1097544 (= e!626404 Unit!36107)))

(declare-fun bm!45801 () Bool)

(assert (=> bm!45801 (= call!45802 call!45803)))

(declare-fun b!1097545 () Bool)

(assert (=> b!1097545 (= e!626407 call!45802)))

(declare-fun b!1097546 () Bool)

(assert (=> b!1097546 (= e!626409 (not call!45799))))

(declare-fun b!1097547 () Bool)

(declare-fun res!732528 () Bool)

(assert (=> b!1097547 (=> (not res!732528) (not e!626410))))

(assert (=> b!1097547 (= res!732528 e!626409)))

(declare-fun c!108391 () Bool)

(assert (=> b!1097547 (= c!108391 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1097548 () Bool)

(declare-fun e!626403 () Bool)

(assert (=> b!1097548 (= e!626403 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097549 () Bool)

(assert (=> b!1097549 (= e!626407 call!45804)))

(declare-fun b!1097550 () Bool)

(assert (=> b!1097550 (= e!626406 (= (apply!943 lt!490652 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1097551 () Bool)

(assert (=> b!1097551 (= e!626411 (= (apply!943 lt!490652 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1097552 () Bool)

(assert (=> b!1097552 (= e!626408 call!45804)))

(declare-fun d!130315 () Bool)

(assert (=> d!130315 e!626410))

(declare-fun res!732526 () Bool)

(assert (=> d!130315 (=> (not res!732526) (not e!626410))))

(assert (=> d!130315 (= res!732526 (or (bvsge #b00000000000000000000000000000000 (size!34780 lt!490518)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))))

(declare-fun lt!490655 () ListLongMap!15261)

(assert (=> d!130315 (= lt!490652 lt!490655)))

(declare-fun lt!490651 () Unit!36104)

(assert (=> d!130315 (= lt!490651 e!626404)))

(declare-fun c!108389 () Bool)

(assert (=> d!130315 (= c!108389 e!626403)))

(declare-fun res!732531 () Bool)

(assert (=> d!130315 (=> (not res!732531) (not e!626403))))

(assert (=> d!130315 (= res!732531 (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(assert (=> d!130315 (= lt!490655 e!626415)))

(assert (=> d!130315 (= c!108390 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130315 (validMask!0 mask!1414)))

(assert (=> d!130315 (= (getCurrentListMap!4366 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490652)))

(assert (= (and d!130315 c!108390) b!1097540))

(assert (= (and d!130315 (not c!108390)) b!1097535))

(assert (= (and b!1097535 c!108386) b!1097552))

(assert (= (and b!1097535 (not c!108386)) b!1097537))

(assert (= (and b!1097537 c!108387) b!1097549))

(assert (= (and b!1097537 (not c!108387)) b!1097545))

(assert (= (or b!1097549 b!1097545) bm!45801))

(assert (= (or b!1097552 bm!45801) bm!45798))

(assert (= (or b!1097552 b!1097549) bm!45800))

(assert (= (or b!1097540 bm!45798) bm!45795))

(assert (= (or b!1097540 bm!45800) bm!45796))

(assert (= (and d!130315 res!732531) b!1097548))

(assert (= (and d!130315 c!108389) b!1097543))

(assert (= (and d!130315 (not c!108389)) b!1097544))

(assert (= (and d!130315 res!732526) b!1097539))

(assert (= (and b!1097539 res!732533) b!1097533))

(assert (= (and b!1097539 (not res!732527)) b!1097538))

(assert (= (and b!1097538 res!732534) b!1097542))

(assert (= (and b!1097539 res!732530) b!1097547))

(assert (= (and b!1097547 c!108391) b!1097532))

(assert (= (and b!1097547 (not c!108391)) b!1097546))

(assert (= (and b!1097532 res!732529) b!1097550))

(assert (= (or b!1097532 b!1097546) bm!45797))

(assert (= (and b!1097547 res!732528) b!1097541))

(assert (= (and b!1097541 c!108388) b!1097536))

(assert (= (and b!1097541 (not c!108388)) b!1097534))

(assert (= (and b!1097536 res!732532) b!1097551))

(assert (= (or b!1097536 b!1097534) bm!45799))

(declare-fun b_lambda!17735 () Bool)

(assert (=> (not b_lambda!17735) (not b!1097542)))

(assert (=> b!1097542 t!34026))

(declare-fun b_and!36809 () Bool)

(assert (= b_and!36807 (and (=> t!34026 result!16389) b_and!36809)))

(declare-fun m!1017035 () Bool)

(assert (=> b!1097548 m!1017035))

(assert (=> b!1097548 m!1017035))

(declare-fun m!1017037 () Bool)

(assert (=> b!1097548 m!1017037))

(declare-fun m!1017039 () Bool)

(assert (=> b!1097550 m!1017039))

(assert (=> b!1097542 m!1016847))

(declare-fun m!1017041 () Bool)

(assert (=> b!1097542 m!1017041))

(assert (=> b!1097542 m!1017035))

(declare-fun m!1017043 () Bool)

(assert (=> b!1097542 m!1017043))

(assert (=> b!1097542 m!1017041))

(assert (=> b!1097542 m!1016847))

(declare-fun m!1017045 () Bool)

(assert (=> b!1097542 m!1017045))

(assert (=> b!1097542 m!1017035))

(assert (=> b!1097533 m!1017035))

(assert (=> b!1097533 m!1017035))

(assert (=> b!1097533 m!1017037))

(assert (=> bm!45795 m!1016857))

(assert (=> b!1097538 m!1017035))

(assert (=> b!1097538 m!1017035))

(declare-fun m!1017047 () Bool)

(assert (=> b!1097538 m!1017047))

(declare-fun m!1017049 () Bool)

(assert (=> bm!45796 m!1017049))

(assert (=> d!130315 m!1016871))

(declare-fun m!1017051 () Bool)

(assert (=> b!1097551 m!1017051))

(declare-fun m!1017053 () Bool)

(assert (=> bm!45799 m!1017053))

(declare-fun m!1017055 () Bool)

(assert (=> bm!45797 m!1017055))

(declare-fun m!1017057 () Bool)

(assert (=> b!1097540 m!1017057))

(declare-fun m!1017059 () Bool)

(assert (=> b!1097543 m!1017059))

(declare-fun m!1017061 () Bool)

(assert (=> b!1097543 m!1017061))

(declare-fun m!1017063 () Bool)

(assert (=> b!1097543 m!1017063))

(declare-fun m!1017065 () Bool)

(assert (=> b!1097543 m!1017065))

(declare-fun m!1017067 () Bool)

(assert (=> b!1097543 m!1017067))

(assert (=> b!1097543 m!1017063))

(declare-fun m!1017069 () Bool)

(assert (=> b!1097543 m!1017069))

(declare-fun m!1017071 () Bool)

(assert (=> b!1097543 m!1017071))

(assert (=> b!1097543 m!1017035))

(assert (=> b!1097543 m!1016857))

(declare-fun m!1017073 () Bool)

(assert (=> b!1097543 m!1017073))

(declare-fun m!1017075 () Bool)

(assert (=> b!1097543 m!1017075))

(declare-fun m!1017077 () Bool)

(assert (=> b!1097543 m!1017077))

(declare-fun m!1017079 () Bool)

(assert (=> b!1097543 m!1017079))

(declare-fun m!1017081 () Bool)

(assert (=> b!1097543 m!1017081))

(assert (=> b!1097543 m!1017065))

(declare-fun m!1017083 () Bool)

(assert (=> b!1097543 m!1017083))

(declare-fun m!1017085 () Bool)

(assert (=> b!1097543 m!1017085))

(assert (=> b!1097543 m!1017061))

(declare-fun m!1017087 () Bool)

(assert (=> b!1097543 m!1017087))

(assert (=> b!1097543 m!1017083))

(assert (=> b!1097369 d!130315))

(declare-fun b!1097577 () Bool)

(declare-fun e!626434 () ListLongMap!15261)

(declare-fun e!626432 () ListLongMap!15261)

(assert (=> b!1097577 (= e!626434 e!626432)))

(declare-fun c!108400 () Bool)

(assert (=> b!1097577 (= c!108400 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097578 () Bool)

(declare-fun e!626435 () Bool)

(declare-fun e!626436 () Bool)

(assert (=> b!1097578 (= e!626435 e!626436)))

(declare-fun c!108402 () Bool)

(assert (=> b!1097578 (= c!108402 (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun call!45807 () ListLongMap!15261)

(declare-fun bm!45804 () Bool)

(assert (=> bm!45804 (= call!45807 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097579 () Bool)

(declare-fun res!732543 () Bool)

(declare-fun e!626431 () Bool)

(assert (=> b!1097579 (=> (not res!732543) (not e!626431))))

(declare-fun lt!490687 () ListLongMap!15261)

(assert (=> b!1097579 (= res!732543 (not (contains!6378 lt!490687 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097580 () Bool)

(assert (=> b!1097580 (= e!626431 e!626435)))

(declare-fun c!108403 () Bool)

(declare-fun e!626430 () Bool)

(assert (=> b!1097580 (= c!108403 e!626430)))

(declare-fun res!732544 () Bool)

(assert (=> b!1097580 (=> (not res!732544) (not e!626430))))

(assert (=> b!1097580 (= res!732544 (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun b!1097581 () Bool)

(declare-fun lt!490688 () Unit!36104)

(declare-fun lt!490689 () Unit!36104)

(assert (=> b!1097581 (= lt!490688 lt!490689)))

(declare-fun lt!490692 () (_ BitVec 64))

(declare-fun lt!490691 () (_ BitVec 64))

(declare-fun lt!490686 () ListLongMap!15261)

(declare-fun lt!490690 () V!41283)

(assert (=> b!1097581 (not (contains!6378 (+!3356 lt!490686 (tuple2!17293 lt!490691 lt!490690)) lt!490692))))

(declare-fun addStillNotContains!271 (ListLongMap!15261 (_ BitVec 64) V!41283 (_ BitVec 64)) Unit!36104)

(assert (=> b!1097581 (= lt!490689 (addStillNotContains!271 lt!490686 lt!490691 lt!490690 lt!490692))))

(assert (=> b!1097581 (= lt!490692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097581 (= lt!490690 (get!17611 (select (arr!34245 lt!490525) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097581 (= lt!490691 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(assert (=> b!1097581 (= lt!490686 call!45807)))

(assert (=> b!1097581 (= e!626432 (+!3356 call!45807 (tuple2!17293 (select (arr!34244 lt!490518) #b00000000000000000000000000000000) (get!17611 (select (arr!34245 lt!490525) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097582 () Bool)

(declare-fun e!626433 () Bool)

(assert (=> b!1097582 (= e!626435 e!626433)))

(assert (=> b!1097582 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(declare-fun res!732546 () Bool)

(assert (=> b!1097582 (= res!732546 (contains!6378 lt!490687 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(assert (=> b!1097582 (=> (not res!732546) (not e!626433))))

(declare-fun b!1097583 () Bool)

(declare-fun isEmpty!961 (ListLongMap!15261) Bool)

(assert (=> b!1097583 (= e!626436 (isEmpty!961 lt!490687))))

(declare-fun b!1097584 () Bool)

(assert (=> b!1097584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(assert (=> b!1097584 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34781 lt!490525)))))

(assert (=> b!1097584 (= e!626433 (= (apply!943 lt!490687 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)) (get!17611 (select (arr!34245 lt!490525) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130317 () Bool)

(assert (=> d!130317 e!626431))

(declare-fun res!732545 () Bool)

(assert (=> d!130317 (=> (not res!732545) (not e!626431))))

(assert (=> d!130317 (= res!732545 (not (contains!6378 lt!490687 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130317 (= lt!490687 e!626434)))

(declare-fun c!108401 () Bool)

(assert (=> d!130317 (= c!108401 (bvsge #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(assert (=> d!130317 (validMask!0 mask!1414)))

(assert (=> d!130317 (= (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490687)))

(declare-fun b!1097585 () Bool)

(assert (=> b!1097585 (= e!626434 (ListLongMap!15262 Nil!23912))))

(declare-fun b!1097586 () Bool)

(assert (=> b!1097586 (= e!626436 (= lt!490687 (getCurrentListMapNoExtraKeys!4162 lt!490518 lt!490525 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097587 () Bool)

(assert (=> b!1097587 (= e!626432 call!45807)))

(declare-fun b!1097588 () Bool)

(assert (=> b!1097588 (= e!626430 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(assert (=> b!1097588 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130317 c!108401) b!1097585))

(assert (= (and d!130317 (not c!108401)) b!1097577))

(assert (= (and b!1097577 c!108400) b!1097581))

(assert (= (and b!1097577 (not c!108400)) b!1097587))

(assert (= (or b!1097581 b!1097587) bm!45804))

(assert (= (and d!130317 res!732545) b!1097579))

(assert (= (and b!1097579 res!732543) b!1097580))

(assert (= (and b!1097580 res!732544) b!1097588))

(assert (= (and b!1097580 c!108403) b!1097582))

(assert (= (and b!1097580 (not c!108403)) b!1097578))

(assert (= (and b!1097582 res!732546) b!1097584))

(assert (= (and b!1097578 c!108402) b!1097586))

(assert (= (and b!1097578 (not c!108402)) b!1097583))

(declare-fun b_lambda!17737 () Bool)

(assert (=> (not b_lambda!17737) (not b!1097581)))

(assert (=> b!1097581 t!34026))

(declare-fun b_and!36811 () Bool)

(assert (= b_and!36809 (and (=> t!34026 result!16389) b_and!36811)))

(declare-fun b_lambda!17739 () Bool)

(assert (=> (not b_lambda!17739) (not b!1097584)))

(assert (=> b!1097584 t!34026))

(declare-fun b_and!36813 () Bool)

(assert (= b_and!36811 (and (=> t!34026 result!16389) b_and!36813)))

(declare-fun m!1017089 () Bool)

(assert (=> d!130317 m!1017089))

(assert (=> d!130317 m!1016871))

(assert (=> b!1097582 m!1017035))

(assert (=> b!1097582 m!1017035))

(declare-fun m!1017091 () Bool)

(assert (=> b!1097582 m!1017091))

(assert (=> b!1097581 m!1016847))

(assert (=> b!1097581 m!1017041))

(declare-fun m!1017093 () Bool)

(assert (=> b!1097581 m!1017093))

(assert (=> b!1097581 m!1017041))

(assert (=> b!1097581 m!1016847))

(assert (=> b!1097581 m!1017045))

(declare-fun m!1017095 () Bool)

(assert (=> b!1097581 m!1017095))

(declare-fun m!1017097 () Bool)

(assert (=> b!1097581 m!1017097))

(assert (=> b!1097581 m!1017093))

(declare-fun m!1017099 () Bool)

(assert (=> b!1097581 m!1017099))

(assert (=> b!1097581 m!1017035))

(declare-fun m!1017101 () Bool)

(assert (=> b!1097586 m!1017101))

(assert (=> b!1097584 m!1016847))

(assert (=> b!1097584 m!1017041))

(assert (=> b!1097584 m!1017041))

(assert (=> b!1097584 m!1016847))

(assert (=> b!1097584 m!1017045))

(assert (=> b!1097584 m!1017035))

(declare-fun m!1017103 () Bool)

(assert (=> b!1097584 m!1017103))

(assert (=> b!1097584 m!1017035))

(declare-fun m!1017105 () Bool)

(assert (=> b!1097579 m!1017105))

(assert (=> b!1097577 m!1017035))

(assert (=> b!1097577 m!1017035))

(assert (=> b!1097577 m!1017037))

(assert (=> b!1097588 m!1017035))

(assert (=> b!1097588 m!1017035))

(assert (=> b!1097588 m!1017037))

(assert (=> bm!45804 m!1017101))

(declare-fun m!1017107 () Bool)

(assert (=> b!1097583 m!1017107))

(assert (=> b!1097369 d!130317))

(declare-fun b!1097589 () Bool)

(declare-fun e!626441 () ListLongMap!15261)

(declare-fun e!626439 () ListLongMap!15261)

(assert (=> b!1097589 (= e!626441 e!626439)))

(declare-fun c!108404 () Bool)

(assert (=> b!1097589 (= c!108404 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1097590 () Bool)

(declare-fun e!626442 () Bool)

(declare-fun e!626443 () Bool)

(assert (=> b!1097590 (= e!626442 e!626443)))

(declare-fun c!108406 () Bool)

(assert (=> b!1097590 (= c!108406 (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun call!45808 () ListLongMap!15261)

(declare-fun bm!45805 () Bool)

(assert (=> bm!45805 (= call!45808 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1097591 () Bool)

(declare-fun res!732547 () Bool)

(declare-fun e!626438 () Bool)

(assert (=> b!1097591 (=> (not res!732547) (not e!626438))))

(declare-fun lt!490694 () ListLongMap!15261)

(assert (=> b!1097591 (= res!732547 (not (contains!6378 lt!490694 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1097592 () Bool)

(assert (=> b!1097592 (= e!626438 e!626442)))

(declare-fun c!108407 () Bool)

(declare-fun e!626437 () Bool)

(assert (=> b!1097592 (= c!108407 e!626437)))

(declare-fun res!732548 () Bool)

(assert (=> b!1097592 (=> (not res!732548) (not e!626437))))

(assert (=> b!1097592 (= res!732548 (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun b!1097593 () Bool)

(declare-fun lt!490695 () Unit!36104)

(declare-fun lt!490696 () Unit!36104)

(assert (=> b!1097593 (= lt!490695 lt!490696)))

(declare-fun lt!490697 () V!41283)

(declare-fun lt!490699 () (_ BitVec 64))

(declare-fun lt!490698 () (_ BitVec 64))

(declare-fun lt!490693 () ListLongMap!15261)

(assert (=> b!1097593 (not (contains!6378 (+!3356 lt!490693 (tuple2!17293 lt!490698 lt!490697)) lt!490699))))

(assert (=> b!1097593 (= lt!490696 (addStillNotContains!271 lt!490693 lt!490698 lt!490697 lt!490699))))

(assert (=> b!1097593 (= lt!490699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1097593 (= lt!490697 (get!17611 (select (arr!34245 _values!874) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1097593 (= lt!490698 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1097593 (= lt!490693 call!45808)))

(assert (=> b!1097593 (= e!626439 (+!3356 call!45808 (tuple2!17293 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000) (get!17611 (select (arr!34245 _values!874) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1097594 () Bool)

(declare-fun e!626440 () Bool)

(assert (=> b!1097594 (= e!626442 e!626440)))

(assert (=> b!1097594 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(declare-fun res!732550 () Bool)

(assert (=> b!1097594 (= res!732550 (contains!6378 lt!490694 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097594 (=> (not res!732550) (not e!626440))))

(declare-fun b!1097595 () Bool)

(assert (=> b!1097595 (= e!626443 (isEmpty!961 lt!490694))))

(declare-fun b!1097596 () Bool)

(assert (=> b!1097596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> b!1097596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34781 _values!874)))))

(assert (=> b!1097596 (= e!626440 (= (apply!943 lt!490694 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)) (get!17611 (select (arr!34245 _values!874) #b00000000000000000000000000000000) (dynLambda!2297 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!130319 () Bool)

(assert (=> d!130319 e!626438))

(declare-fun res!732549 () Bool)

(assert (=> d!130319 (=> (not res!732549) (not e!626438))))

(assert (=> d!130319 (= res!732549 (not (contains!6378 lt!490694 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130319 (= lt!490694 e!626441)))

(declare-fun c!108405 () Bool)

(assert (=> d!130319 (= c!108405 (bvsge #b00000000000000000000000000000000 (size!34780 _keys!1070)))))

(assert (=> d!130319 (validMask!0 mask!1414)))

(assert (=> d!130319 (= (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!490694)))

(declare-fun b!1097597 () Bool)

(assert (=> b!1097597 (= e!626441 (ListLongMap!15262 Nil!23912))))

(declare-fun b!1097598 () Bool)

(assert (=> b!1097598 (= e!626443 (= lt!490694 (getCurrentListMapNoExtraKeys!4162 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1097599 () Bool)

(assert (=> b!1097599 (= e!626439 call!45808)))

(declare-fun b!1097600 () Bool)

(assert (=> b!1097600 (= e!626437 (validKeyInArray!0 (select (arr!34244 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1097600 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130319 c!108405) b!1097597))

(assert (= (and d!130319 (not c!108405)) b!1097589))

(assert (= (and b!1097589 c!108404) b!1097593))

(assert (= (and b!1097589 (not c!108404)) b!1097599))

(assert (= (or b!1097593 b!1097599) bm!45805))

(assert (= (and d!130319 res!732549) b!1097591))

(assert (= (and b!1097591 res!732547) b!1097592))

(assert (= (and b!1097592 res!732548) b!1097600))

(assert (= (and b!1097592 c!108407) b!1097594))

(assert (= (and b!1097592 (not c!108407)) b!1097590))

(assert (= (and b!1097594 res!732550) b!1097596))

(assert (= (and b!1097590 c!108406) b!1097598))

(assert (= (and b!1097590 (not c!108406)) b!1097595))

(declare-fun b_lambda!17741 () Bool)

(assert (=> (not b_lambda!17741) (not b!1097593)))

(assert (=> b!1097593 t!34026))

(declare-fun b_and!36815 () Bool)

(assert (= b_and!36813 (and (=> t!34026 result!16389) b_and!36815)))

(declare-fun b_lambda!17743 () Bool)

(assert (=> (not b_lambda!17743) (not b!1097596)))

(assert (=> b!1097596 t!34026))

(declare-fun b_and!36817 () Bool)

(assert (= b_and!36815 (and (=> t!34026 result!16389) b_and!36817)))

(declare-fun m!1017109 () Bool)

(assert (=> d!130319 m!1017109))

(assert (=> d!130319 m!1016871))

(assert (=> b!1097594 m!1016933))

(assert (=> b!1097594 m!1016933))

(declare-fun m!1017111 () Bool)

(assert (=> b!1097594 m!1017111))

(assert (=> b!1097593 m!1016847))

(assert (=> b!1097593 m!1016977))

(declare-fun m!1017113 () Bool)

(assert (=> b!1097593 m!1017113))

(assert (=> b!1097593 m!1016977))

(assert (=> b!1097593 m!1016847))

(assert (=> b!1097593 m!1016981))

(declare-fun m!1017115 () Bool)

(assert (=> b!1097593 m!1017115))

(declare-fun m!1017117 () Bool)

(assert (=> b!1097593 m!1017117))

(assert (=> b!1097593 m!1017113))

(declare-fun m!1017119 () Bool)

(assert (=> b!1097593 m!1017119))

(assert (=> b!1097593 m!1016933))

(declare-fun m!1017121 () Bool)

(assert (=> b!1097598 m!1017121))

(assert (=> b!1097596 m!1016847))

(assert (=> b!1097596 m!1016977))

(assert (=> b!1097596 m!1016977))

(assert (=> b!1097596 m!1016847))

(assert (=> b!1097596 m!1016981))

(assert (=> b!1097596 m!1016933))

(declare-fun m!1017123 () Bool)

(assert (=> b!1097596 m!1017123))

(assert (=> b!1097596 m!1016933))

(declare-fun m!1017125 () Bool)

(assert (=> b!1097591 m!1017125))

(assert (=> b!1097589 m!1016933))

(assert (=> b!1097589 m!1016933))

(assert (=> b!1097589 m!1016935))

(assert (=> b!1097600 m!1016933))

(assert (=> b!1097600 m!1016933))

(assert (=> b!1097600 m!1016935))

(assert (=> bm!45805 m!1017121))

(declare-fun m!1017127 () Bool)

(assert (=> b!1097595 m!1017127))

(assert (=> b!1097369 d!130319))

(declare-fun d!130321 () Bool)

(assert (=> d!130321 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490702 () Unit!36104)

(declare-fun choose!13 (array!71145 (_ BitVec 64) (_ BitVec 32)) Unit!36104)

(assert (=> d!130321 (= lt!490702 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130321 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130321 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!490702)))

(declare-fun bs!32255 () Bool)

(assert (= bs!32255 d!130321))

(assert (=> bs!32255 m!1016853))

(declare-fun m!1017129 () Bool)

(assert (=> bs!32255 m!1017129))

(assert (=> b!1097369 d!130321))

(declare-fun d!130323 () Bool)

(assert (=> d!130323 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1097368 d!130323))

(declare-fun d!130325 () Bool)

(declare-fun res!732552 () Bool)

(declare-fun e!626447 () Bool)

(assert (=> d!130325 (=> res!732552 e!626447)))

(assert (=> d!130325 (= res!732552 (bvsge #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(assert (=> d!130325 (= (arrayNoDuplicates!0 lt!490518 #b00000000000000000000000000000000 Nil!23911) e!626447)))

(declare-fun b!1097601 () Bool)

(declare-fun e!626445 () Bool)

(declare-fun call!45809 () Bool)

(assert (=> b!1097601 (= e!626445 call!45809)))

(declare-fun bm!45806 () Bool)

(declare-fun c!108408 () Bool)

(assert (=> bm!45806 (= call!45809 (arrayNoDuplicates!0 lt!490518 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108408 (Cons!23910 (select (arr!34244 lt!490518) #b00000000000000000000000000000000) Nil!23911) Nil!23911)))))

(declare-fun b!1097602 () Bool)

(assert (=> b!1097602 (= e!626445 call!45809)))

(declare-fun b!1097603 () Bool)

(declare-fun e!626446 () Bool)

(assert (=> b!1097603 (= e!626447 e!626446)))

(declare-fun res!732553 () Bool)

(assert (=> b!1097603 (=> (not res!732553) (not e!626446))))

(declare-fun e!626444 () Bool)

(assert (=> b!1097603 (= res!732553 (not e!626444))))

(declare-fun res!732551 () Bool)

(assert (=> b!1097603 (=> (not res!732551) (not e!626444))))

(assert (=> b!1097603 (= res!732551 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097604 () Bool)

(assert (=> b!1097604 (= e!626444 (contains!6377 Nil!23911 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097605 () Bool)

(assert (=> b!1097605 (= e!626446 e!626445)))

(assert (=> b!1097605 (= c!108408 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(assert (= (and d!130325 (not res!732552)) b!1097603))

(assert (= (and b!1097603 res!732551) b!1097604))

(assert (= (and b!1097603 res!732553) b!1097605))

(assert (= (and b!1097605 c!108408) b!1097601))

(assert (= (and b!1097605 (not c!108408)) b!1097602))

(assert (= (or b!1097601 b!1097602) bm!45806))

(assert (=> bm!45806 m!1017035))

(declare-fun m!1017131 () Bool)

(assert (=> bm!45806 m!1017131))

(assert (=> b!1097603 m!1017035))

(assert (=> b!1097603 m!1017035))

(assert (=> b!1097603 m!1017037))

(assert (=> b!1097604 m!1017035))

(assert (=> b!1097604 m!1017035))

(declare-fun m!1017133 () Bool)

(assert (=> b!1097604 m!1017133))

(assert (=> b!1097605 m!1017035))

(assert (=> b!1097605 m!1017035))

(assert (=> b!1097605 m!1017037))

(assert (=> b!1097365 d!130325))

(declare-fun b!1097606 () Bool)

(declare-fun e!626450 () Bool)

(declare-fun call!45810 () Bool)

(assert (=> b!1097606 (= e!626450 call!45810)))

(declare-fun b!1097607 () Bool)

(declare-fun e!626448 () Bool)

(assert (=> b!1097607 (= e!626448 call!45810)))

(declare-fun b!1097608 () Bool)

(declare-fun e!626449 () Bool)

(assert (=> b!1097608 (= e!626449 e!626450)))

(declare-fun c!108409 () Bool)

(assert (=> b!1097608 (= c!108409 (validKeyInArray!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000)))))

(declare-fun b!1097609 () Bool)

(assert (=> b!1097609 (= e!626450 e!626448)))

(declare-fun lt!490703 () (_ BitVec 64))

(assert (=> b!1097609 (= lt!490703 (select (arr!34244 lt!490518) #b00000000000000000000000000000000))))

(declare-fun lt!490705 () Unit!36104)

(assert (=> b!1097609 (= lt!490705 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!490518 lt!490703 #b00000000000000000000000000000000))))

(assert (=> b!1097609 (arrayContainsKey!0 lt!490518 lt!490703 #b00000000000000000000000000000000)))

(declare-fun lt!490704 () Unit!36104)

(assert (=> b!1097609 (= lt!490704 lt!490705)))

(declare-fun res!732555 () Bool)

(assert (=> b!1097609 (= res!732555 (= (seekEntryOrOpen!0 (select (arr!34244 lt!490518) #b00000000000000000000000000000000) lt!490518 mask!1414) (Found!9906 #b00000000000000000000000000000000)))))

(assert (=> b!1097609 (=> (not res!732555) (not e!626448))))

(declare-fun bm!45807 () Bool)

(assert (=> bm!45807 (= call!45810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!490518 mask!1414))))

(declare-fun d!130327 () Bool)

(declare-fun res!732554 () Bool)

(assert (=> d!130327 (=> res!732554 e!626449)))

(assert (=> d!130327 (= res!732554 (bvsge #b00000000000000000000000000000000 (size!34780 lt!490518)))))

(assert (=> d!130327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490518 mask!1414) e!626449)))

(assert (= (and d!130327 (not res!732554)) b!1097608))

(assert (= (and b!1097608 c!108409) b!1097609))

(assert (= (and b!1097608 (not c!108409)) b!1097606))

(assert (= (and b!1097609 res!732555) b!1097607))

(assert (= (or b!1097607 b!1097606) bm!45807))

(assert (=> b!1097608 m!1017035))

(assert (=> b!1097608 m!1017035))

(assert (=> b!1097608 m!1017037))

(assert (=> b!1097609 m!1017035))

(declare-fun m!1017135 () Bool)

(assert (=> b!1097609 m!1017135))

(declare-fun m!1017137 () Bool)

(assert (=> b!1097609 m!1017137))

(assert (=> b!1097609 m!1017035))

(declare-fun m!1017139 () Bool)

(assert (=> b!1097609 m!1017139))

(declare-fun m!1017141 () Bool)

(assert (=> bm!45807 m!1017141))

(assert (=> b!1097371 d!130327))

(declare-fun mapIsEmpty!42442 () Bool)

(declare-fun mapRes!42442 () Bool)

(assert (=> mapIsEmpty!42442 mapRes!42442))

(declare-fun b!1097617 () Bool)

(declare-fun e!626455 () Bool)

(assert (=> b!1097617 (= e!626455 tp_is_empty!27117)))

(declare-fun condMapEmpty!42442 () Bool)

(declare-fun mapDefault!42442 () ValueCell!12849)

(assert (=> mapNonEmpty!42436 (= condMapEmpty!42442 (= mapRest!42436 ((as const (Array (_ BitVec 32) ValueCell!12849)) mapDefault!42442)))))

(assert (=> mapNonEmpty!42436 (= tp!81127 (and e!626455 mapRes!42442))))

(declare-fun mapNonEmpty!42442 () Bool)

(declare-fun tp!81137 () Bool)

(declare-fun e!626456 () Bool)

(assert (=> mapNonEmpty!42442 (= mapRes!42442 (and tp!81137 e!626456))))

(declare-fun mapRest!42442 () (Array (_ BitVec 32) ValueCell!12849))

(declare-fun mapValue!42442 () ValueCell!12849)

(declare-fun mapKey!42442 () (_ BitVec 32))

(assert (=> mapNonEmpty!42442 (= mapRest!42436 (store mapRest!42442 mapKey!42442 mapValue!42442))))

(declare-fun b!1097616 () Bool)

(assert (=> b!1097616 (= e!626456 tp_is_empty!27117)))

(assert (= (and mapNonEmpty!42436 condMapEmpty!42442) mapIsEmpty!42442))

(assert (= (and mapNonEmpty!42436 (not condMapEmpty!42442)) mapNonEmpty!42442))

(assert (= (and mapNonEmpty!42442 ((_ is ValueCellFull!12849) mapValue!42442)) b!1097616))

(assert (= (and mapNonEmpty!42436 ((_ is ValueCellFull!12849) mapDefault!42442)) b!1097617))

(declare-fun m!1017143 () Bool)

(assert (=> mapNonEmpty!42442 m!1017143))

(declare-fun b_lambda!17745 () Bool)

(assert (= b_lambda!17735 (or (and start!96488 b_free!23067) b_lambda!17745)))

(declare-fun b_lambda!17747 () Bool)

(assert (= b_lambda!17733 (or (and start!96488 b_free!23067) b_lambda!17747)))

(declare-fun b_lambda!17749 () Bool)

(assert (= b_lambda!17743 (or (and start!96488 b_free!23067) b_lambda!17749)))

(declare-fun b_lambda!17751 () Bool)

(assert (= b_lambda!17737 (or (and start!96488 b_free!23067) b_lambda!17751)))

(declare-fun b_lambda!17753 () Bool)

(assert (= b_lambda!17741 (or (and start!96488 b_free!23067) b_lambda!17753)))

(declare-fun b_lambda!17755 () Bool)

(assert (= b_lambda!17731 (or (and start!96488 b_free!23067) b_lambda!17755)))

(declare-fun b_lambda!17757 () Bool)

(assert (= b_lambda!17739 (or (and start!96488 b_free!23067) b_lambda!17757)))

(check-sat (not bm!45805) (not bm!45784) (not b_lambda!17753) (not d!130321) (not b!1097503) (not b!1097582) (not b!1097508) (not b!1097453) (not b!1097530) b_and!36817 (not b!1097543) (not bm!45806) (not b_lambda!17729) (not d!130311) (not bm!45786) (not b!1097513) (not b!1097542) (not b_next!23067) (not b!1097445) (not bm!45793) (not b!1097444) (not bm!45796) (not b!1097443) (not b!1097551) (not b!1097603) (not b!1097540) (not b!1097586) (not b!1097598) (not b!1097609) (not b!1097521) (not mapNonEmpty!42442) (not d!130315) (not b!1097596) (not b!1097451) (not d!130305) (not bm!45797) (not b!1097577) (not b!1097605) (not bm!45782) (not bm!45804) (not d!130319) (not b_lambda!17755) (not b!1097520) (not b!1097589) (not b!1097584) (not b!1097604) (not b!1097429) (not b!1097550) (not b!1097583) (not b!1097533) (not b!1097510) (not b_lambda!17747) (not d!130309) (not b!1097608) tp_is_empty!27117 (not bm!45764) (not b_lambda!17749) (not bm!45794) (not b!1097593) (not bm!45795) (not b!1097538) (not bm!45767) (not b!1097588) (not b!1097512) (not b!1097591) (not b!1097594) (not bm!45799) (not d!130303) (not b!1097450) (not b!1097548) (not b!1097459) (not bm!45807) (not b_lambda!17745) (not b!1097430) (not bm!45783) (not b!1097600) (not b!1097579) (not b!1097518) (not d!130313) (not b_lambda!17751) (not b_lambda!17757) (not b!1097595) (not b!1097452) (not b!1097581) (not d!130317))
(check-sat b_and!36817 (not b_next!23067))
