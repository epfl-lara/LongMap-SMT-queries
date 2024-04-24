; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109314 () Bool)

(assert start!109314)

(declare-fun b_free!28579 () Bool)

(declare-fun b_next!28579 () Bool)

(assert (=> start!109314 (= b_free!28579 (not b_next!28579))))

(declare-fun tp!100855 () Bool)

(declare-fun b_and!46671 () Bool)

(assert (=> start!109314 (= tp!100855 b_and!46671)))

(declare-fun mapIsEmpty!52889 () Bool)

(declare-fun mapRes!52889 () Bool)

(assert (=> mapIsEmpty!52889 mapRes!52889))

(declare-fun b!1291010 () Bool)

(declare-fun res!857238 () Bool)

(declare-fun e!737195 () Bool)

(assert (=> b!1291010 (=> (not res!857238) (not e!737195))))

(declare-datatypes ((array!85517 0))(
  ( (array!85518 (arr!41255 (Array (_ BitVec 32) (_ BitVec 64))) (size!41806 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85517)

(declare-datatypes ((List!29269 0))(
  ( (Nil!29266) (Cons!29265 (h!30483 (_ BitVec 64)) (t!42825 List!29269)) )
))
(declare-fun arrayNoDuplicates!0 (array!85517 (_ BitVec 32) List!29269) Bool)

(assert (=> b!1291010 (= res!857238 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29266))))

(declare-fun b!1291011 () Bool)

(declare-fun res!857242 () Bool)

(assert (=> b!1291011 (=> (not res!857242) (not e!737195))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291011 (= res!857242 (not (validKeyInArray!0 (select (arr!41255 _keys!1741) from!2144))))))

(declare-fun b!1291012 () Bool)

(declare-fun e!737194 () Bool)

(declare-fun e!737198 () Bool)

(assert (=> b!1291012 (= e!737194 (and e!737198 mapRes!52889))))

(declare-fun condMapEmpty!52889 () Bool)

(declare-datatypes ((V!50729 0))(
  ( (V!50730 (val!17184 Int)) )
))
(declare-datatypes ((ValueCell!16211 0))(
  ( (ValueCellFull!16211 (v!19782 V!50729)) (EmptyCell!16211) )
))
(declare-datatypes ((array!85519 0))(
  ( (array!85520 (arr!41256 (Array (_ BitVec 32) ValueCell!16211)) (size!41807 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85519)

(declare-fun mapDefault!52889 () ValueCell!16211)

(assert (=> b!1291012 (= condMapEmpty!52889 (= (arr!41256 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16211)) mapDefault!52889)))))

(declare-fun b!1291013 () Bool)

(declare-fun res!857239 () Bool)

(assert (=> b!1291013 (=> (not res!857239) (not e!737195))))

(assert (=> b!1291013 (= res!857239 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41806 _keys!1741))))))

(declare-fun res!857237 () Bool)

(assert (=> start!109314 (=> (not res!857237) (not e!737195))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109314 (= res!857237 (validMask!0 mask!2175))))

(assert (=> start!109314 e!737195))

(declare-fun tp_is_empty!34219 () Bool)

(assert (=> start!109314 tp_is_empty!34219))

(assert (=> start!109314 true))

(declare-fun array_inv!31485 (array!85519) Bool)

(assert (=> start!109314 (and (array_inv!31485 _values!1445) e!737194)))

(declare-fun array_inv!31486 (array!85517) Bool)

(assert (=> start!109314 (array_inv!31486 _keys!1741)))

(assert (=> start!109314 tp!100855))

(declare-fun mapNonEmpty!52889 () Bool)

(declare-fun tp!100856 () Bool)

(declare-fun e!737199 () Bool)

(assert (=> mapNonEmpty!52889 (= mapRes!52889 (and tp!100856 e!737199))))

(declare-fun mapKey!52889 () (_ BitVec 32))

(declare-fun mapRest!52889 () (Array (_ BitVec 32) ValueCell!16211))

(declare-fun mapValue!52889 () ValueCell!16211)

(assert (=> mapNonEmpty!52889 (= (arr!41256 _values!1445) (store mapRest!52889 mapKey!52889 mapValue!52889))))

(declare-fun b!1291014 () Bool)

(declare-fun res!857245 () Bool)

(assert (=> b!1291014 (=> (not res!857245) (not e!737195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85517 (_ BitVec 32)) Bool)

(assert (=> b!1291014 (= res!857245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291015 () Bool)

(declare-fun res!857241 () Bool)

(assert (=> b!1291015 (=> (not res!857241) (not e!737195))))

(declare-fun minValue!1387 () V!50729)

(declare-fun zeroValue!1387 () V!50729)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22088 0))(
  ( (tuple2!22089 (_1!11055 (_ BitVec 64)) (_2!11055 V!50729)) )
))
(declare-datatypes ((List!29270 0))(
  ( (Nil!29267) (Cons!29266 (h!30484 tuple2!22088) (t!42826 List!29270)) )
))
(declare-datatypes ((ListLongMap!19753 0))(
  ( (ListLongMap!19754 (toList!9892 List!29270)) )
))
(declare-fun contains!8023 (ListLongMap!19753 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4936 (array!85517 array!85519 (_ BitVec 32) (_ BitVec 32) V!50729 V!50729 (_ BitVec 32) Int) ListLongMap!19753)

(assert (=> b!1291015 (= res!857241 (contains!8023 (getCurrentListMap!4936 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1291016 () Bool)

(assert (=> b!1291016 (= e!737198 tp_is_empty!34219)))

(declare-fun b!1291017 () Bool)

(declare-fun e!737196 () Bool)

(assert (=> b!1291017 (= e!737196 true)))

(declare-fun lt!578832 () ListLongMap!19753)

(declare-fun +!4395 (ListLongMap!19753 tuple2!22088) ListLongMap!19753)

(assert (=> b!1291017 (not (contains!8023 (+!4395 lt!578832 (tuple2!22089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42633 0))(
  ( (Unit!42634) )
))
(declare-fun lt!578830 () Unit!42633)

(declare-fun addStillNotContains!371 (ListLongMap!19753 (_ BitVec 64) V!50729 (_ BitVec 64)) Unit!42633)

(assert (=> b!1291017 (= lt!578830 (addStillNotContains!371 lt!578832 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291017 (not (contains!8023 (+!4395 lt!578832 (tuple2!22089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!578829 () Unit!42633)

(assert (=> b!1291017 (= lt!578829 (addStillNotContains!371 lt!578832 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6033 (array!85517 array!85519 (_ BitVec 32) (_ BitVec 32) V!50729 V!50729 (_ BitVec 32) Int) ListLongMap!19753)

(assert (=> b!1291017 (= lt!578832 (getCurrentListMapNoExtraKeys!6033 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291018 () Bool)

(declare-fun res!857244 () Bool)

(assert (=> b!1291018 (=> (not res!857244) (not e!737195))))

(assert (=> b!1291018 (= res!857244 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41806 _keys!1741))))))

(declare-fun b!1291019 () Bool)

(assert (=> b!1291019 (= e!737199 tp_is_empty!34219)))

(declare-fun b!1291020 () Bool)

(assert (=> b!1291020 (= e!737195 (not e!737196))))

(declare-fun res!857240 () Bool)

(assert (=> b!1291020 (=> res!857240 e!737196)))

(assert (=> b!1291020 (= res!857240 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291020 (not (contains!8023 (ListLongMap!19754 Nil!29267) k0!1205))))

(declare-fun lt!578831 () Unit!42633)

(declare-fun emptyContainsNothing!68 ((_ BitVec 64)) Unit!42633)

(assert (=> b!1291020 (= lt!578831 (emptyContainsNothing!68 k0!1205))))

(declare-fun b!1291021 () Bool)

(declare-fun res!857243 () Bool)

(assert (=> b!1291021 (=> (not res!857243) (not e!737195))))

(assert (=> b!1291021 (= res!857243 (and (= (size!41807 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41806 _keys!1741) (size!41807 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109314 res!857237) b!1291021))

(assert (= (and b!1291021 res!857243) b!1291014))

(assert (= (and b!1291014 res!857245) b!1291010))

(assert (= (and b!1291010 res!857238) b!1291013))

(assert (= (and b!1291013 res!857239) b!1291015))

(assert (= (and b!1291015 res!857241) b!1291018))

(assert (= (and b!1291018 res!857244) b!1291011))

(assert (= (and b!1291011 res!857242) b!1291020))

(assert (= (and b!1291020 (not res!857240)) b!1291017))

(assert (= (and b!1291012 condMapEmpty!52889) mapIsEmpty!52889))

(assert (= (and b!1291012 (not condMapEmpty!52889)) mapNonEmpty!52889))

(get-info :version)

(assert (= (and mapNonEmpty!52889 ((_ is ValueCellFull!16211) mapValue!52889)) b!1291019))

(assert (= (and b!1291012 ((_ is ValueCellFull!16211) mapDefault!52889)) b!1291016))

(assert (= start!109314 b!1291012))

(declare-fun m!1183857 () Bool)

(assert (=> b!1291020 m!1183857))

(declare-fun m!1183859 () Bool)

(assert (=> b!1291020 m!1183859))

(declare-fun m!1183861 () Bool)

(assert (=> b!1291017 m!1183861))

(assert (=> b!1291017 m!1183861))

(declare-fun m!1183863 () Bool)

(assert (=> b!1291017 m!1183863))

(declare-fun m!1183865 () Bool)

(assert (=> b!1291017 m!1183865))

(declare-fun m!1183867 () Bool)

(assert (=> b!1291017 m!1183867))

(declare-fun m!1183869 () Bool)

(assert (=> b!1291017 m!1183869))

(assert (=> b!1291017 m!1183867))

(declare-fun m!1183871 () Bool)

(assert (=> b!1291017 m!1183871))

(declare-fun m!1183873 () Bool)

(assert (=> b!1291017 m!1183873))

(declare-fun m!1183875 () Bool)

(assert (=> b!1291010 m!1183875))

(declare-fun m!1183877 () Bool)

(assert (=> b!1291014 m!1183877))

(declare-fun m!1183879 () Bool)

(assert (=> b!1291015 m!1183879))

(assert (=> b!1291015 m!1183879))

(declare-fun m!1183881 () Bool)

(assert (=> b!1291015 m!1183881))

(declare-fun m!1183883 () Bool)

(assert (=> mapNonEmpty!52889 m!1183883))

(declare-fun m!1183885 () Bool)

(assert (=> b!1291011 m!1183885))

(assert (=> b!1291011 m!1183885))

(declare-fun m!1183887 () Bool)

(assert (=> b!1291011 m!1183887))

(declare-fun m!1183889 () Bool)

(assert (=> start!109314 m!1183889))

(declare-fun m!1183891 () Bool)

(assert (=> start!109314 m!1183891))

(declare-fun m!1183893 () Bool)

(assert (=> start!109314 m!1183893))

(check-sat (not b!1291014) (not b!1291011) (not b_next!28579) (not b!1291015) (not mapNonEmpty!52889) tp_is_empty!34219 (not b!1291017) (not b!1291010) (not b!1291020) b_and!46671 (not start!109314))
(check-sat b_and!46671 (not b_next!28579))
