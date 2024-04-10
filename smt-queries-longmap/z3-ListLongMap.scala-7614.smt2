; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96006 () Bool)

(assert start!96006)

(declare-fun b_free!22659 () Bool)

(declare-fun b_next!22659 () Bool)

(assert (=> start!96006 (= b_free!22659 (not b_next!22659))))

(declare-fun tp!79825 () Bool)

(declare-fun b_and!35993 () Bool)

(assert (=> start!96006 (= tp!79825 b_and!35993)))

(declare-fun b!1088239 () Bool)

(declare-fun res!725805 () Bool)

(declare-fun e!621601 () Bool)

(assert (=> b!1088239 (=> (not res!725805) (not e!621601))))

(declare-datatypes ((array!70247 0))(
  ( (array!70248 (arr!33797 (Array (_ BitVec 32) (_ BitVec 64))) (size!34333 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70247)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1088239 (= res!725805 (= (select (arr!33797 _keys!1070) i!650) k0!904))))

(declare-fun b!1088240 () Bool)

(declare-fun e!621600 () Bool)

(declare-fun e!621598 () Bool)

(assert (=> b!1088240 (= e!621600 (not e!621598))))

(declare-fun res!725807 () Bool)

(assert (=> b!1088240 (=> res!725807 e!621598)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088240 (= res!725807 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40675 0))(
  ( (V!40676 (val!13387 Int)) )
))
(declare-fun minValue!831 () V!40675)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40675)

(declare-datatypes ((tuple2!16992 0))(
  ( (tuple2!16993 (_1!8507 (_ BitVec 64)) (_2!8507 V!40675)) )
))
(declare-datatypes ((List!23579 0))(
  ( (Nil!23576) (Cons!23575 (h!24784 tuple2!16992) (t!33296 List!23579)) )
))
(declare-datatypes ((ListLongMap!14961 0))(
  ( (ListLongMap!14962 (toList!7496 List!23579)) )
))
(declare-fun lt!484620 () ListLongMap!14961)

(declare-datatypes ((ValueCell!12621 0))(
  ( (ValueCellFull!12621 (v!16008 V!40675)) (EmptyCell!12621) )
))
(declare-datatypes ((array!70249 0))(
  ( (array!70250 (arr!33798 (Array (_ BitVec 32) ValueCell!12621)) (size!34334 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70249)

(declare-fun getCurrentListMap!4270 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40675 V!40675 (_ BitVec 32) Int) ListLongMap!14961)

(assert (=> b!1088240 (= lt!484620 (getCurrentListMap!4270 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484619 () array!70247)

(declare-fun lt!484629 () array!70249)

(declare-fun lt!484630 () ListLongMap!14961)

(assert (=> b!1088240 (= lt!484630 (getCurrentListMap!4270 lt!484619 lt!484629 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484624 () ListLongMap!14961)

(declare-fun lt!484626 () ListLongMap!14961)

(assert (=> b!1088240 (and (= lt!484624 lt!484626) (= lt!484626 lt!484624))))

(declare-fun lt!484618 () ListLongMap!14961)

(declare-fun -!821 (ListLongMap!14961 (_ BitVec 64)) ListLongMap!14961)

(assert (=> b!1088240 (= lt!484626 (-!821 lt!484618 k0!904))))

(declare-datatypes ((Unit!35808 0))(
  ( (Unit!35809) )
))
(declare-fun lt!484622 () Unit!35808)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!89 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40675 V!40675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35808)

(assert (=> b!1088240 (= lt!484622 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!89 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4030 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40675 V!40675 (_ BitVec 32) Int) ListLongMap!14961)

(assert (=> b!1088240 (= lt!484624 (getCurrentListMapNoExtraKeys!4030 lt!484619 lt!484629 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2167 (Int (_ BitVec 64)) V!40675)

(assert (=> b!1088240 (= lt!484629 (array!70250 (store (arr!33798 _values!874) i!650 (ValueCellFull!12621 (dynLambda!2167 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34334 _values!874)))))

(assert (=> b!1088240 (= lt!484618 (getCurrentListMapNoExtraKeys!4030 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088240 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484625 () Unit!35808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70247 (_ BitVec 64) (_ BitVec 32)) Unit!35808)

(assert (=> b!1088240 (= lt!484625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1088241 () Bool)

(declare-fun res!725798 () Bool)

(assert (=> b!1088241 (=> (not res!725798) (not e!621601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70247 (_ BitVec 32)) Bool)

(assert (=> b!1088241 (= res!725798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088242 () Bool)

(declare-fun e!621597 () Bool)

(assert (=> b!1088242 (= e!621597 true)))

(declare-fun lt!484621 () ListLongMap!14961)

(declare-fun lt!484627 () ListLongMap!14961)

(assert (=> b!1088242 (= (-!821 lt!484621 k0!904) lt!484627)))

(declare-fun lt!484623 () Unit!35808)

(declare-fun addRemoveCommutativeForDiffKeys!51 (ListLongMap!14961 (_ BitVec 64) V!40675 (_ BitVec 64)) Unit!35808)

(assert (=> b!1088242 (= lt!484623 (addRemoveCommutativeForDiffKeys!51 lt!484618 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1088243 () Bool)

(declare-fun res!725806 () Bool)

(assert (=> b!1088243 (=> (not res!725806) (not e!621601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088243 (= res!725806 (validKeyInArray!0 k0!904))))

(declare-fun b!1088244 () Bool)

(declare-fun e!621595 () Bool)

(declare-fun e!621602 () Bool)

(declare-fun mapRes!41746 () Bool)

(assert (=> b!1088244 (= e!621595 (and e!621602 mapRes!41746))))

(declare-fun condMapEmpty!41746 () Bool)

(declare-fun mapDefault!41746 () ValueCell!12621)

(assert (=> b!1088244 (= condMapEmpty!41746 (= (arr!33798 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12621)) mapDefault!41746)))))

(declare-fun b!1088245 () Bool)

(assert (=> b!1088245 (= e!621601 e!621600)))

(declare-fun res!725804 () Bool)

(assert (=> b!1088245 (=> (not res!725804) (not e!621600))))

(assert (=> b!1088245 (= res!725804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484619 mask!1414))))

(assert (=> b!1088245 (= lt!484619 (array!70248 (store (arr!33797 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34333 _keys!1070)))))

(declare-fun b!1088246 () Bool)

(declare-fun res!725801 () Bool)

(assert (=> b!1088246 (=> (not res!725801) (not e!621601))))

(assert (=> b!1088246 (= res!725801 (and (= (size!34334 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34333 _keys!1070) (size!34334 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088247 () Bool)

(declare-fun res!725800 () Bool)

(assert (=> b!1088247 (=> (not res!725800) (not e!621601))))

(declare-datatypes ((List!23580 0))(
  ( (Nil!23577) (Cons!23576 (h!24785 (_ BitVec 64)) (t!33297 List!23580)) )
))
(declare-fun arrayNoDuplicates!0 (array!70247 (_ BitVec 32) List!23580) Bool)

(assert (=> b!1088247 (= res!725800 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23577))))

(declare-fun res!725803 () Bool)

(assert (=> start!96006 (=> (not res!725803) (not e!621601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96006 (= res!725803 (validMask!0 mask!1414))))

(assert (=> start!96006 e!621601))

(assert (=> start!96006 tp!79825))

(assert (=> start!96006 true))

(declare-fun tp_is_empty!26661 () Bool)

(assert (=> start!96006 tp_is_empty!26661))

(declare-fun array_inv!26064 (array!70247) Bool)

(assert (=> start!96006 (array_inv!26064 _keys!1070)))

(declare-fun array_inv!26065 (array!70249) Bool)

(assert (=> start!96006 (and (array_inv!26065 _values!874) e!621595)))

(declare-fun b!1088238 () Bool)

(declare-fun res!725799 () Bool)

(assert (=> b!1088238 (=> (not res!725799) (not e!621600))))

(assert (=> b!1088238 (= res!725799 (arrayNoDuplicates!0 lt!484619 #b00000000000000000000000000000000 Nil!23577))))

(declare-fun b!1088248 () Bool)

(declare-fun e!621599 () Bool)

(assert (=> b!1088248 (= e!621599 tp_is_empty!26661)))

(declare-fun b!1088249 () Bool)

(assert (=> b!1088249 (= e!621598 e!621597)))

(declare-fun res!725808 () Bool)

(assert (=> b!1088249 (=> res!725808 e!621597)))

(assert (=> b!1088249 (= res!725808 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1088249 (= lt!484630 lt!484627)))

(declare-fun lt!484628 () tuple2!16992)

(declare-fun +!3297 (ListLongMap!14961 tuple2!16992) ListLongMap!14961)

(assert (=> b!1088249 (= lt!484627 (+!3297 lt!484626 lt!484628))))

(assert (=> b!1088249 (= lt!484620 lt!484621)))

(assert (=> b!1088249 (= lt!484621 (+!3297 lt!484618 lt!484628))))

(assert (=> b!1088249 (= lt!484630 (+!3297 lt!484624 lt!484628))))

(assert (=> b!1088249 (= lt!484628 (tuple2!16993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088250 () Bool)

(assert (=> b!1088250 (= e!621602 tp_is_empty!26661)))

(declare-fun mapIsEmpty!41746 () Bool)

(assert (=> mapIsEmpty!41746 mapRes!41746))

(declare-fun mapNonEmpty!41746 () Bool)

(declare-fun tp!79826 () Bool)

(assert (=> mapNonEmpty!41746 (= mapRes!41746 (and tp!79826 e!621599))))

(declare-fun mapKey!41746 () (_ BitVec 32))

(declare-fun mapValue!41746 () ValueCell!12621)

(declare-fun mapRest!41746 () (Array (_ BitVec 32) ValueCell!12621))

(assert (=> mapNonEmpty!41746 (= (arr!33798 _values!874) (store mapRest!41746 mapKey!41746 mapValue!41746))))

(declare-fun b!1088251 () Bool)

(declare-fun res!725802 () Bool)

(assert (=> b!1088251 (=> (not res!725802) (not e!621601))))

(assert (=> b!1088251 (= res!725802 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34333 _keys!1070))))))

(assert (= (and start!96006 res!725803) b!1088246))

(assert (= (and b!1088246 res!725801) b!1088241))

(assert (= (and b!1088241 res!725798) b!1088247))

(assert (= (and b!1088247 res!725800) b!1088251))

(assert (= (and b!1088251 res!725802) b!1088243))

(assert (= (and b!1088243 res!725806) b!1088239))

(assert (= (and b!1088239 res!725805) b!1088245))

(assert (= (and b!1088245 res!725804) b!1088238))

(assert (= (and b!1088238 res!725799) b!1088240))

(assert (= (and b!1088240 (not res!725807)) b!1088249))

(assert (= (and b!1088249 (not res!725808)) b!1088242))

(assert (= (and b!1088244 condMapEmpty!41746) mapIsEmpty!41746))

(assert (= (and b!1088244 (not condMapEmpty!41746)) mapNonEmpty!41746))

(get-info :version)

(assert (= (and mapNonEmpty!41746 ((_ is ValueCellFull!12621) mapValue!41746)) b!1088248))

(assert (= (and b!1088244 ((_ is ValueCellFull!12621) mapDefault!41746)) b!1088250))

(assert (= start!96006 b!1088244))

(declare-fun b_lambda!17329 () Bool)

(assert (=> (not b_lambda!17329) (not b!1088240)))

(declare-fun t!33295 () Bool)

(declare-fun tb!7537 () Bool)

(assert (=> (and start!96006 (= defaultEntry!882 defaultEntry!882) t!33295) tb!7537))

(declare-fun result!15593 () Bool)

(assert (=> tb!7537 (= result!15593 tp_is_empty!26661)))

(assert (=> b!1088240 t!33295))

(declare-fun b_and!35995 () Bool)

(assert (= b_and!35993 (and (=> t!33295 result!15593) b_and!35995)))

(declare-fun m!1007267 () Bool)

(assert (=> b!1088238 m!1007267))

(declare-fun m!1007269 () Bool)

(assert (=> b!1088245 m!1007269))

(declare-fun m!1007271 () Bool)

(assert (=> b!1088245 m!1007271))

(declare-fun m!1007273 () Bool)

(assert (=> b!1088240 m!1007273))

(declare-fun m!1007275 () Bool)

(assert (=> b!1088240 m!1007275))

(declare-fun m!1007277 () Bool)

(assert (=> b!1088240 m!1007277))

(declare-fun m!1007279 () Bool)

(assert (=> b!1088240 m!1007279))

(declare-fun m!1007281 () Bool)

(assert (=> b!1088240 m!1007281))

(declare-fun m!1007283 () Bool)

(assert (=> b!1088240 m!1007283))

(declare-fun m!1007285 () Bool)

(assert (=> b!1088240 m!1007285))

(declare-fun m!1007287 () Bool)

(assert (=> b!1088240 m!1007287))

(declare-fun m!1007289 () Bool)

(assert (=> b!1088240 m!1007289))

(declare-fun m!1007291 () Bool)

(assert (=> b!1088240 m!1007291))

(declare-fun m!1007293 () Bool)

(assert (=> b!1088242 m!1007293))

(declare-fun m!1007295 () Bool)

(assert (=> b!1088242 m!1007295))

(declare-fun m!1007297 () Bool)

(assert (=> b!1088243 m!1007297))

(declare-fun m!1007299 () Bool)

(assert (=> b!1088249 m!1007299))

(declare-fun m!1007301 () Bool)

(assert (=> b!1088249 m!1007301))

(declare-fun m!1007303 () Bool)

(assert (=> b!1088249 m!1007303))

(declare-fun m!1007305 () Bool)

(assert (=> b!1088239 m!1007305))

(declare-fun m!1007307 () Bool)

(assert (=> b!1088241 m!1007307))

(declare-fun m!1007309 () Bool)

(assert (=> start!96006 m!1007309))

(declare-fun m!1007311 () Bool)

(assert (=> start!96006 m!1007311))

(declare-fun m!1007313 () Bool)

(assert (=> start!96006 m!1007313))

(declare-fun m!1007315 () Bool)

(assert (=> b!1088247 m!1007315))

(declare-fun m!1007317 () Bool)

(assert (=> mapNonEmpty!41746 m!1007317))

(check-sat (not b!1088238) (not b_next!22659) (not mapNonEmpty!41746) (not b_lambda!17329) (not start!96006) tp_is_empty!26661 (not b!1088240) (not b!1088245) (not b!1088241) b_and!35995 (not b!1088242) (not b!1088249) (not b!1088243) (not b!1088247))
(check-sat b_and!35995 (not b_next!22659))
