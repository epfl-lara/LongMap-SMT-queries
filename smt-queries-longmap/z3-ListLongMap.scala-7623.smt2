; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96052 () Bool)

(assert start!96052)

(declare-fun b_free!22711 () Bool)

(declare-fun b_next!22711 () Bool)

(assert (=> start!96052 (= b_free!22711 (not b_next!22711))))

(declare-fun tp!79981 () Bool)

(declare-fun b_and!36071 () Bool)

(assert (=> start!96052 (= tp!79981 b_and!36071)))

(declare-fun b!1089229 () Bool)

(declare-fun e!622133 () Bool)

(declare-fun e!622126 () Bool)

(assert (=> b!1089229 (= e!622133 e!622126)))

(declare-fun res!726588 () Bool)

(assert (=> b!1089229 (=> res!726588 e!622126)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1089229 (= res!726588 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40745 0))(
  ( (V!40746 (val!13413 Int)) )
))
(declare-datatypes ((tuple2!17092 0))(
  ( (tuple2!17093 (_1!8557 (_ BitVec 64)) (_2!8557 V!40745)) )
))
(declare-datatypes ((List!23661 0))(
  ( (Nil!23658) (Cons!23657 (h!24866 tuple2!17092) (t!33421 List!23661)) )
))
(declare-datatypes ((ListLongMap!15061 0))(
  ( (ListLongMap!15062 (toList!7546 List!23661)) )
))
(declare-fun lt!485438 () ListLongMap!15061)

(declare-fun lt!485437 () ListLongMap!15061)

(assert (=> b!1089229 (= lt!485438 lt!485437)))

(declare-fun lt!485442 () ListLongMap!15061)

(declare-fun lt!485435 () tuple2!17092)

(declare-fun +!3346 (ListLongMap!15061 tuple2!17092) ListLongMap!15061)

(assert (=> b!1089229 (= lt!485437 (+!3346 lt!485442 lt!485435))))

(declare-fun lt!485439 () ListLongMap!15061)

(declare-fun lt!485436 () ListLongMap!15061)

(assert (=> b!1089229 (= lt!485439 lt!485436)))

(declare-fun lt!485434 () ListLongMap!15061)

(assert (=> b!1089229 (= lt!485436 (+!3346 lt!485434 lt!485435))))

(declare-fun lt!485443 () ListLongMap!15061)

(assert (=> b!1089229 (= lt!485438 (+!3346 lt!485443 lt!485435))))

(declare-fun zeroValue!831 () V!40745)

(assert (=> b!1089229 (= lt!485435 (tuple2!17093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089230 () Bool)

(declare-fun e!622132 () Bool)

(declare-fun tp_is_empty!26713 () Bool)

(assert (=> b!1089230 (= e!622132 tp_is_empty!26713)))

(declare-fun b!1089231 () Bool)

(declare-fun e!622128 () Bool)

(declare-fun mapRes!41824 () Bool)

(assert (=> b!1089231 (= e!622128 (and e!622132 mapRes!41824))))

(declare-fun condMapEmpty!41824 () Bool)

(declare-datatypes ((ValueCell!12647 0))(
  ( (ValueCellFull!12647 (v!16033 V!40745)) (EmptyCell!12647) )
))
(declare-datatypes ((array!70272 0))(
  ( (array!70273 (arr!33810 (Array (_ BitVec 32) ValueCell!12647)) (size!34348 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70272)

(declare-fun mapDefault!41824 () ValueCell!12647)

(assert (=> b!1089231 (= condMapEmpty!41824 (= (arr!33810 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12647)) mapDefault!41824)))))

(declare-fun b!1089232 () Bool)

(declare-fun res!726590 () Bool)

(declare-fun e!622129 () Bool)

(assert (=> b!1089232 (=> (not res!726590) (not e!622129))))

(declare-datatypes ((array!70274 0))(
  ( (array!70275 (arr!33811 (Array (_ BitVec 32) (_ BitVec 64))) (size!34349 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70274)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089232 (= res!726590 (= (select (arr!33811 _keys!1070) i!650) k0!904))))

(declare-fun b!1089233 () Bool)

(declare-fun res!726587 () Bool)

(assert (=> b!1089233 (=> (not res!726587) (not e!622129))))

(assert (=> b!1089233 (= res!726587 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34349 _keys!1070))))))

(declare-fun b!1089234 () Bool)

(declare-fun res!726593 () Bool)

(assert (=> b!1089234 (=> (not res!726593) (not e!622129))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70274 (_ BitVec 32)) Bool)

(assert (=> b!1089234 (= res!726593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089235 () Bool)

(declare-fun res!726594 () Bool)

(declare-fun e!622130 () Bool)

(assert (=> b!1089235 (=> (not res!726594) (not e!622130))))

(declare-fun lt!485441 () array!70274)

(declare-datatypes ((List!23662 0))(
  ( (Nil!23659) (Cons!23658 (h!24867 (_ BitVec 64)) (t!33422 List!23662)) )
))
(declare-fun arrayNoDuplicates!0 (array!70274 (_ BitVec 32) List!23662) Bool)

(assert (=> b!1089235 (= res!726594 (arrayNoDuplicates!0 lt!485441 #b00000000000000000000000000000000 Nil!23659))))

(declare-fun res!726589 () Bool)

(assert (=> start!96052 (=> (not res!726589) (not e!622129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96052 (= res!726589 (validMask!0 mask!1414))))

(assert (=> start!96052 e!622129))

(assert (=> start!96052 tp!79981))

(assert (=> start!96052 true))

(assert (=> start!96052 tp_is_empty!26713))

(declare-fun array_inv!26116 (array!70274) Bool)

(assert (=> start!96052 (array_inv!26116 _keys!1070)))

(declare-fun array_inv!26117 (array!70272) Bool)

(assert (=> start!96052 (and (array_inv!26117 _values!874) e!622128)))

(declare-fun b!1089236 () Bool)

(declare-fun e!622131 () Bool)

(assert (=> b!1089236 (= e!622131 tp_is_empty!26713)))

(declare-fun b!1089237 () Bool)

(assert (=> b!1089237 (= e!622130 (not e!622133))))

(declare-fun res!726596 () Bool)

(assert (=> b!1089237 (=> res!726596 e!622133)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089237 (= res!726596 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40745)

(declare-fun getCurrentListMap!4223 (array!70274 array!70272 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) Int) ListLongMap!15061)

(assert (=> b!1089237 (= lt!485439 (getCurrentListMap!4223 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!485433 () array!70272)

(assert (=> b!1089237 (= lt!485438 (getCurrentListMap!4223 lt!485441 lt!485433 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089237 (and (= lt!485443 lt!485442) (= lt!485442 lt!485443))))

(declare-fun -!822 (ListLongMap!15061 (_ BitVec 64)) ListLongMap!15061)

(assert (=> b!1089237 (= lt!485442 (-!822 lt!485434 k0!904))))

(declare-datatypes ((Unit!35679 0))(
  ( (Unit!35680) )
))
(declare-fun lt!485440 () Unit!35679)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 (array!70274 array!70272 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35679)

(assert (=> b!1089237 (= lt!485440 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!107 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4093 (array!70274 array!70272 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) Int) ListLongMap!15061)

(assert (=> b!1089237 (= lt!485443 (getCurrentListMapNoExtraKeys!4093 lt!485441 lt!485433 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2164 (Int (_ BitVec 64)) V!40745)

(assert (=> b!1089237 (= lt!485433 (array!70273 (store (arr!33810 _values!874) i!650 (ValueCellFull!12647 (dynLambda!2164 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34348 _values!874)))))

(assert (=> b!1089237 (= lt!485434 (getCurrentListMapNoExtraKeys!4093 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089237 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!485432 () Unit!35679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70274 (_ BitVec 64) (_ BitVec 32)) Unit!35679)

(assert (=> b!1089237 (= lt!485432 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089238 () Bool)

(assert (=> b!1089238 (= e!622126 true)))

(assert (=> b!1089238 (= (-!822 lt!485436 k0!904) lt!485437)))

(declare-fun lt!485444 () Unit!35679)

(declare-fun addRemoveCommutativeForDiffKeys!72 (ListLongMap!15061 (_ BitVec 64) V!40745 (_ BitVec 64)) Unit!35679)

(assert (=> b!1089238 (= lt!485444 (addRemoveCommutativeForDiffKeys!72 lt!485434 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089239 () Bool)

(declare-fun res!726597 () Bool)

(assert (=> b!1089239 (=> (not res!726597) (not e!622129))))

(assert (=> b!1089239 (= res!726597 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23659))))

(declare-fun mapNonEmpty!41824 () Bool)

(declare-fun tp!79982 () Bool)

(assert (=> mapNonEmpty!41824 (= mapRes!41824 (and tp!79982 e!622131))))

(declare-fun mapValue!41824 () ValueCell!12647)

(declare-fun mapKey!41824 () (_ BitVec 32))

(declare-fun mapRest!41824 () (Array (_ BitVec 32) ValueCell!12647))

(assert (=> mapNonEmpty!41824 (= (arr!33810 _values!874) (store mapRest!41824 mapKey!41824 mapValue!41824))))

(declare-fun b!1089240 () Bool)

(declare-fun res!726591 () Bool)

(assert (=> b!1089240 (=> (not res!726591) (not e!622129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089240 (= res!726591 (validKeyInArray!0 k0!904))))

(declare-fun b!1089241 () Bool)

(assert (=> b!1089241 (= e!622129 e!622130)))

(declare-fun res!726592 () Bool)

(assert (=> b!1089241 (=> (not res!726592) (not e!622130))))

(assert (=> b!1089241 (= res!726592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485441 mask!1414))))

(assert (=> b!1089241 (= lt!485441 (array!70275 (store (arr!33811 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34349 _keys!1070)))))

(declare-fun mapIsEmpty!41824 () Bool)

(assert (=> mapIsEmpty!41824 mapRes!41824))

(declare-fun b!1089242 () Bool)

(declare-fun res!726595 () Bool)

(assert (=> b!1089242 (=> (not res!726595) (not e!622129))))

(assert (=> b!1089242 (= res!726595 (and (= (size!34348 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34349 _keys!1070) (size!34348 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96052 res!726589) b!1089242))

(assert (= (and b!1089242 res!726595) b!1089234))

(assert (= (and b!1089234 res!726593) b!1089239))

(assert (= (and b!1089239 res!726597) b!1089233))

(assert (= (and b!1089233 res!726587) b!1089240))

(assert (= (and b!1089240 res!726591) b!1089232))

(assert (= (and b!1089232 res!726590) b!1089241))

(assert (= (and b!1089241 res!726592) b!1089235))

(assert (= (and b!1089235 res!726594) b!1089237))

(assert (= (and b!1089237 (not res!726596)) b!1089229))

(assert (= (and b!1089229 (not res!726588)) b!1089238))

(assert (= (and b!1089231 condMapEmpty!41824) mapIsEmpty!41824))

(assert (= (and b!1089231 (not condMapEmpty!41824)) mapNonEmpty!41824))

(get-info :version)

(assert (= (and mapNonEmpty!41824 ((_ is ValueCellFull!12647) mapValue!41824)) b!1089236))

(assert (= (and b!1089231 ((_ is ValueCellFull!12647) mapDefault!41824)) b!1089230))

(assert (= start!96052 b!1089231))

(declare-fun b_lambda!17359 () Bool)

(assert (=> (not b_lambda!17359) (not b!1089237)))

(declare-fun t!33420 () Bool)

(declare-fun tb!7581 () Bool)

(assert (=> (and start!96052 (= defaultEntry!882 defaultEntry!882) t!33420) tb!7581))

(declare-fun result!15689 () Bool)

(assert (=> tb!7581 (= result!15689 tp_is_empty!26713)))

(assert (=> b!1089237 t!33420))

(declare-fun b_and!36073 () Bool)

(assert (= b_and!36071 (and (=> t!33420 result!15689) b_and!36073)))

(declare-fun m!1007993 () Bool)

(assert (=> start!96052 m!1007993))

(declare-fun m!1007995 () Bool)

(assert (=> start!96052 m!1007995))

(declare-fun m!1007997 () Bool)

(assert (=> start!96052 m!1007997))

(declare-fun m!1007999 () Bool)

(assert (=> b!1089235 m!1007999))

(declare-fun m!1008001 () Bool)

(assert (=> b!1089238 m!1008001))

(declare-fun m!1008003 () Bool)

(assert (=> b!1089238 m!1008003))

(declare-fun m!1008005 () Bool)

(assert (=> b!1089239 m!1008005))

(declare-fun m!1008007 () Bool)

(assert (=> b!1089241 m!1008007))

(declare-fun m!1008009 () Bool)

(assert (=> b!1089241 m!1008009))

(declare-fun m!1008011 () Bool)

(assert (=> mapNonEmpty!41824 m!1008011))

(declare-fun m!1008013 () Bool)

(assert (=> b!1089229 m!1008013))

(declare-fun m!1008015 () Bool)

(assert (=> b!1089229 m!1008015))

(declare-fun m!1008017 () Bool)

(assert (=> b!1089229 m!1008017))

(declare-fun m!1008019 () Bool)

(assert (=> b!1089232 m!1008019))

(declare-fun m!1008021 () Bool)

(assert (=> b!1089234 m!1008021))

(declare-fun m!1008023 () Bool)

(assert (=> b!1089237 m!1008023))

(declare-fun m!1008025 () Bool)

(assert (=> b!1089237 m!1008025))

(declare-fun m!1008027 () Bool)

(assert (=> b!1089237 m!1008027))

(declare-fun m!1008029 () Bool)

(assert (=> b!1089237 m!1008029))

(declare-fun m!1008031 () Bool)

(assert (=> b!1089237 m!1008031))

(declare-fun m!1008033 () Bool)

(assert (=> b!1089237 m!1008033))

(declare-fun m!1008035 () Bool)

(assert (=> b!1089237 m!1008035))

(declare-fun m!1008037 () Bool)

(assert (=> b!1089237 m!1008037))

(declare-fun m!1008039 () Bool)

(assert (=> b!1089237 m!1008039))

(declare-fun m!1008041 () Bool)

(assert (=> b!1089237 m!1008041))

(declare-fun m!1008043 () Bool)

(assert (=> b!1089240 m!1008043))

(check-sat b_and!36073 (not b_lambda!17359) (not b_next!22711) (not b!1089240) (not b!1089234) tp_is_empty!26713 (not b!1089235) (not mapNonEmpty!41824) (not start!96052) (not b!1089237) (not b!1089241) (not b!1089238) (not b!1089229) (not b!1089239))
(check-sat b_and!36073 (not b_next!22711))
