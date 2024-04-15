; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109270 () Bool)

(assert start!109270)

(declare-fun b_free!28759 () Bool)

(declare-fun b_next!28759 () Bool)

(assert (=> start!109270 (= b_free!28759 (not b_next!28759))))

(declare-fun tp!101397 () Bool)

(declare-fun b_and!46831 () Bool)

(assert (=> start!109270 (= tp!101397 b_and!46831)))

(declare-fun res!859042 () Bool)

(declare-fun e!737861 () Bool)

(assert (=> start!109270 (=> (not res!859042) (not e!737861))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109270 (= res!859042 (validMask!0 mask!2175))))

(assert (=> start!109270 e!737861))

(declare-fun tp_is_empty!34399 () Bool)

(assert (=> start!109270 tp_is_empty!34399))

(assert (=> start!109270 true))

(declare-datatypes ((V!50969 0))(
  ( (V!50970 (val!17274 Int)) )
))
(declare-datatypes ((ValueCell!16301 0))(
  ( (ValueCellFull!16301 (v!19876 V!50969)) (EmptyCell!16301) )
))
(declare-datatypes ((array!85715 0))(
  ( (array!85716 (arr!41359 (Array (_ BitVec 32) ValueCell!16301)) (size!41911 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85715)

(declare-fun e!737859 () Bool)

(declare-fun array_inv!31495 (array!85715) Bool)

(assert (=> start!109270 (and (array_inv!31495 _values!1445) e!737859)))

(declare-datatypes ((array!85717 0))(
  ( (array!85718 (arr!41360 (Array (_ BitVec 32) (_ BitVec 64))) (size!41912 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85717)

(declare-fun array_inv!31496 (array!85717) Bool)

(assert (=> start!109270 (array_inv!31496 _keys!1741)))

(assert (=> start!109270 tp!101397))

(declare-fun b!1292800 () Bool)

(declare-fun e!737862 () Bool)

(declare-fun mapRes!53159 () Bool)

(assert (=> b!1292800 (= e!737859 (and e!737862 mapRes!53159))))

(declare-fun condMapEmpty!53159 () Bool)

(declare-fun mapDefault!53159 () ValueCell!16301)

(assert (=> b!1292800 (= condMapEmpty!53159 (= (arr!41359 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16301)) mapDefault!53159)))))

(declare-fun b!1292801 () Bool)

(declare-fun res!859043 () Bool)

(assert (=> b!1292801 (=> (not res!859043) (not e!737861))))

(declare-fun minValue!1387 () V!50969)

(declare-fun zeroValue!1387 () V!50969)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22266 0))(
  ( (tuple2!22267 (_1!11144 (_ BitVec 64)) (_2!11144 V!50969)) )
))
(declare-datatypes ((List!29417 0))(
  ( (Nil!29414) (Cons!29413 (h!30622 tuple2!22266) (t!42973 List!29417)) )
))
(declare-datatypes ((ListLongMap!19923 0))(
  ( (ListLongMap!19924 (toList!9977 List!29417)) )
))
(declare-fun contains!8025 (ListLongMap!19923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4917 (array!85717 array!85715 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1292801 (= res!859043 (contains!8025 (getCurrentListMap!4917 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53159 () Bool)

(assert (=> mapIsEmpty!53159 mapRes!53159))

(declare-fun b!1292802 () Bool)

(declare-fun res!859044 () Bool)

(assert (=> b!1292802 (=> (not res!859044) (not e!737861))))

(declare-datatypes ((List!29418 0))(
  ( (Nil!29415) (Cons!29414 (h!30623 (_ BitVec 64)) (t!42974 List!29418)) )
))
(declare-fun arrayNoDuplicates!0 (array!85717 (_ BitVec 32) List!29418) Bool)

(assert (=> b!1292802 (= res!859044 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29415))))

(declare-fun b!1292803 () Bool)

(declare-fun res!859046 () Bool)

(assert (=> b!1292803 (=> (not res!859046) (not e!737861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85717 (_ BitVec 32)) Bool)

(assert (=> b!1292803 (= res!859046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292804 () Bool)

(declare-fun e!737858 () Bool)

(assert (=> b!1292804 (= e!737861 (not e!737858))))

(declare-fun res!859040 () Bool)

(assert (=> b!1292804 (=> res!859040 e!737858)))

(assert (=> b!1292804 (= res!859040 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1292804 (not (contains!8025 (ListLongMap!19924 Nil!29414) k0!1205))))

(declare-datatypes ((Unit!42634 0))(
  ( (Unit!42635) )
))
(declare-fun lt!579228 () Unit!42634)

(declare-fun emptyContainsNothing!114 ((_ BitVec 64)) Unit!42634)

(assert (=> b!1292804 (= lt!579228 (emptyContainsNothing!114 k0!1205))))

(declare-fun b!1292805 () Bool)

(assert (=> b!1292805 (= e!737862 tp_is_empty!34399)))

(declare-fun mapNonEmpty!53159 () Bool)

(declare-fun tp!101396 () Bool)

(declare-fun e!737860 () Bool)

(assert (=> mapNonEmpty!53159 (= mapRes!53159 (and tp!101396 e!737860))))

(declare-fun mapValue!53159 () ValueCell!16301)

(declare-fun mapKey!53159 () (_ BitVec 32))

(declare-fun mapRest!53159 () (Array (_ BitVec 32) ValueCell!16301))

(assert (=> mapNonEmpty!53159 (= (arr!41359 _values!1445) (store mapRest!53159 mapKey!53159 mapValue!53159))))

(declare-fun b!1292806 () Bool)

(declare-fun res!859041 () Bool)

(assert (=> b!1292806 (=> (not res!859041) (not e!737861))))

(assert (=> b!1292806 (= res!859041 (and (= (size!41911 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41912 _keys!1741) (size!41911 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292807 () Bool)

(declare-fun res!859047 () Bool)

(assert (=> b!1292807 (=> (not res!859047) (not e!737861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292807 (= res!859047 (not (validKeyInArray!0 (select (arr!41360 _keys!1741) from!2144))))))

(declare-fun b!1292808 () Bool)

(assert (=> b!1292808 (= e!737858 true)))

(declare-fun lt!579229 () ListLongMap!19923)

(declare-fun +!4427 (ListLongMap!19923 tuple2!22266) ListLongMap!19923)

(assert (=> b!1292808 (not (contains!8025 (+!4427 lt!579229 (tuple2!22267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579227 () Unit!42634)

(declare-fun addStillNotContains!404 (ListLongMap!19923 (_ BitVec 64) V!50969 (_ BitVec 64)) Unit!42634)

(assert (=> b!1292808 (= lt!579227 (addStillNotContains!404 lt!579229 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6059 (array!85717 array!85715 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1292808 (= lt!579229 (getCurrentListMapNoExtraKeys!6059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292809 () Bool)

(declare-fun res!859039 () Bool)

(assert (=> b!1292809 (=> (not res!859039) (not e!737861))))

(assert (=> b!1292809 (= res!859039 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41912 _keys!1741))))))

(declare-fun b!1292810 () Bool)

(declare-fun res!859045 () Bool)

(assert (=> b!1292810 (=> (not res!859045) (not e!737861))))

(assert (=> b!1292810 (= res!859045 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41912 _keys!1741))))))

(declare-fun b!1292811 () Bool)

(assert (=> b!1292811 (= e!737860 tp_is_empty!34399)))

(assert (= (and start!109270 res!859042) b!1292806))

(assert (= (and b!1292806 res!859041) b!1292803))

(assert (= (and b!1292803 res!859046) b!1292802))

(assert (= (and b!1292802 res!859044) b!1292809))

(assert (= (and b!1292809 res!859039) b!1292801))

(assert (= (and b!1292801 res!859043) b!1292810))

(assert (= (and b!1292810 res!859045) b!1292807))

(assert (= (and b!1292807 res!859047) b!1292804))

(assert (= (and b!1292804 (not res!859040)) b!1292808))

(assert (= (and b!1292800 condMapEmpty!53159) mapIsEmpty!53159))

(assert (= (and b!1292800 (not condMapEmpty!53159)) mapNonEmpty!53159))

(get-info :version)

(assert (= (and mapNonEmpty!53159 ((_ is ValueCellFull!16301) mapValue!53159)) b!1292811))

(assert (= (and b!1292800 ((_ is ValueCellFull!16301) mapDefault!53159)) b!1292805))

(assert (= start!109270 b!1292800))

(declare-fun m!1184823 () Bool)

(assert (=> b!1292802 m!1184823))

(declare-fun m!1184825 () Bool)

(assert (=> b!1292807 m!1184825))

(assert (=> b!1292807 m!1184825))

(declare-fun m!1184827 () Bool)

(assert (=> b!1292807 m!1184827))

(declare-fun m!1184829 () Bool)

(assert (=> b!1292808 m!1184829))

(assert (=> b!1292808 m!1184829))

(declare-fun m!1184831 () Bool)

(assert (=> b!1292808 m!1184831))

(declare-fun m!1184833 () Bool)

(assert (=> b!1292808 m!1184833))

(declare-fun m!1184835 () Bool)

(assert (=> b!1292808 m!1184835))

(declare-fun m!1184837 () Bool)

(assert (=> mapNonEmpty!53159 m!1184837))

(declare-fun m!1184839 () Bool)

(assert (=> b!1292801 m!1184839))

(assert (=> b!1292801 m!1184839))

(declare-fun m!1184841 () Bool)

(assert (=> b!1292801 m!1184841))

(declare-fun m!1184843 () Bool)

(assert (=> b!1292804 m!1184843))

(declare-fun m!1184845 () Bool)

(assert (=> b!1292804 m!1184845))

(declare-fun m!1184847 () Bool)

(assert (=> b!1292803 m!1184847))

(declare-fun m!1184849 () Bool)

(assert (=> start!109270 m!1184849))

(declare-fun m!1184851 () Bool)

(assert (=> start!109270 m!1184851))

(declare-fun m!1184853 () Bool)

(assert (=> start!109270 m!1184853))

(check-sat (not b!1292804) (not b!1292803) (not mapNonEmpty!53159) b_and!46831 tp_is_empty!34399 (not b!1292807) (not b!1292808) (not b!1292802) (not b_next!28759) (not start!109270) (not b!1292801))
(check-sat b_and!46831 (not b_next!28759))
