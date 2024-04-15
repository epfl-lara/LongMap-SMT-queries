; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108498 () Bool)

(assert start!108498)

(declare-fun b_free!28045 () Bool)

(declare-fun b_next!28045 () Bool)

(assert (=> start!108498 (= b_free!28045 (not b_next!28045))))

(declare-fun tp!99245 () Bool)

(declare-fun b_and!46087 () Bool)

(assert (=> start!108498 (= tp!99245 b_and!46087)))

(declare-fun b!1280511 () Bool)

(declare-fun e!731673 () Bool)

(assert (=> b!1280511 (= e!731673 (not true))))

(declare-datatypes ((V!50017 0))(
  ( (V!50018 (val!16917 Int)) )
))
(declare-fun minValue!1387 () V!50017)

(declare-fun zeroValue!1387 () V!50017)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15944 0))(
  ( (ValueCellFull!15944 (v!19516 V!50017)) (EmptyCell!15944) )
))
(declare-datatypes ((array!84339 0))(
  ( (array!84340 (arr!40674 (Array (_ BitVec 32) ValueCell!15944)) (size!41226 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84339)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84341 0))(
  ( (array!84342 (arr!40675 (Array (_ BitVec 32) (_ BitVec 64))) (size!41227 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84341)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21724 0))(
  ( (tuple2!21725 (_1!10873 (_ BitVec 64)) (_2!10873 V!50017)) )
))
(declare-datatypes ((List!28917 0))(
  ( (Nil!28914) (Cons!28913 (h!30122 tuple2!21724) (t!42449 List!28917)) )
))
(declare-datatypes ((ListLongMap!19381 0))(
  ( (ListLongMap!19382 (toList!9706 List!28917)) )
))
(declare-fun contains!7751 (ListLongMap!19381 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4680 (array!84341 array!84339 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 32) Int) ListLongMap!19381)

(assert (=> b!1280511 (contains!7751 (getCurrentListMap!4680 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42245 0))(
  ( (Unit!42246) )
))
(declare-fun lt!575962 () Unit!42245)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!4 (array!84341 array!84339 (_ BitVec 32) (_ BitVec 32) V!50017 V!50017 (_ BitVec 64) (_ BitVec 32) Int) Unit!42245)

(assert (=> b!1280511 (= lt!575962 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!4 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280512 () Bool)

(declare-fun res!850606 () Bool)

(assert (=> b!1280512 (=> (not res!850606) (not e!731673))))

(assert (=> b!1280512 (= res!850606 (contains!7751 (getCurrentListMap!4680 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52079 () Bool)

(declare-fun mapRes!52079 () Bool)

(declare-fun tp!99246 () Bool)

(declare-fun e!731672 () Bool)

(assert (=> mapNonEmpty!52079 (= mapRes!52079 (and tp!99246 e!731672))))

(declare-fun mapRest!52079 () (Array (_ BitVec 32) ValueCell!15944))

(declare-fun mapKey!52079 () (_ BitVec 32))

(declare-fun mapValue!52079 () ValueCell!15944)

(assert (=> mapNonEmpty!52079 (= (arr!40674 _values!1445) (store mapRest!52079 mapKey!52079 mapValue!52079))))

(declare-fun b!1280513 () Bool)

(declare-fun tp_is_empty!33685 () Bool)

(assert (=> b!1280513 (= e!731672 tp_is_empty!33685)))

(declare-fun b!1280514 () Bool)

(declare-fun res!850603 () Bool)

(assert (=> b!1280514 (=> (not res!850603) (not e!731673))))

(assert (=> b!1280514 (= res!850603 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41227 _keys!1741)) (not (= (select (arr!40675 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280515 () Bool)

(declare-fun e!731676 () Bool)

(declare-fun e!731675 () Bool)

(assert (=> b!1280515 (= e!731676 (and e!731675 mapRes!52079))))

(declare-fun condMapEmpty!52079 () Bool)

(declare-fun mapDefault!52079 () ValueCell!15944)

(assert (=> b!1280515 (= condMapEmpty!52079 (= (arr!40674 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15944)) mapDefault!52079)))))

(declare-fun b!1280516 () Bool)

(assert (=> b!1280516 (= e!731675 tp_is_empty!33685)))

(declare-fun b!1280517 () Bool)

(declare-fun res!850602 () Bool)

(assert (=> b!1280517 (=> (not res!850602) (not e!731673))))

(assert (=> b!1280517 (= res!850602 (and (= (size!41226 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41227 _keys!1741) (size!41226 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280518 () Bool)

(declare-fun res!850604 () Bool)

(assert (=> b!1280518 (=> (not res!850604) (not e!731673))))

(assert (=> b!1280518 (= res!850604 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41227 _keys!1741))))))

(declare-fun res!850607 () Bool)

(assert (=> start!108498 (=> (not res!850607) (not e!731673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108498 (= res!850607 (validMask!0 mask!2175))))

(assert (=> start!108498 e!731673))

(assert (=> start!108498 tp_is_empty!33685))

(assert (=> start!108498 true))

(declare-fun array_inv!31037 (array!84339) Bool)

(assert (=> start!108498 (and (array_inv!31037 _values!1445) e!731676)))

(declare-fun array_inv!31038 (array!84341) Bool)

(assert (=> start!108498 (array_inv!31038 _keys!1741)))

(assert (=> start!108498 tp!99245))

(declare-fun mapIsEmpty!52079 () Bool)

(assert (=> mapIsEmpty!52079 mapRes!52079))

(declare-fun b!1280519 () Bool)

(declare-fun res!850601 () Bool)

(assert (=> b!1280519 (=> (not res!850601) (not e!731673))))

(declare-datatypes ((List!28918 0))(
  ( (Nil!28915) (Cons!28914 (h!30123 (_ BitVec 64)) (t!42450 List!28918)) )
))
(declare-fun arrayNoDuplicates!0 (array!84341 (_ BitVec 32) List!28918) Bool)

(assert (=> b!1280519 (= res!850601 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28915))))

(declare-fun b!1280520 () Bool)

(declare-fun res!850605 () Bool)

(assert (=> b!1280520 (=> (not res!850605) (not e!731673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84341 (_ BitVec 32)) Bool)

(assert (=> b!1280520 (= res!850605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108498 res!850607) b!1280517))

(assert (= (and b!1280517 res!850602) b!1280520))

(assert (= (and b!1280520 res!850605) b!1280519))

(assert (= (and b!1280519 res!850601) b!1280518))

(assert (= (and b!1280518 res!850604) b!1280512))

(assert (= (and b!1280512 res!850606) b!1280514))

(assert (= (and b!1280514 res!850603) b!1280511))

(assert (= (and b!1280515 condMapEmpty!52079) mapIsEmpty!52079))

(assert (= (and b!1280515 (not condMapEmpty!52079)) mapNonEmpty!52079))

(get-info :version)

(assert (= (and mapNonEmpty!52079 ((_ is ValueCellFull!15944) mapValue!52079)) b!1280513))

(assert (= (and b!1280515 ((_ is ValueCellFull!15944) mapDefault!52079)) b!1280516))

(assert (= start!108498 b!1280515))

(declare-fun m!1174665 () Bool)

(assert (=> mapNonEmpty!52079 m!1174665))

(declare-fun m!1174667 () Bool)

(assert (=> start!108498 m!1174667))

(declare-fun m!1174669 () Bool)

(assert (=> start!108498 m!1174669))

(declare-fun m!1174671 () Bool)

(assert (=> start!108498 m!1174671))

(declare-fun m!1174673 () Bool)

(assert (=> b!1280514 m!1174673))

(declare-fun m!1174675 () Bool)

(assert (=> b!1280511 m!1174675))

(assert (=> b!1280511 m!1174675))

(declare-fun m!1174677 () Bool)

(assert (=> b!1280511 m!1174677))

(declare-fun m!1174679 () Bool)

(assert (=> b!1280511 m!1174679))

(declare-fun m!1174681 () Bool)

(assert (=> b!1280520 m!1174681))

(declare-fun m!1174683 () Bool)

(assert (=> b!1280519 m!1174683))

(declare-fun m!1174685 () Bool)

(assert (=> b!1280512 m!1174685))

(assert (=> b!1280512 m!1174685))

(declare-fun m!1174687 () Bool)

(assert (=> b!1280512 m!1174687))

(check-sat (not b!1280511) (not b!1280520) tp_is_empty!33685 (not mapNonEmpty!52079) (not b_next!28045) (not b!1280512) (not start!108498) (not b!1280519) b_and!46087)
(check-sat b_and!46087 (not b_next!28045))
