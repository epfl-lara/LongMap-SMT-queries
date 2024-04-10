; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110330 () Bool)

(assert start!110330)

(declare-fun b_free!29313 () Bool)

(declare-fun b_next!29313 () Bool)

(assert (=> start!110330 (= b_free!29313 (not b_next!29313))))

(declare-fun tp!103107 () Bool)

(declare-fun b_and!47519 () Bool)

(assert (=> start!110330 (= tp!103107 b_and!47519)))

(declare-fun b!1305814 () Bool)

(declare-fun res!867009 () Bool)

(declare-fun e!744855 () Bool)

(assert (=> b!1305814 (=> (not res!867009) (not e!744855))))

(declare-datatypes ((array!86922 0))(
  ( (array!86923 (arr!41947 (Array (_ BitVec 32) (_ BitVec 64))) (size!42497 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86922)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86922 (_ BitVec 32)) Bool)

(assert (=> b!1305814 (= res!867009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun call!64552 () Bool)

(declare-fun bm!64543 () Bool)

(declare-datatypes ((V!51707 0))(
  ( (V!51708 (val!17551 Int)) )
))
(declare-datatypes ((tuple2!22660 0))(
  ( (tuple2!22661 (_1!11341 (_ BitVec 64)) (_2!11341 V!51707)) )
))
(declare-datatypes ((List!29779 0))(
  ( (Nil!29776) (Cons!29775 (h!30984 tuple2!22660) (t!43383 List!29779)) )
))
(declare-datatypes ((ListLongMap!20317 0))(
  ( (ListLongMap!20318 (toList!10174 List!29779)) )
))
(declare-fun call!64546 () ListLongMap!20317)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun c!125499 () Bool)

(declare-fun lt!584742 () ListLongMap!20317)

(declare-fun contains!8319 (ListLongMap!20317 (_ BitVec 64)) Bool)

(assert (=> bm!64543 (= call!64552 (contains!8319 (ite c!125499 lt!584742 call!64546) k0!1205))))

(declare-fun minValue!1387 () V!51707)

(declare-fun zeroValue!1387 () V!51707)

(declare-fun lt!584739 () ListLongMap!20317)

(declare-fun bm!64544 () Bool)

(declare-fun c!125497 () Bool)

(declare-fun lt!584753 () ListLongMap!20317)

(declare-datatypes ((Unit!43256 0))(
  ( (Unit!43257) )
))
(declare-fun call!64555 () Unit!43256)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!95 ((_ BitVec 64) (_ BitVec 64) V!51707 ListLongMap!20317) Unit!43256)

(assert (=> bm!64544 (= call!64555 (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 (ite c!125499 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!125497 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!125499 minValue!1387 (ite c!125497 zeroValue!1387 minValue!1387)) (ite c!125499 lt!584742 (ite c!125497 lt!584739 lt!584753))))))

(declare-fun b!1305815 () Bool)

(declare-fun e!744854 () Bool)

(declare-fun tp_is_empty!34953 () Bool)

(assert (=> b!1305815 (= e!744854 tp_is_empty!34953)))

(declare-fun b!1305816 () Bool)

(declare-fun res!867006 () Bool)

(assert (=> b!1305816 (=> (not res!867006) (not e!744855))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1305816 (= res!867006 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42497 _keys!1741))))))

(declare-fun bm!64545 () Bool)

(declare-fun call!64551 () Unit!43256)

(declare-fun call!64554 () Unit!43256)

(assert (=> bm!64545 (= call!64551 call!64554)))

(declare-fun lt!584741 () ListLongMap!20317)

(declare-fun bm!64546 () Bool)

(declare-fun call!64549 () Bool)

(assert (=> bm!64546 (= call!64549 (contains!8319 (ite c!125499 lt!584741 (ite c!125497 lt!584739 lt!584753)) k0!1205))))

(declare-fun b!1305817 () Bool)

(declare-fun e!744856 () Unit!43256)

(declare-fun e!744858 () Unit!43256)

(assert (=> b!1305817 (= e!744856 e!744858)))

(declare-fun lt!584746 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1305817 (= c!125497 (and (not lt!584746) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305818 () Bool)

(declare-fun res!867008 () Bool)

(assert (=> b!1305818 (=> (not res!867008) (not e!744855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1305818 (= res!867008 (not (validKeyInArray!0 (select (arr!41947 _keys!1741) from!2144))))))

(declare-fun bm!64548 () Bool)

(declare-fun call!64557 () ListLongMap!20317)

(assert (=> bm!64548 (= call!64546 call!64557)))

(declare-fun b!1305819 () Bool)

(declare-fun res!867011 () Bool)

(assert (=> b!1305819 (=> (not res!867011) (not e!744855))))

(declare-datatypes ((List!29780 0))(
  ( (Nil!29777) (Cons!29776 (h!30985 (_ BitVec 64)) (t!43384 List!29780)) )
))
(declare-fun arrayNoDuplicates!0 (array!86922 (_ BitVec 32) List!29780) Bool)

(assert (=> b!1305819 (= res!867011 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29777))))

(declare-fun b!1305820 () Bool)

(declare-fun e!744860 () Unit!43256)

(declare-fun lt!584744 () Unit!43256)

(assert (=> b!1305820 (= e!744860 lt!584744)))

(declare-fun call!64547 () ListLongMap!20317)

(assert (=> b!1305820 (= lt!584753 call!64547)))

(declare-fun lt!584740 () Unit!43256)

(assert (=> b!1305820 (= lt!584740 call!64551)))

(declare-fun call!64556 () Bool)

(assert (=> b!1305820 (not call!64556)))

(declare-fun call!64550 () Unit!43256)

(assert (=> b!1305820 (= lt!584744 call!64550)))

(declare-fun call!64553 () Bool)

(assert (=> b!1305820 call!64553))

(declare-fun bm!64549 () Bool)

(assert (=> bm!64549 (= call!64556 call!64552)))

(declare-fun bm!64550 () Bool)

(assert (=> bm!64550 (= call!64550 call!64555)))

(declare-fun bm!64551 () Bool)

(declare-fun +!4493 (ListLongMap!20317 tuple2!22660) ListLongMap!20317)

(assert (=> bm!64551 (= call!64557 (+!4493 (ite c!125499 lt!584741 (ite c!125497 lt!584739 lt!584753)) (ite c!125499 (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387) (ite c!125497 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1305821 () Bool)

(declare-fun res!867012 () Bool)

(assert (=> b!1305821 (=> (not res!867012) (not e!744855))))

(declare-datatypes ((ValueCell!16578 0))(
  ( (ValueCellFull!16578 (v!20176 V!51707)) (EmptyCell!16578) )
))
(declare-datatypes ((array!86924 0))(
  ( (array!86925 (arr!41948 (Array (_ BitVec 32) ValueCell!16578)) (size!42498 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86924)

(assert (=> b!1305821 (= res!867012 (and (= (size!42498 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42497 _keys!1741) (size!42498 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54040 () Bool)

(declare-fun mapRes!54040 () Bool)

(assert (=> mapIsEmpty!54040 mapRes!54040))

(declare-fun bm!64552 () Bool)

(declare-fun call!64548 () ListLongMap!20317)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6129 (array!86922 array!86924 (_ BitVec 32) (_ BitVec 32) V!51707 V!51707 (_ BitVec 32) Int) ListLongMap!20317)

(assert (=> bm!64552 (= call!64548 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64553 () Bool)

(assert (=> bm!64553 (= call!64553 call!64549)))

(declare-fun b!1305822 () Bool)

(declare-fun Unit!43258 () Unit!43256)

(assert (=> b!1305822 (= e!744860 Unit!43258)))

(declare-fun b!1305823 () Bool)

(assert (=> b!1305823 (= e!744855 (not true))))

(declare-fun lt!584751 () Unit!43256)

(assert (=> b!1305823 (= lt!584751 e!744856)))

(assert (=> b!1305823 (= c!125499 (and (not lt!584746) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1305823 (= lt!584746 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1305823 (not (contains!8319 (ListLongMap!20318 Nil!29776) k0!1205))))

(declare-fun lt!584745 () Unit!43256)

(declare-fun emptyContainsNothing!235 ((_ BitVec 64)) Unit!43256)

(assert (=> b!1305823 (= lt!584745 (emptyContainsNothing!235 k0!1205))))

(declare-fun bm!64547 () Bool)

(assert (=> bm!64547 (= call!64547 call!64548)))

(declare-fun res!867013 () Bool)

(assert (=> start!110330 (=> (not res!867013) (not e!744855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110330 (= res!867013 (validMask!0 mask!2175))))

(assert (=> start!110330 e!744855))

(assert (=> start!110330 tp_is_empty!34953))

(assert (=> start!110330 true))

(declare-fun e!744857 () Bool)

(declare-fun array_inv!31717 (array!86924) Bool)

(assert (=> start!110330 (and (array_inv!31717 _values!1445) e!744857)))

(declare-fun array_inv!31718 (array!86922) Bool)

(assert (=> start!110330 (array_inv!31718 _keys!1741)))

(assert (=> start!110330 tp!103107))

(declare-fun b!1305824 () Bool)

(declare-fun res!867010 () Bool)

(assert (=> b!1305824 (=> (not res!867010) (not e!744855))))

(declare-fun getCurrentListMap!5188 (array!86922 array!86924 (_ BitVec 32) (_ BitVec 32) V!51707 V!51707 (_ BitVec 32) Int) ListLongMap!20317)

(assert (=> b!1305824 (= res!867010 (contains!8319 (getCurrentListMap!5188 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!54040 () Bool)

(declare-fun tp!103108 () Bool)

(assert (=> mapNonEmpty!54040 (= mapRes!54040 (and tp!103108 e!744854))))

(declare-fun mapKey!54040 () (_ BitVec 32))

(declare-fun mapValue!54040 () ValueCell!16578)

(declare-fun mapRest!54040 () (Array (_ BitVec 32) ValueCell!16578))

(assert (=> mapNonEmpty!54040 (= (arr!41948 _values!1445) (store mapRest!54040 mapKey!54040 mapValue!54040))))

(declare-fun bm!64554 () Bool)

(declare-fun addStillNotContains!490 (ListLongMap!20317 (_ BitVec 64) V!51707 (_ BitVec 64)) Unit!43256)

(assert (=> bm!64554 (= call!64554 (addStillNotContains!490 (ite c!125499 lt!584741 (ite c!125497 lt!584739 lt!584753)) (ite (or c!125499 c!125497) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125499 c!125497) zeroValue!1387 minValue!1387) k0!1205))))

(declare-fun b!1305825 () Bool)

(declare-fun lt!584738 () Unit!43256)

(assert (=> b!1305825 (= e!744856 lt!584738)))

(assert (=> b!1305825 (= lt!584741 call!64548)))

(declare-fun lt!584748 () Unit!43256)

(assert (=> b!1305825 (= lt!584748 call!64554)))

(assert (=> b!1305825 (= lt!584742 (+!4493 lt!584741 (tuple2!22661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (=> b!1305825 (not call!64552)))

(declare-fun lt!584750 () Unit!43256)

(assert (=> b!1305825 (= lt!584750 (addStillNotContains!490 lt!584741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1305825 (not (contains!8319 call!64557 k0!1205))))

(declare-fun lt!584747 () Unit!43256)

(assert (=> b!1305825 (= lt!584747 call!64555)))

(assert (=> b!1305825 false))

(assert (=> b!1305825 (= lt!584738 (lemmaInListMapAfterAddingDiffThenInBefore!95 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!584741))))

(declare-fun lt!584749 () Bool)

(assert (=> b!1305825 (= lt!584749 call!64549)))

(declare-fun b!1305826 () Bool)

(declare-fun res!867007 () Bool)

(assert (=> b!1305826 (=> (not res!867007) (not e!744855))))

(assert (=> b!1305826 (= res!867007 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42497 _keys!1741))))))

(declare-fun b!1305827 () Bool)

(assert (=> b!1305827 call!64553))

(declare-fun lt!584752 () Unit!43256)

(assert (=> b!1305827 (= lt!584752 call!64550)))

(assert (=> b!1305827 (not call!64556)))

(declare-fun lt!584743 () Unit!43256)

(assert (=> b!1305827 (= lt!584743 call!64551)))

(assert (=> b!1305827 (= lt!584739 call!64547)))

(assert (=> b!1305827 (= e!744858 lt!584752)))

(declare-fun b!1305828 () Bool)

(declare-fun e!744859 () Bool)

(assert (=> b!1305828 (= e!744857 (and e!744859 mapRes!54040))))

(declare-fun condMapEmpty!54040 () Bool)

(declare-fun mapDefault!54040 () ValueCell!16578)

(assert (=> b!1305828 (= condMapEmpty!54040 (= (arr!41948 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16578)) mapDefault!54040)))))

(declare-fun b!1305829 () Bool)

(declare-fun c!125498 () Bool)

(assert (=> b!1305829 (= c!125498 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!584746))))

(assert (=> b!1305829 (= e!744858 e!744860)))

(declare-fun b!1305830 () Bool)

(assert (=> b!1305830 (= e!744859 tp_is_empty!34953)))

(assert (= (and start!110330 res!867013) b!1305821))

(assert (= (and b!1305821 res!867012) b!1305814))

(assert (= (and b!1305814 res!867009) b!1305819))

(assert (= (and b!1305819 res!867011) b!1305816))

(assert (= (and b!1305816 res!867006) b!1305824))

(assert (= (and b!1305824 res!867010) b!1305826))

(assert (= (and b!1305826 res!867007) b!1305818))

(assert (= (and b!1305818 res!867008) b!1305823))

(assert (= (and b!1305823 c!125499) b!1305825))

(assert (= (and b!1305823 (not c!125499)) b!1305817))

(assert (= (and b!1305817 c!125497) b!1305827))

(assert (= (and b!1305817 (not c!125497)) b!1305829))

(assert (= (and b!1305829 c!125498) b!1305820))

(assert (= (and b!1305829 (not c!125498)) b!1305822))

(assert (= (or b!1305827 b!1305820) bm!64545))

(assert (= (or b!1305827 b!1305820) bm!64553))

(assert (= (or b!1305827 b!1305820) bm!64550))

(assert (= (or b!1305827 b!1305820) bm!64548))

(assert (= (or b!1305827 b!1305820) bm!64547))

(assert (= (or b!1305827 b!1305820) bm!64549))

(assert (= (or b!1305825 bm!64553) bm!64546))

(assert (= (or b!1305825 bm!64547) bm!64552))

(assert (= (or b!1305825 bm!64550) bm!64544))

(assert (= (or b!1305825 bm!64549) bm!64543))

(assert (= (or b!1305825 bm!64548) bm!64551))

(assert (= (or b!1305825 bm!64545) bm!64554))

(assert (= (and b!1305828 condMapEmpty!54040) mapIsEmpty!54040))

(assert (= (and b!1305828 (not condMapEmpty!54040)) mapNonEmpty!54040))

(get-info :version)

(assert (= (and mapNonEmpty!54040 ((_ is ValueCellFull!16578) mapValue!54040)) b!1305815))

(assert (= (and b!1305828 ((_ is ValueCellFull!16578) mapDefault!54040)) b!1305830))

(assert (= start!110330 b!1305828))

(declare-fun m!1197037 () Bool)

(assert (=> b!1305823 m!1197037))

(declare-fun m!1197039 () Bool)

(assert (=> b!1305823 m!1197039))

(declare-fun m!1197041 () Bool)

(assert (=> mapNonEmpty!54040 m!1197041))

(declare-fun m!1197043 () Bool)

(assert (=> bm!64543 m!1197043))

(declare-fun m!1197045 () Bool)

(assert (=> start!110330 m!1197045))

(declare-fun m!1197047 () Bool)

(assert (=> start!110330 m!1197047))

(declare-fun m!1197049 () Bool)

(assert (=> start!110330 m!1197049))

(declare-fun m!1197051 () Bool)

(assert (=> bm!64552 m!1197051))

(declare-fun m!1197053 () Bool)

(assert (=> b!1305824 m!1197053))

(assert (=> b!1305824 m!1197053))

(declare-fun m!1197055 () Bool)

(assert (=> b!1305824 m!1197055))

(declare-fun m!1197057 () Bool)

(assert (=> bm!64551 m!1197057))

(declare-fun m!1197059 () Bool)

(assert (=> bm!64544 m!1197059))

(declare-fun m!1197061 () Bool)

(assert (=> b!1305814 m!1197061))

(declare-fun m!1197063 () Bool)

(assert (=> b!1305825 m!1197063))

(declare-fun m!1197065 () Bool)

(assert (=> b!1305825 m!1197065))

(declare-fun m!1197067 () Bool)

(assert (=> b!1305825 m!1197067))

(declare-fun m!1197069 () Bool)

(assert (=> b!1305825 m!1197069))

(declare-fun m!1197071 () Bool)

(assert (=> b!1305819 m!1197071))

(declare-fun m!1197073 () Bool)

(assert (=> b!1305818 m!1197073))

(assert (=> b!1305818 m!1197073))

(declare-fun m!1197075 () Bool)

(assert (=> b!1305818 m!1197075))

(declare-fun m!1197077 () Bool)

(assert (=> bm!64546 m!1197077))

(declare-fun m!1197079 () Bool)

(assert (=> bm!64554 m!1197079))

(check-sat (not b!1305825) (not b_next!29313) (not b!1305819) (not bm!64554) b_and!47519 (not bm!64551) (not bm!64543) (not b!1305824) (not b!1305818) tp_is_empty!34953 (not bm!64552) (not bm!64546) (not start!110330) (not mapNonEmpty!54040) (not bm!64544) (not b!1305814) (not b!1305823))
(check-sat b_and!47519 (not b_next!29313))
