; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4100 () Bool)

(assert start!4100)

(declare-fun b_free!1009 () Bool)

(declare-fun b_next!1009 () Bool)

(assert (=> start!4100 (= b_free!1009 (not b_next!1009))))

(declare-fun tp!4447 () Bool)

(declare-fun b_and!1809 () Bool)

(assert (=> start!4100 (= tp!4447 b_and!1809)))

(declare-fun b!30453 () Bool)

(declare-fun res!18364 () Bool)

(declare-fun e!19526 () Bool)

(assert (=> b!30453 (=> (not res!18364) (not e!19526))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30453 (= res!18364 (validKeyInArray!0 k0!1304))))

(declare-fun mapNonEmpty!1573 () Bool)

(declare-fun mapRes!1573 () Bool)

(declare-fun tp!4446 () Bool)

(declare-fun e!19524 () Bool)

(assert (=> mapNonEmpty!1573 (= mapRes!1573 (and tp!4446 e!19524))))

(declare-datatypes ((V!1643 0))(
  ( (V!1644 (val!708 Int)) )
))
(declare-datatypes ((ValueCell!482 0))(
  ( (ValueCellFull!482 (v!1797 V!1643)) (EmptyCell!482) )
))
(declare-datatypes ((array!1933 0))(
  ( (array!1934 (arr!920 (Array (_ BitVec 32) ValueCell!482)) (size!1021 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1933)

(declare-fun mapKey!1573 () (_ BitVec 32))

(declare-fun mapValue!1573 () ValueCell!482)

(declare-fun mapRest!1573 () (Array (_ BitVec 32) ValueCell!482))

(assert (=> mapNonEmpty!1573 (= (arr!920 _values!1501) (store mapRest!1573 mapKey!1573 mapValue!1573))))

(declare-fun b!30455 () Bool)

(assert (=> b!30455 (= e!19526 false)))

(declare-datatypes ((SeekEntryResult!105 0))(
  ( (MissingZero!105 (index!2542 (_ BitVec 32))) (Found!105 (index!2543 (_ BitVec 32))) (Intermediate!105 (undefined!917 Bool) (index!2544 (_ BitVec 32)) (x!6543 (_ BitVec 32))) (Undefined!105) (MissingVacant!105 (index!2545 (_ BitVec 32))) )
))
(declare-fun lt!11385 () SeekEntryResult!105)

(declare-datatypes ((array!1935 0))(
  ( (array!1936 (arr!921 (Array (_ BitVec 32) (_ BitVec 64))) (size!1022 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1935)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1935 (_ BitVec 32)) SeekEntryResult!105)

(assert (=> b!30455 (= lt!11385 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30456 () Bool)

(declare-fun res!18362 () Bool)

(assert (=> b!30456 (=> (not res!18362) (not e!19526))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30456 (= res!18362 (and (= (size!1021 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1022 _keys!1833) (size!1021 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30457 () Bool)

(declare-fun res!18366 () Bool)

(assert (=> b!30457 (=> (not res!18366) (not e!19526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1935 (_ BitVec 32)) Bool)

(assert (=> b!30457 (= res!18366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30458 () Bool)

(declare-fun e!19527 () Bool)

(declare-fun tp_is_empty!1363 () Bool)

(assert (=> b!30458 (= e!19527 tp_is_empty!1363)))

(declare-fun b!30459 () Bool)

(declare-fun e!19528 () Bool)

(assert (=> b!30459 (= e!19528 (and e!19527 mapRes!1573))))

(declare-fun condMapEmpty!1573 () Bool)

(declare-fun mapDefault!1573 () ValueCell!482)

(assert (=> b!30459 (= condMapEmpty!1573 (= (arr!920 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!482)) mapDefault!1573)))))

(declare-fun res!18367 () Bool)

(assert (=> start!4100 (=> (not res!18367) (not e!19526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4100 (= res!18367 (validMask!0 mask!2294))))

(assert (=> start!4100 e!19526))

(assert (=> start!4100 true))

(assert (=> start!4100 tp!4447))

(declare-fun array_inv!635 (array!1933) Bool)

(assert (=> start!4100 (and (array_inv!635 _values!1501) e!19528)))

(declare-fun array_inv!636 (array!1935) Bool)

(assert (=> start!4100 (array_inv!636 _keys!1833)))

(assert (=> start!4100 tp_is_empty!1363))

(declare-fun b!30454 () Bool)

(declare-fun res!18363 () Bool)

(assert (=> b!30454 (=> (not res!18363) (not e!19526))))

(declare-fun arrayContainsKey!0 (array!1935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30454 (= res!18363 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30460 () Bool)

(declare-fun res!18365 () Bool)

(assert (=> b!30460 (=> (not res!18365) (not e!19526))))

(declare-datatypes ((List!756 0))(
  ( (Nil!753) (Cons!752 (h!1319 (_ BitVec 64)) (t!3443 List!756)) )
))
(declare-fun arrayNoDuplicates!0 (array!1935 (_ BitVec 32) List!756) Bool)

(assert (=> b!30460 (= res!18365 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!753))))

(declare-fun mapIsEmpty!1573 () Bool)

(assert (=> mapIsEmpty!1573 mapRes!1573))

(declare-fun b!30461 () Bool)

(declare-fun res!18368 () Bool)

(assert (=> b!30461 (=> (not res!18368) (not e!19526))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1643)

(declare-fun minValue!1443 () V!1643)

(declare-datatypes ((tuple2!1164 0))(
  ( (tuple2!1165 (_1!593 (_ BitVec 64)) (_2!593 V!1643)) )
))
(declare-datatypes ((List!757 0))(
  ( (Nil!754) (Cons!753 (h!1320 tuple2!1164) (t!3444 List!757)) )
))
(declare-datatypes ((ListLongMap!735 0))(
  ( (ListLongMap!736 (toList!383 List!757)) )
))
(declare-fun contains!325 (ListLongMap!735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!208 (array!1935 array!1933 (_ BitVec 32) (_ BitVec 32) V!1643 V!1643 (_ BitVec 32) Int) ListLongMap!735)

(assert (=> b!30461 (= res!18368 (not (contains!325 (getCurrentListMap!208 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30462 () Bool)

(assert (=> b!30462 (= e!19524 tp_is_empty!1363)))

(assert (= (and start!4100 res!18367) b!30456))

(assert (= (and b!30456 res!18362) b!30457))

(assert (= (and b!30457 res!18366) b!30460))

(assert (= (and b!30460 res!18365) b!30453))

(assert (= (and b!30453 res!18364) b!30461))

(assert (= (and b!30461 res!18368) b!30454))

(assert (= (and b!30454 res!18363) b!30455))

(assert (= (and b!30459 condMapEmpty!1573) mapIsEmpty!1573))

(assert (= (and b!30459 (not condMapEmpty!1573)) mapNonEmpty!1573))

(get-info :version)

(assert (= (and mapNonEmpty!1573 ((_ is ValueCellFull!482) mapValue!1573)) b!30462))

(assert (= (and b!30459 ((_ is ValueCellFull!482) mapDefault!1573)) b!30458))

(assert (= start!4100 b!30459))

(declare-fun m!24365 () Bool)

(assert (=> b!30460 m!24365))

(declare-fun m!24367 () Bool)

(assert (=> start!4100 m!24367))

(declare-fun m!24369 () Bool)

(assert (=> start!4100 m!24369))

(declare-fun m!24371 () Bool)

(assert (=> start!4100 m!24371))

(declare-fun m!24373 () Bool)

(assert (=> b!30455 m!24373))

(declare-fun m!24375 () Bool)

(assert (=> b!30461 m!24375))

(assert (=> b!30461 m!24375))

(declare-fun m!24377 () Bool)

(assert (=> b!30461 m!24377))

(declare-fun m!24379 () Bool)

(assert (=> b!30453 m!24379))

(declare-fun m!24381 () Bool)

(assert (=> b!30457 m!24381))

(declare-fun m!24383 () Bool)

(assert (=> mapNonEmpty!1573 m!24383))

(declare-fun m!24385 () Bool)

(assert (=> b!30454 m!24385))

(check-sat (not mapNonEmpty!1573) (not b_next!1009) tp_is_empty!1363 (not b!30461) (not b!30460) b_and!1809 (not b!30457) (not b!30453) (not start!4100) (not b!30454) (not b!30455))
(check-sat b_and!1809 (not b_next!1009))
