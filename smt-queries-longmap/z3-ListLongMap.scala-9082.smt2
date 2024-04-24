; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109500 () Bool)

(assert start!109500)

(declare-fun b_free!28765 () Bool)

(declare-fun b_next!28765 () Bool)

(assert (=> start!109500 (= b_free!28765 (not b_next!28765))))

(declare-fun tp!101413 () Bool)

(declare-fun b_and!46857 () Bool)

(assert (=> start!109500 (= tp!101413 b_and!46857)))

(declare-fun mapIsEmpty!53168 () Bool)

(declare-fun mapRes!53168 () Bool)

(assert (=> mapIsEmpty!53168 mapRes!53168))

(declare-fun b!1294277 () Bool)

(declare-fun e!738788 () Bool)

(declare-fun e!738792 () Bool)

(assert (=> b!1294277 (= e!738788 (and e!738792 mapRes!53168))))

(declare-fun condMapEmpty!53168 () Bool)

(declare-datatypes ((V!50977 0))(
  ( (V!50978 (val!17277 Int)) )
))
(declare-datatypes ((ValueCell!16304 0))(
  ( (ValueCellFull!16304 (v!19875 V!50977)) (EmptyCell!16304) )
))
(declare-datatypes ((array!85873 0))(
  ( (array!85874 (arr!41433 (Array (_ BitVec 32) ValueCell!16304)) (size!41984 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85873)

(declare-fun mapDefault!53168 () ValueCell!16304)

(assert (=> b!1294277 (= condMapEmpty!53168 (= (arr!41433 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16304)) mapDefault!53168)))))

(declare-fun b!1294278 () Bool)

(declare-fun res!859675 () Bool)

(declare-fun e!738787 () Bool)

(assert (=> b!1294278 (=> (not res!859675) (not e!738787))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85875 0))(
  ( (array!85876 (arr!41434 (Array (_ BitVec 32) (_ BitVec 64))) (size!41985 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85875)

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1294278 (= res!859675 (and (= (size!41984 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41985 _keys!1741) (size!41984 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!859668 () Bool)

(assert (=> start!109500 (=> (not res!859668) (not e!738787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109500 (= res!859668 (validMask!0 mask!2175))))

(assert (=> start!109500 e!738787))

(declare-fun tp_is_empty!34405 () Bool)

(assert (=> start!109500 tp_is_empty!34405))

(assert (=> start!109500 true))

(declare-fun array_inv!31617 (array!85873) Bool)

(assert (=> start!109500 (and (array_inv!31617 _values!1445) e!738788)))

(declare-fun array_inv!31618 (array!85875) Bool)

(assert (=> start!109500 (array_inv!31618 _keys!1741)))

(assert (=> start!109500 tp!101413))

(declare-fun b!1294279 () Bool)

(declare-fun e!738791 () Bool)

(assert (=> b!1294279 (= e!738791 tp_is_empty!34405)))

(declare-fun b!1294280 () Bool)

(declare-fun res!859673 () Bool)

(assert (=> b!1294280 (=> (not res!859673) (not e!738787))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294280 (= res!859673 (not (validKeyInArray!0 (select (arr!41434 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53168 () Bool)

(declare-fun tp!101414 () Bool)

(assert (=> mapNonEmpty!53168 (= mapRes!53168 (and tp!101414 e!738791))))

(declare-fun mapValue!53168 () ValueCell!16304)

(declare-fun mapKey!53168 () (_ BitVec 32))

(declare-fun mapRest!53168 () (Array (_ BitVec 32) ValueCell!16304))

(assert (=> mapNonEmpty!53168 (= (arr!41433 _values!1445) (store mapRest!53168 mapKey!53168 mapValue!53168))))

(declare-fun b!1294281 () Bool)

(assert (=> b!1294281 (= e!738792 tp_is_empty!34405)))

(declare-fun b!1294282 () Bool)

(declare-fun res!859674 () Bool)

(assert (=> b!1294282 (=> (not res!859674) (not e!738787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85875 (_ BitVec 32)) Bool)

(assert (=> b!1294282 (= res!859674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294283 () Bool)

(declare-fun res!859671 () Bool)

(assert (=> b!1294283 (=> (not res!859671) (not e!738787))))

(declare-fun minValue!1387 () V!50977)

(declare-fun zeroValue!1387 () V!50977)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22244 0))(
  ( (tuple2!22245 (_1!11133 (_ BitVec 64)) (_2!11133 V!50977)) )
))
(declare-datatypes ((List!29410 0))(
  ( (Nil!29407) (Cons!29406 (h!30624 tuple2!22244) (t!42966 List!29410)) )
))
(declare-datatypes ((ListLongMap!19909 0))(
  ( (ListLongMap!19910 (toList!9970 List!29410)) )
))
(declare-fun contains!8101 (ListLongMap!19909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5000 (array!85875 array!85873 (_ BitVec 32) (_ BitVec 32) V!50977 V!50977 (_ BitVec 32) Int) ListLongMap!19909)

(assert (=> b!1294283 (= res!859671 (contains!8101 (getCurrentListMap!5000 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294284 () Bool)

(declare-fun e!738790 () Bool)

(assert (=> b!1294284 (= e!738790 true)))

(declare-fun lt!579917 () ListLongMap!19909)

(declare-fun +!4441 (ListLongMap!19909 tuple2!22244) ListLongMap!19909)

(assert (=> b!1294284 (not (contains!8101 (+!4441 lt!579917 (tuple2!22245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42779 0))(
  ( (Unit!42780) )
))
(declare-fun lt!579916 () Unit!42779)

(declare-fun addStillNotContains!417 (ListLongMap!19909 (_ BitVec 64) V!50977 (_ BitVec 64)) Unit!42779)

(assert (=> b!1294284 (= lt!579916 (addStillNotContains!417 lt!579917 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6081 (array!85875 array!85873 (_ BitVec 32) (_ BitVec 32) V!50977 V!50977 (_ BitVec 32) Int) ListLongMap!19909)

(assert (=> b!1294284 (= lt!579917 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1294285 () Bool)

(assert (=> b!1294285 (= e!738787 (not e!738790))))

(declare-fun res!859669 () Bool)

(assert (=> b!1294285 (=> res!859669 e!738790)))

(assert (=> b!1294285 (= res!859669 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1294285 (not (contains!8101 (ListLongMap!19910 Nil!29407) k0!1205))))

(declare-fun lt!579918 () Unit!42779)

(declare-fun emptyContainsNothing!133 ((_ BitVec 64)) Unit!42779)

(assert (=> b!1294285 (= lt!579918 (emptyContainsNothing!133 k0!1205))))

(declare-fun b!1294286 () Bool)

(declare-fun res!859667 () Bool)

(assert (=> b!1294286 (=> (not res!859667) (not e!738787))))

(assert (=> b!1294286 (= res!859667 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41985 _keys!1741))))))

(declare-fun b!1294287 () Bool)

(declare-fun res!859670 () Bool)

(assert (=> b!1294287 (=> (not res!859670) (not e!738787))))

(assert (=> b!1294287 (= res!859670 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41985 _keys!1741))))))

(declare-fun b!1294288 () Bool)

(declare-fun res!859672 () Bool)

(assert (=> b!1294288 (=> (not res!859672) (not e!738787))))

(declare-datatypes ((List!29411 0))(
  ( (Nil!29408) (Cons!29407 (h!30625 (_ BitVec 64)) (t!42967 List!29411)) )
))
(declare-fun arrayNoDuplicates!0 (array!85875 (_ BitVec 32) List!29411) Bool)

(assert (=> b!1294288 (= res!859672 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29408))))

(assert (= (and start!109500 res!859668) b!1294278))

(assert (= (and b!1294278 res!859675) b!1294282))

(assert (= (and b!1294282 res!859674) b!1294288))

(assert (= (and b!1294288 res!859672) b!1294286))

(assert (= (and b!1294286 res!859667) b!1294283))

(assert (= (and b!1294283 res!859671) b!1294287))

(assert (= (and b!1294287 res!859670) b!1294280))

(assert (= (and b!1294280 res!859673) b!1294285))

(assert (= (and b!1294285 (not res!859669)) b!1294284))

(assert (= (and b!1294277 condMapEmpty!53168) mapIsEmpty!53168))

(assert (= (and b!1294277 (not condMapEmpty!53168)) mapNonEmpty!53168))

(get-info :version)

(assert (= (and mapNonEmpty!53168 ((_ is ValueCellFull!16304) mapValue!53168)) b!1294279))

(assert (= (and b!1294277 ((_ is ValueCellFull!16304) mapDefault!53168)) b!1294281))

(assert (= start!109500 b!1294277))

(declare-fun m!1187037 () Bool)

(assert (=> b!1294283 m!1187037))

(assert (=> b!1294283 m!1187037))

(declare-fun m!1187039 () Bool)

(assert (=> b!1294283 m!1187039))

(declare-fun m!1187041 () Bool)

(assert (=> start!109500 m!1187041))

(declare-fun m!1187043 () Bool)

(assert (=> start!109500 m!1187043))

(declare-fun m!1187045 () Bool)

(assert (=> start!109500 m!1187045))

(declare-fun m!1187047 () Bool)

(assert (=> b!1294282 m!1187047))

(declare-fun m!1187049 () Bool)

(assert (=> mapNonEmpty!53168 m!1187049))

(declare-fun m!1187051 () Bool)

(assert (=> b!1294285 m!1187051))

(declare-fun m!1187053 () Bool)

(assert (=> b!1294285 m!1187053))

(declare-fun m!1187055 () Bool)

(assert (=> b!1294284 m!1187055))

(assert (=> b!1294284 m!1187055))

(declare-fun m!1187057 () Bool)

(assert (=> b!1294284 m!1187057))

(declare-fun m!1187059 () Bool)

(assert (=> b!1294284 m!1187059))

(declare-fun m!1187061 () Bool)

(assert (=> b!1294284 m!1187061))

(declare-fun m!1187063 () Bool)

(assert (=> b!1294280 m!1187063))

(assert (=> b!1294280 m!1187063))

(declare-fun m!1187065 () Bool)

(assert (=> b!1294280 m!1187065))

(declare-fun m!1187067 () Bool)

(assert (=> b!1294288 m!1187067))

(check-sat (not b!1294282) (not b!1294285) (not b!1294288) (not b!1294284) (not b!1294283) (not start!109500) (not mapNonEmpty!53168) (not b_next!28765) tp_is_empty!34405 (not b!1294280) b_and!46857)
(check-sat b_and!46857 (not b_next!28765))
