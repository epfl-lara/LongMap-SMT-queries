; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108702 () Bool)

(assert start!108702)

(declare-fun b_free!28215 () Bool)

(declare-fun b_next!28215 () Bool)

(assert (=> start!108702 (= b_free!28215 (not b_next!28215))))

(declare-fun tp!99760 () Bool)

(declare-fun b_and!46281 () Bool)

(assert (=> start!108702 (= tp!99760 b_and!46281)))

(declare-fun res!852448 () Bool)

(declare-fun e!733174 () Bool)

(assert (=> start!108702 (=> (not res!852448) (not e!733174))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108702 (= res!852448 (validMask!0 mask!2175))))

(assert (=> start!108702 e!733174))

(declare-fun tp_is_empty!33855 () Bool)

(assert (=> start!108702 tp_is_empty!33855))

(assert (=> start!108702 true))

(declare-datatypes ((V!50243 0))(
  ( (V!50244 (val!17002 Int)) )
))
(declare-datatypes ((ValueCell!16029 0))(
  ( (ValueCellFull!16029 (v!19604 V!50243)) (EmptyCell!16029) )
))
(declare-datatypes ((array!84772 0))(
  ( (array!84773 (arr!40888 (Array (_ BitVec 32) ValueCell!16029)) (size!41438 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84772)

(declare-fun e!733171 () Bool)

(declare-fun array_inv!31017 (array!84772) Bool)

(assert (=> start!108702 (and (array_inv!31017 _values!1445) e!733171)))

(declare-datatypes ((array!84774 0))(
  ( (array!84775 (arr!40889 (Array (_ BitVec 32) (_ BitVec 64))) (size!41439 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84774)

(declare-fun array_inv!31018 (array!84774) Bool)

(assert (=> start!108702 (array_inv!31018 _keys!1741)))

(assert (=> start!108702 tp!99760))

(declare-fun b!1283308 () Bool)

(declare-fun res!852455 () Bool)

(assert (=> b!1283308 (=> (not res!852455) (not e!733174))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1283308 (= res!852455 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41439 _keys!1741))))))

(declare-fun b!1283309 () Bool)

(declare-fun res!852451 () Bool)

(assert (=> b!1283309 (=> (not res!852451) (not e!733174))))

(declare-fun minValue!1387 () V!50243)

(declare-fun zeroValue!1387 () V!50243)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21772 0))(
  ( (tuple2!21773 (_1!10897 (_ BitVec 64)) (_2!10897 V!50243)) )
))
(declare-datatypes ((List!28969 0))(
  ( (Nil!28966) (Cons!28965 (h!30174 tuple2!21772) (t!42513 List!28969)) )
))
(declare-datatypes ((ListLongMap!19429 0))(
  ( (ListLongMap!19430 (toList!9730 List!28969)) )
))
(declare-fun contains!7847 (ListLongMap!19429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4813 (array!84774 array!84772 (_ BitVec 32) (_ BitVec 32) V!50243 V!50243 (_ BitVec 32) Int) ListLongMap!19429)

(assert (=> b!1283309 (= res!852451 (contains!7847 (getCurrentListMap!4813 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283310 () Bool)

(declare-fun res!852454 () Bool)

(assert (=> b!1283310 (=> (not res!852454) (not e!733174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84774 (_ BitVec 32)) Bool)

(assert (=> b!1283310 (= res!852454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283311 () Bool)

(declare-fun res!852456 () Bool)

(assert (=> b!1283311 (=> (not res!852456) (not e!733174))))

(assert (=> b!1283311 (= res!852456 (and (= (size!41438 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41439 _keys!1741) (size!41438 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52340 () Bool)

(declare-fun mapRes!52340 () Bool)

(declare-fun tp!99761 () Bool)

(declare-fun e!733175 () Bool)

(assert (=> mapNonEmpty!52340 (= mapRes!52340 (and tp!99761 e!733175))))

(declare-fun mapValue!52340 () ValueCell!16029)

(declare-fun mapRest!52340 () (Array (_ BitVec 32) ValueCell!16029))

(declare-fun mapKey!52340 () (_ BitVec 32))

(assert (=> mapNonEmpty!52340 (= (arr!40888 _values!1445) (store mapRest!52340 mapKey!52340 mapValue!52340))))

(declare-fun b!1283312 () Bool)

(assert (=> b!1283312 (= e!733174 (not true))))

(declare-fun lt!576633 () ListLongMap!19429)

(assert (=> b!1283312 (contains!7847 lt!576633 k0!1205)))

(declare-datatypes ((Unit!42471 0))(
  ( (Unit!42472) )
))
(declare-fun lt!576634 () Unit!42471)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!6 ((_ BitVec 64) (_ BitVec 64) V!50243 ListLongMap!19429) Unit!42471)

(assert (=> b!1283312 (= lt!576634 (lemmaInListMapAfterAddingDiffThenInBefore!6 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576633))))

(declare-fun +!4282 (ListLongMap!19429 tuple2!21772) ListLongMap!19429)

(declare-fun getCurrentListMapNoExtraKeys!5912 (array!84774 array!84772 (_ BitVec 32) (_ BitVec 32) V!50243 V!50243 (_ BitVec 32) Int) ListLongMap!19429)

(assert (=> b!1283312 (= lt!576633 (+!4282 (getCurrentListMapNoExtraKeys!5912 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21773 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283313 () Bool)

(declare-fun e!733173 () Bool)

(assert (=> b!1283313 (= e!733173 tp_is_empty!33855)))

(declare-fun b!1283314 () Bool)

(assert (=> b!1283314 (= e!733175 tp_is_empty!33855)))

(declare-fun mapIsEmpty!52340 () Bool)

(assert (=> mapIsEmpty!52340 mapRes!52340))

(declare-fun b!1283315 () Bool)

(declare-fun res!852449 () Bool)

(assert (=> b!1283315 (=> (not res!852449) (not e!733174))))

(assert (=> b!1283315 (= res!852449 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283316 () Bool)

(declare-fun res!852450 () Bool)

(assert (=> b!1283316 (=> (not res!852450) (not e!733174))))

(assert (=> b!1283316 (= res!852450 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41439 _keys!1741))))))

(declare-fun b!1283317 () Bool)

(declare-fun res!852452 () Bool)

(assert (=> b!1283317 (=> (not res!852452) (not e!733174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283317 (= res!852452 (validKeyInArray!0 (select (arr!40889 _keys!1741) from!2144)))))

(declare-fun b!1283318 () Bool)

(assert (=> b!1283318 (= e!733171 (and e!733173 mapRes!52340))))

(declare-fun condMapEmpty!52340 () Bool)

(declare-fun mapDefault!52340 () ValueCell!16029)

(assert (=> b!1283318 (= condMapEmpty!52340 (= (arr!40888 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16029)) mapDefault!52340)))))

(declare-fun b!1283319 () Bool)

(declare-fun res!852453 () Bool)

(assert (=> b!1283319 (=> (not res!852453) (not e!733174))))

(declare-datatypes ((List!28970 0))(
  ( (Nil!28967) (Cons!28966 (h!30175 (_ BitVec 64)) (t!42514 List!28970)) )
))
(declare-fun arrayNoDuplicates!0 (array!84774 (_ BitVec 32) List!28970) Bool)

(assert (=> b!1283319 (= res!852453 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28967))))

(assert (= (and start!108702 res!852448) b!1283311))

(assert (= (and b!1283311 res!852456) b!1283310))

(assert (= (and b!1283310 res!852454) b!1283319))

(assert (= (and b!1283319 res!852453) b!1283316))

(assert (= (and b!1283316 res!852450) b!1283309))

(assert (= (and b!1283309 res!852451) b!1283308))

(assert (= (and b!1283308 res!852455) b!1283317))

(assert (= (and b!1283317 res!852452) b!1283315))

(assert (= (and b!1283315 res!852449) b!1283312))

(assert (= (and b!1283318 condMapEmpty!52340) mapIsEmpty!52340))

(assert (= (and b!1283318 (not condMapEmpty!52340)) mapNonEmpty!52340))

(get-info :version)

(assert (= (and mapNonEmpty!52340 ((_ is ValueCellFull!16029) mapValue!52340)) b!1283314))

(assert (= (and b!1283318 ((_ is ValueCellFull!16029) mapDefault!52340)) b!1283313))

(assert (= start!108702 b!1283318))

(declare-fun m!1177261 () Bool)

(assert (=> b!1283319 m!1177261))

(declare-fun m!1177263 () Bool)

(assert (=> b!1283309 m!1177263))

(assert (=> b!1283309 m!1177263))

(declare-fun m!1177265 () Bool)

(assert (=> b!1283309 m!1177265))

(declare-fun m!1177267 () Bool)

(assert (=> b!1283310 m!1177267))

(declare-fun m!1177269 () Bool)

(assert (=> b!1283317 m!1177269))

(assert (=> b!1283317 m!1177269))

(declare-fun m!1177271 () Bool)

(assert (=> b!1283317 m!1177271))

(declare-fun m!1177273 () Bool)

(assert (=> start!108702 m!1177273))

(declare-fun m!1177275 () Bool)

(assert (=> start!108702 m!1177275))

(declare-fun m!1177277 () Bool)

(assert (=> start!108702 m!1177277))

(declare-fun m!1177279 () Bool)

(assert (=> mapNonEmpty!52340 m!1177279))

(declare-fun m!1177281 () Bool)

(assert (=> b!1283312 m!1177281))

(declare-fun m!1177283 () Bool)

(assert (=> b!1283312 m!1177283))

(declare-fun m!1177285 () Bool)

(assert (=> b!1283312 m!1177285))

(assert (=> b!1283312 m!1177285))

(declare-fun m!1177287 () Bool)

(assert (=> b!1283312 m!1177287))

(check-sat (not b!1283319) (not b!1283312) (not b!1283309) (not start!108702) (not mapNonEmpty!52340) (not b_next!28215) (not b!1283310) (not b!1283317) b_and!46281 tp_is_empty!33855)
(check-sat b_and!46281 (not b_next!28215))
