; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108494 () Bool)

(assert start!108494)

(declare-fun b_free!28041 () Bool)

(declare-fun b_next!28041 () Bool)

(assert (=> start!108494 (= b_free!28041 (not b_next!28041))))

(declare-fun tp!99232 () Bool)

(declare-fun b_and!46101 () Bool)

(assert (=> start!108494 (= tp!99232 b_and!46101)))

(declare-fun mapIsEmpty!52073 () Bool)

(declare-fun mapRes!52073 () Bool)

(assert (=> mapIsEmpty!52073 mapRes!52073))

(declare-fun b!1280515 () Bool)

(declare-fun e!731675 () Bool)

(assert (=> b!1280515 (= e!731675 (not true))))

(declare-datatypes ((V!50011 0))(
  ( (V!50012 (val!16915 Int)) )
))
(declare-fun minValue!1387 () V!50011)

(declare-fun zeroValue!1387 () V!50011)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15942 0))(
  ( (ValueCellFull!15942 (v!19515 V!50011)) (EmptyCell!15942) )
))
(declare-datatypes ((array!84438 0))(
  ( (array!84439 (arr!40723 (Array (_ BitVec 32) ValueCell!15942)) (size!41273 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84438)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84440 0))(
  ( (array!84441 (arr!40724 (Array (_ BitVec 32) (_ BitVec 64))) (size!41274 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84440)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21648 0))(
  ( (tuple2!21649 (_1!10835 (_ BitVec 64)) (_2!10835 V!50011)) )
))
(declare-datatypes ((List!28846 0))(
  ( (Nil!28843) (Cons!28842 (h!30051 tuple2!21648) (t!42386 List!28846)) )
))
(declare-datatypes ((ListLongMap!19305 0))(
  ( (ListLongMap!19306 (toList!9668 List!28846)) )
))
(declare-fun contains!7783 (ListLongMap!19305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4752 (array!84440 array!84438 (_ BitVec 32) (_ BitVec 32) V!50011 V!50011 (_ BitVec 32) Int) ListLongMap!19305)

(assert (=> b!1280515 (contains!7783 (getCurrentListMap!4752 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42393 0))(
  ( (Unit!42394) )
))
(declare-fun lt!576134 () Unit!42393)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 (array!84440 array!84438 (_ BitVec 32) (_ BitVec 32) V!50011 V!50011 (_ BitVec 64) (_ BitVec 32) Int) Unit!42393)

(assert (=> b!1280515 (= lt!576134 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!1 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1280516 () Bool)

(declare-fun e!731673 () Bool)

(declare-fun e!731671 () Bool)

(assert (=> b!1280516 (= e!731673 (and e!731671 mapRes!52073))))

(declare-fun condMapEmpty!52073 () Bool)

(declare-fun mapDefault!52073 () ValueCell!15942)

(assert (=> b!1280516 (= condMapEmpty!52073 (= (arr!40723 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15942)) mapDefault!52073)))))

(declare-fun b!1280517 () Bool)

(declare-fun res!850588 () Bool)

(assert (=> b!1280517 (=> (not res!850588) (not e!731675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84440 (_ BitVec 32)) Bool)

(assert (=> b!1280517 (= res!850588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52073 () Bool)

(declare-fun tp!99233 () Bool)

(declare-fun e!731674 () Bool)

(assert (=> mapNonEmpty!52073 (= mapRes!52073 (and tp!99233 e!731674))))

(declare-fun mapRest!52073 () (Array (_ BitVec 32) ValueCell!15942))

(declare-fun mapValue!52073 () ValueCell!15942)

(declare-fun mapKey!52073 () (_ BitVec 32))

(assert (=> mapNonEmpty!52073 (= (arr!40723 _values!1445) (store mapRest!52073 mapKey!52073 mapValue!52073))))

(declare-fun b!1280518 () Bool)

(declare-fun res!850592 () Bool)

(assert (=> b!1280518 (=> (not res!850592) (not e!731675))))

(declare-datatypes ((List!28847 0))(
  ( (Nil!28844) (Cons!28843 (h!30052 (_ BitVec 64)) (t!42387 List!28847)) )
))
(declare-fun arrayNoDuplicates!0 (array!84440 (_ BitVec 32) List!28847) Bool)

(assert (=> b!1280518 (= res!850592 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28844))))

(declare-fun res!850590 () Bool)

(assert (=> start!108494 (=> (not res!850590) (not e!731675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108494 (= res!850590 (validMask!0 mask!2175))))

(assert (=> start!108494 e!731675))

(declare-fun tp_is_empty!33681 () Bool)

(assert (=> start!108494 tp_is_empty!33681))

(assert (=> start!108494 true))

(declare-fun array_inv!30905 (array!84438) Bool)

(assert (=> start!108494 (and (array_inv!30905 _values!1445) e!731673)))

(declare-fun array_inv!30906 (array!84440) Bool)

(assert (=> start!108494 (array_inv!30906 _keys!1741)))

(assert (=> start!108494 tp!99232))

(declare-fun b!1280519 () Bool)

(declare-fun res!850591 () Bool)

(assert (=> b!1280519 (=> (not res!850591) (not e!731675))))

(assert (=> b!1280519 (= res!850591 (contains!7783 (getCurrentListMap!4752 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1280520 () Bool)

(declare-fun res!850589 () Bool)

(assert (=> b!1280520 (=> (not res!850589) (not e!731675))))

(assert (=> b!1280520 (= res!850589 (and (= (size!41273 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41274 _keys!1741) (size!41273 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280521 () Bool)

(assert (=> b!1280521 (= e!731674 tp_is_empty!33681)))

(declare-fun b!1280522 () Bool)

(assert (=> b!1280522 (= e!731671 tp_is_empty!33681)))

(declare-fun b!1280523 () Bool)

(declare-fun res!850587 () Bool)

(assert (=> b!1280523 (=> (not res!850587) (not e!731675))))

(assert (=> b!1280523 (= res!850587 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41274 _keys!1741)) (not (= (select (arr!40724 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1280524 () Bool)

(declare-fun res!850586 () Bool)

(assert (=> b!1280524 (=> (not res!850586) (not e!731675))))

(assert (=> b!1280524 (= res!850586 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41274 _keys!1741))))))

(assert (= (and start!108494 res!850590) b!1280520))

(assert (= (and b!1280520 res!850589) b!1280517))

(assert (= (and b!1280517 res!850588) b!1280518))

(assert (= (and b!1280518 res!850592) b!1280524))

(assert (= (and b!1280524 res!850586) b!1280519))

(assert (= (and b!1280519 res!850591) b!1280523))

(assert (= (and b!1280523 res!850587) b!1280515))

(assert (= (and b!1280516 condMapEmpty!52073) mapIsEmpty!52073))

(assert (= (and b!1280516 (not condMapEmpty!52073)) mapNonEmpty!52073))

(get-info :version)

(assert (= (and mapNonEmpty!52073 ((_ is ValueCellFull!15942) mapValue!52073)) b!1280521))

(assert (= (and b!1280516 ((_ is ValueCellFull!15942) mapDefault!52073)) b!1280522))

(assert (= start!108494 b!1280516))

(declare-fun m!1175117 () Bool)

(assert (=> mapNonEmpty!52073 m!1175117))

(declare-fun m!1175119 () Bool)

(assert (=> b!1280517 m!1175119))

(declare-fun m!1175121 () Bool)

(assert (=> b!1280515 m!1175121))

(assert (=> b!1280515 m!1175121))

(declare-fun m!1175123 () Bool)

(assert (=> b!1280515 m!1175123))

(declare-fun m!1175125 () Bool)

(assert (=> b!1280515 m!1175125))

(declare-fun m!1175127 () Bool)

(assert (=> b!1280523 m!1175127))

(declare-fun m!1175129 () Bool)

(assert (=> b!1280519 m!1175129))

(assert (=> b!1280519 m!1175129))

(declare-fun m!1175131 () Bool)

(assert (=> b!1280519 m!1175131))

(declare-fun m!1175133 () Bool)

(assert (=> start!108494 m!1175133))

(declare-fun m!1175135 () Bool)

(assert (=> start!108494 m!1175135))

(declare-fun m!1175137 () Bool)

(assert (=> start!108494 m!1175137))

(declare-fun m!1175139 () Bool)

(assert (=> b!1280518 m!1175139))

(check-sat (not start!108494) (not b_next!28041) (not b!1280517) (not b!1280518) (not b!1280519) (not b!1280515) b_and!46101 (not mapNonEmpty!52073) tp_is_empty!33681)
(check-sat b_and!46101 (not b_next!28041))
