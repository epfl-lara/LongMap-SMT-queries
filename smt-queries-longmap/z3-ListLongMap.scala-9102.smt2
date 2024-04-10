; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109398 () Bool)

(assert start!109398)

(declare-fun b_free!28887 () Bool)

(declare-fun b_next!28887 () Bool)

(assert (=> start!109398 (= b_free!28887 (not b_next!28887))))

(declare-fun tp!101779 () Bool)

(declare-fun b_and!46977 () Bool)

(assert (=> start!109398 (= tp!101779 b_and!46977)))

(declare-fun b!1295087 () Bool)

(declare-fun e!738957 () Bool)

(declare-fun e!738958 () Bool)

(declare-fun mapRes!53351 () Bool)

(assert (=> b!1295087 (= e!738957 (and e!738958 mapRes!53351))))

(declare-fun condMapEmpty!53351 () Bool)

(declare-datatypes ((V!51139 0))(
  ( (V!51140 (val!17338 Int)) )
))
(declare-datatypes ((ValueCell!16365 0))(
  ( (ValueCellFull!16365 (v!19941 V!51139)) (EmptyCell!16365) )
))
(declare-datatypes ((array!86074 0))(
  ( (array!86075 (arr!41538 (Array (_ BitVec 32) ValueCell!16365)) (size!42088 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86074)

(declare-fun mapDefault!53351 () ValueCell!16365)

(assert (=> b!1295087 (= condMapEmpty!53351 (= (arr!41538 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16365)) mapDefault!53351)))))

(declare-fun mapIsEmpty!53351 () Bool)

(assert (=> mapIsEmpty!53351 mapRes!53351))

(declare-fun b!1295088 () Bool)

(declare-fun res!860717 () Bool)

(declare-fun e!738961 () Bool)

(assert (=> b!1295088 (=> (not res!860717) (not e!738961))))

(declare-datatypes ((array!86076 0))(
  ( (array!86077 (arr!41539 (Array (_ BitVec 32) (_ BitVec 64))) (size!42089 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86076)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86076 (_ BitVec 32)) Bool)

(assert (=> b!1295088 (= res!860717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295089 () Bool)

(declare-fun tp_is_empty!34527 () Bool)

(assert (=> b!1295089 (= e!738958 tp_is_empty!34527)))

(declare-fun mapNonEmpty!53351 () Bool)

(declare-fun tp!101780 () Bool)

(declare-fun e!738959 () Bool)

(assert (=> mapNonEmpty!53351 (= mapRes!53351 (and tp!101780 e!738959))))

(declare-fun mapValue!53351 () ValueCell!16365)

(declare-fun mapRest!53351 () (Array (_ BitVec 32) ValueCell!16365))

(declare-fun mapKey!53351 () (_ BitVec 32))

(assert (=> mapNonEmpty!53351 (= (arr!41538 _values!1445) (store mapRest!53351 mapKey!53351 mapValue!53351))))

(declare-fun b!1295091 () Bool)

(declare-fun res!860720 () Bool)

(assert (=> b!1295091 (=> (not res!860720) (not e!738961))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295091 (= res!860720 (and (= (size!42088 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42089 _keys!1741) (size!42088 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295092 () Bool)

(declare-fun res!860715 () Bool)

(assert (=> b!1295092 (=> (not res!860715) (not e!738961))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1295092 (= res!860715 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42089 _keys!1741))))))

(declare-fun b!1295093 () Bool)

(declare-fun res!860718 () Bool)

(assert (=> b!1295093 (=> (not res!860718) (not e!738961))))

(declare-datatypes ((List!29465 0))(
  ( (Nil!29462) (Cons!29461 (h!30670 (_ BitVec 64)) (t!43029 List!29465)) )
))
(declare-fun arrayNoDuplicates!0 (array!86076 (_ BitVec 32) List!29465) Bool)

(assert (=> b!1295093 (= res!860718 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29462))))

(declare-fun b!1295094 () Bool)

(declare-fun e!738960 () Bool)

(assert (=> b!1295094 (= e!738961 (not e!738960))))

(declare-fun res!860716 () Bool)

(assert (=> b!1295094 (=> res!860716 e!738960)))

(assert (=> b!1295094 (= res!860716 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22322 0))(
  ( (tuple2!22323 (_1!11172 (_ BitVec 64)) (_2!11172 V!51139)) )
))
(declare-datatypes ((List!29466 0))(
  ( (Nil!29463) (Cons!29462 (h!30671 tuple2!22322) (t!43030 List!29466)) )
))
(declare-datatypes ((ListLongMap!19979 0))(
  ( (ListLongMap!19980 (toList!10005 List!29466)) )
))
(declare-fun contains!8123 (ListLongMap!19979 (_ BitVec 64)) Bool)

(assert (=> b!1295094 (not (contains!8123 (ListLongMap!19980 Nil!29463) k0!1205))))

(declare-datatypes ((Unit!42892 0))(
  ( (Unit!42893) )
))
(declare-fun lt!579811 () Unit!42892)

(declare-fun emptyContainsNothing!166 ((_ BitVec 64)) Unit!42892)

(assert (=> b!1295094 (= lt!579811 (emptyContainsNothing!166 k0!1205))))

(declare-fun b!1295095 () Bool)

(declare-fun res!860719 () Bool)

(assert (=> b!1295095 (=> (not res!860719) (not e!738961))))

(declare-fun minValue!1387 () V!51139)

(declare-fun zeroValue!1387 () V!51139)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5041 (array!86076 array!86074 (_ BitVec 32) (_ BitVec 32) V!51139 V!51139 (_ BitVec 32) Int) ListLongMap!19979)

(assert (=> b!1295095 (= res!860719 (contains!8123 (getCurrentListMap!5041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295096 () Bool)

(declare-fun res!860714 () Bool)

(assert (=> b!1295096 (=> (not res!860714) (not e!738961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295096 (= res!860714 (not (validKeyInArray!0 (select (arr!41539 _keys!1741) from!2144))))))

(declare-fun res!860713 () Bool)

(assert (=> start!109398 (=> (not res!860713) (not e!738961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109398 (= res!860713 (validMask!0 mask!2175))))

(assert (=> start!109398 e!738961))

(assert (=> start!109398 tp_is_empty!34527))

(assert (=> start!109398 true))

(declare-fun array_inv!31453 (array!86074) Bool)

(assert (=> start!109398 (and (array_inv!31453 _values!1445) e!738957)))

(declare-fun array_inv!31454 (array!86076) Bool)

(assert (=> start!109398 (array_inv!31454 _keys!1741)))

(assert (=> start!109398 tp!101779))

(declare-fun b!1295090 () Bool)

(assert (=> b!1295090 (= e!738960 true)))

(declare-fun lt!579812 () ListLongMap!19979)

(declare-fun +!4412 (ListLongMap!19979 tuple2!22322) ListLongMap!19979)

(assert (=> b!1295090 (not (contains!8123 (+!4412 lt!579812 (tuple2!22323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579810 () Unit!42892)

(declare-fun addStillNotContains!430 (ListLongMap!19979 (_ BitVec 64) V!51139 (_ BitVec 64)) Unit!42892)

(assert (=> b!1295090 (= lt!579810 (addStillNotContains!430 lt!579812 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6045 (array!86076 array!86074 (_ BitVec 32) (_ BitVec 32) V!51139 V!51139 (_ BitVec 32) Int) ListLongMap!19979)

(assert (=> b!1295090 (= lt!579812 (getCurrentListMapNoExtraKeys!6045 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295097 () Bool)

(declare-fun res!860721 () Bool)

(assert (=> b!1295097 (=> (not res!860721) (not e!738961))))

(assert (=> b!1295097 (= res!860721 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42089 _keys!1741))))))

(declare-fun b!1295098 () Bool)

(assert (=> b!1295098 (= e!738959 tp_is_empty!34527)))

(assert (= (and start!109398 res!860713) b!1295091))

(assert (= (and b!1295091 res!860720) b!1295088))

(assert (= (and b!1295088 res!860717) b!1295093))

(assert (= (and b!1295093 res!860718) b!1295092))

(assert (= (and b!1295092 res!860715) b!1295095))

(assert (= (and b!1295095 res!860719) b!1295097))

(assert (= (and b!1295097 res!860721) b!1295096))

(assert (= (and b!1295096 res!860714) b!1295094))

(assert (= (and b!1295094 (not res!860716)) b!1295090))

(assert (= (and b!1295087 condMapEmpty!53351) mapIsEmpty!53351))

(assert (= (and b!1295087 (not condMapEmpty!53351)) mapNonEmpty!53351))

(get-info :version)

(assert (= (and mapNonEmpty!53351 ((_ is ValueCellFull!16365) mapValue!53351)) b!1295098))

(assert (= (and b!1295087 ((_ is ValueCellFull!16365) mapDefault!53351)) b!1295089))

(assert (= start!109398 b!1295087))

(declare-fun m!1187143 () Bool)

(assert (=> b!1295093 m!1187143))

(declare-fun m!1187145 () Bool)

(assert (=> b!1295095 m!1187145))

(assert (=> b!1295095 m!1187145))

(declare-fun m!1187147 () Bool)

(assert (=> b!1295095 m!1187147))

(declare-fun m!1187149 () Bool)

(assert (=> b!1295096 m!1187149))

(assert (=> b!1295096 m!1187149))

(declare-fun m!1187151 () Bool)

(assert (=> b!1295096 m!1187151))

(declare-fun m!1187153 () Bool)

(assert (=> mapNonEmpty!53351 m!1187153))

(declare-fun m!1187155 () Bool)

(assert (=> start!109398 m!1187155))

(declare-fun m!1187157 () Bool)

(assert (=> start!109398 m!1187157))

(declare-fun m!1187159 () Bool)

(assert (=> start!109398 m!1187159))

(declare-fun m!1187161 () Bool)

(assert (=> b!1295094 m!1187161))

(declare-fun m!1187163 () Bool)

(assert (=> b!1295094 m!1187163))

(declare-fun m!1187165 () Bool)

(assert (=> b!1295090 m!1187165))

(assert (=> b!1295090 m!1187165))

(declare-fun m!1187167 () Bool)

(assert (=> b!1295090 m!1187167))

(declare-fun m!1187169 () Bool)

(assert (=> b!1295090 m!1187169))

(declare-fun m!1187171 () Bool)

(assert (=> b!1295090 m!1187171))

(declare-fun m!1187173 () Bool)

(assert (=> b!1295088 m!1187173))

(check-sat (not mapNonEmpty!53351) (not b!1295093) (not b!1295095) (not b!1295094) b_and!46977 (not b!1295090) tp_is_empty!34527 (not b_next!28887) (not b!1295096) (not b!1295088) (not start!109398))
(check-sat b_and!46977 (not b_next!28887))
