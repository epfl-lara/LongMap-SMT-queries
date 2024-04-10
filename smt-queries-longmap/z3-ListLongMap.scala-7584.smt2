; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95826 () Bool)

(assert start!95826)

(declare-fun b_free!22479 () Bool)

(declare-fun b_next!22479 () Bool)

(assert (=> start!95826 (= b_free!22479 (not b_next!22479))))

(declare-fun tp!79286 () Bool)

(declare-fun b_and!35633 () Bool)

(assert (=> start!95826 (= tp!79286 b_and!35633)))

(declare-fun b!1084313 () Bool)

(declare-fun e!619493 () Bool)

(declare-fun tp_is_empty!26481 () Bool)

(assert (=> b!1084313 (= e!619493 tp_is_empty!26481)))

(declare-fun mapNonEmpty!41476 () Bool)

(declare-fun mapRes!41476 () Bool)

(declare-fun tp!79285 () Bool)

(assert (=> mapNonEmpty!41476 (= mapRes!41476 (and tp!79285 e!619493))))

(declare-datatypes ((V!40435 0))(
  ( (V!40436 (val!13297 Int)) )
))
(declare-datatypes ((ValueCell!12531 0))(
  ( (ValueCellFull!12531 (v!15918 V!40435)) (EmptyCell!12531) )
))
(declare-datatypes ((array!69901 0))(
  ( (array!69902 (arr!33624 (Array (_ BitVec 32) ValueCell!12531)) (size!34160 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69901)

(declare-fun mapKey!41476 () (_ BitVec 32))

(declare-fun mapRest!41476 () (Array (_ BitVec 32) ValueCell!12531))

(declare-fun mapValue!41476 () ValueCell!12531)

(assert (=> mapNonEmpty!41476 (= (arr!33624 _values!874) (store mapRest!41476 mapKey!41476 mapValue!41476))))

(declare-fun b!1084314 () Bool)

(declare-fun e!619489 () Bool)

(assert (=> b!1084314 (= e!619489 tp_is_empty!26481)))

(declare-fun res!722871 () Bool)

(declare-fun e!619488 () Bool)

(assert (=> start!95826 (=> (not res!722871) (not e!619488))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95826 (= res!722871 (validMask!0 mask!1414))))

(assert (=> start!95826 e!619488))

(assert (=> start!95826 tp!79286))

(assert (=> start!95826 true))

(assert (=> start!95826 tp_is_empty!26481))

(declare-datatypes ((array!69903 0))(
  ( (array!69904 (arr!33625 (Array (_ BitVec 32) (_ BitVec 64))) (size!34161 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69903)

(declare-fun array_inv!25948 (array!69903) Bool)

(assert (=> start!95826 (array_inv!25948 _keys!1070)))

(declare-fun e!619490 () Bool)

(declare-fun array_inv!25949 (array!69901) Bool)

(assert (=> start!95826 (and (array_inv!25949 _values!874) e!619490)))

(declare-fun b!1084315 () Bool)

(declare-fun res!722867 () Bool)

(assert (=> b!1084315 (=> (not res!722867) (not e!619488))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084315 (= res!722867 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34161 _keys!1070))))))

(declare-fun b!1084316 () Bool)

(declare-fun e!619491 () Bool)

(assert (=> b!1084316 (= e!619491 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40435)

(declare-datatypes ((tuple2!16852 0))(
  ( (tuple2!16853 (_1!8437 (_ BitVec 64)) (_2!8437 V!40435)) )
))
(declare-datatypes ((List!23441 0))(
  ( (Nil!23438) (Cons!23437 (h!24646 tuple2!16852) (t!32978 List!23441)) )
))
(declare-datatypes ((ListLongMap!14821 0))(
  ( (ListLongMap!14822 (toList!7426 List!23441)) )
))
(declare-fun lt!480611 () ListLongMap!14821)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480607 () array!69903)

(declare-fun lt!480608 () array!69901)

(declare-fun zeroValue!831 () V!40435)

(declare-fun getCurrentListMap!4214 (array!69903 array!69901 (_ BitVec 32) (_ BitVec 32) V!40435 V!40435 (_ BitVec 32) Int) ListLongMap!14821)

(assert (=> b!1084316 (= lt!480611 (getCurrentListMap!4214 lt!480607 lt!480608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480610 () ListLongMap!14821)

(declare-fun lt!480613 () ListLongMap!14821)

(assert (=> b!1084316 (and (= lt!480610 lt!480613) (= lt!480613 lt!480610))))

(declare-fun lt!480612 () ListLongMap!14821)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!753 (ListLongMap!14821 (_ BitVec 64)) ListLongMap!14821)

(assert (=> b!1084316 (= lt!480613 (-!753 lt!480612 k0!904))))

(declare-datatypes ((Unit!35672 0))(
  ( (Unit!35673) )
))
(declare-fun lt!480606 () Unit!35672)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!33 (array!69903 array!69901 (_ BitVec 32) (_ BitVec 32) V!40435 V!40435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35672)

(assert (=> b!1084316 (= lt!480606 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!33 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3974 (array!69903 array!69901 (_ BitVec 32) (_ BitVec 32) V!40435 V!40435 (_ BitVec 32) Int) ListLongMap!14821)

(assert (=> b!1084316 (= lt!480610 (getCurrentListMapNoExtraKeys!3974 lt!480607 lt!480608 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2111 (Int (_ BitVec 64)) V!40435)

(assert (=> b!1084316 (= lt!480608 (array!69902 (store (arr!33624 _values!874) i!650 (ValueCellFull!12531 (dynLambda!2111 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34160 _values!874)))))

(assert (=> b!1084316 (= lt!480612 (getCurrentListMapNoExtraKeys!3974 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084316 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480609 () Unit!35672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69903 (_ BitVec 64) (_ BitVec 32)) Unit!35672)

(assert (=> b!1084316 (= lt!480609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084317 () Bool)

(declare-fun res!722869 () Bool)

(assert (=> b!1084317 (=> (not res!722869) (not e!619488))))

(assert (=> b!1084317 (= res!722869 (= (select (arr!33625 _keys!1070) i!650) k0!904))))

(declare-fun b!1084318 () Bool)

(declare-fun res!722863 () Bool)

(assert (=> b!1084318 (=> (not res!722863) (not e!619491))))

(declare-datatypes ((List!23442 0))(
  ( (Nil!23439) (Cons!23438 (h!24647 (_ BitVec 64)) (t!32979 List!23442)) )
))
(declare-fun arrayNoDuplicates!0 (array!69903 (_ BitVec 32) List!23442) Bool)

(assert (=> b!1084318 (= res!722863 (arrayNoDuplicates!0 lt!480607 #b00000000000000000000000000000000 Nil!23439))))

(declare-fun b!1084319 () Bool)

(assert (=> b!1084319 (= e!619488 e!619491)))

(declare-fun res!722865 () Bool)

(assert (=> b!1084319 (=> (not res!722865) (not e!619491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69903 (_ BitVec 32)) Bool)

(assert (=> b!1084319 (= res!722865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480607 mask!1414))))

(assert (=> b!1084319 (= lt!480607 (array!69904 (store (arr!33625 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34161 _keys!1070)))))

(declare-fun b!1084320 () Bool)

(declare-fun res!722864 () Bool)

(assert (=> b!1084320 (=> (not res!722864) (not e!619488))))

(assert (=> b!1084320 (= res!722864 (and (= (size!34160 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34161 _keys!1070) (size!34160 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1084321 () Bool)

(declare-fun res!722870 () Bool)

(assert (=> b!1084321 (=> (not res!722870) (not e!619488))))

(assert (=> b!1084321 (= res!722870 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23439))))

(declare-fun b!1084322 () Bool)

(declare-fun res!722866 () Bool)

(assert (=> b!1084322 (=> (not res!722866) (not e!619488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084322 (= res!722866 (validKeyInArray!0 k0!904))))

(declare-fun b!1084323 () Bool)

(assert (=> b!1084323 (= e!619490 (and e!619489 mapRes!41476))))

(declare-fun condMapEmpty!41476 () Bool)

(declare-fun mapDefault!41476 () ValueCell!12531)

(assert (=> b!1084323 (= condMapEmpty!41476 (= (arr!33624 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12531)) mapDefault!41476)))))

(declare-fun mapIsEmpty!41476 () Bool)

(assert (=> mapIsEmpty!41476 mapRes!41476))

(declare-fun b!1084324 () Bool)

(declare-fun res!722868 () Bool)

(assert (=> b!1084324 (=> (not res!722868) (not e!619488))))

(assert (=> b!1084324 (= res!722868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!95826 res!722871) b!1084320))

(assert (= (and b!1084320 res!722864) b!1084324))

(assert (= (and b!1084324 res!722868) b!1084321))

(assert (= (and b!1084321 res!722870) b!1084315))

(assert (= (and b!1084315 res!722867) b!1084322))

(assert (= (and b!1084322 res!722866) b!1084317))

(assert (= (and b!1084317 res!722869) b!1084319))

(assert (= (and b!1084319 res!722865) b!1084318))

(assert (= (and b!1084318 res!722863) b!1084316))

(assert (= (and b!1084323 condMapEmpty!41476) mapIsEmpty!41476))

(assert (= (and b!1084323 (not condMapEmpty!41476)) mapNonEmpty!41476))

(get-info :version)

(assert (= (and mapNonEmpty!41476 ((_ is ValueCellFull!12531) mapValue!41476)) b!1084313))

(assert (= (and b!1084323 ((_ is ValueCellFull!12531) mapDefault!41476)) b!1084314))

(assert (= start!95826 b!1084323))

(declare-fun b_lambda!17149 () Bool)

(assert (=> (not b_lambda!17149) (not b!1084316)))

(declare-fun t!32977 () Bool)

(declare-fun tb!7357 () Bool)

(assert (=> (and start!95826 (= defaultEntry!882 defaultEntry!882) t!32977) tb!7357))

(declare-fun result!15233 () Bool)

(assert (=> tb!7357 (= result!15233 tp_is_empty!26481)))

(assert (=> b!1084316 t!32977))

(declare-fun b_and!35635 () Bool)

(assert (= b_and!35633 (and (=> t!32977 result!15233) b_and!35635)))

(declare-fun m!1002023 () Bool)

(assert (=> b!1084324 m!1002023))

(declare-fun m!1002025 () Bool)

(assert (=> mapNonEmpty!41476 m!1002025))

(declare-fun m!1002027 () Bool)

(assert (=> b!1084318 m!1002027))

(declare-fun m!1002029 () Bool)

(assert (=> b!1084316 m!1002029))

(declare-fun m!1002031 () Bool)

(assert (=> b!1084316 m!1002031))

(declare-fun m!1002033 () Bool)

(assert (=> b!1084316 m!1002033))

(declare-fun m!1002035 () Bool)

(assert (=> b!1084316 m!1002035))

(declare-fun m!1002037 () Bool)

(assert (=> b!1084316 m!1002037))

(declare-fun m!1002039 () Bool)

(assert (=> b!1084316 m!1002039))

(declare-fun m!1002041 () Bool)

(assert (=> b!1084316 m!1002041))

(declare-fun m!1002043 () Bool)

(assert (=> b!1084316 m!1002043))

(declare-fun m!1002045 () Bool)

(assert (=> b!1084316 m!1002045))

(declare-fun m!1002047 () Bool)

(assert (=> b!1084322 m!1002047))

(declare-fun m!1002049 () Bool)

(assert (=> b!1084319 m!1002049))

(declare-fun m!1002051 () Bool)

(assert (=> b!1084319 m!1002051))

(declare-fun m!1002053 () Bool)

(assert (=> b!1084317 m!1002053))

(declare-fun m!1002055 () Bool)

(assert (=> b!1084321 m!1002055))

(declare-fun m!1002057 () Bool)

(assert (=> start!95826 m!1002057))

(declare-fun m!1002059 () Bool)

(assert (=> start!95826 m!1002059))

(declare-fun m!1002061 () Bool)

(assert (=> start!95826 m!1002061))

(check-sat (not b!1084322) (not b!1084324) (not b!1084318) (not start!95826) (not b!1084321) (not b_next!22479) b_and!35635 tp_is_empty!26481 (not b_lambda!17149) (not mapNonEmpty!41476) (not b!1084316) (not b!1084319))
(check-sat b_and!35635 (not b_next!22479))
