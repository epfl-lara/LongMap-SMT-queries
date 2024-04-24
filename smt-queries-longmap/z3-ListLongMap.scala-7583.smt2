; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96054 () Bool)

(assert start!96054)

(declare-fun b_free!22471 () Bool)

(declare-fun b_next!22471 () Bool)

(assert (=> start!96054 (= b_free!22471 (not b_next!22471))))

(declare-fun tp!79262 () Bool)

(declare-fun b_and!35627 () Bool)

(assert (=> start!96054 (= tp!79262 b_and!35627)))

(declare-fun b!1085488 () Bool)

(declare-fun e!620271 () Bool)

(assert (=> b!1085488 (= e!620271 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40425 0))(
  ( (V!40426 (val!13293 Int)) )
))
(declare-fun minValue!831 () V!40425)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69923 0))(
  ( (array!69924 (arr!33629 (Array (_ BitVec 32) (_ BitVec 64))) (size!34166 (_ BitVec 32))) )
))
(declare-fun lt!481032 () array!69923)

(declare-fun zeroValue!831 () V!40425)

(declare-datatypes ((tuple2!16852 0))(
  ( (tuple2!16853 (_1!8437 (_ BitVec 64)) (_2!8437 V!40425)) )
))
(declare-datatypes ((List!23450 0))(
  ( (Nil!23447) (Cons!23446 (h!24664 tuple2!16852) (t!32971 List!23450)) )
))
(declare-datatypes ((ListLongMap!14829 0))(
  ( (ListLongMap!14830 (toList!7430 List!23450)) )
))
(declare-fun lt!481028 () ListLongMap!14829)

(declare-datatypes ((ValueCell!12527 0))(
  ( (ValueCellFull!12527 (v!15910 V!40425)) (EmptyCell!12527) )
))
(declare-datatypes ((array!69925 0))(
  ( (array!69926 (arr!33630 (Array (_ BitVec 32) ValueCell!12527)) (size!34167 (_ BitVec 32))) )
))
(declare-fun lt!481027 () array!69925)

(declare-fun getCurrentListMap!4202 (array!69923 array!69925 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) Int) ListLongMap!14829)

(assert (=> b!1085488 (= lt!481028 (getCurrentListMap!4202 lt!481032 lt!481027 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481031 () ListLongMap!14829)

(declare-fun lt!481030 () ListLongMap!14829)

(assert (=> b!1085488 (and (= lt!481031 lt!481030) (= lt!481030 lt!481031))))

(declare-fun lt!481026 () ListLongMap!14829)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!742 (ListLongMap!14829 (_ BitVec 64)) ListLongMap!14829)

(assert (=> b!1085488 (= lt!481030 (-!742 lt!481026 k0!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35651 0))(
  ( (Unit!35652) )
))
(declare-fun lt!481025 () Unit!35651)

(declare-fun _keys!1070 () array!69923)

(declare-fun _values!874 () array!69925)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 (array!69923 array!69925 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35651)

(assert (=> b!1085488 (= lt!481025 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!31 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4007 (array!69923 array!69925 (_ BitVec 32) (_ BitVec 32) V!40425 V!40425 (_ BitVec 32) Int) ListLongMap!14829)

(assert (=> b!1085488 (= lt!481031 (getCurrentListMapNoExtraKeys!4007 lt!481032 lt!481027 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2128 (Int (_ BitVec 64)) V!40425)

(assert (=> b!1085488 (= lt!481027 (array!69926 (store (arr!33630 _values!874) i!650 (ValueCellFull!12527 (dynLambda!2128 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34167 _values!874)))))

(assert (=> b!1085488 (= lt!481026 (getCurrentListMapNoExtraKeys!4007 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085488 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!481029 () Unit!35651)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69923 (_ BitVec 64) (_ BitVec 32)) Unit!35651)

(assert (=> b!1085488 (= lt!481029 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1085489 () Bool)

(declare-fun e!620275 () Bool)

(declare-fun tp_is_empty!26473 () Bool)

(assert (=> b!1085489 (= e!620275 tp_is_empty!26473)))

(declare-fun b!1085491 () Bool)

(declare-fun e!620273 () Bool)

(declare-fun mapRes!41464 () Bool)

(assert (=> b!1085491 (= e!620273 (and e!620275 mapRes!41464))))

(declare-fun condMapEmpty!41464 () Bool)

(declare-fun mapDefault!41464 () ValueCell!12527)

(assert (=> b!1085491 (= condMapEmpty!41464 (= (arr!33630 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12527)) mapDefault!41464)))))

(declare-fun b!1085492 () Bool)

(declare-fun res!723278 () Bool)

(declare-fun e!620276 () Bool)

(assert (=> b!1085492 (=> (not res!723278) (not e!620276))))

(declare-datatypes ((List!23451 0))(
  ( (Nil!23448) (Cons!23447 (h!24665 (_ BitVec 64)) (t!32972 List!23451)) )
))
(declare-fun arrayNoDuplicates!0 (array!69923 (_ BitVec 32) List!23451) Bool)

(assert (=> b!1085492 (= res!723278 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23448))))

(declare-fun b!1085493 () Bool)

(declare-fun res!723277 () Bool)

(assert (=> b!1085493 (=> (not res!723277) (not e!620276))))

(assert (=> b!1085493 (= res!723277 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34166 _keys!1070))))))

(declare-fun b!1085494 () Bool)

(declare-fun res!723282 () Bool)

(assert (=> b!1085494 (=> (not res!723282) (not e!620276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085494 (= res!723282 (validKeyInArray!0 k0!904))))

(declare-fun b!1085495 () Bool)

(declare-fun res!723281 () Bool)

(assert (=> b!1085495 (=> (not res!723281) (not e!620276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69923 (_ BitVec 32)) Bool)

(assert (=> b!1085495 (= res!723281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085496 () Bool)

(assert (=> b!1085496 (= e!620276 e!620271)))

(declare-fun res!723280 () Bool)

(assert (=> b!1085496 (=> (not res!723280) (not e!620271))))

(assert (=> b!1085496 (= res!723280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481032 mask!1414))))

(assert (=> b!1085496 (= lt!481032 (array!69924 (store (arr!33629 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34166 _keys!1070)))))

(declare-fun b!1085497 () Bool)

(declare-fun res!723283 () Bool)

(assert (=> b!1085497 (=> (not res!723283) (not e!620276))))

(assert (=> b!1085497 (= res!723283 (= (select (arr!33629 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!41464 () Bool)

(assert (=> mapIsEmpty!41464 mapRes!41464))

(declare-fun mapNonEmpty!41464 () Bool)

(declare-fun tp!79261 () Bool)

(declare-fun e!620274 () Bool)

(assert (=> mapNonEmpty!41464 (= mapRes!41464 (and tp!79261 e!620274))))

(declare-fun mapValue!41464 () ValueCell!12527)

(declare-fun mapKey!41464 () (_ BitVec 32))

(declare-fun mapRest!41464 () (Array (_ BitVec 32) ValueCell!12527))

(assert (=> mapNonEmpty!41464 (= (arr!33630 _values!874) (store mapRest!41464 mapKey!41464 mapValue!41464))))

(declare-fun res!723279 () Bool)

(assert (=> start!96054 (=> (not res!723279) (not e!620276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96054 (= res!723279 (validMask!0 mask!1414))))

(assert (=> start!96054 e!620276))

(assert (=> start!96054 tp!79262))

(assert (=> start!96054 true))

(assert (=> start!96054 tp_is_empty!26473))

(declare-fun array_inv!25998 (array!69923) Bool)

(assert (=> start!96054 (array_inv!25998 _keys!1070)))

(declare-fun array_inv!25999 (array!69925) Bool)

(assert (=> start!96054 (and (array_inv!25999 _values!874) e!620273)))

(declare-fun b!1085490 () Bool)

(assert (=> b!1085490 (= e!620274 tp_is_empty!26473)))

(declare-fun b!1085498 () Bool)

(declare-fun res!723284 () Bool)

(assert (=> b!1085498 (=> (not res!723284) (not e!620271))))

(assert (=> b!1085498 (= res!723284 (arrayNoDuplicates!0 lt!481032 #b00000000000000000000000000000000 Nil!23448))))

(declare-fun b!1085499 () Bool)

(declare-fun res!723285 () Bool)

(assert (=> b!1085499 (=> (not res!723285) (not e!620276))))

(assert (=> b!1085499 (= res!723285 (and (= (size!34167 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34166 _keys!1070) (size!34167 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96054 res!723279) b!1085499))

(assert (= (and b!1085499 res!723285) b!1085495))

(assert (= (and b!1085495 res!723281) b!1085492))

(assert (= (and b!1085492 res!723278) b!1085493))

(assert (= (and b!1085493 res!723277) b!1085494))

(assert (= (and b!1085494 res!723282) b!1085497))

(assert (= (and b!1085497 res!723283) b!1085496))

(assert (= (and b!1085496 res!723280) b!1085498))

(assert (= (and b!1085498 res!723284) b!1085488))

(assert (= (and b!1085491 condMapEmpty!41464) mapIsEmpty!41464))

(assert (= (and b!1085491 (not condMapEmpty!41464)) mapNonEmpty!41464))

(get-info :version)

(assert (= (and mapNonEmpty!41464 ((_ is ValueCellFull!12527) mapValue!41464)) b!1085490))

(assert (= (and b!1085491 ((_ is ValueCellFull!12527) mapDefault!41464)) b!1085489))

(assert (= start!96054 b!1085491))

(declare-fun b_lambda!17151 () Bool)

(assert (=> (not b_lambda!17151) (not b!1085488)))

(declare-fun t!32970 () Bool)

(declare-fun tb!7341 () Bool)

(assert (=> (and start!96054 (= defaultEntry!882 defaultEntry!882) t!32970) tb!7341))

(declare-fun result!15209 () Bool)

(assert (=> tb!7341 (= result!15209 tp_is_empty!26473)))

(assert (=> b!1085488 t!32970))

(declare-fun b_and!35629 () Bool)

(assert (= b_and!35627 (and (=> t!32970 result!15209) b_and!35629)))

(declare-fun m!1003535 () Bool)

(assert (=> mapNonEmpty!41464 m!1003535))

(declare-fun m!1003537 () Bool)

(assert (=> b!1085498 m!1003537))

(declare-fun m!1003539 () Bool)

(assert (=> b!1085494 m!1003539))

(declare-fun m!1003541 () Bool)

(assert (=> b!1085488 m!1003541))

(declare-fun m!1003543 () Bool)

(assert (=> b!1085488 m!1003543))

(declare-fun m!1003545 () Bool)

(assert (=> b!1085488 m!1003545))

(declare-fun m!1003547 () Bool)

(assert (=> b!1085488 m!1003547))

(declare-fun m!1003549 () Bool)

(assert (=> b!1085488 m!1003549))

(declare-fun m!1003551 () Bool)

(assert (=> b!1085488 m!1003551))

(declare-fun m!1003553 () Bool)

(assert (=> b!1085488 m!1003553))

(declare-fun m!1003555 () Bool)

(assert (=> b!1085488 m!1003555))

(declare-fun m!1003557 () Bool)

(assert (=> b!1085488 m!1003557))

(declare-fun m!1003559 () Bool)

(assert (=> b!1085496 m!1003559))

(declare-fun m!1003561 () Bool)

(assert (=> b!1085496 m!1003561))

(declare-fun m!1003563 () Bool)

(assert (=> b!1085492 m!1003563))

(declare-fun m!1003565 () Bool)

(assert (=> b!1085495 m!1003565))

(declare-fun m!1003567 () Bool)

(assert (=> start!96054 m!1003567))

(declare-fun m!1003569 () Bool)

(assert (=> start!96054 m!1003569))

(declare-fun m!1003571 () Bool)

(assert (=> start!96054 m!1003571))

(declare-fun m!1003573 () Bool)

(assert (=> b!1085497 m!1003573))

(check-sat (not b!1085488) (not b_lambda!17151) (not b!1085498) (not b!1085492) (not b!1085494) (not mapNonEmpty!41464) (not b!1085495) tp_is_empty!26473 (not b!1085496) (not start!96054) (not b_next!22471) b_and!35629)
(check-sat b_and!35629 (not b_next!22471))
