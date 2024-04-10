; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109904 () Bool)

(assert start!109904)

(declare-fun b_free!29229 () Bool)

(declare-fun b_next!29229 () Bool)

(assert (=> start!109904 (= b_free!29229 (not b_next!29229))))

(declare-fun tp!102825 () Bool)

(declare-fun b_and!47365 () Bool)

(assert (=> start!109904 (= tp!102825 b_and!47365)))

(declare-fun bm!64057 () Bool)

(declare-fun call!64062 () Bool)

(declare-fun call!64061 () Bool)

(assert (=> bm!64057 (= call!64062 call!64061)))

(declare-fun b!1302022 () Bool)

(declare-datatypes ((Unit!43103 0))(
  ( (Unit!43104) )
))
(declare-fun e!742635 () Unit!43103)

(declare-fun e!742637 () Unit!43103)

(assert (=> b!1302022 (= e!742635 e!742637)))

(declare-fun c!124889 () Bool)

(declare-fun lt!582383 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1302022 (= c!124889 (and (not lt!582383) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302023 () Bool)

(declare-fun res!864931 () Bool)

(declare-fun e!742642 () Bool)

(assert (=> b!1302023 (=> (not res!864931) (not e!742642))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51595 0))(
  ( (V!51596 (val!17509 Int)) )
))
(declare-datatypes ((ValueCell!16536 0))(
  ( (ValueCellFull!16536 (v!20120 V!51595)) (EmptyCell!16536) )
))
(declare-datatypes ((array!86748 0))(
  ( (array!86749 (arr!41869 (Array (_ BitVec 32) ValueCell!16536)) (size!42419 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86748)

(declare-datatypes ((array!86750 0))(
  ( (array!86751 (arr!41870 (Array (_ BitVec 32) (_ BitVec 64))) (size!42420 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86750)

(assert (=> b!1302023 (= res!864931 (and (= (size!42419 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42420 _keys!1741) (size!42419 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302024 () Bool)

(declare-fun e!742636 () Unit!43103)

(declare-fun Unit!43105 () Unit!43103)

(assert (=> b!1302024 (= e!742636 Unit!43105)))

(declare-fun b!1302025 () Bool)

(declare-fun res!864927 () Bool)

(assert (=> b!1302025 (=> (not res!864927) (not e!742642))))

(declare-datatypes ((List!29718 0))(
  ( (Nil!29715) (Cons!29714 (h!30923 (_ BitVec 64)) (t!43304 List!29718)) )
))
(declare-fun arrayNoDuplicates!0 (array!86750 (_ BitVec 32) List!29718) Bool)

(assert (=> b!1302025 (= res!864927 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29715))))

(declare-fun b!1302026 () Bool)

(declare-fun res!864930 () Bool)

(assert (=> b!1302026 (=> (not res!864930) (not e!742642))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1302026 (= res!864930 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741))))))

(declare-fun mapNonEmpty!53883 () Bool)

(declare-fun mapRes!53883 () Bool)

(declare-fun tp!102824 () Bool)

(declare-fun e!742638 () Bool)

(assert (=> mapNonEmpty!53883 (= mapRes!53883 (and tp!102824 e!742638))))

(declare-fun mapKey!53883 () (_ BitVec 32))

(declare-fun mapRest!53883 () (Array (_ BitVec 32) ValueCell!16536))

(declare-fun mapValue!53883 () ValueCell!16536)

(assert (=> mapNonEmpty!53883 (= (arr!41869 _values!1445) (store mapRest!53883 mapKey!53883 mapValue!53883))))

(declare-fun b!1302027 () Bool)

(declare-fun lt!582387 () Unit!43103)

(assert (=> b!1302027 (= e!742636 lt!582387)))

(declare-datatypes ((tuple2!22590 0))(
  ( (tuple2!22591 (_1!11306 (_ BitVec 64)) (_2!11306 V!51595)) )
))
(declare-datatypes ((List!29719 0))(
  ( (Nil!29716) (Cons!29715 (h!30924 tuple2!22590) (t!43305 List!29719)) )
))
(declare-datatypes ((ListLongMap!20247 0))(
  ( (ListLongMap!20248 (toList!10139 List!29719)) )
))
(declare-fun lt!582389 () ListLongMap!20247)

(declare-fun call!64060 () ListLongMap!20247)

(assert (=> b!1302027 (= lt!582389 call!64060)))

(declare-fun call!64064 () Unit!43103)

(assert (=> b!1302027 (= lt!582387 call!64064)))

(assert (=> b!1302027 call!64062))

(declare-fun b!1302028 () Bool)

(declare-fun res!864923 () Bool)

(assert (=> b!1302028 (=> (not res!864923) (not e!742642))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1302028 (= res!864923 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42420 _keys!1741))))))

(declare-fun b!1302029 () Bool)

(declare-fun res!864928 () Bool)

(assert (=> b!1302029 (=> (not res!864928) (not e!742642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302029 (= res!864928 (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!53883 () Bool)

(assert (=> mapIsEmpty!53883 mapRes!53883))

(declare-fun minValue!1387 () V!51595)

(declare-fun zeroValue!1387 () V!51595)

(declare-fun lt!582390 () ListLongMap!20247)

(declare-fun bm!64058 () Bool)

(declare-fun call!64065 () Unit!43103)

(declare-fun c!124890 () Bool)

(declare-fun lt!582385 () ListLongMap!20247)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!88 ((_ BitVec 64) (_ BitVec 64) V!51595 ListLongMap!20247) Unit!43103)

(assert (=> bm!64058 (= call!64065 (lemmaInListMapAfterAddingDiffThenInBefore!88 k0!1205 (ite c!124890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124889 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124890 minValue!1387 (ite c!124889 zeroValue!1387 minValue!1387)) (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))))))

(declare-fun b!1302030 () Bool)

(declare-fun res!864925 () Bool)

(assert (=> b!1302030 (=> (not res!864925) (not e!742642))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun contains!8267 (ListLongMap!20247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5164 (array!86750 array!86748 (_ BitVec 32) (_ BitVec 32) V!51595 V!51595 (_ BitVec 32) Int) ListLongMap!20247)

(assert (=> b!1302030 (= res!864925 (contains!8267 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302031 () Bool)

(declare-fun c!124891 () Bool)

(assert (=> b!1302031 (= c!124891 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582383))))

(assert (=> b!1302031 (= e!742637 e!742636)))

(declare-fun b!1302032 () Bool)

(declare-fun lt!582392 () Unit!43103)

(assert (=> b!1302032 (= e!742635 lt!582392)))

(declare-fun lt!582384 () ListLongMap!20247)

(declare-fun call!64063 () ListLongMap!20247)

(assert (=> b!1302032 (= lt!582384 call!64063)))

(declare-fun +!4466 (ListLongMap!20247 tuple2!22590) ListLongMap!20247)

(assert (=> b!1302032 (= lt!582390 (+!4466 lt!582384 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582386 () Unit!43103)

(assert (=> b!1302032 (= lt!582386 call!64065)))

(assert (=> b!1302032 call!64061))

(assert (=> b!1302032 (= lt!582392 (lemmaInListMapAfterAddingDiffThenInBefore!88 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582384))))

(assert (=> b!1302032 (contains!8267 lt!582384 k0!1205)))

(declare-fun b!1302033 () Bool)

(declare-fun res!864929 () Bool)

(assert (=> b!1302033 (=> (not res!864929) (not e!742642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86750 (_ BitVec 32)) Bool)

(assert (=> b!1302033 (= res!864929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302034 () Bool)

(declare-fun e!742639 () Bool)

(declare-fun e!742641 () Bool)

(assert (=> b!1302034 (= e!742639 (and e!742641 mapRes!53883))))

(declare-fun condMapEmpty!53883 () Bool)

(declare-fun mapDefault!53883 () ValueCell!16536)

(assert (=> b!1302034 (= condMapEmpty!53883 (= (arr!41869 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16536)) mapDefault!53883)))))

(declare-fun b!1302035 () Bool)

(declare-fun e!742634 () Bool)

(assert (=> b!1302035 (= e!742642 (not e!742634))))

(declare-fun res!864926 () Bool)

(assert (=> b!1302035 (=> res!864926 e!742634)))

(assert (=> b!1302035 (= res!864926 (not (= k0!1205 (select (arr!41870 _keys!1741) from!2144))))))

(assert (=> b!1302035 (not (contains!8267 (ListLongMap!20248 Nil!29716) k0!1205))))

(declare-fun lt!582391 () Unit!43103)

(declare-fun emptyContainsNothing!206 ((_ BitVec 64)) Unit!43103)

(assert (=> b!1302035 (= lt!582391 (emptyContainsNothing!206 k0!1205))))

(declare-fun lt!582393 () Unit!43103)

(assert (=> b!1302035 (= lt!582393 e!742635)))

(assert (=> b!1302035 (= c!124890 (and (not lt!582383) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1302035 (= lt!582383 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!64059 () Bool)

(assert (=> bm!64059 (= call!64064 call!64065)))

(declare-fun res!864924 () Bool)

(assert (=> start!109904 (=> (not res!864924) (not e!742642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109904 (= res!864924 (validMask!0 mask!2175))))

(assert (=> start!109904 e!742642))

(declare-fun tp_is_empty!34869 () Bool)

(assert (=> start!109904 tp_is_empty!34869))

(assert (=> start!109904 true))

(declare-fun array_inv!31673 (array!86748) Bool)

(assert (=> start!109904 (and (array_inv!31673 _values!1445) e!742639)))

(declare-fun array_inv!31674 (array!86750) Bool)

(assert (=> start!109904 (array_inv!31674 _keys!1741)))

(assert (=> start!109904 tp!102825))

(declare-fun b!1302036 () Bool)

(assert (=> b!1302036 (= e!742638 tp_is_empty!34869)))

(declare-fun bm!64060 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6098 (array!86750 array!86748 (_ BitVec 32) (_ BitVec 32) V!51595 V!51595 (_ BitVec 32) Int) ListLongMap!20247)

(assert (=> bm!64060 (= call!64063 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64061 () Bool)

(assert (=> bm!64061 (= call!64060 call!64063)))

(declare-fun b!1302037 () Bool)

(declare-fun arrayContainsKey!0 (array!86750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302037 (= e!742634 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(declare-fun bm!64062 () Bool)

(assert (=> bm!64062 (= call!64061 (contains!8267 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389)) k0!1205))))

(declare-fun b!1302038 () Bool)

(assert (=> b!1302038 call!64062))

(declare-fun lt!582388 () Unit!43103)

(assert (=> b!1302038 (= lt!582388 call!64064)))

(assert (=> b!1302038 (= lt!582385 call!64060)))

(assert (=> b!1302038 (= e!742637 lt!582388)))

(declare-fun b!1302039 () Bool)

(assert (=> b!1302039 (= e!742641 tp_is_empty!34869)))

(assert (= (and start!109904 res!864924) b!1302023))

(assert (= (and b!1302023 res!864931) b!1302033))

(assert (= (and b!1302033 res!864929) b!1302025))

(assert (= (and b!1302025 res!864927) b!1302026))

(assert (= (and b!1302026 res!864930) b!1302030))

(assert (= (and b!1302030 res!864925) b!1302028))

(assert (= (and b!1302028 res!864923) b!1302029))

(assert (= (and b!1302029 res!864928) b!1302035))

(assert (= (and b!1302035 c!124890) b!1302032))

(assert (= (and b!1302035 (not c!124890)) b!1302022))

(assert (= (and b!1302022 c!124889) b!1302038))

(assert (= (and b!1302022 (not c!124889)) b!1302031))

(assert (= (and b!1302031 c!124891) b!1302027))

(assert (= (and b!1302031 (not c!124891)) b!1302024))

(assert (= (or b!1302038 b!1302027) bm!64061))

(assert (= (or b!1302038 b!1302027) bm!64059))

(assert (= (or b!1302038 b!1302027) bm!64057))

(assert (= (or b!1302032 bm!64061) bm!64060))

(assert (= (or b!1302032 bm!64059) bm!64058))

(assert (= (or b!1302032 bm!64057) bm!64062))

(assert (= (and b!1302035 (not res!864926)) b!1302037))

(assert (= (and b!1302034 condMapEmpty!53883) mapIsEmpty!53883))

(assert (= (and b!1302034 (not condMapEmpty!53883)) mapNonEmpty!53883))

(get-info :version)

(assert (= (and mapNonEmpty!53883 ((_ is ValueCellFull!16536) mapValue!53883)) b!1302036))

(assert (= (and b!1302034 ((_ is ValueCellFull!16536) mapDefault!53883)) b!1302039))

(assert (= start!109904 b!1302034))

(declare-fun m!1192857 () Bool)

(assert (=> bm!64058 m!1192857))

(declare-fun m!1192859 () Bool)

(assert (=> bm!64060 m!1192859))

(declare-fun m!1192861 () Bool)

(assert (=> b!1302032 m!1192861))

(declare-fun m!1192863 () Bool)

(assert (=> b!1302032 m!1192863))

(declare-fun m!1192865 () Bool)

(assert (=> b!1302032 m!1192865))

(declare-fun m!1192867 () Bool)

(assert (=> mapNonEmpty!53883 m!1192867))

(declare-fun m!1192869 () Bool)

(assert (=> start!109904 m!1192869))

(declare-fun m!1192871 () Bool)

(assert (=> start!109904 m!1192871))

(declare-fun m!1192873 () Bool)

(assert (=> start!109904 m!1192873))

(declare-fun m!1192875 () Bool)

(assert (=> b!1302025 m!1192875))

(declare-fun m!1192877 () Bool)

(assert (=> b!1302037 m!1192877))

(declare-fun m!1192879 () Bool)

(assert (=> bm!64062 m!1192879))

(declare-fun m!1192881 () Bool)

(assert (=> b!1302035 m!1192881))

(declare-fun m!1192883 () Bool)

(assert (=> b!1302035 m!1192883))

(declare-fun m!1192885 () Bool)

(assert (=> b!1302035 m!1192885))

(declare-fun m!1192887 () Bool)

(assert (=> b!1302033 m!1192887))

(assert (=> b!1302029 m!1192881))

(assert (=> b!1302029 m!1192881))

(declare-fun m!1192889 () Bool)

(assert (=> b!1302029 m!1192889))

(declare-fun m!1192891 () Bool)

(assert (=> b!1302030 m!1192891))

(assert (=> b!1302030 m!1192891))

(declare-fun m!1192893 () Bool)

(assert (=> b!1302030 m!1192893))

(check-sat (not b!1302030) tp_is_empty!34869 (not b!1302025) (not start!109904) (not b!1302037) (not b!1302035) (not bm!64058) (not bm!64062) (not b_next!29229) b_and!47365 (not b!1302032) (not bm!64060) (not mapNonEmpty!53883) (not b!1302029) (not b!1302033))
(check-sat b_and!47365 (not b_next!29229))
(get-model)

(declare-fun d!141401 () Bool)

(assert (=> d!141401 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109904 d!141401))

(declare-fun d!141403 () Bool)

(assert (=> d!141403 (= (array_inv!31673 _values!1445) (bvsge (size!42419 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109904 d!141403))

(declare-fun d!141405 () Bool)

(assert (=> d!141405 (= (array_inv!31674 _keys!1741) (bvsge (size!42420 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109904 d!141405))

(declare-fun d!141407 () Bool)

(declare-fun e!742672 () Bool)

(assert (=> d!141407 e!742672))

(declare-fun res!864963 () Bool)

(assert (=> d!141407 (=> (not res!864963) (not e!742672))))

(declare-fun lt!582436 () ListLongMap!20247)

(assert (=> d!141407 (= res!864963 (contains!8267 lt!582436 (_1!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582438 () List!29719)

(assert (=> d!141407 (= lt!582436 (ListLongMap!20248 lt!582438))))

(declare-fun lt!582435 () Unit!43103)

(declare-fun lt!582437 () Unit!43103)

(assert (=> d!141407 (= lt!582435 lt!582437)))

(declare-datatypes ((Option!753 0))(
  ( (Some!752 (v!20122 V!51595)) (None!751) )
))
(declare-fun getValueByKey!701 (List!29719 (_ BitVec 64)) Option!753)

(assert (=> d!141407 (= (getValueByKey!701 lt!582438 (_1!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!752 (_2!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!347 (List!29719 (_ BitVec 64) V!51595) Unit!43103)

(assert (=> d!141407 (= lt!582437 (lemmaContainsTupThenGetReturnValue!347 lt!582438 (_1!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!476 (List!29719 (_ BitVec 64) V!51595) List!29719)

(assert (=> d!141407 (= lt!582438 (insertStrictlySorted!476 (toList!10139 lt!582384) (_1!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141407 (= (+!4466 lt!582384 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582436)))

(declare-fun b!1302098 () Bool)

(declare-fun res!864964 () Bool)

(assert (=> b!1302098 (=> (not res!864964) (not e!742672))))

(assert (=> b!1302098 (= res!864964 (= (getValueByKey!701 (toList!10139 lt!582436) (_1!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!752 (_2!11306 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302099 () Bool)

(declare-fun contains!8268 (List!29719 tuple2!22590) Bool)

(assert (=> b!1302099 (= e!742672 (contains!8268 (toList!10139 lt!582436) (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141407 res!864963) b!1302098))

(assert (= (and b!1302098 res!864964) b!1302099))

(declare-fun m!1192933 () Bool)

(assert (=> d!141407 m!1192933))

(declare-fun m!1192935 () Bool)

(assert (=> d!141407 m!1192935))

(declare-fun m!1192937 () Bool)

(assert (=> d!141407 m!1192937))

(declare-fun m!1192939 () Bool)

(assert (=> d!141407 m!1192939))

(declare-fun m!1192941 () Bool)

(assert (=> b!1302098 m!1192941))

(declare-fun m!1192943 () Bool)

(assert (=> b!1302099 m!1192943))

(assert (=> b!1302032 d!141407))

(declare-fun d!141409 () Bool)

(assert (=> d!141409 (contains!8267 lt!582384 k0!1205)))

(declare-fun lt!582441 () Unit!43103)

(declare-fun choose!1910 ((_ BitVec 64) (_ BitVec 64) V!51595 ListLongMap!20247) Unit!43103)

(assert (=> d!141409 (= lt!582441 (choose!1910 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582384))))

(assert (=> d!141409 (contains!8267 (+!4466 lt!582384 (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141409 (= (lemmaInListMapAfterAddingDiffThenInBefore!88 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!582384) lt!582441)))

(declare-fun bs!37080 () Bool)

(assert (= bs!37080 d!141409))

(assert (=> bs!37080 m!1192865))

(declare-fun m!1192945 () Bool)

(assert (=> bs!37080 m!1192945))

(assert (=> bs!37080 m!1192861))

(assert (=> bs!37080 m!1192861))

(declare-fun m!1192947 () Bool)

(assert (=> bs!37080 m!1192947))

(assert (=> b!1302032 d!141409))

(declare-fun d!141411 () Bool)

(declare-fun e!742678 () Bool)

(assert (=> d!141411 e!742678))

(declare-fun res!864967 () Bool)

(assert (=> d!141411 (=> res!864967 e!742678)))

(declare-fun lt!582450 () Bool)

(assert (=> d!141411 (= res!864967 (not lt!582450))))

(declare-fun lt!582452 () Bool)

(assert (=> d!141411 (= lt!582450 lt!582452)))

(declare-fun lt!582451 () Unit!43103)

(declare-fun e!742677 () Unit!43103)

(assert (=> d!141411 (= lt!582451 e!742677)))

(declare-fun c!124903 () Bool)

(assert (=> d!141411 (= c!124903 lt!582452)))

(declare-fun containsKey!723 (List!29719 (_ BitVec 64)) Bool)

(assert (=> d!141411 (= lt!582452 (containsKey!723 (toList!10139 lt!582384) k0!1205))))

(assert (=> d!141411 (= (contains!8267 lt!582384 k0!1205) lt!582450)))

(declare-fun b!1302106 () Bool)

(declare-fun lt!582453 () Unit!43103)

(assert (=> b!1302106 (= e!742677 lt!582453)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!469 (List!29719 (_ BitVec 64)) Unit!43103)

(assert (=> b!1302106 (= lt!582453 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10139 lt!582384) k0!1205))))

(declare-fun isDefined!508 (Option!753) Bool)

(assert (=> b!1302106 (isDefined!508 (getValueByKey!701 (toList!10139 lt!582384) k0!1205))))

(declare-fun b!1302107 () Bool)

(declare-fun Unit!43106 () Unit!43103)

(assert (=> b!1302107 (= e!742677 Unit!43106)))

(declare-fun b!1302108 () Bool)

(assert (=> b!1302108 (= e!742678 (isDefined!508 (getValueByKey!701 (toList!10139 lt!582384) k0!1205)))))

(assert (= (and d!141411 c!124903) b!1302106))

(assert (= (and d!141411 (not c!124903)) b!1302107))

(assert (= (and d!141411 (not res!864967)) b!1302108))

(declare-fun m!1192949 () Bool)

(assert (=> d!141411 m!1192949))

(declare-fun m!1192951 () Bool)

(assert (=> b!1302106 m!1192951))

(declare-fun m!1192953 () Bool)

(assert (=> b!1302106 m!1192953))

(assert (=> b!1302106 m!1192953))

(declare-fun m!1192955 () Bool)

(assert (=> b!1302106 m!1192955))

(assert (=> b!1302108 m!1192953))

(assert (=> b!1302108 m!1192953))

(assert (=> b!1302108 m!1192955))

(assert (=> b!1302032 d!141411))

(declare-fun b!1302119 () Bool)

(declare-fun e!742688 () Bool)

(declare-fun e!742690 () Bool)

(assert (=> b!1302119 (= e!742688 e!742690)))

(declare-fun res!864974 () Bool)

(assert (=> b!1302119 (=> (not res!864974) (not e!742690))))

(declare-fun e!742689 () Bool)

(assert (=> b!1302119 (= res!864974 (not e!742689))))

(declare-fun res!864975 () Bool)

(assert (=> b!1302119 (=> (not res!864975) (not e!742689))))

(assert (=> b!1302119 (= res!864975 (validKeyInArray!0 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141413 () Bool)

(declare-fun res!864976 () Bool)

(assert (=> d!141413 (=> res!864976 e!742688)))

(assert (=> d!141413 (= res!864976 (bvsge #b00000000000000000000000000000000 (size!42420 _keys!1741)))))

(assert (=> d!141413 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29715) e!742688)))

(declare-fun b!1302120 () Bool)

(declare-fun contains!8269 (List!29718 (_ BitVec 64)) Bool)

(assert (=> b!1302120 (= e!742689 (contains!8269 Nil!29715 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302121 () Bool)

(declare-fun e!742687 () Bool)

(declare-fun call!64086 () Bool)

(assert (=> b!1302121 (= e!742687 call!64086)))

(declare-fun b!1302122 () Bool)

(assert (=> b!1302122 (= e!742687 call!64086)))

(declare-fun bm!64083 () Bool)

(declare-fun c!124906 () Bool)

(assert (=> bm!64083 (= call!64086 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124906 (Cons!29714 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000) Nil!29715) Nil!29715)))))

(declare-fun b!1302123 () Bool)

(assert (=> b!1302123 (= e!742690 e!742687)))

(assert (=> b!1302123 (= c!124906 (validKeyInArray!0 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141413 (not res!864976)) b!1302119))

(assert (= (and b!1302119 res!864975) b!1302120))

(assert (= (and b!1302119 res!864974) b!1302123))

(assert (= (and b!1302123 c!124906) b!1302122))

(assert (= (and b!1302123 (not c!124906)) b!1302121))

(assert (= (or b!1302122 b!1302121) bm!64083))

(declare-fun m!1192957 () Bool)

(assert (=> b!1302119 m!1192957))

(assert (=> b!1302119 m!1192957))

(declare-fun m!1192959 () Bool)

(assert (=> b!1302119 m!1192959))

(assert (=> b!1302120 m!1192957))

(assert (=> b!1302120 m!1192957))

(declare-fun m!1192961 () Bool)

(assert (=> b!1302120 m!1192961))

(assert (=> bm!64083 m!1192957))

(declare-fun m!1192963 () Bool)

(assert (=> bm!64083 m!1192963))

(assert (=> b!1302123 m!1192957))

(assert (=> b!1302123 m!1192957))

(assert (=> b!1302123 m!1192959))

(assert (=> b!1302025 d!141413))

(declare-fun b!1302148 () Bool)

(declare-fun e!742705 () Bool)

(declare-fun e!742706 () Bool)

(assert (=> b!1302148 (= e!742705 e!742706)))

(declare-fun c!124916 () Bool)

(assert (=> b!1302148 (= c!124916 (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun b!1302149 () Bool)

(declare-fun e!742708 () ListLongMap!20247)

(assert (=> b!1302149 (= e!742708 (ListLongMap!20248 Nil!29716))))

(declare-fun b!1302150 () Bool)

(declare-fun lt!582472 () ListLongMap!20247)

(declare-fun isEmpty!1056 (ListLongMap!20247) Bool)

(assert (=> b!1302150 (= e!742706 (isEmpty!1056 lt!582472))))

(declare-fun b!1302151 () Bool)

(declare-fun e!742710 () ListLongMap!20247)

(assert (=> b!1302151 (= e!742708 e!742710)))

(declare-fun c!124915 () Bool)

(assert (=> b!1302151 (= c!124915 (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)))))

(declare-fun b!1302153 () Bool)

(declare-fun e!742709 () Bool)

(assert (=> b!1302153 (= e!742709 e!742705)))

(declare-fun c!124918 () Bool)

(declare-fun e!742711 () Bool)

(assert (=> b!1302153 (= c!124918 e!742711)))

(declare-fun res!864987 () Bool)

(assert (=> b!1302153 (=> (not res!864987) (not e!742711))))

(assert (=> b!1302153 (= res!864987 (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun b!1302154 () Bool)

(declare-fun res!864988 () Bool)

(assert (=> b!1302154 (=> (not res!864988) (not e!742709))))

(assert (=> b!1302154 (= res!864988 (not (contains!8267 lt!582472 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302155 () Bool)

(assert (=> b!1302155 (= e!742706 (= lt!582472 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1302156 () Bool)

(declare-fun lt!582473 () Unit!43103)

(declare-fun lt!582469 () Unit!43103)

(assert (=> b!1302156 (= lt!582473 lt!582469)))

(declare-fun lt!582471 () (_ BitVec 64))

(declare-fun lt!582470 () V!51595)

(declare-fun lt!582468 () ListLongMap!20247)

(declare-fun lt!582474 () (_ BitVec 64))

(assert (=> b!1302156 (not (contains!8267 (+!4466 lt!582468 (tuple2!22591 lt!582474 lt!582470)) lt!582471))))

(declare-fun addStillNotContains!463 (ListLongMap!20247 (_ BitVec 64) V!51595 (_ BitVec 64)) Unit!43103)

(assert (=> b!1302156 (= lt!582469 (addStillNotContains!463 lt!582468 lt!582474 lt!582470 lt!582471))))

(assert (=> b!1302156 (= lt!582471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21145 (ValueCell!16536 V!51595) V!51595)

(declare-fun dynLambda!3425 (Int (_ BitVec 64)) V!51595)

(assert (=> b!1302156 (= lt!582470 (get!21145 (select (arr!41869 _values!1445) from!2144) (dynLambda!3425 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302156 (= lt!582474 (select (arr!41870 _keys!1741) from!2144))))

(declare-fun call!64089 () ListLongMap!20247)

(assert (=> b!1302156 (= lt!582468 call!64089)))

(assert (=> b!1302156 (= e!742710 (+!4466 call!64089 (tuple2!22591 (select (arr!41870 _keys!1741) from!2144) (get!21145 (select (arr!41869 _values!1445) from!2144) (dynLambda!3425 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302157 () Bool)

(assert (=> b!1302157 (= e!742711 (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)))))

(assert (=> b!1302157 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun bm!64086 () Bool)

(assert (=> bm!64086 (= call!64089 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302158 () Bool)

(assert (=> b!1302158 (= e!742710 call!64089)))

(declare-fun b!1302159 () Bool)

(assert (=> b!1302159 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741)))))

(assert (=> b!1302159 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42419 _values!1445)))))

(declare-fun e!742707 () Bool)

(declare-fun apply!1018 (ListLongMap!20247 (_ BitVec 64)) V!51595)

(assert (=> b!1302159 (= e!742707 (= (apply!1018 lt!582472 (select (arr!41870 _keys!1741) from!2144)) (get!21145 (select (arr!41869 _values!1445) from!2144) (dynLambda!3425 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141415 () Bool)

(assert (=> d!141415 e!742709))

(declare-fun res!864986 () Bool)

(assert (=> d!141415 (=> (not res!864986) (not e!742709))))

(assert (=> d!141415 (= res!864986 (not (contains!8267 lt!582472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141415 (= lt!582472 e!742708)))

(declare-fun c!124917 () Bool)

(assert (=> d!141415 (= c!124917 (bvsge from!2144 (size!42420 _keys!1741)))))

(assert (=> d!141415 (validMask!0 mask!2175)))

(assert (=> d!141415 (= (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582472)))

(declare-fun b!1302152 () Bool)

(assert (=> b!1302152 (= e!742705 e!742707)))

(assert (=> b!1302152 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun res!864985 () Bool)

(assert (=> b!1302152 (= res!864985 (contains!8267 lt!582472 (select (arr!41870 _keys!1741) from!2144)))))

(assert (=> b!1302152 (=> (not res!864985) (not e!742707))))

(assert (= (and d!141415 c!124917) b!1302149))

(assert (= (and d!141415 (not c!124917)) b!1302151))

(assert (= (and b!1302151 c!124915) b!1302156))

(assert (= (and b!1302151 (not c!124915)) b!1302158))

(assert (= (or b!1302156 b!1302158) bm!64086))

(assert (= (and d!141415 res!864986) b!1302154))

(assert (= (and b!1302154 res!864988) b!1302153))

(assert (= (and b!1302153 res!864987) b!1302157))

(assert (= (and b!1302153 c!124918) b!1302152))

(assert (= (and b!1302153 (not c!124918)) b!1302148))

(assert (= (and b!1302152 res!864985) b!1302159))

(assert (= (and b!1302148 c!124916) b!1302155))

(assert (= (and b!1302148 (not c!124916)) b!1302150))

(declare-fun b_lambda!23219 () Bool)

(assert (=> (not b_lambda!23219) (not b!1302156)))

(declare-fun t!43307 () Bool)

(declare-fun tb!11391 () Bool)

(assert (=> (and start!109904 (= defaultEntry!1448 defaultEntry!1448) t!43307) tb!11391))

(declare-fun result!23795 () Bool)

(assert (=> tb!11391 (= result!23795 tp_is_empty!34869)))

(assert (=> b!1302156 t!43307))

(declare-fun b_and!47369 () Bool)

(assert (= b_and!47365 (and (=> t!43307 result!23795) b_and!47369)))

(declare-fun b_lambda!23221 () Bool)

(assert (=> (not b_lambda!23221) (not b!1302159)))

(assert (=> b!1302159 t!43307))

(declare-fun b_and!47371 () Bool)

(assert (= b_and!47369 (and (=> t!43307 result!23795) b_and!47371)))

(declare-fun m!1192965 () Bool)

(assert (=> b!1302150 m!1192965))

(declare-fun m!1192967 () Bool)

(assert (=> b!1302159 m!1192967))

(assert (=> b!1302159 m!1192881))

(declare-fun m!1192969 () Bool)

(assert (=> b!1302159 m!1192969))

(declare-fun m!1192971 () Bool)

(assert (=> b!1302159 m!1192971))

(assert (=> b!1302159 m!1192971))

(assert (=> b!1302159 m!1192967))

(declare-fun m!1192973 () Bool)

(assert (=> b!1302159 m!1192973))

(assert (=> b!1302159 m!1192881))

(assert (=> b!1302151 m!1192881))

(assert (=> b!1302151 m!1192881))

(assert (=> b!1302151 m!1192889))

(declare-fun m!1192975 () Bool)

(assert (=> bm!64086 m!1192975))

(declare-fun m!1192977 () Bool)

(assert (=> b!1302154 m!1192977))

(assert (=> b!1302155 m!1192975))

(assert (=> b!1302156 m!1192967))

(declare-fun m!1192979 () Bool)

(assert (=> b!1302156 m!1192979))

(declare-fun m!1192981 () Bool)

(assert (=> b!1302156 m!1192981))

(declare-fun m!1192983 () Bool)

(assert (=> b!1302156 m!1192983))

(assert (=> b!1302156 m!1192979))

(assert (=> b!1302156 m!1192971))

(assert (=> b!1302156 m!1192971))

(assert (=> b!1302156 m!1192967))

(assert (=> b!1302156 m!1192973))

(declare-fun m!1192985 () Bool)

(assert (=> b!1302156 m!1192985))

(assert (=> b!1302156 m!1192881))

(declare-fun m!1192987 () Bool)

(assert (=> d!141415 m!1192987))

(assert (=> d!141415 m!1192869))

(assert (=> b!1302152 m!1192881))

(assert (=> b!1302152 m!1192881))

(declare-fun m!1192989 () Bool)

(assert (=> b!1302152 m!1192989))

(assert (=> b!1302157 m!1192881))

(assert (=> b!1302157 m!1192881))

(assert (=> b!1302157 m!1192889))

(assert (=> bm!64060 d!141415))

(declare-fun d!141417 () Bool)

(assert (=> d!141417 (= (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)) (and (not (= (select (arr!41870 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41870 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302029 d!141417))

(declare-fun d!141419 () Bool)

(declare-fun res!864993 () Bool)

(declare-fun e!742719 () Bool)

(assert (=> d!141419 (=> res!864993 e!742719)))

(assert (=> d!141419 (= res!864993 (bvsge #b00000000000000000000000000000000 (size!42420 _keys!1741)))))

(assert (=> d!141419 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742719)))

(declare-fun b!1302170 () Bool)

(declare-fun e!742718 () Bool)

(declare-fun call!64092 () Bool)

(assert (=> b!1302170 (= e!742718 call!64092)))

(declare-fun b!1302171 () Bool)

(assert (=> b!1302171 (= e!742719 e!742718)))

(declare-fun c!124921 () Bool)

(assert (=> b!1302171 (= c!124921 (validKeyInArray!0 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302172 () Bool)

(declare-fun e!742720 () Bool)

(assert (=> b!1302172 (= e!742718 e!742720)))

(declare-fun lt!582481 () (_ BitVec 64))

(assert (=> b!1302172 (= lt!582481 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582483 () Unit!43103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86750 (_ BitVec 64) (_ BitVec 32)) Unit!43103)

(assert (=> b!1302172 (= lt!582483 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582481 #b00000000000000000000000000000000))))

(assert (=> b!1302172 (arrayContainsKey!0 _keys!1741 lt!582481 #b00000000000000000000000000000000)))

(declare-fun lt!582482 () Unit!43103)

(assert (=> b!1302172 (= lt!582482 lt!582483)))

(declare-fun res!864994 () Bool)

(declare-datatypes ((SeekEntryResult!10021 0))(
  ( (MissingZero!10021 (index!42455 (_ BitVec 32))) (Found!10021 (index!42456 (_ BitVec 32))) (Intermediate!10021 (undefined!10833 Bool) (index!42457 (_ BitVec 32)) (x!115651 (_ BitVec 32))) (Undefined!10021) (MissingVacant!10021 (index!42458 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86750 (_ BitVec 32)) SeekEntryResult!10021)

(assert (=> b!1302172 (= res!864994 (= (seekEntryOrOpen!0 (select (arr!41870 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10021 #b00000000000000000000000000000000)))))

(assert (=> b!1302172 (=> (not res!864994) (not e!742720))))

(declare-fun bm!64089 () Bool)

(assert (=> bm!64089 (= call!64092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1302173 () Bool)

(assert (=> b!1302173 (= e!742720 call!64092)))

(assert (= (and d!141419 (not res!864993)) b!1302171))

(assert (= (and b!1302171 c!124921) b!1302172))

(assert (= (and b!1302171 (not c!124921)) b!1302170))

(assert (= (and b!1302172 res!864994) b!1302173))

(assert (= (or b!1302173 b!1302170) bm!64089))

(assert (=> b!1302171 m!1192957))

(assert (=> b!1302171 m!1192957))

(assert (=> b!1302171 m!1192959))

(assert (=> b!1302172 m!1192957))

(declare-fun m!1192991 () Bool)

(assert (=> b!1302172 m!1192991))

(declare-fun m!1192993 () Bool)

(assert (=> b!1302172 m!1192993))

(assert (=> b!1302172 m!1192957))

(declare-fun m!1192995 () Bool)

(assert (=> b!1302172 m!1192995))

(declare-fun m!1192997 () Bool)

(assert (=> bm!64089 m!1192997))

(assert (=> b!1302033 d!141419))

(declare-fun d!141421 () Bool)

(declare-fun res!864999 () Bool)

(declare-fun e!742725 () Bool)

(assert (=> d!141421 (=> res!864999 e!742725)))

(assert (=> d!141421 (= res!864999 (= (select (arr!41870 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141421 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!742725)))

(declare-fun b!1302178 () Bool)

(declare-fun e!742726 () Bool)

(assert (=> b!1302178 (= e!742725 e!742726)))

(declare-fun res!865000 () Bool)

(assert (=> b!1302178 (=> (not res!865000) (not e!742726))))

(assert (=> b!1302178 (= res!865000 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42420 _keys!1741)))))

(declare-fun b!1302179 () Bool)

(assert (=> b!1302179 (= e!742726 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141421 (not res!864999)) b!1302178))

(assert (= (and b!1302178 res!865000) b!1302179))

(assert (=> d!141421 m!1192881))

(declare-fun m!1192999 () Bool)

(assert (=> b!1302179 m!1192999))

(assert (=> b!1302037 d!141421))

(declare-fun d!141423 () Bool)

(assert (=> d!141423 (contains!8267 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389)) k0!1205)))

(declare-fun lt!582484 () Unit!43103)

(assert (=> d!141423 (= lt!582484 (choose!1910 k0!1205 (ite c!124890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124889 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124890 minValue!1387 (ite c!124889 zeroValue!1387 minValue!1387)) (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))))))

(assert (=> d!141423 (contains!8267 (+!4466 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389)) (tuple2!22591 (ite c!124890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124889 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124890 minValue!1387 (ite c!124889 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!141423 (= (lemmaInListMapAfterAddingDiffThenInBefore!88 k0!1205 (ite c!124890 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124889 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124890 minValue!1387 (ite c!124889 zeroValue!1387 minValue!1387)) (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))) lt!582484)))

(declare-fun bs!37081 () Bool)

(assert (= bs!37081 d!141423))

(assert (=> bs!37081 m!1192879))

(declare-fun m!1193001 () Bool)

(assert (=> bs!37081 m!1193001))

(declare-fun m!1193003 () Bool)

(assert (=> bs!37081 m!1193003))

(assert (=> bs!37081 m!1193003))

(declare-fun m!1193005 () Bool)

(assert (=> bs!37081 m!1193005))

(assert (=> bm!64058 d!141423))

(declare-fun d!141425 () Bool)

(declare-fun e!742728 () Bool)

(assert (=> d!141425 e!742728))

(declare-fun res!865001 () Bool)

(assert (=> d!141425 (=> res!865001 e!742728)))

(declare-fun lt!582485 () Bool)

(assert (=> d!141425 (= res!865001 (not lt!582485))))

(declare-fun lt!582487 () Bool)

(assert (=> d!141425 (= lt!582485 lt!582487)))

(declare-fun lt!582486 () Unit!43103)

(declare-fun e!742727 () Unit!43103)

(assert (=> d!141425 (= lt!582486 e!742727)))

(declare-fun c!124922 () Bool)

(assert (=> d!141425 (= c!124922 lt!582487)))

(assert (=> d!141425 (= lt!582487 (containsKey!723 (toList!10139 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141425 (= (contains!8267 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582485)))

(declare-fun b!1302180 () Bool)

(declare-fun lt!582488 () Unit!43103)

(assert (=> b!1302180 (= e!742727 lt!582488)))

(assert (=> b!1302180 (= lt!582488 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10139 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302180 (isDefined!508 (getValueByKey!701 (toList!10139 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302181 () Bool)

(declare-fun Unit!43107 () Unit!43103)

(assert (=> b!1302181 (= e!742727 Unit!43107)))

(declare-fun b!1302182 () Bool)

(assert (=> b!1302182 (= e!742728 (isDefined!508 (getValueByKey!701 (toList!10139 (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141425 c!124922) b!1302180))

(assert (= (and d!141425 (not c!124922)) b!1302181))

(assert (= (and d!141425 (not res!865001)) b!1302182))

(declare-fun m!1193007 () Bool)

(assert (=> d!141425 m!1193007))

(declare-fun m!1193009 () Bool)

(assert (=> b!1302180 m!1193009))

(declare-fun m!1193011 () Bool)

(assert (=> b!1302180 m!1193011))

(assert (=> b!1302180 m!1193011))

(declare-fun m!1193013 () Bool)

(assert (=> b!1302180 m!1193013))

(assert (=> b!1302182 m!1193011))

(assert (=> b!1302182 m!1193011))

(assert (=> b!1302182 m!1193013))

(assert (=> b!1302030 d!141425))

(declare-fun b!1302225 () Bool)

(declare-fun e!742767 () Bool)

(assert (=> b!1302225 (= e!742767 (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)))))

(declare-fun bm!64104 () Bool)

(declare-fun call!64108 () ListLongMap!20247)

(declare-fun call!64107 () ListLongMap!20247)

(assert (=> bm!64104 (= call!64108 call!64107)))

(declare-fun bm!64105 () Bool)

(assert (=> bm!64105 (= call!64107 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302226 () Bool)

(declare-fun e!742762 () ListLongMap!20247)

(declare-fun call!64110 () ListLongMap!20247)

(assert (=> b!1302226 (= e!742762 call!64110)))

(declare-fun b!1302227 () Bool)

(declare-fun call!64111 () ListLongMap!20247)

(assert (=> b!1302227 (= e!742762 call!64111)))

(declare-fun b!1302228 () Bool)

(declare-fun e!742763 () ListLongMap!20247)

(declare-fun e!742766 () ListLongMap!20247)

(assert (=> b!1302228 (= e!742763 e!742766)))

(declare-fun c!124940 () Bool)

(assert (=> b!1302228 (= c!124940 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302229 () Bool)

(declare-fun call!64112 () ListLongMap!20247)

(assert (=> b!1302229 (= e!742763 (+!4466 call!64112 (tuple2!22591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1302230 () Bool)

(declare-fun e!742759 () Bool)

(declare-fun e!742764 () Bool)

(assert (=> b!1302230 (= e!742759 e!742764)))

(declare-fun res!865027 () Bool)

(declare-fun call!64113 () Bool)

(assert (=> b!1302230 (= res!865027 call!64113)))

(assert (=> b!1302230 (=> (not res!865027) (not e!742764))))

(declare-fun b!1302231 () Bool)

(declare-fun e!742758 () Bool)

(assert (=> b!1302231 (= e!742758 e!742759)))

(declare-fun c!124935 () Bool)

(assert (=> b!1302231 (= c!124935 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64106 () Bool)

(declare-fun c!124939 () Bool)

(assert (=> bm!64106 (= call!64112 (+!4466 (ite c!124939 call!64107 (ite c!124940 call!64108 call!64111)) (ite (or c!124939 c!124940) (tuple2!22591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64107 () Bool)

(assert (=> bm!64107 (= call!64110 call!64112)))

(declare-fun b!1302232 () Bool)

(declare-fun e!742765 () Bool)

(declare-fun lt!582534 () ListLongMap!20247)

(assert (=> b!1302232 (= e!742765 (= (apply!1018 lt!582534 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1302233 () Bool)

(declare-fun e!742761 () Bool)

(declare-fun e!742756 () Bool)

(assert (=> b!1302233 (= e!742761 e!742756)))

(declare-fun res!865022 () Bool)

(assert (=> b!1302233 (=> (not res!865022) (not e!742756))))

(assert (=> b!1302233 (= res!865022 (contains!8267 lt!582534 (select (arr!41870 _keys!1741) from!2144)))))

(assert (=> b!1302233 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun b!1302234 () Bool)

(declare-fun res!865021 () Bool)

(assert (=> b!1302234 (=> (not res!865021) (not e!742758))))

(assert (=> b!1302234 (= res!865021 e!742761)))

(declare-fun res!865024 () Bool)

(assert (=> b!1302234 (=> res!865024 e!742761)))

(assert (=> b!1302234 (= res!865024 (not e!742767))))

(declare-fun res!865028 () Bool)

(assert (=> b!1302234 (=> (not res!865028) (not e!742767))))

(assert (=> b!1302234 (= res!865028 (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun b!1302235 () Bool)

(declare-fun e!742755 () Bool)

(assert (=> b!1302235 (= e!742755 e!742765)))

(declare-fun res!865023 () Bool)

(declare-fun call!64109 () Bool)

(assert (=> b!1302235 (= res!865023 call!64109)))

(assert (=> b!1302235 (=> (not res!865023) (not e!742765))))

(declare-fun b!1302236 () Bool)

(declare-fun e!742757 () Bool)

(assert (=> b!1302236 (= e!742757 (validKeyInArray!0 (select (arr!41870 _keys!1741) from!2144)))))

(declare-fun bm!64108 () Bool)

(assert (=> bm!64108 (= call!64113 (contains!8267 lt!582534 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302237 () Bool)

(assert (=> b!1302237 (= e!742756 (= (apply!1018 lt!582534 (select (arr!41870 _keys!1741) from!2144)) (get!21145 (select (arr!41869 _values!1445) from!2144) (dynLambda!3425 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302237 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42419 _values!1445)))))

(assert (=> b!1302237 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741)))))

(declare-fun b!1302238 () Bool)

(assert (=> b!1302238 (= e!742764 (= (apply!1018 lt!582534 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64109 () Bool)

(assert (=> bm!64109 (= call!64111 call!64108)))

(declare-fun bm!64110 () Bool)

(assert (=> bm!64110 (= call!64109 (contains!8267 lt!582534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302239 () Bool)

(declare-fun e!742760 () Unit!43103)

(declare-fun lt!582537 () Unit!43103)

(assert (=> b!1302239 (= e!742760 lt!582537)))

(declare-fun lt!582543 () ListLongMap!20247)

(assert (=> b!1302239 (= lt!582543 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582536 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582544 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582544 (select (arr!41870 _keys!1741) from!2144))))

(declare-fun lt!582545 () Unit!43103)

(declare-fun addStillContains!1106 (ListLongMap!20247 (_ BitVec 64) V!51595 (_ BitVec 64)) Unit!43103)

(assert (=> b!1302239 (= lt!582545 (addStillContains!1106 lt!582543 lt!582536 zeroValue!1387 lt!582544))))

(assert (=> b!1302239 (contains!8267 (+!4466 lt!582543 (tuple2!22591 lt!582536 zeroValue!1387)) lt!582544)))

(declare-fun lt!582553 () Unit!43103)

(assert (=> b!1302239 (= lt!582553 lt!582545)))

(declare-fun lt!582541 () ListLongMap!20247)

(assert (=> b!1302239 (= lt!582541 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582550 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582533 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582533 (select (arr!41870 _keys!1741) from!2144))))

(declare-fun lt!582548 () Unit!43103)

(declare-fun addApplyDifferent!560 (ListLongMap!20247 (_ BitVec 64) V!51595 (_ BitVec 64)) Unit!43103)

(assert (=> b!1302239 (= lt!582548 (addApplyDifferent!560 lt!582541 lt!582550 minValue!1387 lt!582533))))

(assert (=> b!1302239 (= (apply!1018 (+!4466 lt!582541 (tuple2!22591 lt!582550 minValue!1387)) lt!582533) (apply!1018 lt!582541 lt!582533))))

(declare-fun lt!582546 () Unit!43103)

(assert (=> b!1302239 (= lt!582546 lt!582548)))

(declare-fun lt!582552 () ListLongMap!20247)

(assert (=> b!1302239 (= lt!582552 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582549 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582549 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582547 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582547 (select (arr!41870 _keys!1741) from!2144))))

(declare-fun lt!582539 () Unit!43103)

(assert (=> b!1302239 (= lt!582539 (addApplyDifferent!560 lt!582552 lt!582549 zeroValue!1387 lt!582547))))

(assert (=> b!1302239 (= (apply!1018 (+!4466 lt!582552 (tuple2!22591 lt!582549 zeroValue!1387)) lt!582547) (apply!1018 lt!582552 lt!582547))))

(declare-fun lt!582538 () Unit!43103)

(assert (=> b!1302239 (= lt!582538 lt!582539)))

(declare-fun lt!582551 () ListLongMap!20247)

(assert (=> b!1302239 (= lt!582551 (getCurrentListMapNoExtraKeys!6098 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582540 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582540 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582535 () (_ BitVec 64))

(assert (=> b!1302239 (= lt!582535 (select (arr!41870 _keys!1741) from!2144))))

(assert (=> b!1302239 (= lt!582537 (addApplyDifferent!560 lt!582551 lt!582540 minValue!1387 lt!582535))))

(assert (=> b!1302239 (= (apply!1018 (+!4466 lt!582551 (tuple2!22591 lt!582540 minValue!1387)) lt!582535) (apply!1018 lt!582551 lt!582535))))

(declare-fun b!1302240 () Bool)

(assert (=> b!1302240 (= e!742766 call!64110)))

(declare-fun b!1302241 () Bool)

(declare-fun Unit!43108 () Unit!43103)

(assert (=> b!1302241 (= e!742760 Unit!43108)))

(declare-fun d!141427 () Bool)

(assert (=> d!141427 e!742758))

(declare-fun res!865020 () Bool)

(assert (=> d!141427 (=> (not res!865020) (not e!742758))))

(assert (=> d!141427 (= res!865020 (or (bvsge from!2144 (size!42420 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42420 _keys!1741)))))))

(declare-fun lt!582542 () ListLongMap!20247)

(assert (=> d!141427 (= lt!582534 lt!582542)))

(declare-fun lt!582554 () Unit!43103)

(assert (=> d!141427 (= lt!582554 e!742760)))

(declare-fun c!124938 () Bool)

(assert (=> d!141427 (= c!124938 e!742757)))

(declare-fun res!865025 () Bool)

(assert (=> d!141427 (=> (not res!865025) (not e!742757))))

(assert (=> d!141427 (= res!865025 (bvslt from!2144 (size!42420 _keys!1741)))))

(assert (=> d!141427 (= lt!582542 e!742763)))

(assert (=> d!141427 (= c!124939 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141427 (validMask!0 mask!2175)))

(assert (=> d!141427 (= (getCurrentListMap!5164 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582534)))

(declare-fun b!1302242 () Bool)

(assert (=> b!1302242 (= e!742755 (not call!64109))))

(declare-fun b!1302243 () Bool)

(declare-fun c!124937 () Bool)

(assert (=> b!1302243 (= c!124937 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302243 (= e!742766 e!742762)))

(declare-fun b!1302244 () Bool)

(declare-fun res!865026 () Bool)

(assert (=> b!1302244 (=> (not res!865026) (not e!742758))))

(assert (=> b!1302244 (= res!865026 e!742755)))

(declare-fun c!124936 () Bool)

(assert (=> b!1302244 (= c!124936 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1302245 () Bool)

(assert (=> b!1302245 (= e!742759 (not call!64113))))

(assert (= (and d!141427 c!124939) b!1302229))

(assert (= (and d!141427 (not c!124939)) b!1302228))

(assert (= (and b!1302228 c!124940) b!1302240))

(assert (= (and b!1302228 (not c!124940)) b!1302243))

(assert (= (and b!1302243 c!124937) b!1302226))

(assert (= (and b!1302243 (not c!124937)) b!1302227))

(assert (= (or b!1302226 b!1302227) bm!64109))

(assert (= (or b!1302240 bm!64109) bm!64104))

(assert (= (or b!1302240 b!1302226) bm!64107))

(assert (= (or b!1302229 bm!64104) bm!64105))

(assert (= (or b!1302229 bm!64107) bm!64106))

(assert (= (and d!141427 res!865025) b!1302236))

(assert (= (and d!141427 c!124938) b!1302239))

(assert (= (and d!141427 (not c!124938)) b!1302241))

(assert (= (and d!141427 res!865020) b!1302234))

(assert (= (and b!1302234 res!865028) b!1302225))

(assert (= (and b!1302234 (not res!865024)) b!1302233))

(assert (= (and b!1302233 res!865022) b!1302237))

(assert (= (and b!1302234 res!865021) b!1302244))

(assert (= (and b!1302244 c!124936) b!1302235))

(assert (= (and b!1302244 (not c!124936)) b!1302242))

(assert (= (and b!1302235 res!865023) b!1302232))

(assert (= (or b!1302235 b!1302242) bm!64110))

(assert (= (and b!1302244 res!865026) b!1302231))

(assert (= (and b!1302231 c!124935) b!1302230))

(assert (= (and b!1302231 (not c!124935)) b!1302245))

(assert (= (and b!1302230 res!865027) b!1302238))

(assert (= (or b!1302230 b!1302245) bm!64108))

(declare-fun b_lambda!23223 () Bool)

(assert (=> (not b_lambda!23223) (not b!1302237)))

(assert (=> b!1302237 t!43307))

(declare-fun b_and!47373 () Bool)

(assert (= b_and!47371 (and (=> t!43307 result!23795) b_and!47373)))

(assert (=> b!1302233 m!1192881))

(assert (=> b!1302233 m!1192881))

(declare-fun m!1193015 () Bool)

(assert (=> b!1302233 m!1193015))

(assert (=> b!1302225 m!1192881))

(assert (=> b!1302225 m!1192881))

(assert (=> b!1302225 m!1192889))

(assert (=> d!141427 m!1192869))

(declare-fun m!1193017 () Bool)

(assert (=> bm!64106 m!1193017))

(declare-fun m!1193019 () Bool)

(assert (=> bm!64110 m!1193019))

(assert (=> bm!64105 m!1192859))

(declare-fun m!1193021 () Bool)

(assert (=> bm!64108 m!1193021))

(declare-fun m!1193023 () Bool)

(assert (=> b!1302232 m!1193023))

(declare-fun m!1193025 () Bool)

(assert (=> b!1302229 m!1193025))

(assert (=> b!1302237 m!1192971))

(assert (=> b!1302237 m!1192967))

(assert (=> b!1302237 m!1192973))

(assert (=> b!1302237 m!1192881))

(declare-fun m!1193027 () Bool)

(assert (=> b!1302237 m!1193027))

(assert (=> b!1302237 m!1192967))

(assert (=> b!1302237 m!1192971))

(assert (=> b!1302237 m!1192881))

(declare-fun m!1193029 () Bool)

(assert (=> b!1302238 m!1193029))

(assert (=> b!1302236 m!1192881))

(assert (=> b!1302236 m!1192881))

(assert (=> b!1302236 m!1192889))

(declare-fun m!1193031 () Bool)

(assert (=> b!1302239 m!1193031))

(assert (=> b!1302239 m!1192859))

(declare-fun m!1193033 () Bool)

(assert (=> b!1302239 m!1193033))

(declare-fun m!1193035 () Bool)

(assert (=> b!1302239 m!1193035))

(declare-fun m!1193037 () Bool)

(assert (=> b!1302239 m!1193037))

(declare-fun m!1193039 () Bool)

(assert (=> b!1302239 m!1193039))

(declare-fun m!1193041 () Bool)

(assert (=> b!1302239 m!1193041))

(assert (=> b!1302239 m!1193039))

(declare-fun m!1193043 () Bool)

(assert (=> b!1302239 m!1193043))

(declare-fun m!1193045 () Bool)

(assert (=> b!1302239 m!1193045))

(declare-fun m!1193047 () Bool)

(assert (=> b!1302239 m!1193047))

(declare-fun m!1193049 () Bool)

(assert (=> b!1302239 m!1193049))

(assert (=> b!1302239 m!1193033))

(declare-fun m!1193051 () Bool)

(assert (=> b!1302239 m!1193051))

(assert (=> b!1302239 m!1193035))

(assert (=> b!1302239 m!1192881))

(declare-fun m!1193053 () Bool)

(assert (=> b!1302239 m!1193053))

(declare-fun m!1193055 () Bool)

(assert (=> b!1302239 m!1193055))

(declare-fun m!1193057 () Bool)

(assert (=> b!1302239 m!1193057))

(assert (=> b!1302239 m!1193057))

(declare-fun m!1193059 () Bool)

(assert (=> b!1302239 m!1193059))

(assert (=> b!1302030 d!141427))

(declare-fun d!141429 () Bool)

(declare-fun e!742769 () Bool)

(assert (=> d!141429 e!742769))

(declare-fun res!865029 () Bool)

(assert (=> d!141429 (=> res!865029 e!742769)))

(declare-fun lt!582555 () Bool)

(assert (=> d!141429 (= res!865029 (not lt!582555))))

(declare-fun lt!582557 () Bool)

(assert (=> d!141429 (= lt!582555 lt!582557)))

(declare-fun lt!582556 () Unit!43103)

(declare-fun e!742768 () Unit!43103)

(assert (=> d!141429 (= lt!582556 e!742768)))

(declare-fun c!124941 () Bool)

(assert (=> d!141429 (= c!124941 lt!582557)))

(assert (=> d!141429 (= lt!582557 (containsKey!723 (toList!10139 (ListLongMap!20248 Nil!29716)) k0!1205))))

(assert (=> d!141429 (= (contains!8267 (ListLongMap!20248 Nil!29716) k0!1205) lt!582555)))

(declare-fun b!1302246 () Bool)

(declare-fun lt!582558 () Unit!43103)

(assert (=> b!1302246 (= e!742768 lt!582558)))

(assert (=> b!1302246 (= lt!582558 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10139 (ListLongMap!20248 Nil!29716)) k0!1205))))

(assert (=> b!1302246 (isDefined!508 (getValueByKey!701 (toList!10139 (ListLongMap!20248 Nil!29716)) k0!1205))))

(declare-fun b!1302247 () Bool)

(declare-fun Unit!43109 () Unit!43103)

(assert (=> b!1302247 (= e!742768 Unit!43109)))

(declare-fun b!1302248 () Bool)

(assert (=> b!1302248 (= e!742769 (isDefined!508 (getValueByKey!701 (toList!10139 (ListLongMap!20248 Nil!29716)) k0!1205)))))

(assert (= (and d!141429 c!124941) b!1302246))

(assert (= (and d!141429 (not c!124941)) b!1302247))

(assert (= (and d!141429 (not res!865029)) b!1302248))

(declare-fun m!1193061 () Bool)

(assert (=> d!141429 m!1193061))

(declare-fun m!1193063 () Bool)

(assert (=> b!1302246 m!1193063))

(declare-fun m!1193065 () Bool)

(assert (=> b!1302246 m!1193065))

(assert (=> b!1302246 m!1193065))

(declare-fun m!1193067 () Bool)

(assert (=> b!1302246 m!1193067))

(assert (=> b!1302248 m!1193065))

(assert (=> b!1302248 m!1193065))

(assert (=> b!1302248 m!1193067))

(assert (=> b!1302035 d!141429))

(declare-fun d!141431 () Bool)

(assert (=> d!141431 (not (contains!8267 (ListLongMap!20248 Nil!29716) k0!1205))))

(declare-fun lt!582561 () Unit!43103)

(declare-fun choose!1911 ((_ BitVec 64)) Unit!43103)

(assert (=> d!141431 (= lt!582561 (choose!1911 k0!1205))))

(assert (=> d!141431 (= (emptyContainsNothing!206 k0!1205) lt!582561)))

(declare-fun bs!37082 () Bool)

(assert (= bs!37082 d!141431))

(assert (=> bs!37082 m!1192883))

(declare-fun m!1193069 () Bool)

(assert (=> bs!37082 m!1193069))

(assert (=> b!1302035 d!141431))

(declare-fun d!141433 () Bool)

(declare-fun e!742771 () Bool)

(assert (=> d!141433 e!742771))

(declare-fun res!865030 () Bool)

(assert (=> d!141433 (=> res!865030 e!742771)))

(declare-fun lt!582562 () Bool)

(assert (=> d!141433 (= res!865030 (not lt!582562))))

(declare-fun lt!582564 () Bool)

(assert (=> d!141433 (= lt!582562 lt!582564)))

(declare-fun lt!582563 () Unit!43103)

(declare-fun e!742770 () Unit!43103)

(assert (=> d!141433 (= lt!582563 e!742770)))

(declare-fun c!124942 () Bool)

(assert (=> d!141433 (= c!124942 lt!582564)))

(assert (=> d!141433 (= lt!582564 (containsKey!723 (toList!10139 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))) k0!1205))))

(assert (=> d!141433 (= (contains!8267 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389)) k0!1205) lt!582562)))

(declare-fun b!1302249 () Bool)

(declare-fun lt!582565 () Unit!43103)

(assert (=> b!1302249 (= e!742770 lt!582565)))

(assert (=> b!1302249 (= lt!582565 (lemmaContainsKeyImpliesGetValueByKeyDefined!469 (toList!10139 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))) k0!1205))))

(assert (=> b!1302249 (isDefined!508 (getValueByKey!701 (toList!10139 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))) k0!1205))))

(declare-fun b!1302250 () Bool)

(declare-fun Unit!43110 () Unit!43103)

(assert (=> b!1302250 (= e!742770 Unit!43110)))

(declare-fun b!1302251 () Bool)

(assert (=> b!1302251 (= e!742771 (isDefined!508 (getValueByKey!701 (toList!10139 (ite c!124890 lt!582390 (ite c!124889 lt!582385 lt!582389))) k0!1205)))))

(assert (= (and d!141433 c!124942) b!1302249))

(assert (= (and d!141433 (not c!124942)) b!1302250))

(assert (= (and d!141433 (not res!865030)) b!1302251))

(declare-fun m!1193071 () Bool)

(assert (=> d!141433 m!1193071))

(declare-fun m!1193073 () Bool)

(assert (=> b!1302249 m!1193073))

(declare-fun m!1193075 () Bool)

(assert (=> b!1302249 m!1193075))

(assert (=> b!1302249 m!1193075))

(declare-fun m!1193077 () Bool)

(assert (=> b!1302249 m!1193077))

(assert (=> b!1302251 m!1193075))

(assert (=> b!1302251 m!1193075))

(assert (=> b!1302251 m!1193077))

(assert (=> bm!64062 d!141433))

(declare-fun condMapEmpty!53889 () Bool)

(declare-fun mapDefault!53889 () ValueCell!16536)

(assert (=> mapNonEmpty!53883 (= condMapEmpty!53889 (= mapRest!53883 ((as const (Array (_ BitVec 32) ValueCell!16536)) mapDefault!53889)))))

(declare-fun e!742776 () Bool)

(declare-fun mapRes!53889 () Bool)

(assert (=> mapNonEmpty!53883 (= tp!102824 (and e!742776 mapRes!53889))))

(declare-fun mapIsEmpty!53889 () Bool)

(assert (=> mapIsEmpty!53889 mapRes!53889))

(declare-fun mapNonEmpty!53889 () Bool)

(declare-fun tp!102834 () Bool)

(declare-fun e!742777 () Bool)

(assert (=> mapNonEmpty!53889 (= mapRes!53889 (and tp!102834 e!742777))))

(declare-fun mapRest!53889 () (Array (_ BitVec 32) ValueCell!16536))

(declare-fun mapKey!53889 () (_ BitVec 32))

(declare-fun mapValue!53889 () ValueCell!16536)

(assert (=> mapNonEmpty!53889 (= mapRest!53883 (store mapRest!53889 mapKey!53889 mapValue!53889))))

(declare-fun b!1302258 () Bool)

(assert (=> b!1302258 (= e!742777 tp_is_empty!34869)))

(declare-fun b!1302259 () Bool)

(assert (=> b!1302259 (= e!742776 tp_is_empty!34869)))

(assert (= (and mapNonEmpty!53883 condMapEmpty!53889) mapIsEmpty!53889))

(assert (= (and mapNonEmpty!53883 (not condMapEmpty!53889)) mapNonEmpty!53889))

(assert (= (and mapNonEmpty!53889 ((_ is ValueCellFull!16536) mapValue!53889)) b!1302258))

(assert (= (and mapNonEmpty!53883 ((_ is ValueCellFull!16536) mapDefault!53889)) b!1302259))

(declare-fun m!1193079 () Bool)

(assert (=> mapNonEmpty!53889 m!1193079))

(declare-fun b_lambda!23225 () Bool)

(assert (= b_lambda!23219 (or (and start!109904 b_free!29229) b_lambda!23225)))

(declare-fun b_lambda!23227 () Bool)

(assert (= b_lambda!23221 (or (and start!109904 b_free!29229) b_lambda!23227)))

(declare-fun b_lambda!23229 () Bool)

(assert (= b_lambda!23223 (or (and start!109904 b_free!29229) b_lambda!23229)))

(check-sat (not b!1302155) (not bm!64086) (not d!141427) (not b_lambda!23227) tp_is_empty!34869 (not d!141423) (not b!1302108) (not b!1302099) (not b!1302225) (not d!141411) (not b!1302156) (not b!1302172) (not d!141433) (not b!1302182) (not b!1302237) (not b_lambda!23229) (not b!1302233) (not b!1302152) (not mapNonEmpty!53889) (not b!1302154) (not b!1302120) (not d!141407) (not d!141425) (not b!1302150) (not b!1302236) (not b!1302159) (not b!1302249) (not b!1302119) (not d!141415) (not d!141429) (not bm!64083) (not b!1302229) (not b!1302238) (not b_next!29229) (not b_lambda!23225) (not b!1302151) (not bm!64110) (not b!1302248) (not d!141431) (not b!1302232) (not b!1302157) (not b!1302179) (not b!1302123) (not b!1302171) (not b!1302180) b_and!47373 (not b!1302246) (not b!1302251) (not bm!64106) (not bm!64089) (not b!1302098) (not b!1302106) (not b!1302239) (not d!141409) (not bm!64108) (not bm!64105))
(check-sat b_and!47373 (not b_next!29229))
