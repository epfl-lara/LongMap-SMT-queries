; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110224 () Bool)

(assert start!110224)

(declare-fun b_free!29295 () Bool)

(declare-fun b_next!29295 () Bool)

(assert (=> start!110224 (= b_free!29295 (not b_next!29295))))

(declare-fun tp!103046 () Bool)

(declare-fun b_and!47485 () Bool)

(assert (=> start!110224 (= tp!103046 b_and!47485)))

(declare-fun b!1304833 () Bool)

(declare-fun e!744292 () Bool)

(declare-fun tp_is_empty!34935 () Bool)

(assert (=> b!1304833 (= e!744292 tp_is_empty!34935)))

(declare-fun b!1304834 () Bool)

(declare-fun e!744294 () Bool)

(declare-fun e!744290 () Bool)

(assert (=> b!1304834 (= e!744294 (not e!744290))))

(declare-fun res!866527 () Bool)

(assert (=> b!1304834 (=> res!866527 e!744290)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304834 (= res!866527 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!51683 0))(
  ( (V!51684 (val!17542 Int)) )
))
(declare-datatypes ((tuple2!22644 0))(
  ( (tuple2!22645 (_1!11333 (_ BitVec 64)) (_2!11333 V!51683)) )
))
(declare-datatypes ((List!29764 0))(
  ( (Nil!29761) (Cons!29760 (h!30969 tuple2!22644) (t!43364 List!29764)) )
))
(declare-datatypes ((ListLongMap!20301 0))(
  ( (ListLongMap!20302 (toList!10166 List!29764)) )
))
(declare-fun contains!8308 (ListLongMap!20301 (_ BitVec 64)) Bool)

(assert (=> b!1304834 (not (contains!8308 (ListLongMap!20302 Nil!29761) k0!1205))))

(declare-datatypes ((Unit!43212 0))(
  ( (Unit!43213) )
))
(declare-fun lt!584033 () Unit!43212)

(declare-fun emptyContainsNothing!229 ((_ BitVec 64)) Unit!43212)

(assert (=> b!1304834 (= lt!584033 (emptyContainsNothing!229 k0!1205))))

(declare-fun b!1304835 () Bool)

(assert (=> b!1304835 (= e!744290 false)))

(declare-fun lt!584034 () ListLongMap!20301)

(declare-fun minValue!1387 () V!51683)

(declare-fun +!4487 (ListLongMap!20301 tuple2!22644) ListLongMap!20301)

(assert (=> b!1304835 (not (contains!8308 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584035 () Unit!43212)

(declare-fun addStillNotContains!484 (ListLongMap!20301 (_ BitVec 64) V!51683 (_ BitVec 64)) Unit!43212)

(assert (=> b!1304835 (= lt!584035 (addStillNotContains!484 lt!584034 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun zeroValue!1387 () V!51683)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16569 0))(
  ( (ValueCellFull!16569 (v!20163 V!51683)) (EmptyCell!16569) )
))
(declare-datatypes ((array!86886 0))(
  ( (array!86887 (arr!41931 (Array (_ BitVec 32) ValueCell!16569)) (size!42481 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86886)

(declare-datatypes ((array!86888 0))(
  ( (array!86889 (arr!41932 (Array (_ BitVec 32) (_ BitVec 64))) (size!42482 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86888)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6123 (array!86888 array!86886 (_ BitVec 32) (_ BitVec 32) V!51683 V!51683 (_ BitVec 32) Int) ListLongMap!20301)

(assert (=> b!1304835 (= lt!584034 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304836 () Bool)

(declare-fun res!866532 () Bool)

(assert (=> b!1304836 (=> (not res!866532) (not e!744294))))

(assert (=> b!1304836 (= res!866532 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741))))))

(declare-fun b!1304837 () Bool)

(declare-fun res!866528 () Bool)

(assert (=> b!1304837 (=> (not res!866528) (not e!744294))))

(declare-fun getCurrentListMap!5183 (array!86888 array!86886 (_ BitVec 32) (_ BitVec 32) V!51683 V!51683 (_ BitVec 32) Int) ListLongMap!20301)

(assert (=> b!1304837 (= res!866528 (contains!8308 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!54006 () Bool)

(declare-fun mapRes!54006 () Bool)

(assert (=> mapIsEmpty!54006 mapRes!54006))

(declare-fun b!1304838 () Bool)

(declare-fun res!866534 () Bool)

(assert (=> b!1304838 (=> (not res!866534) (not e!744294))))

(assert (=> b!1304838 (= res!866534 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42482 _keys!1741))))))

(declare-fun mapNonEmpty!54006 () Bool)

(declare-fun tp!103047 () Bool)

(declare-fun e!744291 () Bool)

(assert (=> mapNonEmpty!54006 (= mapRes!54006 (and tp!103047 e!744291))))

(declare-fun mapKey!54006 () (_ BitVec 32))

(declare-fun mapValue!54006 () ValueCell!16569)

(declare-fun mapRest!54006 () (Array (_ BitVec 32) ValueCell!16569))

(assert (=> mapNonEmpty!54006 (= (arr!41931 _values!1445) (store mapRest!54006 mapKey!54006 mapValue!54006))))

(declare-fun res!866529 () Bool)

(assert (=> start!110224 (=> (not res!866529) (not e!744294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110224 (= res!866529 (validMask!0 mask!2175))))

(assert (=> start!110224 e!744294))

(assert (=> start!110224 tp_is_empty!34935))

(assert (=> start!110224 true))

(declare-fun e!744293 () Bool)

(declare-fun array_inv!31707 (array!86886) Bool)

(assert (=> start!110224 (and (array_inv!31707 _values!1445) e!744293)))

(declare-fun array_inv!31708 (array!86888) Bool)

(assert (=> start!110224 (array_inv!31708 _keys!1741)))

(assert (=> start!110224 tp!103046))

(declare-fun b!1304839 () Bool)

(declare-fun res!866531 () Bool)

(assert (=> b!1304839 (=> (not res!866531) (not e!744294))))

(declare-datatypes ((List!29765 0))(
  ( (Nil!29762) (Cons!29761 (h!30970 (_ BitVec 64)) (t!43365 List!29765)) )
))
(declare-fun arrayNoDuplicates!0 (array!86888 (_ BitVec 32) List!29765) Bool)

(assert (=> b!1304839 (= res!866531 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29762))))

(declare-fun b!1304840 () Bool)

(assert (=> b!1304840 (= e!744291 tp_is_empty!34935)))

(declare-fun b!1304841 () Bool)

(declare-fun res!866533 () Bool)

(assert (=> b!1304841 (=> (not res!866533) (not e!744294))))

(assert (=> b!1304841 (= res!866533 (and (= (size!42481 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42482 _keys!1741) (size!42481 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304842 () Bool)

(declare-fun res!866530 () Bool)

(assert (=> b!1304842 (=> (not res!866530) (not e!744294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86888 (_ BitVec 32)) Bool)

(assert (=> b!1304842 (= res!866530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304843 () Bool)

(declare-fun res!866535 () Bool)

(assert (=> b!1304843 (=> (not res!866535) (not e!744294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304843 (= res!866535 (not (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144))))))

(declare-fun b!1304844 () Bool)

(assert (=> b!1304844 (= e!744293 (and e!744292 mapRes!54006))))

(declare-fun condMapEmpty!54006 () Bool)

(declare-fun mapDefault!54006 () ValueCell!16569)

(assert (=> b!1304844 (= condMapEmpty!54006 (= (arr!41931 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16569)) mapDefault!54006)))))

(assert (= (and start!110224 res!866529) b!1304841))

(assert (= (and b!1304841 res!866533) b!1304842))

(assert (= (and b!1304842 res!866530) b!1304839))

(assert (= (and b!1304839 res!866531) b!1304836))

(assert (= (and b!1304836 res!866532) b!1304837))

(assert (= (and b!1304837 res!866528) b!1304838))

(assert (= (and b!1304838 res!866534) b!1304843))

(assert (= (and b!1304843 res!866535) b!1304834))

(assert (= (and b!1304834 (not res!866527)) b!1304835))

(assert (= (and b!1304844 condMapEmpty!54006) mapIsEmpty!54006))

(assert (= (and b!1304844 (not condMapEmpty!54006)) mapNonEmpty!54006))

(get-info :version)

(assert (= (and mapNonEmpty!54006 ((_ is ValueCellFull!16569) mapValue!54006)) b!1304840))

(assert (= (and b!1304844 ((_ is ValueCellFull!16569) mapDefault!54006)) b!1304833))

(assert (= start!110224 b!1304844))

(declare-fun m!1195903 () Bool)

(assert (=> b!1304839 m!1195903))

(declare-fun m!1195905 () Bool)

(assert (=> mapNonEmpty!54006 m!1195905))

(declare-fun m!1195907 () Bool)

(assert (=> b!1304834 m!1195907))

(declare-fun m!1195909 () Bool)

(assert (=> b!1304834 m!1195909))

(declare-fun m!1195911 () Bool)

(assert (=> b!1304843 m!1195911))

(assert (=> b!1304843 m!1195911))

(declare-fun m!1195913 () Bool)

(assert (=> b!1304843 m!1195913))

(declare-fun m!1195915 () Bool)

(assert (=> b!1304837 m!1195915))

(assert (=> b!1304837 m!1195915))

(declare-fun m!1195917 () Bool)

(assert (=> b!1304837 m!1195917))

(declare-fun m!1195919 () Bool)

(assert (=> b!1304842 m!1195919))

(declare-fun m!1195921 () Bool)

(assert (=> start!110224 m!1195921))

(declare-fun m!1195923 () Bool)

(assert (=> start!110224 m!1195923))

(declare-fun m!1195925 () Bool)

(assert (=> start!110224 m!1195925))

(declare-fun m!1195927 () Bool)

(assert (=> b!1304835 m!1195927))

(assert (=> b!1304835 m!1195927))

(declare-fun m!1195929 () Bool)

(assert (=> b!1304835 m!1195929))

(declare-fun m!1195931 () Bool)

(assert (=> b!1304835 m!1195931))

(declare-fun m!1195933 () Bool)

(assert (=> b!1304835 m!1195933))

(check-sat b_and!47485 (not b!1304835) (not b!1304839) (not mapNonEmpty!54006) (not b_next!29295) (not b!1304834) tp_is_empty!34935 (not start!110224) (not b!1304843) (not b!1304842) (not b!1304837))
(check-sat b_and!47485 (not b_next!29295))
(get-model)

(declare-fun d!141949 () Bool)

(assert (=> d!141949 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110224 d!141949))

(declare-fun d!141951 () Bool)

(assert (=> d!141951 (= (array_inv!31707 _values!1445) (bvsge (size!42481 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110224 d!141951))

(declare-fun d!141953 () Bool)

(assert (=> d!141953 (= (array_inv!31708 _keys!1741) (bvsge (size!42482 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110224 d!141953))

(declare-fun d!141955 () Bool)

(declare-fun e!744318 () Bool)

(assert (=> d!141955 e!744318))

(declare-fun res!866565 () Bool)

(assert (=> d!141955 (=> res!866565 e!744318)))

(declare-fun lt!584056 () Bool)

(assert (=> d!141955 (= res!866565 (not lt!584056))))

(declare-fun lt!584054 () Bool)

(assert (=> d!141955 (= lt!584056 lt!584054)))

(declare-fun lt!584053 () Unit!43212)

(declare-fun e!744319 () Unit!43212)

(assert (=> d!141955 (= lt!584053 e!744319)))

(declare-fun c!125302 () Bool)

(assert (=> d!141955 (= c!125302 lt!584054)))

(declare-fun containsKey!730 (List!29764 (_ BitVec 64)) Bool)

(assert (=> d!141955 (= lt!584054 (containsKey!730 (toList!10166 (ListLongMap!20302 Nil!29761)) k0!1205))))

(assert (=> d!141955 (= (contains!8308 (ListLongMap!20302 Nil!29761) k0!1205) lt!584056)))

(declare-fun b!1304887 () Bool)

(declare-fun lt!584055 () Unit!43212)

(assert (=> b!1304887 (= e!744319 lt!584055)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!476 (List!29764 (_ BitVec 64)) Unit!43212)

(assert (=> b!1304887 (= lt!584055 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10166 (ListLongMap!20302 Nil!29761)) k0!1205))))

(declare-datatypes ((Option!760 0))(
  ( (Some!759 (v!20165 V!51683)) (None!758) )
))
(declare-fun isDefined!515 (Option!760) Bool)

(declare-fun getValueByKey!708 (List!29764 (_ BitVec 64)) Option!760)

(assert (=> b!1304887 (isDefined!515 (getValueByKey!708 (toList!10166 (ListLongMap!20302 Nil!29761)) k0!1205))))

(declare-fun b!1304888 () Bool)

(declare-fun Unit!43216 () Unit!43212)

(assert (=> b!1304888 (= e!744319 Unit!43216)))

(declare-fun b!1304889 () Bool)

(assert (=> b!1304889 (= e!744318 (isDefined!515 (getValueByKey!708 (toList!10166 (ListLongMap!20302 Nil!29761)) k0!1205)))))

(assert (= (and d!141955 c!125302) b!1304887))

(assert (= (and d!141955 (not c!125302)) b!1304888))

(assert (= (and d!141955 (not res!866565)) b!1304889))

(declare-fun m!1195967 () Bool)

(assert (=> d!141955 m!1195967))

(declare-fun m!1195969 () Bool)

(assert (=> b!1304887 m!1195969))

(declare-fun m!1195971 () Bool)

(assert (=> b!1304887 m!1195971))

(assert (=> b!1304887 m!1195971))

(declare-fun m!1195973 () Bool)

(assert (=> b!1304887 m!1195973))

(assert (=> b!1304889 m!1195971))

(assert (=> b!1304889 m!1195971))

(assert (=> b!1304889 m!1195973))

(assert (=> b!1304834 d!141955))

(declare-fun d!141957 () Bool)

(assert (=> d!141957 (not (contains!8308 (ListLongMap!20302 Nil!29761) k0!1205))))

(declare-fun lt!584059 () Unit!43212)

(declare-fun choose!1933 ((_ BitVec 64)) Unit!43212)

(assert (=> d!141957 (= lt!584059 (choose!1933 k0!1205))))

(assert (=> d!141957 (= (emptyContainsNothing!229 k0!1205) lt!584059)))

(declare-fun bs!37173 () Bool)

(assert (= bs!37173 d!141957))

(assert (=> bs!37173 m!1195907))

(declare-fun m!1195975 () Bool)

(assert (=> bs!37173 m!1195975))

(assert (=> b!1304834 d!141957))

(declare-fun b!1304900 () Bool)

(declare-fun e!744329 () Bool)

(declare-fun call!64305 () Bool)

(assert (=> b!1304900 (= e!744329 call!64305)))

(declare-fun d!141959 () Bool)

(declare-fun res!866572 () Bool)

(declare-fun e!744331 () Bool)

(assert (=> d!141959 (=> res!866572 e!744331)))

(assert (=> d!141959 (= res!866572 (bvsge #b00000000000000000000000000000000 (size!42482 _keys!1741)))))

(assert (=> d!141959 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29762) e!744331)))

(declare-fun b!1304901 () Bool)

(declare-fun e!744328 () Bool)

(declare-fun contains!8310 (List!29765 (_ BitVec 64)) Bool)

(assert (=> b!1304901 (= e!744328 (contains!8310 Nil!29762 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304902 () Bool)

(declare-fun e!744330 () Bool)

(assert (=> b!1304902 (= e!744331 e!744330)))

(declare-fun res!866574 () Bool)

(assert (=> b!1304902 (=> (not res!866574) (not e!744330))))

(assert (=> b!1304902 (= res!866574 (not e!744328))))

(declare-fun res!866573 () Bool)

(assert (=> b!1304902 (=> (not res!866573) (not e!744328))))

(assert (=> b!1304902 (= res!866573 (validKeyInArray!0 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64302 () Bool)

(declare-fun c!125305 () Bool)

(assert (=> bm!64302 (= call!64305 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125305 (Cons!29761 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000) Nil!29762) Nil!29762)))))

(declare-fun b!1304903 () Bool)

(assert (=> b!1304903 (= e!744330 e!744329)))

(assert (=> b!1304903 (= c!125305 (validKeyInArray!0 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304904 () Bool)

(assert (=> b!1304904 (= e!744329 call!64305)))

(assert (= (and d!141959 (not res!866572)) b!1304902))

(assert (= (and b!1304902 res!866573) b!1304901))

(assert (= (and b!1304902 res!866574) b!1304903))

(assert (= (and b!1304903 c!125305) b!1304904))

(assert (= (and b!1304903 (not c!125305)) b!1304900))

(assert (= (or b!1304904 b!1304900) bm!64302))

(declare-fun m!1195977 () Bool)

(assert (=> b!1304901 m!1195977))

(assert (=> b!1304901 m!1195977))

(declare-fun m!1195979 () Bool)

(assert (=> b!1304901 m!1195979))

(assert (=> b!1304902 m!1195977))

(assert (=> b!1304902 m!1195977))

(declare-fun m!1195981 () Bool)

(assert (=> b!1304902 m!1195981))

(assert (=> bm!64302 m!1195977))

(declare-fun m!1195983 () Bool)

(assert (=> bm!64302 m!1195983))

(assert (=> b!1304903 m!1195977))

(assert (=> b!1304903 m!1195977))

(assert (=> b!1304903 m!1195981))

(assert (=> b!1304839 d!141959))

(declare-fun d!141961 () Bool)

(declare-fun e!744332 () Bool)

(assert (=> d!141961 e!744332))

(declare-fun res!866575 () Bool)

(assert (=> d!141961 (=> res!866575 e!744332)))

(declare-fun lt!584063 () Bool)

(assert (=> d!141961 (= res!866575 (not lt!584063))))

(declare-fun lt!584061 () Bool)

(assert (=> d!141961 (= lt!584063 lt!584061)))

(declare-fun lt!584060 () Unit!43212)

(declare-fun e!744333 () Unit!43212)

(assert (=> d!141961 (= lt!584060 e!744333)))

(declare-fun c!125306 () Bool)

(assert (=> d!141961 (= c!125306 lt!584061)))

(assert (=> d!141961 (= lt!584061 (containsKey!730 (toList!10166 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141961 (= (contains!8308 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!584063)))

(declare-fun b!1304905 () Bool)

(declare-fun lt!584062 () Unit!43212)

(assert (=> b!1304905 (= e!744333 lt!584062)))

(assert (=> b!1304905 (= lt!584062 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10166 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> b!1304905 (isDefined!515 (getValueByKey!708 (toList!10166 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1304906 () Bool)

(declare-fun Unit!43217 () Unit!43212)

(assert (=> b!1304906 (= e!744333 Unit!43217)))

(declare-fun b!1304907 () Bool)

(assert (=> b!1304907 (= e!744332 (isDefined!515 (getValueByKey!708 (toList!10166 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141961 c!125306) b!1304905))

(assert (= (and d!141961 (not c!125306)) b!1304906))

(assert (= (and d!141961 (not res!866575)) b!1304907))

(declare-fun m!1195985 () Bool)

(assert (=> d!141961 m!1195985))

(declare-fun m!1195987 () Bool)

(assert (=> b!1304905 m!1195987))

(declare-fun m!1195989 () Bool)

(assert (=> b!1304905 m!1195989))

(assert (=> b!1304905 m!1195989))

(declare-fun m!1195991 () Bool)

(assert (=> b!1304905 m!1195991))

(assert (=> b!1304907 m!1195989))

(assert (=> b!1304907 m!1195989))

(assert (=> b!1304907 m!1195991))

(assert (=> b!1304835 d!141961))

(declare-fun d!141963 () Bool)

(declare-fun e!744336 () Bool)

(assert (=> d!141963 e!744336))

(declare-fun res!866581 () Bool)

(assert (=> d!141963 (=> (not res!866581) (not e!744336))))

(declare-fun lt!584073 () ListLongMap!20301)

(assert (=> d!141963 (= res!866581 (contains!8308 lt!584073 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!584074 () List!29764)

(assert (=> d!141963 (= lt!584073 (ListLongMap!20302 lt!584074))))

(declare-fun lt!584072 () Unit!43212)

(declare-fun lt!584075 () Unit!43212)

(assert (=> d!141963 (= lt!584072 lt!584075)))

(assert (=> d!141963 (= (getValueByKey!708 lt!584074 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!759 (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!354 (List!29764 (_ BitVec 64) V!51683) Unit!43212)

(assert (=> d!141963 (= lt!584075 (lemmaContainsTupThenGetReturnValue!354 lt!584074 (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!483 (List!29764 (_ BitVec 64) V!51683) List!29764)

(assert (=> d!141963 (= lt!584074 (insertStrictlySorted!483 (toList!10166 lt!584034) (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141963 (= (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!584073)))

(declare-fun b!1304912 () Bool)

(declare-fun res!866580 () Bool)

(assert (=> b!1304912 (=> (not res!866580) (not e!744336))))

(assert (=> b!1304912 (= res!866580 (= (getValueByKey!708 (toList!10166 lt!584073) (_1!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!759 (_2!11333 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1304913 () Bool)

(declare-fun contains!8311 (List!29764 tuple2!22644) Bool)

(assert (=> b!1304913 (= e!744336 (contains!8311 (toList!10166 lt!584073) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141963 res!866581) b!1304912))

(assert (= (and b!1304912 res!866580) b!1304913))

(declare-fun m!1195993 () Bool)

(assert (=> d!141963 m!1195993))

(declare-fun m!1195995 () Bool)

(assert (=> d!141963 m!1195995))

(declare-fun m!1195997 () Bool)

(assert (=> d!141963 m!1195997))

(declare-fun m!1195999 () Bool)

(assert (=> d!141963 m!1195999))

(declare-fun m!1196001 () Bool)

(assert (=> b!1304912 m!1196001))

(declare-fun m!1196003 () Bool)

(assert (=> b!1304913 m!1196003))

(assert (=> b!1304835 d!141963))

(declare-fun d!141965 () Bool)

(assert (=> d!141965 (not (contains!8308 (+!4487 lt!584034 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!584078 () Unit!43212)

(declare-fun choose!1934 (ListLongMap!20301 (_ BitVec 64) V!51683 (_ BitVec 64)) Unit!43212)

(assert (=> d!141965 (= lt!584078 (choose!1934 lt!584034 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun e!744339 () Bool)

(assert (=> d!141965 e!744339))

(declare-fun res!866584 () Bool)

(assert (=> d!141965 (=> (not res!866584) (not e!744339))))

(assert (=> d!141965 (= res!866584 (not (contains!8308 lt!584034 k0!1205)))))

(assert (=> d!141965 (= (addStillNotContains!484 lt!584034 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205) lt!584078)))

(declare-fun b!1304917 () Bool)

(assert (=> b!1304917 (= e!744339 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(assert (= (and d!141965 res!866584) b!1304917))

(assert (=> d!141965 m!1195927))

(assert (=> d!141965 m!1195927))

(assert (=> d!141965 m!1195929))

(declare-fun m!1196005 () Bool)

(assert (=> d!141965 m!1196005))

(declare-fun m!1196007 () Bool)

(assert (=> d!141965 m!1196007))

(assert (=> b!1304835 d!141965))

(declare-fun call!64308 () ListLongMap!20301)

(declare-fun bm!64305 () Bool)

(assert (=> bm!64305 (= call!64308 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1304942 () Bool)

(declare-fun res!866594 () Bool)

(declare-fun e!744355 () Bool)

(assert (=> b!1304942 (=> (not res!866594) (not e!744355))))

(declare-fun lt!584097 () ListLongMap!20301)

(assert (=> b!1304942 (= res!866594 (not (contains!8308 lt!584097 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304943 () Bool)

(assert (=> b!1304943 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741)))))

(assert (=> b!1304943 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42481 _values!1445)))))

(declare-fun e!744360 () Bool)

(declare-fun apply!1025 (ListLongMap!20301 (_ BitVec 64)) V!51683)

(declare-fun get!21183 (ValueCell!16569 V!51683) V!51683)

(declare-fun dynLambda!3432 (Int (_ BitVec 64)) V!51683)

(assert (=> b!1304943 (= e!744360 (= (apply!1025 lt!584097 (select (arr!41932 _keys!1741) from!2144)) (get!21183 (select (arr!41931 _values!1445) from!2144) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!744356 () Bool)

(declare-fun b!1304944 () Bool)

(assert (=> b!1304944 (= e!744356 (= lt!584097 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304945 () Bool)

(declare-fun e!744357 () ListLongMap!20301)

(assert (=> b!1304945 (= e!744357 (ListLongMap!20302 Nil!29761))))

(declare-fun b!1304946 () Bool)

(declare-fun lt!584093 () Unit!43212)

(declare-fun lt!584094 () Unit!43212)

(assert (=> b!1304946 (= lt!584093 lt!584094)))

(declare-fun lt!584095 () ListLongMap!20301)

(declare-fun lt!584099 () (_ BitVec 64))

(declare-fun lt!584098 () V!51683)

(declare-fun lt!584096 () (_ BitVec 64))

(assert (=> b!1304946 (not (contains!8308 (+!4487 lt!584095 (tuple2!22645 lt!584099 lt!584098)) lt!584096))))

(assert (=> b!1304946 (= lt!584094 (addStillNotContains!484 lt!584095 lt!584099 lt!584098 lt!584096))))

(assert (=> b!1304946 (= lt!584096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304946 (= lt!584098 (get!21183 (select (arr!41931 _values!1445) from!2144) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304946 (= lt!584099 (select (arr!41932 _keys!1741) from!2144))))

(assert (=> b!1304946 (= lt!584095 call!64308)))

(declare-fun e!744354 () ListLongMap!20301)

(assert (=> b!1304946 (= e!744354 (+!4487 call!64308 (tuple2!22645 (select (arr!41932 _keys!1741) from!2144) (get!21183 (select (arr!41931 _values!1445) from!2144) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!141967 () Bool)

(assert (=> d!141967 e!744355))

(declare-fun res!866596 () Bool)

(assert (=> d!141967 (=> (not res!866596) (not e!744355))))

(assert (=> d!141967 (= res!866596 (not (contains!8308 lt!584097 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141967 (= lt!584097 e!744357)))

(declare-fun c!125317 () Bool)

(assert (=> d!141967 (= c!125317 (bvsge from!2144 (size!42482 _keys!1741)))))

(assert (=> d!141967 (validMask!0 mask!2175)))

(assert (=> d!141967 (= (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584097)))

(declare-fun b!1304947 () Bool)

(declare-fun e!744359 () Bool)

(assert (=> b!1304947 (= e!744359 (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144)))))

(assert (=> b!1304947 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304948 () Bool)

(assert (=> b!1304948 (= e!744357 e!744354)))

(declare-fun c!125315 () Bool)

(assert (=> b!1304948 (= c!125315 (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144)))))

(declare-fun b!1304949 () Bool)

(declare-fun e!744358 () Bool)

(assert (=> b!1304949 (= e!744355 e!744358)))

(declare-fun c!125318 () Bool)

(assert (=> b!1304949 (= c!125318 e!744359)))

(declare-fun res!866593 () Bool)

(assert (=> b!1304949 (=> (not res!866593) (not e!744359))))

(assert (=> b!1304949 (= res!866593 (bvslt from!2144 (size!42482 _keys!1741)))))

(declare-fun b!1304950 () Bool)

(assert (=> b!1304950 (= e!744358 e!744360)))

(assert (=> b!1304950 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741)))))

(declare-fun res!866595 () Bool)

(assert (=> b!1304950 (= res!866595 (contains!8308 lt!584097 (select (arr!41932 _keys!1741) from!2144)))))

(assert (=> b!1304950 (=> (not res!866595) (not e!744360))))

(declare-fun b!1304951 () Bool)

(declare-fun isEmpty!1069 (ListLongMap!20301) Bool)

(assert (=> b!1304951 (= e!744356 (isEmpty!1069 lt!584097))))

(declare-fun b!1304952 () Bool)

(assert (=> b!1304952 (= e!744354 call!64308)))

(declare-fun b!1304953 () Bool)

(assert (=> b!1304953 (= e!744358 e!744356)))

(declare-fun c!125316 () Bool)

(assert (=> b!1304953 (= c!125316 (bvslt from!2144 (size!42482 _keys!1741)))))

(assert (= (and d!141967 c!125317) b!1304945))

(assert (= (and d!141967 (not c!125317)) b!1304948))

(assert (= (and b!1304948 c!125315) b!1304946))

(assert (= (and b!1304948 (not c!125315)) b!1304952))

(assert (= (or b!1304946 b!1304952) bm!64305))

(assert (= (and d!141967 res!866596) b!1304942))

(assert (= (and b!1304942 res!866594) b!1304949))

(assert (= (and b!1304949 res!866593) b!1304947))

(assert (= (and b!1304949 c!125318) b!1304950))

(assert (= (and b!1304949 (not c!125318)) b!1304953))

(assert (= (and b!1304950 res!866595) b!1304943))

(assert (= (and b!1304953 c!125316) b!1304944))

(assert (= (and b!1304953 (not c!125316)) b!1304951))

(declare-fun b_lambda!23327 () Bool)

(assert (=> (not b_lambda!23327) (not b!1304943)))

(declare-fun t!43369 () Bool)

(declare-fun tb!11405 () Bool)

(assert (=> (and start!110224 (= defaultEntry!1448 defaultEntry!1448) t!43369) tb!11405))

(declare-fun result!23837 () Bool)

(assert (=> tb!11405 (= result!23837 tp_is_empty!34935)))

(assert (=> b!1304943 t!43369))

(declare-fun b_and!47489 () Bool)

(assert (= b_and!47485 (and (=> t!43369 result!23837) b_and!47489)))

(declare-fun b_lambda!23329 () Bool)

(assert (=> (not b_lambda!23329) (not b!1304946)))

(assert (=> b!1304946 t!43369))

(declare-fun b_and!47491 () Bool)

(assert (= b_and!47489 (and (=> t!43369 result!23837) b_and!47491)))

(declare-fun m!1196009 () Bool)

(assert (=> b!1304942 m!1196009))

(assert (=> b!1304943 m!1195911))

(declare-fun m!1196011 () Bool)

(assert (=> b!1304943 m!1196011))

(declare-fun m!1196013 () Bool)

(assert (=> b!1304943 m!1196013))

(declare-fun m!1196015 () Bool)

(assert (=> b!1304943 m!1196015))

(assert (=> b!1304943 m!1195911))

(declare-fun m!1196017 () Bool)

(assert (=> b!1304943 m!1196017))

(assert (=> b!1304943 m!1196011))

(assert (=> b!1304943 m!1196013))

(assert (=> b!1304947 m!1195911))

(assert (=> b!1304947 m!1195911))

(assert (=> b!1304947 m!1195913))

(declare-fun m!1196019 () Bool)

(assert (=> bm!64305 m!1196019))

(declare-fun m!1196021 () Bool)

(assert (=> d!141967 m!1196021))

(assert (=> d!141967 m!1195921))

(assert (=> b!1304948 m!1195911))

(assert (=> b!1304948 m!1195911))

(assert (=> b!1304948 m!1195913))

(assert (=> b!1304946 m!1195911))

(declare-fun m!1196023 () Bool)

(assert (=> b!1304946 m!1196023))

(declare-fun m!1196025 () Bool)

(assert (=> b!1304946 m!1196025))

(assert (=> b!1304946 m!1196011))

(assert (=> b!1304946 m!1196013))

(assert (=> b!1304946 m!1196015))

(assert (=> b!1304946 m!1196011))

(declare-fun m!1196027 () Bool)

(assert (=> b!1304946 m!1196027))

(assert (=> b!1304946 m!1196013))

(assert (=> b!1304946 m!1196023))

(declare-fun m!1196029 () Bool)

(assert (=> b!1304946 m!1196029))

(assert (=> b!1304950 m!1195911))

(assert (=> b!1304950 m!1195911))

(declare-fun m!1196031 () Bool)

(assert (=> b!1304950 m!1196031))

(declare-fun m!1196033 () Bool)

(assert (=> b!1304951 m!1196033))

(assert (=> b!1304944 m!1196019))

(assert (=> b!1304835 d!141967))

(declare-fun d!141969 () Bool)

(declare-fun e!744361 () Bool)

(assert (=> d!141969 e!744361))

(declare-fun res!866597 () Bool)

(assert (=> d!141969 (=> res!866597 e!744361)))

(declare-fun lt!584103 () Bool)

(assert (=> d!141969 (= res!866597 (not lt!584103))))

(declare-fun lt!584101 () Bool)

(assert (=> d!141969 (= lt!584103 lt!584101)))

(declare-fun lt!584100 () Unit!43212)

(declare-fun e!744362 () Unit!43212)

(assert (=> d!141969 (= lt!584100 e!744362)))

(declare-fun c!125319 () Bool)

(assert (=> d!141969 (= c!125319 lt!584101)))

(assert (=> d!141969 (= lt!584101 (containsKey!730 (toList!10166 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141969 (= (contains!8308 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!584103)))

(declare-fun b!1304956 () Bool)

(declare-fun lt!584102 () Unit!43212)

(assert (=> b!1304956 (= e!744362 lt!584102)))

(assert (=> b!1304956 (= lt!584102 (lemmaContainsKeyImpliesGetValueByKeyDefined!476 (toList!10166 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304956 (isDefined!515 (getValueByKey!708 (toList!10166 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304957 () Bool)

(declare-fun Unit!43218 () Unit!43212)

(assert (=> b!1304957 (= e!744362 Unit!43218)))

(declare-fun b!1304958 () Bool)

(assert (=> b!1304958 (= e!744361 (isDefined!515 (getValueByKey!708 (toList!10166 (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141969 c!125319) b!1304956))

(assert (= (and d!141969 (not c!125319)) b!1304957))

(assert (= (and d!141969 (not res!866597)) b!1304958))

(declare-fun m!1196035 () Bool)

(assert (=> d!141969 m!1196035))

(declare-fun m!1196037 () Bool)

(assert (=> b!1304956 m!1196037))

(declare-fun m!1196039 () Bool)

(assert (=> b!1304956 m!1196039))

(assert (=> b!1304956 m!1196039))

(declare-fun m!1196041 () Bool)

(assert (=> b!1304956 m!1196041))

(assert (=> b!1304958 m!1196039))

(assert (=> b!1304958 m!1196039))

(assert (=> b!1304958 m!1196041))

(assert (=> b!1304837 d!141969))

(declare-fun bm!64320 () Bool)

(declare-fun call!64327 () ListLongMap!20301)

(assert (=> bm!64320 (= call!64327 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1305001 () Bool)

(declare-fun res!866616 () Bool)

(declare-fun e!744400 () Bool)

(assert (=> b!1305001 (=> (not res!866616) (not e!744400))))

(declare-fun e!744389 () Bool)

(assert (=> b!1305001 (= res!866616 e!744389)))

(declare-fun res!866617 () Bool)

(assert (=> b!1305001 (=> res!866617 e!744389)))

(declare-fun e!744397 () Bool)

(assert (=> b!1305001 (= res!866617 (not e!744397))))

(declare-fun res!866619 () Bool)

(assert (=> b!1305001 (=> (not res!866619) (not e!744397))))

(assert (=> b!1305001 (= res!866619 (bvslt from!2144 (size!42482 _keys!1741)))))

(declare-fun bm!64321 () Bool)

(declare-fun call!64329 () ListLongMap!20301)

(declare-fun call!64325 () ListLongMap!20301)

(assert (=> bm!64321 (= call!64329 call!64325)))

(declare-fun b!1305002 () Bool)

(declare-fun e!744394 () Bool)

(assert (=> b!1305002 (= e!744389 e!744394)))

(declare-fun res!866623 () Bool)

(assert (=> b!1305002 (=> (not res!866623) (not e!744394))))

(declare-fun lt!584157 () ListLongMap!20301)

(assert (=> b!1305002 (= res!866623 (contains!8308 lt!584157 (select (arr!41932 _keys!1741) from!2144)))))

(assert (=> b!1305002 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741)))))

(declare-fun b!1305003 () Bool)

(declare-fun e!744391 () ListLongMap!20301)

(declare-fun e!744398 () ListLongMap!20301)

(assert (=> b!1305003 (= e!744391 e!744398)))

(declare-fun c!125332 () Bool)

(assert (=> b!1305003 (= c!125332 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305004 () Bool)

(declare-fun e!744396 () Bool)

(assert (=> b!1305004 (= e!744396 (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144)))))

(declare-fun b!1305005 () Bool)

(assert (=> b!1305005 (= e!744394 (= (apply!1025 lt!584157 (select (arr!41932 _keys!1741) from!2144)) (get!21183 (select (arr!41931 _values!1445) from!2144) (dynLambda!3432 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1305005 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42481 _values!1445)))))

(assert (=> b!1305005 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741)))))

(declare-fun b!1305006 () Bool)

(declare-fun e!744399 () Bool)

(assert (=> b!1305006 (= e!744400 e!744399)))

(declare-fun c!125335 () Bool)

(assert (=> b!1305006 (= c!125335 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1305007 () Bool)

(declare-fun e!744392 () ListLongMap!20301)

(declare-fun call!64323 () ListLongMap!20301)

(assert (=> b!1305007 (= e!744392 call!64323)))

(declare-fun b!1305008 () Bool)

(declare-fun e!744393 () Unit!43212)

(declare-fun Unit!43219 () Unit!43212)

(assert (=> b!1305008 (= e!744393 Unit!43219)))

(declare-fun b!1305009 () Bool)

(declare-fun e!744401 () Bool)

(assert (=> b!1305009 (= e!744399 e!744401)))

(declare-fun res!866620 () Bool)

(declare-fun call!64324 () Bool)

(assert (=> b!1305009 (= res!866620 call!64324)))

(assert (=> b!1305009 (=> (not res!866620) (not e!744401))))

(declare-fun b!1305010 () Bool)

(assert (=> b!1305010 (= e!744397 (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144)))))

(declare-fun b!1305011 () Bool)

(declare-fun c!125333 () Bool)

(assert (=> b!1305011 (= c!125333 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1305011 (= e!744398 e!744392)))

(declare-fun b!1305012 () Bool)

(declare-fun e!744395 () Bool)

(declare-fun call!64328 () Bool)

(assert (=> b!1305012 (= e!744395 (not call!64328))))

(declare-fun b!1305013 () Bool)

(assert (=> b!1305013 (= e!744399 (not call!64324))))

(declare-fun b!1305014 () Bool)

(declare-fun e!744390 () Bool)

(assert (=> b!1305014 (= e!744395 e!744390)))

(declare-fun res!866618 () Bool)

(assert (=> b!1305014 (= res!866618 call!64328)))

(assert (=> b!1305014 (=> (not res!866618) (not e!744390))))

(declare-fun bm!64322 () Bool)

(assert (=> bm!64322 (= call!64324 (contains!8308 lt!584157 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64323 () Bool)

(assert (=> bm!64323 (= call!64325 call!64327)))

(declare-fun c!125336 () Bool)

(declare-fun bm!64324 () Bool)

(declare-fun call!64326 () ListLongMap!20301)

(assert (=> bm!64324 (= call!64326 (+!4487 (ite c!125336 call!64327 (ite c!125332 call!64325 call!64329)) (ite (or c!125336 c!125332) (tuple2!22645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1305015 () Bool)

(assert (=> b!1305015 (= e!744392 call!64329)))

(declare-fun b!1305016 () Bool)

(declare-fun lt!584167 () Unit!43212)

(assert (=> b!1305016 (= e!744393 lt!584167)))

(declare-fun lt!584159 () ListLongMap!20301)

(assert (=> b!1305016 (= lt!584159 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584153 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584153 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584150 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584150 (select (arr!41932 _keys!1741) from!2144))))

(declare-fun lt!584163 () Unit!43212)

(declare-fun addStillContains!1113 (ListLongMap!20301 (_ BitVec 64) V!51683 (_ BitVec 64)) Unit!43212)

(assert (=> b!1305016 (= lt!584163 (addStillContains!1113 lt!584159 lt!584153 zeroValue!1387 lt!584150))))

(assert (=> b!1305016 (contains!8308 (+!4487 lt!584159 (tuple2!22645 lt!584153 zeroValue!1387)) lt!584150)))

(declare-fun lt!584154 () Unit!43212)

(assert (=> b!1305016 (= lt!584154 lt!584163)))

(declare-fun lt!584162 () ListLongMap!20301)

(assert (=> b!1305016 (= lt!584162 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584148 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584148 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584158 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584158 (select (arr!41932 _keys!1741) from!2144))))

(declare-fun lt!584166 () Unit!43212)

(declare-fun addApplyDifferent!567 (ListLongMap!20301 (_ BitVec 64) V!51683 (_ BitVec 64)) Unit!43212)

(assert (=> b!1305016 (= lt!584166 (addApplyDifferent!567 lt!584162 lt!584148 minValue!1387 lt!584158))))

(assert (=> b!1305016 (= (apply!1025 (+!4487 lt!584162 (tuple2!22645 lt!584148 minValue!1387)) lt!584158) (apply!1025 lt!584162 lt!584158))))

(declare-fun lt!584164 () Unit!43212)

(assert (=> b!1305016 (= lt!584164 lt!584166)))

(declare-fun lt!584160 () ListLongMap!20301)

(assert (=> b!1305016 (= lt!584160 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584156 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584169 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584169 (select (arr!41932 _keys!1741) from!2144))))

(declare-fun lt!584165 () Unit!43212)

(assert (=> b!1305016 (= lt!584165 (addApplyDifferent!567 lt!584160 lt!584156 zeroValue!1387 lt!584169))))

(assert (=> b!1305016 (= (apply!1025 (+!4487 lt!584160 (tuple2!22645 lt!584156 zeroValue!1387)) lt!584169) (apply!1025 lt!584160 lt!584169))))

(declare-fun lt!584155 () Unit!43212)

(assert (=> b!1305016 (= lt!584155 lt!584165)))

(declare-fun lt!584151 () ListLongMap!20301)

(assert (=> b!1305016 (= lt!584151 (getCurrentListMapNoExtraKeys!6123 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!584152 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!584161 () (_ BitVec 64))

(assert (=> b!1305016 (= lt!584161 (select (arr!41932 _keys!1741) from!2144))))

(assert (=> b!1305016 (= lt!584167 (addApplyDifferent!567 lt!584151 lt!584152 minValue!1387 lt!584161))))

(assert (=> b!1305016 (= (apply!1025 (+!4487 lt!584151 (tuple2!22645 lt!584152 minValue!1387)) lt!584161) (apply!1025 lt!584151 lt!584161))))

(declare-fun b!1305017 () Bool)

(declare-fun res!866621 () Bool)

(assert (=> b!1305017 (=> (not res!866621) (not e!744400))))

(assert (=> b!1305017 (= res!866621 e!744395)))

(declare-fun c!125334 () Bool)

(assert (=> b!1305017 (= c!125334 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1305018 () Bool)

(assert (=> b!1305018 (= e!744390 (= (apply!1025 lt!584157 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64325 () Bool)

(assert (=> bm!64325 (= call!64328 (contains!8308 lt!584157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!141971 () Bool)

(assert (=> d!141971 e!744400))

(declare-fun res!866624 () Bool)

(assert (=> d!141971 (=> (not res!866624) (not e!744400))))

(assert (=> d!141971 (= res!866624 (or (bvsge from!2144 (size!42482 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42482 _keys!1741)))))))

(declare-fun lt!584168 () ListLongMap!20301)

(assert (=> d!141971 (= lt!584157 lt!584168)))

(declare-fun lt!584149 () Unit!43212)

(assert (=> d!141971 (= lt!584149 e!744393)))

(declare-fun c!125337 () Bool)

(assert (=> d!141971 (= c!125337 e!744396)))

(declare-fun res!866622 () Bool)

(assert (=> d!141971 (=> (not res!866622) (not e!744396))))

(assert (=> d!141971 (= res!866622 (bvslt from!2144 (size!42482 _keys!1741)))))

(assert (=> d!141971 (= lt!584168 e!744391)))

(assert (=> d!141971 (= c!125336 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141971 (validMask!0 mask!2175)))

(assert (=> d!141971 (= (getCurrentListMap!5183 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!584157)))

(declare-fun b!1305019 () Bool)

(assert (=> b!1305019 (= e!744391 (+!4487 call!64326 (tuple2!22645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1305020 () Bool)

(assert (=> b!1305020 (= e!744398 call!64323)))

(declare-fun bm!64326 () Bool)

(assert (=> bm!64326 (= call!64323 call!64326)))

(declare-fun b!1305021 () Bool)

(assert (=> b!1305021 (= e!744401 (= (apply!1025 lt!584157 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(assert (= (and d!141971 c!125336) b!1305019))

(assert (= (and d!141971 (not c!125336)) b!1305003))

(assert (= (and b!1305003 c!125332) b!1305020))

(assert (= (and b!1305003 (not c!125332)) b!1305011))

(assert (= (and b!1305011 c!125333) b!1305007))

(assert (= (and b!1305011 (not c!125333)) b!1305015))

(assert (= (or b!1305007 b!1305015) bm!64321))

(assert (= (or b!1305020 bm!64321) bm!64323))

(assert (= (or b!1305020 b!1305007) bm!64326))

(assert (= (or b!1305019 bm!64323) bm!64320))

(assert (= (or b!1305019 bm!64326) bm!64324))

(assert (= (and d!141971 res!866622) b!1305004))

(assert (= (and d!141971 c!125337) b!1305016))

(assert (= (and d!141971 (not c!125337)) b!1305008))

(assert (= (and d!141971 res!866624) b!1305001))

(assert (= (and b!1305001 res!866619) b!1305010))

(assert (= (and b!1305001 (not res!866617)) b!1305002))

(assert (= (and b!1305002 res!866623) b!1305005))

(assert (= (and b!1305001 res!866616) b!1305017))

(assert (= (and b!1305017 c!125334) b!1305014))

(assert (= (and b!1305017 (not c!125334)) b!1305012))

(assert (= (and b!1305014 res!866618) b!1305018))

(assert (= (or b!1305014 b!1305012) bm!64325))

(assert (= (and b!1305017 res!866621) b!1305006))

(assert (= (and b!1305006 c!125335) b!1305009))

(assert (= (and b!1305006 (not c!125335)) b!1305013))

(assert (= (and b!1305009 res!866620) b!1305021))

(assert (= (or b!1305009 b!1305013) bm!64322))

(declare-fun b_lambda!23331 () Bool)

(assert (=> (not b_lambda!23331) (not b!1305005)))

(assert (=> b!1305005 t!43369))

(declare-fun b_and!47493 () Bool)

(assert (= b_and!47491 (and (=> t!43369 result!23837) b_and!47493)))

(assert (=> b!1305002 m!1195911))

(assert (=> b!1305002 m!1195911))

(declare-fun m!1196043 () Bool)

(assert (=> b!1305002 m!1196043))

(declare-fun m!1196045 () Bool)

(assert (=> b!1305021 m!1196045))

(assert (=> d!141971 m!1195921))

(declare-fun m!1196047 () Bool)

(assert (=> bm!64324 m!1196047))

(assert (=> b!1305004 m!1195911))

(assert (=> b!1305004 m!1195911))

(assert (=> b!1305004 m!1195913))

(assert (=> b!1305010 m!1195911))

(assert (=> b!1305010 m!1195911))

(assert (=> b!1305010 m!1195913))

(declare-fun m!1196049 () Bool)

(assert (=> b!1305016 m!1196049))

(assert (=> b!1305016 m!1195933))

(declare-fun m!1196051 () Bool)

(assert (=> b!1305016 m!1196051))

(declare-fun m!1196053 () Bool)

(assert (=> b!1305016 m!1196053))

(declare-fun m!1196055 () Bool)

(assert (=> b!1305016 m!1196055))

(declare-fun m!1196057 () Bool)

(assert (=> b!1305016 m!1196057))

(declare-fun m!1196059 () Bool)

(assert (=> b!1305016 m!1196059))

(assert (=> b!1305016 m!1195911))

(declare-fun m!1196061 () Bool)

(assert (=> b!1305016 m!1196061))

(assert (=> b!1305016 m!1196059))

(declare-fun m!1196063 () Bool)

(assert (=> b!1305016 m!1196063))

(declare-fun m!1196065 () Bool)

(assert (=> b!1305016 m!1196065))

(declare-fun m!1196067 () Bool)

(assert (=> b!1305016 m!1196067))

(declare-fun m!1196069 () Bool)

(assert (=> b!1305016 m!1196069))

(declare-fun m!1196071 () Bool)

(assert (=> b!1305016 m!1196071))

(assert (=> b!1305016 m!1196057))

(declare-fun m!1196073 () Bool)

(assert (=> b!1305016 m!1196073))

(assert (=> b!1305016 m!1196053))

(declare-fun m!1196075 () Bool)

(assert (=> b!1305016 m!1196075))

(assert (=> b!1305016 m!1196065))

(declare-fun m!1196077 () Bool)

(assert (=> b!1305016 m!1196077))

(declare-fun m!1196079 () Bool)

(assert (=> b!1305019 m!1196079))

(declare-fun m!1196081 () Bool)

(assert (=> bm!64322 m!1196081))

(assert (=> b!1305005 m!1196013))

(assert (=> b!1305005 m!1196011))

(assert (=> b!1305005 m!1195911))

(declare-fun m!1196083 () Bool)

(assert (=> b!1305005 m!1196083))

(assert (=> b!1305005 m!1195911))

(assert (=> b!1305005 m!1196011))

(assert (=> b!1305005 m!1196013))

(assert (=> b!1305005 m!1196015))

(declare-fun m!1196085 () Bool)

(assert (=> bm!64325 m!1196085))

(declare-fun m!1196087 () Bool)

(assert (=> b!1305018 m!1196087))

(assert (=> bm!64320 m!1195933))

(assert (=> b!1304837 d!141971))

(declare-fun d!141973 () Bool)

(declare-fun res!866629 () Bool)

(declare-fun e!744410 () Bool)

(assert (=> d!141973 (=> res!866629 e!744410)))

(assert (=> d!141973 (= res!866629 (bvsge #b00000000000000000000000000000000 (size!42482 _keys!1741)))))

(assert (=> d!141973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744410)))

(declare-fun bm!64329 () Bool)

(declare-fun call!64332 () Bool)

(assert (=> bm!64329 (= call!64332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1305030 () Bool)

(declare-fun e!744408 () Bool)

(declare-fun e!744409 () Bool)

(assert (=> b!1305030 (= e!744408 e!744409)))

(declare-fun lt!584178 () (_ BitVec 64))

(assert (=> b!1305030 (= lt!584178 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!584177 () Unit!43212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86888 (_ BitVec 64) (_ BitVec 32)) Unit!43212)

(assert (=> b!1305030 (= lt!584177 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!584178 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1305030 (arrayContainsKey!0 _keys!1741 lt!584178 #b00000000000000000000000000000000)))

(declare-fun lt!584176 () Unit!43212)

(assert (=> b!1305030 (= lt!584176 lt!584177)))

(declare-fun res!866630 () Bool)

(declare-datatypes ((SeekEntryResult!10028 0))(
  ( (MissingZero!10028 (index!42483 (_ BitVec 32))) (Found!10028 (index!42484 (_ BitVec 32))) (Intermediate!10028 (undefined!10840 Bool) (index!42485 (_ BitVec 32)) (x!115894 (_ BitVec 32))) (Undefined!10028) (MissingVacant!10028 (index!42486 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86888 (_ BitVec 32)) SeekEntryResult!10028)

(assert (=> b!1305030 (= res!866630 (= (seekEntryOrOpen!0 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10028 #b00000000000000000000000000000000)))))

(assert (=> b!1305030 (=> (not res!866630) (not e!744409))))

(declare-fun b!1305031 () Bool)

(assert (=> b!1305031 (= e!744409 call!64332)))

(declare-fun b!1305032 () Bool)

(assert (=> b!1305032 (= e!744410 e!744408)))

(declare-fun c!125340 () Bool)

(assert (=> b!1305032 (= c!125340 (validKeyInArray!0 (select (arr!41932 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1305033 () Bool)

(assert (=> b!1305033 (= e!744408 call!64332)))

(assert (= (and d!141973 (not res!866629)) b!1305032))

(assert (= (and b!1305032 c!125340) b!1305030))

(assert (= (and b!1305032 (not c!125340)) b!1305033))

(assert (= (and b!1305030 res!866630) b!1305031))

(assert (= (or b!1305031 b!1305033) bm!64329))

(declare-fun m!1196089 () Bool)

(assert (=> bm!64329 m!1196089))

(assert (=> b!1305030 m!1195977))

(declare-fun m!1196091 () Bool)

(assert (=> b!1305030 m!1196091))

(declare-fun m!1196093 () Bool)

(assert (=> b!1305030 m!1196093))

(assert (=> b!1305030 m!1195977))

(declare-fun m!1196095 () Bool)

(assert (=> b!1305030 m!1196095))

(assert (=> b!1305032 m!1195977))

(assert (=> b!1305032 m!1195977))

(assert (=> b!1305032 m!1195981))

(assert (=> b!1304842 d!141973))

(declare-fun d!141975 () Bool)

(assert (=> d!141975 (= (validKeyInArray!0 (select (arr!41932 _keys!1741) from!2144)) (and (not (= (select (arr!41932 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41932 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304843 d!141975))

(declare-fun b!1305041 () Bool)

(declare-fun e!744415 () Bool)

(assert (=> b!1305041 (= e!744415 tp_is_empty!34935)))

(declare-fun mapNonEmpty!54012 () Bool)

(declare-fun mapRes!54012 () Bool)

(declare-fun tp!103056 () Bool)

(declare-fun e!744416 () Bool)

(assert (=> mapNonEmpty!54012 (= mapRes!54012 (and tp!103056 e!744416))))

(declare-fun mapRest!54012 () (Array (_ BitVec 32) ValueCell!16569))

(declare-fun mapKey!54012 () (_ BitVec 32))

(declare-fun mapValue!54012 () ValueCell!16569)

(assert (=> mapNonEmpty!54012 (= mapRest!54006 (store mapRest!54012 mapKey!54012 mapValue!54012))))

(declare-fun b!1305040 () Bool)

(assert (=> b!1305040 (= e!744416 tp_is_empty!34935)))

(declare-fun mapIsEmpty!54012 () Bool)

(assert (=> mapIsEmpty!54012 mapRes!54012))

(declare-fun condMapEmpty!54012 () Bool)

(declare-fun mapDefault!54012 () ValueCell!16569)

(assert (=> mapNonEmpty!54006 (= condMapEmpty!54012 (= mapRest!54006 ((as const (Array (_ BitVec 32) ValueCell!16569)) mapDefault!54012)))))

(assert (=> mapNonEmpty!54006 (= tp!103047 (and e!744415 mapRes!54012))))

(assert (= (and mapNonEmpty!54006 condMapEmpty!54012) mapIsEmpty!54012))

(assert (= (and mapNonEmpty!54006 (not condMapEmpty!54012)) mapNonEmpty!54012))

(assert (= (and mapNonEmpty!54012 ((_ is ValueCellFull!16569) mapValue!54012)) b!1305040))

(assert (= (and mapNonEmpty!54006 ((_ is ValueCellFull!16569) mapDefault!54012)) b!1305041))

(declare-fun m!1196097 () Bool)

(assert (=> mapNonEmpty!54012 m!1196097))

(declare-fun b_lambda!23333 () Bool)

(assert (= b_lambda!23331 (or (and start!110224 b_free!29295) b_lambda!23333)))

(declare-fun b_lambda!23335 () Bool)

(assert (= b_lambda!23327 (or (and start!110224 b_free!29295) b_lambda!23335)))

(declare-fun b_lambda!23337 () Bool)

(assert (= b_lambda!23329 (or (and start!110224 b_free!29295) b_lambda!23337)))

(check-sat (not b!1305010) (not bm!64325) (not d!141967) (not b!1304887) (not b!1304956) (not b!1304901) (not b!1305005) (not b!1304903) (not b!1305019) (not b!1304942) (not b!1305018) b_and!47493 (not bm!64329) (not b!1304907) (not b!1305002) (not b!1305021) (not d!141957) (not b_lambda!23335) (not d!141961) (not b_lambda!23333) (not b!1304889) (not bm!64305) (not b!1304912) (not b!1304943) (not d!141971) (not bm!64322) (not b!1304946) (not b!1305016) (not b!1304948) (not d!141963) (not bm!64302) (not b_next!29295) (not b!1305032) (not b!1304947) (not b!1304913) (not b!1304905) (not b!1304902) (not bm!64324) (not b!1304958) (not b_lambda!23337) (not d!141965) (not b!1304950) (not d!141969) (not b!1304951) (not mapNonEmpty!54012) (not b!1305004) (not b!1305030) tp_is_empty!34935 (not b!1304944) (not bm!64320) (not d!141955))
(check-sat b_and!47493 (not b_next!29295))
