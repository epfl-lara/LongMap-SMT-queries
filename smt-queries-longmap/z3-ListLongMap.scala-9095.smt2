; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109354 () Bool)

(assert start!109354)

(declare-fun b_free!28843 () Bool)

(declare-fun b_next!28843 () Bool)

(assert (=> start!109354 (= b_free!28843 (not b_next!28843))))

(declare-fun tp!101649 () Bool)

(declare-fun b_and!46915 () Bool)

(assert (=> start!109354 (= tp!101649 b_and!46915)))

(declare-fun b!1294274 () Bool)

(declare-fun res!860137 () Bool)

(declare-fun e!738576 () Bool)

(assert (=> b!1294274 (=> (not res!860137) (not e!738576))))

(declare-datatypes ((array!85879 0))(
  ( (array!85880 (arr!41441 (Array (_ BitVec 32) (_ BitVec 64))) (size!41993 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85879)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294274 (= res!860137 (not (validKeyInArray!0 (select (arr!41441 _keys!1741) from!2144))))))

(declare-fun b!1294275 () Bool)

(declare-fun e!738577 () Bool)

(declare-fun tp_is_empty!34483 () Bool)

(assert (=> b!1294275 (= e!738577 tp_is_empty!34483)))

(declare-fun b!1294276 () Bool)

(declare-fun res!860142 () Bool)

(assert (=> b!1294276 (=> (not res!860142) (not e!738576))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85879 (_ BitVec 32)) Bool)

(assert (=> b!1294276 (= res!860142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294277 () Bool)

(assert (=> b!1294277 (= e!738576 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51081 0))(
  ( (V!51082 (val!17316 Int)) )
))
(declare-datatypes ((tuple2!22332 0))(
  ( (tuple2!22333 (_1!11177 (_ BitVec 64)) (_2!11177 V!51081)) )
))
(declare-datatypes ((List!29473 0))(
  ( (Nil!29470) (Cons!29469 (h!30678 tuple2!22332) (t!43029 List!29473)) )
))
(declare-datatypes ((ListLongMap!19989 0))(
  ( (ListLongMap!19990 (toList!10010 List!29473)) )
))
(declare-fun contains!8058 (ListLongMap!19989 (_ BitVec 64)) Bool)

(assert (=> b!1294277 (not (contains!8058 (ListLongMap!19990 Nil!29470) k0!1205))))

(declare-datatypes ((Unit!42696 0))(
  ( (Unit!42697) )
))
(declare-fun lt!579529 () Unit!42696)

(declare-fun emptyContainsNothing!141 ((_ BitVec 64)) Unit!42696)

(assert (=> b!1294277 (= lt!579529 (emptyContainsNothing!141 k0!1205))))

(declare-fun b!1294278 () Bool)

(declare-fun res!860141 () Bool)

(assert (=> b!1294278 (=> (not res!860141) (not e!738576))))

(assert (=> b!1294278 (= res!860141 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41993 _keys!1741))))))

(declare-fun b!1294279 () Bool)

(declare-fun res!860139 () Bool)

(assert (=> b!1294279 (=> (not res!860139) (not e!738576))))

(declare-datatypes ((ValueCell!16343 0))(
  ( (ValueCellFull!16343 (v!19918 V!51081)) (EmptyCell!16343) )
))
(declare-datatypes ((array!85881 0))(
  ( (array!85882 (arr!41442 (Array (_ BitVec 32) ValueCell!16343)) (size!41994 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85881)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1294279 (= res!860139 (and (= (size!41994 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41993 _keys!1741) (size!41994 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294280 () Bool)

(declare-fun res!860138 () Bool)

(assert (=> b!1294280 (=> (not res!860138) (not e!738576))))

(declare-fun minValue!1387 () V!51081)

(declare-fun zeroValue!1387 () V!51081)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4941 (array!85879 array!85881 (_ BitVec 32) (_ BitVec 32) V!51081 V!51081 (_ BitVec 32) Int) ListLongMap!19989)

(assert (=> b!1294280 (= res!860138 (contains!8058 (getCurrentListMap!4941 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!860140 () Bool)

(assert (=> start!109354 (=> (not res!860140) (not e!738576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109354 (= res!860140 (validMask!0 mask!2175))))

(assert (=> start!109354 e!738576))

(assert (=> start!109354 tp_is_empty!34483))

(assert (=> start!109354 true))

(declare-fun e!738575 () Bool)

(declare-fun array_inv!31545 (array!85881) Bool)

(assert (=> start!109354 (and (array_inv!31545 _values!1445) e!738575)))

(declare-fun array_inv!31546 (array!85879) Bool)

(assert (=> start!109354 (array_inv!31546 _keys!1741)))

(assert (=> start!109354 tp!101649))

(declare-fun mapNonEmpty!53285 () Bool)

(declare-fun mapRes!53285 () Bool)

(declare-fun tp!101648 () Bool)

(assert (=> mapNonEmpty!53285 (= mapRes!53285 (and tp!101648 e!738577))))

(declare-fun mapValue!53285 () ValueCell!16343)

(declare-fun mapKey!53285 () (_ BitVec 32))

(declare-fun mapRest!53285 () (Array (_ BitVec 32) ValueCell!16343))

(assert (=> mapNonEmpty!53285 (= (arr!41442 _values!1445) (store mapRest!53285 mapKey!53285 mapValue!53285))))

(declare-fun b!1294281 () Bool)

(declare-fun res!860136 () Bool)

(assert (=> b!1294281 (=> (not res!860136) (not e!738576))))

(assert (=> b!1294281 (= res!860136 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41993 _keys!1741))))))

(declare-fun b!1294282 () Bool)

(declare-fun e!738579 () Bool)

(assert (=> b!1294282 (= e!738579 tp_is_empty!34483)))

(declare-fun b!1294283 () Bool)

(assert (=> b!1294283 (= e!738575 (and e!738579 mapRes!53285))))

(declare-fun condMapEmpty!53285 () Bool)

(declare-fun mapDefault!53285 () ValueCell!16343)

(assert (=> b!1294283 (= condMapEmpty!53285 (= (arr!41442 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16343)) mapDefault!53285)))))

(declare-fun mapIsEmpty!53285 () Bool)

(assert (=> mapIsEmpty!53285 mapRes!53285))

(declare-fun b!1294284 () Bool)

(declare-fun res!860135 () Bool)

(assert (=> b!1294284 (=> (not res!860135) (not e!738576))))

(declare-datatypes ((List!29474 0))(
  ( (Nil!29471) (Cons!29470 (h!30679 (_ BitVec 64)) (t!43030 List!29474)) )
))
(declare-fun arrayNoDuplicates!0 (array!85879 (_ BitVec 32) List!29474) Bool)

(assert (=> b!1294284 (= res!860135 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29471))))

(assert (= (and start!109354 res!860140) b!1294279))

(assert (= (and b!1294279 res!860139) b!1294276))

(assert (= (and b!1294276 res!860142) b!1294284))

(assert (= (and b!1294284 res!860135) b!1294281))

(assert (= (and b!1294281 res!860136) b!1294280))

(assert (= (and b!1294280 res!860138) b!1294278))

(assert (= (and b!1294278 res!860141) b!1294274))

(assert (= (and b!1294274 res!860137) b!1294277))

(assert (= (and b!1294283 condMapEmpty!53285) mapIsEmpty!53285))

(assert (= (and b!1294283 (not condMapEmpty!53285)) mapNonEmpty!53285))

(get-info :version)

(assert (= (and mapNonEmpty!53285 ((_ is ValueCellFull!16343) mapValue!53285)) b!1294275))

(assert (= (and b!1294283 ((_ is ValueCellFull!16343) mapDefault!53285)) b!1294282))

(assert (= start!109354 b!1294283))

(declare-fun m!1186071 () Bool)

(assert (=> b!1294276 m!1186071))

(declare-fun m!1186073 () Bool)

(assert (=> start!109354 m!1186073))

(declare-fun m!1186075 () Bool)

(assert (=> start!109354 m!1186075))

(declare-fun m!1186077 () Bool)

(assert (=> start!109354 m!1186077))

(declare-fun m!1186079 () Bool)

(assert (=> b!1294280 m!1186079))

(assert (=> b!1294280 m!1186079))

(declare-fun m!1186081 () Bool)

(assert (=> b!1294280 m!1186081))

(declare-fun m!1186083 () Bool)

(assert (=> b!1294277 m!1186083))

(declare-fun m!1186085 () Bool)

(assert (=> b!1294277 m!1186085))

(declare-fun m!1186087 () Bool)

(assert (=> b!1294284 m!1186087))

(declare-fun m!1186089 () Bool)

(assert (=> b!1294274 m!1186089))

(assert (=> b!1294274 m!1186089))

(declare-fun m!1186091 () Bool)

(assert (=> b!1294274 m!1186091))

(declare-fun m!1186093 () Bool)

(assert (=> mapNonEmpty!53285 m!1186093))

(check-sat (not b_next!28843) (not mapNonEmpty!53285) tp_is_empty!34483 (not b!1294280) (not start!109354) (not b!1294284) b_and!46915 (not b!1294274) (not b!1294277) (not b!1294276))
(check-sat b_and!46915 (not b_next!28843))
