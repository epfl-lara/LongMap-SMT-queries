; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109216 () Bool)

(assert start!109216)

(declare-fun b_free!28705 () Bool)

(declare-fun b_next!28705 () Bool)

(assert (=> start!109216 (= b_free!28705 (not b_next!28705))))

(declare-fun tp!101235 () Bool)

(declare-fun b_and!46777 () Bool)

(assert (=> start!109216 (= tp!101235 b_and!46777)))

(declare-fun b!1291889 () Bool)

(declare-fun res!858375 () Bool)

(declare-fun e!737433 () Bool)

(assert (=> b!1291889 (=> (not res!858375) (not e!737433))))

(declare-datatypes ((V!50897 0))(
  ( (V!50898 (val!17247 Int)) )
))
(declare-fun zeroValue!1387 () V!50897)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16274 0))(
  ( (ValueCellFull!16274 (v!19849 V!50897)) (EmptyCell!16274) )
))
(declare-datatypes ((array!85607 0))(
  ( (array!85608 (arr!41305 (Array (_ BitVec 32) ValueCell!16274)) (size!41857 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85607)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85609 0))(
  ( (array!85610 (arr!41306 (Array (_ BitVec 32) (_ BitVec 64))) (size!41858 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85609)

(declare-fun minValue!1387 () V!50897)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((tuple2!22220 0))(
  ( (tuple2!22221 (_1!11121 (_ BitVec 64)) (_2!11121 V!50897)) )
))
(declare-datatypes ((List!29375 0))(
  ( (Nil!29372) (Cons!29371 (h!30580 tuple2!22220) (t!42931 List!29375)) )
))
(declare-datatypes ((ListLongMap!19877 0))(
  ( (ListLongMap!19878 (toList!9954 List!29375)) )
))
(declare-fun contains!8002 (ListLongMap!19877 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4899 (array!85609 array!85607 (_ BitVec 32) (_ BitVec 32) V!50897 V!50897 (_ BitVec 32) Int) ListLongMap!19877)

(assert (=> b!1291889 (= res!858375 (contains!8002 (getCurrentListMap!4899 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291890 () Bool)

(declare-fun e!737434 () Bool)

(declare-fun e!737436 () Bool)

(declare-fun mapRes!53078 () Bool)

(assert (=> b!1291890 (= e!737434 (and e!737436 mapRes!53078))))

(declare-fun condMapEmpty!53078 () Bool)

(declare-fun mapDefault!53078 () ValueCell!16274)

(assert (=> b!1291890 (= condMapEmpty!53078 (= (arr!41305 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16274)) mapDefault!53078)))))

(declare-fun b!1291891 () Bool)

(declare-fun res!858378 () Bool)

(assert (=> b!1291891 (=> (not res!858378) (not e!737433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85609 (_ BitVec 32)) Bool)

(assert (=> b!1291891 (= res!858378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291892 () Bool)

(declare-fun res!858371 () Bool)

(assert (=> b!1291892 (=> (not res!858371) (not e!737433))))

(declare-datatypes ((List!29376 0))(
  ( (Nil!29373) (Cons!29372 (h!30581 (_ BitVec 64)) (t!42932 List!29376)) )
))
(declare-fun arrayNoDuplicates!0 (array!85609 (_ BitVec 32) List!29376) Bool)

(assert (=> b!1291892 (= res!858371 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29373))))

(declare-fun b!1291893 () Bool)

(declare-fun tp_is_empty!34345 () Bool)

(assert (=> b!1291893 (= e!737436 tp_is_empty!34345)))

(declare-fun b!1291894 () Bool)

(declare-fun res!858377 () Bool)

(assert (=> b!1291894 (=> (not res!858377) (not e!737433))))

(assert (=> b!1291894 (= res!858377 (and (= (size!41857 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41858 _keys!1741) (size!41857 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!858372 () Bool)

(assert (=> start!109216 (=> (not res!858372) (not e!737433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109216 (= res!858372 (validMask!0 mask!2175))))

(assert (=> start!109216 e!737433))

(assert (=> start!109216 tp_is_empty!34345))

(assert (=> start!109216 true))

(declare-fun array_inv!31459 (array!85607) Bool)

(assert (=> start!109216 (and (array_inv!31459 _values!1445) e!737434)))

(declare-fun array_inv!31460 (array!85609) Bool)

(assert (=> start!109216 (array_inv!31460 _keys!1741)))

(assert (=> start!109216 tp!101235))

(declare-fun b!1291895 () Bool)

(assert (=> b!1291895 (= e!737433 (not true))))

(assert (=> b!1291895 (not (contains!8002 (ListLongMap!19878 Nil!29372) k0!1205))))

(declare-datatypes ((Unit!42598 0))(
  ( (Unit!42599) )
))
(declare-fun lt!579115 () Unit!42598)

(declare-fun emptyContainsNothing!96 ((_ BitVec 64)) Unit!42598)

(assert (=> b!1291895 (= lt!579115 (emptyContainsNothing!96 k0!1205))))

(declare-fun mapNonEmpty!53078 () Bool)

(declare-fun tp!101234 () Bool)

(declare-fun e!737435 () Bool)

(assert (=> mapNonEmpty!53078 (= mapRes!53078 (and tp!101234 e!737435))))

(declare-fun mapRest!53078 () (Array (_ BitVec 32) ValueCell!16274))

(declare-fun mapKey!53078 () (_ BitVec 32))

(declare-fun mapValue!53078 () ValueCell!16274)

(assert (=> mapNonEmpty!53078 (= (arr!41305 _values!1445) (store mapRest!53078 mapKey!53078 mapValue!53078))))

(declare-fun b!1291896 () Bool)

(declare-fun res!858376 () Bool)

(assert (=> b!1291896 (=> (not res!858376) (not e!737433))))

(assert (=> b!1291896 (= res!858376 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41858 _keys!1741))))))

(declare-fun mapIsEmpty!53078 () Bool)

(assert (=> mapIsEmpty!53078 mapRes!53078))

(declare-fun b!1291897 () Bool)

(declare-fun res!858373 () Bool)

(assert (=> b!1291897 (=> (not res!858373) (not e!737433))))

(assert (=> b!1291897 (= res!858373 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41858 _keys!1741))))))

(declare-fun b!1291898 () Bool)

(declare-fun res!858374 () Bool)

(assert (=> b!1291898 (=> (not res!858374) (not e!737433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291898 (= res!858374 (not (validKeyInArray!0 (select (arr!41306 _keys!1741) from!2144))))))

(declare-fun b!1291899 () Bool)

(assert (=> b!1291899 (= e!737435 tp_is_empty!34345)))

(assert (= (and start!109216 res!858372) b!1291894))

(assert (= (and b!1291894 res!858377) b!1291891))

(assert (= (and b!1291891 res!858378) b!1291892))

(assert (= (and b!1291892 res!858371) b!1291896))

(assert (= (and b!1291896 res!858376) b!1291889))

(assert (= (and b!1291889 res!858375) b!1291897))

(assert (= (and b!1291897 res!858373) b!1291898))

(assert (= (and b!1291898 res!858374) b!1291895))

(assert (= (and b!1291890 condMapEmpty!53078) mapIsEmpty!53078))

(assert (= (and b!1291890 (not condMapEmpty!53078)) mapNonEmpty!53078))

(get-info :version)

(assert (= (and mapNonEmpty!53078 ((_ is ValueCellFull!16274) mapValue!53078)) b!1291899))

(assert (= (and b!1291890 ((_ is ValueCellFull!16274) mapDefault!53078)) b!1291893))

(assert (= start!109216 b!1291890))

(declare-fun m!1184139 () Bool)

(assert (=> start!109216 m!1184139))

(declare-fun m!1184141 () Bool)

(assert (=> start!109216 m!1184141))

(declare-fun m!1184143 () Bool)

(assert (=> start!109216 m!1184143))

(declare-fun m!1184145 () Bool)

(assert (=> mapNonEmpty!53078 m!1184145))

(declare-fun m!1184147 () Bool)

(assert (=> b!1291895 m!1184147))

(declare-fun m!1184149 () Bool)

(assert (=> b!1291895 m!1184149))

(declare-fun m!1184151 () Bool)

(assert (=> b!1291891 m!1184151))

(declare-fun m!1184153 () Bool)

(assert (=> b!1291889 m!1184153))

(assert (=> b!1291889 m!1184153))

(declare-fun m!1184155 () Bool)

(assert (=> b!1291889 m!1184155))

(declare-fun m!1184157 () Bool)

(assert (=> b!1291892 m!1184157))

(declare-fun m!1184159 () Bool)

(assert (=> b!1291898 m!1184159))

(assert (=> b!1291898 m!1184159))

(declare-fun m!1184161 () Bool)

(assert (=> b!1291898 m!1184161))

(check-sat (not b!1291889) (not b!1291892) b_and!46777 (not mapNonEmpty!53078) (not b!1291891) (not b_next!28705) (not b!1291895) (not b!1291898) (not start!109216) tp_is_empty!34345)
(check-sat b_and!46777 (not b_next!28705))
