; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109902 () Bool)

(assert start!109902)

(declare-fun b_free!29227 () Bool)

(declare-fun b_next!29227 () Bool)

(assert (=> start!109902 (= b_free!29227 (not b_next!29227))))

(declare-fun tp!102819 () Bool)

(declare-fun b_and!47345 () Bool)

(assert (=> start!109902 (= tp!102819 b_and!47345)))

(declare-fun bm!64020 () Bool)

(declare-datatypes ((Unit!42941 0))(
  ( (Unit!42942) )
))
(declare-fun call!64027 () Unit!42941)

(declare-fun call!64025 () Unit!42941)

(assert (=> bm!64020 (= call!64027 call!64025)))

(declare-fun bm!64021 () Bool)

(declare-datatypes ((V!51593 0))(
  ( (V!51594 (val!17508 Int)) )
))
(declare-datatypes ((tuple2!22644 0))(
  ( (tuple2!22645 (_1!11333 (_ BitVec 64)) (_2!11333 V!51593)) )
))
(declare-datatypes ((List!29759 0))(
  ( (Nil!29756) (Cons!29755 (h!30964 tuple2!22644) (t!43337 List!29759)) )
))
(declare-datatypes ((ListLongMap!20301 0))(
  ( (ListLongMap!20302 (toList!10166 List!29759)) )
))
(declare-fun call!64028 () ListLongMap!20301)

(declare-fun call!64023 () ListLongMap!20301)

(assert (=> bm!64021 (= call!64028 call!64023)))

(declare-fun b!1301898 () Bool)

(declare-fun e!742579 () Unit!42941)

(declare-fun lt!582168 () Unit!42941)

(assert (=> b!1301898 (= e!742579 lt!582168)))

(declare-fun lt!582172 () ListLongMap!20301)

(assert (=> b!1301898 (= lt!582172 call!64028)))

(assert (=> b!1301898 (= lt!582168 call!64027)))

(declare-fun call!64026 () Bool)

(assert (=> b!1301898 call!64026))

(declare-fun b!1301899 () Bool)

(declare-fun res!864867 () Bool)

(declare-fun e!742574 () Bool)

(assert (=> b!1301899 (=> (not res!864867) (not e!742574))))

(declare-datatypes ((array!86647 0))(
  ( (array!86648 (arr!41819 (Array (_ BitVec 32) (_ BitVec 64))) (size!42371 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86647)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86647 (_ BitVec 32)) Bool)

(assert (=> b!1301899 (= res!864867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1301900 () Bool)

(declare-fun e!742581 () Bool)

(assert (=> b!1301900 (= e!742574 (not e!742581))))

(declare-fun res!864872 () Bool)

(assert (=> b!1301900 (=> res!864872 e!742581)))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1301900 (= res!864872 (not (= k0!1205 (select (arr!41819 _keys!1741) from!2144))))))

(declare-fun contains!8223 (ListLongMap!20301 (_ BitVec 64)) Bool)

(assert (=> b!1301900 (not (contains!8223 (ListLongMap!20302 Nil!29756) k0!1205))))

(declare-fun lt!582164 () Unit!42941)

(declare-fun emptyContainsNothing!200 ((_ BitVec 64)) Unit!42941)

(assert (=> b!1301900 (= lt!582164 (emptyContainsNothing!200 k0!1205))))

(declare-fun lt!582167 () Unit!42941)

(declare-fun e!742578 () Unit!42941)

(assert (=> b!1301900 (= lt!582167 e!742578)))

(declare-fun c!124864 () Bool)

(declare-fun lt!582174 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1301900 (= c!124864 (and (not lt!582174) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301900 (= lt!582174 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!53880 () Bool)

(declare-fun mapRes!53880 () Bool)

(assert (=> mapIsEmpty!53880 mapRes!53880))

(declare-fun b!1301901 () Bool)

(declare-fun Unit!42943 () Unit!42941)

(assert (=> b!1301901 (= e!742579 Unit!42943)))

(declare-fun b!1301902 () Bool)

(declare-fun e!742575 () Bool)

(declare-fun tp_is_empty!34867 () Bool)

(assert (=> b!1301902 (= e!742575 tp_is_empty!34867)))

(declare-fun b!1301903 () Bool)

(declare-fun res!864874 () Bool)

(assert (=> b!1301903 (=> (not res!864874) (not e!742574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301903 (= res!864874 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun b!1301904 () Bool)

(declare-fun res!864875 () Bool)

(assert (=> b!1301904 (=> (not res!864875) (not e!742574))))

(declare-datatypes ((ValueCell!16535 0))(
  ( (ValueCellFull!16535 (v!20118 V!51593)) (EmptyCell!16535) )
))
(declare-datatypes ((array!86649 0))(
  ( (array!86650 (arr!41820 (Array (_ BitVec 32) ValueCell!16535)) (size!42372 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86649)

(assert (=> b!1301904 (= res!864875 (and (= (size!42372 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42371 _keys!1741) (size!42372 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1301905 () Bool)

(declare-fun lt!582169 () Unit!42941)

(assert (=> b!1301905 (= e!742578 lt!582169)))

(declare-fun lt!582171 () ListLongMap!20301)

(assert (=> b!1301905 (= lt!582171 call!64023)))

(declare-fun lt!582173 () ListLongMap!20301)

(declare-fun zeroValue!1387 () V!51593)

(declare-fun +!4503 (ListLongMap!20301 tuple2!22644) ListLongMap!20301)

(assert (=> b!1301905 (= lt!582173 (+!4503 lt!582171 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51593)

(declare-fun lt!582170 () Unit!42941)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!89 ((_ BitVec 64) (_ BitVec 64) V!51593 ListLongMap!20301) Unit!42941)

(assert (=> b!1301905 (= lt!582170 (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582173))))

(declare-fun call!64024 () Bool)

(assert (=> b!1301905 call!64024))

(assert (=> b!1301905 (= lt!582169 call!64025)))

(assert (=> b!1301905 (contains!8223 lt!582171 k0!1205)))

(declare-fun bm!64022 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6135 (array!86647 array!86649 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20301)

(assert (=> bm!64022 (= call!64023 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301906 () Bool)

(declare-fun e!742576 () Bool)

(declare-fun e!742577 () Bool)

(assert (=> b!1301906 (= e!742576 (and e!742577 mapRes!53880))))

(declare-fun condMapEmpty!53880 () Bool)

(declare-fun mapDefault!53880 () ValueCell!16535)

(assert (=> b!1301906 (= condMapEmpty!53880 (= (arr!41820 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16535)) mapDefault!53880)))))

(declare-fun mapNonEmpty!53880 () Bool)

(declare-fun tp!102820 () Bool)

(assert (=> mapNonEmpty!53880 (= mapRes!53880 (and tp!102820 e!742575))))

(declare-fun mapRest!53880 () (Array (_ BitVec 32) ValueCell!16535))

(declare-fun mapValue!53880 () ValueCell!16535)

(declare-fun mapKey!53880 () (_ BitVec 32))

(assert (=> mapNonEmpty!53880 (= (arr!41820 _values!1445) (store mapRest!53880 mapKey!53880 mapValue!53880))))

(declare-fun b!1301907 () Bool)

(assert (=> b!1301907 call!64026))

(declare-fun lt!582165 () Unit!42941)

(assert (=> b!1301907 (= lt!582165 call!64027)))

(declare-fun lt!582166 () ListLongMap!20301)

(assert (=> b!1301907 (= lt!582166 call!64028)))

(declare-fun e!742580 () Unit!42941)

(assert (=> b!1301907 (= e!742580 lt!582165)))

(declare-fun bm!64023 () Bool)

(assert (=> bm!64023 (= call!64026 call!64024)))

(declare-fun b!1301908 () Bool)

(declare-fun res!864868 () Bool)

(assert (=> b!1301908 (=> (not res!864868) (not e!742574))))

(declare-fun getCurrentListMap!5074 (array!86647 array!86649 (_ BitVec 32) (_ BitVec 32) V!51593 V!51593 (_ BitVec 32) Int) ListLongMap!20301)

(assert (=> b!1301908 (= res!864868 (contains!8223 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301909 () Bool)

(assert (=> b!1301909 (= e!742577 tp_is_empty!34867)))

(declare-fun b!1301910 () Bool)

(declare-fun c!124863 () Bool)

(assert (=> b!1301910 (= c!124863 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582174))))

(assert (=> b!1301910 (= e!742580 e!742579)))

(declare-fun b!1301911 () Bool)

(assert (=> b!1301911 (= e!742578 e!742580)))

(declare-fun c!124862 () Bool)

(assert (=> b!1301911 (= c!124862 (and (not lt!582174) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301912 () Bool)

(declare-fun arrayContainsKey!0 (array!86647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301912 (= e!742581 (arrayContainsKey!0 _keys!1741 k0!1205 from!2144))))

(declare-fun bm!64024 () Bool)

(assert (=> bm!64024 (= call!64025 (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 (ite (or c!124864 c!124862) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124864 c!124862) zeroValue!1387 minValue!1387) (ite c!124864 lt!582171 (ite c!124862 lt!582166 lt!582172))))))

(declare-fun res!864870 () Bool)

(assert (=> start!109902 (=> (not res!864870) (not e!742574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109902 (= res!864870 (validMask!0 mask!2175))))

(assert (=> start!109902 e!742574))

(assert (=> start!109902 tp_is_empty!34867))

(assert (=> start!109902 true))

(declare-fun array_inv!31809 (array!86649) Bool)

(assert (=> start!109902 (and (array_inv!31809 _values!1445) e!742576)))

(declare-fun array_inv!31810 (array!86647) Bool)

(assert (=> start!109902 (array_inv!31810 _keys!1741)))

(assert (=> start!109902 tp!102819))

(declare-fun bm!64025 () Bool)

(assert (=> bm!64025 (= call!64024 (contains!8223 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172)) k0!1205))))

(declare-fun b!1301913 () Bool)

(declare-fun res!864871 () Bool)

(assert (=> b!1301913 (=> (not res!864871) (not e!742574))))

(assert (=> b!1301913 (= res!864871 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42371 _keys!1741))))))

(declare-fun b!1301914 () Bool)

(declare-fun res!864873 () Bool)

(assert (=> b!1301914 (=> (not res!864873) (not e!742574))))

(declare-datatypes ((List!29760 0))(
  ( (Nil!29757) (Cons!29756 (h!30965 (_ BitVec 64)) (t!43338 List!29760)) )
))
(declare-fun arrayNoDuplicates!0 (array!86647 (_ BitVec 32) List!29760) Bool)

(assert (=> b!1301914 (= res!864873 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29757))))

(declare-fun b!1301915 () Bool)

(declare-fun res!864869 () Bool)

(assert (=> b!1301915 (=> (not res!864869) (not e!742574))))

(assert (=> b!1301915 (= res!864869 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741))))))

(assert (= (and start!109902 res!864870) b!1301904))

(assert (= (and b!1301904 res!864875) b!1301899))

(assert (= (and b!1301899 res!864867) b!1301914))

(assert (= (and b!1301914 res!864873) b!1301915))

(assert (= (and b!1301915 res!864869) b!1301908))

(assert (= (and b!1301908 res!864868) b!1301913))

(assert (= (and b!1301913 res!864871) b!1301903))

(assert (= (and b!1301903 res!864874) b!1301900))

(assert (= (and b!1301900 c!124864) b!1301905))

(assert (= (and b!1301900 (not c!124864)) b!1301911))

(assert (= (and b!1301911 c!124862) b!1301907))

(assert (= (and b!1301911 (not c!124862)) b!1301910))

(assert (= (and b!1301910 c!124863) b!1301898))

(assert (= (and b!1301910 (not c!124863)) b!1301901))

(assert (= (or b!1301907 b!1301898) bm!64021))

(assert (= (or b!1301907 b!1301898) bm!64020))

(assert (= (or b!1301907 b!1301898) bm!64023))

(assert (= (or b!1301905 bm!64021) bm!64022))

(assert (= (or b!1301905 bm!64020) bm!64024))

(assert (= (or b!1301905 bm!64023) bm!64025))

(assert (= (and b!1301900 (not res!864872)) b!1301912))

(assert (= (and b!1301906 condMapEmpty!53880) mapIsEmpty!53880))

(assert (= (and b!1301906 (not condMapEmpty!53880)) mapNonEmpty!53880))

(get-info :version)

(assert (= (and mapNonEmpty!53880 ((_ is ValueCellFull!16535) mapValue!53880)) b!1301902))

(assert (= (and b!1301906 ((_ is ValueCellFull!16535) mapDefault!53880)) b!1301909))

(assert (= start!109902 b!1301906))

(declare-fun m!1192297 () Bool)

(assert (=> b!1301903 m!1192297))

(assert (=> b!1301903 m!1192297))

(declare-fun m!1192299 () Bool)

(assert (=> b!1301903 m!1192299))

(declare-fun m!1192301 () Bool)

(assert (=> start!109902 m!1192301))

(declare-fun m!1192303 () Bool)

(assert (=> start!109902 m!1192303))

(declare-fun m!1192305 () Bool)

(assert (=> start!109902 m!1192305))

(declare-fun m!1192307 () Bool)

(assert (=> b!1301908 m!1192307))

(assert (=> b!1301908 m!1192307))

(declare-fun m!1192309 () Bool)

(assert (=> b!1301908 m!1192309))

(declare-fun m!1192311 () Bool)

(assert (=> bm!64024 m!1192311))

(declare-fun m!1192313 () Bool)

(assert (=> bm!64025 m!1192313))

(declare-fun m!1192315 () Bool)

(assert (=> mapNonEmpty!53880 m!1192315))

(declare-fun m!1192317 () Bool)

(assert (=> b!1301905 m!1192317))

(declare-fun m!1192319 () Bool)

(assert (=> b!1301905 m!1192319))

(declare-fun m!1192321 () Bool)

(assert (=> b!1301905 m!1192321))

(declare-fun m!1192323 () Bool)

(assert (=> bm!64022 m!1192323))

(declare-fun m!1192325 () Bool)

(assert (=> b!1301899 m!1192325))

(declare-fun m!1192327 () Bool)

(assert (=> b!1301914 m!1192327))

(assert (=> b!1301900 m!1192297))

(declare-fun m!1192329 () Bool)

(assert (=> b!1301900 m!1192329))

(declare-fun m!1192331 () Bool)

(assert (=> b!1301900 m!1192331))

(declare-fun m!1192333 () Bool)

(assert (=> b!1301912 m!1192333))

(check-sat (not bm!64022) (not bm!64025) (not mapNonEmpty!53880) tp_is_empty!34867 (not bm!64024) b_and!47345 (not b!1301903) (not b!1301899) (not b!1301912) (not start!109902) (not b!1301914) (not b!1301900) (not b!1301905) (not b_next!29227) (not b!1301908))
(check-sat b_and!47345 (not b_next!29227))
(get-model)

(declare-fun b!1302048 () Bool)

(declare-fun e!742655 () Bool)

(declare-fun e!742652 () Bool)

(assert (=> b!1302048 (= e!742655 e!742652)))

(assert (=> b!1302048 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun lt!582257 () ListLongMap!20301)

(declare-fun res!864941 () Bool)

(assert (=> b!1302048 (= res!864941 (contains!8223 lt!582257 (select (arr!41819 _keys!1741) from!2144)))))

(assert (=> b!1302048 (=> (not res!864941) (not e!742652))))

(declare-fun b!1302049 () Bool)

(declare-fun e!742651 () ListLongMap!20301)

(declare-fun e!742653 () ListLongMap!20301)

(assert (=> b!1302049 (= e!742651 e!742653)))

(declare-fun c!124891 () Bool)

(assert (=> b!1302049 (= c!124891 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun d!141285 () Bool)

(declare-fun e!742657 () Bool)

(assert (=> d!141285 e!742657))

(declare-fun res!864939 () Bool)

(assert (=> d!141285 (=> (not res!864939) (not e!742657))))

(assert (=> d!141285 (= res!864939 (not (contains!8223 lt!582257 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141285 (= lt!582257 e!742651)))

(declare-fun c!124892 () Bool)

(assert (=> d!141285 (= c!124892 (bvsge from!2144 (size!42371 _keys!1741)))))

(assert (=> d!141285 (validMask!0 mask!2175)))

(assert (=> d!141285 (= (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582257)))

(declare-fun b!1302050 () Bool)

(assert (=> b!1302050 (= e!742657 e!742655)))

(declare-fun c!124893 () Bool)

(declare-fun e!742656 () Bool)

(assert (=> b!1302050 (= c!124893 e!742656)))

(declare-fun res!864938 () Bool)

(assert (=> b!1302050 (=> (not res!864938) (not e!742656))))

(assert (=> b!1302050 (= res!864938 (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun b!1302051 () Bool)

(declare-fun lt!582259 () Unit!42941)

(declare-fun lt!582261 () Unit!42941)

(assert (=> b!1302051 (= lt!582259 lt!582261)))

(declare-fun lt!582256 () ListLongMap!20301)

(declare-fun lt!582258 () V!51593)

(declare-fun lt!582260 () (_ BitVec 64))

(declare-fun lt!582255 () (_ BitVec 64))

(assert (=> b!1302051 (not (contains!8223 (+!4503 lt!582256 (tuple2!22645 lt!582260 lt!582258)) lt!582255))))

(declare-fun addStillNotContains!457 (ListLongMap!20301 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!42941)

(assert (=> b!1302051 (= lt!582261 (addStillNotContains!457 lt!582256 lt!582260 lt!582258 lt!582255))))

(assert (=> b!1302051 (= lt!582255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21145 (ValueCell!16535 V!51593) V!51593)

(declare-fun dynLambda!3449 (Int (_ BitVec 64)) V!51593)

(assert (=> b!1302051 (= lt!582258 (get!21145 (select (arr!41820 _values!1445) from!2144) (dynLambda!3449 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302051 (= lt!582260 (select (arr!41819 _keys!1741) from!2144))))

(declare-fun call!64067 () ListLongMap!20301)

(assert (=> b!1302051 (= lt!582256 call!64067)))

(assert (=> b!1302051 (= e!742653 (+!4503 call!64067 (tuple2!22645 (select (arr!41819 _keys!1741) from!2144) (get!21145 (select (arr!41820 _values!1445) from!2144) (dynLambda!3449 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!64064 () Bool)

(assert (=> bm!64064 (= call!64067 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun e!742654 () Bool)

(declare-fun b!1302052 () Bool)

(assert (=> b!1302052 (= e!742654 (= lt!582257 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1302053 () Bool)

(assert (=> b!1302053 (= e!742655 e!742654)))

(declare-fun c!124894 () Bool)

(assert (=> b!1302053 (= c!124894 (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun b!1302054 () Bool)

(declare-fun res!864940 () Bool)

(assert (=> b!1302054 (=> (not res!864940) (not e!742657))))

(assert (=> b!1302054 (= res!864940 (not (contains!8223 lt!582257 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302055 () Bool)

(declare-fun isEmpty!1062 (ListLongMap!20301) Bool)

(assert (=> b!1302055 (= e!742654 (isEmpty!1062 lt!582257))))

(declare-fun b!1302056 () Bool)

(assert (=> b!1302056 (= e!742653 call!64067)))

(declare-fun b!1302057 () Bool)

(assert (=> b!1302057 (= e!742656 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(assert (=> b!1302057 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302058 () Bool)

(assert (=> b!1302058 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741)))))

(assert (=> b!1302058 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42372 _values!1445)))))

(declare-fun apply!1011 (ListLongMap!20301 (_ BitVec 64)) V!51593)

(assert (=> b!1302058 (= e!742652 (= (apply!1011 lt!582257 (select (arr!41819 _keys!1741) from!2144)) (get!21145 (select (arr!41820 _values!1445) from!2144) (dynLambda!3449 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1302059 () Bool)

(assert (=> b!1302059 (= e!742651 (ListLongMap!20302 Nil!29756))))

(assert (= (and d!141285 c!124892) b!1302059))

(assert (= (and d!141285 (not c!124892)) b!1302049))

(assert (= (and b!1302049 c!124891) b!1302051))

(assert (= (and b!1302049 (not c!124891)) b!1302056))

(assert (= (or b!1302051 b!1302056) bm!64064))

(assert (= (and d!141285 res!864939) b!1302054))

(assert (= (and b!1302054 res!864940) b!1302050))

(assert (= (and b!1302050 res!864938) b!1302057))

(assert (= (and b!1302050 c!124893) b!1302048))

(assert (= (and b!1302050 (not c!124893)) b!1302053))

(assert (= (and b!1302048 res!864941) b!1302058))

(assert (= (and b!1302053 c!124894) b!1302052))

(assert (= (and b!1302053 (not c!124894)) b!1302055))

(declare-fun b_lambda!23209 () Bool)

(assert (=> (not b_lambda!23209) (not b!1302051)))

(declare-fun t!43343 () Bool)

(declare-fun tb!11383 () Bool)

(assert (=> (and start!109902 (= defaultEntry!1448 defaultEntry!1448) t!43343) tb!11383))

(declare-fun result!23787 () Bool)

(assert (=> tb!11383 (= result!23787 tp_is_empty!34867)))

(assert (=> b!1302051 t!43343))

(declare-fun b_and!47351 () Bool)

(assert (= b_and!47345 (and (=> t!43343 result!23787) b_and!47351)))

(declare-fun b_lambda!23211 () Bool)

(assert (=> (not b_lambda!23211) (not b!1302058)))

(assert (=> b!1302058 t!43343))

(declare-fun b_and!47353 () Bool)

(assert (= b_and!47351 (and (=> t!43343 result!23787) b_and!47353)))

(declare-fun m!1192411 () Bool)

(assert (=> b!1302052 m!1192411))

(assert (=> b!1302057 m!1192297))

(assert (=> b!1302057 m!1192297))

(assert (=> b!1302057 m!1192299))

(assert (=> bm!64064 m!1192411))

(declare-fun m!1192413 () Bool)

(assert (=> b!1302054 m!1192413))

(declare-fun m!1192415 () Bool)

(assert (=> b!1302051 m!1192415))

(declare-fun m!1192417 () Bool)

(assert (=> b!1302051 m!1192417))

(declare-fun m!1192419 () Bool)

(assert (=> b!1302051 m!1192419))

(declare-fun m!1192421 () Bool)

(assert (=> b!1302051 m!1192421))

(assert (=> b!1302051 m!1192415))

(declare-fun m!1192423 () Bool)

(assert (=> b!1302051 m!1192423))

(assert (=> b!1302051 m!1192297))

(assert (=> b!1302051 m!1192419))

(declare-fun m!1192425 () Bool)

(assert (=> b!1302051 m!1192425))

(declare-fun m!1192427 () Bool)

(assert (=> b!1302051 m!1192427))

(assert (=> b!1302051 m!1192425))

(assert (=> b!1302048 m!1192297))

(assert (=> b!1302048 m!1192297))

(declare-fun m!1192429 () Bool)

(assert (=> b!1302048 m!1192429))

(assert (=> b!1302058 m!1192297))

(declare-fun m!1192431 () Bool)

(assert (=> b!1302058 m!1192431))

(assert (=> b!1302058 m!1192419))

(assert (=> b!1302058 m!1192297))

(assert (=> b!1302058 m!1192419))

(assert (=> b!1302058 m!1192425))

(assert (=> b!1302058 m!1192427))

(assert (=> b!1302058 m!1192425))

(assert (=> b!1302049 m!1192297))

(assert (=> b!1302049 m!1192297))

(assert (=> b!1302049 m!1192299))

(declare-fun m!1192433 () Bool)

(assert (=> b!1302055 m!1192433))

(declare-fun m!1192435 () Bool)

(assert (=> d!141285 m!1192435))

(assert (=> d!141285 m!1192301))

(assert (=> bm!64022 d!141285))

(declare-fun d!141287 () Bool)

(declare-fun e!742663 () Bool)

(assert (=> d!141287 e!742663))

(declare-fun res!864944 () Bool)

(assert (=> d!141287 (=> res!864944 e!742663)))

(declare-fun lt!582273 () Bool)

(assert (=> d!141287 (= res!864944 (not lt!582273))))

(declare-fun lt!582270 () Bool)

(assert (=> d!141287 (= lt!582273 lt!582270)))

(declare-fun lt!582272 () Unit!42941)

(declare-fun e!742662 () Unit!42941)

(assert (=> d!141287 (= lt!582272 e!742662)))

(declare-fun c!124897 () Bool)

(assert (=> d!141287 (= c!124897 lt!582270)))

(declare-fun containsKey!721 (List!29759 (_ BitVec 64)) Bool)

(assert (=> d!141287 (= lt!582270 (containsKey!721 (toList!10166 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172))) k0!1205))))

(assert (=> d!141287 (= (contains!8223 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172)) k0!1205) lt!582273)))

(declare-fun b!1302068 () Bool)

(declare-fun lt!582271 () Unit!42941)

(assert (=> b!1302068 (= e!742662 lt!582271)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!468 (List!29759 (_ BitVec 64)) Unit!42941)

(assert (=> b!1302068 (= lt!582271 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10166 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172))) k0!1205))))

(declare-datatypes ((Option!755 0))(
  ( (Some!754 (v!20121 V!51593)) (None!753) )
))
(declare-fun isDefined!511 (Option!755) Bool)

(declare-fun getValueByKey!704 (List!29759 (_ BitVec 64)) Option!755)

(assert (=> b!1302068 (isDefined!511 (getValueByKey!704 (toList!10166 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172))) k0!1205))))

(declare-fun b!1302069 () Bool)

(declare-fun Unit!42949 () Unit!42941)

(assert (=> b!1302069 (= e!742662 Unit!42949)))

(declare-fun b!1302070 () Bool)

(assert (=> b!1302070 (= e!742663 (isDefined!511 (getValueByKey!704 (toList!10166 (ite c!124864 lt!582173 (ite c!124862 lt!582166 lt!582172))) k0!1205)))))

(assert (= (and d!141287 c!124897) b!1302068))

(assert (= (and d!141287 (not c!124897)) b!1302069))

(assert (= (and d!141287 (not res!864944)) b!1302070))

(declare-fun m!1192437 () Bool)

(assert (=> d!141287 m!1192437))

(declare-fun m!1192439 () Bool)

(assert (=> b!1302068 m!1192439))

(declare-fun m!1192441 () Bool)

(assert (=> b!1302068 m!1192441))

(assert (=> b!1302068 m!1192441))

(declare-fun m!1192443 () Bool)

(assert (=> b!1302068 m!1192443))

(assert (=> b!1302070 m!1192441))

(assert (=> b!1302070 m!1192441))

(assert (=> b!1302070 m!1192443))

(assert (=> bm!64025 d!141287))

(declare-fun b!1302081 () Bool)

(declare-fun e!742674 () Bool)

(declare-fun call!64070 () Bool)

(assert (=> b!1302081 (= e!742674 call!64070)))

(declare-fun bm!64067 () Bool)

(declare-fun c!124900 () Bool)

(assert (=> bm!64067 (= call!64070 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124900 (Cons!29756 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000) Nil!29757) Nil!29757)))))

(declare-fun b!1302082 () Bool)

(declare-fun e!742673 () Bool)

(declare-fun contains!8225 (List!29760 (_ BitVec 64)) Bool)

(assert (=> b!1302082 (= e!742673 (contains!8225 Nil!29757 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302083 () Bool)

(assert (=> b!1302083 (= e!742674 call!64070)))

(declare-fun d!141289 () Bool)

(declare-fun res!864953 () Bool)

(declare-fun e!742675 () Bool)

(assert (=> d!141289 (=> res!864953 e!742675)))

(assert (=> d!141289 (= res!864953 (bvsge #b00000000000000000000000000000000 (size!42371 _keys!1741)))))

(assert (=> d!141289 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29757) e!742675)))

(declare-fun b!1302084 () Bool)

(declare-fun e!742672 () Bool)

(assert (=> b!1302084 (= e!742672 e!742674)))

(assert (=> b!1302084 (= c!124900 (validKeyInArray!0 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302085 () Bool)

(assert (=> b!1302085 (= e!742675 e!742672)))

(declare-fun res!864951 () Bool)

(assert (=> b!1302085 (=> (not res!864951) (not e!742672))))

(assert (=> b!1302085 (= res!864951 (not e!742673))))

(declare-fun res!864952 () Bool)

(assert (=> b!1302085 (=> (not res!864952) (not e!742673))))

(assert (=> b!1302085 (= res!864952 (validKeyInArray!0 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141289 (not res!864953)) b!1302085))

(assert (= (and b!1302085 res!864952) b!1302082))

(assert (= (and b!1302085 res!864951) b!1302084))

(assert (= (and b!1302084 c!124900) b!1302083))

(assert (= (and b!1302084 (not c!124900)) b!1302081))

(assert (= (or b!1302083 b!1302081) bm!64067))

(declare-fun m!1192445 () Bool)

(assert (=> bm!64067 m!1192445))

(declare-fun m!1192447 () Bool)

(assert (=> bm!64067 m!1192447))

(assert (=> b!1302082 m!1192445))

(assert (=> b!1302082 m!1192445))

(declare-fun m!1192449 () Bool)

(assert (=> b!1302082 m!1192449))

(assert (=> b!1302084 m!1192445))

(assert (=> b!1302084 m!1192445))

(declare-fun m!1192451 () Bool)

(assert (=> b!1302084 m!1192451))

(assert (=> b!1302085 m!1192445))

(assert (=> b!1302085 m!1192445))

(assert (=> b!1302085 m!1192451))

(assert (=> b!1301914 d!141289))

(declare-fun d!141291 () Bool)

(declare-fun res!864958 () Bool)

(declare-fun e!742680 () Bool)

(assert (=> d!141291 (=> res!864958 e!742680)))

(assert (=> d!141291 (= res!864958 (= (select (arr!41819 _keys!1741) from!2144) k0!1205))))

(assert (=> d!141291 (= (arrayContainsKey!0 _keys!1741 k0!1205 from!2144) e!742680)))

(declare-fun b!1302090 () Bool)

(declare-fun e!742681 () Bool)

(assert (=> b!1302090 (= e!742680 e!742681)))

(declare-fun res!864959 () Bool)

(assert (=> b!1302090 (=> (not res!864959) (not e!742681))))

(assert (=> b!1302090 (= res!864959 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42371 _keys!1741)))))

(declare-fun b!1302091 () Bool)

(assert (=> b!1302091 (= e!742681 (arrayContainsKey!0 _keys!1741 k0!1205 (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (= (and d!141291 (not res!864958)) b!1302090))

(assert (= (and b!1302090 res!864959) b!1302091))

(assert (=> d!141291 m!1192297))

(declare-fun m!1192453 () Bool)

(assert (=> b!1302091 m!1192453))

(assert (=> b!1301912 d!141291))

(declare-fun d!141293 () Bool)

(assert (=> d!141293 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109902 d!141293))

(declare-fun d!141295 () Bool)

(assert (=> d!141295 (= (array_inv!31809 _values!1445) (bvsge (size!42372 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109902 d!141295))

(declare-fun d!141297 () Bool)

(assert (=> d!141297 (= (array_inv!31810 _keys!1741) (bvsge (size!42371 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109902 d!141297))

(declare-fun d!141299 () Bool)

(assert (=> d!141299 (contains!8223 (ite c!124864 lt!582171 (ite c!124862 lt!582166 lt!582172)) k0!1205)))

(declare-fun lt!582276 () Unit!42941)

(declare-fun choose!1919 ((_ BitVec 64) (_ BitVec 64) V!51593 ListLongMap!20301) Unit!42941)

(assert (=> d!141299 (= lt!582276 (choose!1919 k0!1205 (ite (or c!124864 c!124862) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124864 c!124862) zeroValue!1387 minValue!1387) (ite c!124864 lt!582171 (ite c!124862 lt!582166 lt!582172))))))

(assert (=> d!141299 (contains!8223 (+!4503 (ite c!124864 lt!582171 (ite c!124862 lt!582166 lt!582172)) (tuple2!22645 (ite (or c!124864 c!124862) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124864 c!124862) zeroValue!1387 minValue!1387))) k0!1205)))

(assert (=> d!141299 (= (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 (ite (or c!124864 c!124862) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124864 c!124862) zeroValue!1387 minValue!1387) (ite c!124864 lt!582171 (ite c!124862 lt!582166 lt!582172))) lt!582276)))

(declare-fun bs!37053 () Bool)

(assert (= bs!37053 d!141299))

(declare-fun m!1192455 () Bool)

(assert (=> bs!37053 m!1192455))

(declare-fun m!1192457 () Bool)

(assert (=> bs!37053 m!1192457))

(declare-fun m!1192459 () Bool)

(assert (=> bs!37053 m!1192459))

(assert (=> bs!37053 m!1192459))

(declare-fun m!1192461 () Bool)

(assert (=> bs!37053 m!1192461))

(assert (=> bm!64024 d!141299))

(declare-fun d!141301 () Bool)

(declare-fun e!742684 () Bool)

(assert (=> d!141301 e!742684))

(declare-fun res!864965 () Bool)

(assert (=> d!141301 (=> (not res!864965) (not e!742684))))

(declare-fun lt!582288 () ListLongMap!20301)

(assert (=> d!141301 (= res!864965 (contains!8223 lt!582288 (_1!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582287 () List!29759)

(assert (=> d!141301 (= lt!582288 (ListLongMap!20302 lt!582287))))

(declare-fun lt!582286 () Unit!42941)

(declare-fun lt!582285 () Unit!42941)

(assert (=> d!141301 (= lt!582286 lt!582285)))

(assert (=> d!141301 (= (getValueByKey!704 lt!582287 (_1!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!754 (_2!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!348 (List!29759 (_ BitVec 64) V!51593) Unit!42941)

(assert (=> d!141301 (= lt!582285 (lemmaContainsTupThenGetReturnValue!348 lt!582287 (_1!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!477 (List!29759 (_ BitVec 64) V!51593) List!29759)

(assert (=> d!141301 (= lt!582287 (insertStrictlySorted!477 (toList!10166 lt!582171) (_1!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141301 (= (+!4503 lt!582171 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582288)))

(declare-fun b!1302096 () Bool)

(declare-fun res!864964 () Bool)

(assert (=> b!1302096 (=> (not res!864964) (not e!742684))))

(assert (=> b!1302096 (= res!864964 (= (getValueByKey!704 (toList!10166 lt!582288) (_1!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!754 (_2!11333 (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1302097 () Bool)

(declare-fun contains!8226 (List!29759 tuple2!22644) Bool)

(assert (=> b!1302097 (= e!742684 (contains!8226 (toList!10166 lt!582288) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141301 res!864965) b!1302096))

(assert (= (and b!1302096 res!864964) b!1302097))

(declare-fun m!1192463 () Bool)

(assert (=> d!141301 m!1192463))

(declare-fun m!1192465 () Bool)

(assert (=> d!141301 m!1192465))

(declare-fun m!1192467 () Bool)

(assert (=> d!141301 m!1192467))

(declare-fun m!1192469 () Bool)

(assert (=> d!141301 m!1192469))

(declare-fun m!1192471 () Bool)

(assert (=> b!1302096 m!1192471))

(declare-fun m!1192473 () Bool)

(assert (=> b!1302097 m!1192473))

(assert (=> b!1301905 d!141301))

(declare-fun d!141303 () Bool)

(assert (=> d!141303 (contains!8223 lt!582173 k0!1205)))

(declare-fun lt!582289 () Unit!42941)

(assert (=> d!141303 (= lt!582289 (choose!1919 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582173))))

(assert (=> d!141303 (contains!8223 (+!4503 lt!582173 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))

(assert (=> d!141303 (= (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582173) lt!582289)))

(declare-fun bs!37054 () Bool)

(assert (= bs!37054 d!141303))

(declare-fun m!1192475 () Bool)

(assert (=> bs!37054 m!1192475))

(declare-fun m!1192477 () Bool)

(assert (=> bs!37054 m!1192477))

(declare-fun m!1192479 () Bool)

(assert (=> bs!37054 m!1192479))

(assert (=> bs!37054 m!1192479))

(declare-fun m!1192481 () Bool)

(assert (=> bs!37054 m!1192481))

(assert (=> b!1301905 d!141303))

(declare-fun d!141305 () Bool)

(declare-fun e!742686 () Bool)

(assert (=> d!141305 e!742686))

(declare-fun res!864966 () Bool)

(assert (=> d!141305 (=> res!864966 e!742686)))

(declare-fun lt!582293 () Bool)

(assert (=> d!141305 (= res!864966 (not lt!582293))))

(declare-fun lt!582290 () Bool)

(assert (=> d!141305 (= lt!582293 lt!582290)))

(declare-fun lt!582292 () Unit!42941)

(declare-fun e!742685 () Unit!42941)

(assert (=> d!141305 (= lt!582292 e!742685)))

(declare-fun c!124901 () Bool)

(assert (=> d!141305 (= c!124901 lt!582290)))

(assert (=> d!141305 (= lt!582290 (containsKey!721 (toList!10166 lt!582171) k0!1205))))

(assert (=> d!141305 (= (contains!8223 lt!582171 k0!1205) lt!582293)))

(declare-fun b!1302098 () Bool)

(declare-fun lt!582291 () Unit!42941)

(assert (=> b!1302098 (= e!742685 lt!582291)))

(assert (=> b!1302098 (= lt!582291 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10166 lt!582171) k0!1205))))

(assert (=> b!1302098 (isDefined!511 (getValueByKey!704 (toList!10166 lt!582171) k0!1205))))

(declare-fun b!1302099 () Bool)

(declare-fun Unit!42950 () Unit!42941)

(assert (=> b!1302099 (= e!742685 Unit!42950)))

(declare-fun b!1302100 () Bool)

(assert (=> b!1302100 (= e!742686 (isDefined!511 (getValueByKey!704 (toList!10166 lt!582171) k0!1205)))))

(assert (= (and d!141305 c!124901) b!1302098))

(assert (= (and d!141305 (not c!124901)) b!1302099))

(assert (= (and d!141305 (not res!864966)) b!1302100))

(declare-fun m!1192483 () Bool)

(assert (=> d!141305 m!1192483))

(declare-fun m!1192485 () Bool)

(assert (=> b!1302098 m!1192485))

(declare-fun m!1192487 () Bool)

(assert (=> b!1302098 m!1192487))

(assert (=> b!1302098 m!1192487))

(declare-fun m!1192489 () Bool)

(assert (=> b!1302098 m!1192489))

(assert (=> b!1302100 m!1192487))

(assert (=> b!1302100 m!1192487))

(assert (=> b!1302100 m!1192489))

(assert (=> b!1301905 d!141305))

(declare-fun d!141307 () Bool)

(assert (=> d!141307 (= (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)) (and (not (= (select (arr!41819 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41819 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301903 d!141307))

(declare-fun d!141309 () Bool)

(declare-fun e!742688 () Bool)

(assert (=> d!141309 e!742688))

(declare-fun res!864967 () Bool)

(assert (=> d!141309 (=> res!864967 e!742688)))

(declare-fun lt!582297 () Bool)

(assert (=> d!141309 (= res!864967 (not lt!582297))))

(declare-fun lt!582294 () Bool)

(assert (=> d!141309 (= lt!582297 lt!582294)))

(declare-fun lt!582296 () Unit!42941)

(declare-fun e!742687 () Unit!42941)

(assert (=> d!141309 (= lt!582296 e!742687)))

(declare-fun c!124902 () Bool)

(assert (=> d!141309 (= c!124902 lt!582294)))

(assert (=> d!141309 (= lt!582294 (containsKey!721 (toList!10166 (ListLongMap!20302 Nil!29756)) k0!1205))))

(assert (=> d!141309 (= (contains!8223 (ListLongMap!20302 Nil!29756) k0!1205) lt!582297)))

(declare-fun b!1302101 () Bool)

(declare-fun lt!582295 () Unit!42941)

(assert (=> b!1302101 (= e!742687 lt!582295)))

(assert (=> b!1302101 (= lt!582295 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10166 (ListLongMap!20302 Nil!29756)) k0!1205))))

(assert (=> b!1302101 (isDefined!511 (getValueByKey!704 (toList!10166 (ListLongMap!20302 Nil!29756)) k0!1205))))

(declare-fun b!1302102 () Bool)

(declare-fun Unit!42951 () Unit!42941)

(assert (=> b!1302102 (= e!742687 Unit!42951)))

(declare-fun b!1302103 () Bool)

(assert (=> b!1302103 (= e!742688 (isDefined!511 (getValueByKey!704 (toList!10166 (ListLongMap!20302 Nil!29756)) k0!1205)))))

(assert (= (and d!141309 c!124902) b!1302101))

(assert (= (and d!141309 (not c!124902)) b!1302102))

(assert (= (and d!141309 (not res!864967)) b!1302103))

(declare-fun m!1192491 () Bool)

(assert (=> d!141309 m!1192491))

(declare-fun m!1192493 () Bool)

(assert (=> b!1302101 m!1192493))

(declare-fun m!1192495 () Bool)

(assert (=> b!1302101 m!1192495))

(assert (=> b!1302101 m!1192495))

(declare-fun m!1192497 () Bool)

(assert (=> b!1302101 m!1192497))

(assert (=> b!1302103 m!1192495))

(assert (=> b!1302103 m!1192495))

(assert (=> b!1302103 m!1192497))

(assert (=> b!1301900 d!141309))

(declare-fun d!141311 () Bool)

(assert (=> d!141311 (not (contains!8223 (ListLongMap!20302 Nil!29756) k0!1205))))

(declare-fun lt!582300 () Unit!42941)

(declare-fun choose!1920 ((_ BitVec 64)) Unit!42941)

(assert (=> d!141311 (= lt!582300 (choose!1920 k0!1205))))

(assert (=> d!141311 (= (emptyContainsNothing!200 k0!1205) lt!582300)))

(declare-fun bs!37055 () Bool)

(assert (= bs!37055 d!141311))

(assert (=> bs!37055 m!1192329))

(declare-fun m!1192499 () Bool)

(assert (=> bs!37055 m!1192499))

(assert (=> b!1301900 d!141311))

(declare-fun bm!64070 () Bool)

(declare-fun call!64073 () Bool)

(assert (=> bm!64070 (= call!64073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1302112 () Bool)

(declare-fun e!742696 () Bool)

(assert (=> b!1302112 (= e!742696 call!64073)))

(declare-fun b!1302113 () Bool)

(declare-fun e!742695 () Bool)

(assert (=> b!1302113 (= e!742695 e!742696)))

(declare-fun c!124905 () Bool)

(assert (=> b!1302113 (= c!124905 (validKeyInArray!0 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302114 () Bool)

(declare-fun e!742697 () Bool)

(assert (=> b!1302114 (= e!742697 call!64073)))

(declare-fun d!141313 () Bool)

(declare-fun res!864972 () Bool)

(assert (=> d!141313 (=> res!864972 e!742695)))

(assert (=> d!141313 (= res!864972 (bvsge #b00000000000000000000000000000000 (size!42371 _keys!1741)))))

(assert (=> d!141313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742695)))

(declare-fun b!1302115 () Bool)

(assert (=> b!1302115 (= e!742696 e!742697)))

(declare-fun lt!582307 () (_ BitVec 64))

(assert (=> b!1302115 (= lt!582307 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582308 () Unit!42941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86647 (_ BitVec 64) (_ BitVec 32)) Unit!42941)

(assert (=> b!1302115 (= lt!582308 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582307 #b00000000000000000000000000000000))))

(assert (=> b!1302115 (arrayContainsKey!0 _keys!1741 lt!582307 #b00000000000000000000000000000000)))

(declare-fun lt!582309 () Unit!42941)

(assert (=> b!1302115 (= lt!582309 lt!582308)))

(declare-fun res!864973 () Bool)

(declare-datatypes ((SeekEntryResult!10020 0))(
  ( (MissingZero!10020 (index!42451 (_ BitVec 32))) (Found!10020 (index!42452 (_ BitVec 32))) (Intermediate!10020 (undefined!10832 Bool) (index!42453 (_ BitVec 32)) (x!115647 (_ BitVec 32))) (Undefined!10020) (MissingVacant!10020 (index!42454 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86647 (_ BitVec 32)) SeekEntryResult!10020)

(assert (=> b!1302115 (= res!864973 (= (seekEntryOrOpen!0 (select (arr!41819 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10020 #b00000000000000000000000000000000)))))

(assert (=> b!1302115 (=> (not res!864973) (not e!742697))))

(assert (= (and d!141313 (not res!864972)) b!1302113))

(assert (= (and b!1302113 c!124905) b!1302115))

(assert (= (and b!1302113 (not c!124905)) b!1302112))

(assert (= (and b!1302115 res!864973) b!1302114))

(assert (= (or b!1302114 b!1302112) bm!64070))

(declare-fun m!1192501 () Bool)

(assert (=> bm!64070 m!1192501))

(assert (=> b!1302113 m!1192445))

(assert (=> b!1302113 m!1192445))

(assert (=> b!1302113 m!1192451))

(assert (=> b!1302115 m!1192445))

(declare-fun m!1192503 () Bool)

(assert (=> b!1302115 m!1192503))

(declare-fun m!1192505 () Bool)

(assert (=> b!1302115 m!1192505))

(assert (=> b!1302115 m!1192445))

(declare-fun m!1192507 () Bool)

(assert (=> b!1302115 m!1192507))

(assert (=> b!1301899 d!141313))

(declare-fun d!141315 () Bool)

(declare-fun e!742699 () Bool)

(assert (=> d!141315 e!742699))

(declare-fun res!864974 () Bool)

(assert (=> d!141315 (=> res!864974 e!742699)))

(declare-fun lt!582313 () Bool)

(assert (=> d!141315 (= res!864974 (not lt!582313))))

(declare-fun lt!582310 () Bool)

(assert (=> d!141315 (= lt!582313 lt!582310)))

(declare-fun lt!582312 () Unit!42941)

(declare-fun e!742698 () Unit!42941)

(assert (=> d!141315 (= lt!582312 e!742698)))

(declare-fun c!124906 () Bool)

(assert (=> d!141315 (= c!124906 lt!582310)))

(assert (=> d!141315 (= lt!582310 (containsKey!721 (toList!10166 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141315 (= (contains!8223 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582313)))

(declare-fun b!1302116 () Bool)

(declare-fun lt!582311 () Unit!42941)

(assert (=> b!1302116 (= e!742698 lt!582311)))

(assert (=> b!1302116 (= lt!582311 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10166 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302116 (isDefined!511 (getValueByKey!704 (toList!10166 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302117 () Bool)

(declare-fun Unit!42952 () Unit!42941)

(assert (=> b!1302117 (= e!742698 Unit!42952)))

(declare-fun b!1302118 () Bool)

(assert (=> b!1302118 (= e!742699 (isDefined!511 (getValueByKey!704 (toList!10166 (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141315 c!124906) b!1302116))

(assert (= (and d!141315 (not c!124906)) b!1302117))

(assert (= (and d!141315 (not res!864974)) b!1302118))

(declare-fun m!1192509 () Bool)

(assert (=> d!141315 m!1192509))

(declare-fun m!1192511 () Bool)

(assert (=> b!1302116 m!1192511))

(declare-fun m!1192513 () Bool)

(assert (=> b!1302116 m!1192513))

(assert (=> b!1302116 m!1192513))

(declare-fun m!1192515 () Bool)

(assert (=> b!1302116 m!1192515))

(assert (=> b!1302118 m!1192513))

(assert (=> b!1302118 m!1192513))

(assert (=> b!1302118 m!1192515))

(assert (=> b!1301908 d!141315))

(declare-fun b!1302161 () Bool)

(declare-fun e!742738 () Bool)

(assert (=> b!1302161 (= e!742738 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun call!64093 () ListLongMap!20301)

(declare-fun bm!64085 () Bool)

(assert (=> bm!64085 (= call!64093 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64086 () Bool)

(declare-fun call!64092 () ListLongMap!20301)

(declare-fun call!64089 () ListLongMap!20301)

(assert (=> bm!64086 (= call!64092 call!64089)))

(declare-fun call!64088 () ListLongMap!20301)

(declare-fun c!124922 () Bool)

(declare-fun bm!64087 () Bool)

(declare-fun c!124923 () Bool)

(assert (=> bm!64087 (= call!64088 (+!4503 (ite c!124922 call!64093 (ite c!124923 call!64089 call!64092)) (ite (or c!124922 c!124923) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1302162 () Bool)

(declare-fun e!742727 () Bool)

(declare-fun lt!582378 () ListLongMap!20301)

(assert (=> b!1302162 (= e!742727 (= (apply!1011 lt!582378 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1302163 () Bool)

(declare-fun e!742728 () Bool)

(assert (=> b!1302163 (= e!742728 e!742727)))

(declare-fun res!864994 () Bool)

(declare-fun call!64090 () Bool)

(assert (=> b!1302163 (= res!864994 call!64090)))

(assert (=> b!1302163 (=> (not res!864994) (not e!742727))))

(declare-fun bm!64088 () Bool)

(assert (=> bm!64088 (= call!64089 call!64093)))

(declare-fun b!1302164 () Bool)

(declare-fun e!742737 () Bool)

(declare-fun e!742734 () Bool)

(assert (=> b!1302164 (= e!742737 e!742734)))

(declare-fun c!124920 () Bool)

(assert (=> b!1302164 (= c!124920 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302165 () Bool)

(declare-fun e!742730 () Bool)

(assert (=> b!1302165 (= e!742734 e!742730)))

(declare-fun res!864999 () Bool)

(declare-fun call!64094 () Bool)

(assert (=> b!1302165 (= res!864999 call!64094)))

(assert (=> b!1302165 (=> (not res!864999) (not e!742730))))

(declare-fun bm!64089 () Bool)

(declare-fun call!64091 () ListLongMap!20301)

(assert (=> bm!64089 (= call!64091 call!64088)))

(declare-fun b!1302167 () Bool)

(declare-fun e!742735 () ListLongMap!20301)

(assert (=> b!1302167 (= e!742735 call!64091)))

(declare-fun b!1302168 () Bool)

(declare-fun res!865000 () Bool)

(assert (=> b!1302168 (=> (not res!865000) (not e!742737))))

(declare-fun e!742736 () Bool)

(assert (=> b!1302168 (= res!865000 e!742736)))

(declare-fun res!864996 () Bool)

(assert (=> b!1302168 (=> res!864996 e!742736)))

(assert (=> b!1302168 (= res!864996 (not e!742738))))

(declare-fun res!864993 () Bool)

(assert (=> b!1302168 (=> (not res!864993) (not e!742738))))

(assert (=> b!1302168 (= res!864993 (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun bm!64090 () Bool)

(assert (=> bm!64090 (= call!64094 (contains!8223 lt!582378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302169 () Bool)

(declare-fun e!742732 () Unit!42941)

(declare-fun Unit!42953 () Unit!42941)

(assert (=> b!1302169 (= e!742732 Unit!42953)))

(declare-fun b!1302170 () Bool)

(assert (=> b!1302170 (= e!742734 (not call!64094))))

(declare-fun b!1302171 () Bool)

(declare-fun lt!582360 () Unit!42941)

(assert (=> b!1302171 (= e!742732 lt!582360)))

(declare-fun lt!582364 () ListLongMap!20301)

(assert (=> b!1302171 (= lt!582364 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582367 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582359 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582359 (select (arr!41819 _keys!1741) from!2144))))

(declare-fun lt!582365 () Unit!42941)

(declare-fun addStillContains!1106 (ListLongMap!20301 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!42941)

(assert (=> b!1302171 (= lt!582365 (addStillContains!1106 lt!582364 lt!582367 zeroValue!1387 lt!582359))))

(assert (=> b!1302171 (contains!8223 (+!4503 lt!582364 (tuple2!22645 lt!582367 zeroValue!1387)) lt!582359)))

(declare-fun lt!582368 () Unit!42941)

(assert (=> b!1302171 (= lt!582368 lt!582365)))

(declare-fun lt!582372 () ListLongMap!20301)

(assert (=> b!1302171 (= lt!582372 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582370 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582370 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582379 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582379 (select (arr!41819 _keys!1741) from!2144))))

(declare-fun lt!582374 () Unit!42941)

(declare-fun addApplyDifferent!549 (ListLongMap!20301 (_ BitVec 64) V!51593 (_ BitVec 64)) Unit!42941)

(assert (=> b!1302171 (= lt!582374 (addApplyDifferent!549 lt!582372 lt!582370 minValue!1387 lt!582379))))

(assert (=> b!1302171 (= (apply!1011 (+!4503 lt!582372 (tuple2!22645 lt!582370 minValue!1387)) lt!582379) (apply!1011 lt!582372 lt!582379))))

(declare-fun lt!582373 () Unit!42941)

(assert (=> b!1302171 (= lt!582373 lt!582374)))

(declare-fun lt!582375 () ListLongMap!20301)

(assert (=> b!1302171 (= lt!582375 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582376 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582371 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582371 (select (arr!41819 _keys!1741) from!2144))))

(declare-fun lt!582369 () Unit!42941)

(assert (=> b!1302171 (= lt!582369 (addApplyDifferent!549 lt!582375 lt!582376 zeroValue!1387 lt!582371))))

(assert (=> b!1302171 (= (apply!1011 (+!4503 lt!582375 (tuple2!22645 lt!582376 zeroValue!1387)) lt!582371) (apply!1011 lt!582375 lt!582371))))

(declare-fun lt!582362 () Unit!42941)

(assert (=> b!1302171 (= lt!582362 lt!582369)))

(declare-fun lt!582377 () ListLongMap!20301)

(assert (=> b!1302171 (= lt!582377 (getCurrentListMapNoExtraKeys!6135 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582358 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582358 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582366 () (_ BitVec 64))

(assert (=> b!1302171 (= lt!582366 (select (arr!41819 _keys!1741) from!2144))))

(assert (=> b!1302171 (= lt!582360 (addApplyDifferent!549 lt!582377 lt!582358 minValue!1387 lt!582366))))

(assert (=> b!1302171 (= (apply!1011 (+!4503 lt!582377 (tuple2!22645 lt!582358 minValue!1387)) lt!582366) (apply!1011 lt!582377 lt!582366))))

(declare-fun b!1302172 () Bool)

(declare-fun e!742726 () ListLongMap!20301)

(assert (=> b!1302172 (= e!742726 (+!4503 call!64088 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1302173 () Bool)

(declare-fun res!864998 () Bool)

(assert (=> b!1302173 (=> (not res!864998) (not e!742737))))

(assert (=> b!1302173 (= res!864998 e!742728)))

(declare-fun c!124924 () Bool)

(assert (=> b!1302173 (= c!124924 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1302174 () Bool)

(declare-fun e!742729 () Bool)

(assert (=> b!1302174 (= e!742729 (validKeyInArray!0 (select (arr!41819 _keys!1741) from!2144)))))

(declare-fun bm!64091 () Bool)

(assert (=> bm!64091 (= call!64090 (contains!8223 lt!582378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302175 () Bool)

(declare-fun e!742731 () Bool)

(assert (=> b!1302175 (= e!742736 e!742731)))

(declare-fun res!865001 () Bool)

(assert (=> b!1302175 (=> (not res!865001) (not e!742731))))

(assert (=> b!1302175 (= res!865001 (contains!8223 lt!582378 (select (arr!41819 _keys!1741) from!2144)))))

(assert (=> b!1302175 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun b!1302176 () Bool)

(assert (=> b!1302176 (= e!742730 (= (apply!1011 lt!582378 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1302166 () Bool)

(assert (=> b!1302166 (= e!742726 e!742735)))

(assert (=> b!1302166 (= c!124923 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141317 () Bool)

(assert (=> d!141317 e!742737))

(declare-fun res!864997 () Bool)

(assert (=> d!141317 (=> (not res!864997) (not e!742737))))

(assert (=> d!141317 (= res!864997 (or (bvsge from!2144 (size!42371 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741)))))))

(declare-fun lt!582361 () ListLongMap!20301)

(assert (=> d!141317 (= lt!582378 lt!582361)))

(declare-fun lt!582363 () Unit!42941)

(assert (=> d!141317 (= lt!582363 e!742732)))

(declare-fun c!124921 () Bool)

(assert (=> d!141317 (= c!124921 e!742729)))

(declare-fun res!864995 () Bool)

(assert (=> d!141317 (=> (not res!864995) (not e!742729))))

(assert (=> d!141317 (= res!864995 (bvslt from!2144 (size!42371 _keys!1741)))))

(assert (=> d!141317 (= lt!582361 e!742726)))

(assert (=> d!141317 (= c!124922 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141317 (validMask!0 mask!2175)))

(assert (=> d!141317 (= (getCurrentListMap!5074 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582378)))

(declare-fun b!1302177 () Bool)

(declare-fun e!742733 () ListLongMap!20301)

(assert (=> b!1302177 (= e!742733 call!64091)))

(declare-fun b!1302178 () Bool)

(declare-fun c!124919 () Bool)

(assert (=> b!1302178 (= c!124919 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302178 (= e!742735 e!742733)))

(declare-fun b!1302179 () Bool)

(assert (=> b!1302179 (= e!742728 (not call!64090))))

(declare-fun b!1302180 () Bool)

(assert (=> b!1302180 (= e!742731 (= (apply!1011 lt!582378 (select (arr!41819 _keys!1741) from!2144)) (get!21145 (select (arr!41820 _values!1445) from!2144) (dynLambda!3449 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302180 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42372 _values!1445)))))

(assert (=> b!1302180 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42371 _keys!1741)))))

(declare-fun b!1302181 () Bool)

(assert (=> b!1302181 (= e!742733 call!64092)))

(assert (= (and d!141317 c!124922) b!1302172))

(assert (= (and d!141317 (not c!124922)) b!1302166))

(assert (= (and b!1302166 c!124923) b!1302167))

(assert (= (and b!1302166 (not c!124923)) b!1302178))

(assert (= (and b!1302178 c!124919) b!1302177))

(assert (= (and b!1302178 (not c!124919)) b!1302181))

(assert (= (or b!1302177 b!1302181) bm!64086))

(assert (= (or b!1302167 bm!64086) bm!64088))

(assert (= (or b!1302167 b!1302177) bm!64089))

(assert (= (or b!1302172 bm!64088) bm!64085))

(assert (= (or b!1302172 bm!64089) bm!64087))

(assert (= (and d!141317 res!864995) b!1302174))

(assert (= (and d!141317 c!124921) b!1302171))

(assert (= (and d!141317 (not c!124921)) b!1302169))

(assert (= (and d!141317 res!864997) b!1302168))

(assert (= (and b!1302168 res!864993) b!1302161))

(assert (= (and b!1302168 (not res!864996)) b!1302175))

(assert (= (and b!1302175 res!865001) b!1302180))

(assert (= (and b!1302168 res!865000) b!1302173))

(assert (= (and b!1302173 c!124924) b!1302163))

(assert (= (and b!1302173 (not c!124924)) b!1302179))

(assert (= (and b!1302163 res!864994) b!1302162))

(assert (= (or b!1302163 b!1302179) bm!64091))

(assert (= (and b!1302173 res!864998) b!1302164))

(assert (= (and b!1302164 c!124920) b!1302165))

(assert (= (and b!1302164 (not c!124920)) b!1302170))

(assert (= (and b!1302165 res!864999) b!1302176))

(assert (= (or b!1302165 b!1302170) bm!64090))

(declare-fun b_lambda!23213 () Bool)

(assert (=> (not b_lambda!23213) (not b!1302180)))

(assert (=> b!1302180 t!43343))

(declare-fun b_and!47355 () Bool)

(assert (= b_and!47353 (and (=> t!43343 result!23787) b_and!47355)))

(assert (=> b!1302180 m!1192297))

(assert (=> b!1302180 m!1192425))

(assert (=> b!1302180 m!1192419))

(assert (=> b!1302180 m!1192419))

(assert (=> b!1302180 m!1192425))

(assert (=> b!1302180 m!1192427))

(assert (=> b!1302180 m!1192297))

(declare-fun m!1192517 () Bool)

(assert (=> b!1302180 m!1192517))

(declare-fun m!1192519 () Bool)

(assert (=> b!1302162 m!1192519))

(assert (=> bm!64085 m!1192323))

(declare-fun m!1192521 () Bool)

(assert (=> bm!64090 m!1192521))

(assert (=> d!141317 m!1192301))

(declare-fun m!1192523 () Bool)

(assert (=> bm!64087 m!1192523))

(assert (=> b!1302174 m!1192297))

(assert (=> b!1302174 m!1192297))

(assert (=> b!1302174 m!1192299))

(assert (=> b!1302171 m!1192297))

(declare-fun m!1192525 () Bool)

(assert (=> b!1302171 m!1192525))

(declare-fun m!1192527 () Bool)

(assert (=> b!1302171 m!1192527))

(declare-fun m!1192529 () Bool)

(assert (=> b!1302171 m!1192529))

(declare-fun m!1192531 () Bool)

(assert (=> b!1302171 m!1192531))

(declare-fun m!1192533 () Bool)

(assert (=> b!1302171 m!1192533))

(declare-fun m!1192535 () Bool)

(assert (=> b!1302171 m!1192535))

(declare-fun m!1192537 () Bool)

(assert (=> b!1302171 m!1192537))

(declare-fun m!1192539 () Bool)

(assert (=> b!1302171 m!1192539))

(assert (=> b!1302171 m!1192525))

(declare-fun m!1192541 () Bool)

(assert (=> b!1302171 m!1192541))

(declare-fun m!1192543 () Bool)

(assert (=> b!1302171 m!1192543))

(declare-fun m!1192545 () Bool)

(assert (=> b!1302171 m!1192545))

(declare-fun m!1192547 () Bool)

(assert (=> b!1302171 m!1192547))

(declare-fun m!1192549 () Bool)

(assert (=> b!1302171 m!1192549))

(declare-fun m!1192551 () Bool)

(assert (=> b!1302171 m!1192551))

(assert (=> b!1302171 m!1192323))

(assert (=> b!1302171 m!1192541))

(assert (=> b!1302171 m!1192535))

(assert (=> b!1302171 m!1192539))

(declare-fun m!1192553 () Bool)

(assert (=> b!1302171 m!1192553))

(assert (=> b!1302161 m!1192297))

(assert (=> b!1302161 m!1192297))

(assert (=> b!1302161 m!1192299))

(declare-fun m!1192555 () Bool)

(assert (=> b!1302172 m!1192555))

(declare-fun m!1192557 () Bool)

(assert (=> bm!64091 m!1192557))

(assert (=> b!1302175 m!1192297))

(assert (=> b!1302175 m!1192297))

(declare-fun m!1192559 () Bool)

(assert (=> b!1302175 m!1192559))

(declare-fun m!1192561 () Bool)

(assert (=> b!1302176 m!1192561))

(assert (=> b!1301908 d!141317))

(declare-fun mapIsEmpty!53889 () Bool)

(declare-fun mapRes!53889 () Bool)

(assert (=> mapIsEmpty!53889 mapRes!53889))

(declare-fun b!1302188 () Bool)

(declare-fun e!742744 () Bool)

(assert (=> b!1302188 (= e!742744 tp_is_empty!34867)))

(declare-fun b!1302189 () Bool)

(declare-fun e!742743 () Bool)

(assert (=> b!1302189 (= e!742743 tp_is_empty!34867)))

(declare-fun mapNonEmpty!53889 () Bool)

(declare-fun tp!102835 () Bool)

(assert (=> mapNonEmpty!53889 (= mapRes!53889 (and tp!102835 e!742744))))

(declare-fun mapRest!53889 () (Array (_ BitVec 32) ValueCell!16535))

(declare-fun mapKey!53889 () (_ BitVec 32))

(declare-fun mapValue!53889 () ValueCell!16535)

(assert (=> mapNonEmpty!53889 (= mapRest!53880 (store mapRest!53889 mapKey!53889 mapValue!53889))))

(declare-fun condMapEmpty!53889 () Bool)

(declare-fun mapDefault!53889 () ValueCell!16535)

(assert (=> mapNonEmpty!53880 (= condMapEmpty!53889 (= mapRest!53880 ((as const (Array (_ BitVec 32) ValueCell!16535)) mapDefault!53889)))))

(assert (=> mapNonEmpty!53880 (= tp!102820 (and e!742743 mapRes!53889))))

(assert (= (and mapNonEmpty!53880 condMapEmpty!53889) mapIsEmpty!53889))

(assert (= (and mapNonEmpty!53880 (not condMapEmpty!53889)) mapNonEmpty!53889))

(assert (= (and mapNonEmpty!53889 ((_ is ValueCellFull!16535) mapValue!53889)) b!1302188))

(assert (= (and mapNonEmpty!53880 ((_ is ValueCellFull!16535) mapDefault!53889)) b!1302189))

(declare-fun m!1192563 () Bool)

(assert (=> mapNonEmpty!53889 m!1192563))

(declare-fun b_lambda!23215 () Bool)

(assert (= b_lambda!23209 (or (and start!109902 b_free!29227) b_lambda!23215)))

(declare-fun b_lambda!23217 () Bool)

(assert (= b_lambda!23211 (or (and start!109902 b_free!29227) b_lambda!23217)))

(declare-fun b_lambda!23219 () Bool)

(assert (= b_lambda!23213 (or (and start!109902 b_free!29227) b_lambda!23219)))

(check-sat (not b!1302115) (not b!1302058) (not d!141311) (not b!1302048) (not d!141315) (not b!1302049) (not b!1302084) (not b!1302171) (not b!1302176) (not b_next!29227) (not b!1302098) (not d!141317) (not b!1302175) (not bm!64064) (not b!1302096) (not b!1302172) (not b!1302082) b_and!47355 (not b!1302068) (not b!1302118) (not b_lambda!23217) (not b!1302162) (not b!1302055) (not b!1302085) (not d!141301) (not bm!64087) (not b_lambda!23215) (not b!1302103) (not d!141309) (not b!1302054) (not bm!64070) (not d!141305) (not b!1302116) (not b!1302101) tp_is_empty!34867 (not b!1302070) (not bm!64090) (not b!1302161) (not d!141303) (not bm!64067) (not bm!64091) (not b_lambda!23219) (not mapNonEmpty!53889) (not b!1302091) (not b!1302180) (not b!1302097) (not d!141287) (not b!1302174) (not b!1302051) (not b!1302057) (not b!1302113) (not d!141299) (not d!141285) (not b!1302052) (not bm!64085) (not b!1302100))
(check-sat b_and!47355 (not b_next!29227))
