; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109608 () Bool)

(assert start!109608)

(declare-fun b_free!28873 () Bool)

(declare-fun b_next!28873 () Bool)

(assert (=> start!109608 (= b_free!28873 (not b_next!28873))))

(declare-fun tp!101737 () Bool)

(declare-fun b_and!46965 () Bool)

(assert (=> start!109608 (= tp!101737 b_and!46965)))

(declare-fun b!1296140 () Bool)

(declare-fun res!861048 () Bool)

(declare-fun e!739683 () Bool)

(assert (=> b!1296140 (=> (not res!861048) (not e!739683))))

(declare-datatypes ((array!86079 0))(
  ( (array!86080 (arr!41536 (Array (_ BitVec 32) (_ BitVec 64))) (size!42087 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86079)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86079 (_ BitVec 32)) Bool)

(assert (=> b!1296140 (= res!861048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296141 () Bool)

(declare-fun e!739681 () Bool)

(assert (=> b!1296141 (= e!739681 true)))

(declare-datatypes ((V!51121 0))(
  ( (V!51122 (val!17331 Int)) )
))
(declare-fun minValue!1387 () V!51121)

(declare-fun zeroValue!1387 () V!51121)

(declare-fun lt!580239 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16358 0))(
  ( (ValueCellFull!16358 (v!19929 V!51121)) (EmptyCell!16358) )
))
(declare-datatypes ((array!86081 0))(
  ( (array!86082 (arr!41537 (Array (_ BitVec 32) ValueCell!16358)) (size!42088 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86081)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22314 0))(
  ( (tuple2!22315 (_1!11168 (_ BitVec 64)) (_2!11168 V!51121)) )
))
(declare-datatypes ((List!29482 0))(
  ( (Nil!29479) (Cons!29478 (h!30696 tuple2!22314) (t!43038 List!29482)) )
))
(declare-datatypes ((ListLongMap!19979 0))(
  ( (ListLongMap!19980 (toList!10005 List!29482)) )
))
(declare-fun contains!8136 (ListLongMap!19979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6094 (array!86079 array!86081 (_ BitVec 32) (_ BitVec 32) V!51121 V!51121 (_ BitVec 32) Int) ListLongMap!19979)

(assert (=> b!1296141 (= lt!580239 (contains!8136 (getCurrentListMapNoExtraKeys!6094 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53330 () Bool)

(declare-fun mapRes!53330 () Bool)

(declare-fun tp!101738 () Bool)

(declare-fun e!739678 () Bool)

(assert (=> mapNonEmpty!53330 (= mapRes!53330 (and tp!101738 e!739678))))

(declare-fun mapKey!53330 () (_ BitVec 32))

(declare-fun mapRest!53330 () (Array (_ BitVec 32) ValueCell!16358))

(declare-fun mapValue!53330 () ValueCell!16358)

(assert (=> mapNonEmpty!53330 (= (arr!41537 _values!1445) (store mapRest!53330 mapKey!53330 mapValue!53330))))

(declare-fun b!1296142 () Bool)

(declare-fun res!861044 () Bool)

(assert (=> b!1296142 (=> (not res!861044) (not e!739683))))

(declare-fun getCurrentListMap!5032 (array!86079 array!86081 (_ BitVec 32) (_ BitVec 32) V!51121 V!51121 (_ BitVec 32) Int) ListLongMap!19979)

(assert (=> b!1296142 (= res!861044 (contains!8136 (getCurrentListMap!5032 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296143 () Bool)

(assert (=> b!1296143 (= e!739683 (not e!739681))))

(declare-fun res!861045 () Bool)

(assert (=> b!1296143 (=> res!861045 e!739681)))

(assert (=> b!1296143 (= res!861045 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1296143 (not (contains!8136 (ListLongMap!19980 Nil!29479) k0!1205))))

(declare-datatypes ((Unit!42841 0))(
  ( (Unit!42842) )
))
(declare-fun lt!580238 () Unit!42841)

(declare-fun emptyContainsNothing!163 ((_ BitVec 64)) Unit!42841)

(assert (=> b!1296143 (= lt!580238 (emptyContainsNothing!163 k0!1205))))

(declare-fun b!1296144 () Bool)

(declare-fun res!861047 () Bool)

(assert (=> b!1296144 (=> (not res!861047) (not e!739683))))

(assert (=> b!1296144 (= res!861047 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42087 _keys!1741))))))

(declare-fun b!1296145 () Bool)

(declare-fun res!861049 () Bool)

(assert (=> b!1296145 (=> (not res!861049) (not e!739683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1296145 (= res!861049 (not (validKeyInArray!0 (select (arr!41536 _keys!1741) from!2144))))))

(declare-fun res!861046 () Bool)

(assert (=> start!109608 (=> (not res!861046) (not e!739683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109608 (= res!861046 (validMask!0 mask!2175))))

(assert (=> start!109608 e!739683))

(declare-fun tp_is_empty!34513 () Bool)

(assert (=> start!109608 tp_is_empty!34513))

(assert (=> start!109608 true))

(declare-fun e!739680 () Bool)

(declare-fun array_inv!31683 (array!86081) Bool)

(assert (=> start!109608 (and (array_inv!31683 _values!1445) e!739680)))

(declare-fun array_inv!31684 (array!86079) Bool)

(assert (=> start!109608 (array_inv!31684 _keys!1741)))

(assert (=> start!109608 tp!101737))

(declare-fun b!1296146 () Bool)

(declare-fun e!739679 () Bool)

(assert (=> b!1296146 (= e!739680 (and e!739679 mapRes!53330))))

(declare-fun condMapEmpty!53330 () Bool)

(declare-fun mapDefault!53330 () ValueCell!16358)

(assert (=> b!1296146 (= condMapEmpty!53330 (= (arr!41537 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16358)) mapDefault!53330)))))

(declare-fun b!1296147 () Bool)

(assert (=> b!1296147 (= e!739679 tp_is_empty!34513)))

(declare-fun b!1296148 () Bool)

(declare-fun res!861050 () Bool)

(assert (=> b!1296148 (=> (not res!861050) (not e!739683))))

(assert (=> b!1296148 (= res!861050 (and (= (size!42088 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42087 _keys!1741) (size!42088 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296149 () Bool)

(assert (=> b!1296149 (= e!739678 tp_is_empty!34513)))

(declare-fun b!1296150 () Bool)

(declare-fun res!861052 () Bool)

(assert (=> b!1296150 (=> (not res!861052) (not e!739683))))

(declare-datatypes ((List!29483 0))(
  ( (Nil!29480) (Cons!29479 (h!30697 (_ BitVec 64)) (t!43039 List!29483)) )
))
(declare-fun arrayNoDuplicates!0 (array!86079 (_ BitVec 32) List!29483) Bool)

(assert (=> b!1296150 (= res!861052 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29480))))

(declare-fun b!1296151 () Bool)

(declare-fun res!861051 () Bool)

(assert (=> b!1296151 (=> (not res!861051) (not e!739683))))

(assert (=> b!1296151 (= res!861051 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42087 _keys!1741))))))

(declare-fun mapIsEmpty!53330 () Bool)

(assert (=> mapIsEmpty!53330 mapRes!53330))

(assert (= (and start!109608 res!861046) b!1296148))

(assert (= (and b!1296148 res!861050) b!1296140))

(assert (= (and b!1296140 res!861048) b!1296150))

(assert (= (and b!1296150 res!861052) b!1296151))

(assert (= (and b!1296151 res!861051) b!1296142))

(assert (= (and b!1296142 res!861044) b!1296144))

(assert (= (and b!1296144 res!861047) b!1296145))

(assert (= (and b!1296145 res!861049) b!1296143))

(assert (= (and b!1296143 (not res!861045)) b!1296141))

(assert (= (and b!1296146 condMapEmpty!53330) mapIsEmpty!53330))

(assert (= (and b!1296146 (not condMapEmpty!53330)) mapNonEmpty!53330))

(get-info :version)

(assert (= (and mapNonEmpty!53330 ((_ is ValueCellFull!16358) mapValue!53330)) b!1296149))

(assert (= (and b!1296146 ((_ is ValueCellFull!16358) mapDefault!53330)) b!1296147))

(assert (= start!109608 b!1296146))

(declare-fun m!1188549 () Bool)

(assert (=> mapNonEmpty!53330 m!1188549))

(declare-fun m!1188551 () Bool)

(assert (=> b!1296145 m!1188551))

(assert (=> b!1296145 m!1188551))

(declare-fun m!1188553 () Bool)

(assert (=> b!1296145 m!1188553))

(declare-fun m!1188555 () Bool)

(assert (=> b!1296140 m!1188555))

(declare-fun m!1188557 () Bool)

(assert (=> b!1296150 m!1188557))

(declare-fun m!1188559 () Bool)

(assert (=> b!1296143 m!1188559))

(declare-fun m!1188561 () Bool)

(assert (=> b!1296143 m!1188561))

(declare-fun m!1188563 () Bool)

(assert (=> b!1296141 m!1188563))

(assert (=> b!1296141 m!1188563))

(declare-fun m!1188565 () Bool)

(assert (=> b!1296141 m!1188565))

(declare-fun m!1188567 () Bool)

(assert (=> b!1296142 m!1188567))

(assert (=> b!1296142 m!1188567))

(declare-fun m!1188569 () Bool)

(assert (=> b!1296142 m!1188569))

(declare-fun m!1188571 () Bool)

(assert (=> start!109608 m!1188571))

(declare-fun m!1188573 () Bool)

(assert (=> start!109608 m!1188573))

(declare-fun m!1188575 () Bool)

(assert (=> start!109608 m!1188575))

(check-sat (not b!1296150) tp_is_empty!34513 (not b!1296141) (not b!1296140) (not b!1296142) (not b!1296145) (not start!109608) (not b_next!28873) b_and!46965 (not mapNonEmpty!53330) (not b!1296143))
(check-sat b_and!46965 (not b_next!28873))
