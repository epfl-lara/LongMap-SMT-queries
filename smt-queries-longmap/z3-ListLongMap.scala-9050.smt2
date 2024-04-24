; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109308 () Bool)

(assert start!109308)

(declare-fun b_free!28573 () Bool)

(declare-fun b_next!28573 () Bool)

(assert (=> start!109308 (= b_free!28573 (not b_next!28573))))

(declare-fun tp!100837 () Bool)

(declare-fun b_and!46665 () Bool)

(assert (=> start!109308 (= tp!100837 b_and!46665)))

(declare-fun b!1290902 () Bool)

(declare-fun e!737142 () Bool)

(declare-fun e!737143 () Bool)

(assert (=> b!1290902 (= e!737142 (not e!737143))))

(declare-fun res!857163 () Bool)

(assert (=> b!1290902 (=> res!857163 e!737143)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1290902 (= res!857163 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50721 0))(
  ( (V!50722 (val!17181 Int)) )
))
(declare-datatypes ((tuple2!22082 0))(
  ( (tuple2!22083 (_1!11052 (_ BitVec 64)) (_2!11052 V!50721)) )
))
(declare-datatypes ((List!29263 0))(
  ( (Nil!29260) (Cons!29259 (h!30477 tuple2!22082) (t!42819 List!29263)) )
))
(declare-datatypes ((ListLongMap!19747 0))(
  ( (ListLongMap!19748 (toList!9889 List!29263)) )
))
(declare-fun contains!8020 (ListLongMap!19747 (_ BitVec 64)) Bool)

(assert (=> b!1290902 (not (contains!8020 (ListLongMap!19748 Nil!29260) k0!1205))))

(declare-datatypes ((Unit!42627 0))(
  ( (Unit!42628) )
))
(declare-fun lt!578796 () Unit!42627)

(declare-fun emptyContainsNothing!65 ((_ BitVec 64)) Unit!42627)

(assert (=> b!1290902 (= lt!578796 (emptyContainsNothing!65 k0!1205))))

(declare-fun b!1290903 () Bool)

(declare-fun res!857160 () Bool)

(assert (=> b!1290903 (=> (not res!857160) (not e!737142))))

(declare-datatypes ((array!85505 0))(
  ( (array!85506 (arr!41249 (Array (_ BitVec 32) (_ BitVec 64))) (size!41800 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85505)

(declare-datatypes ((List!29264 0))(
  ( (Nil!29261) (Cons!29260 (h!30478 (_ BitVec 64)) (t!42820 List!29264)) )
))
(declare-fun arrayNoDuplicates!0 (array!85505 (_ BitVec 32) List!29264) Bool)

(assert (=> b!1290903 (= res!857160 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29261))))

(declare-fun b!1290904 () Bool)

(declare-fun res!857156 () Bool)

(assert (=> b!1290904 (=> (not res!857156) (not e!737142))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85505 (_ BitVec 32)) Bool)

(assert (=> b!1290904 (= res!857156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52880 () Bool)

(declare-fun mapRes!52880 () Bool)

(declare-fun tp!100838 () Bool)

(declare-fun e!737141 () Bool)

(assert (=> mapNonEmpty!52880 (= mapRes!52880 (and tp!100838 e!737141))))

(declare-datatypes ((ValueCell!16208 0))(
  ( (ValueCellFull!16208 (v!19779 V!50721)) (EmptyCell!16208) )
))
(declare-datatypes ((array!85507 0))(
  ( (array!85508 (arr!41250 (Array (_ BitVec 32) ValueCell!16208)) (size!41801 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85507)

(declare-fun mapKey!52880 () (_ BitVec 32))

(declare-fun mapValue!52880 () ValueCell!16208)

(declare-fun mapRest!52880 () (Array (_ BitVec 32) ValueCell!16208))

(assert (=> mapNonEmpty!52880 (= (arr!41250 _values!1445) (store mapRest!52880 mapKey!52880 mapValue!52880))))

(declare-fun b!1290905 () Bool)

(declare-fun tp_is_empty!34213 () Bool)

(assert (=> b!1290905 (= e!737141 tp_is_empty!34213)))

(declare-fun mapIsEmpty!52880 () Bool)

(assert (=> mapIsEmpty!52880 mapRes!52880))

(declare-fun b!1290906 () Bool)

(declare-fun e!737140 () Bool)

(declare-fun e!737144 () Bool)

(assert (=> b!1290906 (= e!737140 (and e!737144 mapRes!52880))))

(declare-fun condMapEmpty!52880 () Bool)

(declare-fun mapDefault!52880 () ValueCell!16208)

(assert (=> b!1290906 (= condMapEmpty!52880 (= (arr!41250 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16208)) mapDefault!52880)))))

(declare-fun b!1290907 () Bool)

(declare-fun res!857161 () Bool)

(assert (=> b!1290907 (=> (not res!857161) (not e!737142))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1290907 (= res!857161 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41800 _keys!1741))))))

(declare-fun b!1290908 () Bool)

(assert (=> b!1290908 (= e!737144 tp_is_empty!34213)))

(declare-fun res!857162 () Bool)

(assert (=> start!109308 (=> (not res!857162) (not e!737142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109308 (= res!857162 (validMask!0 mask!2175))))

(assert (=> start!109308 e!737142))

(assert (=> start!109308 tp_is_empty!34213))

(assert (=> start!109308 true))

(declare-fun array_inv!31481 (array!85507) Bool)

(assert (=> start!109308 (and (array_inv!31481 _values!1445) e!737140)))

(declare-fun array_inv!31482 (array!85505) Bool)

(assert (=> start!109308 (array_inv!31482 _keys!1741)))

(assert (=> start!109308 tp!100837))

(declare-fun b!1290909 () Bool)

(declare-fun res!857164 () Bool)

(assert (=> b!1290909 (=> (not res!857164) (not e!737142))))

(declare-fun minValue!1387 () V!50721)

(declare-fun zeroValue!1387 () V!50721)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4934 (array!85505 array!85507 (_ BitVec 32) (_ BitVec 32) V!50721 V!50721 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1290909 (= res!857164 (contains!8020 (getCurrentListMap!4934 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1290910 () Bool)

(declare-fun res!857158 () Bool)

(assert (=> b!1290910 (=> (not res!857158) (not e!737142))))

(assert (=> b!1290910 (= res!857158 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41800 _keys!1741))))))

(declare-fun b!1290911 () Bool)

(declare-fun res!857159 () Bool)

(assert (=> b!1290911 (=> (not res!857159) (not e!737142))))

(assert (=> b!1290911 (= res!857159 (and (= (size!41801 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41800 _keys!1741) (size!41801 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290912 () Bool)

(assert (=> b!1290912 (= e!737143 true)))

(declare-fun lt!578795 () ListLongMap!19747)

(declare-fun +!4392 (ListLongMap!19747 tuple2!22082) ListLongMap!19747)

(assert (=> b!1290912 (not (contains!8020 (+!4392 lt!578795 (tuple2!22083 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!578794 () Unit!42627)

(declare-fun addStillNotContains!368 (ListLongMap!19747 (_ BitVec 64) V!50721 (_ BitVec 64)) Unit!42627)

(assert (=> b!1290912 (= lt!578794 (addStillNotContains!368 lt!578795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1290912 (not (contains!8020 (+!4392 lt!578795 (tuple2!22083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578793 () Unit!42627)

(assert (=> b!1290912 (= lt!578793 (addStillNotContains!368 lt!578795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6030 (array!85505 array!85507 (_ BitVec 32) (_ BitVec 32) V!50721 V!50721 (_ BitVec 32) Int) ListLongMap!19747)

(assert (=> b!1290912 (= lt!578795 (getCurrentListMapNoExtraKeys!6030 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290913 () Bool)

(declare-fun res!857157 () Bool)

(assert (=> b!1290913 (=> (not res!857157) (not e!737142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290913 (= res!857157 (not (validKeyInArray!0 (select (arr!41249 _keys!1741) from!2144))))))

(assert (= (and start!109308 res!857162) b!1290911))

(assert (= (and b!1290911 res!857159) b!1290904))

(assert (= (and b!1290904 res!857156) b!1290903))

(assert (= (and b!1290903 res!857160) b!1290907))

(assert (= (and b!1290907 res!857161) b!1290909))

(assert (= (and b!1290909 res!857164) b!1290910))

(assert (= (and b!1290910 res!857158) b!1290913))

(assert (= (and b!1290913 res!857157) b!1290902))

(assert (= (and b!1290902 (not res!857163)) b!1290912))

(assert (= (and b!1290906 condMapEmpty!52880) mapIsEmpty!52880))

(assert (= (and b!1290906 (not condMapEmpty!52880)) mapNonEmpty!52880))

(get-info :version)

(assert (= (and mapNonEmpty!52880 ((_ is ValueCellFull!16208) mapValue!52880)) b!1290905))

(assert (= (and b!1290906 ((_ is ValueCellFull!16208) mapDefault!52880)) b!1290908))

(assert (= start!109308 b!1290906))

(declare-fun m!1183743 () Bool)

(assert (=> b!1290903 m!1183743))

(declare-fun m!1183745 () Bool)

(assert (=> mapNonEmpty!52880 m!1183745))

(declare-fun m!1183747 () Bool)

(assert (=> b!1290913 m!1183747))

(assert (=> b!1290913 m!1183747))

(declare-fun m!1183749 () Bool)

(assert (=> b!1290913 m!1183749))

(declare-fun m!1183751 () Bool)

(assert (=> start!109308 m!1183751))

(declare-fun m!1183753 () Bool)

(assert (=> start!109308 m!1183753))

(declare-fun m!1183755 () Bool)

(assert (=> start!109308 m!1183755))

(declare-fun m!1183757 () Bool)

(assert (=> b!1290912 m!1183757))

(declare-fun m!1183759 () Bool)

(assert (=> b!1290912 m!1183759))

(declare-fun m!1183761 () Bool)

(assert (=> b!1290912 m!1183761))

(assert (=> b!1290912 m!1183757))

(declare-fun m!1183763 () Bool)

(assert (=> b!1290912 m!1183763))

(declare-fun m!1183765 () Bool)

(assert (=> b!1290912 m!1183765))

(assert (=> b!1290912 m!1183759))

(declare-fun m!1183767 () Bool)

(assert (=> b!1290912 m!1183767))

(declare-fun m!1183769 () Bool)

(assert (=> b!1290912 m!1183769))

(declare-fun m!1183771 () Bool)

(assert (=> b!1290904 m!1183771))

(declare-fun m!1183773 () Bool)

(assert (=> b!1290902 m!1183773))

(declare-fun m!1183775 () Bool)

(assert (=> b!1290902 m!1183775))

(declare-fun m!1183777 () Bool)

(assert (=> b!1290909 m!1183777))

(assert (=> b!1290909 m!1183777))

(declare-fun m!1183779 () Bool)

(assert (=> b!1290909 m!1183779))

(check-sat (not b!1290909) (not b!1290913) (not b!1290902) b_and!46665 tp_is_empty!34213 (not b_next!28573) (not mapNonEmpty!52880) (not start!109308) (not b!1290904) (not b!1290912) (not b!1290903))
(check-sat b_and!46665 (not b_next!28573))
