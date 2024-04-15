; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4100 () Bool)

(assert start!4100)

(declare-fun b_free!1015 () Bool)

(declare-fun b_next!1015 () Bool)

(assert (=> start!4100 (= b_free!1015 (not b_next!1015))))

(declare-fun tp!4465 () Bool)

(declare-fun b_and!1819 () Bool)

(assert (=> start!4100 (= tp!4465 b_and!1819)))

(declare-fun b!30561 () Bool)

(declare-fun e!19580 () Bool)

(declare-fun e!19578 () Bool)

(declare-fun mapRes!1582 () Bool)

(assert (=> b!30561 (= e!19580 (and e!19578 mapRes!1582))))

(declare-fun condMapEmpty!1582 () Bool)

(declare-datatypes ((V!1651 0))(
  ( (V!1652 (val!711 Int)) )
))
(declare-datatypes ((ValueCell!485 0))(
  ( (ValueCellFull!485 (v!1799 V!1651)) (EmptyCell!485) )
))
(declare-datatypes ((array!1937 0))(
  ( (array!1938 (arr!922 (Array (_ BitVec 32) ValueCell!485)) (size!1023 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1937)

(declare-fun mapDefault!1582 () ValueCell!485)

(assert (=> b!30561 (= condMapEmpty!1582 (= (arr!922 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!485)) mapDefault!1582)))))

(declare-fun b!30562 () Bool)

(declare-fun e!19582 () Bool)

(assert (=> b!30562 (= e!19582 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!113 0))(
  ( (MissingZero!113 (index!2574 (_ BitVec 32))) (Found!113 (index!2575 (_ BitVec 32))) (Intermediate!113 (undefined!925 Bool) (index!2576 (_ BitVec 32)) (x!6559 (_ BitVec 32))) (Undefined!113) (MissingVacant!113 (index!2577 (_ BitVec 32))) )
))
(declare-fun lt!11434 () SeekEntryResult!113)

(declare-datatypes ((array!1939 0))(
  ( (array!1940 (arr!923 (Array (_ BitVec 32) (_ BitVec 64))) (size!1024 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1939)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1939 (_ BitVec 32)) SeekEntryResult!113)

(assert (=> b!30562 (= lt!11434 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30563 () Bool)

(declare-fun res!18434 () Bool)

(assert (=> b!30563 (=> (not res!18434) (not e!19582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30563 (= res!18434 (validKeyInArray!0 k0!1304))))

(declare-fun b!30564 () Bool)

(declare-fun res!18435 () Bool)

(assert (=> b!30564 (=> (not res!18435) (not e!19582))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30564 (= res!18435 (and (= (size!1023 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1024 _keys!1833) (size!1023 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1582 () Bool)

(declare-fun tp!4464 () Bool)

(declare-fun e!19581 () Bool)

(assert (=> mapNonEmpty!1582 (= mapRes!1582 (and tp!4464 e!19581))))

(declare-fun mapKey!1582 () (_ BitVec 32))

(declare-fun mapRest!1582 () (Array (_ BitVec 32) ValueCell!485))

(declare-fun mapValue!1582 () ValueCell!485)

(assert (=> mapNonEmpty!1582 (= (arr!922 _values!1501) (store mapRest!1582 mapKey!1582 mapValue!1582))))

(declare-fun b!30565 () Bool)

(declare-fun res!18438 () Bool)

(assert (=> b!30565 (=> (not res!18438) (not e!19582))))

(declare-fun arrayContainsKey!0 (array!1939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30565 (= res!18438 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30566 () Bool)

(declare-fun res!18437 () Bool)

(assert (=> b!30566 (=> (not res!18437) (not e!19582))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1651)

(declare-fun minValue!1443 () V!1651)

(declare-datatypes ((tuple2!1178 0))(
  ( (tuple2!1179 (_1!600 (_ BitVec 64)) (_2!600 V!1651)) )
))
(declare-datatypes ((List!760 0))(
  ( (Nil!757) (Cons!756 (h!1323 tuple2!1178) (t!3446 List!760)) )
))
(declare-datatypes ((ListLongMap!743 0))(
  ( (ListLongMap!744 (toList!387 List!760)) )
))
(declare-fun contains!328 (ListLongMap!743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!211 (array!1939 array!1937 (_ BitVec 32) (_ BitVec 32) V!1651 V!1651 (_ BitVec 32) Int) ListLongMap!743)

(assert (=> b!30566 (= res!18437 (not (contains!328 (getCurrentListMap!211 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1582 () Bool)

(assert (=> mapIsEmpty!1582 mapRes!1582))

(declare-fun b!30567 () Bool)

(declare-fun tp_is_empty!1369 () Bool)

(assert (=> b!30567 (= e!19581 tp_is_empty!1369)))

(declare-fun b!30568 () Bool)

(declare-fun res!18439 () Bool)

(assert (=> b!30568 (=> (not res!18439) (not e!19582))))

(declare-datatypes ((List!761 0))(
  ( (Nil!758) (Cons!757 (h!1324 (_ BitVec 64)) (t!3447 List!761)) )
))
(declare-fun arrayNoDuplicates!0 (array!1939 (_ BitVec 32) List!761) Bool)

(assert (=> b!30568 (= res!18439 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!758))))

(declare-fun res!18436 () Bool)

(assert (=> start!4100 (=> (not res!18436) (not e!19582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4100 (= res!18436 (validMask!0 mask!2294))))

(assert (=> start!4100 e!19582))

(assert (=> start!4100 true))

(assert (=> start!4100 tp!4465))

(declare-fun array_inv!645 (array!1937) Bool)

(assert (=> start!4100 (and (array_inv!645 _values!1501) e!19580)))

(declare-fun array_inv!646 (array!1939) Bool)

(assert (=> start!4100 (array_inv!646 _keys!1833)))

(assert (=> start!4100 tp_is_empty!1369))

(declare-fun b!30569 () Bool)

(declare-fun res!18433 () Bool)

(assert (=> b!30569 (=> (not res!18433) (not e!19582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1939 (_ BitVec 32)) Bool)

(assert (=> b!30569 (= res!18433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30570 () Bool)

(assert (=> b!30570 (= e!19578 tp_is_empty!1369)))

(assert (= (and start!4100 res!18436) b!30564))

(assert (= (and b!30564 res!18435) b!30569))

(assert (= (and b!30569 res!18433) b!30568))

(assert (= (and b!30568 res!18439) b!30563))

(assert (= (and b!30563 res!18434) b!30566))

(assert (= (and b!30566 res!18437) b!30565))

(assert (= (and b!30565 res!18438) b!30562))

(assert (= (and b!30561 condMapEmpty!1582) mapIsEmpty!1582))

(assert (= (and b!30561 (not condMapEmpty!1582)) mapNonEmpty!1582))

(get-info :version)

(assert (= (and mapNonEmpty!1582 ((_ is ValueCellFull!485) mapValue!1582)) b!30567))

(assert (= (and b!30561 ((_ is ValueCellFull!485) mapDefault!1582)) b!30570))

(assert (= start!4100 b!30561))

(declare-fun m!24513 () Bool)

(assert (=> b!30569 m!24513))

(declare-fun m!24515 () Bool)

(assert (=> b!30563 m!24515))

(declare-fun m!24517 () Bool)

(assert (=> b!30566 m!24517))

(assert (=> b!30566 m!24517))

(declare-fun m!24519 () Bool)

(assert (=> b!30566 m!24519))

(declare-fun m!24521 () Bool)

(assert (=> start!4100 m!24521))

(declare-fun m!24523 () Bool)

(assert (=> start!4100 m!24523))

(declare-fun m!24525 () Bool)

(assert (=> start!4100 m!24525))

(declare-fun m!24527 () Bool)

(assert (=> mapNonEmpty!1582 m!24527))

(declare-fun m!24529 () Bool)

(assert (=> b!30568 m!24529))

(declare-fun m!24531 () Bool)

(assert (=> b!30565 m!24531))

(declare-fun m!24533 () Bool)

(assert (=> b!30562 m!24533))

(check-sat (not mapNonEmpty!1582) (not b!30565) (not start!4100) b_and!1819 (not b!30566) (not b!30569) (not b!30562) (not b_next!1015) (not b!30563) (not b!30568) tp_is_empty!1369)
(check-sat b_and!1819 (not b_next!1015))
