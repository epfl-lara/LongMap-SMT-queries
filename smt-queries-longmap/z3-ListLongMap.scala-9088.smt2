; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109312 () Bool)

(assert start!109312)

(declare-fun b_free!28801 () Bool)

(declare-fun b_next!28801 () Bool)

(assert (=> start!109312 (= b_free!28801 (not b_next!28801))))

(declare-fun tp!101522 () Bool)

(declare-fun b_and!46873 () Bool)

(assert (=> start!109312 (= tp!101522 b_and!46873)))

(declare-fun b!1293556 () Bool)

(declare-fun res!859609 () Bool)

(declare-fun e!738238 () Bool)

(assert (=> b!1293556 (=> (not res!859609) (not e!738238))))

(declare-datatypes ((array!85797 0))(
  ( (array!85798 (arr!41400 (Array (_ BitVec 32) (_ BitVec 64))) (size!41952 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85797)

(declare-datatypes ((List!29444 0))(
  ( (Nil!29441) (Cons!29440 (h!30649 (_ BitVec 64)) (t!43000 List!29444)) )
))
(declare-fun arrayNoDuplicates!0 (array!85797 (_ BitVec 32) List!29444) Bool)

(assert (=> b!1293556 (= res!859609 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29441))))

(declare-fun mapNonEmpty!53222 () Bool)

(declare-fun mapRes!53222 () Bool)

(declare-fun tp!101523 () Bool)

(declare-fun e!738235 () Bool)

(assert (=> mapNonEmpty!53222 (= mapRes!53222 (and tp!101523 e!738235))))

(declare-fun mapKey!53222 () (_ BitVec 32))

(declare-datatypes ((V!51025 0))(
  ( (V!51026 (val!17295 Int)) )
))
(declare-datatypes ((ValueCell!16322 0))(
  ( (ValueCellFull!16322 (v!19897 V!51025)) (EmptyCell!16322) )
))
(declare-datatypes ((array!85799 0))(
  ( (array!85800 (arr!41401 (Array (_ BitVec 32) ValueCell!16322)) (size!41953 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85799)

(declare-fun mapValue!53222 () ValueCell!16322)

(declare-fun mapRest!53222 () (Array (_ BitVec 32) ValueCell!16322))

(assert (=> mapNonEmpty!53222 (= (arr!41401 _values!1445) (store mapRest!53222 mapKey!53222 mapValue!53222))))

(declare-fun b!1293557 () Bool)

(declare-fun res!859608 () Bool)

(assert (=> b!1293557 (=> (not res!859608) (not e!738238))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293557 (= res!859608 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41952 _keys!1741))))))

(declare-fun b!1293558 () Bool)

(declare-fun e!738240 () Bool)

(declare-fun e!738237 () Bool)

(assert (=> b!1293558 (= e!738240 (and e!738237 mapRes!53222))))

(declare-fun condMapEmpty!53222 () Bool)

(declare-fun mapDefault!53222 () ValueCell!16322)

(assert (=> b!1293558 (= condMapEmpty!53222 (= (arr!41401 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16322)) mapDefault!53222)))))

(declare-fun mapIsEmpty!53222 () Bool)

(assert (=> mapIsEmpty!53222 mapRes!53222))

(declare-fun b!1293559 () Bool)

(declare-fun tp_is_empty!34441 () Bool)

(assert (=> b!1293559 (= e!738237 tp_is_empty!34441)))

(declare-fun res!859606 () Bool)

(assert (=> start!109312 (=> (not res!859606) (not e!738238))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109312 (= res!859606 (validMask!0 mask!2175))))

(assert (=> start!109312 e!738238))

(assert (=> start!109312 tp_is_empty!34441))

(assert (=> start!109312 true))

(declare-fun array_inv!31521 (array!85799) Bool)

(assert (=> start!109312 (and (array_inv!31521 _values!1445) e!738240)))

(declare-fun array_inv!31522 (array!85797) Bool)

(assert (=> start!109312 (array_inv!31522 _keys!1741)))

(assert (=> start!109312 tp!101522))

(declare-fun b!1293560 () Bool)

(declare-fun res!859612 () Bool)

(assert (=> b!1293560 (=> (not res!859612) (not e!738238))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293560 (= res!859612 (and (= (size!41953 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41952 _keys!1741) (size!41953 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293561 () Bool)

(declare-fun res!859607 () Bool)

(assert (=> b!1293561 (=> (not res!859607) (not e!738238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85797 (_ BitVec 32)) Bool)

(assert (=> b!1293561 (= res!859607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293562 () Bool)

(declare-fun e!738236 () Bool)

(assert (=> b!1293562 (= e!738238 (not e!738236))))

(declare-fun res!859610 () Bool)

(assert (=> b!1293562 (=> res!859610 e!738236)))

(assert (=> b!1293562 (= res!859610 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22296 0))(
  ( (tuple2!22297 (_1!11159 (_ BitVec 64)) (_2!11159 V!51025)) )
))
(declare-datatypes ((List!29445 0))(
  ( (Nil!29442) (Cons!29441 (h!30650 tuple2!22296) (t!43001 List!29445)) )
))
(declare-datatypes ((ListLongMap!19953 0))(
  ( (ListLongMap!19954 (toList!9992 List!29445)) )
))
(declare-fun contains!8040 (ListLongMap!19953 (_ BitVec 64)) Bool)

(assert (=> b!1293562 (not (contains!8040 (ListLongMap!19954 Nil!29442) k0!1205))))

(declare-datatypes ((Unit!42662 0))(
  ( (Unit!42663) )
))
(declare-fun lt!579417 () Unit!42662)

(declare-fun emptyContainsNothing!125 ((_ BitVec 64)) Unit!42662)

(assert (=> b!1293562 (= lt!579417 (emptyContainsNothing!125 k0!1205))))

(declare-fun b!1293563 () Bool)

(declare-fun res!859611 () Bool)

(assert (=> b!1293563 (=> (not res!859611) (not e!738238))))

(declare-fun minValue!1387 () V!51025)

(declare-fun zeroValue!1387 () V!51025)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4928 (array!85797 array!85799 (_ BitVec 32) (_ BitVec 32) V!51025 V!51025 (_ BitVec 32) Int) ListLongMap!19953)

(assert (=> b!1293563 (= res!859611 (contains!8040 (getCurrentListMap!4928 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293564 () Bool)

(declare-fun res!859614 () Bool)

(assert (=> b!1293564 (=> (not res!859614) (not e!738238))))

(assert (=> b!1293564 (= res!859614 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41952 _keys!1741))))))

(declare-fun b!1293565 () Bool)

(assert (=> b!1293565 (= e!738236 (bvsle from!2144 (size!41952 _keys!1741)))))

(declare-fun lt!579416 () ListLongMap!19953)

(declare-fun +!4438 (ListLongMap!19953 tuple2!22296) ListLongMap!19953)

(assert (=> b!1293565 (not (contains!8040 (+!4438 lt!579416 (tuple2!22297 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579418 () Unit!42662)

(declare-fun addStillNotContains!415 (ListLongMap!19953 (_ BitVec 64) V!51025 (_ BitVec 64)) Unit!42662)

(assert (=> b!1293565 (= lt!579418 (addStillNotContains!415 lt!579416 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6070 (array!85797 array!85799 (_ BitVec 32) (_ BitVec 32) V!51025 V!51025 (_ BitVec 32) Int) ListLongMap!19953)

(assert (=> b!1293565 (= lt!579416 (getCurrentListMapNoExtraKeys!6070 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293566 () Bool)

(declare-fun res!859613 () Bool)

(assert (=> b!1293566 (=> (not res!859613) (not e!738238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293566 (= res!859613 (not (validKeyInArray!0 (select (arr!41400 _keys!1741) from!2144))))))

(declare-fun b!1293567 () Bool)

(assert (=> b!1293567 (= e!738235 tp_is_empty!34441)))

(assert (= (and start!109312 res!859606) b!1293560))

(assert (= (and b!1293560 res!859612) b!1293561))

(assert (= (and b!1293561 res!859607) b!1293556))

(assert (= (and b!1293556 res!859609) b!1293564))

(assert (= (and b!1293564 res!859614) b!1293563))

(assert (= (and b!1293563 res!859611) b!1293557))

(assert (= (and b!1293557 res!859608) b!1293566))

(assert (= (and b!1293566 res!859613) b!1293562))

(assert (= (and b!1293562 (not res!859610)) b!1293565))

(assert (= (and b!1293558 condMapEmpty!53222) mapIsEmpty!53222))

(assert (= (and b!1293558 (not condMapEmpty!53222)) mapNonEmpty!53222))

(get-info :version)

(assert (= (and mapNonEmpty!53222 ((_ is ValueCellFull!16322) mapValue!53222)) b!1293567))

(assert (= (and b!1293558 ((_ is ValueCellFull!16322) mapDefault!53222)) b!1293559))

(assert (= start!109312 b!1293558))

(declare-fun m!1185495 () Bool)

(assert (=> b!1293561 m!1185495))

(declare-fun m!1185497 () Bool)

(assert (=> b!1293562 m!1185497))

(declare-fun m!1185499 () Bool)

(assert (=> b!1293562 m!1185499))

(declare-fun m!1185501 () Bool)

(assert (=> start!109312 m!1185501))

(declare-fun m!1185503 () Bool)

(assert (=> start!109312 m!1185503))

(declare-fun m!1185505 () Bool)

(assert (=> start!109312 m!1185505))

(declare-fun m!1185507 () Bool)

(assert (=> b!1293556 m!1185507))

(declare-fun m!1185509 () Bool)

(assert (=> mapNonEmpty!53222 m!1185509))

(declare-fun m!1185511 () Bool)

(assert (=> b!1293566 m!1185511))

(assert (=> b!1293566 m!1185511))

(declare-fun m!1185513 () Bool)

(assert (=> b!1293566 m!1185513))

(declare-fun m!1185515 () Bool)

(assert (=> b!1293565 m!1185515))

(assert (=> b!1293565 m!1185515))

(declare-fun m!1185517 () Bool)

(assert (=> b!1293565 m!1185517))

(declare-fun m!1185519 () Bool)

(assert (=> b!1293565 m!1185519))

(declare-fun m!1185521 () Bool)

(assert (=> b!1293565 m!1185521))

(declare-fun m!1185523 () Bool)

(assert (=> b!1293563 m!1185523))

(assert (=> b!1293563 m!1185523))

(declare-fun m!1185525 () Bool)

(assert (=> b!1293563 m!1185525))

(check-sat tp_is_empty!34441 (not b!1293563) (not b!1293561) (not b!1293565) (not start!109312) (not b!1293556) b_and!46873 (not b_next!28801) (not b!1293566) (not mapNonEmpty!53222) (not b!1293562))
(check-sat b_and!46873 (not b_next!28801))
