; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109002 () Bool)

(assert start!109002)

(declare-fun b_free!28491 () Bool)

(declare-fun b_next!28491 () Bool)

(assert (=> start!109002 (= b_free!28491 (not b_next!28491))))

(declare-fun tp!100592 () Bool)

(declare-fun b_and!46581 () Bool)

(assert (=> start!109002 (= tp!100592 b_and!46581)))

(declare-fun b!1288125 () Bool)

(declare-fun res!855540 () Bool)

(declare-fun e!735562 () Bool)

(assert (=> b!1288125 (=> (not res!855540) (not e!735562))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85310 0))(
  ( (array!85311 (arr!41156 (Array (_ BitVec 32) (_ BitVec 64))) (size!41706 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85310)

(assert (=> b!1288125 (= res!855540 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41706 _keys!1741))))))

(declare-fun mapIsEmpty!52757 () Bool)

(declare-fun mapRes!52757 () Bool)

(assert (=> mapIsEmpty!52757 mapRes!52757))

(declare-fun b!1288126 () Bool)

(declare-fun res!855538 () Bool)

(assert (=> b!1288126 (=> (not res!855538) (not e!735562))))

(declare-datatypes ((V!50611 0))(
  ( (V!50612 (val!17140 Int)) )
))
(declare-fun minValue!1387 () V!50611)

(declare-fun zeroValue!1387 () V!50611)

(declare-datatypes ((ValueCell!16167 0))(
  ( (ValueCellFull!16167 (v!19743 V!50611)) (EmptyCell!16167) )
))
(declare-datatypes ((array!85312 0))(
  ( (array!85313 (arr!41157 (Array (_ BitVec 32) ValueCell!16167)) (size!41707 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85312)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22000 0))(
  ( (tuple2!22001 (_1!11011 (_ BitVec 64)) (_2!11011 V!50611)) )
))
(declare-datatypes ((List!29174 0))(
  ( (Nil!29171) (Cons!29170 (h!30379 tuple2!22000) (t!42738 List!29174)) )
))
(declare-datatypes ((ListLongMap!19657 0))(
  ( (ListLongMap!19658 (toList!9844 List!29174)) )
))
(declare-fun contains!7962 (ListLongMap!19657 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4912 (array!85310 array!85312 (_ BitVec 32) (_ BitVec 32) V!50611 V!50611 (_ BitVec 32) Int) ListLongMap!19657)

(assert (=> b!1288126 (= res!855538 (contains!7962 (getCurrentListMap!4912 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288127 () Bool)

(declare-fun e!735561 () Bool)

(declare-fun tp_is_empty!34131 () Bool)

(assert (=> b!1288127 (= e!735561 tp_is_empty!34131)))

(declare-fun res!855539 () Bool)

(assert (=> start!109002 (=> (not res!855539) (not e!735562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109002 (= res!855539 (validMask!0 mask!2175))))

(assert (=> start!109002 e!735562))

(assert (=> start!109002 tp_is_empty!34131))

(assert (=> start!109002 true))

(declare-fun e!735560 () Bool)

(declare-fun array_inv!31211 (array!85312) Bool)

(assert (=> start!109002 (and (array_inv!31211 _values!1445) e!735560)))

(declare-fun array_inv!31212 (array!85310) Bool)

(assert (=> start!109002 (array_inv!31212 _keys!1741)))

(assert (=> start!109002 tp!100592))

(declare-fun b!1288128 () Bool)

(declare-fun res!855533 () Bool)

(assert (=> b!1288128 (=> (not res!855533) (not e!735562))))

(assert (=> b!1288128 (= res!855533 (and (= (size!41707 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41706 _keys!1741) (size!41707 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288129 () Bool)

(assert (=> b!1288129 (= e!735562 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle from!2144 (size!41706 _keys!1741)))))))

(assert (=> b!1288129 (not (contains!7962 (ListLongMap!19658 Nil!29171) k0!1205))))

(declare-datatypes ((Unit!42608 0))(
  ( (Unit!42609) )
))
(declare-fun lt!577928 () Unit!42608)

(declare-fun emptyContainsNothing!33 ((_ BitVec 64)) Unit!42608)

(assert (=> b!1288129 (= lt!577928 (emptyContainsNothing!33 k0!1205))))

(declare-fun b!1288130 () Bool)

(declare-fun res!855537 () Bool)

(assert (=> b!1288130 (=> (not res!855537) (not e!735562))))

(assert (=> b!1288130 (= res!855537 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41706 _keys!1741))))))

(declare-fun b!1288131 () Bool)

(declare-fun res!855534 () Bool)

(assert (=> b!1288131 (=> (not res!855534) (not e!735562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288131 (= res!855534 (not (validKeyInArray!0 (select (arr!41156 _keys!1741) from!2144))))))

(declare-fun b!1288132 () Bool)

(declare-fun res!855535 () Bool)

(assert (=> b!1288132 (=> (not res!855535) (not e!735562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85310 (_ BitVec 32)) Bool)

(assert (=> b!1288132 (= res!855535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288133 () Bool)

(declare-fun e!735559 () Bool)

(assert (=> b!1288133 (= e!735559 tp_is_empty!34131)))

(declare-fun b!1288134 () Bool)

(declare-fun res!855536 () Bool)

(assert (=> b!1288134 (=> (not res!855536) (not e!735562))))

(declare-datatypes ((List!29175 0))(
  ( (Nil!29172) (Cons!29171 (h!30380 (_ BitVec 64)) (t!42739 List!29175)) )
))
(declare-fun arrayNoDuplicates!0 (array!85310 (_ BitVec 32) List!29175) Bool)

(assert (=> b!1288134 (= res!855536 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29172))))

(declare-fun mapNonEmpty!52757 () Bool)

(declare-fun tp!100591 () Bool)

(assert (=> mapNonEmpty!52757 (= mapRes!52757 (and tp!100591 e!735559))))

(declare-fun mapRest!52757 () (Array (_ BitVec 32) ValueCell!16167))

(declare-fun mapKey!52757 () (_ BitVec 32))

(declare-fun mapValue!52757 () ValueCell!16167)

(assert (=> mapNonEmpty!52757 (= (arr!41157 _values!1445) (store mapRest!52757 mapKey!52757 mapValue!52757))))

(declare-fun b!1288135 () Bool)

(assert (=> b!1288135 (= e!735560 (and e!735561 mapRes!52757))))

(declare-fun condMapEmpty!52757 () Bool)

(declare-fun mapDefault!52757 () ValueCell!16167)

(assert (=> b!1288135 (= condMapEmpty!52757 (= (arr!41157 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16167)) mapDefault!52757)))))

(assert (= (and start!109002 res!855539) b!1288128))

(assert (= (and b!1288128 res!855533) b!1288132))

(assert (= (and b!1288132 res!855535) b!1288134))

(assert (= (and b!1288134 res!855536) b!1288130))

(assert (= (and b!1288130 res!855537) b!1288126))

(assert (= (and b!1288126 res!855538) b!1288125))

(assert (= (and b!1288125 res!855540) b!1288131))

(assert (= (and b!1288131 res!855534) b!1288129))

(assert (= (and b!1288135 condMapEmpty!52757) mapIsEmpty!52757))

(assert (= (and b!1288135 (not condMapEmpty!52757)) mapNonEmpty!52757))

(get-info :version)

(assert (= (and mapNonEmpty!52757 ((_ is ValueCellFull!16167) mapValue!52757)) b!1288133))

(assert (= (and b!1288135 ((_ is ValueCellFull!16167) mapDefault!52757)) b!1288127))

(assert (= start!109002 b!1288135))

(declare-fun m!1180799 () Bool)

(assert (=> start!109002 m!1180799))

(declare-fun m!1180801 () Bool)

(assert (=> start!109002 m!1180801))

(declare-fun m!1180803 () Bool)

(assert (=> start!109002 m!1180803))

(declare-fun m!1180805 () Bool)

(assert (=> b!1288129 m!1180805))

(declare-fun m!1180807 () Bool)

(assert (=> b!1288129 m!1180807))

(declare-fun m!1180809 () Bool)

(assert (=> mapNonEmpty!52757 m!1180809))

(declare-fun m!1180811 () Bool)

(assert (=> b!1288134 m!1180811))

(declare-fun m!1180813 () Bool)

(assert (=> b!1288131 m!1180813))

(assert (=> b!1288131 m!1180813))

(declare-fun m!1180815 () Bool)

(assert (=> b!1288131 m!1180815))

(declare-fun m!1180817 () Bool)

(assert (=> b!1288132 m!1180817))

(declare-fun m!1180819 () Bool)

(assert (=> b!1288126 m!1180819))

(assert (=> b!1288126 m!1180819))

(declare-fun m!1180821 () Bool)

(assert (=> b!1288126 m!1180821))

(check-sat (not b!1288131) (not b!1288129) (not b!1288134) b_and!46581 (not b!1288132) (not b!1288126) (not start!109002) tp_is_empty!34131 (not mapNonEmpty!52757) (not b_next!28491))
(check-sat b_and!46581 (not b_next!28491))
