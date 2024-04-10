; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109026 () Bool)

(assert start!109026)

(declare-fun b_free!28515 () Bool)

(declare-fun b_next!28515 () Bool)

(assert (=> start!109026 (= b_free!28515 (not b_next!28515))))

(declare-fun tp!100663 () Bool)

(declare-fun b_and!46605 () Bool)

(assert (=> start!109026 (= tp!100663 b_and!46605)))

(declare-fun b!1288553 () Bool)

(declare-fun e!735776 () Bool)

(assert (=> b!1288553 (= e!735776 true)))

(declare-datatypes ((V!50643 0))(
  ( (V!50644 (val!17152 Int)) )
))
(declare-datatypes ((tuple2!22018 0))(
  ( (tuple2!22019 (_1!11020 (_ BitVec 64)) (_2!11020 V!50643)) )
))
(declare-datatypes ((List!29192 0))(
  ( (Nil!29189) (Cons!29188 (h!30397 tuple2!22018) (t!42756 List!29192)) )
))
(declare-datatypes ((ListLongMap!19675 0))(
  ( (ListLongMap!19676 (toList!9853 List!29192)) )
))
(declare-fun lt!578021 () ListLongMap!19675)

(declare-fun zeroValue!1387 () V!50643)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7971 (ListLongMap!19675 (_ BitVec 64)) Bool)

(declare-fun +!4328 (ListLongMap!19675 tuple2!22018) ListLongMap!19675)

(assert (=> b!1288553 (not (contains!7971 (+!4328 lt!578021 (tuple2!22019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42626 0))(
  ( (Unit!42627) )
))
(declare-fun lt!578020 () Unit!42626)

(declare-fun addStillNotContains!346 (ListLongMap!19675 (_ BitVec 64) V!50643 (_ BitVec 64)) Unit!42626)

(assert (=> b!1288553 (= lt!578020 (addStillNotContains!346 lt!578021 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50643)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16179 0))(
  ( (ValueCellFull!16179 (v!19755 V!50643)) (EmptyCell!16179) )
))
(declare-datatypes ((array!85354 0))(
  ( (array!85355 (arr!41178 (Array (_ BitVec 32) ValueCell!16179)) (size!41728 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85354)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85356 0))(
  ( (array!85357 (arr!41179 (Array (_ BitVec 32) (_ BitVec 64))) (size!41729 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85356)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5959 (array!85356 array!85354 (_ BitVec 32) (_ BitVec 32) V!50643 V!50643 (_ BitVec 32) Int) ListLongMap!19675)

(assert (=> b!1288553 (= lt!578021 (getCurrentListMapNoExtraKeys!5959 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288554 () Bool)

(declare-fun res!855861 () Bool)

(declare-fun e!735771 () Bool)

(assert (=> b!1288554 (=> (not res!855861) (not e!735771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288554 (= res!855861 (not (validKeyInArray!0 (select (arr!41179 _keys!1741) from!2144))))))

(declare-fun b!1288555 () Bool)

(declare-fun res!855857 () Bool)

(assert (=> b!1288555 (=> (not res!855857) (not e!735771))))

(assert (=> b!1288555 (= res!855857 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41729 _keys!1741))))))

(declare-fun b!1288556 () Bool)

(declare-fun res!855860 () Bool)

(assert (=> b!1288556 (=> (not res!855860) (not e!735771))))

(declare-fun getCurrentListMap!4917 (array!85356 array!85354 (_ BitVec 32) (_ BitVec 32) V!50643 V!50643 (_ BitVec 32) Int) ListLongMap!19675)

(assert (=> b!1288556 (= res!855860 (contains!7971 (getCurrentListMap!4917 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52793 () Bool)

(declare-fun mapRes!52793 () Bool)

(assert (=> mapIsEmpty!52793 mapRes!52793))

(declare-fun b!1288557 () Bool)

(declare-fun res!855853 () Bool)

(assert (=> b!1288557 (=> (not res!855853) (not e!735771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85356 (_ BitVec 32)) Bool)

(assert (=> b!1288557 (= res!855853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288558 () Bool)

(declare-fun e!735773 () Bool)

(declare-fun tp_is_empty!34155 () Bool)

(assert (=> b!1288558 (= e!735773 tp_is_empty!34155)))

(declare-fun b!1288559 () Bool)

(declare-fun res!855856 () Bool)

(assert (=> b!1288559 (=> (not res!855856) (not e!735771))))

(assert (=> b!1288559 (= res!855856 (and (= (size!41728 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41729 _keys!1741) (size!41728 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288560 () Bool)

(declare-fun res!855859 () Bool)

(assert (=> b!1288560 (=> (not res!855859) (not e!735771))))

(declare-datatypes ((List!29193 0))(
  ( (Nil!29190) (Cons!29189 (h!30398 (_ BitVec 64)) (t!42757 List!29193)) )
))
(declare-fun arrayNoDuplicates!0 (array!85356 (_ BitVec 32) List!29193) Bool)

(assert (=> b!1288560 (= res!855859 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29190))))

(declare-fun res!855854 () Bool)

(assert (=> start!109026 (=> (not res!855854) (not e!735771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109026 (= res!855854 (validMask!0 mask!2175))))

(assert (=> start!109026 e!735771))

(assert (=> start!109026 tp_is_empty!34155))

(assert (=> start!109026 true))

(declare-fun e!735775 () Bool)

(declare-fun array_inv!31223 (array!85354) Bool)

(assert (=> start!109026 (and (array_inv!31223 _values!1445) e!735775)))

(declare-fun array_inv!31224 (array!85356) Bool)

(assert (=> start!109026 (array_inv!31224 _keys!1741)))

(assert (=> start!109026 tp!100663))

(declare-fun b!1288561 () Bool)

(declare-fun e!735774 () Bool)

(assert (=> b!1288561 (= e!735774 tp_is_empty!34155)))

(declare-fun mapNonEmpty!52793 () Bool)

(declare-fun tp!100664 () Bool)

(assert (=> mapNonEmpty!52793 (= mapRes!52793 (and tp!100664 e!735774))))

(declare-fun mapValue!52793 () ValueCell!16179)

(declare-fun mapRest!52793 () (Array (_ BitVec 32) ValueCell!16179))

(declare-fun mapKey!52793 () (_ BitVec 32))

(assert (=> mapNonEmpty!52793 (= (arr!41178 _values!1445) (store mapRest!52793 mapKey!52793 mapValue!52793))))

(declare-fun b!1288562 () Bool)

(assert (=> b!1288562 (= e!735775 (and e!735773 mapRes!52793))))

(declare-fun condMapEmpty!52793 () Bool)

(declare-fun mapDefault!52793 () ValueCell!16179)

(assert (=> b!1288562 (= condMapEmpty!52793 (= (arr!41178 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16179)) mapDefault!52793)))))

(declare-fun b!1288563 () Bool)

(declare-fun res!855855 () Bool)

(assert (=> b!1288563 (=> (not res!855855) (not e!735771))))

(assert (=> b!1288563 (= res!855855 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41729 _keys!1741))))))

(declare-fun b!1288564 () Bool)

(assert (=> b!1288564 (= e!735771 (not e!735776))))

(declare-fun res!855858 () Bool)

(assert (=> b!1288564 (=> res!855858 e!735776)))

(assert (=> b!1288564 (= res!855858 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288564 (not (contains!7971 (ListLongMap!19676 Nil!29189) k0!1205))))

(declare-fun lt!578019 () Unit!42626)

(declare-fun emptyContainsNothing!42 ((_ BitVec 64)) Unit!42626)

(assert (=> b!1288564 (= lt!578019 (emptyContainsNothing!42 k0!1205))))

(assert (= (and start!109026 res!855854) b!1288559))

(assert (= (and b!1288559 res!855856) b!1288557))

(assert (= (and b!1288557 res!855853) b!1288560))

(assert (= (and b!1288560 res!855859) b!1288563))

(assert (= (and b!1288563 res!855855) b!1288556))

(assert (= (and b!1288556 res!855860) b!1288555))

(assert (= (and b!1288555 res!855857) b!1288554))

(assert (= (and b!1288554 res!855861) b!1288564))

(assert (= (and b!1288564 (not res!855858)) b!1288553))

(assert (= (and b!1288562 condMapEmpty!52793) mapIsEmpty!52793))

(assert (= (and b!1288562 (not condMapEmpty!52793)) mapNonEmpty!52793))

(get-info :version)

(assert (= (and mapNonEmpty!52793 ((_ is ValueCellFull!16179) mapValue!52793)) b!1288561))

(assert (= (and b!1288562 ((_ is ValueCellFull!16179) mapDefault!52793)) b!1288558))

(assert (= start!109026 b!1288562))

(declare-fun m!1181155 () Bool)

(assert (=> b!1288554 m!1181155))

(assert (=> b!1288554 m!1181155))

(declare-fun m!1181157 () Bool)

(assert (=> b!1288554 m!1181157))

(declare-fun m!1181159 () Bool)

(assert (=> start!109026 m!1181159))

(declare-fun m!1181161 () Bool)

(assert (=> start!109026 m!1181161))

(declare-fun m!1181163 () Bool)

(assert (=> start!109026 m!1181163))

(declare-fun m!1181165 () Bool)

(assert (=> b!1288557 m!1181165))

(declare-fun m!1181167 () Bool)

(assert (=> mapNonEmpty!52793 m!1181167))

(declare-fun m!1181169 () Bool)

(assert (=> b!1288556 m!1181169))

(assert (=> b!1288556 m!1181169))

(declare-fun m!1181171 () Bool)

(assert (=> b!1288556 m!1181171))

(declare-fun m!1181173 () Bool)

(assert (=> b!1288553 m!1181173))

(assert (=> b!1288553 m!1181173))

(declare-fun m!1181175 () Bool)

(assert (=> b!1288553 m!1181175))

(declare-fun m!1181177 () Bool)

(assert (=> b!1288553 m!1181177))

(declare-fun m!1181179 () Bool)

(assert (=> b!1288553 m!1181179))

(declare-fun m!1181181 () Bool)

(assert (=> b!1288560 m!1181181))

(declare-fun m!1181183 () Bool)

(assert (=> b!1288564 m!1181183))

(declare-fun m!1181185 () Bool)

(assert (=> b!1288564 m!1181185))

(check-sat (not start!109026) tp_is_empty!34155 (not b_next!28515) (not b!1288564) (not b!1288557) b_and!46605 (not mapNonEmpty!52793) (not b!1288560) (not b!1288554) (not b!1288553) (not b!1288556))
(check-sat b_and!46605 (not b_next!28515))
