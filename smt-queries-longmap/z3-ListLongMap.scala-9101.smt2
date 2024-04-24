; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109614 () Bool)

(assert start!109614)

(declare-fun b_free!28879 () Bool)

(declare-fun b_next!28879 () Bool)

(assert (=> start!109614 (= b_free!28879 (not b_next!28879))))

(declare-fun tp!101755 () Bool)

(declare-fun b_and!46971 () Bool)

(assert (=> start!109614 (= tp!101755 b_and!46971)))

(declare-fun res!861129 () Bool)

(declare-fun e!739734 () Bool)

(assert (=> start!109614 (=> (not res!861129) (not e!739734))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109614 (= res!861129 (validMask!0 mask!2175))))

(assert (=> start!109614 e!739734))

(declare-fun tp_is_empty!34519 () Bool)

(assert (=> start!109614 tp_is_empty!34519))

(assert (=> start!109614 true))

(declare-datatypes ((V!51129 0))(
  ( (V!51130 (val!17334 Int)) )
))
(declare-datatypes ((ValueCell!16361 0))(
  ( (ValueCellFull!16361 (v!19932 V!51129)) (EmptyCell!16361) )
))
(declare-datatypes ((array!86091 0))(
  ( (array!86092 (arr!41542 (Array (_ BitVec 32) ValueCell!16361)) (size!42093 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86091)

(declare-fun e!739737 () Bool)

(declare-fun array_inv!31687 (array!86091) Bool)

(assert (=> start!109614 (and (array_inv!31687 _values!1445) e!739737)))

(declare-datatypes ((array!86093 0))(
  ( (array!86094 (arr!41543 (Array (_ BitVec 32) (_ BitVec 64))) (size!42094 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86093)

(declare-fun array_inv!31688 (array!86093) Bool)

(assert (=> start!109614 (array_inv!31688 _keys!1741)))

(assert (=> start!109614 tp!101755))

(declare-fun b!1296248 () Bool)

(declare-fun e!739732 () Bool)

(assert (=> b!1296248 (= e!739732 tp_is_empty!34519)))

(declare-fun b!1296249 () Bool)

(declare-fun e!739733 () Bool)

(assert (=> b!1296249 (= e!739733 tp_is_empty!34519)))

(declare-fun mapNonEmpty!53339 () Bool)

(declare-fun mapRes!53339 () Bool)

(declare-fun tp!101756 () Bool)

(assert (=> mapNonEmpty!53339 (= mapRes!53339 (and tp!101756 e!739732))))

(declare-fun mapValue!53339 () ValueCell!16361)

(declare-fun mapRest!53339 () (Array (_ BitVec 32) ValueCell!16361))

(declare-fun mapKey!53339 () (_ BitVec 32))

(assert (=> mapNonEmpty!53339 (= (arr!41542 _values!1445) (store mapRest!53339 mapKey!53339 mapValue!53339))))

(declare-fun b!1296250 () Bool)

(declare-fun res!861132 () Bool)

(assert (=> b!1296250 (=> (not res!861132) (not e!739734))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1296250 (= res!861132 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42094 _keys!1741))))))

(declare-fun b!1296251 () Bool)

(declare-fun res!861133 () Bool)

(assert (=> b!1296251 (=> (not res!861133) (not e!739734))))

(declare-datatypes ((List!29486 0))(
  ( (Nil!29483) (Cons!29482 (h!30700 (_ BitVec 64)) (t!43042 List!29486)) )
))
(declare-fun arrayNoDuplicates!0 (array!86093 (_ BitVec 32) List!29486) Bool)

(assert (=> b!1296251 (= res!861133 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29483))))

(declare-fun mapIsEmpty!53339 () Bool)

(assert (=> mapIsEmpty!53339 mapRes!53339))

(declare-fun b!1296252 () Bool)

(declare-fun res!861125 () Bool)

(assert (=> b!1296252 (=> (not res!861125) (not e!739734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86093 (_ BitVec 32)) Bool)

(assert (=> b!1296252 (= res!861125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296253 () Bool)

(assert (=> b!1296253 (= e!739737 (and e!739733 mapRes!53339))))

(declare-fun condMapEmpty!53339 () Bool)

(declare-fun mapDefault!53339 () ValueCell!16361)

(assert (=> b!1296253 (= condMapEmpty!53339 (= (arr!41542 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16361)) mapDefault!53339)))))

(declare-fun b!1296254 () Bool)

(declare-fun res!861126 () Bool)

(assert (=> b!1296254 (=> (not res!861126) (not e!739734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296254 (= res!861126 (not (validKeyInArray!0 (select (arr!41543 _keys!1741) from!2144))))))

(declare-fun b!1296255 () Bool)

(declare-fun res!861130 () Bool)

(assert (=> b!1296255 (=> (not res!861130) (not e!739734))))

(assert (=> b!1296255 (= res!861130 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42094 _keys!1741))))))

(declare-fun b!1296256 () Bool)

(declare-fun e!739736 () Bool)

(assert (=> b!1296256 (= e!739736 true)))

(declare-datatypes ((tuple2!22318 0))(
  ( (tuple2!22319 (_1!11170 (_ BitVec 64)) (_2!11170 V!51129)) )
))
(declare-datatypes ((List!29487 0))(
  ( (Nil!29484) (Cons!29483 (h!30701 tuple2!22318) (t!43043 List!29487)) )
))
(declare-datatypes ((ListLongMap!19983 0))(
  ( (ListLongMap!19984 (toList!10007 List!29487)) )
))
(declare-fun lt!580260 () ListLongMap!19983)

(declare-fun minValue!1387 () V!51129)

(declare-fun contains!8138 (ListLongMap!19983 (_ BitVec 64)) Bool)

(declare-fun +!4454 (ListLongMap!19983 tuple2!22318) ListLongMap!19983)

(assert (=> b!1296256 (not (contains!8138 (+!4454 lt!580260 (tuple2!22319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42845 0))(
  ( (Unit!42846) )
))
(declare-fun lt!580259 () Unit!42845)

(declare-fun addStillNotContains!430 (ListLongMap!19983 (_ BitVec 64) V!51129 (_ BitVec 64)) Unit!42845)

(assert (=> b!1296256 (= lt!580259 (addStillNotContains!430 lt!580260 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51129)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6096 (array!86093 array!86091 (_ BitVec 32) (_ BitVec 32) V!51129 V!51129 (_ BitVec 32) Int) ListLongMap!19983)

(assert (=> b!1296256 (= lt!580260 (getCurrentListMapNoExtraKeys!6096 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1296257 () Bool)

(assert (=> b!1296257 (= e!739734 (not e!739736))))

(declare-fun res!861131 () Bool)

(assert (=> b!1296257 (=> res!861131 e!739736)))

(assert (=> b!1296257 (= res!861131 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296257 (not (contains!8138 (ListLongMap!19984 Nil!29484) k0!1205))))

(declare-fun lt!580258 () Unit!42845)

(declare-fun emptyContainsNothing!165 ((_ BitVec 64)) Unit!42845)

(assert (=> b!1296257 (= lt!580258 (emptyContainsNothing!165 k0!1205))))

(declare-fun b!1296258 () Bool)

(declare-fun res!861128 () Bool)

(assert (=> b!1296258 (=> (not res!861128) (not e!739734))))

(assert (=> b!1296258 (= res!861128 (and (= (size!42093 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42094 _keys!1741) (size!42093 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296259 () Bool)

(declare-fun res!861127 () Bool)

(assert (=> b!1296259 (=> (not res!861127) (not e!739734))))

(declare-fun getCurrentListMap!5033 (array!86093 array!86091 (_ BitVec 32) (_ BitVec 32) V!51129 V!51129 (_ BitVec 32) Int) ListLongMap!19983)

(assert (=> b!1296259 (= res!861127 (contains!8138 (getCurrentListMap!5033 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109614 res!861129) b!1296258))

(assert (= (and b!1296258 res!861128) b!1296252))

(assert (= (and b!1296252 res!861125) b!1296251))

(assert (= (and b!1296251 res!861133) b!1296255))

(assert (= (and b!1296255 res!861130) b!1296259))

(assert (= (and b!1296259 res!861127) b!1296250))

(assert (= (and b!1296250 res!861132) b!1296254))

(assert (= (and b!1296254 res!861126) b!1296257))

(assert (= (and b!1296257 (not res!861131)) b!1296256))

(assert (= (and b!1296253 condMapEmpty!53339) mapIsEmpty!53339))

(assert (= (and b!1296253 (not condMapEmpty!53339)) mapNonEmpty!53339))

(get-info :version)

(assert (= (and mapNonEmpty!53339 ((_ is ValueCellFull!16361) mapValue!53339)) b!1296248))

(assert (= (and b!1296253 ((_ is ValueCellFull!16361) mapDefault!53339)) b!1296249))

(assert (= start!109614 b!1296253))

(declare-fun m!1188633 () Bool)

(assert (=> b!1296256 m!1188633))

(assert (=> b!1296256 m!1188633))

(declare-fun m!1188635 () Bool)

(assert (=> b!1296256 m!1188635))

(declare-fun m!1188637 () Bool)

(assert (=> b!1296256 m!1188637))

(declare-fun m!1188639 () Bool)

(assert (=> b!1296256 m!1188639))

(declare-fun m!1188641 () Bool)

(assert (=> start!109614 m!1188641))

(declare-fun m!1188643 () Bool)

(assert (=> start!109614 m!1188643))

(declare-fun m!1188645 () Bool)

(assert (=> start!109614 m!1188645))

(declare-fun m!1188647 () Bool)

(assert (=> b!1296257 m!1188647))

(declare-fun m!1188649 () Bool)

(assert (=> b!1296257 m!1188649))

(declare-fun m!1188651 () Bool)

(assert (=> b!1296259 m!1188651))

(assert (=> b!1296259 m!1188651))

(declare-fun m!1188653 () Bool)

(assert (=> b!1296259 m!1188653))

(declare-fun m!1188655 () Bool)

(assert (=> mapNonEmpty!53339 m!1188655))

(declare-fun m!1188657 () Bool)

(assert (=> b!1296254 m!1188657))

(assert (=> b!1296254 m!1188657))

(declare-fun m!1188659 () Bool)

(assert (=> b!1296254 m!1188659))

(declare-fun m!1188661 () Bool)

(assert (=> b!1296251 m!1188661))

(declare-fun m!1188663 () Bool)

(assert (=> b!1296252 m!1188663))

(check-sat b_and!46971 (not b!1296257) (not b!1296251) (not b!1296252) (not b!1296256) (not start!109614) (not mapNonEmpty!53339) tp_is_empty!34519 (not b_next!28879) (not b!1296254) (not b!1296259))
(check-sat b_and!46971 (not b_next!28879))
