; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109768 () Bool)

(assert start!109768)

(declare-fun b_free!29181 () Bool)

(declare-fun b_next!29181 () Bool)

(assert (=> start!109768 (= b_free!29181 (not b_next!29181))))

(declare-fun tp!102674 () Bool)

(declare-fun b_and!47289 () Bool)

(assert (=> start!109768 (= tp!102674 b_and!47289)))

(declare-fun b!1300258 () Bool)

(declare-fun e!741713 () Bool)

(declare-fun tp_is_empty!34821 () Bool)

(assert (=> b!1300258 (= e!741713 tp_is_empty!34821)))

(declare-fun mapIsEmpty!53804 () Bool)

(declare-fun mapRes!53804 () Bool)

(assert (=> mapIsEmpty!53804 mapRes!53804))

(declare-fun b!1300259 () Bool)

(declare-fun e!741711 () Bool)

(assert (=> b!1300259 (= e!741711 tp_is_empty!34821)))

(declare-fun b!1300260 () Bool)

(declare-fun e!741710 () Bool)

(assert (=> b!1300260 (= e!741710 (and e!741711 mapRes!53804))))

(declare-fun condMapEmpty!53804 () Bool)

(declare-datatypes ((V!51531 0))(
  ( (V!51532 (val!17485 Int)) )
))
(declare-datatypes ((ValueCell!16512 0))(
  ( (ValueCellFull!16512 (v!20092 V!51531)) (EmptyCell!16512) )
))
(declare-datatypes ((array!86652 0))(
  ( (array!86653 (arr!41823 (Array (_ BitVec 32) ValueCell!16512)) (size!42373 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86652)

(declare-fun mapDefault!53804 () ValueCell!16512)

(assert (=> b!1300260 (= condMapEmpty!53804 (= (arr!41823 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16512)) mapDefault!53804)))))

(declare-fun b!1300261 () Bool)

(declare-fun res!864077 () Bool)

(declare-fun e!741712 () Bool)

(assert (=> b!1300261 (=> (not res!864077) (not e!741712))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86654 0))(
  ( (array!86655 (arr!41824 (Array (_ BitVec 32) (_ BitVec 64))) (size!42374 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86654)

(assert (=> b!1300261 (= res!864077 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42374 _keys!1741))))))

(declare-fun b!1300262 () Bool)

(declare-fun res!864079 () Bool)

(assert (=> b!1300262 (=> (not res!864079) (not e!741712))))

(assert (=> b!1300262 (= res!864079 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741))))))

(declare-fun b!1300263 () Bool)

(declare-fun res!864075 () Bool)

(assert (=> b!1300263 (=> (not res!864075) (not e!741712))))

(declare-fun minValue!1387 () V!51531)

(declare-fun zeroValue!1387 () V!51531)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22548 0))(
  ( (tuple2!22549 (_1!11285 (_ BitVec 64)) (_2!11285 V!51531)) )
))
(declare-datatypes ((List!29681 0))(
  ( (Nil!29678) (Cons!29677 (h!30886 tuple2!22548) (t!43253 List!29681)) )
))
(declare-datatypes ((ListLongMap!20205 0))(
  ( (ListLongMap!20206 (toList!10118 List!29681)) )
))
(declare-fun contains!8242 (ListLongMap!20205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5145 (array!86654 array!86652 (_ BitVec 32) (_ BitVec 32) V!51531 V!51531 (_ BitVec 32) Int) ListLongMap!20205)

(assert (=> b!1300263 (= res!864075 (contains!8242 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300264 () Bool)

(declare-fun res!864072 () Bool)

(assert (=> b!1300264 (=> (not res!864072) (not e!741712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86654 (_ BitVec 32)) Bool)

(assert (=> b!1300264 (= res!864072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300265 () Bool)

(declare-fun res!864071 () Bool)

(assert (=> b!1300265 (=> (not res!864071) (not e!741712))))

(assert (=> b!1300265 (= res!864071 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300266 () Bool)

(declare-fun res!864074 () Bool)

(assert (=> b!1300266 (=> (not res!864074) (not e!741712))))

(assert (=> b!1300266 (= res!864074 (and (= (size!42373 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42374 _keys!1741) (size!42373 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!864078 () Bool)

(assert (=> start!109768 (=> (not res!864078) (not e!741712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109768 (= res!864078 (validMask!0 mask!2175))))

(assert (=> start!109768 e!741712))

(assert (=> start!109768 tp_is_empty!34821))

(assert (=> start!109768 true))

(declare-fun array_inv!31643 (array!86652) Bool)

(assert (=> start!109768 (and (array_inv!31643 _values!1445) e!741710)))

(declare-fun array_inv!31644 (array!86654) Bool)

(assert (=> start!109768 (array_inv!31644 _keys!1741)))

(assert (=> start!109768 tp!102674))

(declare-fun b!1300267 () Bool)

(declare-fun +!4450 (ListLongMap!20205 tuple2!22548) ListLongMap!20205)

(declare-fun getCurrentListMapNoExtraKeys!6081 (array!86654 array!86652 (_ BitVec 32) (_ BitVec 32) V!51531 V!51531 (_ BitVec 32) Int) ListLongMap!20205)

(assert (=> b!1300267 (= e!741712 (not (contains!8242 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun b!1300268 () Bool)

(declare-fun res!864073 () Bool)

(assert (=> b!1300268 (=> (not res!864073) (not e!741712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300268 (= res!864073 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1300269 () Bool)

(declare-fun res!864076 () Bool)

(assert (=> b!1300269 (=> (not res!864076) (not e!741712))))

(declare-datatypes ((List!29682 0))(
  ( (Nil!29679) (Cons!29678 (h!30887 (_ BitVec 64)) (t!43254 List!29682)) )
))
(declare-fun arrayNoDuplicates!0 (array!86654 (_ BitVec 32) List!29682) Bool)

(assert (=> b!1300269 (= res!864076 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29679))))

(declare-fun mapNonEmpty!53804 () Bool)

(declare-fun tp!102673 () Bool)

(assert (=> mapNonEmpty!53804 (= mapRes!53804 (and tp!102673 e!741713))))

(declare-fun mapValue!53804 () ValueCell!16512)

(declare-fun mapRest!53804 () (Array (_ BitVec 32) ValueCell!16512))

(declare-fun mapKey!53804 () (_ BitVec 32))

(assert (=> mapNonEmpty!53804 (= (arr!41823 _values!1445) (store mapRest!53804 mapKey!53804 mapValue!53804))))

(assert (= (and start!109768 res!864078) b!1300266))

(assert (= (and b!1300266 res!864074) b!1300264))

(assert (= (and b!1300264 res!864072) b!1300269))

(assert (= (and b!1300269 res!864076) b!1300262))

(assert (= (and b!1300262 res!864079) b!1300263))

(assert (= (and b!1300263 res!864075) b!1300261))

(assert (= (and b!1300261 res!864077) b!1300268))

(assert (= (and b!1300268 res!864073) b!1300265))

(assert (= (and b!1300265 res!864071) b!1300267))

(assert (= (and b!1300260 condMapEmpty!53804) mapIsEmpty!53804))

(assert (= (and b!1300260 (not condMapEmpty!53804)) mapNonEmpty!53804))

(get-info :version)

(assert (= (and mapNonEmpty!53804 ((_ is ValueCellFull!16512) mapValue!53804)) b!1300258))

(assert (= (and b!1300260 ((_ is ValueCellFull!16512) mapDefault!53804)) b!1300259))

(assert (= start!109768 b!1300260))

(declare-fun m!1191233 () Bool)

(assert (=> b!1300268 m!1191233))

(assert (=> b!1300268 m!1191233))

(declare-fun m!1191235 () Bool)

(assert (=> b!1300268 m!1191235))

(declare-fun m!1191237 () Bool)

(assert (=> b!1300267 m!1191237))

(assert (=> b!1300267 m!1191237))

(declare-fun m!1191239 () Bool)

(assert (=> b!1300267 m!1191239))

(assert (=> b!1300267 m!1191239))

(declare-fun m!1191241 () Bool)

(assert (=> b!1300267 m!1191241))

(declare-fun m!1191243 () Bool)

(assert (=> mapNonEmpty!53804 m!1191243))

(declare-fun m!1191245 () Bool)

(assert (=> b!1300264 m!1191245))

(declare-fun m!1191247 () Bool)

(assert (=> b!1300269 m!1191247))

(declare-fun m!1191249 () Bool)

(assert (=> start!109768 m!1191249))

(declare-fun m!1191251 () Bool)

(assert (=> start!109768 m!1191251))

(declare-fun m!1191253 () Bool)

(assert (=> start!109768 m!1191253))

(declare-fun m!1191255 () Bool)

(assert (=> b!1300263 m!1191255))

(assert (=> b!1300263 m!1191255))

(declare-fun m!1191257 () Bool)

(assert (=> b!1300263 m!1191257))

(check-sat b_and!47289 tp_is_empty!34821 (not start!109768) (not b!1300268) (not mapNonEmpty!53804) (not b!1300263) (not b_next!29181) (not b!1300264) (not b!1300267) (not b!1300269))
(check-sat b_and!47289 (not b_next!29181))
(get-model)

(declare-fun d!141157 () Bool)

(declare-fun e!741734 () Bool)

(assert (=> d!141157 e!741734))

(declare-fun res!864109 () Bool)

(assert (=> d!141157 (=> res!864109 e!741734)))

(declare-fun lt!581280 () Bool)

(assert (=> d!141157 (= res!864109 (not lt!581280))))

(declare-fun lt!581281 () Bool)

(assert (=> d!141157 (= lt!581280 lt!581281)))

(declare-datatypes ((Unit!43035 0))(
  ( (Unit!43036) )
))
(declare-fun lt!581279 () Unit!43035)

(declare-fun e!741735 () Unit!43035)

(assert (=> d!141157 (= lt!581279 e!741735)))

(declare-fun c!124561 () Bool)

(assert (=> d!141157 (= c!124561 lt!581281)))

(declare-fun containsKey!721 (List!29681 (_ BitVec 64)) Bool)

(assert (=> d!141157 (= lt!581281 (containsKey!721 (toList!10118 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141157 (= (contains!8242 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!581280)))

(declare-fun b!1300312 () Bool)

(declare-fun lt!581278 () Unit!43035)

(assert (=> b!1300312 (= e!741735 lt!581278)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!467 (List!29681 (_ BitVec 64)) Unit!43035)

(assert (=> b!1300312 (= lt!581278 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10118 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-datatypes ((Option!751 0))(
  ( (Some!750 (v!20094 V!51531)) (None!749) )
))
(declare-fun isDefined!506 (Option!751) Bool)

(declare-fun getValueByKey!699 (List!29681 (_ BitVec 64)) Option!751)

(assert (=> b!1300312 (isDefined!506 (getValueByKey!699 (toList!10118 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1300313 () Bool)

(declare-fun Unit!43037 () Unit!43035)

(assert (=> b!1300313 (= e!741735 Unit!43037)))

(declare-fun b!1300314 () Bool)

(assert (=> b!1300314 (= e!741734 (isDefined!506 (getValueByKey!699 (toList!10118 (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141157 c!124561) b!1300312))

(assert (= (and d!141157 (not c!124561)) b!1300313))

(assert (= (and d!141157 (not res!864109)) b!1300314))

(declare-fun m!1191285 () Bool)

(assert (=> d!141157 m!1191285))

(declare-fun m!1191287 () Bool)

(assert (=> b!1300312 m!1191287))

(declare-fun m!1191289 () Bool)

(assert (=> b!1300312 m!1191289))

(assert (=> b!1300312 m!1191289))

(declare-fun m!1191291 () Bool)

(assert (=> b!1300312 m!1191291))

(assert (=> b!1300314 m!1191289))

(assert (=> b!1300314 m!1191289))

(assert (=> b!1300314 m!1191291))

(assert (=> b!1300267 d!141157))

(declare-fun d!141159 () Bool)

(declare-fun e!741738 () Bool)

(assert (=> d!141159 e!741738))

(declare-fun res!864115 () Bool)

(assert (=> d!141159 (=> (not res!864115) (not e!741738))))

(declare-fun lt!581291 () ListLongMap!20205)

(assert (=> d!141159 (= res!864115 (contains!8242 lt!581291 (_1!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581292 () List!29681)

(assert (=> d!141159 (= lt!581291 (ListLongMap!20206 lt!581292))))

(declare-fun lt!581290 () Unit!43035)

(declare-fun lt!581293 () Unit!43035)

(assert (=> d!141159 (= lt!581290 lt!581293)))

(assert (=> d!141159 (= (getValueByKey!699 lt!581292 (_1!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!750 (_2!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!345 (List!29681 (_ BitVec 64) V!51531) Unit!43035)

(assert (=> d!141159 (= lt!581293 (lemmaContainsTupThenGetReturnValue!345 lt!581292 (_1!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!474 (List!29681 (_ BitVec 64) V!51531) List!29681)

(assert (=> d!141159 (= lt!581292 (insertStrictlySorted!474 (toList!10118 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141159 (= (+!4450 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581291)))

(declare-fun b!1300319 () Bool)

(declare-fun res!864114 () Bool)

(assert (=> b!1300319 (=> (not res!864114) (not e!741738))))

(assert (=> b!1300319 (= res!864114 (= (getValueByKey!699 (toList!10118 lt!581291) (_1!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!750 (_2!11285 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1300320 () Bool)

(declare-fun contains!8244 (List!29681 tuple2!22548) Bool)

(assert (=> b!1300320 (= e!741738 (contains!8244 (toList!10118 lt!581291) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141159 res!864115) b!1300319))

(assert (= (and b!1300319 res!864114) b!1300320))

(declare-fun m!1191293 () Bool)

(assert (=> d!141159 m!1191293))

(declare-fun m!1191295 () Bool)

(assert (=> d!141159 m!1191295))

(declare-fun m!1191297 () Bool)

(assert (=> d!141159 m!1191297))

(declare-fun m!1191299 () Bool)

(assert (=> d!141159 m!1191299))

(declare-fun m!1191301 () Bool)

(assert (=> b!1300319 m!1191301))

(declare-fun m!1191303 () Bool)

(assert (=> b!1300320 m!1191303))

(assert (=> b!1300267 d!141159))

(declare-fun b!1300345 () Bool)

(assert (=> b!1300345 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741)))))

(assert (=> b!1300345 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42373 _values!1445)))))

(declare-fun e!741757 () Bool)

(declare-fun lt!581310 () ListLongMap!20205)

(declare-fun apply!1016 (ListLongMap!20205 (_ BitVec 64)) V!51531)

(declare-fun get!21121 (ValueCell!16512 V!51531) V!51531)

(declare-fun dynLambda!3420 (Int (_ BitVec 64)) V!51531)

(assert (=> b!1300345 (= e!741757 (= (apply!1016 lt!581310 (select (arr!41824 _keys!1741) from!2144)) (get!21121 (select (arr!41823 _values!1445) from!2144) (dynLambda!3420 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1300346 () Bool)

(declare-fun e!741754 () ListLongMap!20205)

(declare-fun e!741755 () ListLongMap!20205)

(assert (=> b!1300346 (= e!741754 e!741755)))

(declare-fun c!124573 () Bool)

(assert (=> b!1300346 (= c!124573 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun b!1300347 () Bool)

(declare-fun res!864126 () Bool)

(declare-fun e!741758 () Bool)

(assert (=> b!1300347 (=> (not res!864126) (not e!741758))))

(assert (=> b!1300347 (= res!864126 (not (contains!8242 lt!581310 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1300348 () Bool)

(declare-fun e!741759 () Bool)

(assert (=> b!1300348 (= e!741759 (= lt!581310 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun d!141161 () Bool)

(assert (=> d!141161 e!741758))

(declare-fun res!864125 () Bool)

(assert (=> d!141161 (=> (not res!864125) (not e!741758))))

(assert (=> d!141161 (= res!864125 (not (contains!8242 lt!581310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141161 (= lt!581310 e!741754)))

(declare-fun c!124570 () Bool)

(assert (=> d!141161 (= c!124570 (bvsge from!2144 (size!42374 _keys!1741)))))

(assert (=> d!141161 (validMask!0 mask!2175)))

(assert (=> d!141161 (= (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581310)))

(declare-fun call!63633 () ListLongMap!20205)

(declare-fun bm!63630 () Bool)

(assert (=> bm!63630 (= call!63633 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1300349 () Bool)

(declare-fun e!741756 () Bool)

(assert (=> b!1300349 (= e!741756 e!741757)))

(assert (=> b!1300349 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun res!864127 () Bool)

(assert (=> b!1300349 (= res!864127 (contains!8242 lt!581310 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1300349 (=> (not res!864127) (not e!741757))))

(declare-fun b!1300350 () Bool)

(assert (=> b!1300350 (= e!741758 e!741756)))

(declare-fun c!124571 () Bool)

(declare-fun e!741753 () Bool)

(assert (=> b!1300350 (= c!124571 e!741753)))

(declare-fun res!864124 () Bool)

(assert (=> b!1300350 (=> (not res!864124) (not e!741753))))

(assert (=> b!1300350 (= res!864124 (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun b!1300351 () Bool)

(assert (=> b!1300351 (= e!741756 e!741759)))

(declare-fun c!124572 () Bool)

(assert (=> b!1300351 (= c!124572 (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun b!1300352 () Bool)

(declare-fun lt!581313 () Unit!43035)

(declare-fun lt!581308 () Unit!43035)

(assert (=> b!1300352 (= lt!581313 lt!581308)))

(declare-fun lt!581314 () (_ BitVec 64))

(declare-fun lt!581309 () (_ BitVec 64))

(declare-fun lt!581312 () V!51531)

(declare-fun lt!581311 () ListLongMap!20205)

(assert (=> b!1300352 (not (contains!8242 (+!4450 lt!581311 (tuple2!22549 lt!581309 lt!581312)) lt!581314))))

(declare-fun addStillNotContains!458 (ListLongMap!20205 (_ BitVec 64) V!51531 (_ BitVec 64)) Unit!43035)

(assert (=> b!1300352 (= lt!581308 (addStillNotContains!458 lt!581311 lt!581309 lt!581312 lt!581314))))

(assert (=> b!1300352 (= lt!581314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1300352 (= lt!581312 (get!21121 (select (arr!41823 _values!1445) from!2144) (dynLambda!3420 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1300352 (= lt!581309 (select (arr!41824 _keys!1741) from!2144))))

(assert (=> b!1300352 (= lt!581311 call!63633)))

(assert (=> b!1300352 (= e!741755 (+!4450 call!63633 (tuple2!22549 (select (arr!41824 _keys!1741) from!2144) (get!21121 (select (arr!41823 _values!1445) from!2144) (dynLambda!3420 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1300353 () Bool)

(declare-fun isEmpty!1052 (ListLongMap!20205) Bool)

(assert (=> b!1300353 (= e!741759 (isEmpty!1052 lt!581310))))

(declare-fun b!1300354 () Bool)

(assert (=> b!1300354 (= e!741754 (ListLongMap!20206 Nil!29678))))

(declare-fun b!1300355 () Bool)

(assert (=> b!1300355 (= e!741753 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1300355 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1300356 () Bool)

(assert (=> b!1300356 (= e!741755 call!63633)))

(assert (= (and d!141161 c!124570) b!1300354))

(assert (= (and d!141161 (not c!124570)) b!1300346))

(assert (= (and b!1300346 c!124573) b!1300352))

(assert (= (and b!1300346 (not c!124573)) b!1300356))

(assert (= (or b!1300352 b!1300356) bm!63630))

(assert (= (and d!141161 res!864125) b!1300347))

(assert (= (and b!1300347 res!864126) b!1300350))

(assert (= (and b!1300350 res!864124) b!1300355))

(assert (= (and b!1300350 c!124571) b!1300349))

(assert (= (and b!1300350 (not c!124571)) b!1300351))

(assert (= (and b!1300349 res!864127) b!1300345))

(assert (= (and b!1300351 c!124572) b!1300348))

(assert (= (and b!1300351 (not c!124572)) b!1300353))

(declare-fun b_lambda!23173 () Bool)

(assert (=> (not b_lambda!23173) (not b!1300345)))

(declare-fun t!43258 () Bool)

(declare-fun tb!11377 () Bool)

(assert (=> (and start!109768 (= defaultEntry!1448 defaultEntry!1448) t!43258) tb!11377))

(declare-fun result!23763 () Bool)

(assert (=> tb!11377 (= result!23763 tp_is_empty!34821)))

(assert (=> b!1300345 t!43258))

(declare-fun b_and!47293 () Bool)

(assert (= b_and!47289 (and (=> t!43258 result!23763) b_and!47293)))

(declare-fun b_lambda!23175 () Bool)

(assert (=> (not b_lambda!23175) (not b!1300352)))

(assert (=> b!1300352 t!43258))

(declare-fun b_and!47295 () Bool)

(assert (= b_and!47293 (and (=> t!43258 result!23763) b_and!47295)))

(declare-fun m!1191305 () Bool)

(assert (=> bm!63630 m!1191305))

(declare-fun m!1191307 () Bool)

(assert (=> d!141161 m!1191307))

(assert (=> d!141161 m!1191249))

(assert (=> b!1300348 m!1191305))

(assert (=> b!1300355 m!1191233))

(assert (=> b!1300355 m!1191233))

(assert (=> b!1300355 m!1191235))

(declare-fun m!1191309 () Bool)

(assert (=> b!1300347 m!1191309))

(assert (=> b!1300349 m!1191233))

(assert (=> b!1300349 m!1191233))

(declare-fun m!1191311 () Bool)

(assert (=> b!1300349 m!1191311))

(declare-fun m!1191313 () Bool)

(assert (=> b!1300353 m!1191313))

(assert (=> b!1300345 m!1191233))

(declare-fun m!1191315 () Bool)

(assert (=> b!1300345 m!1191315))

(declare-fun m!1191317 () Bool)

(assert (=> b!1300345 m!1191317))

(declare-fun m!1191319 () Bool)

(assert (=> b!1300345 m!1191319))

(assert (=> b!1300345 m!1191315))

(assert (=> b!1300345 m!1191317))

(assert (=> b!1300345 m!1191233))

(declare-fun m!1191321 () Bool)

(assert (=> b!1300345 m!1191321))

(assert (=> b!1300346 m!1191233))

(assert (=> b!1300346 m!1191233))

(assert (=> b!1300346 m!1191235))

(assert (=> b!1300352 m!1191233))

(declare-fun m!1191323 () Bool)

(assert (=> b!1300352 m!1191323))

(declare-fun m!1191325 () Bool)

(assert (=> b!1300352 m!1191325))

(assert (=> b!1300352 m!1191315))

(assert (=> b!1300352 m!1191317))

(assert (=> b!1300352 m!1191319))

(assert (=> b!1300352 m!1191315))

(assert (=> b!1300352 m!1191317))

(declare-fun m!1191327 () Bool)

(assert (=> b!1300352 m!1191327))

(declare-fun m!1191329 () Bool)

(assert (=> b!1300352 m!1191329))

(assert (=> b!1300352 m!1191323))

(assert (=> b!1300267 d!141161))

(declare-fun d!141163 () Bool)

(assert (=> d!141163 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109768 d!141163))

(declare-fun d!141165 () Bool)

(assert (=> d!141165 (= (array_inv!31643 _values!1445) (bvsge (size!42373 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109768 d!141165))

(declare-fun d!141167 () Bool)

(assert (=> d!141167 (= (array_inv!31644 _keys!1741) (bvsge (size!42374 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109768 d!141167))

(declare-fun d!141169 () Bool)

(declare-fun res!864135 () Bool)

(declare-fun e!741771 () Bool)

(assert (=> d!141169 (=> res!864135 e!741771)))

(assert (=> d!141169 (= res!864135 (bvsge #b00000000000000000000000000000000 (size!42374 _keys!1741)))))

(assert (=> d!141169 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29679) e!741771)))

(declare-fun b!1300369 () Bool)

(declare-fun e!741770 () Bool)

(assert (=> b!1300369 (= e!741771 e!741770)))

(declare-fun res!864136 () Bool)

(assert (=> b!1300369 (=> (not res!864136) (not e!741770))))

(declare-fun e!741768 () Bool)

(assert (=> b!1300369 (= res!864136 (not e!741768))))

(declare-fun res!864134 () Bool)

(assert (=> b!1300369 (=> (not res!864134) (not e!741768))))

(assert (=> b!1300369 (= res!864134 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300370 () Bool)

(declare-fun e!741769 () Bool)

(declare-fun call!63636 () Bool)

(assert (=> b!1300370 (= e!741769 call!63636)))

(declare-fun b!1300371 () Bool)

(declare-fun contains!8245 (List!29682 (_ BitVec 64)) Bool)

(assert (=> b!1300371 (= e!741768 (contains!8245 Nil!29679 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300372 () Bool)

(assert (=> b!1300372 (= e!741769 call!63636)))

(declare-fun bm!63633 () Bool)

(declare-fun c!124576 () Bool)

(assert (=> bm!63633 (= call!63636 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124576 (Cons!29678 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) Nil!29679) Nil!29679)))))

(declare-fun b!1300373 () Bool)

(assert (=> b!1300373 (= e!741770 e!741769)))

(assert (=> b!1300373 (= c!124576 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141169 (not res!864135)) b!1300369))

(assert (= (and b!1300369 res!864134) b!1300371))

(assert (= (and b!1300369 res!864136) b!1300373))

(assert (= (and b!1300373 c!124576) b!1300372))

(assert (= (and b!1300373 (not c!124576)) b!1300370))

(assert (= (or b!1300372 b!1300370) bm!63633))

(declare-fun m!1191331 () Bool)

(assert (=> b!1300369 m!1191331))

(assert (=> b!1300369 m!1191331))

(declare-fun m!1191333 () Bool)

(assert (=> b!1300369 m!1191333))

(assert (=> b!1300371 m!1191331))

(assert (=> b!1300371 m!1191331))

(declare-fun m!1191335 () Bool)

(assert (=> b!1300371 m!1191335))

(assert (=> bm!63633 m!1191331))

(declare-fun m!1191337 () Bool)

(assert (=> bm!63633 m!1191337))

(assert (=> b!1300373 m!1191331))

(assert (=> b!1300373 m!1191331))

(assert (=> b!1300373 m!1191333))

(assert (=> b!1300269 d!141169))

(declare-fun d!141171 () Bool)

(declare-fun e!741772 () Bool)

(assert (=> d!141171 e!741772))

(declare-fun res!864137 () Bool)

(assert (=> d!141171 (=> res!864137 e!741772)))

(declare-fun lt!581317 () Bool)

(assert (=> d!141171 (= res!864137 (not lt!581317))))

(declare-fun lt!581318 () Bool)

(assert (=> d!141171 (= lt!581317 lt!581318)))

(declare-fun lt!581316 () Unit!43035)

(declare-fun e!741773 () Unit!43035)

(assert (=> d!141171 (= lt!581316 e!741773)))

(declare-fun c!124577 () Bool)

(assert (=> d!141171 (= c!124577 lt!581318)))

(assert (=> d!141171 (= lt!581318 (containsKey!721 (toList!10118 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141171 (= (contains!8242 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581317)))

(declare-fun b!1300374 () Bool)

(declare-fun lt!581315 () Unit!43035)

(assert (=> b!1300374 (= e!741773 lt!581315)))

(assert (=> b!1300374 (= lt!581315 (lemmaContainsKeyImpliesGetValueByKeyDefined!467 (toList!10118 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1300374 (isDefined!506 (getValueByKey!699 (toList!10118 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300375 () Bool)

(declare-fun Unit!43038 () Unit!43035)

(assert (=> b!1300375 (= e!741773 Unit!43038)))

(declare-fun b!1300376 () Bool)

(assert (=> b!1300376 (= e!741772 (isDefined!506 (getValueByKey!699 (toList!10118 (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141171 c!124577) b!1300374))

(assert (= (and d!141171 (not c!124577)) b!1300375))

(assert (= (and d!141171 (not res!864137)) b!1300376))

(declare-fun m!1191339 () Bool)

(assert (=> d!141171 m!1191339))

(declare-fun m!1191341 () Bool)

(assert (=> b!1300374 m!1191341))

(declare-fun m!1191343 () Bool)

(assert (=> b!1300374 m!1191343))

(assert (=> b!1300374 m!1191343))

(declare-fun m!1191345 () Bool)

(assert (=> b!1300374 m!1191345))

(assert (=> b!1300376 m!1191343))

(assert (=> b!1300376 m!1191343))

(assert (=> b!1300376 m!1191345))

(assert (=> b!1300263 d!141171))

(declare-fun b!1300419 () Bool)

(declare-fun e!741804 () Bool)

(assert (=> b!1300419 (= e!741804 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun bm!63648 () Bool)

(declare-fun call!63655 () Bool)

(declare-fun lt!581366 () ListLongMap!20205)

(assert (=> bm!63648 (= call!63655 (contains!8242 lt!581366 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300420 () Bool)

(declare-fun e!741801 () Bool)

(declare-fun e!741811 () Bool)

(assert (=> b!1300420 (= e!741801 e!741811)))

(declare-fun c!124591 () Bool)

(assert (=> b!1300420 (= c!124591 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300421 () Bool)

(declare-fun e!741812 () Bool)

(assert (=> b!1300421 (= e!741812 (= (apply!1016 lt!581366 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300422 () Bool)

(declare-fun e!741800 () Bool)

(declare-fun e!741807 () Bool)

(assert (=> b!1300422 (= e!741800 e!741807)))

(declare-fun res!864162 () Bool)

(declare-fun call!63657 () Bool)

(assert (=> b!1300422 (= res!864162 call!63657)))

(assert (=> b!1300422 (=> (not res!864162) (not e!741807))))

(declare-fun bm!63649 () Bool)

(declare-fun call!63653 () ListLongMap!20205)

(declare-fun call!63656 () ListLongMap!20205)

(assert (=> bm!63649 (= call!63653 call!63656)))

(declare-fun b!1300423 () Bool)

(declare-fun e!741806 () Bool)

(assert (=> b!1300423 (= e!741806 (= (apply!1016 lt!581366 (select (arr!41824 _keys!1741) from!2144)) (get!21121 (select (arr!41823 _values!1445) from!2144) (dynLambda!3420 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300423 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42373 _values!1445)))))

(assert (=> b!1300423 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun bm!63650 () Bool)

(assert (=> bm!63650 (= call!63657 (contains!8242 lt!581366 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300424 () Bool)

(declare-fun res!864160 () Bool)

(assert (=> b!1300424 (=> (not res!864160) (not e!741801))))

(declare-fun e!741810 () Bool)

(assert (=> b!1300424 (= res!864160 e!741810)))

(declare-fun res!864161 () Bool)

(assert (=> b!1300424 (=> res!864161 e!741810)))

(declare-fun e!741809 () Bool)

(assert (=> b!1300424 (= res!864161 (not e!741809))))

(declare-fun res!864157 () Bool)

(assert (=> b!1300424 (=> (not res!864157) (not e!741809))))

(assert (=> b!1300424 (= res!864157 (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun b!1300425 () Bool)

(declare-fun e!741802 () Unit!43035)

(declare-fun Unit!43039 () Unit!43035)

(assert (=> b!1300425 (= e!741802 Unit!43039)))

(declare-fun b!1300426 () Bool)

(declare-fun c!124595 () Bool)

(assert (=> b!1300426 (= c!124595 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741808 () ListLongMap!20205)

(declare-fun e!741805 () ListLongMap!20205)

(assert (=> b!1300426 (= e!741808 e!741805)))

(declare-fun b!1300427 () Bool)

(declare-fun e!741803 () ListLongMap!20205)

(assert (=> b!1300427 (= e!741803 (+!4450 call!63656 (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1300428 () Bool)

(assert (=> b!1300428 (= e!741809 (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)))))

(declare-fun bm!63651 () Bool)

(declare-fun call!63652 () ListLongMap!20205)

(declare-fun call!63654 () ListLongMap!20205)

(assert (=> bm!63651 (= call!63652 call!63654)))

(declare-fun b!1300429 () Bool)

(assert (=> b!1300429 (= e!741811 e!741812)))

(declare-fun res!864159 () Bool)

(assert (=> b!1300429 (= res!864159 call!63655)))

(assert (=> b!1300429 (=> (not res!864159) (not e!741812))))

(declare-fun b!1300430 () Bool)

(assert (=> b!1300430 (= e!741808 call!63653)))

(declare-fun b!1300431 () Bool)

(assert (=> b!1300431 (= e!741803 e!741808)))

(declare-fun c!124594 () Bool)

(assert (=> b!1300431 (= c!124594 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300432 () Bool)

(declare-fun lt!581376 () Unit!43035)

(assert (=> b!1300432 (= e!741802 lt!581376)))

(declare-fun lt!581373 () ListLongMap!20205)

(assert (=> b!1300432 (= lt!581373 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581377 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581377 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581378 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581378 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!581375 () Unit!43035)

(declare-fun addStillContains!1104 (ListLongMap!20205 (_ BitVec 64) V!51531 (_ BitVec 64)) Unit!43035)

(assert (=> b!1300432 (= lt!581375 (addStillContains!1104 lt!581373 lt!581377 zeroValue!1387 lt!581378))))

(assert (=> b!1300432 (contains!8242 (+!4450 lt!581373 (tuple2!22549 lt!581377 zeroValue!1387)) lt!581378)))

(declare-fun lt!581372 () Unit!43035)

(assert (=> b!1300432 (= lt!581372 lt!581375)))

(declare-fun lt!581369 () ListLongMap!20205)

(assert (=> b!1300432 (= lt!581369 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581383 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581363 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581363 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!581381 () Unit!43035)

(declare-fun addApplyDifferent!558 (ListLongMap!20205 (_ BitVec 64) V!51531 (_ BitVec 64)) Unit!43035)

(assert (=> b!1300432 (= lt!581381 (addApplyDifferent!558 lt!581369 lt!581383 minValue!1387 lt!581363))))

(assert (=> b!1300432 (= (apply!1016 (+!4450 lt!581369 (tuple2!22549 lt!581383 minValue!1387)) lt!581363) (apply!1016 lt!581369 lt!581363))))

(declare-fun lt!581384 () Unit!43035)

(assert (=> b!1300432 (= lt!581384 lt!581381)))

(declare-fun lt!581368 () ListLongMap!20205)

(assert (=> b!1300432 (= lt!581368 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581367 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581371 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581371 (select (arr!41824 _keys!1741) from!2144))))

(declare-fun lt!581365 () Unit!43035)

(assert (=> b!1300432 (= lt!581365 (addApplyDifferent!558 lt!581368 lt!581367 zeroValue!1387 lt!581371))))

(assert (=> b!1300432 (= (apply!1016 (+!4450 lt!581368 (tuple2!22549 lt!581367 zeroValue!1387)) lt!581371) (apply!1016 lt!581368 lt!581371))))

(declare-fun lt!581370 () Unit!43035)

(assert (=> b!1300432 (= lt!581370 lt!581365)))

(declare-fun lt!581382 () ListLongMap!20205)

(assert (=> b!1300432 (= lt!581382 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581364 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581364 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581379 () (_ BitVec 64))

(assert (=> b!1300432 (= lt!581379 (select (arr!41824 _keys!1741) from!2144))))

(assert (=> b!1300432 (= lt!581376 (addApplyDifferent!558 lt!581382 lt!581364 minValue!1387 lt!581379))))

(assert (=> b!1300432 (= (apply!1016 (+!4450 lt!581382 (tuple2!22549 lt!581364 minValue!1387)) lt!581379) (apply!1016 lt!581382 lt!581379))))

(declare-fun b!1300433 () Bool)

(assert (=> b!1300433 (= e!741807 (= (apply!1016 lt!581366 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300434 () Bool)

(assert (=> b!1300434 (= e!741805 call!63653)))

(declare-fun call!63651 () ListLongMap!20205)

(declare-fun bm!63652 () Bool)

(assert (=> bm!63652 (= call!63651 (getCurrentListMapNoExtraKeys!6081 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun d!141173 () Bool)

(assert (=> d!141173 e!741801))

(declare-fun res!864164 () Bool)

(assert (=> d!141173 (=> (not res!864164) (not e!741801))))

(assert (=> d!141173 (= res!864164 (or (bvsge from!2144 (size!42374 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741)))))))

(declare-fun lt!581374 () ListLongMap!20205)

(assert (=> d!141173 (= lt!581366 lt!581374)))

(declare-fun lt!581380 () Unit!43035)

(assert (=> d!141173 (= lt!581380 e!741802)))

(declare-fun c!124592 () Bool)

(assert (=> d!141173 (= c!124592 e!741804)))

(declare-fun res!864156 () Bool)

(assert (=> d!141173 (=> (not res!864156) (not e!741804))))

(assert (=> d!141173 (= res!864156 (bvslt from!2144 (size!42374 _keys!1741)))))

(assert (=> d!141173 (= lt!581374 e!741803)))

(declare-fun c!124590 () Bool)

(assert (=> d!141173 (= c!124590 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141173 (validMask!0 mask!2175)))

(assert (=> d!141173 (= (getCurrentListMap!5145 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581366)))

(declare-fun bm!63653 () Bool)

(assert (=> bm!63653 (= call!63654 call!63651)))

(declare-fun b!1300435 () Bool)

(declare-fun res!864158 () Bool)

(assert (=> b!1300435 (=> (not res!864158) (not e!741801))))

(assert (=> b!1300435 (= res!864158 e!741800)))

(declare-fun c!124593 () Bool)

(assert (=> b!1300435 (= c!124593 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1300436 () Bool)

(assert (=> b!1300436 (= e!741805 call!63652)))

(declare-fun b!1300437 () Bool)

(assert (=> b!1300437 (= e!741811 (not call!63655))))

(declare-fun b!1300438 () Bool)

(assert (=> b!1300438 (= e!741810 e!741806)))

(declare-fun res!864163 () Bool)

(assert (=> b!1300438 (=> (not res!864163) (not e!741806))))

(assert (=> b!1300438 (= res!864163 (contains!8242 lt!581366 (select (arr!41824 _keys!1741) from!2144)))))

(assert (=> b!1300438 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42374 _keys!1741)))))

(declare-fun bm!63654 () Bool)

(assert (=> bm!63654 (= call!63656 (+!4450 (ite c!124590 call!63651 (ite c!124594 call!63654 call!63652)) (ite (or c!124590 c!124594) (tuple2!22549 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22549 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1300439 () Bool)

(assert (=> b!1300439 (= e!741800 (not call!63657))))

(assert (= (and d!141173 c!124590) b!1300427))

(assert (= (and d!141173 (not c!124590)) b!1300431))

(assert (= (and b!1300431 c!124594) b!1300430))

(assert (= (and b!1300431 (not c!124594)) b!1300426))

(assert (= (and b!1300426 c!124595) b!1300434))

(assert (= (and b!1300426 (not c!124595)) b!1300436))

(assert (= (or b!1300434 b!1300436) bm!63651))

(assert (= (or b!1300430 bm!63651) bm!63653))

(assert (= (or b!1300430 b!1300434) bm!63649))

(assert (= (or b!1300427 bm!63653) bm!63652))

(assert (= (or b!1300427 bm!63649) bm!63654))

(assert (= (and d!141173 res!864156) b!1300419))

(assert (= (and d!141173 c!124592) b!1300432))

(assert (= (and d!141173 (not c!124592)) b!1300425))

(assert (= (and d!141173 res!864164) b!1300424))

(assert (= (and b!1300424 res!864157) b!1300428))

(assert (= (and b!1300424 (not res!864161)) b!1300438))

(assert (= (and b!1300438 res!864163) b!1300423))

(assert (= (and b!1300424 res!864160) b!1300435))

(assert (= (and b!1300435 c!124593) b!1300422))

(assert (= (and b!1300435 (not c!124593)) b!1300439))

(assert (= (and b!1300422 res!864162) b!1300433))

(assert (= (or b!1300422 b!1300439) bm!63650))

(assert (= (and b!1300435 res!864158) b!1300420))

(assert (= (and b!1300420 c!124591) b!1300429))

(assert (= (and b!1300420 (not c!124591)) b!1300437))

(assert (= (and b!1300429 res!864159) b!1300421))

(assert (= (or b!1300429 b!1300437) bm!63648))

(declare-fun b_lambda!23177 () Bool)

(assert (=> (not b_lambda!23177) (not b!1300423)))

(assert (=> b!1300423 t!43258))

(declare-fun b_and!47297 () Bool)

(assert (= b_and!47295 (and (=> t!43258 result!23763) b_and!47297)))

(assert (=> d!141173 m!1191249))

(assert (=> b!1300423 m!1191233))

(assert (=> b!1300423 m!1191233))

(declare-fun m!1191347 () Bool)

(assert (=> b!1300423 m!1191347))

(assert (=> b!1300423 m!1191317))

(assert (=> b!1300423 m!1191315))

(assert (=> b!1300423 m!1191317))

(assert (=> b!1300423 m!1191319))

(assert (=> b!1300423 m!1191315))

(declare-fun m!1191349 () Bool)

(assert (=> b!1300432 m!1191349))

(declare-fun m!1191351 () Bool)

(assert (=> b!1300432 m!1191351))

(assert (=> b!1300432 m!1191233))

(assert (=> b!1300432 m!1191349))

(declare-fun m!1191353 () Bool)

(assert (=> b!1300432 m!1191353))

(declare-fun m!1191355 () Bool)

(assert (=> b!1300432 m!1191355))

(declare-fun m!1191357 () Bool)

(assert (=> b!1300432 m!1191357))

(declare-fun m!1191359 () Bool)

(assert (=> b!1300432 m!1191359))

(declare-fun m!1191361 () Bool)

(assert (=> b!1300432 m!1191361))

(declare-fun m!1191363 () Bool)

(assert (=> b!1300432 m!1191363))

(declare-fun m!1191365 () Bool)

(assert (=> b!1300432 m!1191365))

(declare-fun m!1191367 () Bool)

(assert (=> b!1300432 m!1191367))

(declare-fun m!1191369 () Bool)

(assert (=> b!1300432 m!1191369))

(declare-fun m!1191371 () Bool)

(assert (=> b!1300432 m!1191371))

(assert (=> b!1300432 m!1191237))

(declare-fun m!1191373 () Bool)

(assert (=> b!1300432 m!1191373))

(assert (=> b!1300432 m!1191359))

(declare-fun m!1191375 () Bool)

(assert (=> b!1300432 m!1191375))

(declare-fun m!1191377 () Bool)

(assert (=> b!1300432 m!1191377))

(assert (=> b!1300432 m!1191365))

(assert (=> b!1300432 m!1191361))

(declare-fun m!1191379 () Bool)

(assert (=> bm!63650 m!1191379))

(declare-fun m!1191381 () Bool)

(assert (=> b!1300433 m!1191381))

(assert (=> b!1300438 m!1191233))

(assert (=> b!1300438 m!1191233))

(declare-fun m!1191383 () Bool)

(assert (=> b!1300438 m!1191383))

(assert (=> b!1300419 m!1191233))

(assert (=> b!1300419 m!1191233))

(assert (=> b!1300419 m!1191235))

(declare-fun m!1191385 () Bool)

(assert (=> b!1300421 m!1191385))

(assert (=> b!1300428 m!1191233))

(assert (=> b!1300428 m!1191233))

(assert (=> b!1300428 m!1191235))

(declare-fun m!1191387 () Bool)

(assert (=> b!1300427 m!1191387))

(declare-fun m!1191389 () Bool)

(assert (=> bm!63648 m!1191389))

(assert (=> bm!63652 m!1191237))

(declare-fun m!1191391 () Bool)

(assert (=> bm!63654 m!1191391))

(assert (=> b!1300263 d!141173))

(declare-fun d!141175 () Bool)

(assert (=> d!141175 (= (validKeyInArray!0 (select (arr!41824 _keys!1741) from!2144)) (and (not (= (select (arr!41824 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41824 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300268 d!141175))

(declare-fun bm!63657 () Bool)

(declare-fun call!63660 () Bool)

(assert (=> bm!63657 (= call!63660 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300448 () Bool)

(declare-fun e!741820 () Bool)

(declare-fun e!741819 () Bool)

(assert (=> b!1300448 (= e!741820 e!741819)))

(declare-fun c!124598 () Bool)

(assert (=> b!1300448 (= c!124598 (validKeyInArray!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141177 () Bool)

(declare-fun res!864169 () Bool)

(assert (=> d!141177 (=> res!864169 e!741820)))

(assert (=> d!141177 (= res!864169 (bvsge #b00000000000000000000000000000000 (size!42374 _keys!1741)))))

(assert (=> d!141177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741820)))

(declare-fun b!1300449 () Bool)

(declare-fun e!741821 () Bool)

(assert (=> b!1300449 (= e!741819 e!741821)))

(declare-fun lt!581393 () (_ BitVec 64))

(assert (=> b!1300449 (= lt!581393 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581392 () Unit!43035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86654 (_ BitVec 64) (_ BitVec 32)) Unit!43035)

(assert (=> b!1300449 (= lt!581392 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581393 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300449 (arrayContainsKey!0 _keys!1741 lt!581393 #b00000000000000000000000000000000)))

(declare-fun lt!581391 () Unit!43035)

(assert (=> b!1300449 (= lt!581391 lt!581392)))

(declare-fun res!864170 () Bool)

(declare-datatypes ((SeekEntryResult!10019 0))(
  ( (MissingZero!10019 (index!42447 (_ BitVec 32))) (Found!10019 (index!42448 (_ BitVec 32))) (Intermediate!10019 (undefined!10831 Bool) (index!42449 (_ BitVec 32)) (x!115502 (_ BitVec 32))) (Undefined!10019) (MissingVacant!10019 (index!42450 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86654 (_ BitVec 32)) SeekEntryResult!10019)

(assert (=> b!1300449 (= res!864170 (= (seekEntryOrOpen!0 (select (arr!41824 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10019 #b00000000000000000000000000000000)))))

(assert (=> b!1300449 (=> (not res!864170) (not e!741821))))

(declare-fun b!1300450 () Bool)

(assert (=> b!1300450 (= e!741821 call!63660)))

(declare-fun b!1300451 () Bool)

(assert (=> b!1300451 (= e!741819 call!63660)))

(assert (= (and d!141177 (not res!864169)) b!1300448))

(assert (= (and b!1300448 c!124598) b!1300449))

(assert (= (and b!1300448 (not c!124598)) b!1300451))

(assert (= (and b!1300449 res!864170) b!1300450))

(assert (= (or b!1300450 b!1300451) bm!63657))

(declare-fun m!1191393 () Bool)

(assert (=> bm!63657 m!1191393))

(assert (=> b!1300448 m!1191331))

(assert (=> b!1300448 m!1191331))

(assert (=> b!1300448 m!1191333))

(assert (=> b!1300449 m!1191331))

(declare-fun m!1191395 () Bool)

(assert (=> b!1300449 m!1191395))

(declare-fun m!1191397 () Bool)

(assert (=> b!1300449 m!1191397))

(assert (=> b!1300449 m!1191331))

(declare-fun m!1191399 () Bool)

(assert (=> b!1300449 m!1191399))

(assert (=> b!1300264 d!141177))

(declare-fun mapIsEmpty!53810 () Bool)

(declare-fun mapRes!53810 () Bool)

(assert (=> mapIsEmpty!53810 mapRes!53810))

(declare-fun mapNonEmpty!53810 () Bool)

(declare-fun tp!102683 () Bool)

(declare-fun e!741827 () Bool)

(assert (=> mapNonEmpty!53810 (= mapRes!53810 (and tp!102683 e!741827))))

(declare-fun mapRest!53810 () (Array (_ BitVec 32) ValueCell!16512))

(declare-fun mapValue!53810 () ValueCell!16512)

(declare-fun mapKey!53810 () (_ BitVec 32))

(assert (=> mapNonEmpty!53810 (= mapRest!53804 (store mapRest!53810 mapKey!53810 mapValue!53810))))

(declare-fun b!1300459 () Bool)

(declare-fun e!741826 () Bool)

(assert (=> b!1300459 (= e!741826 tp_is_empty!34821)))

(declare-fun b!1300458 () Bool)

(assert (=> b!1300458 (= e!741827 tp_is_empty!34821)))

(declare-fun condMapEmpty!53810 () Bool)

(declare-fun mapDefault!53810 () ValueCell!16512)

(assert (=> mapNonEmpty!53804 (= condMapEmpty!53810 (= mapRest!53804 ((as const (Array (_ BitVec 32) ValueCell!16512)) mapDefault!53810)))))

(assert (=> mapNonEmpty!53804 (= tp!102673 (and e!741826 mapRes!53810))))

(assert (= (and mapNonEmpty!53804 condMapEmpty!53810) mapIsEmpty!53810))

(assert (= (and mapNonEmpty!53804 (not condMapEmpty!53810)) mapNonEmpty!53810))

(assert (= (and mapNonEmpty!53810 ((_ is ValueCellFull!16512) mapValue!53810)) b!1300458))

(assert (= (and mapNonEmpty!53804 ((_ is ValueCellFull!16512) mapDefault!53810)) b!1300459))

(declare-fun m!1191401 () Bool)

(assert (=> mapNonEmpty!53810 m!1191401))

(declare-fun b_lambda!23179 () Bool)

(assert (= b_lambda!23177 (or (and start!109768 b_free!29181) b_lambda!23179)))

(declare-fun b_lambda!23181 () Bool)

(assert (= b_lambda!23175 (or (and start!109768 b_free!29181) b_lambda!23181)))

(declare-fun b_lambda!23183 () Bool)

(assert (= b_lambda!23173 (or (and start!109768 b_free!29181) b_lambda!23183)))

(check-sat (not b!1300346) (not b!1300449) (not bm!63630) (not b!1300374) (not b_lambda!23179) (not b!1300312) (not b!1300419) (not d!141171) (not b!1300371) (not bm!63652) (not b!1300432) (not bm!63648) (not bm!63654) (not b!1300438) (not b!1300421) (not b!1300428) tp_is_empty!34821 (not b!1300355) (not b!1300433) (not b!1300427) (not b!1300448) (not d!141159) (not b!1300320) (not b!1300376) (not bm!63633) (not b!1300314) (not b!1300319) (not b_lambda!23183) (not b_next!29181) (not b!1300353) (not bm!63650) (not b!1300349) (not b!1300348) (not b!1300369) (not b!1300347) (not mapNonEmpty!53810) (not b!1300345) (not bm!63657) b_and!47297 (not b!1300373) (not b!1300352) (not d!141157) (not d!141173) (not d!141161) (not b_lambda!23181) (not b!1300423))
(check-sat b_and!47297 (not b_next!29181))
