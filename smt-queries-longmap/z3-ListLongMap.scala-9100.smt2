; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109386 () Bool)

(assert start!109386)

(declare-fun b_free!28875 () Bool)

(declare-fun b_next!28875 () Bool)

(assert (=> start!109386 (= b_free!28875 (not b_next!28875))))

(declare-fun tp!101744 () Bool)

(declare-fun b_and!46965 () Bool)

(assert (=> start!109386 (= tp!101744 b_and!46965)))

(declare-fun b!1294871 () Bool)

(declare-fun e!738854 () Bool)

(assert (=> b!1294871 (= e!738854 true)))

(declare-datatypes ((V!51123 0))(
  ( (V!51124 (val!17332 Int)) )
))
(declare-fun minValue!1387 () V!51123)

(declare-fun zeroValue!1387 () V!51123)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16359 0))(
  ( (ValueCellFull!16359 (v!19935 V!51123)) (EmptyCell!16359) )
))
(declare-datatypes ((array!86050 0))(
  ( (array!86051 (arr!41526 (Array (_ BitVec 32) ValueCell!16359)) (size!42076 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86050)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86052 0))(
  ( (array!86053 (arr!41527 (Array (_ BitVec 32) (_ BitVec 64))) (size!42077 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86052)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!579761 () Bool)

(declare-datatypes ((tuple2!22310 0))(
  ( (tuple2!22311 (_1!11166 (_ BitVec 64)) (_2!11166 V!51123)) )
))
(declare-datatypes ((List!29454 0))(
  ( (Nil!29451) (Cons!29450 (h!30659 tuple2!22310) (t!43018 List!29454)) )
))
(declare-datatypes ((ListLongMap!19967 0))(
  ( (ListLongMap!19968 (toList!9999 List!29454)) )
))
(declare-fun contains!8117 (ListLongMap!19967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6041 (array!86052 array!86050 (_ BitVec 32) (_ BitVec 32) V!51123 V!51123 (_ BitVec 32) Int) ListLongMap!19967)

(assert (=> b!1294871 (= lt!579761 (contains!8117 (getCurrentListMapNoExtraKeys!6041 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294872 () Bool)

(declare-fun res!860553 () Bool)

(declare-fun e!738852 () Bool)

(assert (=> b!1294872 (=> (not res!860553) (not e!738852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86052 (_ BitVec 32)) Bool)

(assert (=> b!1294872 (= res!860553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294873 () Bool)

(assert (=> b!1294873 (= e!738852 (not e!738854))))

(declare-fun res!860552 () Bool)

(assert (=> b!1294873 (=> res!860552 e!738854)))

(assert (=> b!1294873 (= res!860552 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1294873 (not (contains!8117 (ListLongMap!19968 Nil!29451) k0!1205))))

(declare-datatypes ((Unit!42884 0))(
  ( (Unit!42885) )
))
(declare-fun lt!579760 () Unit!42884)

(declare-fun emptyContainsNothing!163 ((_ BitVec 64)) Unit!42884)

(assert (=> b!1294873 (= lt!579760 (emptyContainsNothing!163 k0!1205))))

(declare-fun b!1294874 () Bool)

(declare-fun res!860555 () Bool)

(assert (=> b!1294874 (=> (not res!860555) (not e!738852))))

(assert (=> b!1294874 (= res!860555 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42077 _keys!1741))))))

(declare-fun mapIsEmpty!53333 () Bool)

(declare-fun mapRes!53333 () Bool)

(assert (=> mapIsEmpty!53333 mapRes!53333))

(declare-fun b!1294875 () Bool)

(declare-fun res!860556 () Bool)

(assert (=> b!1294875 (=> (not res!860556) (not e!738852))))

(declare-datatypes ((List!29455 0))(
  ( (Nil!29452) (Cons!29451 (h!30660 (_ BitVec 64)) (t!43019 List!29455)) )
))
(declare-fun arrayNoDuplicates!0 (array!86052 (_ BitVec 32) List!29455) Bool)

(assert (=> b!1294875 (= res!860556 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29452))))

(declare-fun b!1294876 () Bool)

(declare-fun res!860559 () Bool)

(assert (=> b!1294876 (=> (not res!860559) (not e!738852))))

(declare-fun getCurrentListMap!5036 (array!86052 array!86050 (_ BitVec 32) (_ BitVec 32) V!51123 V!51123 (_ BitVec 32) Int) ListLongMap!19967)

(assert (=> b!1294876 (= res!860559 (contains!8117 (getCurrentListMap!5036 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1294877 () Bool)

(declare-fun res!860557 () Bool)

(assert (=> b!1294877 (=> (not res!860557) (not e!738852))))

(assert (=> b!1294877 (= res!860557 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42077 _keys!1741))))))

(declare-fun b!1294878 () Bool)

(declare-fun e!738849 () Bool)

(declare-fun tp_is_empty!34515 () Bool)

(assert (=> b!1294878 (= e!738849 tp_is_empty!34515)))

(declare-fun b!1294879 () Bool)

(declare-fun e!738851 () Bool)

(declare-fun e!738853 () Bool)

(assert (=> b!1294879 (= e!738851 (and e!738853 mapRes!53333))))

(declare-fun condMapEmpty!53333 () Bool)

(declare-fun mapDefault!53333 () ValueCell!16359)

(assert (=> b!1294879 (= condMapEmpty!53333 (= (arr!41526 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16359)) mapDefault!53333)))))

(declare-fun b!1294880 () Bool)

(declare-fun res!860558 () Bool)

(assert (=> b!1294880 (=> (not res!860558) (not e!738852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294880 (= res!860558 (not (validKeyInArray!0 (select (arr!41527 _keys!1741) from!2144))))))

(declare-fun b!1294881 () Bool)

(declare-fun res!860554 () Bool)

(assert (=> b!1294881 (=> (not res!860554) (not e!738852))))

(assert (=> b!1294881 (= res!860554 (and (= (size!42076 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42077 _keys!1741) (size!42076 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!860551 () Bool)

(assert (=> start!109386 (=> (not res!860551) (not e!738852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109386 (= res!860551 (validMask!0 mask!2175))))

(assert (=> start!109386 e!738852))

(assert (=> start!109386 tp_is_empty!34515))

(assert (=> start!109386 true))

(declare-fun array_inv!31443 (array!86050) Bool)

(assert (=> start!109386 (and (array_inv!31443 _values!1445) e!738851)))

(declare-fun array_inv!31444 (array!86052) Bool)

(assert (=> start!109386 (array_inv!31444 _keys!1741)))

(assert (=> start!109386 tp!101744))

(declare-fun b!1294882 () Bool)

(assert (=> b!1294882 (= e!738853 tp_is_empty!34515)))

(declare-fun mapNonEmpty!53333 () Bool)

(declare-fun tp!101743 () Bool)

(assert (=> mapNonEmpty!53333 (= mapRes!53333 (and tp!101743 e!738849))))

(declare-fun mapKey!53333 () (_ BitVec 32))

(declare-fun mapValue!53333 () ValueCell!16359)

(declare-fun mapRest!53333 () (Array (_ BitVec 32) ValueCell!16359))

(assert (=> mapNonEmpty!53333 (= (arr!41526 _values!1445) (store mapRest!53333 mapKey!53333 mapValue!53333))))

(assert (= (and start!109386 res!860551) b!1294881))

(assert (= (and b!1294881 res!860554) b!1294872))

(assert (= (and b!1294872 res!860553) b!1294875))

(assert (= (and b!1294875 res!860556) b!1294874))

(assert (= (and b!1294874 res!860555) b!1294876))

(assert (= (and b!1294876 res!860559) b!1294877))

(assert (= (and b!1294877 res!860557) b!1294880))

(assert (= (and b!1294880 res!860558) b!1294873))

(assert (= (and b!1294873 (not res!860552)) b!1294871))

(assert (= (and b!1294879 condMapEmpty!53333) mapIsEmpty!53333))

(assert (= (and b!1294879 (not condMapEmpty!53333)) mapNonEmpty!53333))

(get-info :version)

(assert (= (and mapNonEmpty!53333 ((_ is ValueCellFull!16359) mapValue!53333)) b!1294878))

(assert (= (and b!1294879 ((_ is ValueCellFull!16359) mapDefault!53333)) b!1294882))

(assert (= start!109386 b!1294879))

(declare-fun m!1186959 () Bool)

(assert (=> b!1294872 m!1186959))

(declare-fun m!1186961 () Bool)

(assert (=> mapNonEmpty!53333 m!1186961))

(declare-fun m!1186963 () Bool)

(assert (=> start!109386 m!1186963))

(declare-fun m!1186965 () Bool)

(assert (=> start!109386 m!1186965))

(declare-fun m!1186967 () Bool)

(assert (=> start!109386 m!1186967))

(declare-fun m!1186969 () Bool)

(assert (=> b!1294876 m!1186969))

(assert (=> b!1294876 m!1186969))

(declare-fun m!1186971 () Bool)

(assert (=> b!1294876 m!1186971))

(declare-fun m!1186973 () Bool)

(assert (=> b!1294880 m!1186973))

(assert (=> b!1294880 m!1186973))

(declare-fun m!1186975 () Bool)

(assert (=> b!1294880 m!1186975))

(declare-fun m!1186977 () Bool)

(assert (=> b!1294873 m!1186977))

(declare-fun m!1186979 () Bool)

(assert (=> b!1294873 m!1186979))

(declare-fun m!1186981 () Bool)

(assert (=> b!1294875 m!1186981))

(declare-fun m!1186983 () Bool)

(assert (=> b!1294871 m!1186983))

(assert (=> b!1294871 m!1186983))

(declare-fun m!1186985 () Bool)

(assert (=> b!1294871 m!1186985))

(check-sat (not b_next!28875) (not b!1294873) tp_is_empty!34515 (not b!1294871) (not b!1294880) (not b!1294875) (not b!1294876) (not start!109386) (not b!1294872) (not mapNonEmpty!53333) b_and!46965)
(check-sat b_and!46965 (not b_next!28875))
