; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109554 () Bool)

(assert start!109554)

(declare-fun b_free!28819 () Bool)

(declare-fun b_next!28819 () Bool)

(assert (=> start!109554 (= b_free!28819 (not b_next!28819))))

(declare-fun tp!101575 () Bool)

(declare-fun b_and!46911 () Bool)

(assert (=> start!109554 (= tp!101575 b_and!46911)))

(declare-fun b!1295247 () Bool)

(declare-fun res!860394 () Bool)

(declare-fun e!739272 () Bool)

(assert (=> b!1295247 (=> (not res!860394) (not e!739272))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51049 0))(
  ( (V!51050 (val!17304 Int)) )
))
(declare-datatypes ((ValueCell!16331 0))(
  ( (ValueCellFull!16331 (v!19902 V!51049)) (EmptyCell!16331) )
))
(declare-datatypes ((array!85973 0))(
  ( (array!85974 (arr!41483 (Array (_ BitVec 32) ValueCell!16331)) (size!42034 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85973)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85975 0))(
  ( (array!85976 (arr!41484 (Array (_ BitVec 32) (_ BitVec 64))) (size!42035 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85975)

(assert (=> b!1295247 (= res!860394 (and (= (size!42034 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42035 _keys!1741) (size!42034 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295248 () Bool)

(declare-fun res!860398 () Bool)

(assert (=> b!1295248 (=> (not res!860398) (not e!739272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85975 (_ BitVec 32)) Bool)

(assert (=> b!1295248 (= res!860398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295249 () Bool)

(declare-fun e!739275 () Bool)

(declare-fun e!739271 () Bool)

(declare-fun mapRes!53249 () Bool)

(assert (=> b!1295249 (= e!739275 (and e!739271 mapRes!53249))))

(declare-fun condMapEmpty!53249 () Bool)

(declare-fun mapDefault!53249 () ValueCell!16331)

(assert (=> b!1295249 (= condMapEmpty!53249 (= (arr!41483 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16331)) mapDefault!53249)))))

(declare-fun b!1295250 () Bool)

(declare-fun res!860400 () Bool)

(assert (=> b!1295250 (=> (not res!860400) (not e!739272))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295250 (= res!860400 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42035 _keys!1741))))))

(declare-fun mapIsEmpty!53249 () Bool)

(assert (=> mapIsEmpty!53249 mapRes!53249))

(declare-fun b!1295251 () Bool)

(declare-fun res!860395 () Bool)

(assert (=> b!1295251 (=> (not res!860395) (not e!739272))))

(assert (=> b!1295251 (= res!860395 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42035 _keys!1741))))))

(declare-fun b!1295252 () Bool)

(declare-fun res!860401 () Bool)

(assert (=> b!1295252 (=> (not res!860401) (not e!739272))))

(declare-fun minValue!1387 () V!51049)

(declare-fun zeroValue!1387 () V!51049)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22278 0))(
  ( (tuple2!22279 (_1!11150 (_ BitVec 64)) (_2!11150 V!51049)) )
))
(declare-datatypes ((List!29445 0))(
  ( (Nil!29442) (Cons!29441 (h!30659 tuple2!22278) (t!43001 List!29445)) )
))
(declare-datatypes ((ListLongMap!19943 0))(
  ( (ListLongMap!19944 (toList!9987 List!29445)) )
))
(declare-fun contains!8118 (ListLongMap!19943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5015 (array!85975 array!85973 (_ BitVec 32) (_ BitVec 32) V!51049 V!51049 (_ BitVec 32) Int) ListLongMap!19943)

(assert (=> b!1295252 (= res!860401 (contains!8118 (getCurrentListMap!5015 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295253 () Bool)

(declare-fun e!739274 () Bool)

(declare-fun tp_is_empty!34459 () Bool)

(assert (=> b!1295253 (= e!739274 tp_is_empty!34459)))

(declare-fun mapNonEmpty!53249 () Bool)

(declare-fun tp!101576 () Bool)

(assert (=> mapNonEmpty!53249 (= mapRes!53249 (and tp!101576 e!739274))))

(declare-fun mapRest!53249 () (Array (_ BitVec 32) ValueCell!16331))

(declare-fun mapValue!53249 () ValueCell!16331)

(declare-fun mapKey!53249 () (_ BitVec 32))

(assert (=> mapNonEmpty!53249 (= (arr!41483 _values!1445) (store mapRest!53249 mapKey!53249 mapValue!53249))))

(declare-fun b!1295254 () Bool)

(assert (=> b!1295254 (= e!739272 (not true))))

(assert (=> b!1295254 (not (contains!8118 (ListLongMap!19944 Nil!29442) k0!1205))))

(declare-datatypes ((Unit!42811 0))(
  ( (Unit!42812) )
))
(declare-fun lt!580155 () Unit!42811)

(declare-fun emptyContainsNothing!148 ((_ BitVec 64)) Unit!42811)

(assert (=> b!1295254 (= lt!580155 (emptyContainsNothing!148 k0!1205))))

(declare-fun b!1295256 () Bool)

(declare-fun res!860399 () Bool)

(assert (=> b!1295256 (=> (not res!860399) (not e!739272))))

(declare-datatypes ((List!29446 0))(
  ( (Nil!29443) (Cons!29442 (h!30660 (_ BitVec 64)) (t!43002 List!29446)) )
))
(declare-fun arrayNoDuplicates!0 (array!85975 (_ BitVec 32) List!29446) Bool)

(assert (=> b!1295256 (= res!860399 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29443))))

(declare-fun b!1295257 () Bool)

(declare-fun res!860396 () Bool)

(assert (=> b!1295257 (=> (not res!860396) (not e!739272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295257 (= res!860396 (not (validKeyInArray!0 (select (arr!41484 _keys!1741) from!2144))))))

(declare-fun res!860397 () Bool)

(assert (=> start!109554 (=> (not res!860397) (not e!739272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109554 (= res!860397 (validMask!0 mask!2175))))

(assert (=> start!109554 e!739272))

(assert (=> start!109554 tp_is_empty!34459))

(assert (=> start!109554 true))

(declare-fun array_inv!31651 (array!85973) Bool)

(assert (=> start!109554 (and (array_inv!31651 _values!1445) e!739275)))

(declare-fun array_inv!31652 (array!85975) Bool)

(assert (=> start!109554 (array_inv!31652 _keys!1741)))

(assert (=> start!109554 tp!101575))

(declare-fun b!1295255 () Bool)

(assert (=> b!1295255 (= e!739271 tp_is_empty!34459)))

(assert (= (and start!109554 res!860397) b!1295247))

(assert (= (and b!1295247 res!860394) b!1295248))

(assert (= (and b!1295248 res!860398) b!1295256))

(assert (= (and b!1295256 res!860399) b!1295251))

(assert (= (and b!1295251 res!860395) b!1295252))

(assert (= (and b!1295252 res!860401) b!1295250))

(assert (= (and b!1295250 res!860400) b!1295257))

(assert (= (and b!1295257 res!860396) b!1295254))

(assert (= (and b!1295249 condMapEmpty!53249) mapIsEmpty!53249))

(assert (= (and b!1295249 (not condMapEmpty!53249)) mapNonEmpty!53249))

(get-info :version)

(assert (= (and mapNonEmpty!53249 ((_ is ValueCellFull!16331) mapValue!53249)) b!1295253))

(assert (= (and b!1295249 ((_ is ValueCellFull!16331) mapDefault!53249)) b!1295255))

(assert (= start!109554 b!1295249))

(declare-fun m!1187901 () Bool)

(assert (=> b!1295248 m!1187901))

(declare-fun m!1187903 () Bool)

(assert (=> start!109554 m!1187903))

(declare-fun m!1187905 () Bool)

(assert (=> start!109554 m!1187905))

(declare-fun m!1187907 () Bool)

(assert (=> start!109554 m!1187907))

(declare-fun m!1187909 () Bool)

(assert (=> b!1295252 m!1187909))

(assert (=> b!1295252 m!1187909))

(declare-fun m!1187911 () Bool)

(assert (=> b!1295252 m!1187911))

(declare-fun m!1187913 () Bool)

(assert (=> mapNonEmpty!53249 m!1187913))

(declare-fun m!1187915 () Bool)

(assert (=> b!1295256 m!1187915))

(declare-fun m!1187917 () Bool)

(assert (=> b!1295254 m!1187917))

(declare-fun m!1187919 () Bool)

(assert (=> b!1295254 m!1187919))

(declare-fun m!1187921 () Bool)

(assert (=> b!1295257 m!1187921))

(assert (=> b!1295257 m!1187921))

(declare-fun m!1187923 () Bool)

(assert (=> b!1295257 m!1187923))

(check-sat b_and!46911 tp_is_empty!34459 (not b_next!28819) (not mapNonEmpty!53249) (not b!1295252) (not b!1295257) (not b!1295256) (not start!109554) (not b!1295254) (not b!1295248))
(check-sat b_and!46911 (not b_next!28819))
