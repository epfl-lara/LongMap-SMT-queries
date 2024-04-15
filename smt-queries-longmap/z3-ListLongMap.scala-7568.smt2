; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95722 () Bool)

(assert start!95722)

(declare-fun b_free!22381 () Bool)

(declare-fun b_next!22381 () Bool)

(assert (=> start!95722 (= b_free!22381 (not b_next!22381))))

(declare-fun tp!78992 () Bool)

(declare-fun b_and!35411 () Bool)

(assert (=> start!95722 (= tp!78992 b_and!35411)))

(declare-fun mapIsEmpty!41329 () Bool)

(declare-fun mapRes!41329 () Bool)

(assert (=> mapIsEmpty!41329 mapRes!41329))

(declare-fun b!1082298 () Bool)

(declare-fun res!721475 () Bool)

(declare-fun e!618518 () Bool)

(assert (=> b!1082298 (=> (not res!721475) (not e!618518))))

(declare-datatypes ((array!69636 0))(
  ( (array!69637 (arr!33492 (Array (_ BitVec 32) (_ BitVec 64))) (size!34030 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69636)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1082298 (= res!721475 (= (select (arr!33492 _keys!1070) i!650) k0!904))))

(declare-fun b!1082299 () Bool)

(declare-fun res!721476 () Bool)

(assert (=> b!1082299 (=> (not res!721476) (not e!618518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1082299 (= res!721476 (validKeyInArray!0 k0!904))))

(declare-fun b!1082300 () Bool)

(declare-fun res!721479 () Bool)

(assert (=> b!1082300 (=> (not res!721479) (not e!618518))))

(declare-datatypes ((List!23410 0))(
  ( (Nil!23407) (Cons!23406 (h!24615 (_ BitVec 64)) (t!32840 List!23410)) )
))
(declare-fun arrayNoDuplicates!0 (array!69636 (_ BitVec 32) List!23410) Bool)

(assert (=> b!1082300 (= res!721479 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23407))))

(declare-fun mapNonEmpty!41329 () Bool)

(declare-fun tp!78991 () Bool)

(declare-fun e!618517 () Bool)

(assert (=> mapNonEmpty!41329 (= mapRes!41329 (and tp!78991 e!618517))))

(declare-datatypes ((V!40305 0))(
  ( (V!40306 (val!13248 Int)) )
))
(declare-datatypes ((ValueCell!12482 0))(
  ( (ValueCellFull!12482 (v!15868 V!40305)) (EmptyCell!12482) )
))
(declare-datatypes ((array!69638 0))(
  ( (array!69639 (arr!33493 (Array (_ BitVec 32) ValueCell!12482)) (size!34031 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69638)

(declare-fun mapRest!41329 () (Array (_ BitVec 32) ValueCell!12482))

(declare-fun mapValue!41329 () ValueCell!12482)

(declare-fun mapKey!41329 () (_ BitVec 32))

(assert (=> mapNonEmpty!41329 (= (arr!33493 _values!874) (store mapRest!41329 mapKey!41329 mapValue!41329))))

(declare-fun res!721474 () Bool)

(assert (=> start!95722 (=> (not res!721474) (not e!618518))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95722 (= res!721474 (validMask!0 mask!1414))))

(assert (=> start!95722 e!618518))

(assert (=> start!95722 tp!78992))

(assert (=> start!95722 true))

(declare-fun tp_is_empty!26383 () Bool)

(assert (=> start!95722 tp_is_empty!26383))

(declare-fun array_inv!25888 (array!69636) Bool)

(assert (=> start!95722 (array_inv!25888 _keys!1070)))

(declare-fun e!618516 () Bool)

(declare-fun array_inv!25889 (array!69638) Bool)

(assert (=> start!95722 (and (array_inv!25889 _values!874) e!618516)))

(declare-fun b!1082301 () Bool)

(declare-fun res!721478 () Bool)

(declare-fun e!618515 () Bool)

(assert (=> b!1082301 (=> (not res!721478) (not e!618515))))

(declare-fun lt!479420 () array!69636)

(assert (=> b!1082301 (= res!721478 (arrayNoDuplicates!0 lt!479420 #b00000000000000000000000000000000 Nil!23407))))

(declare-fun b!1082302 () Bool)

(assert (=> b!1082302 (= e!618518 e!618515)))

(declare-fun res!721477 () Bool)

(assert (=> b!1082302 (=> (not res!721477) (not e!618515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69636 (_ BitVec 32)) Bool)

(assert (=> b!1082302 (= res!721477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479420 mask!1414))))

(assert (=> b!1082302 (= lt!479420 (array!69637 (store (arr!33492 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34030 _keys!1070)))))

(declare-fun b!1082303 () Bool)

(declare-fun e!618513 () Bool)

(assert (=> b!1082303 (= e!618516 (and e!618513 mapRes!41329))))

(declare-fun condMapEmpty!41329 () Bool)

(declare-fun mapDefault!41329 () ValueCell!12482)

(assert (=> b!1082303 (= condMapEmpty!41329 (= (arr!33493 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12482)) mapDefault!41329)))))

(declare-fun b!1082304 () Bool)

(declare-fun res!721472 () Bool)

(assert (=> b!1082304 (=> (not res!721472) (not e!618518))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1082304 (= res!721472 (and (= (size!34031 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34030 _keys!1070) (size!34031 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1082305 () Bool)

(declare-fun res!721471 () Bool)

(assert (=> b!1082305 (=> (not res!721471) (not e!618518))))

(assert (=> b!1082305 (= res!721471 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34030 _keys!1070))))))

(declare-fun b!1082306 () Bool)

(assert (=> b!1082306 (= e!618517 tp_is_empty!26383)))

(declare-fun b!1082307 () Bool)

(declare-fun res!721473 () Bool)

(assert (=> b!1082307 (=> (not res!721473) (not e!618518))))

(assert (=> b!1082307 (= res!721473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1082308 () Bool)

(assert (=> b!1082308 (= e!618513 tp_is_empty!26383)))

(declare-fun b!1082309 () Bool)

(assert (=> b!1082309 (= e!618515 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!16844 0))(
  ( (tuple2!16845 (_1!8433 (_ BitVec 64)) (_2!8433 V!40305)) )
))
(declare-datatypes ((List!23411 0))(
  ( (Nil!23408) (Cons!23407 (h!24616 tuple2!16844) (t!32841 List!23411)) )
))
(declare-datatypes ((ListLongMap!14813 0))(
  ( (ListLongMap!14814 (toList!7422 List!23411)) )
))
(declare-fun lt!479423 () ListLongMap!14813)

(declare-fun minValue!831 () V!40305)

(declare-fun zeroValue!831 () V!40305)

(declare-fun getCurrentListMapNoExtraKeys!3985 (array!69636 array!69638 (_ BitVec 32) (_ BitVec 32) V!40305 V!40305 (_ BitVec 32) Int) ListLongMap!14813)

(declare-fun dynLambda!2056 (Int (_ BitVec 64)) V!40305)

(assert (=> b!1082309 (= lt!479423 (getCurrentListMapNoExtraKeys!3985 lt!479420 (array!69639 (store (arr!33493 _values!874) i!650 (ValueCellFull!12482 (dynLambda!2056 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34031 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!479421 () ListLongMap!14813)

(assert (=> b!1082309 (= lt!479421 (getCurrentListMapNoExtraKeys!3985 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1082309 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35437 0))(
  ( (Unit!35438) )
))
(declare-fun lt!479422 () Unit!35437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69636 (_ BitVec 64) (_ BitVec 32)) Unit!35437)

(assert (=> b!1082309 (= lt!479422 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(assert (= (and start!95722 res!721474) b!1082304))

(assert (= (and b!1082304 res!721472) b!1082307))

(assert (= (and b!1082307 res!721473) b!1082300))

(assert (= (and b!1082300 res!721479) b!1082305))

(assert (= (and b!1082305 res!721471) b!1082299))

(assert (= (and b!1082299 res!721476) b!1082298))

(assert (= (and b!1082298 res!721475) b!1082302))

(assert (= (and b!1082302 res!721477) b!1082301))

(assert (= (and b!1082301 res!721478) b!1082309))

(assert (= (and b!1082303 condMapEmpty!41329) mapIsEmpty!41329))

(assert (= (and b!1082303 (not condMapEmpty!41329)) mapNonEmpty!41329))

(get-info :version)

(assert (= (and mapNonEmpty!41329 ((_ is ValueCellFull!12482) mapValue!41329)) b!1082306))

(assert (= (and b!1082303 ((_ is ValueCellFull!12482) mapDefault!41329)) b!1082308))

(assert (= start!95722 b!1082303))

(declare-fun b_lambda!17029 () Bool)

(assert (=> (not b_lambda!17029) (not b!1082309)))

(declare-fun t!32839 () Bool)

(declare-fun tb!7251 () Bool)

(assert (=> (and start!95722 (= defaultEntry!882 defaultEntry!882) t!32839) tb!7251))

(declare-fun result!15029 () Bool)

(assert (=> tb!7251 (= result!15029 tp_is_empty!26383)))

(assert (=> b!1082309 t!32839))

(declare-fun b_and!35413 () Bool)

(assert (= b_and!35411 (and (=> t!32839 result!15029) b_and!35413)))

(declare-fun m!999509 () Bool)

(assert (=> b!1082309 m!999509))

(declare-fun m!999511 () Bool)

(assert (=> b!1082309 m!999511))

(declare-fun m!999513 () Bool)

(assert (=> b!1082309 m!999513))

(declare-fun m!999515 () Bool)

(assert (=> b!1082309 m!999515))

(declare-fun m!999517 () Bool)

(assert (=> b!1082309 m!999517))

(declare-fun m!999519 () Bool)

(assert (=> b!1082309 m!999519))

(declare-fun m!999521 () Bool)

(assert (=> b!1082301 m!999521))

(declare-fun m!999523 () Bool)

(assert (=> start!95722 m!999523))

(declare-fun m!999525 () Bool)

(assert (=> start!95722 m!999525))

(declare-fun m!999527 () Bool)

(assert (=> start!95722 m!999527))

(declare-fun m!999529 () Bool)

(assert (=> b!1082298 m!999529))

(declare-fun m!999531 () Bool)

(assert (=> b!1082299 m!999531))

(declare-fun m!999533 () Bool)

(assert (=> b!1082307 m!999533))

(declare-fun m!999535 () Bool)

(assert (=> b!1082300 m!999535))

(declare-fun m!999537 () Bool)

(assert (=> b!1082302 m!999537))

(declare-fun m!999539 () Bool)

(assert (=> b!1082302 m!999539))

(declare-fun m!999541 () Bool)

(assert (=> mapNonEmpty!41329 m!999541))

(check-sat (not b!1082307) (not b!1082309) (not b!1082300) (not b_lambda!17029) (not b!1082302) (not b!1082301) (not start!95722) (not b_next!22381) tp_is_empty!26383 (not mapNonEmpty!41329) (not b!1082299) b_and!35413)
(check-sat b_and!35413 (not b_next!22381))
