; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96414 () Bool)

(assert start!96414)

(declare-fun b_free!22831 () Bool)

(declare-fun b_next!22831 () Bool)

(assert (=> start!96414 (= b_free!22831 (not b_next!22831))))

(declare-fun tp!80341 () Bool)

(declare-fun b_and!36347 () Bool)

(assert (=> start!96414 (= tp!80341 b_and!36347)))

(declare-fun b!1093358 () Bool)

(declare-fun e!624517 () Bool)

(declare-fun e!624516 () Bool)

(assert (=> b!1093358 (= e!624517 e!624516)))

(declare-fun res!729169 () Bool)

(assert (=> b!1093358 (=> (not res!729169) (not e!624516))))

(declare-datatypes ((array!70617 0))(
  ( (array!70618 (arr!33976 (Array (_ BitVec 32) (_ BitVec 64))) (size!34513 (_ BitVec 32))) )
))
(declare-fun lt!488466 () array!70617)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70617 (_ BitVec 32)) Bool)

(assert (=> b!1093358 (= res!729169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488466 mask!1414))))

(declare-fun _keys!1070 () array!70617)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093358 (= lt!488466 (array!70618 (store (arr!33976 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34513 _keys!1070)))))

(declare-fun b!1093359 () Bool)

(declare-fun e!624518 () Bool)

(declare-fun tp_is_empty!26833 () Bool)

(assert (=> b!1093359 (= e!624518 tp_is_empty!26833)))

(declare-fun b!1093360 () Bool)

(declare-fun e!624520 () Bool)

(assert (=> b!1093360 (= e!624516 (not e!624520))))

(declare-fun res!729176 () Bool)

(assert (=> b!1093360 (=> res!729176 e!624520)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1093360 (= res!729176 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40905 0))(
  ( (V!40906 (val!13473 Int)) )
))
(declare-fun minValue!831 () V!40905)

(declare-datatypes ((tuple2!17140 0))(
  ( (tuple2!17141 (_1!8581 (_ BitVec 64)) (_2!8581 V!40905)) )
))
(declare-datatypes ((List!23732 0))(
  ( (Nil!23729) (Cons!23728 (h!24946 tuple2!17140) (t!33613 List!23732)) )
))
(declare-datatypes ((ListLongMap!15117 0))(
  ( (ListLongMap!15118 (toList!7574 List!23732)) )
))
(declare-fun lt!488470 () ListLongMap!15117)

(declare-fun zeroValue!831 () V!40905)

(declare-datatypes ((ValueCell!12707 0))(
  ( (ValueCellFull!12707 (v!16090 V!40905)) (EmptyCell!12707) )
))
(declare-datatypes ((array!70619 0))(
  ( (array!70620 (arr!33977 (Array (_ BitVec 32) ValueCell!12707)) (size!34514 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70619)

(declare-fun getCurrentListMap!4322 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1093360 (= lt!488470 (getCurrentListMap!4322 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488469 () array!70619)

(declare-fun lt!488467 () ListLongMap!15117)

(assert (=> b!1093360 (= lt!488467 (getCurrentListMap!4322 lt!488466 lt!488469 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488471 () ListLongMap!15117)

(declare-fun lt!488461 () ListLongMap!15117)

(assert (=> b!1093360 (and (= lt!488471 lt!488461) (= lt!488461 lt!488471))))

(declare-fun lt!488472 () ListLongMap!15117)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!879 (ListLongMap!15117 (_ BitVec 64)) ListLongMap!15117)

(assert (=> b!1093360 (= lt!488461 (-!879 lt!488472 k0!904))))

(declare-datatypes ((Unit!35925 0))(
  ( (Unit!35926) )
))
(declare-fun lt!488464 () Unit!35925)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!151 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35925)

(assert (=> b!1093360 (= lt!488464 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!151 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4127 (array!70617 array!70619 (_ BitVec 32) (_ BitVec 32) V!40905 V!40905 (_ BitVec 32) Int) ListLongMap!15117)

(assert (=> b!1093360 (= lt!488471 (getCurrentListMapNoExtraKeys!4127 lt!488466 lt!488469 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2248 (Int (_ BitVec 64)) V!40905)

(assert (=> b!1093360 (= lt!488469 (array!70620 (store (arr!33977 _values!874) i!650 (ValueCellFull!12707 (dynLambda!2248 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34514 _values!874)))))

(assert (=> b!1093360 (= lt!488472 (getCurrentListMapNoExtraKeys!4127 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093360 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488462 () Unit!35925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70617 (_ BitVec 64) (_ BitVec 32)) Unit!35925)

(assert (=> b!1093360 (= lt!488462 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093361 () Bool)

(declare-fun res!729173 () Bool)

(assert (=> b!1093361 (=> (not res!729173) (not e!624517))))

(assert (=> b!1093361 (= res!729173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093362 () Bool)

(declare-fun res!729167 () Bool)

(assert (=> b!1093362 (=> (not res!729167) (not e!624517))))

(declare-datatypes ((List!23733 0))(
  ( (Nil!23730) (Cons!23729 (h!24947 (_ BitVec 64)) (t!33614 List!23733)) )
))
(declare-fun arrayNoDuplicates!0 (array!70617 (_ BitVec 32) List!23733) Bool)

(assert (=> b!1093362 (= res!729167 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23730))))

(declare-fun b!1093363 () Bool)

(declare-fun res!729170 () Bool)

(assert (=> b!1093363 (=> (not res!729170) (not e!624517))))

(assert (=> b!1093363 (= res!729170 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34513 _keys!1070))))))

(declare-fun b!1093364 () Bool)

(declare-fun res!729168 () Bool)

(assert (=> b!1093364 (=> (not res!729168) (not e!624517))))

(assert (=> b!1093364 (= res!729168 (and (= (size!34514 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34513 _keys!1070) (size!34514 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093365 () Bool)

(declare-fun res!729171 () Bool)

(assert (=> b!1093365 (=> (not res!729171) (not e!624517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093365 (= res!729171 (validKeyInArray!0 k0!904))))

(declare-fun res!729175 () Bool)

(assert (=> start!96414 (=> (not res!729175) (not e!624517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96414 (= res!729175 (validMask!0 mask!1414))))

(assert (=> start!96414 e!624517))

(assert (=> start!96414 tp!80341))

(assert (=> start!96414 true))

(assert (=> start!96414 tp_is_empty!26833))

(declare-fun array_inv!26232 (array!70617) Bool)

(assert (=> start!96414 (array_inv!26232 _keys!1070)))

(declare-fun e!624514 () Bool)

(declare-fun array_inv!26233 (array!70619) Bool)

(assert (=> start!96414 (and (array_inv!26233 _values!874) e!624514)))

(declare-fun b!1093366 () Bool)

(declare-fun e!624515 () Bool)

(assert (=> b!1093366 (= e!624515 true)))

(declare-fun lt!488465 () ListLongMap!15117)

(declare-fun lt!488460 () ListLongMap!15117)

(assert (=> b!1093366 (= (-!879 lt!488465 k0!904) lt!488460)))

(declare-fun lt!488468 () Unit!35925)

(declare-fun addRemoveCommutativeForDiffKeys!112 (ListLongMap!15117 (_ BitVec 64) V!40905 (_ BitVec 64)) Unit!35925)

(assert (=> b!1093366 (= lt!488468 (addRemoveCommutativeForDiffKeys!112 lt!488472 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!42004 () Bool)

(declare-fun mapRes!42004 () Bool)

(declare-fun tp!80342 () Bool)

(assert (=> mapNonEmpty!42004 (= mapRes!42004 (and tp!80342 e!624518))))

(declare-fun mapRest!42004 () (Array (_ BitVec 32) ValueCell!12707))

(declare-fun mapValue!42004 () ValueCell!12707)

(declare-fun mapKey!42004 () (_ BitVec 32))

(assert (=> mapNonEmpty!42004 (= (arr!33977 _values!874) (store mapRest!42004 mapKey!42004 mapValue!42004))))

(declare-fun b!1093367 () Bool)

(assert (=> b!1093367 (= e!624520 e!624515)))

(declare-fun res!729172 () Bool)

(assert (=> b!1093367 (=> res!729172 e!624515)))

(assert (=> b!1093367 (= res!729172 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1093367 (= lt!488470 lt!488465)))

(declare-fun lt!488463 () tuple2!17140)

(declare-fun +!3386 (ListLongMap!15117 tuple2!17140) ListLongMap!15117)

(assert (=> b!1093367 (= lt!488465 (+!3386 lt!488472 lt!488463))))

(assert (=> b!1093367 (= lt!488467 lt!488460)))

(assert (=> b!1093367 (= lt!488460 (+!3386 lt!488461 lt!488463))))

(assert (=> b!1093367 (= lt!488467 (+!3386 lt!488471 lt!488463))))

(assert (=> b!1093367 (= lt!488463 (tuple2!17141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1093368 () Bool)

(declare-fun res!729177 () Bool)

(assert (=> b!1093368 (=> (not res!729177) (not e!624516))))

(assert (=> b!1093368 (= res!729177 (arrayNoDuplicates!0 lt!488466 #b00000000000000000000000000000000 Nil!23730))))

(declare-fun b!1093369 () Bool)

(declare-fun e!624519 () Bool)

(assert (=> b!1093369 (= e!624519 tp_is_empty!26833)))

(declare-fun b!1093370 () Bool)

(declare-fun res!729174 () Bool)

(assert (=> b!1093370 (=> (not res!729174) (not e!624517))))

(assert (=> b!1093370 (= res!729174 (= (select (arr!33976 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42004 () Bool)

(assert (=> mapIsEmpty!42004 mapRes!42004))

(declare-fun b!1093371 () Bool)

(assert (=> b!1093371 (= e!624514 (and e!624519 mapRes!42004))))

(declare-fun condMapEmpty!42004 () Bool)

(declare-fun mapDefault!42004 () ValueCell!12707)

(assert (=> b!1093371 (= condMapEmpty!42004 (= (arr!33977 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12707)) mapDefault!42004)))))

(assert (= (and start!96414 res!729175) b!1093364))

(assert (= (and b!1093364 res!729168) b!1093361))

(assert (= (and b!1093361 res!729173) b!1093362))

(assert (= (and b!1093362 res!729167) b!1093363))

(assert (= (and b!1093363 res!729170) b!1093365))

(assert (= (and b!1093365 res!729171) b!1093370))

(assert (= (and b!1093370 res!729174) b!1093358))

(assert (= (and b!1093358 res!729169) b!1093368))

(assert (= (and b!1093368 res!729177) b!1093360))

(assert (= (and b!1093360 (not res!729176)) b!1093367))

(assert (= (and b!1093367 (not res!729172)) b!1093366))

(assert (= (and b!1093371 condMapEmpty!42004) mapIsEmpty!42004))

(assert (= (and b!1093371 (not condMapEmpty!42004)) mapNonEmpty!42004))

(get-info :version)

(assert (= (and mapNonEmpty!42004 ((_ is ValueCellFull!12707) mapValue!42004)) b!1093359))

(assert (= (and b!1093371 ((_ is ValueCellFull!12707) mapDefault!42004)) b!1093369))

(assert (= start!96414 b!1093371))

(declare-fun b_lambda!17511 () Bool)

(assert (=> (not b_lambda!17511) (not b!1093360)))

(declare-fun t!33612 () Bool)

(declare-fun tb!7701 () Bool)

(assert (=> (and start!96414 (= defaultEntry!882 defaultEntry!882) t!33612) tb!7701))

(declare-fun result!15929 () Bool)

(assert (=> tb!7701 (= result!15929 tp_is_empty!26833)))

(assert (=> b!1093360 t!33612))

(declare-fun b_and!36349 () Bool)

(assert (= b_and!36347 (and (=> t!33612 result!15929) b_and!36349)))

(declare-fun m!1013399 () Bool)

(assert (=> b!1093365 m!1013399))

(declare-fun m!1013401 () Bool)

(assert (=> b!1093362 m!1013401))

(declare-fun m!1013403 () Bool)

(assert (=> b!1093366 m!1013403))

(declare-fun m!1013405 () Bool)

(assert (=> b!1093366 m!1013405))

(declare-fun m!1013407 () Bool)

(assert (=> b!1093360 m!1013407))

(declare-fun m!1013409 () Bool)

(assert (=> b!1093360 m!1013409))

(declare-fun m!1013411 () Bool)

(assert (=> b!1093360 m!1013411))

(declare-fun m!1013413 () Bool)

(assert (=> b!1093360 m!1013413))

(declare-fun m!1013415 () Bool)

(assert (=> b!1093360 m!1013415))

(declare-fun m!1013417 () Bool)

(assert (=> b!1093360 m!1013417))

(declare-fun m!1013419 () Bool)

(assert (=> b!1093360 m!1013419))

(declare-fun m!1013421 () Bool)

(assert (=> b!1093360 m!1013421))

(declare-fun m!1013423 () Bool)

(assert (=> b!1093360 m!1013423))

(declare-fun m!1013425 () Bool)

(assert (=> b!1093360 m!1013425))

(declare-fun m!1013427 () Bool)

(assert (=> b!1093361 m!1013427))

(declare-fun m!1013429 () Bool)

(assert (=> b!1093368 m!1013429))

(declare-fun m!1013431 () Bool)

(assert (=> b!1093370 m!1013431))

(declare-fun m!1013433 () Bool)

(assert (=> start!96414 m!1013433))

(declare-fun m!1013435 () Bool)

(assert (=> start!96414 m!1013435))

(declare-fun m!1013437 () Bool)

(assert (=> start!96414 m!1013437))

(declare-fun m!1013439 () Bool)

(assert (=> b!1093367 m!1013439))

(declare-fun m!1013441 () Bool)

(assert (=> b!1093367 m!1013441))

(declare-fun m!1013443 () Bool)

(assert (=> b!1093367 m!1013443))

(declare-fun m!1013445 () Bool)

(assert (=> mapNonEmpty!42004 m!1013445))

(declare-fun m!1013447 () Bool)

(assert (=> b!1093358 m!1013447))

(declare-fun m!1013449 () Bool)

(assert (=> b!1093358 m!1013449))

(check-sat (not b!1093361) (not b!1093367) (not b!1093366) (not b!1093362) (not b!1093360) (not b!1093358) b_and!36349 (not mapNonEmpty!42004) tp_is_empty!26833 (not b!1093368) (not b_next!22831) (not b_lambda!17511) (not b!1093365) (not start!96414))
(check-sat b_and!36349 (not b_next!22831))
