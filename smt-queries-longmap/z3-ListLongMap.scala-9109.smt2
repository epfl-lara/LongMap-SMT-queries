; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109662 () Bool)

(assert start!109662)

(declare-fun b_free!28927 () Bool)

(declare-fun b_next!28927 () Bool)

(assert (=> start!109662 (= b_free!28927 (not b_next!28927))))

(declare-fun tp!101900 () Bool)

(declare-fun b_and!47019 () Bool)

(assert (=> start!109662 (= tp!101900 b_and!47019)))

(declare-fun b!1297112 () Bool)

(declare-fun e!740169 () Bool)

(declare-fun tp_is_empty!34567 () Bool)

(assert (=> b!1297112 (= e!740169 tp_is_empty!34567)))

(declare-fun mapNonEmpty!53411 () Bool)

(declare-fun mapRes!53411 () Bool)

(declare-fun tp!101899 () Bool)

(declare-fun e!740165 () Bool)

(assert (=> mapNonEmpty!53411 (= mapRes!53411 (and tp!101899 e!740165))))

(declare-datatypes ((V!51193 0))(
  ( (V!51194 (val!17358 Int)) )
))
(declare-datatypes ((ValueCell!16385 0))(
  ( (ValueCellFull!16385 (v!19956 V!51193)) (EmptyCell!16385) )
))
(declare-fun mapValue!53411 () ValueCell!16385)

(declare-datatypes ((array!86187 0))(
  ( (array!86188 (arr!41590 (Array (_ BitVec 32) ValueCell!16385)) (size!42141 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86187)

(declare-fun mapKey!53411 () (_ BitVec 32))

(declare-fun mapRest!53411 () (Array (_ BitVec 32) ValueCell!16385))

(assert (=> mapNonEmpty!53411 (= (arr!41590 _values!1445) (store mapRest!53411 mapKey!53411 mapValue!53411))))

(declare-fun b!1297113 () Bool)

(declare-fun e!740164 () Bool)

(assert (=> b!1297113 (= e!740164 (and e!740169 mapRes!53411))))

(declare-fun condMapEmpty!53411 () Bool)

(declare-fun mapDefault!53411 () ValueCell!16385)

(assert (=> b!1297113 (= condMapEmpty!53411 (= (arr!41590 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16385)) mapDefault!53411)))))

(declare-fun b!1297114 () Bool)

(declare-fun e!740166 () Bool)

(declare-fun e!740167 () Bool)

(assert (=> b!1297114 (= e!740166 (not e!740167))))

(declare-fun res!861778 () Bool)

(assert (=> b!1297114 (=> res!861778 e!740167)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1297114 (= res!861778 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22358 0))(
  ( (tuple2!22359 (_1!11190 (_ BitVec 64)) (_2!11190 V!51193)) )
))
(declare-datatypes ((List!29526 0))(
  ( (Nil!29523) (Cons!29522 (h!30740 tuple2!22358) (t!43082 List!29526)) )
))
(declare-datatypes ((ListLongMap!20023 0))(
  ( (ListLongMap!20024 (toList!10027 List!29526)) )
))
(declare-fun contains!8158 (ListLongMap!20023 (_ BitVec 64)) Bool)

(assert (=> b!1297114 (not (contains!8158 (ListLongMap!20024 Nil!29523) k0!1205))))

(declare-datatypes ((Unit!42885 0))(
  ( (Unit!42886) )
))
(declare-fun lt!580476 () Unit!42885)

(declare-fun emptyContainsNothing!184 ((_ BitVec 64)) Unit!42885)

(assert (=> b!1297114 (= lt!580476 (emptyContainsNothing!184 k0!1205))))

(declare-fun res!861781 () Bool)

(assert (=> start!109662 (=> (not res!861781) (not e!740166))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109662 (= res!861781 (validMask!0 mask!2175))))

(assert (=> start!109662 e!740166))

(assert (=> start!109662 tp_is_empty!34567))

(assert (=> start!109662 true))

(declare-fun array_inv!31717 (array!86187) Bool)

(assert (=> start!109662 (and (array_inv!31717 _values!1445) e!740164)))

(declare-datatypes ((array!86189 0))(
  ( (array!86190 (arr!41591 (Array (_ BitVec 32) (_ BitVec 64))) (size!42142 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86189)

(declare-fun array_inv!31718 (array!86189) Bool)

(assert (=> start!109662 (array_inv!31718 _keys!1741)))

(assert (=> start!109662 tp!101900))

(declare-fun b!1297115 () Bool)

(declare-fun res!861774 () Bool)

(assert (=> b!1297115 (=> (not res!861774) (not e!740166))))

(declare-fun minValue!1387 () V!51193)

(declare-fun zeroValue!1387 () V!51193)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5049 (array!86189 array!86187 (_ BitVec 32) (_ BitVec 32) V!51193 V!51193 (_ BitVec 32) Int) ListLongMap!20023)

(assert (=> b!1297115 (= res!861774 (contains!8158 (getCurrentListMap!5049 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1297116 () Bool)

(declare-fun res!861773 () Bool)

(assert (=> b!1297116 (=> (not res!861773) (not e!740166))))

(assert (=> b!1297116 (= res!861773 (and (= (size!42141 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42142 _keys!1741) (size!42141 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297117 () Bool)

(declare-fun res!861775 () Bool)

(assert (=> b!1297117 (=> (not res!861775) (not e!740166))))

(assert (=> b!1297117 (= res!861775 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42142 _keys!1741))))))

(declare-fun b!1297118 () Bool)

(assert (=> b!1297118 (= e!740167 (bvsle from!2144 (size!42142 _keys!1741)))))

(declare-fun lt!580475 () ListLongMap!20023)

(declare-fun +!4471 (ListLongMap!20023 tuple2!22358) ListLongMap!20023)

(assert (=> b!1297118 (not (contains!8158 (+!4471 lt!580475 (tuple2!22359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!580474 () Unit!42885)

(declare-fun addStillNotContains!447 (ListLongMap!20023 (_ BitVec 64) V!51193 (_ BitVec 64)) Unit!42885)

(assert (=> b!1297118 (= lt!580474 (addStillNotContains!447 lt!580475 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6113 (array!86189 array!86187 (_ BitVec 32) (_ BitVec 32) V!51193 V!51193 (_ BitVec 32) Int) ListLongMap!20023)

(assert (=> b!1297118 (= lt!580475 (getCurrentListMapNoExtraKeys!6113 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1297119 () Bool)

(declare-fun res!861779 () Bool)

(assert (=> b!1297119 (=> (not res!861779) (not e!740166))))

(declare-datatypes ((List!29527 0))(
  ( (Nil!29524) (Cons!29523 (h!30741 (_ BitVec 64)) (t!43083 List!29527)) )
))
(declare-fun arrayNoDuplicates!0 (array!86189 (_ BitVec 32) List!29527) Bool)

(assert (=> b!1297119 (= res!861779 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29524))))

(declare-fun b!1297120 () Bool)

(declare-fun res!861780 () Bool)

(assert (=> b!1297120 (=> (not res!861780) (not e!740166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86189 (_ BitVec 32)) Bool)

(assert (=> b!1297120 (= res!861780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297121 () Bool)

(declare-fun res!861777 () Bool)

(assert (=> b!1297121 (=> (not res!861777) (not e!740166))))

(assert (=> b!1297121 (= res!861777 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42142 _keys!1741))))))

(declare-fun b!1297122 () Bool)

(declare-fun res!861776 () Bool)

(assert (=> b!1297122 (=> (not res!861776) (not e!740166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1297122 (= res!861776 (not (validKeyInArray!0 (select (arr!41591 _keys!1741) from!2144))))))

(declare-fun b!1297123 () Bool)

(assert (=> b!1297123 (= e!740165 tp_is_empty!34567)))

(declare-fun mapIsEmpty!53411 () Bool)

(assert (=> mapIsEmpty!53411 mapRes!53411))

(assert (= (and start!109662 res!861781) b!1297116))

(assert (= (and b!1297116 res!861773) b!1297120))

(assert (= (and b!1297120 res!861780) b!1297119))

(assert (= (and b!1297119 res!861779) b!1297117))

(assert (= (and b!1297117 res!861775) b!1297115))

(assert (= (and b!1297115 res!861774) b!1297121))

(assert (= (and b!1297121 res!861777) b!1297122))

(assert (= (and b!1297122 res!861776) b!1297114))

(assert (= (and b!1297114 (not res!861778)) b!1297118))

(assert (= (and b!1297113 condMapEmpty!53411) mapIsEmpty!53411))

(assert (= (and b!1297113 (not condMapEmpty!53411)) mapNonEmpty!53411))

(get-info :version)

(assert (= (and mapNonEmpty!53411 ((_ is ValueCellFull!16385) mapValue!53411)) b!1297123))

(assert (= (and b!1297113 ((_ is ValueCellFull!16385) mapDefault!53411)) b!1297112))

(assert (= start!109662 b!1297113))

(declare-fun m!1189401 () Bool)

(assert (=> b!1297114 m!1189401))

(declare-fun m!1189403 () Bool)

(assert (=> b!1297114 m!1189403))

(declare-fun m!1189405 () Bool)

(assert (=> b!1297115 m!1189405))

(assert (=> b!1297115 m!1189405))

(declare-fun m!1189407 () Bool)

(assert (=> b!1297115 m!1189407))

(declare-fun m!1189409 () Bool)

(assert (=> start!109662 m!1189409))

(declare-fun m!1189411 () Bool)

(assert (=> start!109662 m!1189411))

(declare-fun m!1189413 () Bool)

(assert (=> start!109662 m!1189413))

(declare-fun m!1189415 () Bool)

(assert (=> mapNonEmpty!53411 m!1189415))

(declare-fun m!1189417 () Bool)

(assert (=> b!1297119 m!1189417))

(declare-fun m!1189419 () Bool)

(assert (=> b!1297120 m!1189419))

(declare-fun m!1189421 () Bool)

(assert (=> b!1297122 m!1189421))

(assert (=> b!1297122 m!1189421))

(declare-fun m!1189423 () Bool)

(assert (=> b!1297122 m!1189423))

(declare-fun m!1189425 () Bool)

(assert (=> b!1297118 m!1189425))

(assert (=> b!1297118 m!1189425))

(declare-fun m!1189427 () Bool)

(assert (=> b!1297118 m!1189427))

(declare-fun m!1189429 () Bool)

(assert (=> b!1297118 m!1189429))

(declare-fun m!1189431 () Bool)

(assert (=> b!1297118 m!1189431))

(check-sat (not mapNonEmpty!53411) (not b!1297115) (not b_next!28927) (not start!109662) tp_is_empty!34567 (not b!1297119) (not b!1297122) (not b!1297118) (not b!1297120) b_and!47019 (not b!1297114))
(check-sat b_and!47019 (not b_next!28927))
