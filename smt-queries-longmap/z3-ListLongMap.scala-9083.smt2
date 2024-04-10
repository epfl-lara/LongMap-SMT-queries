; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109284 () Bool)

(assert start!109284)

(declare-fun b_free!28773 () Bool)

(declare-fun b_next!28773 () Bool)

(assert (=> start!109284 (= b_free!28773 (not b_next!28773))))

(declare-fun tp!101438 () Bool)

(declare-fun b_and!46863 () Bool)

(assert (=> start!109284 (= tp!101438 b_and!46863)))

(declare-fun b!1293116 () Bool)

(declare-fun e!738016 () Bool)

(declare-fun tp_is_empty!34413 () Bool)

(assert (=> b!1293116 (= e!738016 tp_is_empty!34413)))

(declare-fun b!1293117 () Bool)

(declare-fun res!859261 () Bool)

(declare-fun e!738015 () Bool)

(assert (=> b!1293117 (=> (not res!859261) (not e!738015))))

(declare-datatypes ((array!85856 0))(
  ( (array!85857 (arr!41429 (Array (_ BitVec 32) (_ BitVec 64))) (size!41979 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85856)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85856 (_ BitVec 32)) Bool)

(assert (=> b!1293117 (= res!859261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293118 () Bool)

(declare-fun e!738017 () Bool)

(assert (=> b!1293118 (= e!738017 true)))

(declare-datatypes ((V!50987 0))(
  ( (V!50988 (val!17281 Int)) )
))
(declare-datatypes ((tuple2!22240 0))(
  ( (tuple2!22241 (_1!11131 (_ BitVec 64)) (_2!11131 V!50987)) )
))
(declare-datatypes ((List!29389 0))(
  ( (Nil!29386) (Cons!29385 (h!30594 tuple2!22240) (t!42953 List!29389)) )
))
(declare-datatypes ((ListLongMap!19897 0))(
  ( (ListLongMap!19898 (toList!9964 List!29389)) )
))
(declare-fun lt!579468 () ListLongMap!19897)

(declare-fun zeroValue!1387 () V!50987)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!8082 (ListLongMap!19897 (_ BitVec 64)) Bool)

(declare-fun +!4398 (ListLongMap!19897 tuple2!22240) ListLongMap!19897)

(assert (=> b!1293118 (not (contains!8082 (+!4398 lt!579468 (tuple2!22241 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42826 0))(
  ( (Unit!42827) )
))
(declare-fun lt!579469 () Unit!42826)

(declare-fun addStillNotContains!416 (ListLongMap!19897 (_ BitVec 64) V!50987 (_ BitVec 64)) Unit!42826)

(assert (=> b!1293118 (= lt!579469 (addStillNotContains!416 lt!579468 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16308 0))(
  ( (ValueCellFull!16308 (v!19884 V!50987)) (EmptyCell!16308) )
))
(declare-datatypes ((array!85858 0))(
  ( (array!85859 (arr!41430 (Array (_ BitVec 32) ValueCell!16308)) (size!41980 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85858)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!50987)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6030 (array!85856 array!85858 (_ BitVec 32) (_ BitVec 32) V!50987 V!50987 (_ BitVec 32) Int) ListLongMap!19897)

(assert (=> b!1293118 (= lt!579468 (getCurrentListMapNoExtraKeys!6030 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293119 () Bool)

(declare-fun res!859257 () Bool)

(assert (=> b!1293119 (=> (not res!859257) (not e!738015))))

(declare-fun getCurrentListMap!5006 (array!85856 array!85858 (_ BitVec 32) (_ BitVec 32) V!50987 V!50987 (_ BitVec 32) Int) ListLongMap!19897)

(assert (=> b!1293119 (= res!859257 (contains!8082 (getCurrentListMap!5006 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53180 () Bool)

(declare-fun mapRes!53180 () Bool)

(declare-fun tp!101437 () Bool)

(declare-fun e!738012 () Bool)

(assert (=> mapNonEmpty!53180 (= mapRes!53180 (and tp!101437 e!738012))))

(declare-fun mapKey!53180 () (_ BitVec 32))

(declare-fun mapRest!53180 () (Array (_ BitVec 32) ValueCell!16308))

(declare-fun mapValue!53180 () ValueCell!16308)

(assert (=> mapNonEmpty!53180 (= (arr!41430 _values!1445) (store mapRest!53180 mapKey!53180 mapValue!53180))))

(declare-fun mapIsEmpty!53180 () Bool)

(assert (=> mapIsEmpty!53180 mapRes!53180))

(declare-fun b!1293121 () Bool)

(declare-fun res!859255 () Bool)

(assert (=> b!1293121 (=> (not res!859255) (not e!738015))))

(assert (=> b!1293121 (= res!859255 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41979 _keys!1741))))))

(declare-fun b!1293122 () Bool)

(declare-fun res!859260 () Bool)

(assert (=> b!1293122 (=> (not res!859260) (not e!738015))))

(assert (=> b!1293122 (= res!859260 (and (= (size!41980 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41979 _keys!1741) (size!41980 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293123 () Bool)

(declare-fun e!738014 () Bool)

(assert (=> b!1293123 (= e!738014 (and e!738016 mapRes!53180))))

(declare-fun condMapEmpty!53180 () Bool)

(declare-fun mapDefault!53180 () ValueCell!16308)

(assert (=> b!1293123 (= condMapEmpty!53180 (= (arr!41430 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16308)) mapDefault!53180)))))

(declare-fun b!1293124 () Bool)

(assert (=> b!1293124 (= e!738012 tp_is_empty!34413)))

(declare-fun b!1293125 () Bool)

(assert (=> b!1293125 (= e!738015 (not e!738017))))

(declare-fun res!859263 () Bool)

(assert (=> b!1293125 (=> res!859263 e!738017)))

(assert (=> b!1293125 (= res!859263 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293125 (not (contains!8082 (ListLongMap!19898 Nil!29386) k0!1205))))

(declare-fun lt!579470 () Unit!42826)

(declare-fun emptyContainsNothing!134 ((_ BitVec 64)) Unit!42826)

(assert (=> b!1293125 (= lt!579470 (emptyContainsNothing!134 k0!1205))))

(declare-fun res!859259 () Bool)

(assert (=> start!109284 (=> (not res!859259) (not e!738015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109284 (= res!859259 (validMask!0 mask!2175))))

(assert (=> start!109284 e!738015))

(assert (=> start!109284 tp_is_empty!34413))

(assert (=> start!109284 true))

(declare-fun array_inv!31389 (array!85858) Bool)

(assert (=> start!109284 (and (array_inv!31389 _values!1445) e!738014)))

(declare-fun array_inv!31390 (array!85856) Bool)

(assert (=> start!109284 (array_inv!31390 _keys!1741)))

(assert (=> start!109284 tp!101438))

(declare-fun b!1293120 () Bool)

(declare-fun res!859262 () Bool)

(assert (=> b!1293120 (=> (not res!859262) (not e!738015))))

(assert (=> b!1293120 (= res!859262 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41979 _keys!1741))))))

(declare-fun b!1293126 () Bool)

(declare-fun res!859256 () Bool)

(assert (=> b!1293126 (=> (not res!859256) (not e!738015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293126 (= res!859256 (not (validKeyInArray!0 (select (arr!41429 _keys!1741) from!2144))))))

(declare-fun b!1293127 () Bool)

(declare-fun res!859258 () Bool)

(assert (=> b!1293127 (=> (not res!859258) (not e!738015))))

(declare-datatypes ((List!29390 0))(
  ( (Nil!29387) (Cons!29386 (h!30595 (_ BitVec 64)) (t!42954 List!29390)) )
))
(declare-fun arrayNoDuplicates!0 (array!85856 (_ BitVec 32) List!29390) Bool)

(assert (=> b!1293127 (= res!859258 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29387))))

(assert (= (and start!109284 res!859259) b!1293122))

(assert (= (and b!1293122 res!859260) b!1293117))

(assert (= (and b!1293117 res!859261) b!1293127))

(assert (= (and b!1293127 res!859258) b!1293120))

(assert (= (and b!1293120 res!859262) b!1293119))

(assert (= (and b!1293119 res!859257) b!1293121))

(assert (= (and b!1293121 res!859255) b!1293126))

(assert (= (and b!1293126 res!859256) b!1293125))

(assert (= (and b!1293125 (not res!859263)) b!1293118))

(assert (= (and b!1293123 condMapEmpty!53180) mapIsEmpty!53180))

(assert (= (and b!1293123 (not condMapEmpty!53180)) mapNonEmpty!53180))

(get-info :version)

(assert (= (and mapNonEmpty!53180 ((_ is ValueCellFull!16308) mapValue!53180)) b!1293124))

(assert (= (and b!1293123 ((_ is ValueCellFull!16308) mapDefault!53180)) b!1293116))

(assert (= start!109284 b!1293123))

(declare-fun m!1185547 () Bool)

(assert (=> mapNonEmpty!53180 m!1185547))

(declare-fun m!1185549 () Bool)

(assert (=> start!109284 m!1185549))

(declare-fun m!1185551 () Bool)

(assert (=> start!109284 m!1185551))

(declare-fun m!1185553 () Bool)

(assert (=> start!109284 m!1185553))

(declare-fun m!1185555 () Bool)

(assert (=> b!1293117 m!1185555))

(declare-fun m!1185557 () Bool)

(assert (=> b!1293127 m!1185557))

(declare-fun m!1185559 () Bool)

(assert (=> b!1293119 m!1185559))

(assert (=> b!1293119 m!1185559))

(declare-fun m!1185561 () Bool)

(assert (=> b!1293119 m!1185561))

(declare-fun m!1185563 () Bool)

(assert (=> b!1293118 m!1185563))

(assert (=> b!1293118 m!1185563))

(declare-fun m!1185565 () Bool)

(assert (=> b!1293118 m!1185565))

(declare-fun m!1185567 () Bool)

(assert (=> b!1293118 m!1185567))

(declare-fun m!1185569 () Bool)

(assert (=> b!1293118 m!1185569))

(declare-fun m!1185571 () Bool)

(assert (=> b!1293126 m!1185571))

(assert (=> b!1293126 m!1185571))

(declare-fun m!1185573 () Bool)

(assert (=> b!1293126 m!1185573))

(declare-fun m!1185575 () Bool)

(assert (=> b!1293125 m!1185575))

(declare-fun m!1185577 () Bool)

(assert (=> b!1293125 m!1185577))

(check-sat b_and!46863 (not b!1293117) (not b!1293119) (not start!109284) (not b!1293118) (not b!1293127) (not mapNonEmpty!53180) tp_is_empty!34413 (not b!1293126) (not b_next!28773) (not b!1293125))
(check-sat b_and!46863 (not b_next!28773))
