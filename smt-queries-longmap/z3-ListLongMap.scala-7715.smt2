; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97158 () Bool)

(assert start!97158)

(declare-fun b_free!23215 () Bool)

(declare-fun b_next!23215 () Bool)

(assert (=> start!97158 (= b_free!23215 (not b_next!23215))))

(declare-fun tp!81604 () Bool)

(declare-fun b_and!37257 () Bool)

(assert (=> start!97158 (= tp!81604 b_and!37257)))

(declare-fun b!1104062 () Bool)

(declare-fun res!736301 () Bool)

(declare-fun e!630256 () Bool)

(assert (=> b!1104062 (=> (not res!736301) (not e!630256))))

(declare-datatypes ((array!71487 0))(
  ( (array!71488 (arr!34398 (Array (_ BitVec 32) (_ BitVec 64))) (size!34935 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71487)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71487 (_ BitVec 32)) Bool)

(assert (=> b!1104062 (= res!736301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1104063 () Bool)

(declare-fun res!736298 () Bool)

(declare-fun e!630258 () Bool)

(assert (=> b!1104063 (=> (not res!736298) (not e!630258))))

(declare-fun lt!495353 () array!71487)

(declare-datatypes ((List!24051 0))(
  ( (Nil!24048) (Cons!24047 (h!25265 (_ BitVec 64)) (t!34304 List!24051)) )
))
(declare-fun arrayNoDuplicates!0 (array!71487 (_ BitVec 32) List!24051) Bool)

(assert (=> b!1104063 (= res!736298 (arrayNoDuplicates!0 lt!495353 #b00000000000000000000000000000000 Nil!24048))))

(declare-fun b!1104064 () Bool)

(declare-fun res!736306 () Bool)

(assert (=> b!1104064 (=> (not res!736306) (not e!630256))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1104064 (= res!736306 (= (select (arr!34398 _keys!1070) i!650) k0!904))))

(declare-fun b!1104065 () Bool)

(declare-fun e!630254 () Bool)

(assert (=> b!1104065 (= e!630258 (not e!630254))))

(declare-fun res!736305 () Bool)

(assert (=> b!1104065 (=> res!736305 e!630254)))

(declare-datatypes ((V!41481 0))(
  ( (V!41482 (val!13689 Int)) )
))
(declare-datatypes ((tuple2!17430 0))(
  ( (tuple2!17431 (_1!8726 (_ BitVec 64)) (_2!8726 V!41481)) )
))
(declare-datatypes ((List!24052 0))(
  ( (Nil!24049) (Cons!24048 (h!25266 tuple2!17430) (t!34305 List!24052)) )
))
(declare-datatypes ((ListLongMap!15407 0))(
  ( (ListLongMap!15408 (toList!7719 List!24052)) )
))
(declare-fun lt!495357 () ListLongMap!15407)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!495356 () ListLongMap!15407)

(declare-fun lt!495358 () Bool)

(assert (=> b!1104065 (= res!736305 (or (and (not lt!495358) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!495358) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!495358) (not (= lt!495356 lt!495357))))))

(assert (=> b!1104065 (= lt!495358 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41481)

(declare-fun zeroValue!831 () V!41481)

(declare-datatypes ((ValueCell!12923 0))(
  ( (ValueCellFull!12923 (v!16316 V!41481)) (EmptyCell!12923) )
))
(declare-datatypes ((array!71489 0))(
  ( (array!71490 (arr!34399 (Array (_ BitVec 32) ValueCell!12923)) (size!34936 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71489)

(declare-fun lt!495351 () ListLongMap!15407)

(declare-fun getCurrentListMap!4418 (array!71487 array!71489 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15407)

(assert (=> b!1104065 (= lt!495351 (getCurrentListMap!4418 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495359 () array!71489)

(assert (=> b!1104065 (= lt!495356 (getCurrentListMap!4418 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495352 () ListLongMap!15407)

(assert (=> b!1104065 (and (= lt!495357 lt!495352) (= lt!495352 lt!495357))))

(declare-fun lt!495350 () ListLongMap!15407)

(declare-fun -!982 (ListLongMap!15407 (_ BitVec 64)) ListLongMap!15407)

(assert (=> b!1104065 (= lt!495352 (-!982 lt!495350 k0!904))))

(declare-datatypes ((Unit!36225 0))(
  ( (Unit!36226) )
))
(declare-fun lt!495354 () Unit!36225)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 (array!71487 array!71489 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36225)

(assert (=> b!1104065 (= lt!495354 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4259 (array!71487 array!71489 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) Int) ListLongMap!15407)

(assert (=> b!1104065 (= lt!495357 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2377 (Int (_ BitVec 64)) V!41481)

(assert (=> b!1104065 (= lt!495359 (array!71490 (store (arr!34399 _values!874) i!650 (ValueCellFull!12923 (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34936 _values!874)))))

(assert (=> b!1104065 (= lt!495350 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104065 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495355 () Unit!36225)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71487 (_ BitVec 64) (_ BitVec 32)) Unit!36225)

(assert (=> b!1104065 (= lt!495355 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1104066 () Bool)

(assert (=> b!1104066 (= e!630256 e!630258)))

(declare-fun res!736302 () Bool)

(assert (=> b!1104066 (=> (not res!736302) (not e!630258))))

(assert (=> b!1104066 (= res!736302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495353 mask!1414))))

(assert (=> b!1104066 (= lt!495353 (array!71488 (store (arr!34398 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34935 _keys!1070)))))

(declare-fun res!736299 () Bool)

(assert (=> start!97158 (=> (not res!736299) (not e!630256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!97158 (= res!736299 (validMask!0 mask!1414))))

(assert (=> start!97158 e!630256))

(assert (=> start!97158 tp!81604))

(assert (=> start!97158 true))

(declare-fun tp_is_empty!27265 () Bool)

(assert (=> start!97158 tp_is_empty!27265))

(declare-fun array_inv!26520 (array!71487) Bool)

(assert (=> start!97158 (array_inv!26520 _keys!1070)))

(declare-fun e!630253 () Bool)

(declare-fun array_inv!26521 (array!71489) Bool)

(assert (=> start!97158 (and (array_inv!26521 _values!874) e!630253)))

(declare-fun b!1104067 () Bool)

(declare-fun res!736297 () Bool)

(assert (=> b!1104067 (=> (not res!736297) (not e!630256))))

(assert (=> b!1104067 (= res!736297 (and (= (size!34936 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34935 _keys!1070) (size!34936 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1104068 () Bool)

(declare-fun e!630257 () Bool)

(declare-fun mapRes!42691 () Bool)

(assert (=> b!1104068 (= e!630253 (and e!630257 mapRes!42691))))

(declare-fun condMapEmpty!42691 () Bool)

(declare-fun mapDefault!42691 () ValueCell!12923)

(assert (=> b!1104068 (= condMapEmpty!42691 (= (arr!34399 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12923)) mapDefault!42691)))))

(declare-fun b!1104069 () Bool)

(declare-fun e!630255 () Bool)

(assert (=> b!1104069 (= e!630255 tp_is_empty!27265)))

(declare-fun mapNonEmpty!42691 () Bool)

(declare-fun tp!81605 () Bool)

(assert (=> mapNonEmpty!42691 (= mapRes!42691 (and tp!81605 e!630255))))

(declare-fun mapRest!42691 () (Array (_ BitVec 32) ValueCell!12923))

(declare-fun mapKey!42691 () (_ BitVec 32))

(declare-fun mapValue!42691 () ValueCell!12923)

(assert (=> mapNonEmpty!42691 (= (arr!34399 _values!874) (store mapRest!42691 mapKey!42691 mapValue!42691))))

(declare-fun b!1104070 () Bool)

(assert (=> b!1104070 (= e!630257 tp_is_empty!27265)))

(declare-fun b!1104071 () Bool)

(declare-fun res!736303 () Bool)

(assert (=> b!1104071 (=> (not res!736303) (not e!630256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104071 (= res!736303 (validKeyInArray!0 k0!904))))

(declare-fun b!1104072 () Bool)

(assert (=> b!1104072 (= e!630254 (= (-!982 lt!495351 k0!904) lt!495356))))

(declare-fun b!1104073 () Bool)

(declare-fun res!736304 () Bool)

(assert (=> b!1104073 (=> (not res!736304) (not e!630256))))

(assert (=> b!1104073 (= res!736304 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34935 _keys!1070))))))

(declare-fun mapIsEmpty!42691 () Bool)

(assert (=> mapIsEmpty!42691 mapRes!42691))

(declare-fun b!1104074 () Bool)

(declare-fun res!736300 () Bool)

(assert (=> b!1104074 (=> (not res!736300) (not e!630256))))

(assert (=> b!1104074 (= res!736300 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24048))))

(assert (= (and start!97158 res!736299) b!1104067))

(assert (= (and b!1104067 res!736297) b!1104062))

(assert (= (and b!1104062 res!736301) b!1104074))

(assert (= (and b!1104074 res!736300) b!1104073))

(assert (= (and b!1104073 res!736304) b!1104071))

(assert (= (and b!1104071 res!736303) b!1104064))

(assert (= (and b!1104064 res!736306) b!1104066))

(assert (= (and b!1104066 res!736302) b!1104063))

(assert (= (and b!1104063 res!736298) b!1104065))

(assert (= (and b!1104065 (not res!736305)) b!1104072))

(assert (= (and b!1104068 condMapEmpty!42691) mapIsEmpty!42691))

(assert (= (and b!1104068 (not condMapEmpty!42691)) mapNonEmpty!42691))

(get-info :version)

(assert (= (and mapNonEmpty!42691 ((_ is ValueCellFull!12923) mapValue!42691)) b!1104069))

(assert (= (and b!1104068 ((_ is ValueCellFull!12923) mapDefault!42691)) b!1104070))

(assert (= start!97158 b!1104068))

(declare-fun b_lambda!18213 () Bool)

(assert (=> (not b_lambda!18213) (not b!1104065)))

(declare-fun t!34303 () Bool)

(declare-fun tb!8073 () Bool)

(assert (=> (and start!97158 (= defaultEntry!882 defaultEntry!882) t!34303) tb!8073))

(declare-fun result!16699 () Bool)

(assert (=> tb!8073 (= result!16699 tp_is_empty!27265)))

(assert (=> b!1104065 t!34303))

(declare-fun b_and!37259 () Bool)

(assert (= b_and!37257 (and (=> t!34303 result!16699) b_and!37259)))

(declare-fun m!1024729 () Bool)

(assert (=> mapNonEmpty!42691 m!1024729))

(declare-fun m!1024731 () Bool)

(assert (=> b!1104065 m!1024731))

(declare-fun m!1024733 () Bool)

(assert (=> b!1104065 m!1024733))

(declare-fun m!1024735 () Bool)

(assert (=> b!1104065 m!1024735))

(declare-fun m!1024737 () Bool)

(assert (=> b!1104065 m!1024737))

(declare-fun m!1024739 () Bool)

(assert (=> b!1104065 m!1024739))

(declare-fun m!1024741 () Bool)

(assert (=> b!1104065 m!1024741))

(declare-fun m!1024743 () Bool)

(assert (=> b!1104065 m!1024743))

(declare-fun m!1024745 () Bool)

(assert (=> b!1104065 m!1024745))

(declare-fun m!1024747 () Bool)

(assert (=> b!1104065 m!1024747))

(declare-fun m!1024749 () Bool)

(assert (=> b!1104065 m!1024749))

(declare-fun m!1024751 () Bool)

(assert (=> start!97158 m!1024751))

(declare-fun m!1024753 () Bool)

(assert (=> start!97158 m!1024753))

(declare-fun m!1024755 () Bool)

(assert (=> start!97158 m!1024755))

(declare-fun m!1024757 () Bool)

(assert (=> b!1104064 m!1024757))

(declare-fun m!1024759 () Bool)

(assert (=> b!1104063 m!1024759))

(declare-fun m!1024761 () Bool)

(assert (=> b!1104074 m!1024761))

(declare-fun m!1024763 () Bool)

(assert (=> b!1104066 m!1024763))

(declare-fun m!1024765 () Bool)

(assert (=> b!1104066 m!1024765))

(declare-fun m!1024767 () Bool)

(assert (=> b!1104072 m!1024767))

(declare-fun m!1024769 () Bool)

(assert (=> b!1104062 m!1024769))

(declare-fun m!1024771 () Bool)

(assert (=> b!1104071 m!1024771))

(check-sat tp_is_empty!27265 (not b_lambda!18213) (not b!1104062) (not b!1104066) (not b!1104072) (not b_next!23215) (not b!1104071) (not b!1104063) (not b!1104074) b_and!37259 (not start!97158) (not mapNonEmpty!42691) (not b!1104065))
(check-sat b_and!37259 (not b_next!23215))
(get-model)

(declare-fun b_lambda!18219 () Bool)

(assert (= b_lambda!18213 (or (and start!97158 b_free!23215) b_lambda!18219)))

(check-sat tp_is_empty!27265 (not b!1104062) (not b!1104066) (not b!1104072) (not b_next!23215) (not b!1104071) (not b!1104063) (not b!1104074) (not start!97158) (not mapNonEmpty!42691) (not b!1104065) (not b_lambda!18219) b_and!37259)
(check-sat b_and!37259 (not b_next!23215))
(get-model)

(declare-fun bm!46337 () Bool)

(declare-fun call!46340 () Bool)

(assert (=> bm!46337 (= call!46340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!495353 mask!1414))))

(declare-fun b!1104167 () Bool)

(declare-fun e!630310 () Bool)

(declare-fun e!630309 () Bool)

(assert (=> b!1104167 (= e!630310 e!630309)))

(declare-fun c!109332 () Bool)

(assert (=> b!1104167 (= c!109332 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun d!131225 () Bool)

(declare-fun res!736371 () Bool)

(assert (=> d!131225 (=> res!736371 e!630310)))

(assert (=> d!131225 (= res!736371 (bvsge #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(assert (=> d!131225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495353 mask!1414) e!630310)))

(declare-fun b!1104168 () Bool)

(assert (=> b!1104168 (= e!630309 call!46340)))

(declare-fun b!1104169 () Bool)

(declare-fun e!630308 () Bool)

(assert (=> b!1104169 (= e!630309 e!630308)))

(declare-fun lt!495426 () (_ BitVec 64))

(assert (=> b!1104169 (= lt!495426 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(declare-fun lt!495427 () Unit!36225)

(assert (=> b!1104169 (= lt!495427 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!495353 lt!495426 #b00000000000000000000000000000000))))

(assert (=> b!1104169 (arrayContainsKey!0 lt!495353 lt!495426 #b00000000000000000000000000000000)))

(declare-fun lt!495428 () Unit!36225)

(assert (=> b!1104169 (= lt!495428 lt!495427)))

(declare-fun res!736372 () Bool)

(declare-datatypes ((SeekEntryResult!9873 0))(
  ( (MissingZero!9873 (index!41863 (_ BitVec 32))) (Found!9873 (index!41864 (_ BitVec 32))) (Intermediate!9873 (undefined!10685 Bool) (index!41865 (_ BitVec 32)) (x!99170 (_ BitVec 32))) (Undefined!9873) (MissingVacant!9873 (index!41866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71487 (_ BitVec 32)) SeekEntryResult!9873)

(assert (=> b!1104169 (= res!736372 (= (seekEntryOrOpen!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000) lt!495353 mask!1414) (Found!9873 #b00000000000000000000000000000000)))))

(assert (=> b!1104169 (=> (not res!736372) (not e!630308))))

(declare-fun b!1104170 () Bool)

(assert (=> b!1104170 (= e!630308 call!46340)))

(assert (= (and d!131225 (not res!736371)) b!1104167))

(assert (= (and b!1104167 c!109332) b!1104169))

(assert (= (and b!1104167 (not c!109332)) b!1104168))

(assert (= (and b!1104169 res!736372) b!1104170))

(assert (= (or b!1104170 b!1104168) bm!46337))

(declare-fun m!1024861 () Bool)

(assert (=> bm!46337 m!1024861))

(declare-fun m!1024863 () Bool)

(assert (=> b!1104167 m!1024863))

(assert (=> b!1104167 m!1024863))

(declare-fun m!1024865 () Bool)

(assert (=> b!1104167 m!1024865))

(assert (=> b!1104169 m!1024863))

(declare-fun m!1024867 () Bool)

(assert (=> b!1104169 m!1024867))

(declare-fun m!1024869 () Bool)

(assert (=> b!1104169 m!1024869))

(assert (=> b!1104169 m!1024863))

(declare-fun m!1024871 () Bool)

(assert (=> b!1104169 m!1024871))

(assert (=> b!1104066 d!131225))

(declare-fun d!131227 () Bool)

(assert (=> d!131227 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104071 d!131227))

(declare-fun bm!46338 () Bool)

(declare-fun call!46341 () Bool)

(assert (=> bm!46338 (= call!46341 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1104171 () Bool)

(declare-fun e!630313 () Bool)

(declare-fun e!630312 () Bool)

(assert (=> b!1104171 (= e!630313 e!630312)))

(declare-fun c!109333 () Bool)

(assert (=> b!1104171 (= c!109333 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!131229 () Bool)

(declare-fun res!736373 () Bool)

(assert (=> d!131229 (=> res!736373 e!630313)))

(assert (=> d!131229 (= res!736373 (bvsge #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(assert (=> d!131229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!630313)))

(declare-fun b!1104172 () Bool)

(assert (=> b!1104172 (= e!630312 call!46341)))

(declare-fun b!1104173 () Bool)

(declare-fun e!630311 () Bool)

(assert (=> b!1104173 (= e!630312 e!630311)))

(declare-fun lt!495429 () (_ BitVec 64))

(assert (=> b!1104173 (= lt!495429 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495430 () Unit!36225)

(assert (=> b!1104173 (= lt!495430 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!495429 #b00000000000000000000000000000000))))

(assert (=> b!1104173 (arrayContainsKey!0 _keys!1070 lt!495429 #b00000000000000000000000000000000)))

(declare-fun lt!495431 () Unit!36225)

(assert (=> b!1104173 (= lt!495431 lt!495430)))

(declare-fun res!736374 () Bool)

(assert (=> b!1104173 (= res!736374 (= (seekEntryOrOpen!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9873 #b00000000000000000000000000000000)))))

(assert (=> b!1104173 (=> (not res!736374) (not e!630311))))

(declare-fun b!1104174 () Bool)

(assert (=> b!1104174 (= e!630311 call!46341)))

(assert (= (and d!131229 (not res!736373)) b!1104171))

(assert (= (and b!1104171 c!109333) b!1104173))

(assert (= (and b!1104171 (not c!109333)) b!1104172))

(assert (= (and b!1104173 res!736374) b!1104174))

(assert (= (or b!1104174 b!1104172) bm!46338))

(declare-fun m!1024873 () Bool)

(assert (=> bm!46338 m!1024873))

(declare-fun m!1024875 () Bool)

(assert (=> b!1104171 m!1024875))

(assert (=> b!1104171 m!1024875))

(declare-fun m!1024877 () Bool)

(assert (=> b!1104171 m!1024877))

(assert (=> b!1104173 m!1024875))

(declare-fun m!1024879 () Bool)

(assert (=> b!1104173 m!1024879))

(declare-fun m!1024881 () Bool)

(assert (=> b!1104173 m!1024881))

(assert (=> b!1104173 m!1024875))

(declare-fun m!1024883 () Bool)

(assert (=> b!1104173 m!1024883))

(assert (=> b!1104062 d!131229))

(declare-fun d!131231 () Bool)

(assert (=> d!131231 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!97158 d!131231))

(declare-fun d!131233 () Bool)

(assert (=> d!131233 (= (array_inv!26520 _keys!1070) (bvsge (size!34935 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!97158 d!131233))

(declare-fun d!131235 () Bool)

(assert (=> d!131235 (= (array_inv!26521 _values!874) (bvsge (size!34936 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!97158 d!131235))

(declare-fun d!131237 () Bool)

(declare-fun lt!495434 () ListLongMap!15407)

(declare-fun contains!6433 (ListLongMap!15407 (_ BitVec 64)) Bool)

(assert (=> d!131237 (not (contains!6433 lt!495434 k0!904))))

(declare-fun removeStrictlySorted!87 (List!24052 (_ BitVec 64)) List!24052)

(assert (=> d!131237 (= lt!495434 (ListLongMap!15408 (removeStrictlySorted!87 (toList!7719 lt!495351) k0!904)))))

(assert (=> d!131237 (= (-!982 lt!495351 k0!904) lt!495434)))

(declare-fun bs!32373 () Bool)

(assert (= bs!32373 d!131237))

(declare-fun m!1024885 () Bool)

(assert (=> bs!32373 m!1024885))

(declare-fun m!1024887 () Bool)

(assert (=> bs!32373 m!1024887))

(assert (=> b!1104072 d!131237))

(declare-fun b!1104185 () Bool)

(declare-fun e!630322 () Bool)

(declare-fun e!630324 () Bool)

(assert (=> b!1104185 (= e!630322 e!630324)))

(declare-fun c!109336 () Bool)

(assert (=> b!1104185 (= c!109336 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun bm!46341 () Bool)

(declare-fun call!46344 () Bool)

(assert (=> bm!46341 (= call!46344 (arrayNoDuplicates!0 lt!495353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109336 (Cons!24047 (select (arr!34398 lt!495353) #b00000000000000000000000000000000) Nil!24048) Nil!24048)))))

(declare-fun b!1104186 () Bool)

(assert (=> b!1104186 (= e!630324 call!46344)))

(declare-fun b!1104187 () Bool)

(declare-fun e!630323 () Bool)

(assert (=> b!1104187 (= e!630323 e!630322)))

(declare-fun res!736382 () Bool)

(assert (=> b!1104187 (=> (not res!736382) (not e!630322))))

(declare-fun e!630325 () Bool)

(assert (=> b!1104187 (= res!736382 (not e!630325))))

(declare-fun res!736383 () Bool)

(assert (=> b!1104187 (=> (not res!736383) (not e!630325))))

(assert (=> b!1104187 (= res!736383 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun b!1104188 () Bool)

(assert (=> b!1104188 (= e!630324 call!46344)))

(declare-fun d!131239 () Bool)

(declare-fun res!736381 () Bool)

(assert (=> d!131239 (=> res!736381 e!630323)))

(assert (=> d!131239 (= res!736381 (bvsge #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(assert (=> d!131239 (= (arrayNoDuplicates!0 lt!495353 #b00000000000000000000000000000000 Nil!24048) e!630323)))

(declare-fun b!1104189 () Bool)

(declare-fun contains!6434 (List!24051 (_ BitVec 64)) Bool)

(assert (=> b!1104189 (= e!630325 (contains!6434 Nil!24048 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(assert (= (and d!131239 (not res!736381)) b!1104187))

(assert (= (and b!1104187 res!736383) b!1104189))

(assert (= (and b!1104187 res!736382) b!1104185))

(assert (= (and b!1104185 c!109336) b!1104188))

(assert (= (and b!1104185 (not c!109336)) b!1104186))

(assert (= (or b!1104188 b!1104186) bm!46341))

(assert (=> b!1104185 m!1024863))

(assert (=> b!1104185 m!1024863))

(assert (=> b!1104185 m!1024865))

(assert (=> bm!46341 m!1024863))

(declare-fun m!1024889 () Bool)

(assert (=> bm!46341 m!1024889))

(assert (=> b!1104187 m!1024863))

(assert (=> b!1104187 m!1024863))

(assert (=> b!1104187 m!1024865))

(assert (=> b!1104189 m!1024863))

(assert (=> b!1104189 m!1024863))

(declare-fun m!1024891 () Bool)

(assert (=> b!1104189 m!1024891))

(assert (=> b!1104063 d!131239))

(declare-fun b!1104190 () Bool)

(declare-fun e!630326 () Bool)

(declare-fun e!630328 () Bool)

(assert (=> b!1104190 (= e!630326 e!630328)))

(declare-fun c!109337 () Bool)

(assert (=> b!1104190 (= c!109337 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46342 () Bool)

(declare-fun call!46345 () Bool)

(assert (=> bm!46342 (= call!46345 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109337 (Cons!24047 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000) Nil!24048) Nil!24048)))))

(declare-fun b!1104191 () Bool)

(assert (=> b!1104191 (= e!630328 call!46345)))

(declare-fun b!1104192 () Bool)

(declare-fun e!630327 () Bool)

(assert (=> b!1104192 (= e!630327 e!630326)))

(declare-fun res!736385 () Bool)

(assert (=> b!1104192 (=> (not res!736385) (not e!630326))))

(declare-fun e!630329 () Bool)

(assert (=> b!1104192 (= res!736385 (not e!630329))))

(declare-fun res!736386 () Bool)

(assert (=> b!1104192 (=> (not res!736386) (not e!630329))))

(assert (=> b!1104192 (= res!736386 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1104193 () Bool)

(assert (=> b!1104193 (= e!630328 call!46345)))

(declare-fun d!131241 () Bool)

(declare-fun res!736384 () Bool)

(assert (=> d!131241 (=> res!736384 e!630327)))

(assert (=> d!131241 (= res!736384 (bvsge #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(assert (=> d!131241 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24048) e!630327)))

(declare-fun b!1104194 () Bool)

(assert (=> b!1104194 (= e!630329 (contains!6434 Nil!24048 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!131241 (not res!736384)) b!1104192))

(assert (= (and b!1104192 res!736386) b!1104194))

(assert (= (and b!1104192 res!736385) b!1104190))

(assert (= (and b!1104190 c!109337) b!1104193))

(assert (= (and b!1104190 (not c!109337)) b!1104191))

(assert (= (or b!1104193 b!1104191) bm!46342))

(assert (=> b!1104190 m!1024875))

(assert (=> b!1104190 m!1024875))

(assert (=> b!1104190 m!1024877))

(assert (=> bm!46342 m!1024875))

(declare-fun m!1024893 () Bool)

(assert (=> bm!46342 m!1024893))

(assert (=> b!1104192 m!1024875))

(assert (=> b!1104192 m!1024875))

(assert (=> b!1104192 m!1024877))

(assert (=> b!1104194 m!1024875))

(assert (=> b!1104194 m!1024875))

(declare-fun m!1024895 () Bool)

(assert (=> b!1104194 m!1024895))

(assert (=> b!1104074 d!131241))

(declare-fun d!131243 () Bool)

(declare-fun res!736391 () Bool)

(declare-fun e!630334 () Bool)

(assert (=> d!131243 (=> res!736391 e!630334)))

(assert (=> d!131243 (= res!736391 (= (select (arr!34398 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!131243 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!630334)))

(declare-fun b!1104199 () Bool)

(declare-fun e!630335 () Bool)

(assert (=> b!1104199 (= e!630334 e!630335)))

(declare-fun res!736392 () Bool)

(assert (=> b!1104199 (=> (not res!736392) (not e!630335))))

(assert (=> b!1104199 (= res!736392 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34935 _keys!1070)))))

(declare-fun b!1104200 () Bool)

(assert (=> b!1104200 (= e!630335 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!131243 (not res!736391)) b!1104199))

(assert (= (and b!1104199 res!736392) b!1104200))

(assert (=> d!131243 m!1024875))

(declare-fun m!1024897 () Bool)

(assert (=> b!1104200 m!1024897))

(assert (=> b!1104065 d!131243))

(declare-fun b!1104243 () Bool)

(declare-fun e!630362 () ListLongMap!15407)

(declare-fun call!46365 () ListLongMap!15407)

(assert (=> b!1104243 (= e!630362 call!46365)))

(declare-fun b!1104244 () Bool)

(declare-fun e!630369 () Bool)

(declare-fun lt!495491 () ListLongMap!15407)

(declare-fun apply!963 (ListLongMap!15407 (_ BitVec 64)) V!41481)

(assert (=> b!1104244 (= e!630369 (= (apply!963 lt!495491 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1104245 () Bool)

(declare-fun e!630370 () Bool)

(declare-fun e!630371 () Bool)

(assert (=> b!1104245 (= e!630370 e!630371)))

(declare-fun res!736417 () Bool)

(assert (=> b!1104245 (=> (not res!736417) (not e!630371))))

(assert (=> b!1104245 (= res!736417 (contains!6433 lt!495491 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1104245 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun bm!46357 () Bool)

(declare-fun call!46363 () ListLongMap!15407)

(declare-fun call!46360 () ListLongMap!15407)

(assert (=> bm!46357 (= call!46363 call!46360)))

(declare-fun bm!46358 () Bool)

(declare-fun call!46362 () ListLongMap!15407)

(assert (=> bm!46358 (= call!46365 call!46362)))

(declare-fun b!1104246 () Bool)

(declare-fun res!736418 () Bool)

(declare-fun e!630363 () Bool)

(assert (=> b!1104246 (=> (not res!736418) (not e!630363))))

(assert (=> b!1104246 (= res!736418 e!630370)))

(declare-fun res!736414 () Bool)

(assert (=> b!1104246 (=> res!736414 e!630370)))

(declare-fun e!630368 () Bool)

(assert (=> b!1104246 (= res!736414 (not e!630368))))

(declare-fun res!736413 () Bool)

(assert (=> b!1104246 (=> (not res!736413) (not e!630368))))

(assert (=> b!1104246 (= res!736413 (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun bm!46359 () Bool)

(declare-fun call!46361 () Bool)

(assert (=> bm!46359 (= call!46361 (contains!6433 lt!495491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!46366 () ListLongMap!15407)

(declare-fun c!109353 () Bool)

(declare-fun c!109355 () Bool)

(declare-fun bm!46360 () Bool)

(declare-fun +!3441 (ListLongMap!15407 tuple2!17430) ListLongMap!15407)

(assert (=> bm!46360 (= call!46362 (+!3441 (ite c!109353 call!46360 (ite c!109355 call!46363 call!46366)) (ite (or c!109353 c!109355) (tuple2!17431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46361 () Bool)

(declare-fun call!46364 () Bool)

(assert (=> bm!46361 (= call!46364 (contains!6433 lt!495491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104247 () Bool)

(declare-fun e!630372 () ListLongMap!15407)

(assert (=> b!1104247 (= e!630372 call!46366)))

(declare-fun b!1104248 () Bool)

(declare-fun res!736416 () Bool)

(assert (=> b!1104248 (=> (not res!736416) (not e!630363))))

(declare-fun e!630367 () Bool)

(assert (=> b!1104248 (= res!736416 e!630367)))

(declare-fun c!109350 () Bool)

(assert (=> b!1104248 (= c!109350 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1104249 () Bool)

(declare-fun e!630373 () Bool)

(assert (=> b!1104249 (= e!630373 (= (apply!963 lt!495491 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46362 () Bool)

(assert (=> bm!46362 (= call!46366 call!46363)))

(declare-fun b!1104250 () Bool)

(declare-fun get!17701 (ValueCell!12923 V!41481) V!41481)

(assert (=> b!1104250 (= e!630371 (= (apply!963 lt!495491 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)) (get!17701 (select (arr!34399 _values!874) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34936 _values!874)))))

(assert (=> b!1104250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun d!131245 () Bool)

(assert (=> d!131245 e!630363))

(declare-fun res!736412 () Bool)

(assert (=> d!131245 (=> (not res!736412) (not e!630363))))

(assert (=> d!131245 (= res!736412 (or (bvsge #b00000000000000000000000000000000 (size!34935 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))))

(declare-fun lt!495484 () ListLongMap!15407)

(assert (=> d!131245 (= lt!495491 lt!495484)))

(declare-fun lt!495482 () Unit!36225)

(declare-fun e!630374 () Unit!36225)

(assert (=> d!131245 (= lt!495482 e!630374)))

(declare-fun c!109351 () Bool)

(declare-fun e!630365 () Bool)

(assert (=> d!131245 (= c!109351 e!630365)))

(declare-fun res!736415 () Bool)

(assert (=> d!131245 (=> (not res!736415) (not e!630365))))

(assert (=> d!131245 (= res!736415 (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun e!630364 () ListLongMap!15407)

(assert (=> d!131245 (= lt!495484 e!630364)))

(assert (=> d!131245 (= c!109353 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131245 (validMask!0 mask!1414)))

(assert (=> d!131245 (= (getCurrentListMap!4418 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495491)))

(declare-fun b!1104251 () Bool)

(declare-fun lt!495488 () Unit!36225)

(assert (=> b!1104251 (= e!630374 lt!495488)))

(declare-fun lt!495480 () ListLongMap!15407)

(assert (=> b!1104251 (= lt!495480 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495489 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495498 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495498 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495493 () Unit!36225)

(declare-fun addStillContains!667 (ListLongMap!15407 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36225)

(assert (=> b!1104251 (= lt!495493 (addStillContains!667 lt!495480 lt!495489 zeroValue!831 lt!495498))))

(assert (=> b!1104251 (contains!6433 (+!3441 lt!495480 (tuple2!17431 lt!495489 zeroValue!831)) lt!495498)))

(declare-fun lt!495496 () Unit!36225)

(assert (=> b!1104251 (= lt!495496 lt!495493)))

(declare-fun lt!495483 () ListLongMap!15407)

(assert (=> b!1104251 (= lt!495483 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495487 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495487 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495495 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495495 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495485 () Unit!36225)

(declare-fun addApplyDifferent!523 (ListLongMap!15407 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36225)

(assert (=> b!1104251 (= lt!495485 (addApplyDifferent!523 lt!495483 lt!495487 minValue!831 lt!495495))))

(assert (=> b!1104251 (= (apply!963 (+!3441 lt!495483 (tuple2!17431 lt!495487 minValue!831)) lt!495495) (apply!963 lt!495483 lt!495495))))

(declare-fun lt!495497 () Unit!36225)

(assert (=> b!1104251 (= lt!495497 lt!495485)))

(declare-fun lt!495490 () ListLongMap!15407)

(assert (=> b!1104251 (= lt!495490 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495492 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495492 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495486 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495486 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!495500 () Unit!36225)

(assert (=> b!1104251 (= lt!495500 (addApplyDifferent!523 lt!495490 lt!495492 zeroValue!831 lt!495486))))

(assert (=> b!1104251 (= (apply!963 (+!3441 lt!495490 (tuple2!17431 lt!495492 zeroValue!831)) lt!495486) (apply!963 lt!495490 lt!495486))))

(declare-fun lt!495479 () Unit!36225)

(assert (=> b!1104251 (= lt!495479 lt!495500)))

(declare-fun lt!495494 () ListLongMap!15407)

(assert (=> b!1104251 (= lt!495494 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495499 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495481 () (_ BitVec 64))

(assert (=> b!1104251 (= lt!495481 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1104251 (= lt!495488 (addApplyDifferent!523 lt!495494 lt!495499 minValue!831 lt!495481))))

(assert (=> b!1104251 (= (apply!963 (+!3441 lt!495494 (tuple2!17431 lt!495499 minValue!831)) lt!495481) (apply!963 lt!495494 lt!495481))))

(declare-fun b!1104252 () Bool)

(declare-fun c!109354 () Bool)

(assert (=> b!1104252 (= c!109354 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1104252 (= e!630362 e!630372)))

(declare-fun b!1104253 () Bool)

(declare-fun e!630366 () Bool)

(assert (=> b!1104253 (= e!630366 (not call!46364))))

(declare-fun b!1104254 () Bool)

(assert (=> b!1104254 (= e!630366 e!630373)))

(declare-fun res!736411 () Bool)

(assert (=> b!1104254 (= res!736411 call!46364)))

(assert (=> b!1104254 (=> (not res!736411) (not e!630373))))

(declare-fun b!1104255 () Bool)

(assert (=> b!1104255 (= e!630363 e!630366)))

(declare-fun c!109352 () Bool)

(assert (=> b!1104255 (= c!109352 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1104256 () Bool)

(assert (=> b!1104256 (= e!630368 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1104257 () Bool)

(declare-fun Unit!36229 () Unit!36225)

(assert (=> b!1104257 (= e!630374 Unit!36229)))

(declare-fun b!1104258 () Bool)

(assert (=> b!1104258 (= e!630365 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1104259 () Bool)

(assert (=> b!1104259 (= e!630364 e!630362)))

(assert (=> b!1104259 (= c!109355 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1104260 () Bool)

(assert (=> b!1104260 (= e!630367 (not call!46361))))

(declare-fun b!1104261 () Bool)

(assert (=> b!1104261 (= e!630364 (+!3441 call!46362 (tuple2!17431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1104262 () Bool)

(assert (=> b!1104262 (= e!630367 e!630369)))

(declare-fun res!736419 () Bool)

(assert (=> b!1104262 (= res!736419 call!46361)))

(assert (=> b!1104262 (=> (not res!736419) (not e!630369))))

(declare-fun bm!46363 () Bool)

(assert (=> bm!46363 (= call!46360 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1104263 () Bool)

(assert (=> b!1104263 (= e!630372 call!46365)))

(assert (= (and d!131245 c!109353) b!1104261))

(assert (= (and d!131245 (not c!109353)) b!1104259))

(assert (= (and b!1104259 c!109355) b!1104243))

(assert (= (and b!1104259 (not c!109355)) b!1104252))

(assert (= (and b!1104252 c!109354) b!1104263))

(assert (= (and b!1104252 (not c!109354)) b!1104247))

(assert (= (or b!1104263 b!1104247) bm!46362))

(assert (= (or b!1104243 bm!46362) bm!46357))

(assert (= (or b!1104243 b!1104263) bm!46358))

(assert (= (or b!1104261 bm!46357) bm!46363))

(assert (= (or b!1104261 bm!46358) bm!46360))

(assert (= (and d!131245 res!736415) b!1104258))

(assert (= (and d!131245 c!109351) b!1104251))

(assert (= (and d!131245 (not c!109351)) b!1104257))

(assert (= (and d!131245 res!736412) b!1104246))

(assert (= (and b!1104246 res!736413) b!1104256))

(assert (= (and b!1104246 (not res!736414)) b!1104245))

(assert (= (and b!1104245 res!736417) b!1104250))

(assert (= (and b!1104246 res!736418) b!1104248))

(assert (= (and b!1104248 c!109350) b!1104262))

(assert (= (and b!1104248 (not c!109350)) b!1104260))

(assert (= (and b!1104262 res!736419) b!1104244))

(assert (= (or b!1104262 b!1104260) bm!46359))

(assert (= (and b!1104248 res!736416) b!1104255))

(assert (= (and b!1104255 c!109352) b!1104254))

(assert (= (and b!1104255 (not c!109352)) b!1104253))

(assert (= (and b!1104254 res!736411) b!1104249))

(assert (= (or b!1104254 b!1104253) bm!46361))

(declare-fun b_lambda!18221 () Bool)

(assert (=> (not b_lambda!18221) (not b!1104250)))

(assert (=> b!1104250 t!34303))

(declare-fun b_and!37269 () Bool)

(assert (= b_and!37259 (and (=> t!34303 result!16699) b_and!37269)))

(declare-fun m!1024899 () Bool)

(assert (=> b!1104244 m!1024899))

(assert (=> b!1104256 m!1024875))

(assert (=> b!1104256 m!1024875))

(assert (=> b!1104256 m!1024877))

(declare-fun m!1024901 () Bool)

(assert (=> b!1104261 m!1024901))

(declare-fun m!1024903 () Bool)

(assert (=> bm!46360 m!1024903))

(assert (=> d!131245 m!1024751))

(declare-fun m!1024905 () Bool)

(assert (=> bm!46361 m!1024905))

(assert (=> b!1104245 m!1024875))

(assert (=> b!1104245 m!1024875))

(declare-fun m!1024907 () Bool)

(assert (=> b!1104245 m!1024907))

(declare-fun m!1024909 () Bool)

(assert (=> bm!46359 m!1024909))

(declare-fun m!1024911 () Bool)

(assert (=> b!1104250 m!1024911))

(assert (=> b!1104250 m!1024875))

(assert (=> b!1104250 m!1024875))

(declare-fun m!1024913 () Bool)

(assert (=> b!1104250 m!1024913))

(assert (=> b!1104250 m!1024733))

(assert (=> b!1104250 m!1024911))

(assert (=> b!1104250 m!1024733))

(declare-fun m!1024915 () Bool)

(assert (=> b!1104250 m!1024915))

(declare-fun m!1024917 () Bool)

(assert (=> b!1104251 m!1024917))

(assert (=> b!1104251 m!1024749))

(declare-fun m!1024919 () Bool)

(assert (=> b!1104251 m!1024919))

(declare-fun m!1024921 () Bool)

(assert (=> b!1104251 m!1024921))

(declare-fun m!1024923 () Bool)

(assert (=> b!1104251 m!1024923))

(declare-fun m!1024925 () Bool)

(assert (=> b!1104251 m!1024925))

(declare-fun m!1024927 () Bool)

(assert (=> b!1104251 m!1024927))

(declare-fun m!1024929 () Bool)

(assert (=> b!1104251 m!1024929))

(assert (=> b!1104251 m!1024927))

(declare-fun m!1024931 () Bool)

(assert (=> b!1104251 m!1024931))

(declare-fun m!1024933 () Bool)

(assert (=> b!1104251 m!1024933))

(declare-fun m!1024935 () Bool)

(assert (=> b!1104251 m!1024935))

(declare-fun m!1024937 () Bool)

(assert (=> b!1104251 m!1024937))

(assert (=> b!1104251 m!1024875))

(assert (=> b!1104251 m!1024935))

(declare-fun m!1024939 () Bool)

(assert (=> b!1104251 m!1024939))

(declare-fun m!1024941 () Bool)

(assert (=> b!1104251 m!1024941))

(assert (=> b!1104251 m!1024919))

(declare-fun m!1024943 () Bool)

(assert (=> b!1104251 m!1024943))

(assert (=> b!1104251 m!1024921))

(declare-fun m!1024945 () Bool)

(assert (=> b!1104251 m!1024945))

(assert (=> bm!46363 m!1024749))

(assert (=> b!1104258 m!1024875))

(assert (=> b!1104258 m!1024875))

(assert (=> b!1104258 m!1024877))

(declare-fun m!1024947 () Bool)

(assert (=> b!1104249 m!1024947))

(assert (=> b!1104065 d!131245))

(declare-fun b!1104288 () Bool)

(declare-fun lt!495516 () ListLongMap!15407)

(declare-fun e!630393 () Bool)

(assert (=> b!1104288 (= e!630393 (= lt!495516 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1104289 () Bool)

(declare-fun res!736431 () Bool)

(declare-fun e!630389 () Bool)

(assert (=> b!1104289 (=> (not res!736431) (not e!630389))))

(assert (=> b!1104289 (= res!736431 (not (contains!6433 lt!495516 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1104290 () Bool)

(declare-fun e!630391 () ListLongMap!15407)

(assert (=> b!1104290 (= e!630391 (ListLongMap!15408 Nil!24049))))

(declare-fun d!131247 () Bool)

(assert (=> d!131247 e!630389))

(declare-fun res!736430 () Bool)

(assert (=> d!131247 (=> (not res!736430) (not e!630389))))

(assert (=> d!131247 (= res!736430 (not (contains!6433 lt!495516 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131247 (= lt!495516 e!630391)))

(declare-fun c!109367 () Bool)

(assert (=> d!131247 (= c!109367 (bvsge #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(assert (=> d!131247 (validMask!0 mask!1414)))

(assert (=> d!131247 (= (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495516)))

(declare-fun b!1104291 () Bool)

(declare-fun e!630395 () Bool)

(assert (=> b!1104291 (= e!630395 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(assert (=> b!1104291 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1104292 () Bool)

(declare-fun e!630394 () Bool)

(declare-fun e!630392 () Bool)

(assert (=> b!1104292 (= e!630394 e!630392)))

(assert (=> b!1104292 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun res!736429 () Bool)

(assert (=> b!1104292 (= res!736429 (contains!6433 lt!495516 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(assert (=> b!1104292 (=> (not res!736429) (not e!630392))))

(declare-fun call!46369 () ListLongMap!15407)

(declare-fun bm!46366 () Bool)

(assert (=> bm!46366 (= call!46369 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1104293 () Bool)

(assert (=> b!1104293 (= e!630394 e!630393)))

(declare-fun c!109366 () Bool)

(assert (=> b!1104293 (= c!109366 (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun b!1104294 () Bool)

(declare-fun e!630390 () ListLongMap!15407)

(assert (=> b!1104294 (= e!630390 call!46369)))

(declare-fun b!1104295 () Bool)

(assert (=> b!1104295 (= e!630391 e!630390)))

(declare-fun c!109364 () Bool)

(assert (=> b!1104295 (= c!109364 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun b!1104296 () Bool)

(declare-fun lt!495517 () Unit!36225)

(declare-fun lt!495521 () Unit!36225)

(assert (=> b!1104296 (= lt!495517 lt!495521)))

(declare-fun lt!495520 () (_ BitVec 64))

(declare-fun lt!495518 () ListLongMap!15407)

(declare-fun lt!495515 () (_ BitVec 64))

(declare-fun lt!495519 () V!41481)

(assert (=> b!1104296 (not (contains!6433 (+!3441 lt!495518 (tuple2!17431 lt!495520 lt!495519)) lt!495515))))

(declare-fun addStillNotContains!284 (ListLongMap!15407 (_ BitVec 64) V!41481 (_ BitVec 64)) Unit!36225)

(assert (=> b!1104296 (= lt!495521 (addStillNotContains!284 lt!495518 lt!495520 lt!495519 lt!495515))))

(assert (=> b!1104296 (= lt!495515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1104296 (= lt!495519 (get!17701 (select (arr!34399 lt!495359) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1104296 (= lt!495520 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(assert (=> b!1104296 (= lt!495518 call!46369)))

(assert (=> b!1104296 (= e!630390 (+!3441 call!46369 (tuple2!17431 (select (arr!34398 lt!495353) #b00000000000000000000000000000000) (get!17701 (select (arr!34399 lt!495359) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1104297 () Bool)

(assert (=> b!1104297 (= e!630389 e!630394)))

(declare-fun c!109365 () Bool)

(assert (=> b!1104297 (= c!109365 e!630395)))

(declare-fun res!736428 () Bool)

(assert (=> b!1104297 (=> (not res!736428) (not e!630395))))

(assert (=> b!1104297 (= res!736428 (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun b!1104298 () Bool)

(declare-fun isEmpty!976 (ListLongMap!15407) Bool)

(assert (=> b!1104298 (= e!630393 (isEmpty!976 lt!495516))))

(declare-fun b!1104299 () Bool)

(assert (=> b!1104299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(assert (=> b!1104299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34936 lt!495359)))))

(assert (=> b!1104299 (= e!630392 (= (apply!963 lt!495516 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)) (get!17701 (select (arr!34399 lt!495359) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131247 c!109367) b!1104290))

(assert (= (and d!131247 (not c!109367)) b!1104295))

(assert (= (and b!1104295 c!109364) b!1104296))

(assert (= (and b!1104295 (not c!109364)) b!1104294))

(assert (= (or b!1104296 b!1104294) bm!46366))

(assert (= (and d!131247 res!736430) b!1104289))

(assert (= (and b!1104289 res!736431) b!1104297))

(assert (= (and b!1104297 res!736428) b!1104291))

(assert (= (and b!1104297 c!109365) b!1104292))

(assert (= (and b!1104297 (not c!109365)) b!1104293))

(assert (= (and b!1104292 res!736429) b!1104299))

(assert (= (and b!1104293 c!109366) b!1104288))

(assert (= (and b!1104293 (not c!109366)) b!1104298))

(declare-fun b_lambda!18223 () Bool)

(assert (=> (not b_lambda!18223) (not b!1104296)))

(assert (=> b!1104296 t!34303))

(declare-fun b_and!37271 () Bool)

(assert (= b_and!37269 (and (=> t!34303 result!16699) b_and!37271)))

(declare-fun b_lambda!18225 () Bool)

(assert (=> (not b_lambda!18225) (not b!1104299)))

(assert (=> b!1104299 t!34303))

(declare-fun b_and!37273 () Bool)

(assert (= b_and!37271 (and (=> t!34303 result!16699) b_and!37273)))

(declare-fun m!1024949 () Bool)

(assert (=> b!1104289 m!1024949))

(assert (=> b!1104295 m!1024863))

(assert (=> b!1104295 m!1024863))

(assert (=> b!1104295 m!1024865))

(assert (=> b!1104296 m!1024733))

(declare-fun m!1024951 () Bool)

(assert (=> b!1104296 m!1024951))

(assert (=> b!1104296 m!1024863))

(declare-fun m!1024953 () Bool)

(assert (=> b!1104296 m!1024953))

(declare-fun m!1024955 () Bool)

(assert (=> b!1104296 m!1024955))

(assert (=> b!1104296 m!1024951))

(assert (=> b!1104296 m!1024733))

(declare-fun m!1024957 () Bool)

(assert (=> b!1104296 m!1024957))

(declare-fun m!1024959 () Bool)

(assert (=> b!1104296 m!1024959))

(assert (=> b!1104296 m!1024953))

(declare-fun m!1024961 () Bool)

(assert (=> b!1104296 m!1024961))

(declare-fun m!1024963 () Bool)

(assert (=> b!1104298 m!1024963))

(declare-fun m!1024965 () Bool)

(assert (=> d!131247 m!1024965))

(assert (=> d!131247 m!1024751))

(assert (=> b!1104292 m!1024863))

(assert (=> b!1104292 m!1024863))

(declare-fun m!1024967 () Bool)

(assert (=> b!1104292 m!1024967))

(assert (=> b!1104299 m!1024733))

(assert (=> b!1104299 m!1024863))

(declare-fun m!1024969 () Bool)

(assert (=> b!1104299 m!1024969))

(assert (=> b!1104299 m!1024951))

(assert (=> b!1104299 m!1024863))

(assert (=> b!1104299 m!1024951))

(assert (=> b!1104299 m!1024733))

(assert (=> b!1104299 m!1024957))

(assert (=> b!1104291 m!1024863))

(assert (=> b!1104291 m!1024863))

(assert (=> b!1104291 m!1024865))

(declare-fun m!1024971 () Bool)

(assert (=> bm!46366 m!1024971))

(assert (=> b!1104288 m!1024971))

(assert (=> b!1104065 d!131247))

(declare-fun lt!495523 () ListLongMap!15407)

(declare-fun e!630400 () Bool)

(declare-fun b!1104300 () Bool)

(assert (=> b!1104300 (= e!630400 (= lt!495523 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1104301 () Bool)

(declare-fun res!736435 () Bool)

(declare-fun e!630396 () Bool)

(assert (=> b!1104301 (=> (not res!736435) (not e!630396))))

(assert (=> b!1104301 (= res!736435 (not (contains!6433 lt!495523 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1104302 () Bool)

(declare-fun e!630398 () ListLongMap!15407)

(assert (=> b!1104302 (= e!630398 (ListLongMap!15408 Nil!24049))))

(declare-fun d!131249 () Bool)

(assert (=> d!131249 e!630396))

(declare-fun res!736434 () Bool)

(assert (=> d!131249 (=> (not res!736434) (not e!630396))))

(assert (=> d!131249 (= res!736434 (not (contains!6433 lt!495523 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!131249 (= lt!495523 e!630398)))

(declare-fun c!109371 () Bool)

(assert (=> d!131249 (= c!109371 (bvsge #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(assert (=> d!131249 (validMask!0 mask!1414)))

(assert (=> d!131249 (= (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495523)))

(declare-fun b!1104303 () Bool)

(declare-fun e!630402 () Bool)

(assert (=> b!1104303 (= e!630402 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1104303 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1104304 () Bool)

(declare-fun e!630401 () Bool)

(declare-fun e!630399 () Bool)

(assert (=> b!1104304 (= e!630401 e!630399)))

(assert (=> b!1104304 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun res!736433 () Bool)

(assert (=> b!1104304 (= res!736433 (contains!6433 lt!495523 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1104304 (=> (not res!736433) (not e!630399))))

(declare-fun bm!46367 () Bool)

(declare-fun call!46370 () ListLongMap!15407)

(assert (=> bm!46367 (= call!46370 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1104305 () Bool)

(assert (=> b!1104305 (= e!630401 e!630400)))

(declare-fun c!109370 () Bool)

(assert (=> b!1104305 (= c!109370 (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun b!1104306 () Bool)

(declare-fun e!630397 () ListLongMap!15407)

(assert (=> b!1104306 (= e!630397 call!46370)))

(declare-fun b!1104307 () Bool)

(assert (=> b!1104307 (= e!630398 e!630397)))

(declare-fun c!109368 () Bool)

(assert (=> b!1104307 (= c!109368 (validKeyInArray!0 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1104308 () Bool)

(declare-fun lt!495524 () Unit!36225)

(declare-fun lt!495528 () Unit!36225)

(assert (=> b!1104308 (= lt!495524 lt!495528)))

(declare-fun lt!495522 () (_ BitVec 64))

(declare-fun lt!495525 () ListLongMap!15407)

(declare-fun lt!495527 () (_ BitVec 64))

(declare-fun lt!495526 () V!41481)

(assert (=> b!1104308 (not (contains!6433 (+!3441 lt!495525 (tuple2!17431 lt!495527 lt!495526)) lt!495522))))

(assert (=> b!1104308 (= lt!495528 (addStillNotContains!284 lt!495525 lt!495527 lt!495526 lt!495522))))

(assert (=> b!1104308 (= lt!495522 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1104308 (= lt!495526 (get!17701 (select (arr!34399 _values!874) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1104308 (= lt!495527 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1104308 (= lt!495525 call!46370)))

(assert (=> b!1104308 (= e!630397 (+!3441 call!46370 (tuple2!17431 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000) (get!17701 (select (arr!34399 _values!874) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1104309 () Bool)

(assert (=> b!1104309 (= e!630396 e!630401)))

(declare-fun c!109369 () Bool)

(assert (=> b!1104309 (= c!109369 e!630402)))

(declare-fun res!736432 () Bool)

(assert (=> b!1104309 (=> (not res!736432) (not e!630402))))

(assert (=> b!1104309 (= res!736432 (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(declare-fun b!1104310 () Bool)

(assert (=> b!1104310 (= e!630400 (isEmpty!976 lt!495523))))

(declare-fun b!1104311 () Bool)

(assert (=> b!1104311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(assert (=> b!1104311 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34936 _values!874)))))

(assert (=> b!1104311 (= e!630399 (= (apply!963 lt!495523 (select (arr!34398 _keys!1070) #b00000000000000000000000000000000)) (get!17701 (select (arr!34399 _values!874) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!131249 c!109371) b!1104302))

(assert (= (and d!131249 (not c!109371)) b!1104307))

(assert (= (and b!1104307 c!109368) b!1104308))

(assert (= (and b!1104307 (not c!109368)) b!1104306))

(assert (= (or b!1104308 b!1104306) bm!46367))

(assert (= (and d!131249 res!736434) b!1104301))

(assert (= (and b!1104301 res!736435) b!1104309))

(assert (= (and b!1104309 res!736432) b!1104303))

(assert (= (and b!1104309 c!109369) b!1104304))

(assert (= (and b!1104309 (not c!109369)) b!1104305))

(assert (= (and b!1104304 res!736433) b!1104311))

(assert (= (and b!1104305 c!109370) b!1104300))

(assert (= (and b!1104305 (not c!109370)) b!1104310))

(declare-fun b_lambda!18227 () Bool)

(assert (=> (not b_lambda!18227) (not b!1104308)))

(assert (=> b!1104308 t!34303))

(declare-fun b_and!37275 () Bool)

(assert (= b_and!37273 (and (=> t!34303 result!16699) b_and!37275)))

(declare-fun b_lambda!18229 () Bool)

(assert (=> (not b_lambda!18229) (not b!1104311)))

(assert (=> b!1104311 t!34303))

(declare-fun b_and!37277 () Bool)

(assert (= b_and!37275 (and (=> t!34303 result!16699) b_and!37277)))

(declare-fun m!1024973 () Bool)

(assert (=> b!1104301 m!1024973))

(assert (=> b!1104307 m!1024875))

(assert (=> b!1104307 m!1024875))

(assert (=> b!1104307 m!1024877))

(assert (=> b!1104308 m!1024733))

(assert (=> b!1104308 m!1024911))

(assert (=> b!1104308 m!1024875))

(declare-fun m!1024975 () Bool)

(assert (=> b!1104308 m!1024975))

(declare-fun m!1024977 () Bool)

(assert (=> b!1104308 m!1024977))

(assert (=> b!1104308 m!1024911))

(assert (=> b!1104308 m!1024733))

(assert (=> b!1104308 m!1024915))

(declare-fun m!1024979 () Bool)

(assert (=> b!1104308 m!1024979))

(assert (=> b!1104308 m!1024975))

(declare-fun m!1024981 () Bool)

(assert (=> b!1104308 m!1024981))

(declare-fun m!1024983 () Bool)

(assert (=> b!1104310 m!1024983))

(declare-fun m!1024985 () Bool)

(assert (=> d!131249 m!1024985))

(assert (=> d!131249 m!1024751))

(assert (=> b!1104304 m!1024875))

(assert (=> b!1104304 m!1024875))

(declare-fun m!1024987 () Bool)

(assert (=> b!1104304 m!1024987))

(assert (=> b!1104311 m!1024733))

(assert (=> b!1104311 m!1024875))

(declare-fun m!1024989 () Bool)

(assert (=> b!1104311 m!1024989))

(assert (=> b!1104311 m!1024911))

(assert (=> b!1104311 m!1024875))

(assert (=> b!1104311 m!1024911))

(assert (=> b!1104311 m!1024733))

(assert (=> b!1104311 m!1024915))

(assert (=> b!1104303 m!1024875))

(assert (=> b!1104303 m!1024875))

(assert (=> b!1104303 m!1024877))

(declare-fun m!1024991 () Bool)

(assert (=> bm!46367 m!1024991))

(assert (=> b!1104300 m!1024991))

(assert (=> b!1104065 d!131249))

(declare-fun b!1104312 () Bool)

(declare-fun e!630403 () ListLongMap!15407)

(declare-fun call!46376 () ListLongMap!15407)

(assert (=> b!1104312 (= e!630403 call!46376)))

(declare-fun b!1104313 () Bool)

(declare-fun e!630410 () Bool)

(declare-fun lt!495541 () ListLongMap!15407)

(assert (=> b!1104313 (= e!630410 (= (apply!963 lt!495541 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun b!1104314 () Bool)

(declare-fun e!630411 () Bool)

(declare-fun e!630412 () Bool)

(assert (=> b!1104314 (= e!630411 e!630412)))

(declare-fun res!736442 () Bool)

(assert (=> b!1104314 (=> (not res!736442) (not e!630412))))

(assert (=> b!1104314 (= res!736442 (contains!6433 lt!495541 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(assert (=> b!1104314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun bm!46368 () Bool)

(declare-fun call!46374 () ListLongMap!15407)

(declare-fun call!46371 () ListLongMap!15407)

(assert (=> bm!46368 (= call!46374 call!46371)))

(declare-fun bm!46369 () Bool)

(declare-fun call!46373 () ListLongMap!15407)

(assert (=> bm!46369 (= call!46376 call!46373)))

(declare-fun b!1104315 () Bool)

(declare-fun res!736443 () Bool)

(declare-fun e!630404 () Bool)

(assert (=> b!1104315 (=> (not res!736443) (not e!630404))))

(assert (=> b!1104315 (= res!736443 e!630411)))

(declare-fun res!736439 () Bool)

(assert (=> b!1104315 (=> res!736439 e!630411)))

(declare-fun e!630409 () Bool)

(assert (=> b!1104315 (= res!736439 (not e!630409))))

(declare-fun res!736438 () Bool)

(assert (=> b!1104315 (=> (not res!736438) (not e!630409))))

(assert (=> b!1104315 (= res!736438 (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun bm!46370 () Bool)

(declare-fun call!46372 () Bool)

(assert (=> bm!46370 (= call!46372 (contains!6433 lt!495541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!46377 () ListLongMap!15407)

(declare-fun c!109375 () Bool)

(declare-fun c!109377 () Bool)

(declare-fun bm!46371 () Bool)

(assert (=> bm!46371 (= call!46373 (+!3441 (ite c!109375 call!46371 (ite c!109377 call!46374 call!46377)) (ite (or c!109375 c!109377) (tuple2!17431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun bm!46372 () Bool)

(declare-fun call!46375 () Bool)

(assert (=> bm!46372 (= call!46375 (contains!6433 lt!495541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104316 () Bool)

(declare-fun e!630413 () ListLongMap!15407)

(assert (=> b!1104316 (= e!630413 call!46377)))

(declare-fun b!1104317 () Bool)

(declare-fun res!736441 () Bool)

(assert (=> b!1104317 (=> (not res!736441) (not e!630404))))

(declare-fun e!630408 () Bool)

(assert (=> b!1104317 (= res!736441 e!630408)))

(declare-fun c!109372 () Bool)

(assert (=> b!1104317 (= c!109372 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1104318 () Bool)

(declare-fun e!630414 () Bool)

(assert (=> b!1104318 (= e!630414 (= (apply!963 lt!495541 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun bm!46373 () Bool)

(assert (=> bm!46373 (= call!46377 call!46374)))

(declare-fun b!1104319 () Bool)

(assert (=> b!1104319 (= e!630412 (= (apply!963 lt!495541 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)) (get!17701 (select (arr!34399 lt!495359) #b00000000000000000000000000000000) (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1104319 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34936 lt!495359)))))

(assert (=> b!1104319 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun d!131251 () Bool)

(assert (=> d!131251 e!630404))

(declare-fun res!736437 () Bool)

(assert (=> d!131251 (=> (not res!736437) (not e!630404))))

(assert (=> d!131251 (= res!736437 (or (bvsge #b00000000000000000000000000000000 (size!34935 lt!495353)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))))

(declare-fun lt!495534 () ListLongMap!15407)

(assert (=> d!131251 (= lt!495541 lt!495534)))

(declare-fun lt!495532 () Unit!36225)

(declare-fun e!630415 () Unit!36225)

(assert (=> d!131251 (= lt!495532 e!630415)))

(declare-fun c!109373 () Bool)

(declare-fun e!630406 () Bool)

(assert (=> d!131251 (= c!109373 e!630406)))

(declare-fun res!736440 () Bool)

(assert (=> d!131251 (=> (not res!736440) (not e!630406))))

(assert (=> d!131251 (= res!736440 (bvslt #b00000000000000000000000000000000 (size!34935 lt!495353)))))

(declare-fun e!630405 () ListLongMap!15407)

(assert (=> d!131251 (= lt!495534 e!630405)))

(assert (=> d!131251 (= c!109375 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!131251 (validMask!0 mask!1414)))

(assert (=> d!131251 (= (getCurrentListMap!4418 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!495541)))

(declare-fun b!1104320 () Bool)

(declare-fun lt!495538 () Unit!36225)

(assert (=> b!1104320 (= e!630415 lt!495538)))

(declare-fun lt!495530 () ListLongMap!15407)

(assert (=> b!1104320 (= lt!495530 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495539 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495539 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495548 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495548 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(declare-fun lt!495543 () Unit!36225)

(assert (=> b!1104320 (= lt!495543 (addStillContains!667 lt!495530 lt!495539 zeroValue!831 lt!495548))))

(assert (=> b!1104320 (contains!6433 (+!3441 lt!495530 (tuple2!17431 lt!495539 zeroValue!831)) lt!495548)))

(declare-fun lt!495546 () Unit!36225)

(assert (=> b!1104320 (= lt!495546 lt!495543)))

(declare-fun lt!495533 () ListLongMap!15407)

(assert (=> b!1104320 (= lt!495533 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495537 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495537 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495545 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495545 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(declare-fun lt!495535 () Unit!36225)

(assert (=> b!1104320 (= lt!495535 (addApplyDifferent!523 lt!495533 lt!495537 minValue!831 lt!495545))))

(assert (=> b!1104320 (= (apply!963 (+!3441 lt!495533 (tuple2!17431 lt!495537 minValue!831)) lt!495545) (apply!963 lt!495533 lt!495545))))

(declare-fun lt!495547 () Unit!36225)

(assert (=> b!1104320 (= lt!495547 lt!495535)))

(declare-fun lt!495540 () ListLongMap!15407)

(assert (=> b!1104320 (= lt!495540 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495542 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495542 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495536 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495536 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(declare-fun lt!495550 () Unit!36225)

(assert (=> b!1104320 (= lt!495550 (addApplyDifferent!523 lt!495540 lt!495542 zeroValue!831 lt!495536))))

(assert (=> b!1104320 (= (apply!963 (+!3441 lt!495540 (tuple2!17431 lt!495542 zeroValue!831)) lt!495536) (apply!963 lt!495540 lt!495536))))

(declare-fun lt!495529 () Unit!36225)

(assert (=> b!1104320 (= lt!495529 lt!495550)))

(declare-fun lt!495544 () ListLongMap!15407)

(assert (=> b!1104320 (= lt!495544 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!495549 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!495531 () (_ BitVec 64))

(assert (=> b!1104320 (= lt!495531 (select (arr!34398 lt!495353) #b00000000000000000000000000000000))))

(assert (=> b!1104320 (= lt!495538 (addApplyDifferent!523 lt!495544 lt!495549 minValue!831 lt!495531))))

(assert (=> b!1104320 (= (apply!963 (+!3441 lt!495544 (tuple2!17431 lt!495549 minValue!831)) lt!495531) (apply!963 lt!495544 lt!495531))))

(declare-fun b!1104321 () Bool)

(declare-fun c!109376 () Bool)

(assert (=> b!1104321 (= c!109376 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1104321 (= e!630403 e!630413)))

(declare-fun b!1104322 () Bool)

(declare-fun e!630407 () Bool)

(assert (=> b!1104322 (= e!630407 (not call!46375))))

(declare-fun b!1104323 () Bool)

(assert (=> b!1104323 (= e!630407 e!630414)))

(declare-fun res!736436 () Bool)

(assert (=> b!1104323 (= res!736436 call!46375)))

(assert (=> b!1104323 (=> (not res!736436) (not e!630414))))

(declare-fun b!1104324 () Bool)

(assert (=> b!1104324 (= e!630404 e!630407)))

(declare-fun c!109374 () Bool)

(assert (=> b!1104324 (= c!109374 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1104325 () Bool)

(assert (=> b!1104325 (= e!630409 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun b!1104326 () Bool)

(declare-fun Unit!36230 () Unit!36225)

(assert (=> b!1104326 (= e!630415 Unit!36230)))

(declare-fun b!1104327 () Bool)

(assert (=> b!1104327 (= e!630406 (validKeyInArray!0 (select (arr!34398 lt!495353) #b00000000000000000000000000000000)))))

(declare-fun b!1104328 () Bool)

(assert (=> b!1104328 (= e!630405 e!630403)))

(assert (=> b!1104328 (= c!109377 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1104329 () Bool)

(assert (=> b!1104329 (= e!630408 (not call!46372))))

(declare-fun b!1104330 () Bool)

(assert (=> b!1104330 (= e!630405 (+!3441 call!46373 (tuple2!17431 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1104331 () Bool)

(assert (=> b!1104331 (= e!630408 e!630410)))

(declare-fun res!736444 () Bool)

(assert (=> b!1104331 (= res!736444 call!46372)))

(assert (=> b!1104331 (=> (not res!736444) (not e!630410))))

(declare-fun bm!46374 () Bool)

(assert (=> bm!46374 (= call!46371 (getCurrentListMapNoExtraKeys!4259 lt!495353 lt!495359 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1104332 () Bool)

(assert (=> b!1104332 (= e!630413 call!46376)))

(assert (= (and d!131251 c!109375) b!1104330))

(assert (= (and d!131251 (not c!109375)) b!1104328))

(assert (= (and b!1104328 c!109377) b!1104312))

(assert (= (and b!1104328 (not c!109377)) b!1104321))

(assert (= (and b!1104321 c!109376) b!1104332))

(assert (= (and b!1104321 (not c!109376)) b!1104316))

(assert (= (or b!1104332 b!1104316) bm!46373))

(assert (= (or b!1104312 bm!46373) bm!46368))

(assert (= (or b!1104312 b!1104332) bm!46369))

(assert (= (or b!1104330 bm!46368) bm!46374))

(assert (= (or b!1104330 bm!46369) bm!46371))

(assert (= (and d!131251 res!736440) b!1104327))

(assert (= (and d!131251 c!109373) b!1104320))

(assert (= (and d!131251 (not c!109373)) b!1104326))

(assert (= (and d!131251 res!736437) b!1104315))

(assert (= (and b!1104315 res!736438) b!1104325))

(assert (= (and b!1104315 (not res!736439)) b!1104314))

(assert (= (and b!1104314 res!736442) b!1104319))

(assert (= (and b!1104315 res!736443) b!1104317))

(assert (= (and b!1104317 c!109372) b!1104331))

(assert (= (and b!1104317 (not c!109372)) b!1104329))

(assert (= (and b!1104331 res!736444) b!1104313))

(assert (= (or b!1104331 b!1104329) bm!46370))

(assert (= (and b!1104317 res!736441) b!1104324))

(assert (= (and b!1104324 c!109374) b!1104323))

(assert (= (and b!1104324 (not c!109374)) b!1104322))

(assert (= (and b!1104323 res!736436) b!1104318))

(assert (= (or b!1104323 b!1104322) bm!46372))

(declare-fun b_lambda!18231 () Bool)

(assert (=> (not b_lambda!18231) (not b!1104319)))

(assert (=> b!1104319 t!34303))

(declare-fun b_and!37279 () Bool)

(assert (= b_and!37277 (and (=> t!34303 result!16699) b_and!37279)))

(declare-fun m!1024993 () Bool)

(assert (=> b!1104313 m!1024993))

(assert (=> b!1104325 m!1024863))

(assert (=> b!1104325 m!1024863))

(assert (=> b!1104325 m!1024865))

(declare-fun m!1024995 () Bool)

(assert (=> b!1104330 m!1024995))

(declare-fun m!1024997 () Bool)

(assert (=> bm!46371 m!1024997))

(assert (=> d!131251 m!1024751))

(declare-fun m!1024999 () Bool)

(assert (=> bm!46372 m!1024999))

(assert (=> b!1104314 m!1024863))

(assert (=> b!1104314 m!1024863))

(declare-fun m!1025001 () Bool)

(assert (=> b!1104314 m!1025001))

(declare-fun m!1025003 () Bool)

(assert (=> bm!46370 m!1025003))

(assert (=> b!1104319 m!1024951))

(assert (=> b!1104319 m!1024863))

(assert (=> b!1104319 m!1024863))

(declare-fun m!1025005 () Bool)

(assert (=> b!1104319 m!1025005))

(assert (=> b!1104319 m!1024733))

(assert (=> b!1104319 m!1024951))

(assert (=> b!1104319 m!1024733))

(assert (=> b!1104319 m!1024957))

(declare-fun m!1025007 () Bool)

(assert (=> b!1104320 m!1025007))

(assert (=> b!1104320 m!1024747))

(declare-fun m!1025009 () Bool)

(assert (=> b!1104320 m!1025009))

(declare-fun m!1025011 () Bool)

(assert (=> b!1104320 m!1025011))

(declare-fun m!1025013 () Bool)

(assert (=> b!1104320 m!1025013))

(declare-fun m!1025015 () Bool)

(assert (=> b!1104320 m!1025015))

(declare-fun m!1025017 () Bool)

(assert (=> b!1104320 m!1025017))

(declare-fun m!1025019 () Bool)

(assert (=> b!1104320 m!1025019))

(assert (=> b!1104320 m!1025017))

(declare-fun m!1025021 () Bool)

(assert (=> b!1104320 m!1025021))

(declare-fun m!1025023 () Bool)

(assert (=> b!1104320 m!1025023))

(declare-fun m!1025025 () Bool)

(assert (=> b!1104320 m!1025025))

(declare-fun m!1025027 () Bool)

(assert (=> b!1104320 m!1025027))

(assert (=> b!1104320 m!1024863))

(assert (=> b!1104320 m!1025025))

(declare-fun m!1025029 () Bool)

(assert (=> b!1104320 m!1025029))

(declare-fun m!1025031 () Bool)

(assert (=> b!1104320 m!1025031))

(assert (=> b!1104320 m!1025009))

(declare-fun m!1025033 () Bool)

(assert (=> b!1104320 m!1025033))

(assert (=> b!1104320 m!1025011))

(declare-fun m!1025035 () Bool)

(assert (=> b!1104320 m!1025035))

(assert (=> bm!46374 m!1024747))

(assert (=> b!1104327 m!1024863))

(assert (=> b!1104327 m!1024863))

(assert (=> b!1104327 m!1024865))

(declare-fun m!1025037 () Bool)

(assert (=> b!1104318 m!1025037))

(assert (=> b!1104065 d!131251))

(declare-fun d!131253 () Bool)

(assert (=> d!131253 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!495553 () Unit!36225)

(declare-fun choose!13 (array!71487 (_ BitVec 64) (_ BitVec 32)) Unit!36225)

(assert (=> d!131253 (= lt!495553 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!131253 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!131253 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!495553)))

(declare-fun bs!32374 () Bool)

(assert (= bs!32374 d!131253))

(assert (=> bs!32374 m!1024739))

(declare-fun m!1025039 () Bool)

(assert (=> bs!32374 m!1025039))

(assert (=> b!1104065 d!131253))

(declare-fun d!131255 () Bool)

(declare-fun e!630420 () Bool)

(assert (=> d!131255 e!630420))

(declare-fun res!736447 () Bool)

(assert (=> d!131255 (=> (not res!736447) (not e!630420))))

(assert (=> d!131255 (= res!736447 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34935 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34935 _keys!1070))))))))

(declare-fun lt!495556 () Unit!36225)

(declare-fun choose!1778 (array!71487 array!71489 (_ BitVec 32) (_ BitVec 32) V!41481 V!41481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36225)

(assert (=> d!131255 (= lt!495556 (choose!1778 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!131255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34935 _keys!1070)))))

(assert (=> d!131255 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!495556)))

(declare-fun b!1104339 () Bool)

(declare-fun e!630421 () Bool)

(declare-fun call!46383 () ListLongMap!15407)

(declare-fun call!46382 () ListLongMap!15407)

(assert (=> b!1104339 (= e!630421 (= call!46383 call!46382))))

(assert (=> b!1104339 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34936 _values!874)))))

(declare-fun bm!46379 () Bool)

(assert (=> bm!46379 (= call!46382 (getCurrentListMapNoExtraKeys!4259 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1104340 () Bool)

(assert (=> b!1104340 (= e!630420 e!630421)))

(declare-fun c!109380 () Bool)

(assert (=> b!1104340 (= c!109380 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun b!1104341 () Bool)

(assert (=> b!1104341 (= e!630421 (= call!46383 (-!982 call!46382 k0!904)))))

(assert (=> b!1104341 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34936 _values!874)))))

(declare-fun bm!46380 () Bool)

(assert (=> bm!46380 (= call!46383 (getCurrentListMapNoExtraKeys!4259 (array!71488 (store (arr!34398 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34935 _keys!1070)) (array!71490 (store (arr!34399 _values!874) i!650 (ValueCellFull!12923 (dynLambda!2377 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34936 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!131255 res!736447) b!1104340))

(assert (= (and b!1104340 c!109380) b!1104341))

(assert (= (and b!1104340 (not c!109380)) b!1104339))

(assert (= (or b!1104341 b!1104339) bm!46379))

(assert (= (or b!1104341 b!1104339) bm!46380))

(declare-fun b_lambda!18233 () Bool)

(assert (=> (not b_lambda!18233) (not bm!46380)))

(assert (=> bm!46380 t!34303))

(declare-fun b_and!37281 () Bool)

(assert (= b_and!37279 (and (=> t!34303 result!16699) b_and!37281)))

(declare-fun m!1025041 () Bool)

(assert (=> d!131255 m!1025041))

(assert (=> bm!46379 m!1024749))

(declare-fun m!1025043 () Bool)

(assert (=> b!1104341 m!1025043))

(assert (=> bm!46380 m!1024765))

(assert (=> bm!46380 m!1024733))

(assert (=> bm!46380 m!1024737))

(declare-fun m!1025045 () Bool)

(assert (=> bm!46380 m!1025045))

(assert (=> b!1104065 d!131255))

(declare-fun d!131257 () Bool)

(declare-fun lt!495557 () ListLongMap!15407)

(assert (=> d!131257 (not (contains!6433 lt!495557 k0!904))))

(assert (=> d!131257 (= lt!495557 (ListLongMap!15408 (removeStrictlySorted!87 (toList!7719 lt!495350) k0!904)))))

(assert (=> d!131257 (= (-!982 lt!495350 k0!904) lt!495557)))

(declare-fun bs!32375 () Bool)

(assert (= bs!32375 d!131257))

(declare-fun m!1025047 () Bool)

(assert (=> bs!32375 m!1025047))

(declare-fun m!1025049 () Bool)

(assert (=> bs!32375 m!1025049))

(assert (=> b!1104065 d!131257))

(declare-fun mapIsEmpty!42700 () Bool)

(declare-fun mapRes!42700 () Bool)

(assert (=> mapIsEmpty!42700 mapRes!42700))

(declare-fun b!1104349 () Bool)

(declare-fun e!630427 () Bool)

(assert (=> b!1104349 (= e!630427 tp_is_empty!27265)))

(declare-fun b!1104348 () Bool)

(declare-fun e!630426 () Bool)

(assert (=> b!1104348 (= e!630426 tp_is_empty!27265)))

(declare-fun mapNonEmpty!42700 () Bool)

(declare-fun tp!81620 () Bool)

(assert (=> mapNonEmpty!42700 (= mapRes!42700 (and tp!81620 e!630426))))

(declare-fun mapRest!42700 () (Array (_ BitVec 32) ValueCell!12923))

(declare-fun mapValue!42700 () ValueCell!12923)

(declare-fun mapKey!42700 () (_ BitVec 32))

(assert (=> mapNonEmpty!42700 (= mapRest!42691 (store mapRest!42700 mapKey!42700 mapValue!42700))))

(declare-fun condMapEmpty!42700 () Bool)

(declare-fun mapDefault!42700 () ValueCell!12923)

(assert (=> mapNonEmpty!42691 (= condMapEmpty!42700 (= mapRest!42691 ((as const (Array (_ BitVec 32) ValueCell!12923)) mapDefault!42700)))))

(assert (=> mapNonEmpty!42691 (= tp!81605 (and e!630427 mapRes!42700))))

(assert (= (and mapNonEmpty!42691 condMapEmpty!42700) mapIsEmpty!42700))

(assert (= (and mapNonEmpty!42691 (not condMapEmpty!42700)) mapNonEmpty!42700))

(assert (= (and mapNonEmpty!42700 ((_ is ValueCellFull!12923) mapValue!42700)) b!1104348))

(assert (= (and mapNonEmpty!42691 ((_ is ValueCellFull!12923) mapDefault!42700)) b!1104349))

(declare-fun m!1025051 () Bool)

(assert (=> mapNonEmpty!42700 m!1025051))

(declare-fun b_lambda!18235 () Bool)

(assert (= b_lambda!18227 (or (and start!97158 b_free!23215) b_lambda!18235)))

(declare-fun b_lambda!18237 () Bool)

(assert (= b_lambda!18225 (or (and start!97158 b_free!23215) b_lambda!18237)))

(declare-fun b_lambda!18239 () Bool)

(assert (= b_lambda!18221 (or (and start!97158 b_free!23215) b_lambda!18239)))

(declare-fun b_lambda!18241 () Bool)

(assert (= b_lambda!18233 (or (and start!97158 b_free!23215) b_lambda!18241)))

(declare-fun b_lambda!18243 () Bool)

(assert (= b_lambda!18231 (or (and start!97158 b_free!23215) b_lambda!18243)))

(declare-fun b_lambda!18245 () Bool)

(assert (= b_lambda!18229 (or (and start!97158 b_free!23215) b_lambda!18245)))

(declare-fun b_lambda!18247 () Bool)

(assert (= b_lambda!18223 (or (and start!97158 b_free!23215) b_lambda!18247)))

(check-sat (not d!131249) (not b!1104327) (not bm!46379) (not bm!46338) tp_is_empty!27265 (not b_lambda!18245) (not b!1104167) (not bm!46361) (not b_lambda!18241) (not b!1104314) (not b!1104173) (not b!1104185) (not b!1104313) (not b!1104292) (not b!1104245) (not b_lambda!18239) (not b!1104298) (not bm!46341) (not b!1104295) (not b_lambda!18235) (not b!1104250) (not b!1104261) (not bm!46342) (not b!1104249) (not bm!46380) (not b!1104288) (not bm!46372) (not bm!46360) (not d!131247) (not bm!46337) (not b!1104319) (not d!131255) (not b_lambda!18247) (not b!1104311) (not b_lambda!18243) (not bm!46363) (not b!1104171) (not d!131253) (not d!131251) (not d!131257) (not b!1104308) (not b_next!23215) (not d!131237) (not b!1104256) (not d!131245) (not bm!46366) (not b!1104310) (not b!1104187) (not b!1104301) (not b!1104304) (not b!1104318) (not b!1104244) (not b!1104289) (not bm!46359) (not b!1104190) (not b_lambda!18219) (not b!1104296) (not b!1104341) (not b!1104194) (not bm!46371) (not b!1104291) (not bm!46370) (not b_lambda!18237) (not b!1104300) (not b!1104189) (not mapNonEmpty!42700) (not b!1104192) (not bm!46374) (not b!1104251) (not b!1104169) (not b!1104303) (not b!1104299) (not b!1104307) b_and!37281 (not bm!46367) (not b!1104200) (not b!1104325) (not b!1104320) (not b!1104330) (not b!1104258))
(check-sat b_and!37281 (not b_next!23215))
