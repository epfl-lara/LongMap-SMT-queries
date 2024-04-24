; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109176 () Bool)

(assert start!109176)

(declare-fun b_free!28441 () Bool)

(declare-fun b_next!28441 () Bool)

(assert (=> start!109176 (= b_free!28441 (not b_next!28441))))

(declare-fun tp!100442 () Bool)

(declare-fun b_and!46533 () Bool)

(assert (=> start!109176 (= tp!100442 b_and!46533)))

(declare-fun b!1288605 () Bool)

(declare-fun e!736033 () Bool)

(declare-fun e!736034 () Bool)

(declare-fun mapRes!52682 () Bool)

(assert (=> b!1288605 (= e!736033 (and e!736034 mapRes!52682))))

(declare-fun condMapEmpty!52682 () Bool)

(declare-datatypes ((V!50545 0))(
  ( (V!50546 (val!17115 Int)) )
))
(declare-datatypes ((ValueCell!16142 0))(
  ( (ValueCellFull!16142 (v!19713 V!50545)) (EmptyCell!16142) )
))
(declare-datatypes ((array!85249 0))(
  ( (array!85250 (arr!41121 (Array (_ BitVec 32) ValueCell!16142)) (size!41672 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85249)

(declare-fun mapDefault!52682 () ValueCell!16142)

(assert (=> b!1288605 (= condMapEmpty!52682 (= (arr!41121 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16142)) mapDefault!52682)))))

(declare-fun b!1288606 () Bool)

(declare-fun tp_is_empty!34081 () Bool)

(assert (=> b!1288606 (= e!736034 tp_is_empty!34081)))

(declare-fun mapIsEmpty!52682 () Bool)

(assert (=> mapIsEmpty!52682 mapRes!52682))

(declare-fun b!1288607 () Bool)

(declare-fun res!855458 () Bool)

(declare-fun e!736031 () Bool)

(assert (=> b!1288607 (=> (not res!855458) (not e!736031))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85251 0))(
  ( (array!85252 (arr!41122 (Array (_ BitVec 32) (_ BitVec 64))) (size!41673 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85251)

(assert (=> b!1288607 (= res!855458 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41673 _keys!1741))))))

(declare-fun b!1288609 () Bool)

(declare-fun res!855453 () Bool)

(assert (=> b!1288609 (=> (not res!855453) (not e!736031))))

(declare-fun minValue!1387 () V!50545)

(declare-fun zeroValue!1387 () V!50545)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21976 0))(
  ( (tuple2!21977 (_1!10999 (_ BitVec 64)) (_2!10999 V!50545)) )
))
(declare-datatypes ((List!29167 0))(
  ( (Nil!29164) (Cons!29163 (h!30381 tuple2!21976) (t!42723 List!29167)) )
))
(declare-datatypes ((ListLongMap!19641 0))(
  ( (ListLongMap!19642 (toList!9836 List!29167)) )
))
(declare-fun contains!7967 (ListLongMap!19641 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4890 (array!85251 array!85249 (_ BitVec 32) (_ BitVec 32) V!50545 V!50545 (_ BitVec 32) Int) ListLongMap!19641)

(assert (=> b!1288609 (= res!855453 (contains!7967 (getCurrentListMap!4890 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288610 () Bool)

(declare-fun res!855454 () Bool)

(assert (=> b!1288610 (=> (not res!855454) (not e!736031))))

(assert (=> b!1288610 (= res!855454 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41673 _keys!1741))))))

(declare-fun b!1288611 () Bool)

(declare-fun e!736035 () Bool)

(assert (=> b!1288611 (= e!736035 tp_is_empty!34081)))

(declare-fun b!1288612 () Bool)

(declare-fun res!855455 () Bool)

(assert (=> b!1288612 (=> (not res!855455) (not e!736031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288612 (= res!855455 (not (validKeyInArray!0 (select (arr!41122 _keys!1741) from!2144))))))

(declare-fun b!1288613 () Bool)

(declare-fun res!855456 () Bool)

(assert (=> b!1288613 (=> (not res!855456) (not e!736031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85251 (_ BitVec 32)) Bool)

(assert (=> b!1288613 (= res!855456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288614 () Bool)

(assert (=> b!1288614 (= e!736031 (not true))))

(assert (=> b!1288614 (not (contains!7967 (ListLongMap!19642 Nil!29164) k0!1205))))

(declare-datatypes ((Unit!42527 0))(
  ( (Unit!42528) )
))
(declare-fun lt!578337 () Unit!42527)

(declare-fun emptyContainsNothing!17 ((_ BitVec 64)) Unit!42527)

(assert (=> b!1288614 (= lt!578337 (emptyContainsNothing!17 k0!1205))))

(declare-fun b!1288615 () Bool)

(declare-fun res!855457 () Bool)

(assert (=> b!1288615 (=> (not res!855457) (not e!736031))))

(assert (=> b!1288615 (= res!855457 (and (= (size!41672 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41673 _keys!1741) (size!41672 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52682 () Bool)

(declare-fun tp!100441 () Bool)

(assert (=> mapNonEmpty!52682 (= mapRes!52682 (and tp!100441 e!736035))))

(declare-fun mapValue!52682 () ValueCell!16142)

(declare-fun mapRest!52682 () (Array (_ BitVec 32) ValueCell!16142))

(declare-fun mapKey!52682 () (_ BitVec 32))

(assert (=> mapNonEmpty!52682 (= (arr!41121 _values!1445) (store mapRest!52682 mapKey!52682 mapValue!52682))))

(declare-fun b!1288608 () Bool)

(declare-fun res!855459 () Bool)

(assert (=> b!1288608 (=> (not res!855459) (not e!736031))))

(declare-datatypes ((List!29168 0))(
  ( (Nil!29165) (Cons!29164 (h!30382 (_ BitVec 64)) (t!42724 List!29168)) )
))
(declare-fun arrayNoDuplicates!0 (array!85251 (_ BitVec 32) List!29168) Bool)

(assert (=> b!1288608 (= res!855459 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29165))))

(declare-fun res!855460 () Bool)

(assert (=> start!109176 (=> (not res!855460) (not e!736031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109176 (= res!855460 (validMask!0 mask!2175))))

(assert (=> start!109176 e!736031))

(assert (=> start!109176 tp_is_empty!34081))

(assert (=> start!109176 true))

(declare-fun array_inv!31389 (array!85249) Bool)

(assert (=> start!109176 (and (array_inv!31389 _values!1445) e!736033)))

(declare-fun array_inv!31390 (array!85251) Bool)

(assert (=> start!109176 (array_inv!31390 _keys!1741)))

(assert (=> start!109176 tp!100442))

(assert (= (and start!109176 res!855460) b!1288615))

(assert (= (and b!1288615 res!855457) b!1288613))

(assert (= (and b!1288613 res!855456) b!1288608))

(assert (= (and b!1288608 res!855459) b!1288610))

(assert (= (and b!1288610 res!855454) b!1288609))

(assert (= (and b!1288609 res!855453) b!1288607))

(assert (= (and b!1288607 res!855458) b!1288612))

(assert (= (and b!1288612 res!855455) b!1288614))

(assert (= (and b!1288605 condMapEmpty!52682) mapIsEmpty!52682))

(assert (= (and b!1288605 (not condMapEmpty!52682)) mapNonEmpty!52682))

(get-info :version)

(assert (= (and mapNonEmpty!52682 ((_ is ValueCellFull!16142) mapValue!52682)) b!1288611))

(assert (= (and b!1288605 ((_ is ValueCellFull!16142) mapDefault!52682)) b!1288606))

(assert (= start!109176 b!1288605))

(declare-fun m!1181817 () Bool)

(assert (=> b!1288613 m!1181817))

(declare-fun m!1181819 () Bool)

(assert (=> b!1288609 m!1181819))

(assert (=> b!1288609 m!1181819))

(declare-fun m!1181821 () Bool)

(assert (=> b!1288609 m!1181821))

(declare-fun m!1181823 () Bool)

(assert (=> b!1288608 m!1181823))

(declare-fun m!1181825 () Bool)

(assert (=> start!109176 m!1181825))

(declare-fun m!1181827 () Bool)

(assert (=> start!109176 m!1181827))

(declare-fun m!1181829 () Bool)

(assert (=> start!109176 m!1181829))

(declare-fun m!1181831 () Bool)

(assert (=> mapNonEmpty!52682 m!1181831))

(declare-fun m!1181833 () Bool)

(assert (=> b!1288612 m!1181833))

(assert (=> b!1288612 m!1181833))

(declare-fun m!1181835 () Bool)

(assert (=> b!1288612 m!1181835))

(declare-fun m!1181837 () Bool)

(assert (=> b!1288614 m!1181837))

(declare-fun m!1181839 () Bool)

(assert (=> b!1288614 m!1181839))

(check-sat (not b!1288613) (not b!1288609) (not mapNonEmpty!52682) tp_is_empty!34081 (not b_next!28441) (not b!1288612) (not b!1288614) b_and!46533 (not b!1288608) (not start!109176))
(check-sat b_and!46533 (not b_next!28441))
