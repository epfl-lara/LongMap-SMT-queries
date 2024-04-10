; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96042 () Bool)

(assert start!96042)

(declare-fun b_free!22695 () Bool)

(declare-fun b_next!22695 () Bool)

(assert (=> start!96042 (= b_free!22695 (not b_next!22695))))

(declare-fun tp!79933 () Bool)

(declare-fun b_and!36065 () Bool)

(assert (=> start!96042 (= tp!79933 b_and!36065)))

(declare-fun b!1089030 () Bool)

(declare-fun e!622032 () Bool)

(declare-fun tp_is_empty!26697 () Bool)

(assert (=> b!1089030 (= e!622032 tp_is_empty!26697)))

(declare-fun b!1089031 () Bool)

(declare-fun res!726395 () Bool)

(declare-fun e!622029 () Bool)

(assert (=> b!1089031 (=> (not res!726395) (not e!622029))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70319 0))(
  ( (array!70320 (arr!33833 (Array (_ BitVec 32) (_ BitVec 64))) (size!34369 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70319)

(declare-datatypes ((V!40723 0))(
  ( (V!40724 (val!13405 Int)) )
))
(declare-datatypes ((ValueCell!12639 0))(
  ( (ValueCellFull!12639 (v!16026 V!40723)) (EmptyCell!12639) )
))
(declare-datatypes ((array!70321 0))(
  ( (array!70322 (arr!33834 (Array (_ BitVec 32) ValueCell!12639)) (size!34370 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70321)

(assert (=> b!1089031 (= res!726395 (and (= (size!34370 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34369 _keys!1070) (size!34370 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089032 () Bool)

(declare-fun res!726394 () Bool)

(assert (=> b!1089032 (=> (not res!726394) (not e!622029))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089032 (= res!726394 (= (select (arr!33833 _keys!1070) i!650) k0!904))))

(declare-fun b!1089033 () Bool)

(declare-fun res!726398 () Bool)

(assert (=> b!1089033 (=> (not res!726398) (not e!622029))))

(assert (=> b!1089033 (= res!726398 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34369 _keys!1070))))))

(declare-fun b!1089034 () Bool)

(declare-fun res!726399 () Bool)

(assert (=> b!1089034 (=> (not res!726399) (not e!622029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70319 (_ BitVec 32)) Bool)

(assert (=> b!1089034 (= res!726399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089035 () Bool)

(declare-fun e!622028 () Bool)

(declare-fun mapRes!41800 () Bool)

(assert (=> b!1089035 (= e!622028 (and e!622032 mapRes!41800))))

(declare-fun condMapEmpty!41800 () Bool)

(declare-fun mapDefault!41800 () ValueCell!12639)

(assert (=> b!1089035 (= condMapEmpty!41800 (= (arr!33834 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12639)) mapDefault!41800)))))

(declare-fun mapNonEmpty!41800 () Bool)

(declare-fun tp!79934 () Bool)

(declare-fun e!622031 () Bool)

(assert (=> mapNonEmpty!41800 (= mapRes!41800 (and tp!79934 e!622031))))

(declare-fun mapValue!41800 () ValueCell!12639)

(declare-fun mapKey!41800 () (_ BitVec 32))

(declare-fun mapRest!41800 () (Array (_ BitVec 32) ValueCell!12639))

(assert (=> mapNonEmpty!41800 (= (arr!33834 _values!874) (store mapRest!41800 mapKey!41800 mapValue!41800))))

(declare-fun b!1089036 () Bool)

(assert (=> b!1089036 (= e!622031 tp_is_empty!26697)))

(declare-fun b!1089037 () Bool)

(declare-fun e!622033 () Bool)

(assert (=> b!1089037 (= e!622029 e!622033)))

(declare-fun res!726400 () Bool)

(assert (=> b!1089037 (=> (not res!726400) (not e!622033))))

(declare-fun lt!485325 () array!70319)

(assert (=> b!1089037 (= res!726400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485325 mask!1414))))

(assert (=> b!1089037 (= lt!485325 (array!70320 (store (arr!33833 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34369 _keys!1070)))))

(declare-fun res!726397 () Bool)

(assert (=> start!96042 (=> (not res!726397) (not e!622029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96042 (= res!726397 (validMask!0 mask!1414))))

(assert (=> start!96042 e!622029))

(assert (=> start!96042 tp!79933))

(assert (=> start!96042 true))

(assert (=> start!96042 tp_is_empty!26697))

(declare-fun array_inv!26094 (array!70319) Bool)

(assert (=> start!96042 (array_inv!26094 _keys!1070)))

(declare-fun array_inv!26095 (array!70321) Bool)

(assert (=> start!96042 (and (array_inv!26095 _values!874) e!622028)))

(declare-fun mapIsEmpty!41800 () Bool)

(assert (=> mapIsEmpty!41800 mapRes!41800))

(declare-fun b!1089038 () Bool)

(declare-fun res!726396 () Bool)

(assert (=> b!1089038 (=> (not res!726396) (not e!622029))))

(declare-datatypes ((List!23614 0))(
  ( (Nil!23611) (Cons!23610 (h!24819 (_ BitVec 64)) (t!33367 List!23614)) )
))
(declare-fun arrayNoDuplicates!0 (array!70319 (_ BitVec 32) List!23614) Bool)

(assert (=> b!1089038 (= res!726396 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23611))))

(declare-fun b!1089039 () Bool)

(declare-fun e!622030 () Bool)

(declare-fun e!622027 () Bool)

(assert (=> b!1089039 (= e!622030 e!622027)))

(declare-fun res!726393 () Bool)

(assert (=> b!1089039 (=> res!726393 e!622027)))

(assert (=> b!1089039 (= res!726393 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17026 0))(
  ( (tuple2!17027 (_1!8524 (_ BitVec 64)) (_2!8524 V!40723)) )
))
(declare-datatypes ((List!23615 0))(
  ( (Nil!23612) (Cons!23611 (h!24820 tuple2!17026) (t!33368 List!23615)) )
))
(declare-datatypes ((ListLongMap!14995 0))(
  ( (ListLongMap!14996 (toList!7513 List!23615)) )
))
(declare-fun lt!485332 () ListLongMap!14995)

(declare-fun lt!485324 () ListLongMap!14995)

(assert (=> b!1089039 (= lt!485332 lt!485324)))

(declare-fun lt!485330 () ListLongMap!14995)

(declare-fun lt!485321 () tuple2!17026)

(declare-fun +!3310 (ListLongMap!14995 tuple2!17026) ListLongMap!14995)

(assert (=> b!1089039 (= lt!485324 (+!3310 lt!485330 lt!485321))))

(declare-fun lt!485327 () ListLongMap!14995)

(declare-fun lt!485320 () ListLongMap!14995)

(assert (=> b!1089039 (= lt!485327 lt!485320)))

(declare-fun lt!485322 () ListLongMap!14995)

(assert (=> b!1089039 (= lt!485320 (+!3310 lt!485322 lt!485321))))

(declare-fun lt!485323 () ListLongMap!14995)

(assert (=> b!1089039 (= lt!485332 (+!3310 lt!485323 lt!485321))))

(declare-fun zeroValue!831 () V!40723)

(assert (=> b!1089039 (= lt!485321 (tuple2!17027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089040 () Bool)

(assert (=> b!1089040 (= e!622033 (not e!622030))))

(declare-fun res!726401 () Bool)

(assert (=> b!1089040 (=> res!726401 e!622030)))

(assert (=> b!1089040 (= res!726401 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40723)

(declare-fun getCurrentListMap!4286 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40723 V!40723 (_ BitVec 32) Int) ListLongMap!14995)

(assert (=> b!1089040 (= lt!485327 (getCurrentListMap!4286 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485329 () array!70321)

(assert (=> b!1089040 (= lt!485332 (getCurrentListMap!4286 lt!485325 lt!485329 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089040 (and (= lt!485323 lt!485330) (= lt!485330 lt!485323))))

(declare-fun -!838 (ListLongMap!14995 (_ BitVec 64)) ListLongMap!14995)

(assert (=> b!1089040 (= lt!485330 (-!838 lt!485322 k0!904))))

(declare-datatypes ((Unit!35842 0))(
  ( (Unit!35843) )
))
(declare-fun lt!485331 () Unit!35842)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40723 V!40723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35842)

(assert (=> b!1089040 (= lt!485331 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!105 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4046 (array!70319 array!70321 (_ BitVec 32) (_ BitVec 32) V!40723 V!40723 (_ BitVec 32) Int) ListLongMap!14995)

(assert (=> b!1089040 (= lt!485323 (getCurrentListMapNoExtraKeys!4046 lt!485325 lt!485329 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2183 (Int (_ BitVec 64)) V!40723)

(assert (=> b!1089040 (= lt!485329 (array!70322 (store (arr!33834 _values!874) i!650 (ValueCellFull!12639 (dynLambda!2183 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34370 _values!874)))))

(assert (=> b!1089040 (= lt!485322 (getCurrentListMapNoExtraKeys!4046 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089040 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485328 () Unit!35842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70319 (_ BitVec 64) (_ BitVec 32)) Unit!35842)

(assert (=> b!1089040 (= lt!485328 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089041 () Bool)

(assert (=> b!1089041 (= e!622027 true)))

(assert (=> b!1089041 (= (-!838 lt!485320 k0!904) lt!485324)))

(declare-fun lt!485326 () Unit!35842)

(declare-fun addRemoveCommutativeForDiffKeys!66 (ListLongMap!14995 (_ BitVec 64) V!40723 (_ BitVec 64)) Unit!35842)

(assert (=> b!1089041 (= lt!485326 (addRemoveCommutativeForDiffKeys!66 lt!485322 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089042 () Bool)

(declare-fun res!726402 () Bool)

(assert (=> b!1089042 (=> (not res!726402) (not e!622029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089042 (= res!726402 (validKeyInArray!0 k0!904))))

(declare-fun b!1089043 () Bool)

(declare-fun res!726392 () Bool)

(assert (=> b!1089043 (=> (not res!726392) (not e!622033))))

(assert (=> b!1089043 (= res!726392 (arrayNoDuplicates!0 lt!485325 #b00000000000000000000000000000000 Nil!23611))))

(assert (= (and start!96042 res!726397) b!1089031))

(assert (= (and b!1089031 res!726395) b!1089034))

(assert (= (and b!1089034 res!726399) b!1089038))

(assert (= (and b!1089038 res!726396) b!1089033))

(assert (= (and b!1089033 res!726398) b!1089042))

(assert (= (and b!1089042 res!726402) b!1089032))

(assert (= (and b!1089032 res!726394) b!1089037))

(assert (= (and b!1089037 res!726400) b!1089043))

(assert (= (and b!1089043 res!726392) b!1089040))

(assert (= (and b!1089040 (not res!726401)) b!1089039))

(assert (= (and b!1089039 (not res!726393)) b!1089041))

(assert (= (and b!1089035 condMapEmpty!41800) mapIsEmpty!41800))

(assert (= (and b!1089035 (not condMapEmpty!41800)) mapNonEmpty!41800))

(get-info :version)

(assert (= (and mapNonEmpty!41800 ((_ is ValueCellFull!12639) mapValue!41800)) b!1089036))

(assert (= (and b!1089035 ((_ is ValueCellFull!12639) mapDefault!41800)) b!1089030))

(assert (= start!96042 b!1089035))

(declare-fun b_lambda!17365 () Bool)

(assert (=> (not b_lambda!17365) (not b!1089040)))

(declare-fun t!33366 () Bool)

(declare-fun tb!7573 () Bool)

(assert (=> (and start!96042 (= defaultEntry!882 defaultEntry!882) t!33366) tb!7573))

(declare-fun result!15665 () Bool)

(assert (=> tb!7573 (= result!15665 tp_is_empty!26697)))

(assert (=> b!1089040 t!33366))

(declare-fun b_and!36067 () Bool)

(assert (= b_and!36065 (and (=> t!33366 result!15665) b_and!36067)))

(declare-fun m!1008203 () Bool)

(assert (=> b!1089043 m!1008203))

(declare-fun m!1008205 () Bool)

(assert (=> b!1089041 m!1008205))

(declare-fun m!1008207 () Bool)

(assert (=> b!1089041 m!1008207))

(declare-fun m!1008209 () Bool)

(assert (=> b!1089040 m!1008209))

(declare-fun m!1008211 () Bool)

(assert (=> b!1089040 m!1008211))

(declare-fun m!1008213 () Bool)

(assert (=> b!1089040 m!1008213))

(declare-fun m!1008215 () Bool)

(assert (=> b!1089040 m!1008215))

(declare-fun m!1008217 () Bool)

(assert (=> b!1089040 m!1008217))

(declare-fun m!1008219 () Bool)

(assert (=> b!1089040 m!1008219))

(declare-fun m!1008221 () Bool)

(assert (=> b!1089040 m!1008221))

(declare-fun m!1008223 () Bool)

(assert (=> b!1089040 m!1008223))

(declare-fun m!1008225 () Bool)

(assert (=> b!1089040 m!1008225))

(declare-fun m!1008227 () Bool)

(assert (=> b!1089040 m!1008227))

(declare-fun m!1008229 () Bool)

(assert (=> b!1089037 m!1008229))

(declare-fun m!1008231 () Bool)

(assert (=> b!1089037 m!1008231))

(declare-fun m!1008233 () Bool)

(assert (=> b!1089032 m!1008233))

(declare-fun m!1008235 () Bool)

(assert (=> b!1089034 m!1008235))

(declare-fun m!1008237 () Bool)

(assert (=> b!1089039 m!1008237))

(declare-fun m!1008239 () Bool)

(assert (=> b!1089039 m!1008239))

(declare-fun m!1008241 () Bool)

(assert (=> b!1089039 m!1008241))

(declare-fun m!1008243 () Bool)

(assert (=> b!1089038 m!1008243))

(declare-fun m!1008245 () Bool)

(assert (=> start!96042 m!1008245))

(declare-fun m!1008247 () Bool)

(assert (=> start!96042 m!1008247))

(declare-fun m!1008249 () Bool)

(assert (=> start!96042 m!1008249))

(declare-fun m!1008251 () Bool)

(assert (=> b!1089042 m!1008251))

(declare-fun m!1008253 () Bool)

(assert (=> mapNonEmpty!41800 m!1008253))

(check-sat (not b!1089043) (not b!1089041) (not mapNonEmpty!41800) (not b_next!22695) tp_is_empty!26697 (not b!1089037) (not b!1089039) (not b!1089042) (not start!96042) (not b!1089034) (not b_lambda!17365) (not b!1089038) b_and!36067 (not b!1089040))
(check-sat b_and!36067 (not b_next!22695))
