; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96874 () Bool)

(assert start!96874)

(declare-fun b_free!23197 () Bool)

(declare-fun b_next!23197 () Bool)

(assert (=> start!96874 (= b_free!23197 (not b_next!23197))))

(declare-fun tp!81548 () Bool)

(declare-fun b_and!37171 () Bool)

(assert (=> start!96874 (= tp!81548 b_and!37171)))

(declare-fun b!1102047 () Bool)

(declare-fun res!735386 () Bool)

(declare-fun e!629019 () Bool)

(assert (=> b!1102047 (=> (not res!735386) (not e!629019))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71322 0))(
  ( (array!71323 (arr!34323 (Array (_ BitVec 32) (_ BitVec 64))) (size!34861 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71322)

(assert (=> b!1102047 (= res!735386 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34861 _keys!1070))))))

(declare-fun b!1102048 () Bool)

(declare-fun e!629017 () Bool)

(assert (=> b!1102048 (= e!629019 e!629017)))

(declare-fun res!735387 () Bool)

(assert (=> b!1102048 (=> (not res!735387) (not e!629017))))

(declare-fun lt!494237 () array!71322)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71322 (_ BitVec 32)) Bool)

(assert (=> b!1102048 (= res!735387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494237 mask!1414))))

(assert (=> b!1102048 (= lt!494237 (array!71323 (store (arr!34323 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34861 _keys!1070)))))

(declare-fun b!1102049 () Bool)

(declare-fun e!629018 () Bool)

(declare-fun tp_is_empty!27247 () Bool)

(assert (=> b!1102049 (= e!629018 tp_is_empty!27247)))

(declare-datatypes ((V!41457 0))(
  ( (V!41458 (val!13680 Int)) )
))
(declare-datatypes ((tuple2!17462 0))(
  ( (tuple2!17463 (_1!8742 (_ BitVec 64)) (_2!8742 V!41457)) )
))
(declare-datatypes ((List!24051 0))(
  ( (Nil!24048) (Cons!24047 (h!25256 tuple2!17462) (t!34285 List!24051)) )
))
(declare-datatypes ((ListLongMap!15431 0))(
  ( (ListLongMap!15432 (toList!7731 List!24051)) )
))
(declare-fun lt!494239 () ListLongMap!15431)

(declare-fun lt!494246 () ListLongMap!15431)

(declare-fun lt!494243 () Bool)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun b!1102050 () Bool)

(assert (=> b!1102050 (= e!629017 (not (or (and (not lt!494243) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!494243) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!494243) (= lt!494246 lt!494239))))))

(assert (=> b!1102050 (= lt!494243 (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41457)

(declare-fun lt!494241 () ListLongMap!15431)

(declare-fun zeroValue!831 () V!41457)

(declare-datatypes ((ValueCell!12914 0))(
  ( (ValueCellFull!12914 (v!16310 V!41457)) (EmptyCell!12914) )
))
(declare-datatypes ((array!71324 0))(
  ( (array!71325 (arr!34324 (Array (_ BitVec 32) ValueCell!12914)) (size!34862 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71324)

(declare-fun getCurrentListMap!4343 (array!71322 array!71324 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) Int) ListLongMap!15431)

(assert (=> b!1102050 (= lt!494241 (getCurrentListMap!4343 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494238 () array!71324)

(assert (=> b!1102050 (= lt!494246 (getCurrentListMap!4343 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494244 () ListLongMap!15431)

(assert (=> b!1102050 (and (= lt!494239 lt!494244) (= lt!494244 lt!494239))))

(declare-fun lt!494240 () ListLongMap!15431)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!958 (ListLongMap!15431 (_ BitVec 64)) ListLongMap!15431)

(assert (=> b!1102050 (= lt!494244 (-!958 lt!494240 k0!904))))

(declare-datatypes ((Unit!36043 0))(
  ( (Unit!36044) )
))
(declare-fun lt!494242 () Unit!36043)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 (array!71322 array!71324 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36043)

(assert (=> b!1102050 (= lt!494242 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4250 (array!71322 array!71324 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) Int) ListLongMap!15431)

(assert (=> b!1102050 (= lt!494239 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2319 (Int (_ BitVec 64)) V!41457)

(assert (=> b!1102050 (= lt!494238 (array!71325 (store (arr!34324 _values!874) i!650 (ValueCellFull!12914 (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34862 _values!874)))))

(assert (=> b!1102050 (= lt!494240 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1102050 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494245 () Unit!36043)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71322 (_ BitVec 64) (_ BitVec 32)) Unit!36043)

(assert (=> b!1102050 (= lt!494245 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1102051 () Bool)

(declare-fun res!735385 () Bool)

(assert (=> b!1102051 (=> (not res!735385) (not e!629019))))

(assert (=> b!1102051 (= res!735385 (= (select (arr!34323 _keys!1070) i!650) k0!904))))

(declare-fun b!1102052 () Bool)

(declare-fun res!735382 () Bool)

(assert (=> b!1102052 (=> (not res!735382) (not e!629017))))

(declare-datatypes ((List!24052 0))(
  ( (Nil!24049) (Cons!24048 (h!25257 (_ BitVec 64)) (t!34286 List!24052)) )
))
(declare-fun arrayNoDuplicates!0 (array!71322 (_ BitVec 32) List!24052) Bool)

(assert (=> b!1102052 (= res!735382 (arrayNoDuplicates!0 lt!494237 #b00000000000000000000000000000000 Nil!24049))))

(declare-fun b!1102053 () Bool)

(declare-fun e!629015 () Bool)

(assert (=> b!1102053 (= e!629015 tp_is_empty!27247)))

(declare-fun b!1102054 () Bool)

(declare-fun e!629020 () Bool)

(declare-fun mapRes!42661 () Bool)

(assert (=> b!1102054 (= e!629020 (and e!629015 mapRes!42661))))

(declare-fun condMapEmpty!42661 () Bool)

(declare-fun mapDefault!42661 () ValueCell!12914)

(assert (=> b!1102054 (= condMapEmpty!42661 (= (arr!34324 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12914)) mapDefault!42661)))))

(declare-fun mapNonEmpty!42661 () Bool)

(declare-fun tp!81547 () Bool)

(assert (=> mapNonEmpty!42661 (= mapRes!42661 (and tp!81547 e!629018))))

(declare-fun mapRest!42661 () (Array (_ BitVec 32) ValueCell!12914))

(declare-fun mapKey!42661 () (_ BitVec 32))

(declare-fun mapValue!42661 () ValueCell!12914)

(assert (=> mapNonEmpty!42661 (= (arr!34324 _values!874) (store mapRest!42661 mapKey!42661 mapValue!42661))))

(declare-fun b!1102055 () Bool)

(declare-fun res!735380 () Bool)

(assert (=> b!1102055 (=> (not res!735380) (not e!629019))))

(assert (=> b!1102055 (= res!735380 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24049))))

(declare-fun b!1102056 () Bool)

(declare-fun res!735388 () Bool)

(assert (=> b!1102056 (=> (not res!735388) (not e!629019))))

(assert (=> b!1102056 (= res!735388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!735381 () Bool)

(assert (=> start!96874 (=> (not res!735381) (not e!629019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96874 (= res!735381 (validMask!0 mask!1414))))

(assert (=> start!96874 e!629019))

(assert (=> start!96874 tp!81548))

(assert (=> start!96874 true))

(assert (=> start!96874 tp_is_empty!27247))

(declare-fun array_inv!26470 (array!71322) Bool)

(assert (=> start!96874 (array_inv!26470 _keys!1070)))

(declare-fun array_inv!26471 (array!71324) Bool)

(assert (=> start!96874 (and (array_inv!26471 _values!874) e!629020)))

(declare-fun mapIsEmpty!42661 () Bool)

(assert (=> mapIsEmpty!42661 mapRes!42661))

(declare-fun b!1102057 () Bool)

(declare-fun res!735384 () Bool)

(assert (=> b!1102057 (=> (not res!735384) (not e!629019))))

(assert (=> b!1102057 (= res!735384 (and (= (size!34862 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34861 _keys!1070) (size!34862 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1102058 () Bool)

(declare-fun res!735383 () Bool)

(assert (=> b!1102058 (=> (not res!735383) (not e!629019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1102058 (= res!735383 (validKeyInArray!0 k0!904))))

(assert (= (and start!96874 res!735381) b!1102057))

(assert (= (and b!1102057 res!735384) b!1102056))

(assert (= (and b!1102056 res!735388) b!1102055))

(assert (= (and b!1102055 res!735380) b!1102047))

(assert (= (and b!1102047 res!735386) b!1102058))

(assert (= (and b!1102058 res!735383) b!1102051))

(assert (= (and b!1102051 res!735385) b!1102048))

(assert (= (and b!1102048 res!735387) b!1102052))

(assert (= (and b!1102052 res!735382) b!1102050))

(assert (= (and b!1102054 condMapEmpty!42661) mapIsEmpty!42661))

(assert (= (and b!1102054 (not condMapEmpty!42661)) mapNonEmpty!42661))

(get-info :version)

(assert (= (and mapNonEmpty!42661 ((_ is ValueCellFull!12914) mapValue!42661)) b!1102049))

(assert (= (and b!1102054 ((_ is ValueCellFull!12914) mapDefault!42661)) b!1102053))

(assert (= start!96874 b!1102054))

(declare-fun b_lambda!18133 () Bool)

(assert (=> (not b_lambda!18133) (not b!1102050)))

(declare-fun t!34284 () Bool)

(declare-fun tb!8055 () Bool)

(assert (=> (and start!96874 (= defaultEntry!882 defaultEntry!882) t!34284) tb!8055))

(declare-fun result!16661 () Bool)

(assert (=> tb!8055 (= result!16661 tp_is_empty!27247)))

(assert (=> b!1102050 t!34284))

(declare-fun b_and!37173 () Bool)

(assert (= b_and!37171 (and (=> t!34284 result!16661) b_and!37173)))

(declare-fun m!1021865 () Bool)

(assert (=> b!1102050 m!1021865))

(declare-fun m!1021867 () Bool)

(assert (=> b!1102050 m!1021867))

(declare-fun m!1021869 () Bool)

(assert (=> b!1102050 m!1021869))

(declare-fun m!1021871 () Bool)

(assert (=> b!1102050 m!1021871))

(declare-fun m!1021873 () Bool)

(assert (=> b!1102050 m!1021873))

(declare-fun m!1021875 () Bool)

(assert (=> b!1102050 m!1021875))

(declare-fun m!1021877 () Bool)

(assert (=> b!1102050 m!1021877))

(declare-fun m!1021879 () Bool)

(assert (=> b!1102050 m!1021879))

(declare-fun m!1021881 () Bool)

(assert (=> b!1102050 m!1021881))

(declare-fun m!1021883 () Bool)

(assert (=> b!1102050 m!1021883))

(declare-fun m!1021885 () Bool)

(assert (=> b!1102051 m!1021885))

(declare-fun m!1021887 () Bool)

(assert (=> b!1102055 m!1021887))

(declare-fun m!1021889 () Bool)

(assert (=> b!1102052 m!1021889))

(declare-fun m!1021891 () Bool)

(assert (=> b!1102056 m!1021891))

(declare-fun m!1021893 () Bool)

(assert (=> mapNonEmpty!42661 m!1021893))

(declare-fun m!1021895 () Bool)

(assert (=> start!96874 m!1021895))

(declare-fun m!1021897 () Bool)

(assert (=> start!96874 m!1021897))

(declare-fun m!1021899 () Bool)

(assert (=> start!96874 m!1021899))

(declare-fun m!1021901 () Bool)

(assert (=> b!1102048 m!1021901))

(declare-fun m!1021903 () Bool)

(assert (=> b!1102048 m!1021903))

(declare-fun m!1021905 () Bool)

(assert (=> b!1102058 m!1021905))

(check-sat (not b!1102050) (not start!96874) (not b!1102052) (not b!1102058) (not b!1102056) (not b_next!23197) b_and!37173 tp_is_empty!27247 (not b_lambda!18133) (not b!1102055) (not b!1102048) (not mapNonEmpty!42661))
(check-sat b_and!37173 (not b_next!23197))
(get-model)

(declare-fun b_lambda!18139 () Bool)

(assert (= b_lambda!18133 (or (and start!96874 b_free!23197) b_lambda!18139)))

(check-sat (not b!1102050) (not start!96874) (not b!1102052) (not b!1102058) (not b!1102056) b_and!37173 tp_is_empty!27247 (not b!1102055) (not b!1102048) (not mapNonEmpty!42661) (not b_lambda!18139) (not b_next!23197))
(check-sat b_and!37173 (not b_next!23197))
(get-model)

(declare-fun b!1102147 () Bool)

(declare-fun e!629067 () Bool)

(declare-fun call!46204 () Bool)

(assert (=> b!1102147 (= e!629067 call!46204)))

(declare-fun b!1102148 () Bool)

(declare-fun e!629065 () Bool)

(assert (=> b!1102148 (= e!629065 e!629067)))

(declare-fun c!108832 () Bool)

(assert (=> b!1102148 (= c!108832 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun d!130567 () Bool)

(declare-fun res!735451 () Bool)

(declare-fun e!629068 () Bool)

(assert (=> d!130567 (=> res!735451 e!629068)))

(assert (=> d!130567 (= res!735451 (bvsge #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(assert (=> d!130567 (= (arrayNoDuplicates!0 lt!494237 #b00000000000000000000000000000000 Nil!24049) e!629068)))

(declare-fun b!1102149 () Bool)

(assert (=> b!1102149 (= e!629068 e!629065)))

(declare-fun res!735450 () Bool)

(assert (=> b!1102149 (=> (not res!735450) (not e!629065))))

(declare-fun e!629066 () Bool)

(assert (=> b!1102149 (= res!735450 (not e!629066))))

(declare-fun res!735449 () Bool)

(assert (=> b!1102149 (=> (not res!735449) (not e!629066))))

(assert (=> b!1102149 (= res!735449 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun b!1102150 () Bool)

(assert (=> b!1102150 (= e!629067 call!46204)))

(declare-fun bm!46201 () Bool)

(assert (=> bm!46201 (= call!46204 (arrayNoDuplicates!0 lt!494237 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108832 (Cons!24048 (select (arr!34323 lt!494237) #b00000000000000000000000000000000) Nil!24049) Nil!24049)))))

(declare-fun b!1102151 () Bool)

(declare-fun contains!6377 (List!24052 (_ BitVec 64)) Bool)

(assert (=> b!1102151 (= e!629066 (contains!6377 Nil!24049 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(assert (= (and d!130567 (not res!735451)) b!1102149))

(assert (= (and b!1102149 res!735449) b!1102151))

(assert (= (and b!1102149 res!735450) b!1102148))

(assert (= (and b!1102148 c!108832) b!1102147))

(assert (= (and b!1102148 (not c!108832)) b!1102150))

(assert (= (or b!1102147 b!1102150) bm!46201))

(declare-fun m!1021991 () Bool)

(assert (=> b!1102148 m!1021991))

(assert (=> b!1102148 m!1021991))

(declare-fun m!1021993 () Bool)

(assert (=> b!1102148 m!1021993))

(assert (=> b!1102149 m!1021991))

(assert (=> b!1102149 m!1021991))

(assert (=> b!1102149 m!1021993))

(assert (=> bm!46201 m!1021991))

(declare-fun m!1021995 () Bool)

(assert (=> bm!46201 m!1021995))

(assert (=> b!1102151 m!1021991))

(assert (=> b!1102151 m!1021991))

(declare-fun m!1021997 () Bool)

(assert (=> b!1102151 m!1021997))

(assert (=> b!1102052 d!130567))

(declare-fun b!1102160 () Bool)

(declare-fun e!629077 () Bool)

(declare-fun e!629076 () Bool)

(assert (=> b!1102160 (= e!629077 e!629076)))

(declare-fun c!108835 () Bool)

(assert (=> b!1102160 (= c!108835 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102161 () Bool)

(declare-fun e!629075 () Bool)

(assert (=> b!1102161 (= e!629076 e!629075)))

(declare-fun lt!494314 () (_ BitVec 64))

(assert (=> b!1102161 (= lt!494314 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494315 () Unit!36043)

(assert (=> b!1102161 (= lt!494315 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!494314 #b00000000000000000000000000000000))))

(assert (=> b!1102161 (arrayContainsKey!0 _keys!1070 lt!494314 #b00000000000000000000000000000000)))

(declare-fun lt!494313 () Unit!36043)

(assert (=> b!1102161 (= lt!494313 lt!494315)))

(declare-fun res!735457 () Bool)

(declare-datatypes ((SeekEntryResult!9915 0))(
  ( (MissingZero!9915 (index!42031 (_ BitVec 32))) (Found!9915 (index!42032 (_ BitVec 32))) (Intermediate!9915 (undefined!10727 Bool) (index!42033 (_ BitVec 32)) (x!99134 (_ BitVec 32))) (Undefined!9915) (MissingVacant!9915 (index!42034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71322 (_ BitVec 32)) SeekEntryResult!9915)

(assert (=> b!1102161 (= res!735457 (= (seekEntryOrOpen!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9915 #b00000000000000000000000000000000)))))

(assert (=> b!1102161 (=> (not res!735457) (not e!629075))))

(declare-fun b!1102162 () Bool)

(declare-fun call!46207 () Bool)

(assert (=> b!1102162 (= e!629076 call!46207)))

(declare-fun d!130569 () Bool)

(declare-fun res!735456 () Bool)

(assert (=> d!130569 (=> res!735456 e!629077)))

(assert (=> d!130569 (= res!735456 (bvsge #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(assert (=> d!130569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!629077)))

(declare-fun bm!46204 () Bool)

(assert (=> bm!46204 (= call!46207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1102163 () Bool)

(assert (=> b!1102163 (= e!629075 call!46207)))

(assert (= (and d!130569 (not res!735456)) b!1102160))

(assert (= (and b!1102160 c!108835) b!1102161))

(assert (= (and b!1102160 (not c!108835)) b!1102162))

(assert (= (and b!1102161 res!735457) b!1102163))

(assert (= (or b!1102163 b!1102162) bm!46204))

(declare-fun m!1021999 () Bool)

(assert (=> b!1102160 m!1021999))

(assert (=> b!1102160 m!1021999))

(declare-fun m!1022001 () Bool)

(assert (=> b!1102160 m!1022001))

(assert (=> b!1102161 m!1021999))

(declare-fun m!1022003 () Bool)

(assert (=> b!1102161 m!1022003))

(declare-fun m!1022005 () Bool)

(assert (=> b!1102161 m!1022005))

(assert (=> b!1102161 m!1021999))

(declare-fun m!1022007 () Bool)

(assert (=> b!1102161 m!1022007))

(declare-fun m!1022009 () Bool)

(assert (=> bm!46204 m!1022009))

(assert (=> b!1102056 d!130569))

(declare-fun b!1102164 () Bool)

(declare-fun e!629080 () Bool)

(declare-fun call!46208 () Bool)

(assert (=> b!1102164 (= e!629080 call!46208)))

(declare-fun b!1102165 () Bool)

(declare-fun e!629078 () Bool)

(assert (=> b!1102165 (= e!629078 e!629080)))

(declare-fun c!108836 () Bool)

(assert (=> b!1102165 (= c!108836 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130571 () Bool)

(declare-fun res!735460 () Bool)

(declare-fun e!629081 () Bool)

(assert (=> d!130571 (=> res!735460 e!629081)))

(assert (=> d!130571 (= res!735460 (bvsge #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(assert (=> d!130571 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!24049) e!629081)))

(declare-fun b!1102166 () Bool)

(assert (=> b!1102166 (= e!629081 e!629078)))

(declare-fun res!735459 () Bool)

(assert (=> b!1102166 (=> (not res!735459) (not e!629078))))

(declare-fun e!629079 () Bool)

(assert (=> b!1102166 (= res!735459 (not e!629079))))

(declare-fun res!735458 () Bool)

(assert (=> b!1102166 (=> (not res!735458) (not e!629079))))

(assert (=> b!1102166 (= res!735458 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102167 () Bool)

(assert (=> b!1102167 (= e!629080 call!46208)))

(declare-fun bm!46205 () Bool)

(assert (=> bm!46205 (= call!46208 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108836 (Cons!24048 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000) Nil!24049) Nil!24049)))))

(declare-fun b!1102168 () Bool)

(assert (=> b!1102168 (= e!629079 (contains!6377 Nil!24049 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130571 (not res!735460)) b!1102166))

(assert (= (and b!1102166 res!735458) b!1102168))

(assert (= (and b!1102166 res!735459) b!1102165))

(assert (= (and b!1102165 c!108836) b!1102164))

(assert (= (and b!1102165 (not c!108836)) b!1102167))

(assert (= (or b!1102164 b!1102167) bm!46205))

(assert (=> b!1102165 m!1021999))

(assert (=> b!1102165 m!1021999))

(assert (=> b!1102165 m!1022001))

(assert (=> b!1102166 m!1021999))

(assert (=> b!1102166 m!1021999))

(assert (=> b!1102166 m!1022001))

(assert (=> bm!46205 m!1021999))

(declare-fun m!1022011 () Bool)

(assert (=> bm!46205 m!1022011))

(assert (=> b!1102168 m!1021999))

(assert (=> b!1102168 m!1021999))

(declare-fun m!1022013 () Bool)

(assert (=> b!1102168 m!1022013))

(assert (=> b!1102055 d!130571))

(declare-fun d!130573 () Bool)

(assert (=> d!130573 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102058 d!130573))

(declare-fun d!130575 () Bool)

(declare-fun res!735465 () Bool)

(declare-fun e!629086 () Bool)

(assert (=> d!130575 (=> res!735465 e!629086)))

(assert (=> d!130575 (= res!735465 (= (select (arr!34323 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!130575 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!629086)))

(declare-fun b!1102173 () Bool)

(declare-fun e!629087 () Bool)

(assert (=> b!1102173 (= e!629086 e!629087)))

(declare-fun res!735466 () Bool)

(assert (=> b!1102173 (=> (not res!735466) (not e!629087))))

(assert (=> b!1102173 (= res!735466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!34861 _keys!1070)))))

(declare-fun b!1102174 () Bool)

(assert (=> b!1102174 (= e!629087 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!130575 (not res!735465)) b!1102173))

(assert (= (and b!1102173 res!735466) b!1102174))

(assert (=> d!130575 m!1021999))

(declare-fun m!1022015 () Bool)

(assert (=> b!1102174 m!1022015))

(assert (=> b!1102050 d!130575))

(declare-fun b!1102199 () Bool)

(declare-fun e!629105 () Bool)

(declare-fun e!629104 () Bool)

(assert (=> b!1102199 (= e!629105 e!629104)))

(declare-fun c!108847 () Bool)

(assert (=> b!1102199 (= c!108847 (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun b!1102200 () Bool)

(assert (=> b!1102200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(assert (=> b!1102200 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34862 lt!494238)))))

(declare-fun lt!494336 () ListLongMap!15431)

(declare-fun e!629107 () Bool)

(declare-fun apply!946 (ListLongMap!15431 (_ BitVec 64)) V!41457)

(declare-fun get!17660 (ValueCell!12914 V!41457) V!41457)

(assert (=> b!1102200 (= e!629107 (= (apply!946 lt!494336 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)) (get!17660 (select (arr!34324 lt!494238) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102201 () Bool)

(declare-fun e!629106 () ListLongMap!15431)

(declare-fun e!629103 () ListLongMap!15431)

(assert (=> b!1102201 (= e!629106 e!629103)))

(declare-fun c!108845 () Bool)

(assert (=> b!1102201 (= c!108845 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun b!1102203 () Bool)

(assert (=> b!1102203 (= e!629104 (= lt!494336 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102204 () Bool)

(declare-fun res!735476 () Bool)

(declare-fun e!629102 () Bool)

(assert (=> b!1102204 (=> (not res!735476) (not e!629102))))

(declare-fun contains!6378 (ListLongMap!15431 (_ BitVec 64)) Bool)

(assert (=> b!1102204 (= res!735476 (not (contains!6378 lt!494336 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102205 () Bool)

(declare-fun call!46211 () ListLongMap!15431)

(assert (=> b!1102205 (= e!629103 call!46211)))

(declare-fun b!1102206 () Bool)

(assert (=> b!1102206 (= e!629102 e!629105)))

(declare-fun c!108848 () Bool)

(declare-fun e!629108 () Bool)

(assert (=> b!1102206 (= c!108848 e!629108)))

(declare-fun res!735475 () Bool)

(assert (=> b!1102206 (=> (not res!735475) (not e!629108))))

(assert (=> b!1102206 (= res!735475 (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun b!1102207 () Bool)

(declare-fun lt!494333 () Unit!36043)

(declare-fun lt!494334 () Unit!36043)

(assert (=> b!1102207 (= lt!494333 lt!494334)))

(declare-fun lt!494332 () (_ BitVec 64))

(declare-fun lt!494330 () V!41457)

(declare-fun lt!494335 () ListLongMap!15431)

(declare-fun lt!494331 () (_ BitVec 64))

(declare-fun +!3441 (ListLongMap!15431 tuple2!17462) ListLongMap!15431)

(assert (=> b!1102207 (not (contains!6378 (+!3441 lt!494335 (tuple2!17463 lt!494332 lt!494330)) lt!494331))))

(declare-fun addStillNotContains!282 (ListLongMap!15431 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36043)

(assert (=> b!1102207 (= lt!494334 (addStillNotContains!282 lt!494335 lt!494332 lt!494330 lt!494331))))

(assert (=> b!1102207 (= lt!494331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102207 (= lt!494330 (get!17660 (select (arr!34324 lt!494238) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102207 (= lt!494332 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(assert (=> b!1102207 (= lt!494335 call!46211)))

(assert (=> b!1102207 (= e!629103 (+!3441 call!46211 (tuple2!17463 (select (arr!34323 lt!494237) #b00000000000000000000000000000000) (get!17660 (select (arr!34324 lt!494238) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!46208 () Bool)

(assert (=> bm!46208 (= call!46211 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102202 () Bool)

(assert (=> b!1102202 (= e!629105 e!629107)))

(assert (=> b!1102202 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun res!735477 () Bool)

(assert (=> b!1102202 (= res!735477 (contains!6378 lt!494336 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(assert (=> b!1102202 (=> (not res!735477) (not e!629107))))

(declare-fun d!130577 () Bool)

(assert (=> d!130577 e!629102))

(declare-fun res!735478 () Bool)

(assert (=> d!130577 (=> (not res!735478) (not e!629102))))

(assert (=> d!130577 (= res!735478 (not (contains!6378 lt!494336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130577 (= lt!494336 e!629106)))

(declare-fun c!108846 () Bool)

(assert (=> d!130577 (= c!108846 (bvsge #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(assert (=> d!130577 (validMask!0 mask!1414)))

(assert (=> d!130577 (= (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494336)))

(declare-fun b!1102208 () Bool)

(assert (=> b!1102208 (= e!629106 (ListLongMap!15432 Nil!24048))))

(declare-fun b!1102209 () Bool)

(declare-fun isEmpty!976 (ListLongMap!15431) Bool)

(assert (=> b!1102209 (= e!629104 (isEmpty!976 lt!494336))))

(declare-fun b!1102210 () Bool)

(assert (=> b!1102210 (= e!629108 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(assert (=> b!1102210 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130577 c!108846) b!1102208))

(assert (= (and d!130577 (not c!108846)) b!1102201))

(assert (= (and b!1102201 c!108845) b!1102207))

(assert (= (and b!1102201 (not c!108845)) b!1102205))

(assert (= (or b!1102207 b!1102205) bm!46208))

(assert (= (and d!130577 res!735478) b!1102204))

(assert (= (and b!1102204 res!735476) b!1102206))

(assert (= (and b!1102206 res!735475) b!1102210))

(assert (= (and b!1102206 c!108848) b!1102202))

(assert (= (and b!1102206 (not c!108848)) b!1102199))

(assert (= (and b!1102202 res!735477) b!1102200))

(assert (= (and b!1102199 c!108847) b!1102203))

(assert (= (and b!1102199 (not c!108847)) b!1102209))

(declare-fun b_lambda!18141 () Bool)

(assert (=> (not b_lambda!18141) (not b!1102200)))

(assert (=> b!1102200 t!34284))

(declare-fun b_and!37183 () Bool)

(assert (= b_and!37173 (and (=> t!34284 result!16661) b_and!37183)))

(declare-fun b_lambda!18143 () Bool)

(assert (=> (not b_lambda!18143) (not b!1102207)))

(assert (=> b!1102207 t!34284))

(declare-fun b_and!37185 () Bool)

(assert (= b_and!37183 (and (=> t!34284 result!16661) b_and!37185)))

(assert (=> b!1102210 m!1021991))

(assert (=> b!1102210 m!1021991))

(assert (=> b!1102210 m!1021993))

(declare-fun m!1022017 () Bool)

(assert (=> b!1102203 m!1022017))

(assert (=> bm!46208 m!1022017))

(declare-fun m!1022019 () Bool)

(assert (=> b!1102204 m!1022019))

(declare-fun m!1022021 () Bool)

(assert (=> b!1102207 m!1022021))

(declare-fun m!1022023 () Bool)

(assert (=> b!1102207 m!1022023))

(declare-fun m!1022025 () Bool)

(assert (=> b!1102207 m!1022025))

(assert (=> b!1102207 m!1022021))

(assert (=> b!1102207 m!1021865))

(declare-fun m!1022027 () Bool)

(assert (=> b!1102207 m!1022027))

(declare-fun m!1022029 () Bool)

(assert (=> b!1102207 m!1022029))

(declare-fun m!1022031 () Bool)

(assert (=> b!1102207 m!1022031))

(assert (=> b!1102207 m!1021865))

(assert (=> b!1102207 m!1022029))

(assert (=> b!1102207 m!1021991))

(declare-fun m!1022033 () Bool)

(assert (=> d!130577 m!1022033))

(assert (=> d!130577 m!1021895))

(assert (=> b!1102201 m!1021991))

(assert (=> b!1102201 m!1021991))

(assert (=> b!1102201 m!1021993))

(declare-fun m!1022035 () Bool)

(assert (=> b!1102209 m!1022035))

(assert (=> b!1102200 m!1022021))

(assert (=> b!1102200 m!1022021))

(assert (=> b!1102200 m!1021865))

(assert (=> b!1102200 m!1022027))

(assert (=> b!1102200 m!1021991))

(declare-fun m!1022037 () Bool)

(assert (=> b!1102200 m!1022037))

(assert (=> b!1102200 m!1021991))

(assert (=> b!1102200 m!1021865))

(assert (=> b!1102202 m!1021991))

(assert (=> b!1102202 m!1021991))

(declare-fun m!1022039 () Bool)

(assert (=> b!1102202 m!1022039))

(assert (=> b!1102050 d!130577))

(declare-fun b!1102253 () Bool)

(declare-fun e!629143 () Bool)

(declare-fun lt!494391 () ListLongMap!15431)

(assert (=> b!1102253 (= e!629143 (= (apply!946 lt!494391 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46223 () Bool)

(declare-fun call!46226 () Bool)

(assert (=> bm!46223 (= call!46226 (contains!6378 lt!494391 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102254 () Bool)

(declare-fun e!629141 () Unit!36043)

(declare-fun Unit!36047 () Unit!36043)

(assert (=> b!1102254 (= e!629141 Unit!36047)))

(declare-fun b!1102255 () Bool)

(declare-fun e!629137 () Bool)

(assert (=> b!1102255 (= e!629137 (= (apply!946 lt!494391 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)) (get!17660 (select (arr!34324 _values!874) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34862 _values!874)))))

(assert (=> b!1102255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun b!1102257 () Bool)

(declare-fun e!629140 () Bool)

(assert (=> b!1102257 (= e!629140 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!46224 () Bool)

(declare-fun call!46231 () ListLongMap!15431)

(declare-fun call!46228 () ListLongMap!15431)

(assert (=> bm!46224 (= call!46231 call!46228)))

(declare-fun b!1102258 () Bool)

(declare-fun res!735497 () Bool)

(declare-fun e!629135 () Bool)

(assert (=> b!1102258 (=> (not res!735497) (not e!629135))))

(declare-fun e!629147 () Bool)

(assert (=> b!1102258 (= res!735497 e!629147)))

(declare-fun res!735505 () Bool)

(assert (=> b!1102258 (=> res!735505 e!629147)))

(assert (=> b!1102258 (= res!735505 (not e!629140))))

(declare-fun res!735502 () Bool)

(assert (=> b!1102258 (=> (not res!735502) (not e!629140))))

(assert (=> b!1102258 (= res!735502 (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun bm!46225 () Bool)

(declare-fun call!46227 () Bool)

(assert (=> bm!46225 (= call!46227 (contains!6378 lt!494391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102259 () Bool)

(declare-fun e!629142 () Bool)

(assert (=> b!1102259 (= e!629142 (= (apply!946 lt!494391 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102260 () Bool)

(declare-fun e!629138 () Bool)

(assert (=> b!1102260 (= e!629138 (not call!46226))))

(declare-fun b!1102261 () Bool)

(assert (=> b!1102261 (= e!629147 e!629137)))

(declare-fun res!735500 () Bool)

(assert (=> b!1102261 (=> (not res!735500) (not e!629137))))

(assert (=> b!1102261 (= res!735500 (contains!6378 lt!494391 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun b!1102262 () Bool)

(declare-fun lt!494385 () Unit!36043)

(assert (=> b!1102262 (= e!629141 lt!494385)))

(declare-fun lt!494381 () ListLongMap!15431)

(assert (=> b!1102262 (= lt!494381 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494383 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494396 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494396 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494394 () Unit!36043)

(declare-fun addStillContains!659 (ListLongMap!15431 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36043)

(assert (=> b!1102262 (= lt!494394 (addStillContains!659 lt!494381 lt!494383 zeroValue!831 lt!494396))))

(assert (=> b!1102262 (contains!6378 (+!3441 lt!494381 (tuple2!17463 lt!494383 zeroValue!831)) lt!494396)))

(declare-fun lt!494392 () Unit!36043)

(assert (=> b!1102262 (= lt!494392 lt!494394)))

(declare-fun lt!494386 () ListLongMap!15431)

(assert (=> b!1102262 (= lt!494386 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494393 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494398 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494398 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494395 () Unit!36043)

(declare-fun addApplyDifferent!515 (ListLongMap!15431 (_ BitVec 64) V!41457 (_ BitVec 64)) Unit!36043)

(assert (=> b!1102262 (= lt!494395 (addApplyDifferent!515 lt!494386 lt!494393 minValue!831 lt!494398))))

(assert (=> b!1102262 (= (apply!946 (+!3441 lt!494386 (tuple2!17463 lt!494393 minValue!831)) lt!494398) (apply!946 lt!494386 lt!494398))))

(declare-fun lt!494387 () Unit!36043)

(assert (=> b!1102262 (= lt!494387 lt!494395)))

(declare-fun lt!494382 () ListLongMap!15431)

(assert (=> b!1102262 (= lt!494382 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494390 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494390 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494397 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494397 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!494401 () Unit!36043)

(assert (=> b!1102262 (= lt!494401 (addApplyDifferent!515 lt!494382 lt!494390 zeroValue!831 lt!494397))))

(assert (=> b!1102262 (= (apply!946 (+!3441 lt!494382 (tuple2!17463 lt!494390 zeroValue!831)) lt!494397) (apply!946 lt!494382 lt!494397))))

(declare-fun lt!494399 () Unit!36043)

(assert (=> b!1102262 (= lt!494399 lt!494401)))

(declare-fun lt!494388 () ListLongMap!15431)

(assert (=> b!1102262 (= lt!494388 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494384 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494384 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494402 () (_ BitVec 64))

(assert (=> b!1102262 (= lt!494402 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102262 (= lt!494385 (addApplyDifferent!515 lt!494388 lt!494384 minValue!831 lt!494402))))

(assert (=> b!1102262 (= (apply!946 (+!3441 lt!494388 (tuple2!17463 lt!494384 minValue!831)) lt!494402) (apply!946 lt!494388 lt!494402))))

(declare-fun bm!46226 () Bool)

(declare-fun call!46229 () ListLongMap!15431)

(assert (=> bm!46226 (= call!46229 call!46231)))

(declare-fun b!1102263 () Bool)

(declare-fun e!629146 () ListLongMap!15431)

(declare-fun call!46232 () ListLongMap!15431)

(assert (=> b!1102263 (= e!629146 call!46232)))

(declare-fun b!1102264 () Bool)

(declare-fun c!108865 () Bool)

(assert (=> b!1102264 (= c!108865 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629144 () ListLongMap!15431)

(assert (=> b!1102264 (= e!629146 e!629144)))

(declare-fun b!1102265 () Bool)

(assert (=> b!1102265 (= e!629138 e!629142)))

(declare-fun res!735498 () Bool)

(assert (=> b!1102265 (= res!735498 call!46226)))

(assert (=> b!1102265 (=> (not res!735498) (not e!629142))))

(declare-fun b!1102266 () Bool)

(declare-fun e!629139 () Bool)

(assert (=> b!1102266 (= e!629139 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102267 () Bool)

(declare-fun res!735503 () Bool)

(assert (=> b!1102267 (=> (not res!735503) (not e!629135))))

(declare-fun e!629145 () Bool)

(assert (=> b!1102267 (= res!735503 e!629145)))

(declare-fun c!108863 () Bool)

(assert (=> b!1102267 (= c!108863 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102256 () Bool)

(assert (=> b!1102256 (= e!629144 call!46232)))

(declare-fun d!130579 () Bool)

(assert (=> d!130579 e!629135))

(declare-fun res!735501 () Bool)

(assert (=> d!130579 (=> (not res!735501) (not e!629135))))

(assert (=> d!130579 (= res!735501 (or (bvsge #b00000000000000000000000000000000 (size!34861 _keys!1070)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))))

(declare-fun lt!494400 () ListLongMap!15431)

(assert (=> d!130579 (= lt!494391 lt!494400)))

(declare-fun lt!494389 () Unit!36043)

(assert (=> d!130579 (= lt!494389 e!629141)))

(declare-fun c!108864 () Bool)

(assert (=> d!130579 (= c!108864 e!629139)))

(declare-fun res!735499 () Bool)

(assert (=> d!130579 (=> (not res!735499) (not e!629139))))

(assert (=> d!130579 (= res!735499 (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun e!629136 () ListLongMap!15431)

(assert (=> d!130579 (= lt!494400 e!629136)))

(declare-fun c!108866 () Bool)

(assert (=> d!130579 (= c!108866 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130579 (validMask!0 mask!1414)))

(assert (=> d!130579 (= (getCurrentListMap!4343 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494391)))

(declare-fun b!1102268 () Bool)

(declare-fun call!46230 () ListLongMap!15431)

(assert (=> b!1102268 (= e!629136 (+!3441 call!46230 (tuple2!17463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102269 () Bool)

(assert (=> b!1102269 (= e!629135 e!629138)))

(declare-fun c!108862 () Bool)

(assert (=> b!1102269 (= c!108862 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102270 () Bool)

(assert (=> b!1102270 (= e!629144 call!46229)))

(declare-fun c!108861 () Bool)

(declare-fun bm!46227 () Bool)

(assert (=> bm!46227 (= call!46230 (+!3441 (ite c!108866 call!46228 (ite c!108861 call!46231 call!46229)) (ite (or c!108866 c!108861) (tuple2!17463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102271 () Bool)

(assert (=> b!1102271 (= e!629145 (not call!46227))))

(declare-fun b!1102272 () Bool)

(assert (=> b!1102272 (= e!629145 e!629143)))

(declare-fun res!735504 () Bool)

(assert (=> b!1102272 (= res!735504 call!46227)))

(assert (=> b!1102272 (=> (not res!735504) (not e!629143))))

(declare-fun bm!46228 () Bool)

(assert (=> bm!46228 (= call!46232 call!46230)))

(declare-fun b!1102273 () Bool)

(assert (=> b!1102273 (= e!629136 e!629146)))

(assert (=> b!1102273 (= c!108861 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46229 () Bool)

(assert (=> bm!46229 (= call!46228 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130579 c!108866) b!1102268))

(assert (= (and d!130579 (not c!108866)) b!1102273))

(assert (= (and b!1102273 c!108861) b!1102263))

(assert (= (and b!1102273 (not c!108861)) b!1102264))

(assert (= (and b!1102264 c!108865) b!1102256))

(assert (= (and b!1102264 (not c!108865)) b!1102270))

(assert (= (or b!1102256 b!1102270) bm!46226))

(assert (= (or b!1102263 bm!46226) bm!46224))

(assert (= (or b!1102263 b!1102256) bm!46228))

(assert (= (or b!1102268 bm!46224) bm!46229))

(assert (= (or b!1102268 bm!46228) bm!46227))

(assert (= (and d!130579 res!735499) b!1102266))

(assert (= (and d!130579 c!108864) b!1102262))

(assert (= (and d!130579 (not c!108864)) b!1102254))

(assert (= (and d!130579 res!735501) b!1102258))

(assert (= (and b!1102258 res!735502) b!1102257))

(assert (= (and b!1102258 (not res!735505)) b!1102261))

(assert (= (and b!1102261 res!735500) b!1102255))

(assert (= (and b!1102258 res!735497) b!1102267))

(assert (= (and b!1102267 c!108863) b!1102272))

(assert (= (and b!1102267 (not c!108863)) b!1102271))

(assert (= (and b!1102272 res!735504) b!1102253))

(assert (= (or b!1102272 b!1102271) bm!46225))

(assert (= (and b!1102267 res!735503) b!1102269))

(assert (= (and b!1102269 c!108862) b!1102265))

(assert (= (and b!1102269 (not c!108862)) b!1102260))

(assert (= (and b!1102265 res!735498) b!1102259))

(assert (= (or b!1102265 b!1102260) bm!46223))

(declare-fun b_lambda!18145 () Bool)

(assert (=> (not b_lambda!18145) (not b!1102255)))

(assert (=> b!1102255 t!34284))

(declare-fun b_and!37187 () Bool)

(assert (= b_and!37185 (and (=> t!34284 result!16661) b_and!37187)))

(declare-fun m!1022041 () Bool)

(assert (=> bm!46225 m!1022041))

(declare-fun m!1022043 () Bool)

(assert (=> bm!46227 m!1022043))

(declare-fun m!1022045 () Bool)

(assert (=> b!1102262 m!1022045))

(declare-fun m!1022047 () Bool)

(assert (=> b!1102262 m!1022047))

(declare-fun m!1022049 () Bool)

(assert (=> b!1102262 m!1022049))

(declare-fun m!1022051 () Bool)

(assert (=> b!1102262 m!1022051))

(declare-fun m!1022053 () Bool)

(assert (=> b!1102262 m!1022053))

(assert (=> b!1102262 m!1022047))

(declare-fun m!1022055 () Bool)

(assert (=> b!1102262 m!1022055))

(assert (=> b!1102262 m!1021999))

(declare-fun m!1022057 () Bool)

(assert (=> b!1102262 m!1022057))

(declare-fun m!1022059 () Bool)

(assert (=> b!1102262 m!1022059))

(declare-fun m!1022061 () Bool)

(assert (=> b!1102262 m!1022061))

(declare-fun m!1022063 () Bool)

(assert (=> b!1102262 m!1022063))

(assert (=> b!1102262 m!1022045))

(declare-fun m!1022065 () Bool)

(assert (=> b!1102262 m!1022065))

(declare-fun m!1022067 () Bool)

(assert (=> b!1102262 m!1022067))

(assert (=> b!1102262 m!1022059))

(declare-fun m!1022069 () Bool)

(assert (=> b!1102262 m!1022069))

(declare-fun m!1022071 () Bool)

(assert (=> b!1102262 m!1022071))

(assert (=> b!1102262 m!1022063))

(declare-fun m!1022073 () Bool)

(assert (=> b!1102262 m!1022073))

(assert (=> b!1102262 m!1021875))

(declare-fun m!1022075 () Bool)

(assert (=> b!1102268 m!1022075))

(assert (=> b!1102266 m!1021999))

(assert (=> b!1102266 m!1021999))

(assert (=> b!1102266 m!1022001))

(declare-fun m!1022077 () Bool)

(assert (=> b!1102253 m!1022077))

(declare-fun m!1022079 () Bool)

(assert (=> b!1102259 m!1022079))

(declare-fun m!1022081 () Bool)

(assert (=> bm!46223 m!1022081))

(assert (=> b!1102261 m!1021999))

(assert (=> b!1102261 m!1021999))

(declare-fun m!1022083 () Bool)

(assert (=> b!1102261 m!1022083))

(assert (=> d!130579 m!1021895))

(assert (=> bm!46229 m!1021875))

(declare-fun m!1022085 () Bool)

(assert (=> b!1102255 m!1022085))

(assert (=> b!1102255 m!1021865))

(declare-fun m!1022087 () Bool)

(assert (=> b!1102255 m!1022087))

(assert (=> b!1102255 m!1021999))

(declare-fun m!1022089 () Bool)

(assert (=> b!1102255 m!1022089))

(assert (=> b!1102255 m!1021999))

(assert (=> b!1102255 m!1021865))

(assert (=> b!1102255 m!1022085))

(assert (=> b!1102257 m!1021999))

(assert (=> b!1102257 m!1021999))

(assert (=> b!1102257 m!1022001))

(assert (=> b!1102050 d!130579))

(declare-fun b!1102274 () Bool)

(declare-fun e!629156 () Bool)

(declare-fun lt!494413 () ListLongMap!15431)

(assert (=> b!1102274 (= e!629156 (= (apply!946 lt!494413 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!831))))

(declare-fun bm!46230 () Bool)

(declare-fun call!46233 () Bool)

(assert (=> bm!46230 (= call!46233 (contains!6378 lt!494413 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102275 () Bool)

(declare-fun e!629154 () Unit!36043)

(declare-fun Unit!36048 () Unit!36043)

(assert (=> b!1102275 (= e!629154 Unit!36048)))

(declare-fun e!629150 () Bool)

(declare-fun b!1102276 () Bool)

(assert (=> b!1102276 (= e!629150 (= (apply!946 lt!494413 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)) (get!17660 (select (arr!34324 lt!494238) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1102276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34862 lt!494238)))))

(assert (=> b!1102276 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun b!1102278 () Bool)

(declare-fun e!629153 () Bool)

(assert (=> b!1102278 (= e!629153 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun bm!46231 () Bool)

(declare-fun call!46238 () ListLongMap!15431)

(declare-fun call!46235 () ListLongMap!15431)

(assert (=> bm!46231 (= call!46238 call!46235)))

(declare-fun b!1102279 () Bool)

(declare-fun res!735506 () Bool)

(declare-fun e!629148 () Bool)

(assert (=> b!1102279 (=> (not res!735506) (not e!629148))))

(declare-fun e!629160 () Bool)

(assert (=> b!1102279 (= res!735506 e!629160)))

(declare-fun res!735514 () Bool)

(assert (=> b!1102279 (=> res!735514 e!629160)))

(assert (=> b!1102279 (= res!735514 (not e!629153))))

(declare-fun res!735511 () Bool)

(assert (=> b!1102279 (=> (not res!735511) (not e!629153))))

(assert (=> b!1102279 (= res!735511 (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun bm!46232 () Bool)

(declare-fun call!46234 () Bool)

(assert (=> bm!46232 (= call!46234 (contains!6378 lt!494413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1102280 () Bool)

(declare-fun e!629155 () Bool)

(assert (=> b!1102280 (= e!629155 (= (apply!946 lt!494413 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!831))))

(declare-fun b!1102281 () Bool)

(declare-fun e!629151 () Bool)

(assert (=> b!1102281 (= e!629151 (not call!46233))))

(declare-fun b!1102282 () Bool)

(assert (=> b!1102282 (= e!629160 e!629150)))

(declare-fun res!735509 () Bool)

(assert (=> b!1102282 (=> (not res!735509) (not e!629150))))

(assert (=> b!1102282 (= res!735509 (contains!6378 lt!494413 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(assert (=> b!1102282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun b!1102283 () Bool)

(declare-fun lt!494407 () Unit!36043)

(assert (=> b!1102283 (= e!629154 lt!494407)))

(declare-fun lt!494403 () ListLongMap!15431)

(assert (=> b!1102283 (= lt!494403 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494405 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494418 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494418 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(declare-fun lt!494416 () Unit!36043)

(assert (=> b!1102283 (= lt!494416 (addStillContains!659 lt!494403 lt!494405 zeroValue!831 lt!494418))))

(assert (=> b!1102283 (contains!6378 (+!3441 lt!494403 (tuple2!17463 lt!494405 zeroValue!831)) lt!494418)))

(declare-fun lt!494414 () Unit!36043)

(assert (=> b!1102283 (= lt!494414 lt!494416)))

(declare-fun lt!494408 () ListLongMap!15431)

(assert (=> b!1102283 (= lt!494408 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494415 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494415 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494420 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494420 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(declare-fun lt!494417 () Unit!36043)

(assert (=> b!1102283 (= lt!494417 (addApplyDifferent!515 lt!494408 lt!494415 minValue!831 lt!494420))))

(assert (=> b!1102283 (= (apply!946 (+!3441 lt!494408 (tuple2!17463 lt!494415 minValue!831)) lt!494420) (apply!946 lt!494408 lt!494420))))

(declare-fun lt!494409 () Unit!36043)

(assert (=> b!1102283 (= lt!494409 lt!494417)))

(declare-fun lt!494404 () ListLongMap!15431)

(assert (=> b!1102283 (= lt!494404 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494412 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494419 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494419 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(declare-fun lt!494423 () Unit!36043)

(assert (=> b!1102283 (= lt!494423 (addApplyDifferent!515 lt!494404 lt!494412 zeroValue!831 lt!494419))))

(assert (=> b!1102283 (= (apply!946 (+!3441 lt!494404 (tuple2!17463 lt!494412 zeroValue!831)) lt!494419) (apply!946 lt!494404 lt!494419))))

(declare-fun lt!494421 () Unit!36043)

(assert (=> b!1102283 (= lt!494421 lt!494423)))

(declare-fun lt!494410 () ListLongMap!15431)

(assert (=> b!1102283 (= lt!494410 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!494406 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494406 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!494424 () (_ BitVec 64))

(assert (=> b!1102283 (= lt!494424 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(assert (=> b!1102283 (= lt!494407 (addApplyDifferent!515 lt!494410 lt!494406 minValue!831 lt!494424))))

(assert (=> b!1102283 (= (apply!946 (+!3441 lt!494410 (tuple2!17463 lt!494406 minValue!831)) lt!494424) (apply!946 lt!494410 lt!494424))))

(declare-fun bm!46233 () Bool)

(declare-fun call!46236 () ListLongMap!15431)

(assert (=> bm!46233 (= call!46236 call!46238)))

(declare-fun b!1102284 () Bool)

(declare-fun e!629159 () ListLongMap!15431)

(declare-fun call!46239 () ListLongMap!15431)

(assert (=> b!1102284 (= e!629159 call!46239)))

(declare-fun b!1102285 () Bool)

(declare-fun c!108871 () Bool)

(assert (=> b!1102285 (= c!108871 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!629157 () ListLongMap!15431)

(assert (=> b!1102285 (= e!629159 e!629157)))

(declare-fun b!1102286 () Bool)

(assert (=> b!1102286 (= e!629151 e!629155)))

(declare-fun res!735507 () Bool)

(assert (=> b!1102286 (= res!735507 call!46233)))

(assert (=> b!1102286 (=> (not res!735507) (not e!629155))))

(declare-fun b!1102287 () Bool)

(declare-fun e!629152 () Bool)

(assert (=> b!1102287 (= e!629152 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun b!1102288 () Bool)

(declare-fun res!735512 () Bool)

(assert (=> b!1102288 (=> (not res!735512) (not e!629148))))

(declare-fun e!629158 () Bool)

(assert (=> b!1102288 (= res!735512 e!629158)))

(declare-fun c!108869 () Bool)

(assert (=> b!1102288 (= c!108869 (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1102277 () Bool)

(assert (=> b!1102277 (= e!629157 call!46239)))

(declare-fun d!130581 () Bool)

(assert (=> d!130581 e!629148))

(declare-fun res!735510 () Bool)

(assert (=> d!130581 (=> (not res!735510) (not e!629148))))

(assert (=> d!130581 (= res!735510 (or (bvsge #b00000000000000000000000000000000 (size!34861 lt!494237)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))))

(declare-fun lt!494422 () ListLongMap!15431)

(assert (=> d!130581 (= lt!494413 lt!494422)))

(declare-fun lt!494411 () Unit!36043)

(assert (=> d!130581 (= lt!494411 e!629154)))

(declare-fun c!108870 () Bool)

(assert (=> d!130581 (= c!108870 e!629152)))

(declare-fun res!735508 () Bool)

(assert (=> d!130581 (=> (not res!735508) (not e!629152))))

(assert (=> d!130581 (= res!735508 (bvslt #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(declare-fun e!629149 () ListLongMap!15431)

(assert (=> d!130581 (= lt!494422 e!629149)))

(declare-fun c!108872 () Bool)

(assert (=> d!130581 (= c!108872 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130581 (validMask!0 mask!1414)))

(assert (=> d!130581 (= (getCurrentListMap!4343 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494413)))

(declare-fun b!1102289 () Bool)

(declare-fun call!46237 () ListLongMap!15431)

(assert (=> b!1102289 (= e!629149 (+!3441 call!46237 (tuple2!17463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831)))))

(declare-fun b!1102290 () Bool)

(assert (=> b!1102290 (= e!629148 e!629151)))

(declare-fun c!108868 () Bool)

(assert (=> b!1102290 (= c!108868 (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1102291 () Bool)

(assert (=> b!1102291 (= e!629157 call!46236)))

(declare-fun c!108867 () Bool)

(declare-fun bm!46234 () Bool)

(assert (=> bm!46234 (= call!46237 (+!3441 (ite c!108872 call!46235 (ite c!108867 call!46238 call!46236)) (ite (or c!108872 c!108867) (tuple2!17463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831) (tuple2!17463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))))

(declare-fun b!1102292 () Bool)

(assert (=> b!1102292 (= e!629158 (not call!46234))))

(declare-fun b!1102293 () Bool)

(assert (=> b!1102293 (= e!629158 e!629156)))

(declare-fun res!735513 () Bool)

(assert (=> b!1102293 (= res!735513 call!46234)))

(assert (=> b!1102293 (=> (not res!735513) (not e!629156))))

(declare-fun bm!46235 () Bool)

(assert (=> bm!46235 (= call!46239 call!46237)))

(declare-fun b!1102294 () Bool)

(assert (=> b!1102294 (= e!629149 e!629159)))

(assert (=> b!1102294 (= c!108867 (and (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!46236 () Bool)

(assert (=> bm!46236 (= call!46235 (getCurrentListMapNoExtraKeys!4250 lt!494237 lt!494238 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130581 c!108872) b!1102289))

(assert (= (and d!130581 (not c!108872)) b!1102294))

(assert (= (and b!1102294 c!108867) b!1102284))

(assert (= (and b!1102294 (not c!108867)) b!1102285))

(assert (= (and b!1102285 c!108871) b!1102277))

(assert (= (and b!1102285 (not c!108871)) b!1102291))

(assert (= (or b!1102277 b!1102291) bm!46233))

(assert (= (or b!1102284 bm!46233) bm!46231))

(assert (= (or b!1102284 b!1102277) bm!46235))

(assert (= (or b!1102289 bm!46231) bm!46236))

(assert (= (or b!1102289 bm!46235) bm!46234))

(assert (= (and d!130581 res!735508) b!1102287))

(assert (= (and d!130581 c!108870) b!1102283))

(assert (= (and d!130581 (not c!108870)) b!1102275))

(assert (= (and d!130581 res!735510) b!1102279))

(assert (= (and b!1102279 res!735511) b!1102278))

(assert (= (and b!1102279 (not res!735514)) b!1102282))

(assert (= (and b!1102282 res!735509) b!1102276))

(assert (= (and b!1102279 res!735506) b!1102288))

(assert (= (and b!1102288 c!108869) b!1102293))

(assert (= (and b!1102288 (not c!108869)) b!1102292))

(assert (= (and b!1102293 res!735513) b!1102274))

(assert (= (or b!1102293 b!1102292) bm!46232))

(assert (= (and b!1102288 res!735512) b!1102290))

(assert (= (and b!1102290 c!108868) b!1102286))

(assert (= (and b!1102290 (not c!108868)) b!1102281))

(assert (= (and b!1102286 res!735507) b!1102280))

(assert (= (or b!1102286 b!1102281) bm!46230))

(declare-fun b_lambda!18147 () Bool)

(assert (=> (not b_lambda!18147) (not b!1102276)))

(assert (=> b!1102276 t!34284))

(declare-fun b_and!37189 () Bool)

(assert (= b_and!37187 (and (=> t!34284 result!16661) b_and!37189)))

(declare-fun m!1022091 () Bool)

(assert (=> bm!46232 m!1022091))

(declare-fun m!1022093 () Bool)

(assert (=> bm!46234 m!1022093))

(declare-fun m!1022095 () Bool)

(assert (=> b!1102283 m!1022095))

(declare-fun m!1022097 () Bool)

(assert (=> b!1102283 m!1022097))

(declare-fun m!1022099 () Bool)

(assert (=> b!1102283 m!1022099))

(declare-fun m!1022101 () Bool)

(assert (=> b!1102283 m!1022101))

(declare-fun m!1022103 () Bool)

(assert (=> b!1102283 m!1022103))

(assert (=> b!1102283 m!1022097))

(declare-fun m!1022105 () Bool)

(assert (=> b!1102283 m!1022105))

(assert (=> b!1102283 m!1021991))

(declare-fun m!1022107 () Bool)

(assert (=> b!1102283 m!1022107))

(declare-fun m!1022109 () Bool)

(assert (=> b!1102283 m!1022109))

(declare-fun m!1022111 () Bool)

(assert (=> b!1102283 m!1022111))

(declare-fun m!1022113 () Bool)

(assert (=> b!1102283 m!1022113))

(assert (=> b!1102283 m!1022095))

(declare-fun m!1022115 () Bool)

(assert (=> b!1102283 m!1022115))

(declare-fun m!1022117 () Bool)

(assert (=> b!1102283 m!1022117))

(assert (=> b!1102283 m!1022109))

(declare-fun m!1022119 () Bool)

(assert (=> b!1102283 m!1022119))

(declare-fun m!1022121 () Bool)

(assert (=> b!1102283 m!1022121))

(assert (=> b!1102283 m!1022113))

(declare-fun m!1022123 () Bool)

(assert (=> b!1102283 m!1022123))

(assert (=> b!1102283 m!1021867))

(declare-fun m!1022125 () Bool)

(assert (=> b!1102289 m!1022125))

(assert (=> b!1102287 m!1021991))

(assert (=> b!1102287 m!1021991))

(assert (=> b!1102287 m!1021993))

(declare-fun m!1022127 () Bool)

(assert (=> b!1102274 m!1022127))

(declare-fun m!1022129 () Bool)

(assert (=> b!1102280 m!1022129))

(declare-fun m!1022131 () Bool)

(assert (=> bm!46230 m!1022131))

(assert (=> b!1102282 m!1021991))

(assert (=> b!1102282 m!1021991))

(declare-fun m!1022133 () Bool)

(assert (=> b!1102282 m!1022133))

(assert (=> d!130581 m!1021895))

(assert (=> bm!46236 m!1021867))

(assert (=> b!1102276 m!1022021))

(assert (=> b!1102276 m!1021865))

(assert (=> b!1102276 m!1022027))

(assert (=> b!1102276 m!1021991))

(declare-fun m!1022135 () Bool)

(assert (=> b!1102276 m!1022135))

(assert (=> b!1102276 m!1021991))

(assert (=> b!1102276 m!1021865))

(assert (=> b!1102276 m!1022021))

(assert (=> b!1102278 m!1021991))

(assert (=> b!1102278 m!1021991))

(assert (=> b!1102278 m!1021993))

(assert (=> b!1102050 d!130581))

(declare-fun d!130583 () Bool)

(declare-fun lt!494427 () ListLongMap!15431)

(assert (=> d!130583 (not (contains!6378 lt!494427 k0!904))))

(declare-fun removeStrictlySorted!87 (List!24051 (_ BitVec 64)) List!24051)

(assert (=> d!130583 (= lt!494427 (ListLongMap!15432 (removeStrictlySorted!87 (toList!7731 lt!494240) k0!904)))))

(assert (=> d!130583 (= (-!958 lt!494240 k0!904) lt!494427)))

(declare-fun bs!32313 () Bool)

(assert (= bs!32313 d!130583))

(declare-fun m!1022137 () Bool)

(assert (=> bs!32313 m!1022137))

(declare-fun m!1022139 () Bool)

(assert (=> bs!32313 m!1022139))

(assert (=> b!1102050 d!130583))

(declare-fun call!46244 () ListLongMap!15431)

(declare-fun call!46245 () ListLongMap!15431)

(declare-fun e!629165 () Bool)

(declare-fun b!1102301 () Bool)

(assert (=> b!1102301 (= e!629165 (= call!46245 (-!958 call!46244 k0!904)))))

(assert (=> b!1102301 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34862 _values!874)))))

(declare-fun bm!46241 () Bool)

(assert (=> bm!46241 (= call!46245 (getCurrentListMapNoExtraKeys!4250 (array!71323 (store (arr!34323 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34861 _keys!1070)) (array!71325 (store (arr!34324 _values!874) i!650 (ValueCellFull!12914 (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34862 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun b!1102302 () Bool)

(declare-fun e!629166 () Bool)

(assert (=> b!1102302 (= e!629166 e!629165)))

(declare-fun c!108875 () Bool)

(assert (=> b!1102302 (= c!108875 (bvsle #b00000000000000000000000000000000 i!650))))

(declare-fun d!130585 () Bool)

(assert (=> d!130585 e!629166))

(declare-fun res!735517 () Bool)

(assert (=> d!130585 (=> (not res!735517) (not e!629166))))

(assert (=> d!130585 (= res!735517 (and (or (not (bvsle #b00000000000000000000000000000000 i!650)) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34861 _keys!1070)))) (or (bvsle #b00000000000000000000000000000000 i!650) (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34861 _keys!1070))))))))

(declare-fun lt!494430 () Unit!36043)

(declare-fun choose!1780 (array!71322 array!71324 (_ BitVec 32) (_ BitVec 32) V!41457 V!41457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36043)

(assert (=> d!130585 (= lt!494430 (choose!1780 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> d!130585 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(assert (=> d!130585 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!232 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882) lt!494430)))

(declare-fun b!1102303 () Bool)

(assert (=> b!1102303 (= e!629165 (= call!46245 call!46244))))

(assert (=> b!1102303 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34862 _values!874)))))

(declare-fun bm!46242 () Bool)

(assert (=> bm!46242 (= call!46244 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (= (and d!130585 res!735517) b!1102302))

(assert (= (and b!1102302 c!108875) b!1102301))

(assert (= (and b!1102302 (not c!108875)) b!1102303))

(assert (= (or b!1102301 b!1102303) bm!46242))

(assert (= (or b!1102301 b!1102303) bm!46241))

(declare-fun b_lambda!18149 () Bool)

(assert (=> (not b_lambda!18149) (not bm!46241)))

(assert (=> bm!46241 t!34284))

(declare-fun b_and!37191 () Bool)

(assert (= b_and!37189 (and (=> t!34284 result!16661) b_and!37191)))

(declare-fun m!1022141 () Bool)

(assert (=> b!1102301 m!1022141))

(assert (=> bm!46241 m!1021903))

(assert (=> bm!46241 m!1021865))

(assert (=> bm!46241 m!1021869))

(declare-fun m!1022143 () Bool)

(assert (=> bm!46241 m!1022143))

(declare-fun m!1022145 () Bool)

(assert (=> d!130585 m!1022145))

(assert (=> bm!46242 m!1021875))

(assert (=> b!1102050 d!130585))

(declare-fun b!1102304 () Bool)

(declare-fun e!629170 () Bool)

(declare-fun e!629169 () Bool)

(assert (=> b!1102304 (= e!629170 e!629169)))

(declare-fun c!108878 () Bool)

(assert (=> b!1102304 (= c!108878 (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun b!1102305 () Bool)

(assert (=> b!1102305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(assert (=> b!1102305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34862 _values!874)))))

(declare-fun lt!494437 () ListLongMap!15431)

(declare-fun e!629172 () Bool)

(assert (=> b!1102305 (= e!629172 (= (apply!946 lt!494437 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)) (get!17660 (select (arr!34324 _values!874) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1102306 () Bool)

(declare-fun e!629171 () ListLongMap!15431)

(declare-fun e!629168 () ListLongMap!15431)

(assert (=> b!1102306 (= e!629171 e!629168)))

(declare-fun c!108876 () Bool)

(assert (=> b!1102306 (= c!108876 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1102308 () Bool)

(assert (=> b!1102308 (= e!629169 (= lt!494437 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882)))))

(declare-fun b!1102309 () Bool)

(declare-fun res!735519 () Bool)

(declare-fun e!629167 () Bool)

(assert (=> b!1102309 (=> (not res!735519) (not e!629167))))

(assert (=> b!1102309 (= res!735519 (not (contains!6378 lt!494437 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1102310 () Bool)

(declare-fun call!46246 () ListLongMap!15431)

(assert (=> b!1102310 (= e!629168 call!46246)))

(declare-fun b!1102311 () Bool)

(assert (=> b!1102311 (= e!629167 e!629170)))

(declare-fun c!108879 () Bool)

(declare-fun e!629173 () Bool)

(assert (=> b!1102311 (= c!108879 e!629173)))

(declare-fun res!735518 () Bool)

(assert (=> b!1102311 (=> (not res!735518) (not e!629173))))

(assert (=> b!1102311 (= res!735518 (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun b!1102312 () Bool)

(declare-fun lt!494434 () Unit!36043)

(declare-fun lt!494435 () Unit!36043)

(assert (=> b!1102312 (= lt!494434 lt!494435)))

(declare-fun lt!494431 () V!41457)

(declare-fun lt!494432 () (_ BitVec 64))

(declare-fun lt!494436 () ListLongMap!15431)

(declare-fun lt!494433 () (_ BitVec 64))

(assert (=> b!1102312 (not (contains!6378 (+!3441 lt!494436 (tuple2!17463 lt!494433 lt!494431)) lt!494432))))

(assert (=> b!1102312 (= lt!494435 (addStillNotContains!282 lt!494436 lt!494433 lt!494431 lt!494432))))

(assert (=> b!1102312 (= lt!494432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1102312 (= lt!494431 (get!17660 (select (arr!34324 _values!874) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1102312 (= lt!494433 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> b!1102312 (= lt!494436 call!46246)))

(assert (=> b!1102312 (= e!629168 (+!3441 call!46246 (tuple2!17463 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000) (get!17660 (select (arr!34324 _values!874) #b00000000000000000000000000000000) (dynLambda!2319 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!46243 () Bool)

(assert (=> bm!46243 (= call!46246 (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!882))))

(declare-fun b!1102307 () Bool)

(assert (=> b!1102307 (= e!629170 e!629172)))

(assert (=> b!1102307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(declare-fun res!735520 () Bool)

(assert (=> b!1102307 (= res!735520 (contains!6378 lt!494437 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102307 (=> (not res!735520) (not e!629172))))

(declare-fun d!130587 () Bool)

(assert (=> d!130587 e!629167))

(declare-fun res!735521 () Bool)

(assert (=> d!130587 (=> (not res!735521) (not e!629167))))

(assert (=> d!130587 (= res!735521 (not (contains!6378 lt!494437 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130587 (= lt!494437 e!629171)))

(declare-fun c!108877 () Bool)

(assert (=> d!130587 (= c!108877 (bvsge #b00000000000000000000000000000000 (size!34861 _keys!1070)))))

(assert (=> d!130587 (validMask!0 mask!1414)))

(assert (=> d!130587 (= (getCurrentListMapNoExtraKeys!4250 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882) lt!494437)))

(declare-fun b!1102313 () Bool)

(assert (=> b!1102313 (= e!629171 (ListLongMap!15432 Nil!24048))))

(declare-fun b!1102314 () Bool)

(assert (=> b!1102314 (= e!629169 (isEmpty!976 lt!494437))))

(declare-fun b!1102315 () Bool)

(assert (=> b!1102315 (= e!629173 (validKeyInArray!0 (select (arr!34323 _keys!1070) #b00000000000000000000000000000000)))))

(assert (=> b!1102315 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!130587 c!108877) b!1102313))

(assert (= (and d!130587 (not c!108877)) b!1102306))

(assert (= (and b!1102306 c!108876) b!1102312))

(assert (= (and b!1102306 (not c!108876)) b!1102310))

(assert (= (or b!1102312 b!1102310) bm!46243))

(assert (= (and d!130587 res!735521) b!1102309))

(assert (= (and b!1102309 res!735519) b!1102311))

(assert (= (and b!1102311 res!735518) b!1102315))

(assert (= (and b!1102311 c!108879) b!1102307))

(assert (= (and b!1102311 (not c!108879)) b!1102304))

(assert (= (and b!1102307 res!735520) b!1102305))

(assert (= (and b!1102304 c!108878) b!1102308))

(assert (= (and b!1102304 (not c!108878)) b!1102314))

(declare-fun b_lambda!18151 () Bool)

(assert (=> (not b_lambda!18151) (not b!1102305)))

(assert (=> b!1102305 t!34284))

(declare-fun b_and!37193 () Bool)

(assert (= b_and!37191 (and (=> t!34284 result!16661) b_and!37193)))

(declare-fun b_lambda!18153 () Bool)

(assert (=> (not b_lambda!18153) (not b!1102312)))

(assert (=> b!1102312 t!34284))

(declare-fun b_and!37195 () Bool)

(assert (= b_and!37193 (and (=> t!34284 result!16661) b_and!37195)))

(assert (=> b!1102315 m!1021999))

(assert (=> b!1102315 m!1021999))

(assert (=> b!1102315 m!1022001))

(declare-fun m!1022147 () Bool)

(assert (=> b!1102308 m!1022147))

(assert (=> bm!46243 m!1022147))

(declare-fun m!1022149 () Bool)

(assert (=> b!1102309 m!1022149))

(assert (=> b!1102312 m!1022085))

(declare-fun m!1022151 () Bool)

(assert (=> b!1102312 m!1022151))

(declare-fun m!1022153 () Bool)

(assert (=> b!1102312 m!1022153))

(assert (=> b!1102312 m!1022085))

(assert (=> b!1102312 m!1021865))

(assert (=> b!1102312 m!1022087))

(declare-fun m!1022155 () Bool)

(assert (=> b!1102312 m!1022155))

(declare-fun m!1022157 () Bool)

(assert (=> b!1102312 m!1022157))

(assert (=> b!1102312 m!1021865))

(assert (=> b!1102312 m!1022155))

(assert (=> b!1102312 m!1021999))

(declare-fun m!1022159 () Bool)

(assert (=> d!130587 m!1022159))

(assert (=> d!130587 m!1021895))

(assert (=> b!1102306 m!1021999))

(assert (=> b!1102306 m!1021999))

(assert (=> b!1102306 m!1022001))

(declare-fun m!1022161 () Bool)

(assert (=> b!1102314 m!1022161))

(assert (=> b!1102305 m!1022085))

(assert (=> b!1102305 m!1022085))

(assert (=> b!1102305 m!1021865))

(assert (=> b!1102305 m!1022087))

(assert (=> b!1102305 m!1021999))

(declare-fun m!1022163 () Bool)

(assert (=> b!1102305 m!1022163))

(assert (=> b!1102305 m!1021999))

(assert (=> b!1102305 m!1021865))

(assert (=> b!1102307 m!1021999))

(assert (=> b!1102307 m!1021999))

(declare-fun m!1022165 () Bool)

(assert (=> b!1102307 m!1022165))

(assert (=> b!1102050 d!130587))

(declare-fun d!130589 () Bool)

(assert (=> d!130589 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!494440 () Unit!36043)

(declare-fun choose!13 (array!71322 (_ BitVec 64) (_ BitVec 32)) Unit!36043)

(assert (=> d!130589 (= lt!494440 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!130589 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!130589 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!494440)))

(declare-fun bs!32314 () Bool)

(assert (= bs!32314 d!130589))

(assert (=> bs!32314 m!1021877))

(declare-fun m!1022167 () Bool)

(assert (=> bs!32314 m!1022167))

(assert (=> b!1102050 d!130589))

(declare-fun d!130591 () Bool)

(assert (=> d!130591 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96874 d!130591))

(declare-fun d!130593 () Bool)

(assert (=> d!130593 (= (array_inv!26470 _keys!1070) (bvsge (size!34861 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96874 d!130593))

(declare-fun d!130595 () Bool)

(assert (=> d!130595 (= (array_inv!26471 _values!874) (bvsge (size!34862 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96874 d!130595))

(declare-fun b!1102316 () Bool)

(declare-fun e!629176 () Bool)

(declare-fun e!629175 () Bool)

(assert (=> b!1102316 (= e!629176 e!629175)))

(declare-fun c!108880 () Bool)

(assert (=> b!1102316 (= c!108880 (validKeyInArray!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000)))))

(declare-fun b!1102317 () Bool)

(declare-fun e!629174 () Bool)

(assert (=> b!1102317 (= e!629175 e!629174)))

(declare-fun lt!494442 () (_ BitVec 64))

(assert (=> b!1102317 (= lt!494442 (select (arr!34323 lt!494237) #b00000000000000000000000000000000))))

(declare-fun lt!494443 () Unit!36043)

(assert (=> b!1102317 (= lt!494443 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!494237 lt!494442 #b00000000000000000000000000000000))))

(assert (=> b!1102317 (arrayContainsKey!0 lt!494237 lt!494442 #b00000000000000000000000000000000)))

(declare-fun lt!494441 () Unit!36043)

(assert (=> b!1102317 (= lt!494441 lt!494443)))

(declare-fun res!735523 () Bool)

(assert (=> b!1102317 (= res!735523 (= (seekEntryOrOpen!0 (select (arr!34323 lt!494237) #b00000000000000000000000000000000) lt!494237 mask!1414) (Found!9915 #b00000000000000000000000000000000)))))

(assert (=> b!1102317 (=> (not res!735523) (not e!629174))))

(declare-fun b!1102318 () Bool)

(declare-fun call!46247 () Bool)

(assert (=> b!1102318 (= e!629175 call!46247)))

(declare-fun d!130597 () Bool)

(declare-fun res!735522 () Bool)

(assert (=> d!130597 (=> res!735522 e!629176)))

(assert (=> d!130597 (= res!735522 (bvsge #b00000000000000000000000000000000 (size!34861 lt!494237)))))

(assert (=> d!130597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494237 mask!1414) e!629176)))

(declare-fun bm!46244 () Bool)

(assert (=> bm!46244 (= call!46247 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!494237 mask!1414))))

(declare-fun b!1102319 () Bool)

(assert (=> b!1102319 (= e!629174 call!46247)))

(assert (= (and d!130597 (not res!735522)) b!1102316))

(assert (= (and b!1102316 c!108880) b!1102317))

(assert (= (and b!1102316 (not c!108880)) b!1102318))

(assert (= (and b!1102317 res!735523) b!1102319))

(assert (= (or b!1102319 b!1102318) bm!46244))

(assert (=> b!1102316 m!1021991))

(assert (=> b!1102316 m!1021991))

(assert (=> b!1102316 m!1021993))

(assert (=> b!1102317 m!1021991))

(declare-fun m!1022169 () Bool)

(assert (=> b!1102317 m!1022169))

(declare-fun m!1022171 () Bool)

(assert (=> b!1102317 m!1022171))

(assert (=> b!1102317 m!1021991))

(declare-fun m!1022173 () Bool)

(assert (=> b!1102317 m!1022173))

(declare-fun m!1022175 () Bool)

(assert (=> bm!46244 m!1022175))

(assert (=> b!1102048 d!130597))

(declare-fun b!1102326 () Bool)

(declare-fun e!629182 () Bool)

(assert (=> b!1102326 (= e!629182 tp_is_empty!27247)))

(declare-fun b!1102327 () Bool)

(declare-fun e!629181 () Bool)

(assert (=> b!1102327 (= e!629181 tp_is_empty!27247)))

(declare-fun condMapEmpty!42670 () Bool)

(declare-fun mapDefault!42670 () ValueCell!12914)

(assert (=> mapNonEmpty!42661 (= condMapEmpty!42670 (= mapRest!42661 ((as const (Array (_ BitVec 32) ValueCell!12914)) mapDefault!42670)))))

(declare-fun mapRes!42670 () Bool)

(assert (=> mapNonEmpty!42661 (= tp!81547 (and e!629181 mapRes!42670))))

(declare-fun mapNonEmpty!42670 () Bool)

(declare-fun tp!81563 () Bool)

(assert (=> mapNonEmpty!42670 (= mapRes!42670 (and tp!81563 e!629182))))

(declare-fun mapKey!42670 () (_ BitVec 32))

(declare-fun mapValue!42670 () ValueCell!12914)

(declare-fun mapRest!42670 () (Array (_ BitVec 32) ValueCell!12914))

(assert (=> mapNonEmpty!42670 (= mapRest!42661 (store mapRest!42670 mapKey!42670 mapValue!42670))))

(declare-fun mapIsEmpty!42670 () Bool)

(assert (=> mapIsEmpty!42670 mapRes!42670))

(assert (= (and mapNonEmpty!42661 condMapEmpty!42670) mapIsEmpty!42670))

(assert (= (and mapNonEmpty!42661 (not condMapEmpty!42670)) mapNonEmpty!42670))

(assert (= (and mapNonEmpty!42670 ((_ is ValueCellFull!12914) mapValue!42670)) b!1102326))

(assert (= (and mapNonEmpty!42661 ((_ is ValueCellFull!12914) mapDefault!42670)) b!1102327))

(declare-fun m!1022177 () Bool)

(assert (=> mapNonEmpty!42670 m!1022177))

(declare-fun b_lambda!18155 () Bool)

(assert (= b_lambda!18151 (or (and start!96874 b_free!23197) b_lambda!18155)))

(declare-fun b_lambda!18157 () Bool)

(assert (= b_lambda!18145 (or (and start!96874 b_free!23197) b_lambda!18157)))

(declare-fun b_lambda!18159 () Bool)

(assert (= b_lambda!18141 (or (and start!96874 b_free!23197) b_lambda!18159)))

(declare-fun b_lambda!18161 () Bool)

(assert (= b_lambda!18143 (or (and start!96874 b_free!23197) b_lambda!18161)))

(declare-fun b_lambda!18163 () Bool)

(assert (= b_lambda!18149 (or (and start!96874 b_free!23197) b_lambda!18163)))

(declare-fun b_lambda!18165 () Bool)

(assert (= b_lambda!18153 (or (and start!96874 b_free!23197) b_lambda!18165)))

(declare-fun b_lambda!18167 () Bool)

(assert (= b_lambda!18147 (or (and start!96874 b_free!23197) b_lambda!18167)))

(check-sat (not b!1102202) (not bm!46223) (not b!1102210) (not b!1102312) (not b!1102301) (not b!1102209) (not b!1102289) (not d!130577) (not bm!46201) (not b!1102151) (not bm!46232) (not b!1102160) (not bm!46204) (not b!1102148) (not b_lambda!18167) (not d!130585) (not b!1102268) (not b_lambda!18161) (not b!1102309) (not bm!46225) (not b!1102204) (not b!1102278) (not b!1102282) (not b!1102314) (not b!1102253) (not bm!46236) (not b!1102257) (not b!1102316) (not b_lambda!18155) (not b!1102165) (not b!1102276) (not d!130579) (not b!1102307) (not b!1102166) (not bm!46243) (not b!1102306) (not b!1102287) (not b!1102261) (not b!1102207) (not d!130581) (not b_lambda!18163) (not bm!46244) (not b!1102168) (not d!130587) (not b!1102317) (not b!1102255) (not b!1102262) (not b!1102266) (not b!1102308) (not b_lambda!18139) (not b_next!23197) (not bm!46230) (not b!1102149) (not b!1102283) tp_is_empty!27247 (not bm!46227) (not bm!46242) (not bm!46241) (not b!1102200) (not b_lambda!18159) (not b!1102201) (not b!1102259) (not b_lambda!18157) (not mapNonEmpty!42670) (not b!1102203) (not b!1102274) (not bm!46205) (not b!1102174) (not bm!46234) (not d!130583) b_and!37195 (not d!130589) (not b!1102305) (not b!1102315) (not b_lambda!18165) (not b!1102280) (not b!1102161) (not bm!46208) (not bm!46229))
(check-sat b_and!37195 (not b_next!23197))
