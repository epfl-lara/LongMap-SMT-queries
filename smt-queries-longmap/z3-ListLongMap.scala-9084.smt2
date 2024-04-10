; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109290 () Bool)

(assert start!109290)

(declare-fun b_free!28779 () Bool)

(declare-fun b_next!28779 () Bool)

(assert (=> start!109290 (= b_free!28779 (not b_next!28779))))

(declare-fun tp!101456 () Bool)

(declare-fun b_and!46869 () Bool)

(assert (=> start!109290 (= tp!101456 b_and!46869)))

(declare-fun b!1293224 () Bool)

(declare-fun res!859336 () Bool)

(declare-fun e!738069 () Bool)

(assert (=> b!1293224 (=> (not res!859336) (not e!738069))))

(declare-datatypes ((V!50995 0))(
  ( (V!50996 (val!17284 Int)) )
))
(declare-fun minValue!1387 () V!50995)

(declare-fun zeroValue!1387 () V!50995)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16311 0))(
  ( (ValueCellFull!16311 (v!19887 V!50995)) (EmptyCell!16311) )
))
(declare-datatypes ((array!85868 0))(
  ( (array!85869 (arr!41435 (Array (_ BitVec 32) ValueCell!16311)) (size!41985 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85868)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85870 0))(
  ( (array!85871 (arr!41436 (Array (_ BitVec 32) (_ BitVec 64))) (size!41986 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85870)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22242 0))(
  ( (tuple2!22243 (_1!11132 (_ BitVec 64)) (_2!11132 V!50995)) )
))
(declare-datatypes ((List!29391 0))(
  ( (Nil!29388) (Cons!29387 (h!30596 tuple2!22242) (t!42955 List!29391)) )
))
(declare-datatypes ((ListLongMap!19899 0))(
  ( (ListLongMap!19900 (toList!9965 List!29391)) )
))
(declare-fun contains!8083 (ListLongMap!19899 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5007 (array!85870 array!85868 (_ BitVec 32) (_ BitVec 32) V!50995 V!50995 (_ BitVec 32) Int) ListLongMap!19899)

(assert (=> b!1293224 (= res!859336 (contains!8083 (getCurrentListMap!5007 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1293225 () Bool)

(declare-fun res!859341 () Bool)

(assert (=> b!1293225 (=> (not res!859341) (not e!738069))))

(declare-datatypes ((List!29392 0))(
  ( (Nil!29389) (Cons!29388 (h!30597 (_ BitVec 64)) (t!42956 List!29392)) )
))
(declare-fun arrayNoDuplicates!0 (array!85870 (_ BitVec 32) List!29392) Bool)

(assert (=> b!1293225 (= res!859341 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29389))))

(declare-fun mapIsEmpty!53189 () Bool)

(declare-fun mapRes!53189 () Bool)

(assert (=> mapIsEmpty!53189 mapRes!53189))

(declare-fun b!1293226 () Bool)

(declare-fun res!859343 () Bool)

(assert (=> b!1293226 (=> (not res!859343) (not e!738069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293226 (= res!859343 (not (validKeyInArray!0 (select (arr!41436 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53189 () Bool)

(declare-fun tp!101455 () Bool)

(declare-fun e!738068 () Bool)

(assert (=> mapNonEmpty!53189 (= mapRes!53189 (and tp!101455 e!738068))))

(declare-fun mapValue!53189 () ValueCell!16311)

(declare-fun mapKey!53189 () (_ BitVec 32))

(declare-fun mapRest!53189 () (Array (_ BitVec 32) ValueCell!16311))

(assert (=> mapNonEmpty!53189 (= (arr!41435 _values!1445) (store mapRest!53189 mapKey!53189 mapValue!53189))))

(declare-fun b!1293227 () Bool)

(declare-fun e!738067 () Bool)

(assert (=> b!1293227 (= e!738069 (not e!738067))))

(declare-fun res!859344 () Bool)

(assert (=> b!1293227 (=> res!859344 e!738067)))

(assert (=> b!1293227 (= res!859344 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293227 (not (contains!8083 (ListLongMap!19900 Nil!29388) k0!1205))))

(declare-datatypes ((Unit!42828 0))(
  ( (Unit!42829) )
))
(declare-fun lt!579497 () Unit!42828)

(declare-fun emptyContainsNothing!135 ((_ BitVec 64)) Unit!42828)

(assert (=> b!1293227 (= lt!579497 (emptyContainsNothing!135 k0!1205))))

(declare-fun b!1293228 () Bool)

(assert (=> b!1293228 (= e!738067 true)))

(declare-fun lt!579495 () ListLongMap!19899)

(declare-fun +!4399 (ListLongMap!19899 tuple2!22242) ListLongMap!19899)

(assert (=> b!1293228 (not (contains!8083 (+!4399 lt!579495 (tuple2!22243 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579496 () Unit!42828)

(declare-fun addStillNotContains!417 (ListLongMap!19899 (_ BitVec 64) V!50995 (_ BitVec 64)) Unit!42828)

(assert (=> b!1293228 (= lt!579496 (addStillNotContains!417 lt!579495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6031 (array!85870 array!85868 (_ BitVec 32) (_ BitVec 32) V!50995 V!50995 (_ BitVec 32) Int) ListLongMap!19899)

(assert (=> b!1293228 (= lt!579495 (getCurrentListMapNoExtraKeys!6031 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293229 () Bool)

(declare-fun res!859338 () Bool)

(assert (=> b!1293229 (=> (not res!859338) (not e!738069))))

(assert (=> b!1293229 (= res!859338 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41986 _keys!1741))))))

(declare-fun res!859340 () Bool)

(assert (=> start!109290 (=> (not res!859340) (not e!738069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109290 (= res!859340 (validMask!0 mask!2175))))

(assert (=> start!109290 e!738069))

(declare-fun tp_is_empty!34419 () Bool)

(assert (=> start!109290 tp_is_empty!34419))

(assert (=> start!109290 true))

(declare-fun e!738071 () Bool)

(declare-fun array_inv!31393 (array!85868) Bool)

(assert (=> start!109290 (and (array_inv!31393 _values!1445) e!738071)))

(declare-fun array_inv!31394 (array!85870) Bool)

(assert (=> start!109290 (array_inv!31394 _keys!1741)))

(assert (=> start!109290 tp!101456))

(declare-fun b!1293230 () Bool)

(assert (=> b!1293230 (= e!738068 tp_is_empty!34419)))

(declare-fun b!1293231 () Bool)

(declare-fun res!859337 () Bool)

(assert (=> b!1293231 (=> (not res!859337) (not e!738069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85870 (_ BitVec 32)) Bool)

(assert (=> b!1293231 (= res!859337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293232 () Bool)

(declare-fun res!859342 () Bool)

(assert (=> b!1293232 (=> (not res!859342) (not e!738069))))

(assert (=> b!1293232 (= res!859342 (and (= (size!41985 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41986 _keys!1741) (size!41985 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293233 () Bool)

(declare-fun e!738070 () Bool)

(assert (=> b!1293233 (= e!738071 (and e!738070 mapRes!53189))))

(declare-fun condMapEmpty!53189 () Bool)

(declare-fun mapDefault!53189 () ValueCell!16311)

(assert (=> b!1293233 (= condMapEmpty!53189 (= (arr!41435 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16311)) mapDefault!53189)))))

(declare-fun b!1293234 () Bool)

(declare-fun res!859339 () Bool)

(assert (=> b!1293234 (=> (not res!859339) (not e!738069))))

(assert (=> b!1293234 (= res!859339 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41986 _keys!1741))))))

(declare-fun b!1293235 () Bool)

(assert (=> b!1293235 (= e!738070 tp_is_empty!34419)))

(assert (= (and start!109290 res!859340) b!1293232))

(assert (= (and b!1293232 res!859342) b!1293231))

(assert (= (and b!1293231 res!859337) b!1293225))

(assert (= (and b!1293225 res!859341) b!1293234))

(assert (= (and b!1293234 res!859339) b!1293224))

(assert (= (and b!1293224 res!859336) b!1293229))

(assert (= (and b!1293229 res!859338) b!1293226))

(assert (= (and b!1293226 res!859343) b!1293227))

(assert (= (and b!1293227 (not res!859344)) b!1293228))

(assert (= (and b!1293233 condMapEmpty!53189) mapIsEmpty!53189))

(assert (= (and b!1293233 (not condMapEmpty!53189)) mapNonEmpty!53189))

(get-info :version)

(assert (= (and mapNonEmpty!53189 ((_ is ValueCellFull!16311) mapValue!53189)) b!1293230))

(assert (= (and b!1293233 ((_ is ValueCellFull!16311) mapDefault!53189)) b!1293235))

(assert (= start!109290 b!1293233))

(declare-fun m!1185643 () Bool)

(assert (=> b!1293228 m!1185643))

(assert (=> b!1293228 m!1185643))

(declare-fun m!1185645 () Bool)

(assert (=> b!1293228 m!1185645))

(declare-fun m!1185647 () Bool)

(assert (=> b!1293228 m!1185647))

(declare-fun m!1185649 () Bool)

(assert (=> b!1293228 m!1185649))

(declare-fun m!1185651 () Bool)

(assert (=> b!1293226 m!1185651))

(assert (=> b!1293226 m!1185651))

(declare-fun m!1185653 () Bool)

(assert (=> b!1293226 m!1185653))

(declare-fun m!1185655 () Bool)

(assert (=> b!1293225 m!1185655))

(declare-fun m!1185657 () Bool)

(assert (=> b!1293227 m!1185657))

(declare-fun m!1185659 () Bool)

(assert (=> b!1293227 m!1185659))

(declare-fun m!1185661 () Bool)

(assert (=> mapNonEmpty!53189 m!1185661))

(declare-fun m!1185663 () Bool)

(assert (=> start!109290 m!1185663))

(declare-fun m!1185665 () Bool)

(assert (=> start!109290 m!1185665))

(declare-fun m!1185667 () Bool)

(assert (=> start!109290 m!1185667))

(declare-fun m!1185669 () Bool)

(assert (=> b!1293231 m!1185669))

(declare-fun m!1185671 () Bool)

(assert (=> b!1293224 m!1185671))

(assert (=> b!1293224 m!1185671))

(declare-fun m!1185673 () Bool)

(assert (=> b!1293224 m!1185673))

(check-sat (not b!1293227) (not mapNonEmpty!53189) (not start!109290) (not b_next!28779) (not b!1293225) tp_is_empty!34419 (not b!1293228) (not b!1293226) b_and!46869 (not b!1293231) (not b!1293224))
(check-sat b_and!46869 (not b_next!28779))
