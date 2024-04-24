; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108996 () Bool)

(assert start!108996)

(declare-fun b_free!28285 () Bool)

(declare-fun b_next!28285 () Bool)

(assert (=> start!108996 (= b_free!28285 (not b_next!28285))))

(declare-fun tp!99970 () Bool)

(declare-fun b_and!46353 () Bool)

(assert (=> start!108996 (= tp!99970 b_and!46353)))

(declare-fun mapNonEmpty!52445 () Bool)

(declare-fun mapRes!52445 () Bool)

(declare-fun tp!99971 () Bool)

(declare-fun e!734547 () Bool)

(assert (=> mapNonEmpty!52445 (= mapRes!52445 (and tp!99971 e!734547))))

(declare-datatypes ((V!50337 0))(
  ( (V!50338 (val!17037 Int)) )
))
(declare-datatypes ((ValueCell!16064 0))(
  ( (ValueCellFull!16064 (v!19634 V!50337)) (EmptyCell!16064) )
))
(declare-fun mapValue!52445 () ValueCell!16064)

(declare-fun mapKey!52445 () (_ BitVec 32))

(declare-fun mapRest!52445 () (Array (_ BitVec 32) ValueCell!16064))

(declare-datatypes ((array!84937 0))(
  ( (array!84938 (arr!40966 (Array (_ BitVec 32) ValueCell!16064)) (size!41517 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84937)

(assert (=> mapNonEmpty!52445 (= (arr!40966 _values!1445) (store mapRest!52445 mapKey!52445 mapValue!52445))))

(declare-fun b!1285757 () Bool)

(declare-fun res!853799 () Bool)

(declare-fun e!734543 () Bool)

(assert (=> b!1285757 (=> (not res!853799) (not e!734543))))

(declare-datatypes ((array!84939 0))(
  ( (array!84940 (arr!40967 (Array (_ BitVec 32) (_ BitVec 64))) (size!41518 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84939)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84939 (_ BitVec 32)) Bool)

(assert (=> b!1285757 (= res!853799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285758 () Bool)

(declare-fun tp_is_empty!33925 () Bool)

(assert (=> b!1285758 (= e!734547 tp_is_empty!33925)))

(declare-fun mapIsEmpty!52445 () Bool)

(assert (=> mapIsEmpty!52445 mapRes!52445))

(declare-fun b!1285759 () Bool)

(declare-fun e!734546 () Bool)

(declare-fun e!734545 () Bool)

(assert (=> b!1285759 (= e!734546 (and e!734545 mapRes!52445))))

(declare-fun condMapEmpty!52445 () Bool)

(declare-fun mapDefault!52445 () ValueCell!16064)

(assert (=> b!1285759 (= condMapEmpty!52445 (= (arr!40966 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16064)) mapDefault!52445)))))

(declare-fun b!1285761 () Bool)

(declare-fun res!853798 () Bool)

(assert (=> b!1285761 (=> (not res!853798) (not e!734543))))

(declare-datatypes ((List!29056 0))(
  ( (Nil!29053) (Cons!29052 (h!30270 (_ BitVec 64)) (t!42592 List!29056)) )
))
(declare-fun arrayNoDuplicates!0 (array!84939 (_ BitVec 32) List!29056) Bool)

(assert (=> b!1285761 (= res!853798 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29053))))

(declare-fun b!1285762 () Bool)

(declare-fun res!853801 () Bool)

(assert (=> b!1285762 (=> (not res!853801) (not e!734543))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1285762 (= res!853801 (and (= (size!41517 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41518 _keys!1741) (size!41517 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285763 () Bool)

(declare-fun res!853800 () Bool)

(assert (=> b!1285763 (=> (not res!853800) (not e!734543))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1285763 (= res!853800 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41518 _keys!1741))))))

(declare-fun b!1285764 () Bool)

(assert (=> b!1285764 (= e!734543 false)))

(declare-fun minValue!1387 () V!50337)

(declare-fun zeroValue!1387 () V!50337)

(declare-fun lt!577298 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21850 0))(
  ( (tuple2!21851 (_1!10936 (_ BitVec 64)) (_2!10936 V!50337)) )
))
(declare-datatypes ((List!29057 0))(
  ( (Nil!29054) (Cons!29053 (h!30271 tuple2!21850) (t!42593 List!29057)) )
))
(declare-datatypes ((ListLongMap!19515 0))(
  ( (ListLongMap!19516 (toList!9773 List!29057)) )
))
(declare-fun contains!7904 (ListLongMap!19515 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4837 (array!84939 array!84937 (_ BitVec 32) (_ BitVec 32) V!50337 V!50337 (_ BitVec 32) Int) ListLongMap!19515)

(assert (=> b!1285764 (= lt!577298 (contains!7904 (getCurrentListMap!4837 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285760 () Bool)

(assert (=> b!1285760 (= e!734545 tp_is_empty!33925)))

(declare-fun res!853797 () Bool)

(assert (=> start!108996 (=> (not res!853797) (not e!734543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108996 (= res!853797 (validMask!0 mask!2175))))

(assert (=> start!108996 e!734543))

(assert (=> start!108996 tp_is_empty!33925))

(assert (=> start!108996 true))

(declare-fun array_inv!31287 (array!84937) Bool)

(assert (=> start!108996 (and (array_inv!31287 _values!1445) e!734546)))

(declare-fun array_inv!31288 (array!84939) Bool)

(assert (=> start!108996 (array_inv!31288 _keys!1741)))

(assert (=> start!108996 tp!99970))

(assert (= (and start!108996 res!853797) b!1285762))

(assert (= (and b!1285762 res!853801) b!1285757))

(assert (= (and b!1285757 res!853799) b!1285761))

(assert (= (and b!1285761 res!853798) b!1285763))

(assert (= (and b!1285763 res!853800) b!1285764))

(assert (= (and b!1285759 condMapEmpty!52445) mapIsEmpty!52445))

(assert (= (and b!1285759 (not condMapEmpty!52445)) mapNonEmpty!52445))

(get-info :version)

(assert (= (and mapNonEmpty!52445 ((_ is ValueCellFull!16064) mapValue!52445)) b!1285758))

(assert (= (and b!1285759 ((_ is ValueCellFull!16064) mapDefault!52445)) b!1285760))

(assert (= start!108996 b!1285759))

(declare-fun m!1179745 () Bool)

(assert (=> start!108996 m!1179745))

(declare-fun m!1179747 () Bool)

(assert (=> start!108996 m!1179747))

(declare-fun m!1179749 () Bool)

(assert (=> start!108996 m!1179749))

(declare-fun m!1179751 () Bool)

(assert (=> b!1285757 m!1179751))

(declare-fun m!1179753 () Bool)

(assert (=> b!1285764 m!1179753))

(assert (=> b!1285764 m!1179753))

(declare-fun m!1179755 () Bool)

(assert (=> b!1285764 m!1179755))

(declare-fun m!1179757 () Bool)

(assert (=> b!1285761 m!1179757))

(declare-fun m!1179759 () Bool)

(assert (=> mapNonEmpty!52445 m!1179759))

(check-sat tp_is_empty!33925 (not b!1285761) b_and!46353 (not mapNonEmpty!52445) (not b!1285764) (not b!1285757) (not b_next!28285) (not start!108996))
(check-sat b_and!46353 (not b_next!28285))
