; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95824 () Bool)

(assert start!95824)

(declare-fun b_free!22483 () Bool)

(declare-fun b_next!22483 () Bool)

(assert (=> start!95824 (= b_free!22483 (not b_next!22483))))

(declare-fun tp!79298 () Bool)

(declare-fun b_and!35615 () Bool)

(assert (=> start!95824 (= tp!79298 b_and!35615)))

(declare-fun b!1084236 () Bool)

(declare-fun e!619434 () Bool)

(declare-fun e!619436 () Bool)

(assert (=> b!1084236 (= e!619434 e!619436)))

(declare-fun res!722851 () Bool)

(assert (=> b!1084236 (=> (not res!722851) (not e!619436))))

(declare-datatypes ((array!69832 0))(
  ( (array!69833 (arr!33590 (Array (_ BitVec 32) (_ BitVec 64))) (size!34128 (_ BitVec 32))) )
))
(declare-fun lt!480458 () array!69832)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69832 (_ BitVec 32)) Bool)

(assert (=> b!1084236 (= res!722851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480458 mask!1414))))

(declare-fun _keys!1070 () array!69832)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084236 (= lt!480458 (array!69833 (store (arr!33590 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34128 _keys!1070)))))

(declare-fun b!1084237 () Bool)

(declare-fun res!722855 () Bool)

(assert (=> b!1084237 (=> (not res!722855) (not e!619434))))

(declare-datatypes ((List!23486 0))(
  ( (Nil!23483) (Cons!23482 (h!24691 (_ BitVec 64)) (t!33018 List!23486)) )
))
(declare-fun arrayNoDuplicates!0 (array!69832 (_ BitVec 32) List!23486) Bool)

(assert (=> b!1084237 (= res!722855 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23483))))

(declare-fun b!1084238 () Bool)

(declare-fun e!619431 () Bool)

(declare-fun tp_is_empty!26485 () Bool)

(assert (=> b!1084238 (= e!619431 tp_is_empty!26485)))

(declare-fun b!1084239 () Bool)

(declare-fun e!619435 () Bool)

(assert (=> b!1084239 (= e!619435 tp_is_empty!26485)))

(declare-fun mapNonEmpty!41482 () Bool)

(declare-fun mapRes!41482 () Bool)

(declare-fun tp!79297 () Bool)

(assert (=> mapNonEmpty!41482 (= mapRes!41482 (and tp!79297 e!619435))))

(declare-datatypes ((V!40441 0))(
  ( (V!40442 (val!13299 Int)) )
))
(declare-datatypes ((ValueCell!12533 0))(
  ( (ValueCellFull!12533 (v!15919 V!40441)) (EmptyCell!12533) )
))
(declare-datatypes ((array!69834 0))(
  ( (array!69835 (arr!33591 (Array (_ BitVec 32) ValueCell!12533)) (size!34129 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69834)

(declare-fun mapValue!41482 () ValueCell!12533)

(declare-fun mapRest!41482 () (Array (_ BitVec 32) ValueCell!12533))

(declare-fun mapKey!41482 () (_ BitVec 32))

(assert (=> mapNonEmpty!41482 (= (arr!33591 _values!874) (store mapRest!41482 mapKey!41482 mapValue!41482))))

(declare-fun b!1084240 () Bool)

(declare-fun res!722856 () Bool)

(assert (=> b!1084240 (=> (not res!722856) (not e!619434))))

(assert (=> b!1084240 (= res!722856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084242 () Bool)

(declare-fun e!619432 () Bool)

(assert (=> b!1084242 (= e!619432 (and e!619431 mapRes!41482))))

(declare-fun condMapEmpty!41482 () Bool)

(declare-fun mapDefault!41482 () ValueCell!12533)

(assert (=> b!1084242 (= condMapEmpty!41482 (= (arr!33591 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12533)) mapDefault!41482)))))

(declare-fun b!1084243 () Bool)

(declare-fun res!722852 () Bool)

(assert (=> b!1084243 (=> (not res!722852) (not e!619434))))

(assert (=> b!1084243 (= res!722852 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34128 _keys!1070))))))

(declare-fun b!1084244 () Bool)

(declare-fun res!722854 () Bool)

(assert (=> b!1084244 (=> (not res!722854) (not e!619434))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1084244 (= res!722854 (validKeyInArray!0 k0!904))))

(declare-fun mapIsEmpty!41482 () Bool)

(assert (=> mapIsEmpty!41482 mapRes!41482))

(declare-fun b!1084245 () Bool)

(assert (=> b!1084245 (= e!619436 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40441)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480459 () array!69834)

(declare-datatypes ((tuple2!16914 0))(
  ( (tuple2!16915 (_1!8468 (_ BitVec 64)) (_2!8468 V!40441)) )
))
(declare-datatypes ((List!23487 0))(
  ( (Nil!23484) (Cons!23483 (h!24692 tuple2!16914) (t!33019 List!23487)) )
))
(declare-datatypes ((ListLongMap!14883 0))(
  ( (ListLongMap!14884 (toList!7457 List!23487)) )
))
(declare-fun lt!480461 () ListLongMap!14883)

(declare-fun zeroValue!831 () V!40441)

(declare-fun getCurrentListMap!4150 (array!69832 array!69834 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1084245 (= lt!480461 (getCurrentListMap!4150 lt!480458 lt!480459 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480460 () ListLongMap!14883)

(declare-fun lt!480456 () ListLongMap!14883)

(assert (=> b!1084245 (and (= lt!480460 lt!480456) (= lt!480456 lt!480460))))

(declare-fun lt!480455 () ListLongMap!14883)

(declare-fun -!736 (ListLongMap!14883 (_ BitVec 64)) ListLongMap!14883)

(assert (=> b!1084245 (= lt!480456 (-!736 lt!480455 k0!904))))

(declare-datatypes ((Unit!35507 0))(
  ( (Unit!35508) )
))
(declare-fun lt!480454 () Unit!35507)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 (array!69832 array!69834 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35507)

(assert (=> b!1084245 (= lt!480454 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!34 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4020 (array!69832 array!69834 (_ BitVec 32) (_ BitVec 32) V!40441 V!40441 (_ BitVec 32) Int) ListLongMap!14883)

(assert (=> b!1084245 (= lt!480460 (getCurrentListMapNoExtraKeys!4020 lt!480458 lt!480459 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2091 (Int (_ BitVec 64)) V!40441)

(assert (=> b!1084245 (= lt!480459 (array!69835 (store (arr!33591 _values!874) i!650 (ValueCellFull!12533 (dynLambda!2091 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34129 _values!874)))))

(assert (=> b!1084245 (= lt!480455 (getCurrentListMapNoExtraKeys!4020 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1084245 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480457 () Unit!35507)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69832 (_ BitVec 64) (_ BitVec 32)) Unit!35507)

(assert (=> b!1084245 (= lt!480457 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1084246 () Bool)

(declare-fun res!722848 () Bool)

(assert (=> b!1084246 (=> (not res!722848) (not e!619436))))

(assert (=> b!1084246 (= res!722848 (arrayNoDuplicates!0 lt!480458 #b00000000000000000000000000000000 Nil!23483))))

(declare-fun b!1084247 () Bool)

(declare-fun res!722849 () Bool)

(assert (=> b!1084247 (=> (not res!722849) (not e!619434))))

(assert (=> b!1084247 (= res!722849 (= (select (arr!33590 _keys!1070) i!650) k0!904))))

(declare-fun b!1084241 () Bool)

(declare-fun res!722853 () Bool)

(assert (=> b!1084241 (=> (not res!722853) (not e!619434))))

(assert (=> b!1084241 (= res!722853 (and (= (size!34129 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34128 _keys!1070) (size!34129 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!722850 () Bool)

(assert (=> start!95824 (=> (not res!722850) (not e!619434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95824 (= res!722850 (validMask!0 mask!1414))))

(assert (=> start!95824 e!619434))

(assert (=> start!95824 tp!79298))

(assert (=> start!95824 true))

(assert (=> start!95824 tp_is_empty!26485))

(declare-fun array_inv!25964 (array!69832) Bool)

(assert (=> start!95824 (array_inv!25964 _keys!1070)))

(declare-fun array_inv!25965 (array!69834) Bool)

(assert (=> start!95824 (and (array_inv!25965 _values!874) e!619432)))

(assert (= (and start!95824 res!722850) b!1084241))

(assert (= (and b!1084241 res!722853) b!1084240))

(assert (= (and b!1084240 res!722856) b!1084237))

(assert (= (and b!1084237 res!722855) b!1084243))

(assert (= (and b!1084243 res!722852) b!1084244))

(assert (= (and b!1084244 res!722854) b!1084247))

(assert (= (and b!1084247 res!722849) b!1084236))

(assert (= (and b!1084236 res!722851) b!1084246))

(assert (= (and b!1084246 res!722848) b!1084245))

(assert (= (and b!1084242 condMapEmpty!41482) mapIsEmpty!41482))

(assert (= (and b!1084242 (not condMapEmpty!41482)) mapNonEmpty!41482))

(get-info :version)

(assert (= (and mapNonEmpty!41482 ((_ is ValueCellFull!12533) mapValue!41482)) b!1084239))

(assert (= (and b!1084242 ((_ is ValueCellFull!12533) mapDefault!41482)) b!1084238))

(assert (= start!95824 b!1084242))

(declare-fun b_lambda!17131 () Bool)

(assert (=> (not b_lambda!17131) (not b!1084245)))

(declare-fun t!33017 () Bool)

(declare-fun tb!7353 () Bool)

(assert (=> (and start!95824 (= defaultEntry!882 defaultEntry!882) t!33017) tb!7353))

(declare-fun result!15233 () Bool)

(assert (=> tb!7353 (= result!15233 tp_is_empty!26485)))

(assert (=> b!1084245 t!33017))

(declare-fun b_and!35617 () Bool)

(assert (= b_and!35615 (and (=> t!33017 result!15233) b_and!35617)))

(declare-fun m!1001477 () Bool)

(assert (=> b!1084236 m!1001477))

(declare-fun m!1001479 () Bool)

(assert (=> b!1084236 m!1001479))

(declare-fun m!1001481 () Bool)

(assert (=> b!1084247 m!1001481))

(declare-fun m!1001483 () Bool)

(assert (=> start!95824 m!1001483))

(declare-fun m!1001485 () Bool)

(assert (=> start!95824 m!1001485))

(declare-fun m!1001487 () Bool)

(assert (=> start!95824 m!1001487))

(declare-fun m!1001489 () Bool)

(assert (=> b!1084246 m!1001489))

(declare-fun m!1001491 () Bool)

(assert (=> b!1084240 m!1001491))

(declare-fun m!1001493 () Bool)

(assert (=> mapNonEmpty!41482 m!1001493))

(declare-fun m!1001495 () Bool)

(assert (=> b!1084244 m!1001495))

(declare-fun m!1001497 () Bool)

(assert (=> b!1084245 m!1001497))

(declare-fun m!1001499 () Bool)

(assert (=> b!1084245 m!1001499))

(declare-fun m!1001501 () Bool)

(assert (=> b!1084245 m!1001501))

(declare-fun m!1001503 () Bool)

(assert (=> b!1084245 m!1001503))

(declare-fun m!1001505 () Bool)

(assert (=> b!1084245 m!1001505))

(declare-fun m!1001507 () Bool)

(assert (=> b!1084245 m!1001507))

(declare-fun m!1001509 () Bool)

(assert (=> b!1084245 m!1001509))

(declare-fun m!1001511 () Bool)

(assert (=> b!1084245 m!1001511))

(declare-fun m!1001513 () Bool)

(assert (=> b!1084245 m!1001513))

(declare-fun m!1001515 () Bool)

(assert (=> b!1084237 m!1001515))

(check-sat (not b_lambda!17131) (not b!1084240) (not b!1084245) (not mapNonEmpty!41482) tp_is_empty!26485 (not start!95824) (not b!1084246) (not b!1084244) (not b_next!22483) b_and!35617 (not b!1084236) (not b!1084237))
(check-sat b_and!35617 (not b_next!22483))
