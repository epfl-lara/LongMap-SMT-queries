; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109578 () Bool)

(assert start!109578)

(declare-fun b_free!28843 () Bool)

(declare-fun b_next!28843 () Bool)

(assert (=> start!109578 (= b_free!28843 (not b_next!28843))))

(declare-fun tp!101648 () Bool)

(declare-fun b_and!46935 () Bool)

(assert (=> start!109578 (= tp!101648 b_and!46935)))

(declare-fun mapIsEmpty!53285 () Bool)

(declare-fun mapRes!53285 () Bool)

(assert (=> mapIsEmpty!53285 mapRes!53285))

(declare-fun b!1295643 () Bool)

(declare-fun res!860686 () Bool)

(declare-fun e!739454 () Bool)

(assert (=> b!1295643 (=> (not res!860686) (not e!739454))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86021 0))(
  ( (array!86022 (arr!41507 (Array (_ BitVec 32) (_ BitVec 64))) (size!42058 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86021)

(assert (=> b!1295643 (= res!860686 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42058 _keys!1741))))))

(declare-fun b!1295644 () Bool)

(declare-fun res!860689 () Bool)

(assert (=> b!1295644 (=> (not res!860689) (not e!739454))))

(declare-datatypes ((V!51081 0))(
  ( (V!51082 (val!17316 Int)) )
))
(declare-fun minValue!1387 () V!51081)

(declare-fun zeroValue!1387 () V!51081)

(declare-datatypes ((ValueCell!16343 0))(
  ( (ValueCellFull!16343 (v!19914 V!51081)) (EmptyCell!16343) )
))
(declare-datatypes ((array!86023 0))(
  ( (array!86024 (arr!41508 (Array (_ BitVec 32) ValueCell!16343)) (size!42059 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86023)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22296 0))(
  ( (tuple2!22297 (_1!11159 (_ BitVec 64)) (_2!11159 V!51081)) )
))
(declare-datatypes ((List!29464 0))(
  ( (Nil!29461) (Cons!29460 (h!30678 tuple2!22296) (t!43020 List!29464)) )
))
(declare-datatypes ((ListLongMap!19961 0))(
  ( (ListLongMap!19962 (toList!9996 List!29464)) )
))
(declare-fun contains!8127 (ListLongMap!19961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5023 (array!86021 array!86023 (_ BitVec 32) (_ BitVec 32) V!51081 V!51081 (_ BitVec 32) Int) ListLongMap!19961)

(assert (=> b!1295644 (= res!860689 (contains!8127 (getCurrentListMap!5023 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!860682 () Bool)

(assert (=> start!109578 (=> (not res!860682) (not e!739454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109578 (= res!860682 (validMask!0 mask!2175))))

(assert (=> start!109578 e!739454))

(declare-fun tp_is_empty!34483 () Bool)

(assert (=> start!109578 tp_is_empty!34483))

(assert (=> start!109578 true))

(declare-fun e!739455 () Bool)

(declare-fun array_inv!31667 (array!86023) Bool)

(assert (=> start!109578 (and (array_inv!31667 _values!1445) e!739455)))

(declare-fun array_inv!31668 (array!86021) Bool)

(assert (=> start!109578 (array_inv!31668 _keys!1741)))

(assert (=> start!109578 tp!101648))

(declare-fun b!1295645 () Bool)

(declare-fun res!860684 () Bool)

(assert (=> b!1295645 (=> (not res!860684) (not e!739454))))

(declare-datatypes ((List!29465 0))(
  ( (Nil!29462) (Cons!29461 (h!30679 (_ BitVec 64)) (t!43021 List!29465)) )
))
(declare-fun arrayNoDuplicates!0 (array!86021 (_ BitVec 32) List!29465) Bool)

(assert (=> b!1295645 (= res!860684 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29462))))

(declare-fun b!1295646 () Bool)

(declare-fun e!739451 () Bool)

(assert (=> b!1295646 (= e!739451 tp_is_empty!34483)))

(declare-fun b!1295647 () Bool)

(declare-fun res!860688 () Bool)

(assert (=> b!1295647 (=> (not res!860688) (not e!739454))))

(assert (=> b!1295647 (= res!860688 (and (= (size!42059 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42058 _keys!1741) (size!42059 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295648 () Bool)

(declare-fun res!860685 () Bool)

(assert (=> b!1295648 (=> (not res!860685) (not e!739454))))

(assert (=> b!1295648 (= res!860685 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42058 _keys!1741))))))

(declare-fun b!1295649 () Bool)

(assert (=> b!1295649 (= e!739455 (and e!739451 mapRes!53285))))

(declare-fun condMapEmpty!53285 () Bool)

(declare-fun mapDefault!53285 () ValueCell!16343)

(assert (=> b!1295649 (= condMapEmpty!53285 (= (arr!41508 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16343)) mapDefault!53285)))))

(declare-fun mapNonEmpty!53285 () Bool)

(declare-fun tp!101647 () Bool)

(declare-fun e!739452 () Bool)

(assert (=> mapNonEmpty!53285 (= mapRes!53285 (and tp!101647 e!739452))))

(declare-fun mapValue!53285 () ValueCell!16343)

(declare-fun mapKey!53285 () (_ BitVec 32))

(declare-fun mapRest!53285 () (Array (_ BitVec 32) ValueCell!16343))

(assert (=> mapNonEmpty!53285 (= (arr!41508 _values!1445) (store mapRest!53285 mapKey!53285 mapValue!53285))))

(declare-fun b!1295650 () Bool)

(declare-fun res!860687 () Bool)

(assert (=> b!1295650 (=> (not res!860687) (not e!739454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86021 (_ BitVec 32)) Bool)

(assert (=> b!1295650 (= res!860687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295651 () Bool)

(assert (=> b!1295651 (= e!739454 (not true))))

(assert (=> b!1295651 (not (contains!8127 (ListLongMap!19962 Nil!29461) k0!1205))))

(declare-datatypes ((Unit!42825 0))(
  ( (Unit!42826) )
))
(declare-fun lt!580191 () Unit!42825)

(declare-fun emptyContainsNothing!155 ((_ BitVec 64)) Unit!42825)

(assert (=> b!1295651 (= lt!580191 (emptyContainsNothing!155 k0!1205))))

(declare-fun b!1295652 () Bool)

(assert (=> b!1295652 (= e!739452 tp_is_empty!34483)))

(declare-fun b!1295653 () Bool)

(declare-fun res!860683 () Bool)

(assert (=> b!1295653 (=> (not res!860683) (not e!739454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295653 (= res!860683 (not (validKeyInArray!0 (select (arr!41507 _keys!1741) from!2144))))))

(assert (= (and start!109578 res!860682) b!1295647))

(assert (= (and b!1295647 res!860688) b!1295650))

(assert (= (and b!1295650 res!860687) b!1295645))

(assert (= (and b!1295645 res!860684) b!1295648))

(assert (= (and b!1295648 res!860685) b!1295644))

(assert (= (and b!1295644 res!860689) b!1295643))

(assert (= (and b!1295643 res!860686) b!1295653))

(assert (= (and b!1295653 res!860683) b!1295651))

(assert (= (and b!1295649 condMapEmpty!53285) mapIsEmpty!53285))

(assert (= (and b!1295649 (not condMapEmpty!53285)) mapNonEmpty!53285))

(get-info :version)

(assert (= (and mapNonEmpty!53285 ((_ is ValueCellFull!16343) mapValue!53285)) b!1295652))

(assert (= (and b!1295649 ((_ is ValueCellFull!16343) mapDefault!53285)) b!1295646))

(assert (= start!109578 b!1295649))

(declare-fun m!1188189 () Bool)

(assert (=> b!1295645 m!1188189))

(declare-fun m!1188191 () Bool)

(assert (=> start!109578 m!1188191))

(declare-fun m!1188193 () Bool)

(assert (=> start!109578 m!1188193))

(declare-fun m!1188195 () Bool)

(assert (=> start!109578 m!1188195))

(declare-fun m!1188197 () Bool)

(assert (=> mapNonEmpty!53285 m!1188197))

(declare-fun m!1188199 () Bool)

(assert (=> b!1295651 m!1188199))

(declare-fun m!1188201 () Bool)

(assert (=> b!1295651 m!1188201))

(declare-fun m!1188203 () Bool)

(assert (=> b!1295653 m!1188203))

(assert (=> b!1295653 m!1188203))

(declare-fun m!1188205 () Bool)

(assert (=> b!1295653 m!1188205))

(declare-fun m!1188207 () Bool)

(assert (=> b!1295644 m!1188207))

(assert (=> b!1295644 m!1188207))

(declare-fun m!1188209 () Bool)

(assert (=> b!1295644 m!1188209))

(declare-fun m!1188211 () Bool)

(assert (=> b!1295650 m!1188211))

(check-sat (not b_next!28843) b_and!46935 (not b!1295645) (not b!1295644) (not b!1295653) (not b!1295651) (not mapNonEmpty!53285) tp_is_empty!34483 (not start!109578) (not b!1295650))
(check-sat b_and!46935 (not b_next!28843))
