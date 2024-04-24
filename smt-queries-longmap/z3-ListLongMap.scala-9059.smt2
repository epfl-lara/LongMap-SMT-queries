; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109362 () Bool)

(assert start!109362)

(declare-fun b_free!28627 () Bool)

(declare-fun b_next!28627 () Bool)

(assert (=> start!109362 (= b_free!28627 (not b_next!28627))))

(declare-fun tp!101000 () Bool)

(declare-fun b_and!46719 () Bool)

(assert (=> start!109362 (= tp!101000 b_and!46719)))

(declare-fun b!1291874 () Bool)

(declare-fun e!737627 () Bool)

(declare-fun e!737630 () Bool)

(assert (=> b!1291874 (= e!737627 (not e!737630))))

(declare-fun res!857887 () Bool)

(assert (=> b!1291874 (=> res!857887 e!737630)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291874 (= res!857887 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50793 0))(
  ( (V!50794 (val!17208 Int)) )
))
(declare-datatypes ((tuple2!22130 0))(
  ( (tuple2!22131 (_1!11076 (_ BitVec 64)) (_2!11076 V!50793)) )
))
(declare-datatypes ((List!29306 0))(
  ( (Nil!29303) (Cons!29302 (h!30520 tuple2!22130) (t!42862 List!29306)) )
))
(declare-datatypes ((ListLongMap!19795 0))(
  ( (ListLongMap!19796 (toList!9913 List!29306)) )
))
(declare-fun contains!8044 (ListLongMap!19795 (_ BitVec 64)) Bool)

(assert (=> b!1291874 (not (contains!8044 (ListLongMap!19796 Nil!29303) k0!1205))))

(declare-datatypes ((Unit!42673 0))(
  ( (Unit!42674) )
))
(declare-fun lt!579175 () Unit!42673)

(declare-fun emptyContainsNothing!87 ((_ BitVec 64)) Unit!42673)

(assert (=> b!1291874 (= lt!579175 (emptyContainsNothing!87 k0!1205))))

(declare-fun mapIsEmpty!52961 () Bool)

(declare-fun mapRes!52961 () Bool)

(assert (=> mapIsEmpty!52961 mapRes!52961))

(declare-fun b!1291876 () Bool)

(assert (=> b!1291876 (= e!737630 true)))

(assert (=> b!1291876 false))

(declare-fun minValue!1387 () V!50793)

(declare-fun lt!579178 () Unit!42673)

(declare-fun lt!579180 () ListLongMap!19795)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!41 ((_ BitVec 64) (_ BitVec 64) V!50793 ListLongMap!19795) Unit!42673)

(assert (=> b!1291876 (= lt!579178 (lemmaInListMapAfterAddingDiffThenInBefore!41 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579180))))

(declare-fun lt!579177 () ListLongMap!19795)

(declare-fun +!4412 (ListLongMap!19795 tuple2!22130) ListLongMap!19795)

(assert (=> b!1291876 (not (contains!8044 (+!4412 lt!579177 (tuple2!22131 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579179 () Unit!42673)

(declare-fun addStillNotContains!388 (ListLongMap!19795 (_ BitVec 64) V!50793 (_ BitVec 64)) Unit!42673)

(assert (=> b!1291876 (= lt!579179 (addStillNotContains!388 lt!579177 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291876 (not (contains!8044 lt!579180 k0!1205))))

(declare-fun zeroValue!1387 () V!50793)

(assert (=> b!1291876 (= lt!579180 (+!4412 lt!579177 (tuple2!22131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579176 () Unit!42673)

(assert (=> b!1291876 (= lt!579176 (addStillNotContains!388 lt!579177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16235 0))(
  ( (ValueCellFull!16235 (v!19806 V!50793)) (EmptyCell!16235) )
))
(declare-datatypes ((array!85611 0))(
  ( (array!85612 (arr!41302 (Array (_ BitVec 32) ValueCell!16235)) (size!41853 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85611)

(declare-datatypes ((array!85613 0))(
  ( (array!85614 (arr!41303 (Array (_ BitVec 32) (_ BitVec 64))) (size!41854 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85613)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6050 (array!85613 array!85611 (_ BitVec 32) (_ BitVec 32) V!50793 V!50793 (_ BitVec 32) Int) ListLongMap!19795)

(assert (=> b!1291876 (= lt!579177 (getCurrentListMapNoExtraKeys!6050 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291877 () Bool)

(declare-fun res!857892 () Bool)

(assert (=> b!1291877 (=> (not res!857892) (not e!737627))))

(assert (=> b!1291877 (= res!857892 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41854 _keys!1741))))))

(declare-fun b!1291878 () Bool)

(declare-fun res!857888 () Bool)

(assert (=> b!1291878 (=> (not res!857888) (not e!737627))))

(assert (=> b!1291878 (= res!857888 (and (= (size!41853 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41854 _keys!1741) (size!41853 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291879 () Bool)

(declare-fun res!857885 () Bool)

(assert (=> b!1291879 (=> (not res!857885) (not e!737627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85613 (_ BitVec 32)) Bool)

(assert (=> b!1291879 (= res!857885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291880 () Bool)

(declare-fun res!857890 () Bool)

(assert (=> b!1291880 (=> (not res!857890) (not e!737627))))

(declare-fun getCurrentListMap!4953 (array!85613 array!85611 (_ BitVec 32) (_ BitVec 32) V!50793 V!50793 (_ BitVec 32) Int) ListLongMap!19795)

(assert (=> b!1291880 (= res!857890 (contains!8044 (getCurrentListMap!4953 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!857886 () Bool)

(assert (=> start!109362 (=> (not res!857886) (not e!737627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109362 (= res!857886 (validMask!0 mask!2175))))

(assert (=> start!109362 e!737627))

(declare-fun tp_is_empty!34267 () Bool)

(assert (=> start!109362 tp_is_empty!34267))

(assert (=> start!109362 true))

(declare-fun e!737626 () Bool)

(declare-fun array_inv!31527 (array!85611) Bool)

(assert (=> start!109362 (and (array_inv!31527 _values!1445) e!737626)))

(declare-fun array_inv!31528 (array!85613) Bool)

(assert (=> start!109362 (array_inv!31528 _keys!1741)))

(assert (=> start!109362 tp!101000))

(declare-fun b!1291875 () Bool)

(declare-fun res!857893 () Bool)

(assert (=> b!1291875 (=> (not res!857893) (not e!737627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291875 (= res!857893 (not (validKeyInArray!0 (select (arr!41303 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52961 () Bool)

(declare-fun tp!100999 () Bool)

(declare-fun e!737629 () Bool)

(assert (=> mapNonEmpty!52961 (= mapRes!52961 (and tp!100999 e!737629))))

(declare-fun mapKey!52961 () (_ BitVec 32))

(declare-fun mapRest!52961 () (Array (_ BitVec 32) ValueCell!16235))

(declare-fun mapValue!52961 () ValueCell!16235)

(assert (=> mapNonEmpty!52961 (= (arr!41302 _values!1445) (store mapRest!52961 mapKey!52961 mapValue!52961))))

(declare-fun b!1291881 () Bool)

(assert (=> b!1291881 (= e!737629 tp_is_empty!34267)))

(declare-fun b!1291882 () Bool)

(declare-fun res!857891 () Bool)

(assert (=> b!1291882 (=> (not res!857891) (not e!737627))))

(assert (=> b!1291882 (= res!857891 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41854 _keys!1741))))))

(declare-fun b!1291883 () Bool)

(declare-fun e!737628 () Bool)

(assert (=> b!1291883 (= e!737628 tp_is_empty!34267)))

(declare-fun b!1291884 () Bool)

(declare-fun res!857889 () Bool)

(assert (=> b!1291884 (=> (not res!857889) (not e!737627))))

(declare-datatypes ((List!29307 0))(
  ( (Nil!29304) (Cons!29303 (h!30521 (_ BitVec 64)) (t!42863 List!29307)) )
))
(declare-fun arrayNoDuplicates!0 (array!85613 (_ BitVec 32) List!29307) Bool)

(assert (=> b!1291884 (= res!857889 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29304))))

(declare-fun b!1291885 () Bool)

(assert (=> b!1291885 (= e!737626 (and e!737628 mapRes!52961))))

(declare-fun condMapEmpty!52961 () Bool)

(declare-fun mapDefault!52961 () ValueCell!16235)

(assert (=> b!1291885 (= condMapEmpty!52961 (= (arr!41302 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16235)) mapDefault!52961)))))

(assert (= (and start!109362 res!857886) b!1291878))

(assert (= (and b!1291878 res!857888) b!1291879))

(assert (= (and b!1291879 res!857885) b!1291884))

(assert (= (and b!1291884 res!857889) b!1291877))

(assert (= (and b!1291877 res!857892) b!1291880))

(assert (= (and b!1291880 res!857890) b!1291882))

(assert (= (and b!1291882 res!857891) b!1291875))

(assert (= (and b!1291875 res!857893) b!1291874))

(assert (= (and b!1291874 (not res!857887)) b!1291876))

(assert (= (and b!1291885 condMapEmpty!52961) mapIsEmpty!52961))

(assert (= (and b!1291885 (not condMapEmpty!52961)) mapNonEmpty!52961))

(get-info :version)

(assert (= (and mapNonEmpty!52961 ((_ is ValueCellFull!16235) mapValue!52961)) b!1291881))

(assert (= (and b!1291885 ((_ is ValueCellFull!16235) mapDefault!52961)) b!1291883))

(assert (= start!109362 b!1291885))

(declare-fun m!1184793 () Bool)

(assert (=> start!109362 m!1184793))

(declare-fun m!1184795 () Bool)

(assert (=> start!109362 m!1184795))

(declare-fun m!1184797 () Bool)

(assert (=> start!109362 m!1184797))

(declare-fun m!1184799 () Bool)

(assert (=> mapNonEmpty!52961 m!1184799))

(declare-fun m!1184801 () Bool)

(assert (=> b!1291874 m!1184801))

(declare-fun m!1184803 () Bool)

(assert (=> b!1291874 m!1184803))

(declare-fun m!1184805 () Bool)

(assert (=> b!1291879 m!1184805))

(declare-fun m!1184807 () Bool)

(assert (=> b!1291876 m!1184807))

(declare-fun m!1184809 () Bool)

(assert (=> b!1291876 m!1184809))

(declare-fun m!1184811 () Bool)

(assert (=> b!1291876 m!1184811))

(assert (=> b!1291876 m!1184809))

(declare-fun m!1184813 () Bool)

(assert (=> b!1291876 m!1184813))

(declare-fun m!1184815 () Bool)

(assert (=> b!1291876 m!1184815))

(declare-fun m!1184817 () Bool)

(assert (=> b!1291876 m!1184817))

(declare-fun m!1184819 () Bool)

(assert (=> b!1291876 m!1184819))

(declare-fun m!1184821 () Bool)

(assert (=> b!1291876 m!1184821))

(declare-fun m!1184823 () Bool)

(assert (=> b!1291884 m!1184823))

(declare-fun m!1184825 () Bool)

(assert (=> b!1291875 m!1184825))

(assert (=> b!1291875 m!1184825))

(declare-fun m!1184827 () Bool)

(assert (=> b!1291875 m!1184827))

(declare-fun m!1184829 () Bool)

(assert (=> b!1291880 m!1184829))

(assert (=> b!1291880 m!1184829))

(declare-fun m!1184831 () Bool)

(assert (=> b!1291880 m!1184831))

(check-sat (not start!109362) (not b!1291876) tp_is_empty!34267 b_and!46719 (not b!1291875) (not b_next!28627) (not b!1291884) (not b!1291874) (not mapNonEmpty!52961) (not b!1291879) (not b!1291880))
(check-sat b_and!46719 (not b_next!28627))
