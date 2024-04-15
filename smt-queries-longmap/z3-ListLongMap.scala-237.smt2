; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4094 () Bool)

(assert start!4094)

(declare-fun b_free!1009 () Bool)

(declare-fun b_next!1009 () Bool)

(assert (=> start!4094 (= b_free!1009 (not b_next!1009))))

(declare-fun tp!4446 () Bool)

(declare-fun b_and!1813 () Bool)

(assert (=> start!4094 (= tp!4446 b_and!1813)))

(declare-fun b!30471 () Bool)

(declare-fun res!18372 () Bool)

(declare-fun e!19533 () Bool)

(assert (=> b!30471 (=> (not res!18372) (not e!19533))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30471 (= res!18372 (validKeyInArray!0 k0!1304))))

(declare-fun b!30472 () Bool)

(declare-fun e!19536 () Bool)

(declare-fun tp_is_empty!1363 () Bool)

(assert (=> b!30472 (= e!19536 tp_is_empty!1363)))

(declare-fun b!30473 () Bool)

(declare-fun e!19535 () Bool)

(declare-fun mapRes!1573 () Bool)

(assert (=> b!30473 (= e!19535 (and e!19536 mapRes!1573))))

(declare-fun condMapEmpty!1573 () Bool)

(declare-datatypes ((V!1643 0))(
  ( (V!1644 (val!708 Int)) )
))
(declare-datatypes ((ValueCell!482 0))(
  ( (ValueCellFull!482 (v!1796 V!1643)) (EmptyCell!482) )
))
(declare-datatypes ((array!1925 0))(
  ( (array!1926 (arr!916 (Array (_ BitVec 32) ValueCell!482)) (size!1017 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1925)

(declare-fun mapDefault!1573 () ValueCell!482)

(assert (=> b!30473 (= condMapEmpty!1573 (= (arr!916 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!482)) mapDefault!1573)))))

(declare-fun b!30474 () Bool)

(declare-fun res!18374 () Bool)

(assert (=> b!30474 (=> (not res!18374) (not e!19533))))

(declare-datatypes ((array!1927 0))(
  ( (array!1928 (arr!917 (Array (_ BitVec 32) (_ BitVec 64))) (size!1018 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1927)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1927 (_ BitVec 32)) Bool)

(assert (=> b!30474 (= res!18374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30475 () Bool)

(declare-fun e!19537 () Bool)

(assert (=> b!30475 (= e!19537 tp_is_empty!1363)))

(declare-fun mapNonEmpty!1573 () Bool)

(declare-fun tp!4447 () Bool)

(assert (=> mapNonEmpty!1573 (= mapRes!1573 (and tp!4447 e!19537))))

(declare-fun mapRest!1573 () (Array (_ BitVec 32) ValueCell!482))

(declare-fun mapKey!1573 () (_ BitVec 32))

(declare-fun mapValue!1573 () ValueCell!482)

(assert (=> mapNonEmpty!1573 (= (arr!916 _values!1501) (store mapRest!1573 mapKey!1573 mapValue!1573))))

(declare-fun res!18371 () Bool)

(assert (=> start!4094 (=> (not res!18371) (not e!19533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4094 (= res!18371 (validMask!0 mask!2294))))

(assert (=> start!4094 e!19533))

(assert (=> start!4094 true))

(assert (=> start!4094 tp!4446))

(declare-fun array_inv!641 (array!1925) Bool)

(assert (=> start!4094 (and (array_inv!641 _values!1501) e!19535)))

(declare-fun array_inv!642 (array!1927) Bool)

(assert (=> start!4094 (array_inv!642 _keys!1833)))

(assert (=> start!4094 tp_is_empty!1363))

(declare-fun b!30476 () Bool)

(declare-fun res!18376 () Bool)

(assert (=> b!30476 (=> (not res!18376) (not e!19533))))

(declare-fun arrayContainsKey!0 (array!1927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30476 (= res!18376 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30477 () Bool)

(declare-fun res!18370 () Bool)

(assert (=> b!30477 (=> (not res!18370) (not e!19533))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1643)

(declare-fun minValue!1443 () V!1643)

(declare-datatypes ((tuple2!1174 0))(
  ( (tuple2!1175 (_1!598 (_ BitVec 64)) (_2!598 V!1643)) )
))
(declare-datatypes ((List!756 0))(
  ( (Nil!753) (Cons!752 (h!1319 tuple2!1174) (t!3442 List!756)) )
))
(declare-datatypes ((ListLongMap!739 0))(
  ( (ListLongMap!740 (toList!385 List!756)) )
))
(declare-fun contains!326 (ListLongMap!739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!209 (array!1927 array!1925 (_ BitVec 32) (_ BitVec 32) V!1643 V!1643 (_ BitVec 32) Int) ListLongMap!739)

(assert (=> b!30477 (= res!18370 (not (contains!326 (getCurrentListMap!209 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30478 () Bool)

(assert (=> b!30478 (= e!19533 false)))

(declare-datatypes ((SeekEntryResult!110 0))(
  ( (MissingZero!110 (index!2562 (_ BitVec 32))) (Found!110 (index!2563 (_ BitVec 32))) (Intermediate!110 (undefined!922 Bool) (index!2564 (_ BitVec 32)) (x!6548 (_ BitVec 32))) (Undefined!110) (MissingVacant!110 (index!2565 (_ BitVec 32))) )
))
(declare-fun lt!11425 () SeekEntryResult!110)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1927 (_ BitVec 32)) SeekEntryResult!110)

(assert (=> b!30478 (= lt!11425 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30479 () Bool)

(declare-fun res!18373 () Bool)

(assert (=> b!30479 (=> (not res!18373) (not e!19533))))

(declare-datatypes ((List!757 0))(
  ( (Nil!754) (Cons!753 (h!1320 (_ BitVec 64)) (t!3443 List!757)) )
))
(declare-fun arrayNoDuplicates!0 (array!1927 (_ BitVec 32) List!757) Bool)

(assert (=> b!30479 (= res!18373 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!754))))

(declare-fun mapIsEmpty!1573 () Bool)

(assert (=> mapIsEmpty!1573 mapRes!1573))

(declare-fun b!30480 () Bool)

(declare-fun res!18375 () Bool)

(assert (=> b!30480 (=> (not res!18375) (not e!19533))))

(assert (=> b!30480 (= res!18375 (and (= (size!1017 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1018 _keys!1833) (size!1017 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4094 res!18371) b!30480))

(assert (= (and b!30480 res!18375) b!30474))

(assert (= (and b!30474 res!18374) b!30479))

(assert (= (and b!30479 res!18373) b!30471))

(assert (= (and b!30471 res!18372) b!30477))

(assert (= (and b!30477 res!18370) b!30476))

(assert (= (and b!30476 res!18376) b!30478))

(assert (= (and b!30473 condMapEmpty!1573) mapIsEmpty!1573))

(assert (= (and b!30473 (not condMapEmpty!1573)) mapNonEmpty!1573))

(get-info :version)

(assert (= (and mapNonEmpty!1573 ((_ is ValueCellFull!482) mapValue!1573)) b!30475))

(assert (= (and b!30473 ((_ is ValueCellFull!482) mapDefault!1573)) b!30472))

(assert (= start!4094 b!30473))

(declare-fun m!24447 () Bool)

(assert (=> b!30476 m!24447))

(declare-fun m!24449 () Bool)

(assert (=> b!30471 m!24449))

(declare-fun m!24451 () Bool)

(assert (=> b!30478 m!24451))

(declare-fun m!24453 () Bool)

(assert (=> b!30477 m!24453))

(assert (=> b!30477 m!24453))

(declare-fun m!24455 () Bool)

(assert (=> b!30477 m!24455))

(declare-fun m!24457 () Bool)

(assert (=> start!4094 m!24457))

(declare-fun m!24459 () Bool)

(assert (=> start!4094 m!24459))

(declare-fun m!24461 () Bool)

(assert (=> start!4094 m!24461))

(declare-fun m!24463 () Bool)

(assert (=> mapNonEmpty!1573 m!24463))

(declare-fun m!24465 () Bool)

(assert (=> b!30479 m!24465))

(declare-fun m!24467 () Bool)

(assert (=> b!30474 m!24467))

(check-sat (not start!4094) (not b_next!1009) (not b!30478) (not b!30477) tp_is_empty!1363 (not b!30479) (not b!30471) (not mapNonEmpty!1573) (not b!30476) b_and!1813 (not b!30474))
(check-sat b_and!1813 (not b_next!1009))
