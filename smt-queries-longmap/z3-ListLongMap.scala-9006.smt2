; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108796 () Bool)

(assert start!108796)

(declare-fun b_free!28309 () Bool)

(declare-fun b_next!28309 () Bool)

(assert (=> start!108796 (= b_free!28309 (not b_next!28309))))

(declare-fun tp!100044 () Bool)

(declare-fun b_and!46357 () Bool)

(assert (=> start!108796 (= tp!100044 b_and!46357)))

(declare-fun res!853433 () Bool)

(declare-fun e!733849 () Bool)

(assert (=> start!108796 (=> (not res!853433) (not e!733849))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108796 (= res!853433 (validMask!0 mask!2175))))

(assert (=> start!108796 e!733849))

(declare-fun tp_is_empty!33949 () Bool)

(assert (=> start!108796 tp_is_empty!33949))

(assert (=> start!108796 true))

(declare-datatypes ((V!50369 0))(
  ( (V!50370 (val!17049 Int)) )
))
(declare-datatypes ((ValueCell!16076 0))(
  ( (ValueCellFull!16076 (v!19650 V!50369)) (EmptyCell!16076) )
))
(declare-datatypes ((array!84847 0))(
  ( (array!84848 (arr!40926 (Array (_ BitVec 32) ValueCell!16076)) (size!41478 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84847)

(declare-fun e!733851 () Bool)

(declare-fun array_inv!31203 (array!84847) Bool)

(assert (=> start!108796 (and (array_inv!31203 _values!1445) e!733851)))

(declare-datatypes ((array!84849 0))(
  ( (array!84850 (arr!40927 (Array (_ BitVec 32) (_ BitVec 64))) (size!41479 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84849)

(declare-fun array_inv!31204 (array!84849) Bool)

(assert (=> start!108796 (array_inv!31204 _keys!1741)))

(assert (=> start!108796 tp!100044))

(declare-fun mapNonEmpty!52481 () Bool)

(declare-fun mapRes!52481 () Bool)

(declare-fun tp!100043 () Bool)

(declare-fun e!733850 () Bool)

(assert (=> mapNonEmpty!52481 (= mapRes!52481 (and tp!100043 e!733850))))

(declare-fun mapValue!52481 () ValueCell!16076)

(declare-fun mapKey!52481 () (_ BitVec 32))

(declare-fun mapRest!52481 () (Array (_ BitVec 32) ValueCell!16076))

(assert (=> mapNonEmpty!52481 (= (arr!40926 _values!1445) (store mapRest!52481 mapKey!52481 mapValue!52481))))

(declare-fun mapIsEmpty!52481 () Bool)

(assert (=> mapIsEmpty!52481 mapRes!52481))

(declare-fun b!1284676 () Bool)

(declare-fun e!733848 () Bool)

(assert (=> b!1284676 (= e!733851 (and e!733848 mapRes!52481))))

(declare-fun condMapEmpty!52481 () Bool)

(declare-fun mapDefault!52481 () ValueCell!16076)

(assert (=> b!1284676 (= condMapEmpty!52481 (= (arr!40926 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16076)) mapDefault!52481)))))

(declare-fun b!1284677 () Bool)

(assert (=> b!1284677 (= e!733848 tp_is_empty!33949)))

(declare-fun b!1284678 () Bool)

(declare-fun res!853434 () Bool)

(assert (=> b!1284678 (=> (not res!853434) (not e!733849))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1284678 (= res!853434 (and (= (size!41478 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41479 _keys!1741) (size!41478 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284679 () Bool)

(declare-fun res!853431 () Bool)

(assert (=> b!1284679 (=> (not res!853431) (not e!733849))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284679 (= res!853431 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41479 _keys!1741))))))

(declare-fun b!1284680 () Bool)

(declare-fun res!853432 () Bool)

(assert (=> b!1284680 (=> (not res!853432) (not e!733849))))

(declare-datatypes ((List!29096 0))(
  ( (Nil!29093) (Cons!29092 (h!30301 (_ BitVec 64)) (t!42632 List!29096)) )
))
(declare-fun arrayNoDuplicates!0 (array!84849 (_ BitVec 32) List!29096) Bool)

(assert (=> b!1284680 (= res!853432 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29093))))

(declare-fun b!1284681 () Bool)

(assert (=> b!1284681 (= e!733850 tp_is_empty!33949)))

(declare-fun b!1284682 () Bool)

(assert (=> b!1284682 (= e!733849 false)))

(declare-fun minValue!1387 () V!50369)

(declare-fun zeroValue!1387 () V!50369)

(declare-fun lt!576672 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21916 0))(
  ( (tuple2!21917 (_1!10969 (_ BitVec 64)) (_2!10969 V!50369)) )
))
(declare-datatypes ((List!29097 0))(
  ( (Nil!29094) (Cons!29093 (h!30302 tuple2!21916) (t!42633 List!29097)) )
))
(declare-datatypes ((ListLongMap!19573 0))(
  ( (ListLongMap!19574 (toList!9802 List!29097)) )
))
(declare-fun contains!7849 (ListLongMap!19573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4772 (array!84849 array!84847 (_ BitVec 32) (_ BitVec 32) V!50369 V!50369 (_ BitVec 32) Int) ListLongMap!19573)

(assert (=> b!1284682 (= lt!576672 (contains!7849 (getCurrentListMap!4772 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284683 () Bool)

(declare-fun res!853430 () Bool)

(assert (=> b!1284683 (=> (not res!853430) (not e!733849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84849 (_ BitVec 32)) Bool)

(assert (=> b!1284683 (= res!853430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108796 res!853433) b!1284678))

(assert (= (and b!1284678 res!853434) b!1284683))

(assert (= (and b!1284683 res!853430) b!1284680))

(assert (= (and b!1284680 res!853432) b!1284679))

(assert (= (and b!1284679 res!853431) b!1284682))

(assert (= (and b!1284676 condMapEmpty!52481) mapIsEmpty!52481))

(assert (= (and b!1284676 (not condMapEmpty!52481)) mapNonEmpty!52481))

(get-info :version)

(assert (= (and mapNonEmpty!52481 ((_ is ValueCellFull!16076) mapValue!52481)) b!1284681))

(assert (= (and b!1284676 ((_ is ValueCellFull!16076) mapDefault!52481)) b!1284677))

(assert (= start!108796 b!1284676))

(declare-fun m!1177825 () Bool)

(assert (=> b!1284682 m!1177825))

(assert (=> b!1284682 m!1177825))

(declare-fun m!1177827 () Bool)

(assert (=> b!1284682 m!1177827))

(declare-fun m!1177829 () Bool)

(assert (=> b!1284680 m!1177829))

(declare-fun m!1177831 () Bool)

(assert (=> start!108796 m!1177831))

(declare-fun m!1177833 () Bool)

(assert (=> start!108796 m!1177833))

(declare-fun m!1177835 () Bool)

(assert (=> start!108796 m!1177835))

(declare-fun m!1177837 () Bool)

(assert (=> mapNonEmpty!52481 m!1177837))

(declare-fun m!1177839 () Bool)

(assert (=> b!1284683 m!1177839))

(check-sat (not b!1284683) tp_is_empty!33949 (not b_next!28309) b_and!46357 (not b!1284682) (not mapNonEmpty!52481) (not start!108796) (not b!1284680))
(check-sat b_and!46357 (not b_next!28309))
