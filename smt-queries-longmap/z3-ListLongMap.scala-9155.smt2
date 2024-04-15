; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109810 () Bool)

(assert start!109810)

(declare-fun b_free!29203 () Bool)

(declare-fun b_next!29203 () Bool)

(assert (=> start!109810 (= b_free!29203 (not b_next!29203))))

(declare-fun tp!102744 () Bool)

(declare-fun b_and!47299 () Bool)

(assert (=> start!109810 (= tp!102744 b_and!47299)))

(declare-fun bm!63759 () Bool)

(declare-fun call!63762 () Bool)

(declare-fun call!63763 () Bool)

(assert (=> bm!63759 (= call!63762 call!63763)))

(declare-fun b!1300844 () Bool)

(declare-fun res!864392 () Bool)

(declare-fun e!742006 () Bool)

(assert (=> b!1300844 (=> (not res!864392) (not e!742006))))

(declare-datatypes ((array!86597 0))(
  ( (array!86598 (arr!41795 (Array (_ BitVec 32) (_ BitVec 64))) (size!42347 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86597)

(declare-datatypes ((List!29739 0))(
  ( (Nil!29736) (Cons!29735 (h!30944 (_ BitVec 64)) (t!43305 List!29739)) )
))
(declare-fun arrayNoDuplicates!0 (array!86597 (_ BitVec 32) List!29739) Bool)

(assert (=> b!1300844 (= res!864392 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29736))))

(declare-fun b!1300845 () Bool)

(declare-fun res!864386 () Bool)

(assert (=> b!1300845 (=> (not res!864386) (not e!742006))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1300845 (= res!864386 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42347 _keys!1741))))))

(declare-fun b!1300846 () Bool)

(declare-fun res!864390 () Bool)

(assert (=> b!1300846 (=> (not res!864390) (not e!742006))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86597 (_ BitVec 32)) Bool)

(assert (=> b!1300846 (= res!864390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300847 () Bool)

(declare-fun res!864389 () Bool)

(assert (=> b!1300847 (=> (not res!864389) (not e!742006))))

(declare-datatypes ((V!51561 0))(
  ( (V!51562 (val!17496 Int)) )
))
(declare-fun minValue!1387 () V!51561)

(declare-fun zeroValue!1387 () V!51561)

(declare-datatypes ((ValueCell!16523 0))(
  ( (ValueCellFull!16523 (v!20103 V!51561)) (EmptyCell!16523) )
))
(declare-datatypes ((array!86599 0))(
  ( (array!86600 (arr!41796 (Array (_ BitVec 32) ValueCell!16523)) (size!42348 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86599)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22622 0))(
  ( (tuple2!22623 (_1!11322 (_ BitVec 64)) (_2!11322 V!51561)) )
))
(declare-datatypes ((List!29740 0))(
  ( (Nil!29737) (Cons!29736 (h!30945 tuple2!22622) (t!43306 List!29740)) )
))
(declare-datatypes ((ListLongMap!20279 0))(
  ( (ListLongMap!20280 (toList!10155 List!29740)) )
))
(declare-fun contains!8211 (ListLongMap!20279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5066 (array!86597 array!86599 (_ BitVec 32) (_ BitVec 32) V!51561 V!51561 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> b!1300847 (= res!864389 (contains!8211 (getCurrentListMap!5066 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300848 () Bool)

(declare-fun e!742008 () Bool)

(declare-fun e!742011 () Bool)

(declare-fun mapRes!53840 () Bool)

(assert (=> b!1300848 (= e!742008 (and e!742011 mapRes!53840))))

(declare-fun condMapEmpty!53840 () Bool)

(declare-fun mapDefault!53840 () ValueCell!16523)

(assert (=> b!1300848 (= condMapEmpty!53840 (= (arr!41796 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16523)) mapDefault!53840)))))

(declare-fun b!1300849 () Bool)

(assert (=> b!1300849 call!63762))

(declare-datatypes ((Unit!42894 0))(
  ( (Unit!42895) )
))
(declare-fun lt!581448 () Unit!42894)

(declare-fun call!63767 () Unit!42894)

(assert (=> b!1300849 (= lt!581448 call!63767)))

(declare-fun lt!581446 () ListLongMap!20279)

(declare-fun call!63765 () ListLongMap!20279)

(assert (=> b!1300849 (= lt!581446 call!63765)))

(declare-fun e!742009 () Unit!42894)

(assert (=> b!1300849 (= e!742009 lt!581448)))

(declare-fun b!1300850 () Bool)

(declare-fun res!864385 () Bool)

(assert (=> b!1300850 (=> (not res!864385) (not e!742006))))

(assert (=> b!1300850 (= res!864385 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42347 _keys!1741))))))

(declare-fun res!864387 () Bool)

(assert (=> start!109810 (=> (not res!864387) (not e!742006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109810 (= res!864387 (validMask!0 mask!2175))))

(assert (=> start!109810 e!742006))

(declare-fun tp_is_empty!34843 () Bool)

(assert (=> start!109810 tp_is_empty!34843))

(assert (=> start!109810 true))

(declare-fun array_inv!31793 (array!86599) Bool)

(assert (=> start!109810 (and (array_inv!31793 _values!1445) e!742008)))

(declare-fun array_inv!31794 (array!86597) Bool)

(assert (=> start!109810 (array_inv!31794 _keys!1741)))

(assert (=> start!109810 tp!102744))

(declare-fun b!1300851 () Bool)

(declare-fun res!864391 () Bool)

(assert (=> b!1300851 (=> (not res!864391) (not e!742006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300851 (= res!864391 (validKeyInArray!0 (select (arr!41795 _keys!1741) from!2144)))))

(declare-fun b!1300852 () Bool)

(declare-fun e!742004 () Bool)

(assert (=> b!1300852 (= e!742004 tp_is_empty!34843)))

(declare-fun b!1300853 () Bool)

(declare-fun res!864388 () Bool)

(assert (=> b!1300853 (=> (not res!864388) (not e!742006))))

(assert (=> b!1300853 (= res!864388 (and (= (size!42348 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42347 _keys!1741) (size!42348 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300854 () Bool)

(declare-fun e!742010 () Unit!42894)

(declare-fun lt!581454 () Unit!42894)

(assert (=> b!1300854 (= e!742010 lt!581454)))

(declare-fun lt!581453 () ListLongMap!20279)

(assert (=> b!1300854 (= lt!581453 call!63765)))

(assert (=> b!1300854 (= lt!581454 call!63767)))

(assert (=> b!1300854 call!63762))

(declare-fun bm!63760 () Bool)

(declare-fun call!63766 () Unit!42894)

(assert (=> bm!63760 (= call!63767 call!63766)))

(declare-fun mapIsEmpty!53840 () Bool)

(assert (=> mapIsEmpty!53840 mapRes!53840))

(declare-fun bm!63761 () Bool)

(declare-fun call!63764 () ListLongMap!20279)

(declare-fun getCurrentListMapNoExtraKeys!6126 (array!86597 array!86599 (_ BitVec 32) (_ BitVec 32) V!51561 V!51561 (_ BitVec 32) Int) ListLongMap!20279)

(assert (=> bm!63761 (= call!63764 (getCurrentListMapNoExtraKeys!6126 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300855 () Bool)

(declare-fun e!742005 () Unit!42894)

(assert (=> b!1300855 (= e!742005 e!742009)))

(declare-fun c!124643 () Bool)

(declare-fun lt!581451 () Bool)

(assert (=> b!1300855 (= c!124643 (and (not lt!581451) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63762 () Bool)

(assert (=> bm!63762 (= call!63765 call!63764)))

(declare-fun b!1300856 () Bool)

(assert (=> b!1300856 (= e!742006 (not (or (= k0!1205 (select (arr!41795 _keys!1741) from!2144)) (bvslt from!2144 (size!42348 _values!1445)))))))

(assert (=> b!1300856 (not (contains!8211 (ListLongMap!20280 Nil!29737) k0!1205))))

(declare-fun lt!581452 () Unit!42894)

(declare-fun emptyContainsNothing!193 ((_ BitVec 64)) Unit!42894)

(assert (=> b!1300856 (= lt!581452 (emptyContainsNothing!193 k0!1205))))

(declare-fun lt!581450 () Unit!42894)

(assert (=> b!1300856 (= lt!581450 e!742005)))

(declare-fun c!124645 () Bool)

(assert (=> b!1300856 (= c!124645 (and (not lt!581451) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1300856 (= lt!581451 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!63763 () Bool)

(declare-fun lt!581447 () ListLongMap!20279)

(assert (=> bm!63763 (= call!63763 (contains!8211 (ite c!124645 lt!581447 (ite c!124643 lt!581446 lt!581453)) k0!1205))))

(declare-fun mapNonEmpty!53840 () Bool)

(declare-fun tp!102743 () Bool)

(assert (=> mapNonEmpty!53840 (= mapRes!53840 (and tp!102743 e!742004))))

(declare-fun mapRest!53840 () (Array (_ BitVec 32) ValueCell!16523))

(declare-fun mapKey!53840 () (_ BitVec 32))

(declare-fun mapValue!53840 () ValueCell!16523)

(assert (=> mapNonEmpty!53840 (= (arr!41796 _values!1445) (store mapRest!53840 mapKey!53840 mapValue!53840))))

(declare-fun b!1300857 () Bool)

(assert (=> b!1300857 (= e!742011 tp_is_empty!34843)))

(declare-fun b!1300858 () Bool)

(declare-fun Unit!42896 () Unit!42894)

(assert (=> b!1300858 (= e!742010 Unit!42896)))

(declare-fun b!1300859 () Bool)

(declare-fun c!124644 () Bool)

(assert (=> b!1300859 (= c!124644 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581451))))

(assert (=> b!1300859 (= e!742009 e!742010)))

(declare-fun lt!581449 () ListLongMap!20279)

(declare-fun bm!63764 () Bool)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!78 ((_ BitVec 64) (_ BitVec 64) V!51561 ListLongMap!20279) Unit!42894)

(assert (=> bm!63764 (= call!63766 (lemmaInListMapAfterAddingDiffThenInBefore!78 k0!1205 (ite c!124645 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124643 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124645 minValue!1387 (ite c!124643 zeroValue!1387 minValue!1387)) (ite c!124645 lt!581449 (ite c!124643 lt!581446 lt!581453))))))

(declare-fun b!1300860 () Bool)

(declare-fun lt!581455 () Unit!42894)

(assert (=> b!1300860 (= e!742005 lt!581455)))

(assert (=> b!1300860 (= lt!581447 call!63764)))

(declare-fun +!4495 (ListLongMap!20279 tuple2!22622) ListLongMap!20279)

(assert (=> b!1300860 (= lt!581449 (+!4495 lt!581447 (tuple2!22623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581445 () Unit!42894)

(assert (=> b!1300860 (= lt!581445 call!63766)))

(assert (=> b!1300860 (contains!8211 lt!581449 k0!1205)))

(assert (=> b!1300860 (= lt!581455 (lemmaInListMapAfterAddingDiffThenInBefore!78 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581447))))

(assert (=> b!1300860 call!63763))

(assert (= (and start!109810 res!864387) b!1300853))

(assert (= (and b!1300853 res!864388) b!1300846))

(assert (= (and b!1300846 res!864390) b!1300844))

(assert (= (and b!1300844 res!864392) b!1300850))

(assert (= (and b!1300850 res!864385) b!1300847))

(assert (= (and b!1300847 res!864389) b!1300845))

(assert (= (and b!1300845 res!864386) b!1300851))

(assert (= (and b!1300851 res!864391) b!1300856))

(assert (= (and b!1300856 c!124645) b!1300860))

(assert (= (and b!1300856 (not c!124645)) b!1300855))

(assert (= (and b!1300855 c!124643) b!1300849))

(assert (= (and b!1300855 (not c!124643)) b!1300859))

(assert (= (and b!1300859 c!124644) b!1300854))

(assert (= (and b!1300859 (not c!124644)) b!1300858))

(assert (= (or b!1300849 b!1300854) bm!63762))

(assert (= (or b!1300849 b!1300854) bm!63760))

(assert (= (or b!1300849 b!1300854) bm!63759))

(assert (= (or b!1300860 bm!63762) bm!63761))

(assert (= (or b!1300860 bm!63760) bm!63764))

(assert (= (or b!1300860 bm!63759) bm!63763))

(assert (= (and b!1300848 condMapEmpty!53840) mapIsEmpty!53840))

(assert (= (and b!1300848 (not condMapEmpty!53840)) mapNonEmpty!53840))

(get-info :version)

(assert (= (and mapNonEmpty!53840 ((_ is ValueCellFull!16523) mapValue!53840)) b!1300852))

(assert (= (and b!1300848 ((_ is ValueCellFull!16523) mapDefault!53840)) b!1300857))

(assert (= start!109810 b!1300848))

(declare-fun m!1191197 () Bool)

(assert (=> b!1300846 m!1191197))

(declare-fun m!1191199 () Bool)

(assert (=> start!109810 m!1191199))

(declare-fun m!1191201 () Bool)

(assert (=> start!109810 m!1191201))

(declare-fun m!1191203 () Bool)

(assert (=> start!109810 m!1191203))

(declare-fun m!1191205 () Bool)

(assert (=> bm!63761 m!1191205))

(declare-fun m!1191207 () Bool)

(assert (=> bm!63763 m!1191207))

(declare-fun m!1191209 () Bool)

(assert (=> b!1300847 m!1191209))

(assert (=> b!1300847 m!1191209))

(declare-fun m!1191211 () Bool)

(assert (=> b!1300847 m!1191211))

(declare-fun m!1191213 () Bool)

(assert (=> b!1300851 m!1191213))

(assert (=> b!1300851 m!1191213))

(declare-fun m!1191215 () Bool)

(assert (=> b!1300851 m!1191215))

(declare-fun m!1191217 () Bool)

(assert (=> b!1300844 m!1191217))

(declare-fun m!1191219 () Bool)

(assert (=> mapNonEmpty!53840 m!1191219))

(declare-fun m!1191221 () Bool)

(assert (=> b!1300860 m!1191221))

(declare-fun m!1191223 () Bool)

(assert (=> b!1300860 m!1191223))

(declare-fun m!1191225 () Bool)

(assert (=> b!1300860 m!1191225))

(assert (=> b!1300856 m!1191213))

(declare-fun m!1191227 () Bool)

(assert (=> b!1300856 m!1191227))

(declare-fun m!1191229 () Bool)

(assert (=> b!1300856 m!1191229))

(declare-fun m!1191231 () Bool)

(assert (=> bm!63764 m!1191231))

(check-sat (not b!1300844) (not bm!63763) (not b!1300851) (not b!1300856) (not b!1300846) (not b!1300847) (not start!109810) (not bm!63761) b_and!47299 (not b!1300860) tp_is_empty!34843 (not bm!63764) (not mapNonEmpty!53840) (not b_next!29203))
(check-sat b_and!47299 (not b_next!29203))
