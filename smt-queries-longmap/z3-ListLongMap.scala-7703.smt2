; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96750 () Bool)

(assert start!96750)

(declare-fun b_free!23145 () Bool)

(declare-fun b_next!23145 () Bool)

(assert (=> start!96750 (= b_free!23145 (not b_next!23145))))

(declare-fun tp!81382 () Bool)

(declare-fun b_and!37051 () Bool)

(assert (=> start!96750 (= tp!81382 b_and!37051)))

(declare-fun res!734345 () Bool)

(declare-fun e!628121 () Bool)

(assert (=> start!96750 (=> (not res!734345) (not e!628121))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96750 (= res!734345 (validMask!0 mask!1414))))

(assert (=> start!96750 e!628121))

(assert (=> start!96750 tp!81382))

(assert (=> start!96750 true))

(declare-fun tp_is_empty!27195 () Bool)

(assert (=> start!96750 tp_is_empty!27195))

(declare-datatypes ((array!71309 0))(
  ( (array!71310 (arr!34319 (Array (_ BitVec 32) (_ BitVec 64))) (size!34855 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71309)

(declare-fun array_inv!26434 (array!71309) Bool)

(assert (=> start!96750 (array_inv!26434 _keys!1070)))

(declare-datatypes ((V!41387 0))(
  ( (V!41388 (val!13654 Int)) )
))
(declare-datatypes ((ValueCell!12888 0))(
  ( (ValueCellFull!12888 (v!16282 V!41387)) (EmptyCell!12888) )
))
(declare-datatypes ((array!71311 0))(
  ( (array!71312 (arr!34320 (Array (_ BitVec 32) ValueCell!12888)) (size!34856 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71311)

(declare-fun e!628115 () Bool)

(declare-fun array_inv!26435 (array!71311) Bool)

(assert (=> start!96750 (and (array_inv!26435 _values!874) e!628115)))

(declare-fun mapIsEmpty!42574 () Bool)

(declare-fun mapRes!42574 () Bool)

(assert (=> mapIsEmpty!42574 mapRes!42574))

(declare-fun b!1100470 () Bool)

(declare-fun res!734338 () Bool)

(assert (=> b!1100470 (=> (not res!734338) (not e!628121))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100470 (= res!734338 (and (= (size!34856 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34855 _keys!1070) (size!34856 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100471 () Bool)

(declare-fun res!734340 () Bool)

(assert (=> b!1100471 (=> (not res!734340) (not e!628121))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100471 (= res!734340 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34855 _keys!1070))))))

(declare-fun b!1100472 () Bool)

(declare-fun e!628118 () Bool)

(assert (=> b!1100472 (= e!628118 (bvslt i!650 (size!34856 _values!874)))))

(declare-datatypes ((tuple2!17360 0))(
  ( (tuple2!17361 (_1!8691 (_ BitVec 64)) (_2!8691 V!41387)) )
))
(declare-datatypes ((List!23975 0))(
  ( (Nil!23972) (Cons!23971 (h!25180 tuple2!17360) (t!34166 List!23975)) )
))
(declare-datatypes ((ListLongMap!15329 0))(
  ( (ListLongMap!15330 (toList!7680 List!23975)) )
))
(declare-fun lt!493095 () ListLongMap!15329)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun lt!493087 () ListLongMap!15329)

(declare-fun -!966 (ListLongMap!15329 (_ BitVec 64)) ListLongMap!15329)

(assert (=> b!1100472 (= (-!966 lt!493095 k0!904) lt!493087)))

(declare-fun lt!493090 () ListLongMap!15329)

(declare-datatypes ((Unit!36178 0))(
  ( (Unit!36179) )
))
(declare-fun lt!493091 () Unit!36178)

(declare-fun zeroValue!831 () V!41387)

(declare-fun addRemoveCommutativeForDiffKeys!129 (ListLongMap!15329 (_ BitVec 64) V!41387 (_ BitVec 64)) Unit!36178)

(assert (=> b!1100472 (= lt!493091 (addRemoveCommutativeForDiffKeys!129 lt!493090 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1100473 () Bool)

(declare-fun e!628120 () Bool)

(assert (=> b!1100473 (= e!628120 e!628118)))

(declare-fun res!734339 () Bool)

(assert (=> b!1100473 (=> res!734339 e!628118)))

(assert (=> b!1100473 (= res!734339 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!493084 () ListLongMap!15329)

(assert (=> b!1100473 (= lt!493084 lt!493087)))

(declare-fun lt!493088 () ListLongMap!15329)

(declare-fun lt!493092 () tuple2!17360)

(declare-fun +!3385 (ListLongMap!15329 tuple2!17360) ListLongMap!15329)

(assert (=> b!1100473 (= lt!493087 (+!3385 lt!493088 lt!493092))))

(declare-fun lt!493086 () ListLongMap!15329)

(assert (=> b!1100473 (= lt!493086 lt!493095)))

(assert (=> b!1100473 (= lt!493095 (+!3385 lt!493090 lt!493092))))

(declare-fun lt!493085 () ListLongMap!15329)

(assert (=> b!1100473 (= lt!493084 (+!3385 lt!493085 lt!493092))))

(assert (=> b!1100473 (= lt!493092 (tuple2!17361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100474 () Bool)

(declare-fun res!734341 () Bool)

(assert (=> b!1100474 (=> (not res!734341) (not e!628121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100474 (= res!734341 (validKeyInArray!0 k0!904))))

(declare-fun b!1100475 () Bool)

(declare-fun e!628119 () Bool)

(assert (=> b!1100475 (= e!628119 (not e!628120))))

(declare-fun res!734335 () Bool)

(assert (=> b!1100475 (=> res!734335 e!628120)))

(assert (=> b!1100475 (= res!734335 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41387)

(declare-fun getCurrentListMap!4390 (array!71309 array!71311 (_ BitVec 32) (_ BitVec 32) V!41387 V!41387 (_ BitVec 32) Int) ListLongMap!15329)

(assert (=> b!1100475 (= lt!493086 (getCurrentListMap!4390 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493083 () array!71309)

(declare-fun lt!493093 () array!71311)

(assert (=> b!1100475 (= lt!493084 (getCurrentListMap!4390 lt!493083 lt!493093 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1100475 (and (= lt!493085 lt!493088) (= lt!493088 lt!493085))))

(assert (=> b!1100475 (= lt!493088 (-!966 lt!493090 k0!904))))

(declare-fun lt!493094 () Unit!36178)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!216 (array!71309 array!71311 (_ BitVec 32) (_ BitVec 32) V!41387 V!41387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36178)

(assert (=> b!1100475 (= lt!493094 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!216 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4186 (array!71309 array!71311 (_ BitVec 32) (_ BitVec 32) V!41387 V!41387 (_ BitVec 32) Int) ListLongMap!15329)

(assert (=> b!1100475 (= lt!493085 (getCurrentListMapNoExtraKeys!4186 lt!493083 lt!493093 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2321 (Int (_ BitVec 64)) V!41387)

(assert (=> b!1100475 (= lt!493093 (array!71312 (store (arr!34320 _values!874) i!650 (ValueCellFull!12888 (dynLambda!2321 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34856 _values!874)))))

(assert (=> b!1100475 (= lt!493090 (getCurrentListMapNoExtraKeys!4186 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100475 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493089 () Unit!36178)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71309 (_ BitVec 64) (_ BitVec 32)) Unit!36178)

(assert (=> b!1100475 (= lt!493089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100476 () Bool)

(assert (=> b!1100476 (= e!628121 e!628119)))

(declare-fun res!734336 () Bool)

(assert (=> b!1100476 (=> (not res!734336) (not e!628119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71309 (_ BitVec 32)) Bool)

(assert (=> b!1100476 (= res!734336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493083 mask!1414))))

(assert (=> b!1100476 (= lt!493083 (array!71310 (store (arr!34319 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34855 _keys!1070)))))

(declare-fun b!1100477 () Bool)

(declare-fun res!734342 () Bool)

(assert (=> b!1100477 (=> (not res!734342) (not e!628121))))

(assert (=> b!1100477 (= res!734342 (= (select (arr!34319 _keys!1070) i!650) k0!904))))

(declare-fun b!1100478 () Bool)

(declare-fun res!734344 () Bool)

(assert (=> b!1100478 (=> (not res!734344) (not e!628121))))

(declare-datatypes ((List!23976 0))(
  ( (Nil!23973) (Cons!23972 (h!25181 (_ BitVec 64)) (t!34167 List!23976)) )
))
(declare-fun arrayNoDuplicates!0 (array!71309 (_ BitVec 32) List!23976) Bool)

(assert (=> b!1100478 (= res!734344 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23973))))

(declare-fun b!1100479 () Bool)

(declare-fun e!628122 () Bool)

(assert (=> b!1100479 (= e!628122 tp_is_empty!27195)))

(declare-fun mapNonEmpty!42574 () Bool)

(declare-fun tp!81383 () Bool)

(assert (=> mapNonEmpty!42574 (= mapRes!42574 (and tp!81383 e!628122))))

(declare-fun mapRest!42574 () (Array (_ BitVec 32) ValueCell!12888))

(declare-fun mapKey!42574 () (_ BitVec 32))

(declare-fun mapValue!42574 () ValueCell!12888)

(assert (=> mapNonEmpty!42574 (= (arr!34320 _values!874) (store mapRest!42574 mapKey!42574 mapValue!42574))))

(declare-fun b!1100480 () Bool)

(declare-fun e!628116 () Bool)

(assert (=> b!1100480 (= e!628115 (and e!628116 mapRes!42574))))

(declare-fun condMapEmpty!42574 () Bool)

(declare-fun mapDefault!42574 () ValueCell!12888)

(assert (=> b!1100480 (= condMapEmpty!42574 (= (arr!34320 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12888)) mapDefault!42574)))))

(declare-fun b!1100481 () Bool)

(assert (=> b!1100481 (= e!628116 tp_is_empty!27195)))

(declare-fun b!1100482 () Bool)

(declare-fun res!734337 () Bool)

(assert (=> b!1100482 (=> (not res!734337) (not e!628119))))

(assert (=> b!1100482 (= res!734337 (arrayNoDuplicates!0 lt!493083 #b00000000000000000000000000000000 Nil!23973))))

(declare-fun b!1100483 () Bool)

(declare-fun res!734343 () Bool)

(assert (=> b!1100483 (=> (not res!734343) (not e!628121))))

(assert (=> b!1100483 (= res!734343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(assert (= (and start!96750 res!734345) b!1100470))

(assert (= (and b!1100470 res!734338) b!1100483))

(assert (= (and b!1100483 res!734343) b!1100478))

(assert (= (and b!1100478 res!734344) b!1100471))

(assert (= (and b!1100471 res!734340) b!1100474))

(assert (= (and b!1100474 res!734341) b!1100477))

(assert (= (and b!1100477 res!734342) b!1100476))

(assert (= (and b!1100476 res!734336) b!1100482))

(assert (= (and b!1100482 res!734337) b!1100475))

(assert (= (and b!1100475 (not res!734335)) b!1100473))

(assert (= (and b!1100473 (not res!734339)) b!1100472))

(assert (= (and b!1100480 condMapEmpty!42574) mapIsEmpty!42574))

(assert (= (and b!1100480 (not condMapEmpty!42574)) mapNonEmpty!42574))

(get-info :version)

(assert (= (and mapNonEmpty!42574 ((_ is ValueCellFull!12888) mapValue!42574)) b!1100479))

(assert (= (and b!1100480 ((_ is ValueCellFull!12888) mapDefault!42574)) b!1100481))

(assert (= start!96750 b!1100480))

(declare-fun b_lambda!18013 () Bool)

(assert (=> (not b_lambda!18013) (not b!1100475)))

(declare-fun t!34165 () Bool)

(declare-fun tb!8011 () Bool)

(assert (=> (and start!96750 (= defaultEntry!882 defaultEntry!882) t!34165) tb!8011))

(declare-fun result!16559 () Bool)

(assert (=> tb!8011 (= result!16559 tp_is_empty!27195)))

(assert (=> b!1100475 t!34165))

(declare-fun b_and!37053 () Bool)

(assert (= b_and!37051 (and (=> t!34165 result!16559) b_and!37053)))

(declare-fun m!1020545 () Bool)

(assert (=> b!1100482 m!1020545))

(declare-fun m!1020547 () Bool)

(assert (=> b!1100474 m!1020547))

(declare-fun m!1020549 () Bool)

(assert (=> b!1100475 m!1020549))

(declare-fun m!1020551 () Bool)

(assert (=> b!1100475 m!1020551))

(declare-fun m!1020553 () Bool)

(assert (=> b!1100475 m!1020553))

(declare-fun m!1020555 () Bool)

(assert (=> b!1100475 m!1020555))

(declare-fun m!1020557 () Bool)

(assert (=> b!1100475 m!1020557))

(declare-fun m!1020559 () Bool)

(assert (=> b!1100475 m!1020559))

(declare-fun m!1020561 () Bool)

(assert (=> b!1100475 m!1020561))

(declare-fun m!1020563 () Bool)

(assert (=> b!1100475 m!1020563))

(declare-fun m!1020565 () Bool)

(assert (=> b!1100475 m!1020565))

(declare-fun m!1020567 () Bool)

(assert (=> b!1100475 m!1020567))

(declare-fun m!1020569 () Bool)

(assert (=> start!96750 m!1020569))

(declare-fun m!1020571 () Bool)

(assert (=> start!96750 m!1020571))

(declare-fun m!1020573 () Bool)

(assert (=> start!96750 m!1020573))

(declare-fun m!1020575 () Bool)

(assert (=> b!1100483 m!1020575))

(declare-fun m!1020577 () Bool)

(assert (=> b!1100473 m!1020577))

(declare-fun m!1020579 () Bool)

(assert (=> b!1100473 m!1020579))

(declare-fun m!1020581 () Bool)

(assert (=> b!1100473 m!1020581))

(declare-fun m!1020583 () Bool)

(assert (=> b!1100476 m!1020583))

(declare-fun m!1020585 () Bool)

(assert (=> b!1100476 m!1020585))

(declare-fun m!1020587 () Bool)

(assert (=> b!1100477 m!1020587))

(declare-fun m!1020589 () Bool)

(assert (=> b!1100472 m!1020589))

(declare-fun m!1020591 () Bool)

(assert (=> b!1100472 m!1020591))

(declare-fun m!1020593 () Bool)

(assert (=> mapNonEmpty!42574 m!1020593))

(declare-fun m!1020595 () Bool)

(assert (=> b!1100478 m!1020595))

(check-sat (not b!1100473) (not start!96750) b_and!37053 tp_is_empty!27195 (not b!1100474) (not b!1100475) (not b!1100472) (not b!1100478) (not b!1100482) (not b_next!23145) (not b!1100483) (not b_lambda!18013) (not mapNonEmpty!42574) (not b!1100476))
(check-sat b_and!37053 (not b_next!23145))
