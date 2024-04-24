; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96366 () Bool)

(assert start!96366)

(declare-fun b_free!22783 () Bool)

(declare-fun b_next!22783 () Bool)

(assert (=> start!96366 (= b_free!22783 (not b_next!22783))))

(declare-fun tp!80198 () Bool)

(declare-fun b_and!36251 () Bool)

(assert (=> start!96366 (= tp!80198 b_and!36251)))

(declare-fun b!1092302 () Bool)

(declare-fun e!623945 () Bool)

(declare-fun e!623939 () Bool)

(assert (=> b!1092302 (= e!623945 e!623939)))

(declare-fun res!728382 () Bool)

(assert (=> b!1092302 (=> res!728382 e!623939)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1092302 (= res!728382 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40841 0))(
  ( (V!40842 (val!13449 Int)) )
))
(declare-datatypes ((tuple2!17106 0))(
  ( (tuple2!17107 (_1!8564 (_ BitVec 64)) (_2!8564 V!40841)) )
))
(declare-datatypes ((List!23699 0))(
  ( (Nil!23696) (Cons!23695 (h!24913 tuple2!17106) (t!33532 List!23699)) )
))
(declare-datatypes ((ListLongMap!15083 0))(
  ( (ListLongMap!15084 (toList!7557 List!23699)) )
))
(declare-fun lt!487533 () ListLongMap!15083)

(declare-fun lt!487532 () ListLongMap!15083)

(assert (=> b!1092302 (= lt!487533 lt!487532)))

(declare-fun lt!487531 () ListLongMap!15083)

(declare-fun lt!487535 () tuple2!17106)

(declare-fun +!3372 (ListLongMap!15083 tuple2!17106) ListLongMap!15083)

(assert (=> b!1092302 (= lt!487532 (+!3372 lt!487531 lt!487535))))

(declare-fun lt!487528 () ListLongMap!15083)

(declare-fun lt!487524 () ListLongMap!15083)

(assert (=> b!1092302 (= lt!487528 lt!487524)))

(declare-fun lt!487525 () ListLongMap!15083)

(assert (=> b!1092302 (= lt!487524 (+!3372 lt!487525 lt!487535))))

(declare-fun lt!487536 () ListLongMap!15083)

(assert (=> b!1092302 (= lt!487528 (+!3372 lt!487536 lt!487535))))

(declare-fun minValue!831 () V!40841)

(assert (=> b!1092302 (= lt!487535 (tuple2!17107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1092303 () Bool)

(declare-fun e!623942 () Bool)

(declare-fun tp_is_empty!26785 () Bool)

(assert (=> b!1092303 (= e!623942 tp_is_empty!26785)))

(declare-fun b!1092304 () Bool)

(declare-fun res!728377 () Bool)

(declare-fun e!623941 () Bool)

(assert (=> b!1092304 (=> (not res!728377) (not e!623941))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70527 0))(
  ( (array!70528 (arr!33931 (Array (_ BitVec 32) (_ BitVec 64))) (size!34468 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70527)

(assert (=> b!1092304 (= res!728377 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34468 _keys!1070))))))

(declare-fun b!1092305 () Bool)

(declare-fun res!728381 () Bool)

(assert (=> b!1092305 (=> (not res!728381) (not e!623941))))

(declare-datatypes ((List!23700 0))(
  ( (Nil!23697) (Cons!23696 (h!24914 (_ BitVec 64)) (t!33533 List!23700)) )
))
(declare-fun arrayNoDuplicates!0 (array!70527 (_ BitVec 32) List!23700) Bool)

(assert (=> b!1092305 (= res!728381 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23697))))

(declare-fun b!1092306 () Bool)

(declare-fun res!728383 () Bool)

(assert (=> b!1092306 (=> (not res!728383) (not e!623941))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70527 (_ BitVec 32)) Bool)

(assert (=> b!1092306 (= res!728383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092307 () Bool)

(declare-fun e!623940 () Bool)

(assert (=> b!1092307 (= e!623941 e!623940)))

(declare-fun res!728375 () Bool)

(assert (=> b!1092307 (=> (not res!728375) (not e!623940))))

(declare-fun lt!487534 () array!70527)

(assert (=> b!1092307 (= res!728375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!487534 mask!1414))))

(assert (=> b!1092307 (= lt!487534 (array!70528 (store (arr!33931 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34468 _keys!1070)))))

(declare-fun b!1092308 () Bool)

(declare-fun res!728385 () Bool)

(assert (=> b!1092308 (=> (not res!728385) (not e!623941))))

(assert (=> b!1092308 (= res!728385 (= (select (arr!33931 _keys!1070) i!650) k0!904))))

(declare-fun b!1092309 () Bool)

(assert (=> b!1092309 (= e!623940 (not e!623945))))

(declare-fun res!728379 () Bool)

(assert (=> b!1092309 (=> res!728379 e!623945)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092309 (= res!728379 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40841)

(declare-datatypes ((ValueCell!12683 0))(
  ( (ValueCellFull!12683 (v!16066 V!40841)) (EmptyCell!12683) )
))
(declare-datatypes ((array!70529 0))(
  ( (array!70530 (arr!33932 (Array (_ BitVec 32) ValueCell!12683)) (size!34469 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70529)

(declare-fun getCurrentListMap!4309 (array!70527 array!70529 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) Int) ListLongMap!15083)

(assert (=> b!1092309 (= lt!487533 (getCurrentListMap!4309 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!487527 () array!70529)

(assert (=> b!1092309 (= lt!487528 (getCurrentListMap!4309 lt!487534 lt!487527 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1092309 (and (= lt!487536 lt!487525) (= lt!487525 lt!487536))))

(declare-fun -!863 (ListLongMap!15083 (_ BitVec 64)) ListLongMap!15083)

(assert (=> b!1092309 (= lt!487525 (-!863 lt!487531 k0!904))))

(declare-datatypes ((Unit!35893 0))(
  ( (Unit!35894) )
))
(declare-fun lt!487530 () Unit!35893)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 (array!70527 array!70529 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35893)

(assert (=> b!1092309 (= lt!487530 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!138 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4114 (array!70527 array!70529 (_ BitVec 32) (_ BitVec 32) V!40841 V!40841 (_ BitVec 32) Int) ListLongMap!15083)

(assert (=> b!1092309 (= lt!487536 (getCurrentListMapNoExtraKeys!4114 lt!487534 lt!487527 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2235 (Int (_ BitVec 64)) V!40841)

(assert (=> b!1092309 (= lt!487527 (array!70530 (store (arr!33932 _values!874) i!650 (ValueCellFull!12683 (dynLambda!2235 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34469 _values!874)))))

(assert (=> b!1092309 (= lt!487531 (getCurrentListMapNoExtraKeys!4114 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092309 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!487529 () Unit!35893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70527 (_ BitVec 64) (_ BitVec 32)) Unit!35893)

(assert (=> b!1092309 (= lt!487529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092310 () Bool)

(declare-fun res!728378 () Bool)

(assert (=> b!1092310 (=> (not res!728378) (not e!623940))))

(assert (=> b!1092310 (= res!728378 (arrayNoDuplicates!0 lt!487534 #b00000000000000000000000000000000 Nil!23697))))

(declare-fun mapNonEmpty!41932 () Bool)

(declare-fun mapRes!41932 () Bool)

(declare-fun tp!80197 () Bool)

(assert (=> mapNonEmpty!41932 (= mapRes!41932 (and tp!80197 e!623942))))

(declare-fun mapRest!41932 () (Array (_ BitVec 32) ValueCell!12683))

(declare-fun mapValue!41932 () ValueCell!12683)

(declare-fun mapKey!41932 () (_ BitVec 32))

(assert (=> mapNonEmpty!41932 (= (arr!33932 _values!874) (store mapRest!41932 mapKey!41932 mapValue!41932))))

(declare-fun b!1092311 () Bool)

(assert (=> b!1092311 (= e!623939 (bvsle #b00000000000000000000000000000000 (size!34468 _keys!1070)))))

(assert (=> b!1092311 (= (-!863 lt!487532 k0!904) lt!487524)))

(declare-fun lt!487526 () Unit!35893)

(declare-fun addRemoveCommutativeForDiffKeys!97 (ListLongMap!15083 (_ BitVec 64) V!40841 (_ BitVec 64)) Unit!35893)

(assert (=> b!1092311 (= lt!487526 (addRemoveCommutativeForDiffKeys!97 lt!487531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun res!728380 () Bool)

(assert (=> start!96366 (=> (not res!728380) (not e!623941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96366 (= res!728380 (validMask!0 mask!1414))))

(assert (=> start!96366 e!623941))

(assert (=> start!96366 tp!80198))

(assert (=> start!96366 true))

(assert (=> start!96366 tp_is_empty!26785))

(declare-fun array_inv!26208 (array!70527) Bool)

(assert (=> start!96366 (array_inv!26208 _keys!1070)))

(declare-fun e!623943 () Bool)

(declare-fun array_inv!26209 (array!70529) Bool)

(assert (=> start!96366 (and (array_inv!26209 _values!874) e!623943)))

(declare-fun b!1092312 () Bool)

(declare-fun res!728376 () Bool)

(assert (=> b!1092312 (=> (not res!728376) (not e!623941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092312 (= res!728376 (validKeyInArray!0 k0!904))))

(declare-fun b!1092313 () Bool)

(declare-fun res!728384 () Bool)

(assert (=> b!1092313 (=> (not res!728384) (not e!623941))))

(assert (=> b!1092313 (= res!728384 (and (= (size!34469 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34468 _keys!1070) (size!34469 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41932 () Bool)

(assert (=> mapIsEmpty!41932 mapRes!41932))

(declare-fun b!1092314 () Bool)

(declare-fun e!623944 () Bool)

(assert (=> b!1092314 (= e!623943 (and e!623944 mapRes!41932))))

(declare-fun condMapEmpty!41932 () Bool)

(declare-fun mapDefault!41932 () ValueCell!12683)

(assert (=> b!1092314 (= condMapEmpty!41932 (= (arr!33932 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12683)) mapDefault!41932)))))

(declare-fun b!1092315 () Bool)

(assert (=> b!1092315 (= e!623944 tp_is_empty!26785)))

(assert (= (and start!96366 res!728380) b!1092313))

(assert (= (and b!1092313 res!728384) b!1092306))

(assert (= (and b!1092306 res!728383) b!1092305))

(assert (= (and b!1092305 res!728381) b!1092304))

(assert (= (and b!1092304 res!728377) b!1092312))

(assert (= (and b!1092312 res!728376) b!1092308))

(assert (= (and b!1092308 res!728385) b!1092307))

(assert (= (and b!1092307 res!728375) b!1092310))

(assert (= (and b!1092310 res!728378) b!1092309))

(assert (= (and b!1092309 (not res!728379)) b!1092302))

(assert (= (and b!1092302 (not res!728382)) b!1092311))

(assert (= (and b!1092314 condMapEmpty!41932) mapIsEmpty!41932))

(assert (= (and b!1092314 (not condMapEmpty!41932)) mapNonEmpty!41932))

(get-info :version)

(assert (= (and mapNonEmpty!41932 ((_ is ValueCellFull!12683) mapValue!41932)) b!1092303))

(assert (= (and b!1092314 ((_ is ValueCellFull!12683) mapDefault!41932)) b!1092315))

(assert (= start!96366 b!1092314))

(declare-fun b_lambda!17463 () Bool)

(assert (=> (not b_lambda!17463) (not b!1092309)))

(declare-fun t!33531 () Bool)

(declare-fun tb!7653 () Bool)

(assert (=> (and start!96366 (= defaultEntry!882 defaultEntry!882) t!33531) tb!7653))

(declare-fun result!15833 () Bool)

(assert (=> tb!7653 (= result!15833 tp_is_empty!26785)))

(assert (=> b!1092309 t!33531))

(declare-fun b_and!36253 () Bool)

(assert (= b_and!36251 (and (=> t!33531 result!15833) b_and!36253)))

(declare-fun m!1012151 () Bool)

(assert (=> b!1092308 m!1012151))

(declare-fun m!1012153 () Bool)

(assert (=> b!1092302 m!1012153))

(declare-fun m!1012155 () Bool)

(assert (=> b!1092302 m!1012155))

(declare-fun m!1012157 () Bool)

(assert (=> b!1092302 m!1012157))

(declare-fun m!1012159 () Bool)

(assert (=> b!1092306 m!1012159))

(declare-fun m!1012161 () Bool)

(assert (=> b!1092305 m!1012161))

(declare-fun m!1012163 () Bool)

(assert (=> b!1092311 m!1012163))

(declare-fun m!1012165 () Bool)

(assert (=> b!1092311 m!1012165))

(declare-fun m!1012167 () Bool)

(assert (=> b!1092309 m!1012167))

(declare-fun m!1012169 () Bool)

(assert (=> b!1092309 m!1012169))

(declare-fun m!1012171 () Bool)

(assert (=> b!1092309 m!1012171))

(declare-fun m!1012173 () Bool)

(assert (=> b!1092309 m!1012173))

(declare-fun m!1012175 () Bool)

(assert (=> b!1092309 m!1012175))

(declare-fun m!1012177 () Bool)

(assert (=> b!1092309 m!1012177))

(declare-fun m!1012179 () Bool)

(assert (=> b!1092309 m!1012179))

(declare-fun m!1012181 () Bool)

(assert (=> b!1092309 m!1012181))

(declare-fun m!1012183 () Bool)

(assert (=> b!1092309 m!1012183))

(declare-fun m!1012185 () Bool)

(assert (=> b!1092309 m!1012185))

(declare-fun m!1012187 () Bool)

(assert (=> b!1092310 m!1012187))

(declare-fun m!1012189 () Bool)

(assert (=> mapNonEmpty!41932 m!1012189))

(declare-fun m!1012191 () Bool)

(assert (=> start!96366 m!1012191))

(declare-fun m!1012193 () Bool)

(assert (=> start!96366 m!1012193))

(declare-fun m!1012195 () Bool)

(assert (=> start!96366 m!1012195))

(declare-fun m!1012197 () Bool)

(assert (=> b!1092307 m!1012197))

(declare-fun m!1012199 () Bool)

(assert (=> b!1092307 m!1012199))

(declare-fun m!1012201 () Bool)

(assert (=> b!1092312 m!1012201))

(check-sat (not b_lambda!17463) (not b!1092312) b_and!36253 (not b!1092310) (not b!1092309) tp_is_empty!26785 (not b!1092305) (not start!96366) (not b!1092307) (not mapNonEmpty!41932) (not b!1092306) (not b!1092311) (not b!1092302) (not b_next!22783))
(check-sat b_and!36253 (not b_next!22783))
