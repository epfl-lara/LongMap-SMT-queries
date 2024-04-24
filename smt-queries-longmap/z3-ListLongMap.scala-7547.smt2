; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95838 () Bool)

(assert start!95838)

(declare-fun b_free!22255 () Bool)

(declare-fun b_next!22255 () Bool)

(assert (=> start!95838 (= b_free!22255 (not b_next!22255))))

(declare-fun tp!78614 () Bool)

(declare-fun b_and!35243 () Bool)

(assert (=> start!95838 (= tp!78614 b_and!35243)))

(declare-fun b!1081432 () Bool)

(declare-fun res!720367 () Bool)

(declare-fun e!618329 () Bool)

(assert (=> b!1081432 (=> (not res!720367) (not e!618329))))

(declare-datatypes ((array!69503 0))(
  ( (array!69504 (arr!33419 (Array (_ BitVec 32) (_ BitVec 64))) (size!33956 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69503)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1081432 (= res!720367 (= (select (arr!33419 _keys!1070) i!650) k0!904))))

(declare-fun b!1081433 () Bool)

(declare-fun e!618328 () Bool)

(assert (=> b!1081433 (= e!618329 e!618328)))

(declare-fun res!720364 () Bool)

(assert (=> b!1081433 (=> (not res!720364) (not e!618328))))

(declare-fun lt!479450 () array!69503)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69503 (_ BitVec 32)) Bool)

(assert (=> b!1081433 (= res!720364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479450 mask!1414))))

(assert (=> b!1081433 (= lt!479450 (array!69504 (store (arr!33419 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33956 _keys!1070)))))

(declare-fun b!1081434 () Bool)

(declare-fun e!618332 () Bool)

(declare-fun e!618331 () Bool)

(declare-fun mapRes!41140 () Bool)

(assert (=> b!1081434 (= e!618332 (and e!618331 mapRes!41140))))

(declare-fun condMapEmpty!41140 () Bool)

(declare-datatypes ((V!40137 0))(
  ( (V!40138 (val!13185 Int)) )
))
(declare-datatypes ((ValueCell!12419 0))(
  ( (ValueCellFull!12419 (v!15802 V!40137)) (EmptyCell!12419) )
))
(declare-datatypes ((array!69505 0))(
  ( (array!69506 (arr!33420 (Array (_ BitVec 32) ValueCell!12419)) (size!33957 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69505)

(declare-fun mapDefault!41140 () ValueCell!12419)

(assert (=> b!1081434 (= condMapEmpty!41140 (= (arr!33420 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12419)) mapDefault!41140)))))

(declare-fun b!1081435 () Bool)

(declare-fun res!720361 () Bool)

(assert (=> b!1081435 (=> (not res!720361) (not e!618329))))

(declare-datatypes ((List!23283 0))(
  ( (Nil!23280) (Cons!23279 (h!24497 (_ BitVec 64)) (t!32634 List!23283)) )
))
(declare-fun arrayNoDuplicates!0 (array!69503 (_ BitVec 32) List!23283) Bool)

(assert (=> b!1081435 (= res!720361 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23280))))

(declare-fun b!1081436 () Bool)

(declare-fun tp_is_empty!26257 () Bool)

(assert (=> b!1081436 (= e!618331 tp_is_empty!26257)))

(declare-fun b!1081437 () Bool)

(assert (=> b!1081437 (= e!618328 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40137)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40137)

(declare-datatypes ((tuple2!16690 0))(
  ( (tuple2!16691 (_1!8356 (_ BitVec 64)) (_2!8356 V!40137)) )
))
(declare-datatypes ((List!23284 0))(
  ( (Nil!23281) (Cons!23280 (h!24498 tuple2!16690) (t!32635 List!23284)) )
))
(declare-datatypes ((ListLongMap!14667 0))(
  ( (ListLongMap!14668 (toList!7349 List!23284)) )
))
(declare-fun lt!479449 () ListLongMap!14667)

(declare-fun getCurrentListMapNoExtraKeys!3926 (array!69503 array!69505 (_ BitVec 32) (_ BitVec 32) V!40137 V!40137 (_ BitVec 32) Int) ListLongMap!14667)

(assert (=> b!1081437 (= lt!479449 (getCurrentListMapNoExtraKeys!3926 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1081437 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35489 0))(
  ( (Unit!35490) )
))
(declare-fun lt!479451 () Unit!35489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69503 (_ BitVec 64) (_ BitVec 32)) Unit!35489)

(assert (=> b!1081437 (= lt!479451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1081438 () Bool)

(declare-fun res!720366 () Bool)

(assert (=> b!1081438 (=> (not res!720366) (not e!618329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1081438 (= res!720366 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!41140 () Bool)

(declare-fun tp!78613 () Bool)

(declare-fun e!618330 () Bool)

(assert (=> mapNonEmpty!41140 (= mapRes!41140 (and tp!78613 e!618330))))

(declare-fun mapRest!41140 () (Array (_ BitVec 32) ValueCell!12419))

(declare-fun mapValue!41140 () ValueCell!12419)

(declare-fun mapKey!41140 () (_ BitVec 32))

(assert (=> mapNonEmpty!41140 (= (arr!33420 _values!874) (store mapRest!41140 mapKey!41140 mapValue!41140))))

(declare-fun b!1081439 () Bool)

(declare-fun res!720362 () Bool)

(assert (=> b!1081439 (=> (not res!720362) (not e!618329))))

(assert (=> b!1081439 (= res!720362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!720369 () Bool)

(assert (=> start!95838 (=> (not res!720369) (not e!618329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95838 (= res!720369 (validMask!0 mask!1414))))

(assert (=> start!95838 e!618329))

(assert (=> start!95838 tp!78614))

(assert (=> start!95838 true))

(assert (=> start!95838 tp_is_empty!26257))

(declare-fun array_inv!25844 (array!69503) Bool)

(assert (=> start!95838 (array_inv!25844 _keys!1070)))

(declare-fun array_inv!25845 (array!69505) Bool)

(assert (=> start!95838 (and (array_inv!25845 _values!874) e!618332)))

(declare-fun mapIsEmpty!41140 () Bool)

(assert (=> mapIsEmpty!41140 mapRes!41140))

(declare-fun b!1081440 () Bool)

(declare-fun res!720365 () Bool)

(assert (=> b!1081440 (=> (not res!720365) (not e!618329))))

(assert (=> b!1081440 (= res!720365 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33956 _keys!1070))))))

(declare-fun b!1081441 () Bool)

(declare-fun res!720363 () Bool)

(assert (=> b!1081441 (=> (not res!720363) (not e!618329))))

(assert (=> b!1081441 (= res!720363 (and (= (size!33957 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33956 _keys!1070) (size!33957 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1081442 () Bool)

(assert (=> b!1081442 (= e!618330 tp_is_empty!26257)))

(declare-fun b!1081443 () Bool)

(declare-fun res!720368 () Bool)

(assert (=> b!1081443 (=> (not res!720368) (not e!618328))))

(assert (=> b!1081443 (= res!720368 (arrayNoDuplicates!0 lt!479450 #b00000000000000000000000000000000 Nil!23280))))

(assert (= (and start!95838 res!720369) b!1081441))

(assert (= (and b!1081441 res!720363) b!1081439))

(assert (= (and b!1081439 res!720362) b!1081435))

(assert (= (and b!1081435 res!720361) b!1081440))

(assert (= (and b!1081440 res!720365) b!1081438))

(assert (= (and b!1081438 res!720366) b!1081432))

(assert (= (and b!1081432 res!720367) b!1081433))

(assert (= (and b!1081433 res!720364) b!1081443))

(assert (= (and b!1081443 res!720368) b!1081437))

(assert (= (and b!1081434 condMapEmpty!41140) mapIsEmpty!41140))

(assert (= (and b!1081434 (not condMapEmpty!41140)) mapNonEmpty!41140))

(get-info :version)

(assert (= (and mapNonEmpty!41140 ((_ is ValueCellFull!12419) mapValue!41140)) b!1081442))

(assert (= (and b!1081434 ((_ is ValueCellFull!12419) mapDefault!41140)) b!1081436))

(assert (= start!95838 b!1081434))

(declare-fun m!999809 () Bool)

(assert (=> b!1081443 m!999809))

(declare-fun m!999811 () Bool)

(assert (=> b!1081432 m!999811))

(declare-fun m!999813 () Bool)

(assert (=> b!1081439 m!999813))

(declare-fun m!999815 () Bool)

(assert (=> b!1081433 m!999815))

(declare-fun m!999817 () Bool)

(assert (=> b!1081433 m!999817))

(declare-fun m!999819 () Bool)

(assert (=> start!95838 m!999819))

(declare-fun m!999821 () Bool)

(assert (=> start!95838 m!999821))

(declare-fun m!999823 () Bool)

(assert (=> start!95838 m!999823))

(declare-fun m!999825 () Bool)

(assert (=> b!1081438 m!999825))

(declare-fun m!999827 () Bool)

(assert (=> mapNonEmpty!41140 m!999827))

(declare-fun m!999829 () Bool)

(assert (=> b!1081437 m!999829))

(declare-fun m!999831 () Bool)

(assert (=> b!1081437 m!999831))

(declare-fun m!999833 () Bool)

(assert (=> b!1081437 m!999833))

(declare-fun m!999835 () Bool)

(assert (=> b!1081435 m!999835))

(check-sat (not b!1081435) (not mapNonEmpty!41140) (not b!1081443) (not b!1081438) (not start!95838) (not b!1081437) b_and!35243 (not b_next!22255) tp_is_empty!26257 (not b!1081439) (not b!1081433))
(check-sat b_and!35243 (not b_next!22255))
