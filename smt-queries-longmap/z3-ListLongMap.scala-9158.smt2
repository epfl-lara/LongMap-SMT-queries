; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110120 () Bool)

(assert start!110120)

(declare-fun b_free!29221 () Bool)

(declare-fun b_next!29221 () Bool)

(assert (=> start!110120 (= b_free!29221 (not b_next!29221))))

(declare-fun tp!102800 () Bool)

(declare-fun b_and!47353 () Bool)

(assert (=> start!110120 (= tp!102800 b_and!47353)))

(declare-fun b!1303099 () Bool)

(declare-datatypes ((Unit!43062 0))(
  ( (Unit!43063) )
))
(declare-fun e!743374 () Unit!43062)

(declare-fun lt!582723 () Unit!43062)

(assert (=> b!1303099 (= e!743374 lt!582723)))

(declare-datatypes ((V!51585 0))(
  ( (V!51586 (val!17505 Int)) )
))
(declare-datatypes ((tuple2!22602 0))(
  ( (tuple2!22603 (_1!11312 (_ BitVec 64)) (_2!11312 V!51585)) )
))
(declare-datatypes ((List!29754 0))(
  ( (Nil!29751) (Cons!29750 (h!30968 tuple2!22602) (t!43328 List!29754)) )
))
(declare-datatypes ((ListLongMap!20267 0))(
  ( (ListLongMap!20268 (toList!10149 List!29754)) )
))
(declare-fun lt!582714 () ListLongMap!20267)

(declare-fun call!64056 () ListLongMap!20267)

(assert (=> b!1303099 (= lt!582714 call!64056)))

(declare-fun lt!582725 () ListLongMap!20267)

(declare-fun zeroValue!1387 () V!51585)

(declare-fun +!4514 (ListLongMap!20267 tuple2!22602) ListLongMap!20267)

(assert (=> b!1303099 (= lt!582725 (+!4514 lt!582714 (tuple2!22603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun minValue!1387 () V!51585)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!582716 () Unit!43062)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!89 ((_ BitVec 64) (_ BitVec 64) V!51585 ListLongMap!20267) Unit!43062)

(assert (=> b!1303099 (= lt!582716 (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!582725))))

(declare-fun contains!8289 (ListLongMap!20267 (_ BitVec 64)) Bool)

(assert (=> b!1303099 (contains!8289 lt!582725 k0!1205)))

(declare-fun call!64058 () Unit!43062)

(assert (=> b!1303099 (= lt!582723 call!64058)))

(declare-fun call!64057 () Bool)

(assert (=> b!1303099 call!64057))

(declare-fun b!1303100 () Bool)

(declare-fun e!743373 () Bool)

(declare-fun e!743376 () Bool)

(declare-fun mapRes!53871 () Bool)

(assert (=> b!1303100 (= e!743373 (and e!743376 mapRes!53871))))

(declare-fun condMapEmpty!53871 () Bool)

(declare-datatypes ((ValueCell!16532 0))(
  ( (ValueCellFull!16532 (v!20111 V!51585)) (EmptyCell!16532) )
))
(declare-datatypes ((array!86771 0))(
  ( (array!86772 (arr!41876 (Array (_ BitVec 32) ValueCell!16532)) (size!42427 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86771)

(declare-fun mapDefault!53871 () ValueCell!16532)

(assert (=> b!1303100 (= condMapEmpty!53871 (= (arr!41876 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16532)) mapDefault!53871)))))

(declare-fun b!1303101 () Bool)

(declare-fun c!125252 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!582721 () Bool)

(assert (=> b!1303101 (= c!125252 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!582721))))

(declare-fun e!743375 () Unit!43062)

(declare-fun e!743369 () Unit!43062)

(assert (=> b!1303101 (= e!743375 e!743369)))

(declare-fun b!1303102 () Bool)

(declare-fun tp_is_empty!34861 () Bool)

(assert (=> b!1303102 (= e!743376 tp_is_empty!34861)))

(declare-fun b!1303103 () Bool)

(declare-fun res!865333 () Bool)

(declare-fun e!743371 () Bool)

(assert (=> b!1303103 (=> (not res!865333) (not e!743371))))

(declare-datatypes ((array!86773 0))(
  ( (array!86774 (arr!41877 (Array (_ BitVec 32) (_ BitVec 64))) (size!42428 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86773)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303103 (= res!865333 (validKeyInArray!0 (select (arr!41877 _keys!1741) from!2144)))))

(declare-fun res!865334 () Bool)

(assert (=> start!110120 (=> (not res!865334) (not e!743371))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110120 (= res!865334 (validMask!0 mask!2175))))

(assert (=> start!110120 e!743371))

(assert (=> start!110120 tp_is_empty!34861))

(assert (=> start!110120 true))

(declare-fun array_inv!31923 (array!86771) Bool)

(assert (=> start!110120 (and (array_inv!31923 _values!1445) e!743373)))

(declare-fun array_inv!31924 (array!86773) Bool)

(assert (=> start!110120 (array_inv!31924 _keys!1741)))

(assert (=> start!110120 tp!102800))

(declare-fun b!1303104 () Bool)

(declare-fun call!64054 () Bool)

(assert (=> b!1303104 call!64054))

(declare-fun lt!582715 () Unit!43062)

(declare-fun call!64053 () Unit!43062)

(assert (=> b!1303104 (= lt!582715 call!64053)))

(declare-fun lt!582713 () ListLongMap!20267)

(declare-fun call!64055 () ListLongMap!20267)

(assert (=> b!1303104 (= lt!582713 call!64055)))

(assert (=> b!1303104 (= e!743375 lt!582715)))

(declare-fun b!1303105 () Bool)

(declare-fun res!865335 () Bool)

(assert (=> b!1303105 (=> (not res!865335) (not e!743371))))

(assert (=> b!1303105 (= res!865335 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42428 _keys!1741))))))

(declare-fun b!1303106 () Bool)

(declare-fun res!865338 () Bool)

(assert (=> b!1303106 (=> (not res!865338) (not e!743371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86773 (_ BitVec 32)) Bool)

(assert (=> b!1303106 (= res!865338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303107 () Bool)

(declare-fun e!743372 () Bool)

(assert (=> b!1303107 (= e!743372 true)))

(declare-fun lt!582718 () V!51585)

(assert (=> b!1303107 (not (contains!8289 (+!4514 (ListLongMap!20268 Nil!29751) (tuple2!22603 (select (arr!41877 _keys!1741) from!2144) lt!582718)) k0!1205))))

(declare-fun lt!582717 () Unit!43062)

(declare-fun addStillNotContains!467 (ListLongMap!20267 (_ BitVec 64) V!51585 (_ BitVec 64)) Unit!43062)

(assert (=> b!1303107 (= lt!582717 (addStillNotContains!467 (ListLongMap!20268 Nil!29751) (select (arr!41877 _keys!1741) from!2144) lt!582718 k0!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun get!21191 (ValueCell!16532 V!51585) V!51585)

(declare-fun dynLambda!3485 (Int (_ BitVec 64)) V!51585)

(assert (=> b!1303107 (= lt!582718 (get!21191 (select (arr!41876 _values!1445) from!2144) (dynLambda!3485 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1303108 () Bool)

(assert (=> b!1303108 (= e!743374 e!743375)))

(declare-fun c!125253 () Bool)

(assert (=> b!1303108 (= c!125253 (and (not lt!582721) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64050 () Bool)

(assert (=> bm!64050 (= call!64053 call!64058)))

(declare-fun b!1303109 () Bool)

(declare-fun Unit!43064 () Unit!43062)

(assert (=> b!1303109 (= e!743369 Unit!43064)))

(declare-fun b!1303110 () Bool)

(declare-fun res!865336 () Bool)

(assert (=> b!1303110 (=> (not res!865336) (not e!743371))))

(assert (=> b!1303110 (= res!865336 (and (= (size!42427 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42428 _keys!1741) (size!42427 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303111 () Bool)

(declare-fun res!865340 () Bool)

(assert (=> b!1303111 (=> (not res!865340) (not e!743371))))

(declare-fun getCurrentListMap!5162 (array!86773 array!86771 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> b!1303111 (= res!865340 (contains!8289 (getCurrentListMap!5162 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1303112 () Bool)

(declare-fun e!743370 () Bool)

(assert (=> b!1303112 (= e!743370 tp_is_empty!34861)))

(declare-fun bm!64051 () Bool)

(declare-fun lt!582720 () ListLongMap!20267)

(declare-fun c!125251 () Bool)

(assert (=> bm!64051 (= call!64057 (contains!8289 (ite c!125251 lt!582714 (ite c!125253 lt!582713 lt!582720)) k0!1205))))

(declare-fun b!1303113 () Bool)

(declare-fun res!865337 () Bool)

(assert (=> b!1303113 (=> (not res!865337) (not e!743371))))

(declare-datatypes ((List!29755 0))(
  ( (Nil!29752) (Cons!29751 (h!30969 (_ BitVec 64)) (t!43329 List!29755)) )
))
(declare-fun arrayNoDuplicates!0 (array!86773 (_ BitVec 32) List!29755) Bool)

(assert (=> b!1303113 (= res!865337 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29752))))

(declare-fun bm!64052 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6153 (array!86773 array!86771 (_ BitVec 32) (_ BitVec 32) V!51585 V!51585 (_ BitVec 32) Int) ListLongMap!20267)

(assert (=> bm!64052 (= call!64056 (getCurrentListMapNoExtraKeys!6153 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun bm!64053 () Bool)

(assert (=> bm!64053 (= call!64055 call!64056)))

(declare-fun mapIsEmpty!53871 () Bool)

(assert (=> mapIsEmpty!53871 mapRes!53871))

(declare-fun mapNonEmpty!53871 () Bool)

(declare-fun tp!102801 () Bool)

(assert (=> mapNonEmpty!53871 (= mapRes!53871 (and tp!102801 e!743370))))

(declare-fun mapValue!53871 () ValueCell!16532)

(declare-fun mapRest!53871 () (Array (_ BitVec 32) ValueCell!16532))

(declare-fun mapKey!53871 () (_ BitVec 32))

(assert (=> mapNonEmpty!53871 (= (arr!41876 _values!1445) (store mapRest!53871 mapKey!53871 mapValue!53871))))

(declare-fun bm!64054 () Bool)

(assert (=> bm!64054 (= call!64058 (lemmaInListMapAfterAddingDiffThenInBefore!89 k0!1205 (ite (or c!125251 c!125253) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!125251 c!125253) zeroValue!1387 minValue!1387) (ite c!125251 lt!582714 (ite c!125253 lt!582713 lt!582720))))))

(declare-fun b!1303114 () Bool)

(assert (=> b!1303114 (= e!743371 (not e!743372))))

(declare-fun res!865341 () Bool)

(assert (=> b!1303114 (=> res!865341 e!743372)))

(assert (=> b!1303114 (= res!865341 (= k0!1205 (select (arr!41877 _keys!1741) from!2144)))))

(assert (=> b!1303114 (not (contains!8289 (ListLongMap!20268 Nil!29751) k0!1205))))

(declare-fun lt!582719 () Unit!43062)

(declare-fun emptyContainsNothing!207 ((_ BitVec 64)) Unit!43062)

(assert (=> b!1303114 (= lt!582719 (emptyContainsNothing!207 k0!1205))))

(declare-fun lt!582722 () Unit!43062)

(assert (=> b!1303114 (= lt!582722 e!743374)))

(assert (=> b!1303114 (= c!125251 (and (not lt!582721) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1303114 (= lt!582721 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!64055 () Bool)

(assert (=> bm!64055 (= call!64054 call!64057)))

(declare-fun b!1303115 () Bool)

(declare-fun res!865339 () Bool)

(assert (=> b!1303115 (=> (not res!865339) (not e!743371))))

(assert (=> b!1303115 (= res!865339 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42428 _keys!1741))))))

(declare-fun b!1303116 () Bool)

(declare-fun lt!582724 () Unit!43062)

(assert (=> b!1303116 (= e!743369 lt!582724)))

(assert (=> b!1303116 (= lt!582720 call!64055)))

(assert (=> b!1303116 (= lt!582724 call!64053)))

(assert (=> b!1303116 call!64054))

(assert (= (and start!110120 res!865334) b!1303110))

(assert (= (and b!1303110 res!865336) b!1303106))

(assert (= (and b!1303106 res!865338) b!1303113))

(assert (= (and b!1303113 res!865337) b!1303115))

(assert (= (and b!1303115 res!865339) b!1303111))

(assert (= (and b!1303111 res!865340) b!1303105))

(assert (= (and b!1303105 res!865335) b!1303103))

(assert (= (and b!1303103 res!865333) b!1303114))

(assert (= (and b!1303114 c!125251) b!1303099))

(assert (= (and b!1303114 (not c!125251)) b!1303108))

(assert (= (and b!1303108 c!125253) b!1303104))

(assert (= (and b!1303108 (not c!125253)) b!1303101))

(assert (= (and b!1303101 c!125252) b!1303116))

(assert (= (and b!1303101 (not c!125252)) b!1303109))

(assert (= (or b!1303104 b!1303116) bm!64053))

(assert (= (or b!1303104 b!1303116) bm!64050))

(assert (= (or b!1303104 b!1303116) bm!64055))

(assert (= (or b!1303099 bm!64053) bm!64052))

(assert (= (or b!1303099 bm!64050) bm!64054))

(assert (= (or b!1303099 bm!64055) bm!64051))

(assert (= (and b!1303114 (not res!865341)) b!1303107))

(assert (= (and b!1303100 condMapEmpty!53871) mapIsEmpty!53871))

(assert (= (and b!1303100 (not condMapEmpty!53871)) mapNonEmpty!53871))

(get-info :version)

(assert (= (and mapNonEmpty!53871 ((_ is ValueCellFull!16532) mapValue!53871)) b!1303112))

(assert (= (and b!1303100 ((_ is ValueCellFull!16532) mapDefault!53871)) b!1303102))

(assert (= start!110120 b!1303100))

(declare-fun b_lambda!23207 () Bool)

(assert (=> (not b_lambda!23207) (not b!1303107)))

(declare-fun t!43327 () Bool)

(declare-fun tb!11377 () Bool)

(assert (=> (and start!110120 (= defaultEntry!1448 defaultEntry!1448) t!43327) tb!11377))

(declare-fun result!23775 () Bool)

(assert (=> tb!11377 (= result!23775 tp_is_empty!34861)))

(assert (=> b!1303107 t!43327))

(declare-fun b_and!47355 () Bool)

(assert (= b_and!47353 (and (=> t!43327 result!23775) b_and!47355)))

(declare-fun m!1194271 () Bool)

(assert (=> b!1303107 m!1194271))

(declare-fun m!1194273 () Bool)

(assert (=> b!1303107 m!1194273))

(assert (=> b!1303107 m!1194271))

(declare-fun m!1194275 () Bool)

(assert (=> b!1303107 m!1194275))

(declare-fun m!1194277 () Bool)

(assert (=> b!1303107 m!1194277))

(declare-fun m!1194279 () Bool)

(assert (=> b!1303107 m!1194279))

(declare-fun m!1194281 () Bool)

(assert (=> b!1303107 m!1194281))

(assert (=> b!1303107 m!1194279))

(assert (=> b!1303107 m!1194275))

(assert (=> b!1303107 m!1194273))

(declare-fun m!1194283 () Bool)

(assert (=> b!1303107 m!1194283))

(declare-fun m!1194285 () Bool)

(assert (=> mapNonEmpty!53871 m!1194285))

(declare-fun m!1194287 () Bool)

(assert (=> b!1303106 m!1194287))

(assert (=> b!1303103 m!1194279))

(assert (=> b!1303103 m!1194279))

(declare-fun m!1194289 () Bool)

(assert (=> b!1303103 m!1194289))

(declare-fun m!1194291 () Bool)

(assert (=> start!110120 m!1194291))

(declare-fun m!1194293 () Bool)

(assert (=> start!110120 m!1194293))

(declare-fun m!1194295 () Bool)

(assert (=> start!110120 m!1194295))

(declare-fun m!1194297 () Bool)

(assert (=> b!1303113 m!1194297))

(declare-fun m!1194299 () Bool)

(assert (=> b!1303111 m!1194299))

(assert (=> b!1303111 m!1194299))

(declare-fun m!1194301 () Bool)

(assert (=> b!1303111 m!1194301))

(declare-fun m!1194303 () Bool)

(assert (=> bm!64051 m!1194303))

(declare-fun m!1194305 () Bool)

(assert (=> b!1303099 m!1194305))

(declare-fun m!1194307 () Bool)

(assert (=> b!1303099 m!1194307))

(declare-fun m!1194309 () Bool)

(assert (=> b!1303099 m!1194309))

(declare-fun m!1194311 () Bool)

(assert (=> bm!64054 m!1194311))

(assert (=> b!1303114 m!1194279))

(declare-fun m!1194313 () Bool)

(assert (=> b!1303114 m!1194313))

(declare-fun m!1194315 () Bool)

(assert (=> b!1303114 m!1194315))

(declare-fun m!1194317 () Bool)

(assert (=> bm!64052 m!1194317))

(check-sat (not mapNonEmpty!53871) (not bm!64051) (not b!1303113) (not b!1303103) (not b_next!29221) tp_is_empty!34861 (not b!1303111) (not start!110120) b_and!47355 (not b!1303107) (not b_lambda!23207) (not bm!64052) (not bm!64054) (not b!1303099) (not b!1303106) (not b!1303114))
(check-sat b_and!47355 (not b_next!29221))
