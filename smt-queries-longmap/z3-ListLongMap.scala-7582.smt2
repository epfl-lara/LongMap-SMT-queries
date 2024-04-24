; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96048 () Bool)

(assert start!96048)

(declare-fun b_free!22465 () Bool)

(declare-fun b_next!22465 () Bool)

(assert (=> start!96048 (= b_free!22465 (not b_next!22465))))

(declare-fun tp!79244 () Bool)

(declare-fun b_and!35615 () Bool)

(assert (=> start!96048 (= tp!79244 b_and!35615)))

(declare-fun b!1085374 () Bool)

(declare-fun res!723197 () Bool)

(declare-fun e!620221 () Bool)

(assert (=> b!1085374 (=> (not res!723197) (not e!620221))))

(declare-datatypes ((array!69911 0))(
  ( (array!69912 (arr!33623 (Array (_ BitVec 32) (_ BitVec 64))) (size!34160 (_ BitVec 32))) )
))
(declare-fun lt!480959 () array!69911)

(declare-datatypes ((List!23445 0))(
  ( (Nil!23442) (Cons!23441 (h!24659 (_ BitVec 64)) (t!32960 List!23445)) )
))
(declare-fun arrayNoDuplicates!0 (array!69911 (_ BitVec 32) List!23445) Bool)

(assert (=> b!1085374 (= res!723197 (arrayNoDuplicates!0 lt!480959 #b00000000000000000000000000000000 Nil!23442))))

(declare-fun b!1085375 () Bool)

(declare-fun res!723202 () Bool)

(declare-fun e!620220 () Bool)

(assert (=> b!1085375 (=> (not res!723202) (not e!620220))))

(declare-fun _keys!1070 () array!69911)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69911 (_ BitVec 32)) Bool)

(assert (=> b!1085375 (= res!723202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085376 () Bool)

(declare-fun e!620218 () Bool)

(declare-fun tp_is_empty!26467 () Bool)

(assert (=> b!1085376 (= e!620218 tp_is_empty!26467)))

(declare-fun mapNonEmpty!41455 () Bool)

(declare-fun mapRes!41455 () Bool)

(declare-fun tp!79243 () Bool)

(assert (=> mapNonEmpty!41455 (= mapRes!41455 (and tp!79243 e!620218))))

(declare-datatypes ((V!40417 0))(
  ( (V!40418 (val!13290 Int)) )
))
(declare-datatypes ((ValueCell!12524 0))(
  ( (ValueCellFull!12524 (v!15907 V!40417)) (EmptyCell!12524) )
))
(declare-datatypes ((array!69913 0))(
  ( (array!69914 (arr!33624 (Array (_ BitVec 32) ValueCell!12524)) (size!34161 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69913)

(declare-fun mapKey!41455 () (_ BitVec 32))

(declare-fun mapRest!41455 () (Array (_ BitVec 32) ValueCell!12524))

(declare-fun mapValue!41455 () ValueCell!12524)

(assert (=> mapNonEmpty!41455 (= (arr!33624 _values!874) (store mapRest!41455 mapKey!41455 mapValue!41455))))

(declare-fun b!1085377 () Bool)

(declare-fun res!723201 () Bool)

(assert (=> b!1085377 (=> (not res!723201) (not e!620220))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085377 (= res!723201 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34160 _keys!1070))))))

(declare-fun b!1085378 () Bool)

(declare-fun res!723199 () Bool)

(assert (=> b!1085378 (=> (not res!723199) (not e!620220))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085378 (= res!723199 (validKeyInArray!0 k0!904))))

(declare-fun b!1085379 () Bool)

(declare-fun res!723196 () Bool)

(assert (=> b!1085379 (=> (not res!723196) (not e!620220))))

(assert (=> b!1085379 (= res!723196 (= (select (arr!33623 _keys!1070) i!650) k0!904))))

(declare-fun b!1085380 () Bool)

(declare-fun res!723203 () Bool)

(assert (=> b!1085380 (=> (not res!723203) (not e!620220))))

(assert (=> b!1085380 (= res!723203 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23442))))

(declare-fun res!723204 () Bool)

(assert (=> start!96048 (=> (not res!723204) (not e!620220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96048 (= res!723204 (validMask!0 mask!1414))))

(assert (=> start!96048 e!620220))

(assert (=> start!96048 tp!79244))

(assert (=> start!96048 true))

(assert (=> start!96048 tp_is_empty!26467))

(declare-fun array_inv!25994 (array!69911) Bool)

(assert (=> start!96048 (array_inv!25994 _keys!1070)))

(declare-fun e!620222 () Bool)

(declare-fun array_inv!25995 (array!69913) Bool)

(assert (=> start!96048 (and (array_inv!25995 _values!874) e!620222)))

(declare-fun b!1085381 () Bool)

(assert (=> b!1085381 (= e!620221 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40417)

(declare-datatypes ((tuple2!16848 0))(
  ( (tuple2!16849 (_1!8435 (_ BitVec 64)) (_2!8435 V!40417)) )
))
(declare-datatypes ((List!23446 0))(
  ( (Nil!23443) (Cons!23442 (h!24660 tuple2!16848) (t!32961 List!23446)) )
))
(declare-datatypes ((ListLongMap!14825 0))(
  ( (ListLongMap!14826 (toList!7428 List!23446)) )
))
(declare-fun lt!480957 () ListLongMap!14825)

(declare-fun zeroValue!831 () V!40417)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun lt!480956 () array!69913)

(declare-fun getCurrentListMap!4200 (array!69911 array!69913 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14825)

(assert (=> b!1085381 (= lt!480957 (getCurrentListMap!4200 lt!480959 lt!480956 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!480954 () ListLongMap!14825)

(declare-fun lt!480960 () ListLongMap!14825)

(assert (=> b!1085381 (and (= lt!480954 lt!480960) (= lt!480960 lt!480954))))

(declare-fun lt!480953 () ListLongMap!14825)

(declare-fun -!740 (ListLongMap!14825 (_ BitVec 64)) ListLongMap!14825)

(assert (=> b!1085381 (= lt!480960 (-!740 lt!480953 k0!904))))

(declare-datatypes ((Unit!35647 0))(
  ( (Unit!35648) )
))
(declare-fun lt!480958 () Unit!35647)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!29 (array!69911 array!69913 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35647)

(assert (=> b!1085381 (= lt!480958 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!29 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4005 (array!69911 array!69913 (_ BitVec 32) (_ BitVec 32) V!40417 V!40417 (_ BitVec 32) Int) ListLongMap!14825)

(assert (=> b!1085381 (= lt!480954 (getCurrentListMapNoExtraKeys!4005 lt!480959 lt!480956 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2126 (Int (_ BitVec 64)) V!40417)

(assert (=> b!1085381 (= lt!480956 (array!69914 (store (arr!33624 _values!874) i!650 (ValueCellFull!12524 (dynLambda!2126 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34161 _values!874)))))

(assert (=> b!1085381 (= lt!480953 (getCurrentListMapNoExtraKeys!4005 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085381 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!480955 () Unit!35647)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69911 (_ BitVec 64) (_ BitVec 32)) Unit!35647)

(assert (=> b!1085381 (= lt!480955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!41455 () Bool)

(assert (=> mapIsEmpty!41455 mapRes!41455))

(declare-fun b!1085382 () Bool)

(declare-fun res!723198 () Bool)

(assert (=> b!1085382 (=> (not res!723198) (not e!620220))))

(assert (=> b!1085382 (= res!723198 (and (= (size!34161 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34160 _keys!1070) (size!34161 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085383 () Bool)

(assert (=> b!1085383 (= e!620220 e!620221)))

(declare-fun res!723200 () Bool)

(assert (=> b!1085383 (=> (not res!723200) (not e!620221))))

(assert (=> b!1085383 (= res!723200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480959 mask!1414))))

(assert (=> b!1085383 (= lt!480959 (array!69912 (store (arr!33623 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34160 _keys!1070)))))

(declare-fun b!1085384 () Bool)

(declare-fun e!620217 () Bool)

(assert (=> b!1085384 (= e!620217 tp_is_empty!26467)))

(declare-fun b!1085385 () Bool)

(assert (=> b!1085385 (= e!620222 (and e!620217 mapRes!41455))))

(declare-fun condMapEmpty!41455 () Bool)

(declare-fun mapDefault!41455 () ValueCell!12524)

(assert (=> b!1085385 (= condMapEmpty!41455 (= (arr!33624 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12524)) mapDefault!41455)))))

(assert (= (and start!96048 res!723204) b!1085382))

(assert (= (and b!1085382 res!723198) b!1085375))

(assert (= (and b!1085375 res!723202) b!1085380))

(assert (= (and b!1085380 res!723203) b!1085377))

(assert (= (and b!1085377 res!723201) b!1085378))

(assert (= (and b!1085378 res!723199) b!1085379))

(assert (= (and b!1085379 res!723196) b!1085383))

(assert (= (and b!1085383 res!723200) b!1085374))

(assert (= (and b!1085374 res!723197) b!1085381))

(assert (= (and b!1085385 condMapEmpty!41455) mapIsEmpty!41455))

(assert (= (and b!1085385 (not condMapEmpty!41455)) mapNonEmpty!41455))

(get-info :version)

(assert (= (and mapNonEmpty!41455 ((_ is ValueCellFull!12524) mapValue!41455)) b!1085376))

(assert (= (and b!1085385 ((_ is ValueCellFull!12524) mapDefault!41455)) b!1085384))

(assert (= start!96048 b!1085385))

(declare-fun b_lambda!17145 () Bool)

(assert (=> (not b_lambda!17145) (not b!1085381)))

(declare-fun t!32959 () Bool)

(declare-fun tb!7335 () Bool)

(assert (=> (and start!96048 (= defaultEntry!882 defaultEntry!882) t!32959) tb!7335))

(declare-fun result!15197 () Bool)

(assert (=> tb!7335 (= result!15197 tp_is_empty!26467)))

(assert (=> b!1085381 t!32959))

(declare-fun b_and!35617 () Bool)

(assert (= b_and!35615 (and (=> t!32959 result!15197) b_and!35617)))

(declare-fun m!1003415 () Bool)

(assert (=> b!1085383 m!1003415))

(declare-fun m!1003417 () Bool)

(assert (=> b!1085383 m!1003417))

(declare-fun m!1003419 () Bool)

(assert (=> start!96048 m!1003419))

(declare-fun m!1003421 () Bool)

(assert (=> start!96048 m!1003421))

(declare-fun m!1003423 () Bool)

(assert (=> start!96048 m!1003423))

(declare-fun m!1003425 () Bool)

(assert (=> mapNonEmpty!41455 m!1003425))

(declare-fun m!1003427 () Bool)

(assert (=> b!1085379 m!1003427))

(declare-fun m!1003429 () Bool)

(assert (=> b!1085378 m!1003429))

(declare-fun m!1003431 () Bool)

(assert (=> b!1085380 m!1003431))

(declare-fun m!1003433 () Bool)

(assert (=> b!1085374 m!1003433))

(declare-fun m!1003435 () Bool)

(assert (=> b!1085375 m!1003435))

(declare-fun m!1003437 () Bool)

(assert (=> b!1085381 m!1003437))

(declare-fun m!1003439 () Bool)

(assert (=> b!1085381 m!1003439))

(declare-fun m!1003441 () Bool)

(assert (=> b!1085381 m!1003441))

(declare-fun m!1003443 () Bool)

(assert (=> b!1085381 m!1003443))

(declare-fun m!1003445 () Bool)

(assert (=> b!1085381 m!1003445))

(declare-fun m!1003447 () Bool)

(assert (=> b!1085381 m!1003447))

(declare-fun m!1003449 () Bool)

(assert (=> b!1085381 m!1003449))

(declare-fun m!1003451 () Bool)

(assert (=> b!1085381 m!1003451))

(declare-fun m!1003453 () Bool)

(assert (=> b!1085381 m!1003453))

(check-sat (not b!1085378) (not b!1085380) (not b!1085381) (not mapNonEmpty!41455) (not b_lambda!17145) (not b_next!22465) tp_is_empty!26467 (not b!1085375) b_and!35617 (not start!96048) (not b!1085383) (not b!1085374))
(check-sat b_and!35617 (not b_next!22465))
