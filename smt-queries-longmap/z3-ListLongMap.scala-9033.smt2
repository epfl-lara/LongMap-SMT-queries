; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108984 () Bool)

(assert start!108984)

(declare-fun b_free!28473 () Bool)

(declare-fun b_next!28473 () Bool)

(assert (=> start!108984 (= b_free!28473 (not b_next!28473))))

(declare-fun tp!100538 () Bool)

(declare-fun b_and!46563 () Bool)

(assert (=> start!108984 (= tp!100538 b_and!46563)))

(declare-fun b!1287828 () Bool)

(declare-fun res!855320 () Bool)

(declare-fun e!735426 () Bool)

(assert (=> b!1287828 (=> (not res!855320) (not e!735426))))

(declare-datatypes ((array!85274 0))(
  ( (array!85275 (arr!41138 (Array (_ BitVec 32) (_ BitVec 64))) (size!41688 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85274)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85274 (_ BitVec 32)) Bool)

(assert (=> b!1287828 (= res!855320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287829 () Bool)

(declare-fun res!855323 () Bool)

(assert (=> b!1287829 (=> (not res!855323) (not e!735426))))

(declare-datatypes ((V!50587 0))(
  ( (V!50588 (val!17131 Int)) )
))
(declare-datatypes ((ValueCell!16158 0))(
  ( (ValueCellFull!16158 (v!19734 V!50587)) (EmptyCell!16158) )
))
(declare-datatypes ((array!85276 0))(
  ( (array!85277 (arr!41139 (Array (_ BitVec 32) ValueCell!16158)) (size!41689 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85276)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287829 (= res!855323 (and (= (size!41689 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41688 _keys!1741) (size!41689 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287830 () Bool)

(declare-fun e!735424 () Bool)

(declare-fun e!735427 () Bool)

(declare-fun mapRes!52730 () Bool)

(assert (=> b!1287830 (= e!735424 (and e!735427 mapRes!52730))))

(declare-fun condMapEmpty!52730 () Bool)

(declare-fun mapDefault!52730 () ValueCell!16158)

(assert (=> b!1287830 (= condMapEmpty!52730 (= (arr!41139 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16158)) mapDefault!52730)))))

(declare-fun res!855321 () Bool)

(assert (=> start!108984 (=> (not res!855321) (not e!735426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108984 (= res!855321 (validMask!0 mask!2175))))

(assert (=> start!108984 e!735426))

(declare-fun tp_is_empty!34113 () Bool)

(assert (=> start!108984 tp_is_empty!34113))

(assert (=> start!108984 true))

(declare-fun array_inv!31197 (array!85276) Bool)

(assert (=> start!108984 (and (array_inv!31197 _values!1445) e!735424)))

(declare-fun array_inv!31198 (array!85274) Bool)

(assert (=> start!108984 (array_inv!31198 _keys!1741)))

(assert (=> start!108984 tp!100538))

(declare-fun b!1287831 () Bool)

(declare-fun res!855319 () Bool)

(assert (=> b!1287831 (=> (not res!855319) (not e!735426))))

(declare-datatypes ((List!29161 0))(
  ( (Nil!29158) (Cons!29157 (h!30366 (_ BitVec 64)) (t!42725 List!29161)) )
))
(declare-fun arrayNoDuplicates!0 (array!85274 (_ BitVec 32) List!29161) Bool)

(assert (=> b!1287831 (= res!855319 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29158))))

(declare-fun b!1287832 () Bool)

(assert (=> b!1287832 (= e!735426 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21984 0))(
  ( (tuple2!21985 (_1!11003 (_ BitVec 64)) (_2!11003 V!50587)) )
))
(declare-datatypes ((List!29162 0))(
  ( (Nil!29159) (Cons!29158 (h!30367 tuple2!21984) (t!42726 List!29162)) )
))
(declare-datatypes ((ListLongMap!19641 0))(
  ( (ListLongMap!19642 (toList!9836 List!29162)) )
))
(declare-fun contains!7954 (ListLongMap!19641 (_ BitVec 64)) Bool)

(assert (=> b!1287832 (not (contains!7954 (ListLongMap!19642 Nil!29159) k0!1205))))

(declare-datatypes ((Unit!42592 0))(
  ( (Unit!42593) )
))
(declare-fun lt!577901 () Unit!42592)

(declare-fun emptyContainsNothing!25 ((_ BitVec 64)) Unit!42592)

(assert (=> b!1287832 (= lt!577901 (emptyContainsNothing!25 k0!1205))))

(declare-fun mapIsEmpty!52730 () Bool)

(assert (=> mapIsEmpty!52730 mapRes!52730))

(declare-fun b!1287833 () Bool)

(declare-fun e!735428 () Bool)

(assert (=> b!1287833 (= e!735428 tp_is_empty!34113)))

(declare-fun b!1287834 () Bool)

(declare-fun res!855324 () Bool)

(assert (=> b!1287834 (=> (not res!855324) (not e!735426))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1287834 (= res!855324 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41688 _keys!1741))))))

(declare-fun b!1287835 () Bool)

(declare-fun res!855318 () Bool)

(assert (=> b!1287835 (=> (not res!855318) (not e!735426))))

(declare-fun minValue!1387 () V!50587)

(declare-fun zeroValue!1387 () V!50587)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4906 (array!85274 array!85276 (_ BitVec 32) (_ BitVec 32) V!50587 V!50587 (_ BitVec 32) Int) ListLongMap!19641)

(assert (=> b!1287835 (= res!855318 (contains!7954 (getCurrentListMap!4906 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287836 () Bool)

(declare-fun res!855317 () Bool)

(assert (=> b!1287836 (=> (not res!855317) (not e!735426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287836 (= res!855317 (not (validKeyInArray!0 (select (arr!41138 _keys!1741) from!2144))))))

(declare-fun b!1287837 () Bool)

(declare-fun res!855322 () Bool)

(assert (=> b!1287837 (=> (not res!855322) (not e!735426))))

(assert (=> b!1287837 (= res!855322 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41688 _keys!1741))))))

(declare-fun mapNonEmpty!52730 () Bool)

(declare-fun tp!100537 () Bool)

(assert (=> mapNonEmpty!52730 (= mapRes!52730 (and tp!100537 e!735428))))

(declare-fun mapValue!52730 () ValueCell!16158)

(declare-fun mapKey!52730 () (_ BitVec 32))

(declare-fun mapRest!52730 () (Array (_ BitVec 32) ValueCell!16158))

(assert (=> mapNonEmpty!52730 (= (arr!41139 _values!1445) (store mapRest!52730 mapKey!52730 mapValue!52730))))

(declare-fun b!1287838 () Bool)

(assert (=> b!1287838 (= e!735427 tp_is_empty!34113)))

(assert (= (and start!108984 res!855321) b!1287829))

(assert (= (and b!1287829 res!855323) b!1287828))

(assert (= (and b!1287828 res!855320) b!1287831))

(assert (= (and b!1287831 res!855319) b!1287837))

(assert (= (and b!1287837 res!855322) b!1287835))

(assert (= (and b!1287835 res!855318) b!1287834))

(assert (= (and b!1287834 res!855324) b!1287836))

(assert (= (and b!1287836 res!855317) b!1287832))

(assert (= (and b!1287830 condMapEmpty!52730) mapIsEmpty!52730))

(assert (= (and b!1287830 (not condMapEmpty!52730)) mapNonEmpty!52730))

(get-info :version)

(assert (= (and mapNonEmpty!52730 ((_ is ValueCellFull!16158) mapValue!52730)) b!1287833))

(assert (= (and b!1287830 ((_ is ValueCellFull!16158) mapDefault!52730)) b!1287838))

(assert (= start!108984 b!1287830))

(declare-fun m!1180583 () Bool)

(assert (=> mapNonEmpty!52730 m!1180583))

(declare-fun m!1180585 () Bool)

(assert (=> b!1287835 m!1180585))

(assert (=> b!1287835 m!1180585))

(declare-fun m!1180587 () Bool)

(assert (=> b!1287835 m!1180587))

(declare-fun m!1180589 () Bool)

(assert (=> b!1287828 m!1180589))

(declare-fun m!1180591 () Bool)

(assert (=> start!108984 m!1180591))

(declare-fun m!1180593 () Bool)

(assert (=> start!108984 m!1180593))

(declare-fun m!1180595 () Bool)

(assert (=> start!108984 m!1180595))

(declare-fun m!1180597 () Bool)

(assert (=> b!1287836 m!1180597))

(assert (=> b!1287836 m!1180597))

(declare-fun m!1180599 () Bool)

(assert (=> b!1287836 m!1180599))

(declare-fun m!1180601 () Bool)

(assert (=> b!1287832 m!1180601))

(declare-fun m!1180603 () Bool)

(assert (=> b!1287832 m!1180603))

(declare-fun m!1180605 () Bool)

(assert (=> b!1287831 m!1180605))

(check-sat (not b_next!28473) (not start!108984) (not b!1287828) b_and!46563 (not b!1287836) (not b!1287835) (not mapNonEmpty!52730) (not b!1287832) (not b!1287831) tp_is_empty!34113)
(check-sat b_and!46563 (not b_next!28473))
