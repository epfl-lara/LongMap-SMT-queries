; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97028 () Bool)

(assert start!97028)

(declare-fun b_free!23161 () Bool)

(declare-fun b_next!23161 () Bool)

(assert (=> start!97028 (= b_free!23161 (not b_next!23161))))

(declare-fun tp!81433 () Bool)

(declare-fun b_and!37107 () Bool)

(assert (=> start!97028 (= tp!81433 b_and!37107)))

(declare-fun e!629286 () Bool)

(declare-datatypes ((V!41409 0))(
  ( (V!41410 (val!13662 Int)) )
))
(declare-datatypes ((tuple2!17386 0))(
  ( (tuple2!17387 (_1!8704 (_ BitVec 64)) (_2!8704 V!41409)) )
))
(declare-datatypes ((List!24005 0))(
  ( (Nil!24002) (Cons!24001 (h!25219 tuple2!17386) (t!34204 List!24005)) )
))
(declare-datatypes ((ListLongMap!15363 0))(
  ( (ListLongMap!15364 (toList!7697 List!24005)) )
))
(declare-fun lt!494026 () ListLongMap!15363)

(declare-fun lt!494024 () ListLongMap!15363)

(declare-fun lt!494019 () tuple2!17386)

(declare-fun b!1102335 () Bool)

(declare-fun +!3426 (ListLongMap!15363 tuple2!17386) ListLongMap!15363)

(assert (=> b!1102335 (= e!629286 (= lt!494026 (+!3426 lt!494024 lt!494019)))))

(declare-fun lt!494021 () ListLongMap!15363)

(assert (=> b!1102335 (= lt!494026 (+!3426 lt!494021 lt!494019))))

(declare-fun minValue!831 () V!41409)

(assert (=> b!1102335 (= lt!494019 (tuple2!17387 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1102336 () Bool)

(declare-fun e!629282 () Bool)

(declare-fun tp_is_empty!27211 () Bool)

(assert (=> b!1102336 (= e!629282 tp_is_empty!27211)))

(declare-fun b!1102337 () Bool)

(declare-fun res!735199 () Bool)

(declare-fun e!629280 () Bool)

(assert (=> b!1102337 (=> (not res!735199) (not e!629280))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102337 (= res!735199 (validKeyInArray!0 k0!904))))

(declare-fun res!735201 () Bool)

(assert (=> start!97028 (=> (not res!735201) (not e!629280))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97028 (= res!735201 (validMask!0 mask!1414))))

(assert (=> start!97028 e!629280))

(assert (=> start!97028 tp!81433))

(assert (=> start!97028 true))

(assert (=> start!97028 tp_is_empty!27211))

(declare-datatypes ((array!71377 0))(
  ( (array!71378 (arr!34346 (Array (_ BitVec 32) (_ BitVec 64))) (size!34883 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71377)

(declare-fun array_inv!26482 (array!71377) Bool)

(assert (=> start!97028 (array_inv!26482 _keys!1070)))

(declare-datatypes ((ValueCell!12896 0))(
  ( (ValueCellFull!12896 (v!16287 V!41409)) (EmptyCell!12896) )
))
(declare-datatypes ((array!71379 0))(
  ( (array!71380 (arr!34347 (Array (_ BitVec 32) ValueCell!12896)) (size!34884 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71379)

(declare-fun e!629283 () Bool)

(declare-fun array_inv!26483 (array!71379) Bool)

(assert (=> start!97028 (and (array_inv!26483 _values!874) e!629283)))

(declare-fun mapNonEmpty!42601 () Bool)

(declare-fun mapRes!42601 () Bool)

(declare-fun tp!81434 () Bool)

(assert (=> mapNonEmpty!42601 (= mapRes!42601 (and tp!81434 e!629282))))

(declare-fun mapRest!42601 () (Array (_ BitVec 32) ValueCell!12896))

(declare-fun mapKey!42601 () (_ BitVec 32))

(declare-fun mapValue!42601 () ValueCell!12896)

(assert (=> mapNonEmpty!42601 (= (arr!34347 _values!874) (store mapRest!42601 mapKey!42601 mapValue!42601))))

(declare-fun b!1102338 () Bool)

(declare-fun e!629281 () Bool)

(assert (=> b!1102338 (= e!629283 (and e!629281 mapRes!42601))))

(declare-fun condMapEmpty!42601 () Bool)

(declare-fun mapDefault!42601 () ValueCell!12896)

(assert (=> b!1102338 (= condMapEmpty!42601 (= (arr!34347 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12896)) mapDefault!42601)))))

(declare-fun b!1102339 () Bool)

(declare-fun res!735198 () Bool)

(assert (=> b!1102339 (=> (not res!735198) (not e!629280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71377 (_ BitVec 32)) Bool)

(assert (=> b!1102339 (= res!735198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1102340 () Bool)

(declare-fun res!735205 () Bool)

(assert (=> b!1102340 (=> (not res!735205) (not e!629280))))

(declare-datatypes ((List!24006 0))(
  ( (Nil!24003) (Cons!24002 (h!25220 (_ BitVec 64)) (t!34205 List!24006)) )
))
(declare-fun arrayNoDuplicates!0 (array!71377 (_ BitVec 32) List!24006) Bool)

(assert (=> b!1102340 (= res!735205 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24003))))

(declare-fun b!1102341 () Bool)

(declare-fun res!735197 () Bool)

(assert (=> b!1102341 (=> (not res!735197) (not e!629280))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1102341 (= res!735197 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34883 _keys!1070))))))

(declare-fun b!1102342 () Bool)

(declare-fun res!735200 () Bool)

(assert (=> b!1102342 (=> (not res!735200) (not e!629280))))

(assert (=> b!1102342 (= res!735200 (= (select (arr!34346 _keys!1070) i!650) k0!904))))

(declare-fun b!1102343 () Bool)

(declare-fun e!629285 () Bool)

(assert (=> b!1102343 (= e!629280 e!629285)))

(declare-fun res!735206 () Bool)

(assert (=> b!1102343 (=> (not res!735206) (not e!629285))))

(declare-fun lt!494025 () array!71377)

(assert (=> b!1102343 (= res!735206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494025 mask!1414))))

(assert (=> b!1102343 (= lt!494025 (array!71378 (store (arr!34346 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34883 _keys!1070)))))

(declare-fun b!1102344 () Bool)

(declare-fun res!735202 () Bool)

(assert (=> b!1102344 (=> (not res!735202) (not e!629280))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1102344 (= res!735202 (and (= (size!34884 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34883 _keys!1070) (size!34884 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102345 () Bool)

(assert (=> b!1102345 (= e!629285 (not e!629286))))

(declare-fun res!735204 () Bool)

(assert (=> b!1102345 (=> res!735204 e!629286)))

(assert (=> b!1102345 (= res!735204 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun lt!494022 () ListLongMap!15363)

(declare-fun zeroValue!831 () V!41409)

(declare-fun getCurrentListMap!4401 (array!71377 array!71379 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) Int) ListLongMap!15363)

(assert (=> b!1102345 (= lt!494022 (getCurrentListMap!4401 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494020 () array!71379)

(assert (=> b!1102345 (= lt!494026 (getCurrentListMap!4401 lt!494025 lt!494020 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1102345 (and (= lt!494021 lt!494024) (= lt!494024 lt!494021))))

(declare-fun lt!494017 () ListLongMap!15363)

(declare-fun -!965 (ListLongMap!15363 (_ BitVec 64)) ListLongMap!15363)

(assert (=> b!1102345 (= lt!494024 (-!965 lt!494017 k0!904))))

(declare-datatypes ((Unit!36185 0))(
  ( (Unit!36186) )
))
(declare-fun lt!494018 () Unit!36185)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 (array!71377 array!71379 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36185)

(assert (=> b!1102345 (= lt!494018 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!235 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4242 (array!71377 array!71379 (_ BitVec 32) (_ BitVec 32) V!41409 V!41409 (_ BitVec 32) Int) ListLongMap!15363)

(assert (=> b!1102345 (= lt!494021 (getCurrentListMapNoExtraKeys!4242 lt!494025 lt!494020 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2360 (Int (_ BitVec 64)) V!41409)

(assert (=> b!1102345 (= lt!494020 (array!71380 (store (arr!34347 _values!874) i!650 (ValueCellFull!12896 (dynLambda!2360 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34884 _values!874)))))

(assert (=> b!1102345 (= lt!494017 (getCurrentListMapNoExtraKeys!4242 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102345 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494023 () Unit!36185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71377 (_ BitVec 64) (_ BitVec 32)) Unit!36185)

(assert (=> b!1102345 (= lt!494023 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102346 () Bool)

(assert (=> b!1102346 (= e!629281 tp_is_empty!27211)))

(declare-fun b!1102347 () Bool)

(declare-fun res!735203 () Bool)

(assert (=> b!1102347 (=> (not res!735203) (not e!629285))))

(assert (=> b!1102347 (= res!735203 (arrayNoDuplicates!0 lt!494025 #b00000000000000000000000000000000 Nil!24003))))

(declare-fun mapIsEmpty!42601 () Bool)

(assert (=> mapIsEmpty!42601 mapRes!42601))

(assert (= (and start!97028 res!735201) b!1102344))

(assert (= (and b!1102344 res!735202) b!1102339))

(assert (= (and b!1102339 res!735198) b!1102340))

(assert (= (and b!1102340 res!735205) b!1102341))

(assert (= (and b!1102341 res!735197) b!1102337))

(assert (= (and b!1102337 res!735199) b!1102342))

(assert (= (and b!1102342 res!735200) b!1102343))

(assert (= (and b!1102343 res!735206) b!1102347))

(assert (= (and b!1102347 res!735203) b!1102345))

(assert (= (and b!1102345 (not res!735204)) b!1102335))

(assert (= (and b!1102338 condMapEmpty!42601) mapIsEmpty!42601))

(assert (= (and b!1102338 (not condMapEmpty!42601)) mapNonEmpty!42601))

(get-info :version)

(assert (= (and mapNonEmpty!42601 ((_ is ValueCellFull!12896) mapValue!42601)) b!1102336))

(assert (= (and b!1102338 ((_ is ValueCellFull!12896) mapDefault!42601)) b!1102346))

(assert (= start!97028 b!1102338))

(declare-fun b_lambda!18069 () Bool)

(assert (=> (not b_lambda!18069) (not b!1102345)))

(declare-fun t!34203 () Bool)

(declare-fun tb!8019 () Bool)

(assert (=> (and start!97028 (= defaultEntry!882 defaultEntry!882) t!34203) tb!8019))

(declare-fun result!16585 () Bool)

(assert (=> tb!8019 (= result!16585 tp_is_empty!27211)))

(assert (=> b!1102345 t!34203))

(declare-fun b_and!37109 () Bool)

(assert (= b_and!37107 (and (=> t!34203 result!16585) b_and!37109)))

(declare-fun m!1022815 () Bool)

(assert (=> b!1102339 m!1022815))

(declare-fun m!1022817 () Bool)

(assert (=> b!1102342 m!1022817))

(declare-fun m!1022819 () Bool)

(assert (=> b!1102340 m!1022819))

(declare-fun m!1022821 () Bool)

(assert (=> b!1102347 m!1022821))

(declare-fun m!1022823 () Bool)

(assert (=> b!1102335 m!1022823))

(declare-fun m!1022825 () Bool)

(assert (=> b!1102335 m!1022825))

(declare-fun m!1022827 () Bool)

(assert (=> b!1102345 m!1022827))

(declare-fun m!1022829 () Bool)

(assert (=> b!1102345 m!1022829))

(declare-fun m!1022831 () Bool)

(assert (=> b!1102345 m!1022831))

(declare-fun m!1022833 () Bool)

(assert (=> b!1102345 m!1022833))

(declare-fun m!1022835 () Bool)

(assert (=> b!1102345 m!1022835))

(declare-fun m!1022837 () Bool)

(assert (=> b!1102345 m!1022837))

(declare-fun m!1022839 () Bool)

(assert (=> b!1102345 m!1022839))

(declare-fun m!1022841 () Bool)

(assert (=> b!1102345 m!1022841))

(declare-fun m!1022843 () Bool)

(assert (=> b!1102345 m!1022843))

(declare-fun m!1022845 () Bool)

(assert (=> b!1102345 m!1022845))

(declare-fun m!1022847 () Bool)

(assert (=> start!97028 m!1022847))

(declare-fun m!1022849 () Bool)

(assert (=> start!97028 m!1022849))

(declare-fun m!1022851 () Bool)

(assert (=> start!97028 m!1022851))

(declare-fun m!1022853 () Bool)

(assert (=> mapNonEmpty!42601 m!1022853))

(declare-fun m!1022855 () Bool)

(assert (=> b!1102343 m!1022855))

(declare-fun m!1022857 () Bool)

(assert (=> b!1102343 m!1022857))

(declare-fun m!1022859 () Bool)

(assert (=> b!1102337 m!1022859))

(check-sat tp_is_empty!27211 (not b!1102347) (not b!1102345) (not b_lambda!18069) (not b!1102343) (not b!1102340) (not start!97028) (not b!1102337) (not mapNonEmpty!42601) (not b_next!23161) b_and!37109 (not b!1102339) (not b!1102335))
(check-sat b_and!37109 (not b_next!23161))
