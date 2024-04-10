; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109824 () Bool)

(assert start!109824)

(declare-fun b_free!29217 () Bool)

(declare-fun b_next!29217 () Bool)

(assert (=> start!109824 (= b_free!29217 (not b_next!29217))))

(declare-fun tp!102784 () Bool)

(declare-fun b_and!47333 () Bool)

(assert (=> start!109824 (= tp!102784 b_and!47333)))

(declare-fun mapNonEmpty!53861 () Bool)

(declare-fun mapRes!53861 () Bool)

(declare-fun tp!102785 () Bool)

(declare-fun e!742207 () Bool)

(assert (=> mapNonEmpty!53861 (= mapRes!53861 (and tp!102785 e!742207))))

(declare-datatypes ((V!51579 0))(
  ( (V!51580 (val!17503 Int)) )
))
(declare-datatypes ((ValueCell!16530 0))(
  ( (ValueCellFull!16530 (v!20111 V!51579)) (EmptyCell!16530) )
))
(declare-datatypes ((array!86724 0))(
  ( (array!86725 (arr!41858 (Array (_ BitVec 32) ValueCell!16530)) (size!42408 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86724)

(declare-fun mapRest!53861 () (Array (_ BitVec 32) ValueCell!16530))

(declare-fun mapValue!53861 () ValueCell!16530)

(declare-fun mapKey!53861 () (_ BitVec 32))

(assert (=> mapNonEmpty!53861 (= (arr!41858 _values!1445) (store mapRest!53861 mapKey!53861 mapValue!53861))))

(declare-fun bm!63904 () Bool)

(declare-datatypes ((Unit!43067 0))(
  ( (Unit!43068) )
))
(declare-fun call!63910 () Unit!43067)

(declare-fun call!63912 () Unit!43067)

(assert (=> bm!63904 (= call!63910 call!63912)))

(declare-fun b!1301272 () Bool)

(declare-fun res!864589 () Bool)

(declare-fun e!742208 () Bool)

(assert (=> b!1301272 (=> (not res!864589) (not e!742208))))

(declare-fun zeroValue!1387 () V!51579)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86726 0))(
  ( (array!86727 (arr!41859 (Array (_ BitVec 32) (_ BitVec 64))) (size!42409 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86726)

(declare-fun minValue!1387 () V!51579)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22580 0))(
  ( (tuple2!22581 (_1!11301 (_ BitVec 64)) (_2!11301 V!51579)) )
))
(declare-datatypes ((List!29708 0))(
  ( (Nil!29705) (Cons!29704 (h!30913 tuple2!22580) (t!43286 List!29708)) )
))
(declare-datatypes ((ListLongMap!20237 0))(
  ( (ListLongMap!20238 (toList!10134 List!29708)) )
))
(declare-fun contains!8260 (ListLongMap!20237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5159 (array!86726 array!86724 (_ BitVec 32) (_ BitVec 32) V!51579 V!51579 (_ BitVec 32) Int) ListLongMap!20237)

(assert (=> b!1301272 (= res!864589 (contains!8260 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1301273 () Bool)

(declare-fun e!742210 () Bool)

(declare-fun e!742211 () Bool)

(assert (=> b!1301273 (= e!742210 (and e!742211 mapRes!53861))))

(declare-fun condMapEmpty!53861 () Bool)

(declare-fun mapDefault!53861 () ValueCell!16530)

(assert (=> b!1301273 (= condMapEmpty!53861 (= (arr!41858 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16530)) mapDefault!53861)))))

(declare-fun b!1301274 () Bool)

(declare-fun e!742209 () Unit!43067)

(declare-fun lt!581871 () Unit!43067)

(assert (=> b!1301274 (= e!742209 lt!581871)))

(declare-fun lt!581867 () ListLongMap!20237)

(declare-fun call!63908 () ListLongMap!20237)

(assert (=> b!1301274 (= lt!581867 call!63908)))

(declare-fun lt!581864 () ListLongMap!20237)

(declare-fun +!4461 (ListLongMap!20237 tuple2!22580) ListLongMap!20237)

(assert (=> b!1301274 (= lt!581864 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!581874 () Unit!43067)

(assert (=> b!1301274 (= lt!581874 call!63912)))

(assert (=> b!1301274 (contains!8260 lt!581864 k0!1205)))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!84 ((_ BitVec 64) (_ BitVec 64) V!51579 ListLongMap!20237) Unit!43067)

(assert (=> b!1301274 (= lt!581871 (lemmaInListMapAfterAddingDiffThenInBefore!84 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581867))))

(declare-fun call!63907 () Bool)

(assert (=> b!1301274 call!63907))

(declare-fun b!1301275 () Bool)

(declare-fun e!742213 () Bool)

(assert (=> b!1301275 (= e!742208 (not e!742213))))

(declare-fun res!864593 () Bool)

(assert (=> b!1301275 (=> res!864593 e!742213)))

(assert (=> b!1301275 (= res!864593 (= k0!1205 (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301275 (not (contains!8260 (ListLongMap!20238 Nil!29705) k0!1205))))

(declare-fun lt!581872 () Unit!43067)

(declare-fun emptyContainsNothing!202 ((_ BitVec 64)) Unit!43067)

(assert (=> b!1301275 (= lt!581872 (emptyContainsNothing!202 k0!1205))))

(declare-fun lt!581870 () Unit!43067)

(assert (=> b!1301275 (= lt!581870 e!742209)))

(declare-fun c!124722 () Bool)

(declare-fun lt!581866 () Bool)

(assert (=> b!1301275 (= c!124722 (and (not lt!581866) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1301275 (= lt!581866 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1301276 () Bool)

(declare-fun res!864591 () Bool)

(assert (=> b!1301276 (=> (not res!864591) (not e!742208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1301276 (= res!864591 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1301278 () Bool)

(declare-fun res!864588 () Bool)

(assert (=> b!1301278 (=> (not res!864588) (not e!742208))))

(assert (=> b!1301278 (= res!864588 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741))))))

(declare-fun bm!63905 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6093 (array!86726 array!86724 (_ BitVec 32) (_ BitVec 32) V!51579 V!51579 (_ BitVec 32) Int) ListLongMap!20237)

(assert (=> bm!63905 (= call!63908 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301279 () Bool)

(declare-fun res!864585 () Bool)

(assert (=> b!1301279 (=> (not res!864585) (not e!742208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86726 (_ BitVec 32)) Bool)

(assert (=> b!1301279 (= res!864585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53861 () Bool)

(assert (=> mapIsEmpty!53861 mapRes!53861))

(declare-fun b!1301280 () Bool)

(declare-fun e!742206 () Unit!43067)

(declare-fun lt!581865 () Unit!43067)

(assert (=> b!1301280 (= e!742206 lt!581865)))

(declare-fun lt!581868 () ListLongMap!20237)

(declare-fun call!63911 () ListLongMap!20237)

(assert (=> b!1301280 (= lt!581868 call!63911)))

(assert (=> b!1301280 (= lt!581865 call!63910)))

(declare-fun call!63909 () Bool)

(assert (=> b!1301280 call!63909))

(declare-fun c!124723 () Bool)

(declare-fun bm!63906 () Bool)

(declare-fun lt!581876 () ListLongMap!20237)

(assert (=> bm!63906 (= call!63912 (lemmaInListMapAfterAddingDiffThenInBefore!84 k0!1205 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)) (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))))))

(declare-fun bm!63907 () Bool)

(assert (=> bm!63907 (= call!63909 call!63907)))

(declare-fun b!1301281 () Bool)

(declare-fun e!742214 () Unit!43067)

(assert (=> b!1301281 (= e!742209 e!742214)))

(assert (=> b!1301281 (= c!124723 (and (not lt!581866) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301282 () Bool)

(declare-fun tp_is_empty!34857 () Bool)

(assert (=> b!1301282 (= e!742207 tp_is_empty!34857)))

(declare-fun bm!63908 () Bool)

(assert (=> bm!63908 (= call!63911 call!63908)))

(declare-fun b!1301283 () Bool)

(declare-fun Unit!43069 () Unit!43067)

(assert (=> b!1301283 (= e!742206 Unit!43069)))

(declare-fun b!1301284 () Bool)

(declare-fun c!124724 () Bool)

(assert (=> b!1301284 (= c!124724 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!581866))))

(assert (=> b!1301284 (= e!742214 e!742206)))

(declare-fun b!1301285 () Bool)

(assert (=> b!1301285 (= e!742213 false)))

(declare-fun lt!581875 () V!51579)

(assert (=> b!1301285 (not (contains!8260 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) k0!1205))))

(declare-fun lt!581873 () Unit!43067)

(declare-fun addStillNotContains!459 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> b!1301285 (= lt!581873 (addStillNotContains!459 (ListLongMap!20238 Nil!29705) (select (arr!41859 _keys!1741) from!2144) lt!581875 k0!1205))))

(declare-fun get!21134 (ValueCell!16530 V!51579) V!51579)

(declare-fun dynLambda!3421 (Int (_ BitVec 64)) V!51579)

(assert (=> b!1301285 (= lt!581875 (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301286 () Bool)

(assert (=> b!1301286 call!63909))

(declare-fun lt!581869 () Unit!43067)

(assert (=> b!1301286 (= lt!581869 call!63910)))

(assert (=> b!1301286 (= lt!581876 call!63911)))

(assert (=> b!1301286 (= e!742214 lt!581869)))

(declare-fun b!1301287 () Bool)

(declare-fun res!864586 () Bool)

(assert (=> b!1301287 (=> (not res!864586) (not e!742208))))

(assert (=> b!1301287 (= res!864586 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42409 _keys!1741))))))

(declare-fun b!1301277 () Bool)

(declare-fun res!864590 () Bool)

(assert (=> b!1301277 (=> (not res!864590) (not e!742208))))

(assert (=> b!1301277 (= res!864590 (and (= (size!42408 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42409 _keys!1741) (size!42408 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!864587 () Bool)

(assert (=> start!109824 (=> (not res!864587) (not e!742208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109824 (= res!864587 (validMask!0 mask!2175))))

(assert (=> start!109824 e!742208))

(assert (=> start!109824 tp_is_empty!34857))

(assert (=> start!109824 true))

(declare-fun array_inv!31665 (array!86724) Bool)

(assert (=> start!109824 (and (array_inv!31665 _values!1445) e!742210)))

(declare-fun array_inv!31666 (array!86726) Bool)

(assert (=> start!109824 (array_inv!31666 _keys!1741)))

(assert (=> start!109824 tp!102784))

(declare-fun b!1301288 () Bool)

(declare-fun res!864592 () Bool)

(assert (=> b!1301288 (=> (not res!864592) (not e!742208))))

(declare-datatypes ((List!29709 0))(
  ( (Nil!29706) (Cons!29705 (h!30914 (_ BitVec 64)) (t!43287 List!29709)) )
))
(declare-fun arrayNoDuplicates!0 (array!86726 (_ BitVec 32) List!29709) Bool)

(assert (=> b!1301288 (= res!864592 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29706))))

(declare-fun bm!63909 () Bool)

(assert (=> bm!63909 (= call!63907 (contains!8260 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)) k0!1205))))

(declare-fun b!1301289 () Bool)

(assert (=> b!1301289 (= e!742211 tp_is_empty!34857)))

(assert (= (and start!109824 res!864587) b!1301277))

(assert (= (and b!1301277 res!864590) b!1301279))

(assert (= (and b!1301279 res!864585) b!1301288))

(assert (= (and b!1301288 res!864592) b!1301278))

(assert (= (and b!1301278 res!864588) b!1301272))

(assert (= (and b!1301272 res!864589) b!1301287))

(assert (= (and b!1301287 res!864586) b!1301276))

(assert (= (and b!1301276 res!864591) b!1301275))

(assert (= (and b!1301275 c!124722) b!1301274))

(assert (= (and b!1301275 (not c!124722)) b!1301281))

(assert (= (and b!1301281 c!124723) b!1301286))

(assert (= (and b!1301281 (not c!124723)) b!1301284))

(assert (= (and b!1301284 c!124724) b!1301280))

(assert (= (and b!1301284 (not c!124724)) b!1301283))

(assert (= (or b!1301286 b!1301280) bm!63908))

(assert (= (or b!1301286 b!1301280) bm!63904))

(assert (= (or b!1301286 b!1301280) bm!63907))

(assert (= (or b!1301274 bm!63908) bm!63905))

(assert (= (or b!1301274 bm!63904) bm!63906))

(assert (= (or b!1301274 bm!63907) bm!63909))

(assert (= (and b!1301275 (not res!864593)) b!1301285))

(assert (= (and b!1301273 condMapEmpty!53861) mapIsEmpty!53861))

(assert (= (and b!1301273 (not condMapEmpty!53861)) mapNonEmpty!53861))

(get-info :version)

(assert (= (and mapNonEmpty!53861 ((_ is ValueCellFull!16530) mapValue!53861)) b!1301282))

(assert (= (and b!1301273 ((_ is ValueCellFull!16530) mapDefault!53861)) b!1301289))

(assert (= start!109824 b!1301273))

(declare-fun b_lambda!23187 () Bool)

(assert (=> (not b_lambda!23187) (not b!1301285)))

(declare-fun t!43285 () Bool)

(declare-fun tb!11381 () Bool)

(assert (=> (and start!109824 (= defaultEntry!1448 defaultEntry!1448) t!43285) tb!11381))

(declare-fun result!23773 () Bool)

(assert (=> tb!11381 (= result!23773 tp_is_empty!34857)))

(assert (=> b!1301285 t!43285))

(declare-fun b_and!47335 () Bool)

(assert (= b_and!47333 (and (=> t!43285 result!23773) b_and!47335)))

(declare-fun m!1191961 () Bool)

(assert (=> b!1301275 m!1191961))

(declare-fun m!1191963 () Bool)

(assert (=> b!1301275 m!1191963))

(declare-fun m!1191965 () Bool)

(assert (=> b!1301275 m!1191965))

(declare-fun m!1191967 () Bool)

(assert (=> bm!63906 m!1191967))

(declare-fun m!1191969 () Bool)

(assert (=> b!1301279 m!1191969))

(assert (=> b!1301276 m!1191961))

(assert (=> b!1301276 m!1191961))

(declare-fun m!1191971 () Bool)

(assert (=> b!1301276 m!1191971))

(declare-fun m!1191973 () Bool)

(assert (=> mapNonEmpty!53861 m!1191973))

(declare-fun m!1191975 () Bool)

(assert (=> b!1301288 m!1191975))

(declare-fun m!1191977 () Bool)

(assert (=> start!109824 m!1191977))

(declare-fun m!1191979 () Bool)

(assert (=> start!109824 m!1191979))

(declare-fun m!1191981 () Bool)

(assert (=> start!109824 m!1191981))

(declare-fun m!1191983 () Bool)

(assert (=> b!1301272 m!1191983))

(assert (=> b!1301272 m!1191983))

(declare-fun m!1191985 () Bool)

(assert (=> b!1301272 m!1191985))

(declare-fun m!1191987 () Bool)

(assert (=> bm!63909 m!1191987))

(declare-fun m!1191989 () Bool)

(assert (=> b!1301285 m!1191989))

(declare-fun m!1191991 () Bool)

(assert (=> b!1301285 m!1191991))

(declare-fun m!1191993 () Bool)

(assert (=> b!1301285 m!1191993))

(assert (=> b!1301285 m!1191993))

(declare-fun m!1191995 () Bool)

(assert (=> b!1301285 m!1191995))

(assert (=> b!1301285 m!1191961))

(declare-fun m!1191997 () Bool)

(assert (=> b!1301285 m!1191997))

(assert (=> b!1301285 m!1191991))

(assert (=> b!1301285 m!1191989))

(declare-fun m!1191999 () Bool)

(assert (=> b!1301285 m!1191999))

(assert (=> b!1301285 m!1191961))

(declare-fun m!1192001 () Bool)

(assert (=> bm!63905 m!1192001))

(declare-fun m!1192003 () Bool)

(assert (=> b!1301274 m!1192003))

(declare-fun m!1192005 () Bool)

(assert (=> b!1301274 m!1192005))

(declare-fun m!1192007 () Bool)

(assert (=> b!1301274 m!1192007))

(check-sat (not bm!63909) (not start!109824) (not b!1301274) (not b!1301285) (not b_lambda!23187) (not mapNonEmpty!53861) (not b_next!29217) (not b!1301279) (not bm!63905) (not bm!63906) (not b!1301272) b_and!47335 (not b!1301288) (not b!1301276) (not b!1301275) tp_is_empty!34857)
(check-sat b_and!47335 (not b_next!29217))
(get-model)

(declare-fun b_lambda!23191 () Bool)

(assert (= b_lambda!23187 (or (and start!109824 b_free!29217) b_lambda!23191)))

(check-sat (not b_lambda!23191) (not bm!63909) (not start!109824) (not b!1301274) (not b!1301285) (not mapNonEmpty!53861) (not b_next!29217) (not b!1301279) (not bm!63905) (not bm!63906) (not b!1301272) b_and!47335 (not b!1301288) (not b!1301276) (not b!1301275) tp_is_empty!34857)
(check-sat b_and!47335 (not b_next!29217))
(get-model)

(declare-fun d!141191 () Bool)

(declare-fun e!742246 () Bool)

(assert (=> d!141191 e!742246))

(declare-fun res!864623 () Bool)

(assert (=> d!141191 (=> res!864623 e!742246)))

(declare-fun lt!581926 () Bool)

(assert (=> d!141191 (= res!864623 (not lt!581926))))

(declare-fun lt!581925 () Bool)

(assert (=> d!141191 (= lt!581926 lt!581925)))

(declare-fun lt!581924 () Unit!43067)

(declare-fun e!742247 () Unit!43067)

(assert (=> d!141191 (= lt!581924 e!742247)))

(declare-fun c!124736 () Bool)

(assert (=> d!141191 (= c!124736 lt!581925)))

(declare-fun containsKey!722 (List!29708 (_ BitVec 64)) Bool)

(assert (=> d!141191 (= lt!581925 (containsKey!722 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(assert (=> d!141191 (= (contains!8260 (ListLongMap!20238 Nil!29705) k0!1205) lt!581926)))

(declare-fun b!1301354 () Bool)

(declare-fun lt!581927 () Unit!43067)

(assert (=> b!1301354 (= e!742247 lt!581927)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!468 (List!29708 (_ BitVec 64)) Unit!43067)

(assert (=> b!1301354 (= lt!581927 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(declare-datatypes ((Option!752 0))(
  ( (Some!751 (v!20113 V!51579)) (None!750) )
))
(declare-fun isDefined!507 (Option!752) Bool)

(declare-fun getValueByKey!700 (List!29708 (_ BitVec 64)) Option!752)

(assert (=> b!1301354 (isDefined!507 (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(declare-fun b!1301355 () Bool)

(declare-fun Unit!43073 () Unit!43067)

(assert (=> b!1301355 (= e!742247 Unit!43073)))

(declare-fun b!1301356 () Bool)

(assert (=> b!1301356 (= e!742246 (isDefined!507 (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205)))))

(assert (= (and d!141191 c!124736) b!1301354))

(assert (= (and d!141191 (not c!124736)) b!1301355))

(assert (= (and d!141191 (not res!864623)) b!1301356))

(declare-fun m!1192057 () Bool)

(assert (=> d!141191 m!1192057))

(declare-fun m!1192059 () Bool)

(assert (=> b!1301354 m!1192059))

(declare-fun m!1192061 () Bool)

(assert (=> b!1301354 m!1192061))

(assert (=> b!1301354 m!1192061))

(declare-fun m!1192063 () Bool)

(assert (=> b!1301354 m!1192063))

(assert (=> b!1301356 m!1192061))

(assert (=> b!1301356 m!1192061))

(assert (=> b!1301356 m!1192063))

(assert (=> b!1301275 d!141191))

(declare-fun d!141193 () Bool)

(assert (=> d!141193 (not (contains!8260 (ListLongMap!20238 Nil!29705) k0!1205))))

(declare-fun lt!581930 () Unit!43067)

(declare-fun choose!1903 ((_ BitVec 64)) Unit!43067)

(assert (=> d!141193 (= lt!581930 (choose!1903 k0!1205))))

(assert (=> d!141193 (= (emptyContainsNothing!202 k0!1205) lt!581930)))

(declare-fun bs!37049 () Bool)

(assert (= bs!37049 d!141193))

(assert (=> bs!37049 m!1191963))

(declare-fun m!1192065 () Bool)

(assert (=> bs!37049 m!1192065))

(assert (=> b!1301275 d!141193))

(declare-fun d!141195 () Bool)

(assert (=> d!141195 (= (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)) (and (not (= (select (arr!41859 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41859 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301276 d!141195))

(declare-fun d!141197 () Bool)

(declare-fun e!742250 () Bool)

(assert (=> d!141197 e!742250))

(declare-fun res!864629 () Bool)

(assert (=> d!141197 (=> (not res!864629) (not e!742250))))

(declare-fun lt!581940 () ListLongMap!20237)

(assert (=> d!141197 (= res!864629 (contains!8260 lt!581940 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581939 () List!29708)

(assert (=> d!141197 (= lt!581940 (ListLongMap!20238 lt!581939))))

(declare-fun lt!581941 () Unit!43067)

(declare-fun lt!581942 () Unit!43067)

(assert (=> d!141197 (= lt!581941 lt!581942)))

(assert (=> d!141197 (= (getValueByKey!700 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!346 (List!29708 (_ BitVec 64) V!51579) Unit!43067)

(assert (=> d!141197 (= lt!581942 (lemmaContainsTupThenGetReturnValue!346 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!475 (List!29708 (_ BitVec 64) V!51579) List!29708)

(assert (=> d!141197 (= lt!581939 (insertStrictlySorted!475 (toList!10134 lt!581867) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141197 (= (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581940)))

(declare-fun b!1301361 () Bool)

(declare-fun res!864628 () Bool)

(assert (=> b!1301361 (=> (not res!864628) (not e!742250))))

(assert (=> b!1301361 (= res!864628 (= (getValueByKey!700 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301362 () Bool)

(declare-fun contains!8261 (List!29708 tuple2!22580) Bool)

(assert (=> b!1301362 (= e!742250 (contains!8261 (toList!10134 lt!581940) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141197 res!864629) b!1301361))

(assert (= (and b!1301361 res!864628) b!1301362))

(declare-fun m!1192067 () Bool)

(assert (=> d!141197 m!1192067))

(declare-fun m!1192069 () Bool)

(assert (=> d!141197 m!1192069))

(declare-fun m!1192071 () Bool)

(assert (=> d!141197 m!1192071))

(declare-fun m!1192073 () Bool)

(assert (=> d!141197 m!1192073))

(declare-fun m!1192075 () Bool)

(assert (=> b!1301361 m!1192075))

(declare-fun m!1192077 () Bool)

(assert (=> b!1301362 m!1192077))

(assert (=> b!1301274 d!141197))

(declare-fun d!141199 () Bool)

(declare-fun e!742251 () Bool)

(assert (=> d!141199 e!742251))

(declare-fun res!864630 () Bool)

(assert (=> d!141199 (=> res!864630 e!742251)))

(declare-fun lt!581945 () Bool)

(assert (=> d!141199 (= res!864630 (not lt!581945))))

(declare-fun lt!581944 () Bool)

(assert (=> d!141199 (= lt!581945 lt!581944)))

(declare-fun lt!581943 () Unit!43067)

(declare-fun e!742252 () Unit!43067)

(assert (=> d!141199 (= lt!581943 e!742252)))

(declare-fun c!124737 () Bool)

(assert (=> d!141199 (= c!124737 lt!581944)))

(assert (=> d!141199 (= lt!581944 (containsKey!722 (toList!10134 lt!581864) k0!1205))))

(assert (=> d!141199 (= (contains!8260 lt!581864 k0!1205) lt!581945)))

(declare-fun b!1301363 () Bool)

(declare-fun lt!581946 () Unit!43067)

(assert (=> b!1301363 (= e!742252 lt!581946)))

(assert (=> b!1301363 (= lt!581946 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!581864) k0!1205))))

(assert (=> b!1301363 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581864) k0!1205))))

(declare-fun b!1301364 () Bool)

(declare-fun Unit!43074 () Unit!43067)

(assert (=> b!1301364 (= e!742252 Unit!43074)))

(declare-fun b!1301365 () Bool)

(assert (=> b!1301365 (= e!742251 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581864) k0!1205)))))

(assert (= (and d!141199 c!124737) b!1301363))

(assert (= (and d!141199 (not c!124737)) b!1301364))

(assert (= (and d!141199 (not res!864630)) b!1301365))

(declare-fun m!1192079 () Bool)

(assert (=> d!141199 m!1192079))

(declare-fun m!1192081 () Bool)

(assert (=> b!1301363 m!1192081))

(declare-fun m!1192083 () Bool)

(assert (=> b!1301363 m!1192083))

(assert (=> b!1301363 m!1192083))

(declare-fun m!1192085 () Bool)

(assert (=> b!1301363 m!1192085))

(assert (=> b!1301365 m!1192083))

(assert (=> b!1301365 m!1192083))

(assert (=> b!1301365 m!1192085))

(assert (=> b!1301274 d!141199))

(declare-fun d!141201 () Bool)

(assert (=> d!141201 (contains!8260 lt!581867 k0!1205)))

(declare-fun lt!581949 () Unit!43067)

(declare-fun choose!1904 ((_ BitVec 64) (_ BitVec 64) V!51579 ListLongMap!20237) Unit!43067)

(assert (=> d!141201 (= lt!581949 (choose!1904 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581867))))

(assert (=> d!141201 (contains!8260 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))

(assert (=> d!141201 (= (lemmaInListMapAfterAddingDiffThenInBefore!84 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581867) lt!581949)))

(declare-fun bs!37050 () Bool)

(assert (= bs!37050 d!141201))

(declare-fun m!1192087 () Bool)

(assert (=> bs!37050 m!1192087))

(declare-fun m!1192089 () Bool)

(assert (=> bs!37050 m!1192089))

(assert (=> bs!37050 m!1192003))

(assert (=> bs!37050 m!1192003))

(declare-fun m!1192091 () Bool)

(assert (=> bs!37050 m!1192091))

(assert (=> b!1301274 d!141201))

(declare-fun d!141203 () Bool)

(declare-fun e!742253 () Bool)

(assert (=> d!141203 e!742253))

(declare-fun res!864631 () Bool)

(assert (=> d!141203 (=> res!864631 e!742253)))

(declare-fun lt!581952 () Bool)

(assert (=> d!141203 (= res!864631 (not lt!581952))))

(declare-fun lt!581951 () Bool)

(assert (=> d!141203 (= lt!581952 lt!581951)))

(declare-fun lt!581950 () Unit!43067)

(declare-fun e!742254 () Unit!43067)

(assert (=> d!141203 (= lt!581950 e!742254)))

(declare-fun c!124738 () Bool)

(assert (=> d!141203 (= c!124738 lt!581951)))

(assert (=> d!141203 (= lt!581951 (containsKey!722 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(assert (=> d!141203 (= (contains!8260 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)) k0!1205) lt!581952)))

(declare-fun b!1301366 () Bool)

(declare-fun lt!581953 () Unit!43067)

(assert (=> b!1301366 (= e!742254 lt!581953)))

(assert (=> b!1301366 (= lt!581953 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(assert (=> b!1301366 (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(declare-fun b!1301367 () Bool)

(declare-fun Unit!43075 () Unit!43067)

(assert (=> b!1301367 (= e!742254 Unit!43075)))

(declare-fun b!1301368 () Bool)

(assert (=> b!1301368 (= e!742253 (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205)))))

(assert (= (and d!141203 c!124738) b!1301366))

(assert (= (and d!141203 (not c!124738)) b!1301367))

(assert (= (and d!141203 (not res!864631)) b!1301368))

(declare-fun m!1192093 () Bool)

(assert (=> d!141203 m!1192093))

(declare-fun m!1192095 () Bool)

(assert (=> b!1301366 m!1192095))

(declare-fun m!1192097 () Bool)

(assert (=> b!1301366 m!1192097))

(assert (=> b!1301366 m!1192097))

(declare-fun m!1192099 () Bool)

(assert (=> b!1301366 m!1192099))

(assert (=> b!1301368 m!1192097))

(assert (=> b!1301368 m!1192097))

(assert (=> b!1301368 m!1192099))

(assert (=> bm!63909 d!141203))

(declare-fun d!141205 () Bool)

(assert (=> d!141205 (contains!8260 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) k0!1205)))

(declare-fun lt!581954 () Unit!43067)

(assert (=> d!141205 (= lt!581954 (choose!1904 k0!1205 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)) (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))))))

(assert (=> d!141205 (contains!8260 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))) k0!1205)))

(assert (=> d!141205 (= (lemmaInListMapAfterAddingDiffThenInBefore!84 k0!1205 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)) (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) lt!581954)))

(declare-fun bs!37051 () Bool)

(assert (= bs!37051 d!141205))

(declare-fun m!1192101 () Bool)

(assert (=> bs!37051 m!1192101))

(declare-fun m!1192103 () Bool)

(assert (=> bs!37051 m!1192103))

(declare-fun m!1192105 () Bool)

(assert (=> bs!37051 m!1192105))

(assert (=> bs!37051 m!1192105))

(declare-fun m!1192107 () Bool)

(assert (=> bs!37051 m!1192107))

(assert (=> bm!63906 d!141205))

(declare-fun d!141207 () Bool)

(declare-fun e!742255 () Bool)

(assert (=> d!141207 e!742255))

(declare-fun res!864632 () Bool)

(assert (=> d!141207 (=> res!864632 e!742255)))

(declare-fun lt!581957 () Bool)

(assert (=> d!141207 (= res!864632 (not lt!581957))))

(declare-fun lt!581956 () Bool)

(assert (=> d!141207 (= lt!581957 lt!581956)))

(declare-fun lt!581955 () Unit!43067)

(declare-fun e!742256 () Unit!43067)

(assert (=> d!141207 (= lt!581955 e!742256)))

(declare-fun c!124739 () Bool)

(assert (=> d!141207 (= c!124739 lt!581956)))

(assert (=> d!141207 (= lt!581956 (containsKey!722 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141207 (= (contains!8260 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581957)))

(declare-fun b!1301369 () Bool)

(declare-fun lt!581958 () Unit!43067)

(assert (=> b!1301369 (= e!742256 lt!581958)))

(assert (=> b!1301369 (= lt!581958 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1301369 (isDefined!507 (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1301370 () Bool)

(declare-fun Unit!43076 () Unit!43067)

(assert (=> b!1301370 (= e!742256 Unit!43076)))

(declare-fun b!1301371 () Bool)

(assert (=> b!1301371 (= e!742255 (isDefined!507 (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141207 c!124739) b!1301369))

(assert (= (and d!141207 (not c!124739)) b!1301370))

(assert (= (and d!141207 (not res!864632)) b!1301371))

(declare-fun m!1192109 () Bool)

(assert (=> d!141207 m!1192109))

(declare-fun m!1192111 () Bool)

(assert (=> b!1301369 m!1192111))

(declare-fun m!1192113 () Bool)

(assert (=> b!1301369 m!1192113))

(assert (=> b!1301369 m!1192113))

(declare-fun m!1192115 () Bool)

(assert (=> b!1301369 m!1192115))

(assert (=> b!1301371 m!1192113))

(assert (=> b!1301371 m!1192113))

(assert (=> b!1301371 m!1192115))

(assert (=> b!1301272 d!141207))

(declare-fun b!1301414 () Bool)

(declare-fun e!742290 () Bool)

(declare-fun e!742283 () Bool)

(assert (=> b!1301414 (= e!742290 e!742283)))

(declare-fun c!124756 () Bool)

(assert (=> b!1301414 (= c!124756 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1301415 () Bool)

(declare-fun e!742285 () ListLongMap!20237)

(declare-fun e!742295 () ListLongMap!20237)

(assert (=> b!1301415 (= e!742285 e!742295)))

(declare-fun c!124753 () Bool)

(assert (=> b!1301415 (= c!124753 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63942 () Bool)

(declare-fun call!63945 () Bool)

(declare-fun lt!582024 () ListLongMap!20237)

(assert (=> bm!63942 (= call!63945 (contains!8260 lt!582024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301416 () Bool)

(declare-fun e!742284 () ListLongMap!20237)

(declare-fun call!63946 () ListLongMap!20237)

(assert (=> b!1301416 (= e!742284 call!63946)))

(declare-fun b!1301417 () Bool)

(declare-fun call!63948 () Bool)

(assert (=> b!1301417 (= e!742283 (not call!63948))))

(declare-fun b!1301418 () Bool)

(declare-fun e!742291 () Bool)

(assert (=> b!1301418 (= e!742283 e!742291)))

(declare-fun res!864653 () Bool)

(assert (=> b!1301418 (= res!864653 call!63948)))

(assert (=> b!1301418 (=> (not res!864653) (not e!742291))))

(declare-fun bm!63943 () Bool)

(declare-fun call!63947 () ListLongMap!20237)

(declare-fun call!63950 () ListLongMap!20237)

(assert (=> bm!63943 (= call!63947 call!63950)))

(declare-fun b!1301419 () Bool)

(assert (=> b!1301419 (= e!742295 call!63947)))

(declare-fun bm!63944 () Bool)

(assert (=> bm!63944 (= call!63948 (contains!8260 lt!582024 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301420 () Bool)

(declare-fun e!742287 () Unit!43067)

(declare-fun lt!582010 () Unit!43067)

(assert (=> b!1301420 (= e!742287 lt!582010)))

(declare-fun lt!582009 () ListLongMap!20237)

(assert (=> b!1301420 (= lt!582009 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582006 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582007 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582007 (select (arr!41859 _keys!1741) from!2144))))

(declare-fun lt!582023 () Unit!43067)

(declare-fun addStillContains!1105 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> b!1301420 (= lt!582023 (addStillContains!1105 lt!582009 lt!582006 zeroValue!1387 lt!582007))))

(assert (=> b!1301420 (contains!8260 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387)) lt!582007)))

(declare-fun lt!582003 () Unit!43067)

(assert (=> b!1301420 (= lt!582003 lt!582023)))

(declare-fun lt!582014 () ListLongMap!20237)

(assert (=> b!1301420 (= lt!582014 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582022 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582015 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582015 (select (arr!41859 _keys!1741) from!2144))))

(declare-fun lt!582013 () Unit!43067)

(declare-fun addApplyDifferent!559 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> b!1301420 (= lt!582013 (addApplyDifferent!559 lt!582014 lt!582022 minValue!1387 lt!582015))))

(declare-fun apply!1017 (ListLongMap!20237 (_ BitVec 64)) V!51579)

(assert (=> b!1301420 (= (apply!1017 (+!4461 lt!582014 (tuple2!22581 lt!582022 minValue!1387)) lt!582015) (apply!1017 lt!582014 lt!582015))))

(declare-fun lt!582017 () Unit!43067)

(assert (=> b!1301420 (= lt!582017 lt!582013)))

(declare-fun lt!582005 () ListLongMap!20237)

(assert (=> b!1301420 (= lt!582005 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582008 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582019 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582019 (select (arr!41859 _keys!1741) from!2144))))

(declare-fun lt!582004 () Unit!43067)

(assert (=> b!1301420 (= lt!582004 (addApplyDifferent!559 lt!582005 lt!582008 zeroValue!1387 lt!582019))))

(assert (=> b!1301420 (= (apply!1017 (+!4461 lt!582005 (tuple2!22581 lt!582008 zeroValue!1387)) lt!582019) (apply!1017 lt!582005 lt!582019))))

(declare-fun lt!582011 () Unit!43067)

(assert (=> b!1301420 (= lt!582011 lt!582004)))

(declare-fun lt!582016 () ListLongMap!20237)

(assert (=> b!1301420 (= lt!582016 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582012 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582012 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582018 () (_ BitVec 64))

(assert (=> b!1301420 (= lt!582018 (select (arr!41859 _keys!1741) from!2144))))

(assert (=> b!1301420 (= lt!582010 (addApplyDifferent!559 lt!582016 lt!582012 minValue!1387 lt!582018))))

(assert (=> b!1301420 (= (apply!1017 (+!4461 lt!582016 (tuple2!22581 lt!582012 minValue!1387)) lt!582018) (apply!1017 lt!582016 lt!582018))))

(declare-fun bm!63945 () Bool)

(declare-fun call!63951 () ListLongMap!20237)

(assert (=> bm!63945 (= call!63946 call!63951)))

(declare-fun b!1301421 () Bool)

(declare-fun e!742289 () Bool)

(assert (=> b!1301421 (= e!742289 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1301422 () Bool)

(declare-fun res!864657 () Bool)

(assert (=> b!1301422 (=> (not res!864657) (not e!742290))))

(declare-fun e!742294 () Bool)

(assert (=> b!1301422 (= res!864657 e!742294)))

(declare-fun res!864651 () Bool)

(assert (=> b!1301422 (=> res!864651 e!742294)))

(declare-fun e!742293 () Bool)

(assert (=> b!1301422 (= res!864651 (not e!742293))))

(declare-fun res!864656 () Bool)

(assert (=> b!1301422 (=> (not res!864656) (not e!742293))))

(assert (=> b!1301422 (= res!864656 (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun b!1301423 () Bool)

(assert (=> b!1301423 (= e!742284 call!63947)))

(declare-fun b!1301424 () Bool)

(assert (=> b!1301424 (= e!742291 (= (apply!1017 lt!582024 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun e!742292 () Bool)

(declare-fun b!1301425 () Bool)

(assert (=> b!1301425 (= e!742292 (= (apply!1017 lt!582024 (select (arr!41859 _keys!1741) from!2144)) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301425 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42408 _values!1445)))))

(assert (=> b!1301425 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun call!63949 () ListLongMap!20237)

(declare-fun bm!63946 () Bool)

(assert (=> bm!63946 (= call!63949 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1301426 () Bool)

(declare-fun Unit!43077 () Unit!43067)

(assert (=> b!1301426 (= e!742287 Unit!43077)))

(declare-fun b!1301427 () Bool)

(assert (=> b!1301427 (= e!742293 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun d!141209 () Bool)

(assert (=> d!141209 e!742290))

(declare-fun res!864655 () Bool)

(assert (=> d!141209 (=> (not res!864655) (not e!742290))))

(assert (=> d!141209 (= res!864655 (or (bvsge from!2144 (size!42409 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741)))))))

(declare-fun lt!582021 () ListLongMap!20237)

(assert (=> d!141209 (= lt!582024 lt!582021)))

(declare-fun lt!582020 () Unit!43067)

(assert (=> d!141209 (= lt!582020 e!742287)))

(declare-fun c!124755 () Bool)

(assert (=> d!141209 (= c!124755 e!742289)))

(declare-fun res!864654 () Bool)

(assert (=> d!141209 (=> (not res!864654) (not e!742289))))

(assert (=> d!141209 (= res!864654 (bvslt from!2144 (size!42409 _keys!1741)))))

(assert (=> d!141209 (= lt!582021 e!742285)))

(declare-fun c!124752 () Bool)

(assert (=> d!141209 (= c!124752 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141209 (validMask!0 mask!2175)))

(assert (=> d!141209 (= (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582024)))

(declare-fun b!1301428 () Bool)

(declare-fun res!864658 () Bool)

(assert (=> b!1301428 (=> (not res!864658) (not e!742290))))

(declare-fun e!742286 () Bool)

(assert (=> b!1301428 (= res!864658 e!742286)))

(declare-fun c!124757 () Bool)

(assert (=> b!1301428 (= c!124757 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1301429 () Bool)

(assert (=> b!1301429 (= e!742294 e!742292)))

(declare-fun res!864652 () Bool)

(assert (=> b!1301429 (=> (not res!864652) (not e!742292))))

(assert (=> b!1301429 (= res!864652 (contains!8260 lt!582024 (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301429 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun bm!63947 () Bool)

(assert (=> bm!63947 (= call!63951 call!63949)))

(declare-fun b!1301430 () Bool)

(assert (=> b!1301430 (= e!742285 (+!4461 call!63950 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1301431 () Bool)

(declare-fun e!742288 () Bool)

(assert (=> b!1301431 (= e!742286 e!742288)))

(declare-fun res!864659 () Bool)

(assert (=> b!1301431 (= res!864659 call!63945)))

(assert (=> b!1301431 (=> (not res!864659) (not e!742288))))

(declare-fun bm!63948 () Bool)

(assert (=> bm!63948 (= call!63950 (+!4461 (ite c!124752 call!63949 (ite c!124753 call!63951 call!63946)) (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1301432 () Bool)

(assert (=> b!1301432 (= e!742288 (= (apply!1017 lt!582024 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1301433 () Bool)

(assert (=> b!1301433 (= e!742286 (not call!63945))))

(declare-fun b!1301434 () Bool)

(declare-fun c!124754 () Bool)

(assert (=> b!1301434 (= c!124754 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1301434 (= e!742295 e!742284)))

(assert (= (and d!141209 c!124752) b!1301430))

(assert (= (and d!141209 (not c!124752)) b!1301415))

(assert (= (and b!1301415 c!124753) b!1301419))

(assert (= (and b!1301415 (not c!124753)) b!1301434))

(assert (= (and b!1301434 c!124754) b!1301423))

(assert (= (and b!1301434 (not c!124754)) b!1301416))

(assert (= (or b!1301423 b!1301416) bm!63945))

(assert (= (or b!1301419 bm!63945) bm!63947))

(assert (= (or b!1301419 b!1301423) bm!63943))

(assert (= (or b!1301430 bm!63947) bm!63946))

(assert (= (or b!1301430 bm!63943) bm!63948))

(assert (= (and d!141209 res!864654) b!1301421))

(assert (= (and d!141209 c!124755) b!1301420))

(assert (= (and d!141209 (not c!124755)) b!1301426))

(assert (= (and d!141209 res!864655) b!1301422))

(assert (= (and b!1301422 res!864656) b!1301427))

(assert (= (and b!1301422 (not res!864651)) b!1301429))

(assert (= (and b!1301429 res!864652) b!1301425))

(assert (= (and b!1301422 res!864657) b!1301428))

(assert (= (and b!1301428 c!124757) b!1301431))

(assert (= (and b!1301428 (not c!124757)) b!1301433))

(assert (= (and b!1301431 res!864659) b!1301432))

(assert (= (or b!1301431 b!1301433) bm!63942))

(assert (= (and b!1301428 res!864658) b!1301414))

(assert (= (and b!1301414 c!124756) b!1301418))

(assert (= (and b!1301414 (not c!124756)) b!1301417))

(assert (= (and b!1301418 res!864653) b!1301424))

(assert (= (or b!1301418 b!1301417) bm!63944))

(declare-fun b_lambda!23193 () Bool)

(assert (=> (not b_lambda!23193) (not b!1301425)))

(assert (=> b!1301425 t!43285))

(declare-fun b_and!47341 () Bool)

(assert (= b_and!47335 (and (=> t!43285 result!23773) b_and!47341)))

(declare-fun m!1192117 () Bool)

(assert (=> bm!63944 m!1192117))

(declare-fun m!1192119 () Bool)

(assert (=> b!1301432 m!1192119))

(declare-fun m!1192121 () Bool)

(assert (=> b!1301424 m!1192121))

(declare-fun m!1192123 () Bool)

(assert (=> b!1301420 m!1192123))

(declare-fun m!1192125 () Bool)

(assert (=> b!1301420 m!1192125))

(assert (=> b!1301420 m!1192125))

(declare-fun m!1192127 () Bool)

(assert (=> b!1301420 m!1192127))

(declare-fun m!1192129 () Bool)

(assert (=> b!1301420 m!1192129))

(declare-fun m!1192131 () Bool)

(assert (=> b!1301420 m!1192131))

(declare-fun m!1192133 () Bool)

(assert (=> b!1301420 m!1192133))

(assert (=> b!1301420 m!1191961))

(declare-fun m!1192135 () Bool)

(assert (=> b!1301420 m!1192135))

(declare-fun m!1192137 () Bool)

(assert (=> b!1301420 m!1192137))

(declare-fun m!1192139 () Bool)

(assert (=> b!1301420 m!1192139))

(declare-fun m!1192141 () Bool)

(assert (=> b!1301420 m!1192141))

(declare-fun m!1192143 () Bool)

(assert (=> b!1301420 m!1192143))

(declare-fun m!1192145 () Bool)

(assert (=> b!1301420 m!1192145))

(assert (=> b!1301420 m!1192001))

(declare-fun m!1192147 () Bool)

(assert (=> b!1301420 m!1192147))

(assert (=> b!1301420 m!1192139))

(declare-fun m!1192149 () Bool)

(assert (=> b!1301420 m!1192149))

(declare-fun m!1192151 () Bool)

(assert (=> b!1301420 m!1192151))

(assert (=> b!1301420 m!1192143))

(assert (=> b!1301420 m!1192129))

(assert (=> bm!63946 m!1192001))

(declare-fun m!1192153 () Bool)

(assert (=> bm!63948 m!1192153))

(assert (=> d!141209 m!1191977))

(assert (=> b!1301425 m!1191991))

(assert (=> b!1301425 m!1191961))

(declare-fun m!1192155 () Bool)

(assert (=> b!1301425 m!1192155))

(assert (=> b!1301425 m!1191989))

(assert (=> b!1301425 m!1191961))

(assert (=> b!1301425 m!1191991))

(assert (=> b!1301425 m!1191989))

(assert (=> b!1301425 m!1191999))

(assert (=> b!1301421 m!1191961))

(assert (=> b!1301421 m!1191961))

(assert (=> b!1301421 m!1191971))

(declare-fun m!1192157 () Bool)

(assert (=> b!1301430 m!1192157))

(assert (=> b!1301429 m!1191961))

(assert (=> b!1301429 m!1191961))

(declare-fun m!1192159 () Bool)

(assert (=> b!1301429 m!1192159))

(assert (=> b!1301427 m!1191961))

(assert (=> b!1301427 m!1191961))

(assert (=> b!1301427 m!1191971))

(declare-fun m!1192161 () Bool)

(assert (=> bm!63942 m!1192161))

(assert (=> b!1301272 d!141209))

(declare-fun b!1301445 () Bool)

(declare-fun e!742307 () Bool)

(declare-fun call!63954 () Bool)

(assert (=> b!1301445 (= e!742307 call!63954)))

(declare-fun b!1301446 () Bool)

(declare-fun e!742304 () Bool)

(declare-fun contains!8262 (List!29709 (_ BitVec 64)) Bool)

(assert (=> b!1301446 (= e!742304 (contains!8262 Nil!29706 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301447 () Bool)

(assert (=> b!1301447 (= e!742307 call!63954)))

(declare-fun b!1301448 () Bool)

(declare-fun e!742305 () Bool)

(assert (=> b!1301448 (= e!742305 e!742307)))

(declare-fun c!124760 () Bool)

(assert (=> b!1301448 (= c!124760 (validKeyInArray!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301449 () Bool)

(declare-fun e!742306 () Bool)

(assert (=> b!1301449 (= e!742306 e!742305)))

(declare-fun res!864666 () Bool)

(assert (=> b!1301449 (=> (not res!864666) (not e!742305))))

(assert (=> b!1301449 (= res!864666 (not e!742304))))

(declare-fun res!864668 () Bool)

(assert (=> b!1301449 (=> (not res!864668) (not e!742304))))

(assert (=> b!1301449 (= res!864668 (validKeyInArray!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63951 () Bool)

(assert (=> bm!63951 (= call!63954 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124760 (Cons!29705 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) Nil!29706) Nil!29706)))))

(declare-fun d!141211 () Bool)

(declare-fun res!864667 () Bool)

(assert (=> d!141211 (=> res!864667 e!742306)))

(assert (=> d!141211 (= res!864667 (bvsge #b00000000000000000000000000000000 (size!42409 _keys!1741)))))

(assert (=> d!141211 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29706) e!742306)))

(assert (= (and d!141211 (not res!864667)) b!1301449))

(assert (= (and b!1301449 res!864668) b!1301446))

(assert (= (and b!1301449 res!864666) b!1301448))

(assert (= (and b!1301448 c!124760) b!1301445))

(assert (= (and b!1301448 (not c!124760)) b!1301447))

(assert (= (or b!1301445 b!1301447) bm!63951))

(declare-fun m!1192163 () Bool)

(assert (=> b!1301446 m!1192163))

(assert (=> b!1301446 m!1192163))

(declare-fun m!1192165 () Bool)

(assert (=> b!1301446 m!1192165))

(assert (=> b!1301448 m!1192163))

(assert (=> b!1301448 m!1192163))

(declare-fun m!1192167 () Bool)

(assert (=> b!1301448 m!1192167))

(assert (=> b!1301449 m!1192163))

(assert (=> b!1301449 m!1192163))

(assert (=> b!1301449 m!1192167))

(assert (=> bm!63951 m!1192163))

(declare-fun m!1192169 () Bool)

(assert (=> bm!63951 m!1192169))

(assert (=> b!1301288 d!141211))

(declare-fun d!141213 () Bool)

(assert (=> d!141213 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109824 d!141213))

(declare-fun d!141215 () Bool)

(assert (=> d!141215 (= (array_inv!31665 _values!1445) (bvsge (size!42408 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109824 d!141215))

(declare-fun d!141217 () Bool)

(assert (=> d!141217 (= (array_inv!31666 _keys!1741) (bvsge (size!42409 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109824 d!141217))

(declare-fun d!141219 () Bool)

(declare-fun e!742308 () Bool)

(assert (=> d!141219 e!742308))

(declare-fun res!864669 () Bool)

(assert (=> d!141219 (=> res!864669 e!742308)))

(declare-fun lt!582027 () Bool)

(assert (=> d!141219 (= res!864669 (not lt!582027))))

(declare-fun lt!582026 () Bool)

(assert (=> d!141219 (= lt!582027 lt!582026)))

(declare-fun lt!582025 () Unit!43067)

(declare-fun e!742309 () Unit!43067)

(assert (=> d!141219 (= lt!582025 e!742309)))

(declare-fun c!124761 () Bool)

(assert (=> d!141219 (= c!124761 lt!582026)))

(assert (=> d!141219 (= lt!582026 (containsKey!722 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(assert (=> d!141219 (= (contains!8260 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) k0!1205) lt!582027)))

(declare-fun b!1301450 () Bool)

(declare-fun lt!582028 () Unit!43067)

(assert (=> b!1301450 (= e!742309 lt!582028)))

(assert (=> b!1301450 (= lt!582028 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(assert (=> b!1301450 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(declare-fun b!1301451 () Bool)

(declare-fun Unit!43078 () Unit!43067)

(assert (=> b!1301451 (= e!742309 Unit!43078)))

(declare-fun b!1301452 () Bool)

(assert (=> b!1301452 (= e!742308 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205)))))

(assert (= (and d!141219 c!124761) b!1301450))

(assert (= (and d!141219 (not c!124761)) b!1301451))

(assert (= (and d!141219 (not res!864669)) b!1301452))

(declare-fun m!1192171 () Bool)

(assert (=> d!141219 m!1192171))

(declare-fun m!1192173 () Bool)

(assert (=> b!1301450 m!1192173))

(declare-fun m!1192175 () Bool)

(assert (=> b!1301450 m!1192175))

(assert (=> b!1301450 m!1192175))

(declare-fun m!1192177 () Bool)

(assert (=> b!1301450 m!1192177))

(assert (=> b!1301452 m!1192175))

(assert (=> b!1301452 m!1192175))

(assert (=> b!1301452 m!1192177))

(assert (=> b!1301285 d!141219))

(declare-fun d!141221 () Bool)

(declare-fun e!742310 () Bool)

(assert (=> d!141221 e!742310))

(declare-fun res!864671 () Bool)

(assert (=> d!141221 (=> (not res!864671) (not e!742310))))

(declare-fun lt!582030 () ListLongMap!20237)

(assert (=> d!141221 (= res!864671 (contains!8260 lt!582030 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun lt!582029 () List!29708)

(assert (=> d!141221 (= lt!582030 (ListLongMap!20238 lt!582029))))

(declare-fun lt!582031 () Unit!43067)

(declare-fun lt!582032 () Unit!43067)

(assert (=> d!141221 (= lt!582031 lt!582032)))

(assert (=> d!141221 (= (getValueByKey!700 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) (Some!751 (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(assert (=> d!141221 (= lt!582032 (lemmaContainsTupThenGetReturnValue!346 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(assert (=> d!141221 (= lt!582029 (insertStrictlySorted!475 (toList!10134 (ListLongMap!20238 Nil!29705)) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(assert (=> d!141221 (= (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) lt!582030)))

(declare-fun b!1301453 () Bool)

(declare-fun res!864670 () Bool)

(assert (=> b!1301453 (=> (not res!864670) (not e!742310))))

(assert (=> b!1301453 (= res!864670 (= (getValueByKey!700 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) (Some!751 (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(declare-fun b!1301454 () Bool)

(assert (=> b!1301454 (= e!742310 (contains!8261 (toList!10134 lt!582030) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))

(assert (= (and d!141221 res!864671) b!1301453))

(assert (= (and b!1301453 res!864670) b!1301454))

(declare-fun m!1192179 () Bool)

(assert (=> d!141221 m!1192179))

(declare-fun m!1192181 () Bool)

(assert (=> d!141221 m!1192181))

(declare-fun m!1192183 () Bool)

(assert (=> d!141221 m!1192183))

(declare-fun m!1192185 () Bool)

(assert (=> d!141221 m!1192185))

(declare-fun m!1192187 () Bool)

(assert (=> b!1301453 m!1192187))

(declare-fun m!1192189 () Bool)

(assert (=> b!1301454 m!1192189))

(assert (=> b!1301285 d!141221))

(declare-fun d!141223 () Bool)

(assert (=> d!141223 (not (contains!8260 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) k0!1205))))

(declare-fun lt!582035 () Unit!43067)

(declare-fun choose!1905 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> d!141223 (= lt!582035 (choose!1905 (ListLongMap!20238 Nil!29705) (select (arr!41859 _keys!1741) from!2144) lt!581875 k0!1205))))

(declare-fun e!742313 () Bool)

(assert (=> d!141223 e!742313))

(declare-fun res!864674 () Bool)

(assert (=> d!141223 (=> (not res!864674) (not e!742313))))

(assert (=> d!141223 (= res!864674 (not (contains!8260 (ListLongMap!20238 Nil!29705) k0!1205)))))

(assert (=> d!141223 (= (addStillNotContains!459 (ListLongMap!20238 Nil!29705) (select (arr!41859 _keys!1741) from!2144) lt!581875 k0!1205) lt!582035)))

(declare-fun b!1301458 () Bool)

(assert (=> b!1301458 (= e!742313 (not (= (select (arr!41859 _keys!1741) from!2144) k0!1205)))))

(assert (= (and d!141223 res!864674) b!1301458))

(assert (=> d!141223 m!1191993))

(assert (=> d!141223 m!1191993))

(assert (=> d!141223 m!1191995))

(assert (=> d!141223 m!1191961))

(declare-fun m!1192191 () Bool)

(assert (=> d!141223 m!1192191))

(assert (=> d!141223 m!1191963))

(assert (=> b!1301285 d!141223))

(declare-fun d!141225 () Bool)

(declare-fun c!124764 () Bool)

(assert (=> d!141225 (= c!124764 ((_ is ValueCellFull!16530) (select (arr!41858 _values!1445) from!2144)))))

(declare-fun e!742316 () V!51579)

(assert (=> d!141225 (= (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!742316)))

(declare-fun b!1301463 () Bool)

(declare-fun get!21135 (ValueCell!16530 V!51579) V!51579)

(assert (=> b!1301463 (= e!742316 (get!21135 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301464 () Bool)

(declare-fun get!21136 (ValueCell!16530 V!51579) V!51579)

(assert (=> b!1301464 (= e!742316 (get!21136 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141225 c!124764) b!1301463))

(assert (= (and d!141225 (not c!124764)) b!1301464))

(assert (=> b!1301463 m!1191991))

(assert (=> b!1301463 m!1191989))

(declare-fun m!1192193 () Bool)

(assert (=> b!1301463 m!1192193))

(assert (=> b!1301464 m!1191991))

(assert (=> b!1301464 m!1191989))

(declare-fun m!1192195 () Bool)

(assert (=> b!1301464 m!1192195))

(assert (=> b!1301285 d!141225))

(declare-fun b!1301489 () Bool)

(declare-fun lt!582056 () Unit!43067)

(declare-fun lt!582052 () Unit!43067)

(assert (=> b!1301489 (= lt!582056 lt!582052)))

(declare-fun lt!582054 () V!51579)

(declare-fun lt!582055 () (_ BitVec 64))

(declare-fun lt!582051 () ListLongMap!20237)

(declare-fun lt!582050 () (_ BitVec 64))

(assert (=> b!1301489 (not (contains!8260 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054)) lt!582050))))

(assert (=> b!1301489 (= lt!582052 (addStillNotContains!459 lt!582051 lt!582055 lt!582054 lt!582050))))

(assert (=> b!1301489 (= lt!582050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301489 (= lt!582054 (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301489 (= lt!582055 (select (arr!41859 _keys!1741) from!2144))))

(declare-fun call!63957 () ListLongMap!20237)

(assert (=> b!1301489 (= lt!582051 call!63957)))

(declare-fun e!742337 () ListLongMap!20237)

(assert (=> b!1301489 (= e!742337 (+!4461 call!63957 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!141227 () Bool)

(declare-fun e!742331 () Bool)

(assert (=> d!141227 e!742331))

(declare-fun res!864685 () Bool)

(assert (=> d!141227 (=> (not res!864685) (not e!742331))))

(declare-fun lt!582053 () ListLongMap!20237)

(assert (=> d!141227 (= res!864685 (not (contains!8260 lt!582053 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!742333 () ListLongMap!20237)

(assert (=> d!141227 (= lt!582053 e!742333)))

(declare-fun c!124776 () Bool)

(assert (=> d!141227 (= c!124776 (bvsge from!2144 (size!42409 _keys!1741)))))

(assert (=> d!141227 (validMask!0 mask!2175)))

(assert (=> d!141227 (= (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582053)))

(declare-fun b!1301490 () Bool)

(declare-fun e!742332 () Bool)

(declare-fun e!742334 () Bool)

(assert (=> b!1301490 (= e!742332 e!742334)))

(declare-fun c!124774 () Bool)

(assert (=> b!1301490 (= c!124774 (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun b!1301491 () Bool)

(assert (=> b!1301491 (= e!742334 (= lt!582053 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1301492 () Bool)

(assert (=> b!1301492 (= e!742331 e!742332)))

(declare-fun c!124773 () Bool)

(declare-fun e!742336 () Bool)

(assert (=> b!1301492 (= c!124773 e!742336)))

(declare-fun res!864684 () Bool)

(assert (=> b!1301492 (=> (not res!864684) (not e!742336))))

(assert (=> b!1301492 (= res!864684 (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun b!1301493 () Bool)

(assert (=> b!1301493 (= e!742336 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301493 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1301494 () Bool)

(assert (=> b!1301494 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741)))))

(assert (=> b!1301494 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42408 _values!1445)))))

(declare-fun e!742335 () Bool)

(assert (=> b!1301494 (= e!742335 (= (apply!1017 lt!582053 (select (arr!41859 _keys!1741) from!2144)) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1301495 () Bool)

(assert (=> b!1301495 (= e!742333 e!742337)))

(declare-fun c!124775 () Bool)

(assert (=> b!1301495 (= c!124775 (validKeyInArray!0 (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1301496 () Bool)

(assert (=> b!1301496 (= e!742332 e!742335)))

(assert (=> b!1301496 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42409 _keys!1741)))))

(declare-fun res!864686 () Bool)

(assert (=> b!1301496 (= res!864686 (contains!8260 lt!582053 (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301496 (=> (not res!864686) (not e!742335))))

(declare-fun b!1301497 () Bool)

(assert (=> b!1301497 (= e!742337 call!63957)))

(declare-fun bm!63954 () Bool)

(assert (=> bm!63954 (= call!63957 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301498 () Bool)

(declare-fun isEmpty!1053 (ListLongMap!20237) Bool)

(assert (=> b!1301498 (= e!742334 (isEmpty!1053 lt!582053))))

(declare-fun b!1301499 () Bool)

(declare-fun res!864683 () Bool)

(assert (=> b!1301499 (=> (not res!864683) (not e!742331))))

(assert (=> b!1301499 (= res!864683 (not (contains!8260 lt!582053 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301500 () Bool)

(assert (=> b!1301500 (= e!742333 (ListLongMap!20238 Nil!29705))))

(assert (= (and d!141227 c!124776) b!1301500))

(assert (= (and d!141227 (not c!124776)) b!1301495))

(assert (= (and b!1301495 c!124775) b!1301489))

(assert (= (and b!1301495 (not c!124775)) b!1301497))

(assert (= (or b!1301489 b!1301497) bm!63954))

(assert (= (and d!141227 res!864685) b!1301499))

(assert (= (and b!1301499 res!864683) b!1301492))

(assert (= (and b!1301492 res!864684) b!1301493))

(assert (= (and b!1301492 c!124773) b!1301496))

(assert (= (and b!1301492 (not c!124773)) b!1301490))

(assert (= (and b!1301496 res!864686) b!1301494))

(assert (= (and b!1301490 c!124774) b!1301491))

(assert (= (and b!1301490 (not c!124774)) b!1301498))

(declare-fun b_lambda!23195 () Bool)

(assert (=> (not b_lambda!23195) (not b!1301489)))

(assert (=> b!1301489 t!43285))

(declare-fun b_and!47343 () Bool)

(assert (= b_and!47341 (and (=> t!43285 result!23773) b_and!47343)))

(declare-fun b_lambda!23197 () Bool)

(assert (=> (not b_lambda!23197) (not b!1301494)))

(assert (=> b!1301494 t!43285))

(declare-fun b_and!47345 () Bool)

(assert (= b_and!47343 (and (=> t!43285 result!23773) b_and!47345)))

(assert (=> b!1301493 m!1191961))

(assert (=> b!1301493 m!1191961))

(assert (=> b!1301493 m!1191971))

(declare-fun m!1192197 () Bool)

(assert (=> b!1301499 m!1192197))

(assert (=> b!1301494 m!1191991))

(assert (=> b!1301494 m!1191989))

(assert (=> b!1301494 m!1191999))

(assert (=> b!1301494 m!1191991))

(assert (=> b!1301494 m!1191961))

(declare-fun m!1192199 () Bool)

(assert (=> b!1301494 m!1192199))

(assert (=> b!1301494 m!1191961))

(assert (=> b!1301494 m!1191989))

(assert (=> b!1301495 m!1191961))

(assert (=> b!1301495 m!1191961))

(assert (=> b!1301495 m!1191971))

(assert (=> b!1301496 m!1191961))

(assert (=> b!1301496 m!1191961))

(declare-fun m!1192201 () Bool)

(assert (=> b!1301496 m!1192201))

(declare-fun m!1192203 () Bool)

(assert (=> d!141227 m!1192203))

(assert (=> d!141227 m!1191977))

(declare-fun m!1192205 () Bool)

(assert (=> b!1301498 m!1192205))

(declare-fun m!1192207 () Bool)

(assert (=> bm!63954 m!1192207))

(assert (=> b!1301491 m!1192207))

(declare-fun m!1192209 () Bool)

(assert (=> b!1301489 m!1192209))

(assert (=> b!1301489 m!1191989))

(declare-fun m!1192211 () Bool)

(assert (=> b!1301489 m!1192211))

(assert (=> b!1301489 m!1191991))

(assert (=> b!1301489 m!1191989))

(assert (=> b!1301489 m!1191999))

(assert (=> b!1301489 m!1191991))

(declare-fun m!1192213 () Bool)

(assert (=> b!1301489 m!1192213))

(declare-fun m!1192215 () Bool)

(assert (=> b!1301489 m!1192215))

(assert (=> b!1301489 m!1192213))

(assert (=> b!1301489 m!1191961))

(assert (=> bm!63905 d!141227))

(declare-fun b!1301509 () Bool)

(declare-fun e!742345 () Bool)

(declare-fun call!63960 () Bool)

(assert (=> b!1301509 (= e!742345 call!63960)))

(declare-fun b!1301510 () Bool)

(declare-fun e!742346 () Bool)

(assert (=> b!1301510 (= e!742346 call!63960)))

(declare-fun b!1301511 () Bool)

(declare-fun e!742344 () Bool)

(assert (=> b!1301511 (= e!742344 e!742345)))

(declare-fun c!124779 () Bool)

(assert (=> b!1301511 (= c!124779 (validKeyInArray!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301512 () Bool)

(assert (=> b!1301512 (= e!742345 e!742346)))

(declare-fun lt!582065 () (_ BitVec 64))

(assert (=> b!1301512 (= lt!582065 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582063 () Unit!43067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86726 (_ BitVec 64) (_ BitVec 32)) Unit!43067)

(assert (=> b!1301512 (= lt!582063 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582065 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1301512 (arrayContainsKey!0 _keys!1741 lt!582065 #b00000000000000000000000000000000)))

(declare-fun lt!582064 () Unit!43067)

(assert (=> b!1301512 (= lt!582064 lt!582063)))

(declare-fun res!864691 () Bool)

(declare-datatypes ((SeekEntryResult!10020 0))(
  ( (MissingZero!10020 (index!42451 (_ BitVec 32))) (Found!10020 (index!42452 (_ BitVec 32))) (Intermediate!10020 (undefined!10832 Bool) (index!42453 (_ BitVec 32)) (x!115593 (_ BitVec 32))) (Undefined!10020) (MissingVacant!10020 (index!42454 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86726 (_ BitVec 32)) SeekEntryResult!10020)

(assert (=> b!1301512 (= res!864691 (= (seekEntryOrOpen!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10020 #b00000000000000000000000000000000)))))

(assert (=> b!1301512 (=> (not res!864691) (not e!742346))))

(declare-fun d!141229 () Bool)

(declare-fun res!864692 () Bool)

(assert (=> d!141229 (=> res!864692 e!742344)))

(assert (=> d!141229 (= res!864692 (bvsge #b00000000000000000000000000000000 (size!42409 _keys!1741)))))

(assert (=> d!141229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742344)))

(declare-fun bm!63957 () Bool)

(assert (=> bm!63957 (= call!63960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141229 (not res!864692)) b!1301511))

(assert (= (and b!1301511 c!124779) b!1301512))

(assert (= (and b!1301511 (not c!124779)) b!1301509))

(assert (= (and b!1301512 res!864691) b!1301510))

(assert (= (or b!1301510 b!1301509) bm!63957))

(assert (=> b!1301511 m!1192163))

(assert (=> b!1301511 m!1192163))

(assert (=> b!1301511 m!1192167))

(assert (=> b!1301512 m!1192163))

(declare-fun m!1192217 () Bool)

(assert (=> b!1301512 m!1192217))

(declare-fun m!1192219 () Bool)

(assert (=> b!1301512 m!1192219))

(assert (=> b!1301512 m!1192163))

(declare-fun m!1192221 () Bool)

(assert (=> b!1301512 m!1192221))

(declare-fun m!1192223 () Bool)

(assert (=> bm!63957 m!1192223))

(assert (=> b!1301279 d!141229))

(declare-fun mapNonEmpty!53867 () Bool)

(declare-fun mapRes!53867 () Bool)

(declare-fun tp!102794 () Bool)

(declare-fun e!742351 () Bool)

(assert (=> mapNonEmpty!53867 (= mapRes!53867 (and tp!102794 e!742351))))

(declare-fun mapRest!53867 () (Array (_ BitVec 32) ValueCell!16530))

(declare-fun mapValue!53867 () ValueCell!16530)

(declare-fun mapKey!53867 () (_ BitVec 32))

(assert (=> mapNonEmpty!53867 (= mapRest!53861 (store mapRest!53867 mapKey!53867 mapValue!53867))))

(declare-fun b!1301519 () Bool)

(assert (=> b!1301519 (= e!742351 tp_is_empty!34857)))

(declare-fun b!1301520 () Bool)

(declare-fun e!742352 () Bool)

(assert (=> b!1301520 (= e!742352 tp_is_empty!34857)))

(declare-fun mapIsEmpty!53867 () Bool)

(assert (=> mapIsEmpty!53867 mapRes!53867))

(declare-fun condMapEmpty!53867 () Bool)

(declare-fun mapDefault!53867 () ValueCell!16530)

(assert (=> mapNonEmpty!53861 (= condMapEmpty!53867 (= mapRest!53861 ((as const (Array (_ BitVec 32) ValueCell!16530)) mapDefault!53867)))))

(assert (=> mapNonEmpty!53861 (= tp!102785 (and e!742352 mapRes!53867))))

(assert (= (and mapNonEmpty!53861 condMapEmpty!53867) mapIsEmpty!53867))

(assert (= (and mapNonEmpty!53861 (not condMapEmpty!53867)) mapNonEmpty!53867))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16530) mapValue!53867)) b!1301519))

(assert (= (and mapNonEmpty!53861 ((_ is ValueCellFull!16530) mapDefault!53867)) b!1301520))

(declare-fun m!1192225 () Bool)

(assert (=> mapNonEmpty!53867 m!1192225))

(declare-fun b_lambda!23199 () Bool)

(assert (= b_lambda!23193 (or (and start!109824 b_free!29217) b_lambda!23199)))

(declare-fun b_lambda!23201 () Bool)

(assert (= b_lambda!23195 (or (and start!109824 b_free!29217) b_lambda!23201)))

(declare-fun b_lambda!23203 () Bool)

(assert (= b_lambda!23197 (or (and start!109824 b_free!29217) b_lambda!23203)))

(check-sat (not b!1301453) (not b_lambda!23203) (not b!1301454) (not b!1301368) (not bm!63944) (not b!1301361) (not d!141203) (not b_lambda!23191) (not b!1301356) (not d!141193) (not b_lambda!23199) (not b!1301448) (not b!1301363) (not b!1301420) (not b!1301491) (not b_next!29217) (not b!1301371) (not b!1301421) (not b!1301424) (not b!1301354) (not b!1301430) (not d!141207) (not b!1301496) (not b!1301450) (not d!141209) (not d!141227) (not d!141205) (not b_lambda!23201) (not b!1301511) (not b!1301365) (not b!1301463) (not bm!63946) (not b!1301446) (not b!1301427) b_and!47345 (not b!1301452) (not b!1301489) (not b!1301493) (not d!141223) (not b!1301464) (not d!141201) (not bm!63951) (not d!141219) (not b!1301362) (not d!141197) (not bm!63942) (not d!141221) (not b!1301495) (not d!141199) (not mapNonEmpty!53867) (not bm!63948) (not b!1301498) (not b!1301432) (not d!141191) (not b!1301425) (not b!1301366) (not b!1301494) (not b!1301429) (not b!1301512) (not bm!63957) tp_is_empty!34857 (not bm!63954) (not b!1301499) (not b!1301369) (not b!1301449))
(check-sat b_and!47345 (not b_next!29217))
(get-model)

(declare-fun d!141231 () Bool)

(declare-fun isEmpty!1054 (Option!752) Bool)

(assert (=> d!141231 (= (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205)) (not (isEmpty!1054 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))))

(declare-fun bs!37052 () Bool)

(assert (= bs!37052 d!141231))

(assert (=> bs!37052 m!1192097))

(declare-fun m!1192227 () Bool)

(assert (=> bs!37052 m!1192227))

(assert (=> b!1301368 d!141231))

(declare-fun c!124784 () Bool)

(declare-fun d!141233 () Bool)

(assert (=> d!141233 (= c!124784 (and ((_ is Cons!29704) (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) (= (_1!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) k0!1205)))))

(declare-fun e!742357 () Option!752)

(assert (=> d!141233 (= (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205) e!742357)))

(declare-fun e!742358 () Option!752)

(declare-fun b!1301531 () Bool)

(assert (=> b!1301531 (= e!742358 (getValueByKey!700 (t!43286 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) k0!1205))))

(declare-fun b!1301530 () Bool)

(assert (=> b!1301530 (= e!742357 e!742358)))

(declare-fun c!124785 () Bool)

(assert (=> b!1301530 (= c!124785 (and ((_ is Cons!29704) (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) (not (= (_1!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) k0!1205))))))

(declare-fun b!1301532 () Bool)

(assert (=> b!1301532 (= e!742358 None!750)))

(declare-fun b!1301529 () Bool)

(assert (=> b!1301529 (= e!742357 (Some!751 (_2!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))))))))

(assert (= (and d!141233 c!124784) b!1301529))

(assert (= (and d!141233 (not c!124784)) b!1301530))

(assert (= (and b!1301530 c!124785) b!1301531))

(assert (= (and b!1301530 (not c!124785)) b!1301532))

(declare-fun m!1192229 () Bool)

(assert (=> b!1301531 m!1192229))

(assert (=> b!1301368 d!141233))

(declare-fun b!1301533 () Bool)

(declare-fun e!742360 () Bool)

(declare-fun call!63961 () Bool)

(assert (=> b!1301533 (= e!742360 call!63961)))

(declare-fun b!1301534 () Bool)

(declare-fun e!742361 () Bool)

(assert (=> b!1301534 (= e!742361 call!63961)))

(declare-fun b!1301535 () Bool)

(declare-fun e!742359 () Bool)

(assert (=> b!1301535 (= e!742359 e!742360)))

(declare-fun c!124786 () Bool)

(assert (=> b!1301535 (= c!124786 (validKeyInArray!0 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301536 () Bool)

(assert (=> b!1301536 (= e!742360 e!742361)))

(declare-fun lt!582068 () (_ BitVec 64))

(assert (=> b!1301536 (= lt!582068 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!582066 () Unit!43067)

(assert (=> b!1301536 (= lt!582066 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582068 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1301536 (arrayContainsKey!0 _keys!1741 lt!582068 #b00000000000000000000000000000000)))

(declare-fun lt!582067 () Unit!43067)

(assert (=> b!1301536 (= lt!582067 lt!582066)))

(declare-fun res!864693 () Bool)

(assert (=> b!1301536 (= res!864693 (= (seekEntryOrOpen!0 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10020 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1301536 (=> (not res!864693) (not e!742361))))

(declare-fun d!141235 () Bool)

(declare-fun res!864694 () Bool)

(assert (=> d!141235 (=> res!864694 e!742359)))

(assert (=> d!141235 (= res!864694 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(assert (=> d!141235 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!742359)))

(declare-fun bm!63958 () Bool)

(assert (=> bm!63958 (= call!63961 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(assert (= (and d!141235 (not res!864694)) b!1301535))

(assert (= (and b!1301535 c!124786) b!1301536))

(assert (= (and b!1301535 (not c!124786)) b!1301533))

(assert (= (and b!1301536 res!864693) b!1301534))

(assert (= (or b!1301534 b!1301533) bm!63958))

(declare-fun m!1192231 () Bool)

(assert (=> b!1301535 m!1192231))

(assert (=> b!1301535 m!1192231))

(declare-fun m!1192233 () Bool)

(assert (=> b!1301535 m!1192233))

(assert (=> b!1301536 m!1192231))

(declare-fun m!1192235 () Bool)

(assert (=> b!1301536 m!1192235))

(declare-fun m!1192237 () Bool)

(assert (=> b!1301536 m!1192237))

(assert (=> b!1301536 m!1192231))

(declare-fun m!1192239 () Bool)

(assert (=> b!1301536 m!1192239))

(declare-fun m!1192241 () Bool)

(assert (=> bm!63958 m!1192241))

(assert (=> bm!63957 d!141235))

(declare-fun d!141237 () Bool)

(declare-fun c!124787 () Bool)

(assert (=> d!141237 (= c!124787 (and ((_ is Cons!29704) (toList!10134 lt!581940)) (= (_1!11301 (h!30913 (toList!10134 lt!581940))) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun e!742362 () Option!752)

(assert (=> d!141237 (= (getValueByKey!700 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!742362)))

(declare-fun b!1301539 () Bool)

(declare-fun e!742363 () Option!752)

(assert (=> b!1301539 (= e!742363 (getValueByKey!700 (t!43286 (toList!10134 lt!581940)) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301538 () Bool)

(assert (=> b!1301538 (= e!742362 e!742363)))

(declare-fun c!124788 () Bool)

(assert (=> b!1301538 (= c!124788 (and ((_ is Cons!29704) (toList!10134 lt!581940)) (not (= (_1!11301 (h!30913 (toList!10134 lt!581940))) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun b!1301540 () Bool)

(assert (=> b!1301540 (= e!742363 None!750)))

(declare-fun b!1301537 () Bool)

(assert (=> b!1301537 (= e!742362 (Some!751 (_2!11301 (h!30913 (toList!10134 lt!581940)))))))

(assert (= (and d!141237 c!124787) b!1301537))

(assert (= (and d!141237 (not c!124787)) b!1301538))

(assert (= (and b!1301538 c!124788) b!1301539))

(assert (= (and b!1301538 (not c!124788)) b!1301540))

(declare-fun m!1192243 () Bool)

(assert (=> b!1301539 m!1192243))

(assert (=> b!1301361 d!141237))

(declare-fun d!141239 () Bool)

(declare-fun get!21137 (Option!752) V!51579)

(assert (=> d!141239 (= (apply!1017 lt!582024 (select (arr!41859 _keys!1741) from!2144)) (get!21137 (getValueByKey!700 (toList!10134 lt!582024) (select (arr!41859 _keys!1741) from!2144))))))

(declare-fun bs!37053 () Bool)

(assert (= bs!37053 d!141239))

(assert (=> bs!37053 m!1191961))

(declare-fun m!1192245 () Bool)

(assert (=> bs!37053 m!1192245))

(assert (=> bs!37053 m!1192245))

(declare-fun m!1192247 () Bool)

(assert (=> bs!37053 m!1192247))

(assert (=> b!1301425 d!141239))

(assert (=> b!1301425 d!141225))

(declare-fun d!141241 () Bool)

(assert (=> d!141241 (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(declare-fun lt!582071 () Unit!43067)

(declare-fun choose!1906 (List!29708 (_ BitVec 64)) Unit!43067)

(assert (=> d!141241 (= lt!582071 (choose!1906 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(declare-fun e!742366 () Bool)

(assert (=> d!141241 e!742366))

(declare-fun res!864697 () Bool)

(assert (=> d!141241 (=> (not res!864697) (not e!742366))))

(declare-fun isStrictlySorted!870 (List!29708) Bool)

(assert (=> d!141241 (= res!864697 (isStrictlySorted!870 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))))))

(assert (=> d!141241 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205) lt!582071)))

(declare-fun b!1301543 () Bool)

(assert (=> b!1301543 (= e!742366 (containsKey!722 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(assert (= (and d!141241 res!864697) b!1301543))

(assert (=> d!141241 m!1192097))

(assert (=> d!141241 m!1192097))

(assert (=> d!141241 m!1192099))

(declare-fun m!1192249 () Bool)

(assert (=> d!141241 m!1192249))

(declare-fun m!1192251 () Bool)

(assert (=> d!141241 m!1192251))

(assert (=> b!1301543 m!1192093))

(assert (=> b!1301366 d!141241))

(assert (=> b!1301366 d!141231))

(assert (=> b!1301366 d!141233))

(assert (=> b!1301495 d!141195))

(assert (=> b!1301493 d!141195))

(declare-fun d!141243 () Bool)

(declare-fun lt!582074 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!643 (List!29708) (InoxSet tuple2!22580))

(assert (=> d!141243 (= lt!582074 (select (content!643 (toList!10134 lt!582030)) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))

(declare-fun e!742372 () Bool)

(assert (=> d!141243 (= lt!582074 e!742372)))

(declare-fun res!864702 () Bool)

(assert (=> d!141243 (=> (not res!864702) (not e!742372))))

(assert (=> d!141243 (= res!864702 ((_ is Cons!29704) (toList!10134 lt!582030)))))

(assert (=> d!141243 (= (contains!8261 (toList!10134 lt!582030) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) lt!582074)))

(declare-fun b!1301548 () Bool)

(declare-fun e!742371 () Bool)

(assert (=> b!1301548 (= e!742372 e!742371)))

(declare-fun res!864703 () Bool)

(assert (=> b!1301548 (=> res!864703 e!742371)))

(assert (=> b!1301548 (= res!864703 (= (h!30913 (toList!10134 lt!582030)) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))

(declare-fun b!1301549 () Bool)

(assert (=> b!1301549 (= e!742371 (contains!8261 (t!43286 (toList!10134 lt!582030)) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))

(assert (= (and d!141243 res!864702) b!1301548))

(assert (= (and b!1301548 (not res!864703)) b!1301549))

(declare-fun m!1192253 () Bool)

(assert (=> d!141243 m!1192253))

(declare-fun m!1192255 () Bool)

(assert (=> d!141243 m!1192255))

(declare-fun m!1192257 () Bool)

(assert (=> b!1301549 m!1192257))

(assert (=> b!1301454 d!141243))

(declare-fun d!141245 () Bool)

(assert (=> d!141245 (= (validKeyInArray!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1301511 d!141245))

(declare-fun d!141247 () Bool)

(assert (=> d!141247 (= (isDefined!507 (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205)) (not (isEmpty!1054 (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))))

(declare-fun bs!37054 () Bool)

(assert (= bs!37054 d!141247))

(assert (=> bs!37054 m!1192061))

(declare-fun m!1192259 () Bool)

(assert (=> bs!37054 m!1192259))

(assert (=> b!1301356 d!141247))

(declare-fun d!141249 () Bool)

(declare-fun c!124789 () Bool)

(assert (=> d!141249 (= c!124789 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (= (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) k0!1205)))))

(declare-fun e!742373 () Option!752)

(assert (=> d!141249 (= (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205) e!742373)))

(declare-fun b!1301552 () Bool)

(declare-fun e!742374 () Option!752)

(assert (=> b!1301552 (= e!742374 (getValueByKey!700 (t!43286 (toList!10134 (ListLongMap!20238 Nil!29705))) k0!1205))))

(declare-fun b!1301551 () Bool)

(assert (=> b!1301551 (= e!742373 e!742374)))

(declare-fun c!124790 () Bool)

(assert (=> b!1301551 (= c!124790 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (not (= (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) k0!1205))))))

(declare-fun b!1301553 () Bool)

(assert (=> b!1301553 (= e!742374 None!750)))

(declare-fun b!1301550 () Bool)

(assert (=> b!1301550 (= e!742373 (Some!751 (_2!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705))))))))

(assert (= (and d!141249 c!124789) b!1301550))

(assert (= (and d!141249 (not c!124789)) b!1301551))

(assert (= (and b!1301551 c!124790) b!1301552))

(assert (= (and b!1301551 (not c!124790)) b!1301553))

(declare-fun m!1192261 () Bool)

(assert (=> b!1301552 m!1192261))

(assert (=> b!1301356 d!141249))

(declare-fun d!141251 () Bool)

(declare-fun e!742375 () Bool)

(assert (=> d!141251 e!742375))

(declare-fun res!864704 () Bool)

(assert (=> d!141251 (=> res!864704 e!742375)))

(declare-fun lt!582077 () Bool)

(assert (=> d!141251 (= res!864704 (not lt!582077))))

(declare-fun lt!582076 () Bool)

(assert (=> d!141251 (= lt!582077 lt!582076)))

(declare-fun lt!582075 () Unit!43067)

(declare-fun e!742376 () Unit!43067)

(assert (=> d!141251 (= lt!582075 e!742376)))

(declare-fun c!124791 () Bool)

(assert (=> d!141251 (= c!124791 lt!582076)))

(assert (=> d!141251 (= lt!582076 (containsKey!722 (toList!10134 lt!582024) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141251 (= (contains!8260 lt!582024 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582077)))

(declare-fun b!1301554 () Bool)

(declare-fun lt!582078 () Unit!43067)

(assert (=> b!1301554 (= e!742376 lt!582078)))

(assert (=> b!1301554 (= lt!582078 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582024) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301554 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301555 () Bool)

(declare-fun Unit!43079 () Unit!43067)

(assert (=> b!1301555 (= e!742376 Unit!43079)))

(declare-fun b!1301556 () Bool)

(assert (=> b!1301556 (= e!742375 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141251 c!124791) b!1301554))

(assert (= (and d!141251 (not c!124791)) b!1301555))

(assert (= (and d!141251 (not res!864704)) b!1301556))

(declare-fun m!1192263 () Bool)

(assert (=> d!141251 m!1192263))

(declare-fun m!1192265 () Bool)

(assert (=> b!1301554 m!1192265))

(declare-fun m!1192267 () Bool)

(assert (=> b!1301554 m!1192267))

(assert (=> b!1301554 m!1192267))

(declare-fun m!1192269 () Bool)

(assert (=> b!1301554 m!1192269))

(assert (=> b!1301556 m!1192267))

(assert (=> b!1301556 m!1192267))

(assert (=> b!1301556 m!1192269))

(assert (=> bm!63942 d!141251))

(declare-fun d!141253 () Bool)

(assert (=> d!141253 (= (get!21135 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20111 (select (arr!41858 _values!1445) from!2144)))))

(assert (=> b!1301463 d!141253))

(declare-fun d!141255 () Bool)

(assert (=> d!141255 (isDefined!507 (getValueByKey!700 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(declare-fun lt!582079 () Unit!43067)

(assert (=> d!141255 (= lt!582079 (choose!1906 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(declare-fun e!742377 () Bool)

(assert (=> d!141255 e!742377))

(declare-fun res!864705 () Bool)

(assert (=> d!141255 (=> (not res!864705) (not e!742377))))

(assert (=> d!141255 (= res!864705 (isStrictlySorted!870 (toList!10134 (ListLongMap!20238 Nil!29705))))))

(assert (=> d!141255 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205) lt!582079)))

(declare-fun b!1301557 () Bool)

(assert (=> b!1301557 (= e!742377 (containsKey!722 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205))))

(assert (= (and d!141255 res!864705) b!1301557))

(assert (=> d!141255 m!1192061))

(assert (=> d!141255 m!1192061))

(assert (=> d!141255 m!1192063))

(declare-fun m!1192271 () Bool)

(assert (=> d!141255 m!1192271))

(declare-fun m!1192273 () Bool)

(assert (=> d!141255 m!1192273))

(assert (=> b!1301557 m!1192057))

(assert (=> b!1301354 d!141255))

(assert (=> b!1301354 d!141247))

(assert (=> b!1301354 d!141249))

(declare-fun b!1301558 () Bool)

(declare-fun e!742381 () Bool)

(declare-fun call!63962 () Bool)

(assert (=> b!1301558 (= e!742381 call!63962)))

(declare-fun b!1301559 () Bool)

(declare-fun e!742378 () Bool)

(assert (=> b!1301559 (= e!742378 (contains!8262 (ite c!124760 (Cons!29705 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) Nil!29706) Nil!29706) (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301560 () Bool)

(assert (=> b!1301560 (= e!742381 call!63962)))

(declare-fun b!1301561 () Bool)

(declare-fun e!742379 () Bool)

(assert (=> b!1301561 (= e!742379 e!742381)))

(declare-fun c!124792 () Bool)

(assert (=> b!1301561 (= c!124792 (validKeyInArray!0 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1301562 () Bool)

(declare-fun e!742380 () Bool)

(assert (=> b!1301562 (= e!742380 e!742379)))

(declare-fun res!864706 () Bool)

(assert (=> b!1301562 (=> (not res!864706) (not e!742379))))

(assert (=> b!1301562 (= res!864706 (not e!742378))))

(declare-fun res!864708 () Bool)

(assert (=> b!1301562 (=> (not res!864708) (not e!742378))))

(assert (=> b!1301562 (= res!864708 (validKeyInArray!0 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!63959 () Bool)

(assert (=> bm!63959 (= call!63962 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!124792 (Cons!29705 (select (arr!41859 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!124760 (Cons!29705 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) Nil!29706) Nil!29706)) (ite c!124760 (Cons!29705 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) Nil!29706) Nil!29706))))))

(declare-fun d!141257 () Bool)

(declare-fun res!864707 () Bool)

(assert (=> d!141257 (=> res!864707 e!742380)))

(assert (=> d!141257 (= res!864707 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(assert (=> d!141257 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124760 (Cons!29705 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) Nil!29706) Nil!29706)) e!742380)))

(assert (= (and d!141257 (not res!864707)) b!1301562))

(assert (= (and b!1301562 res!864708) b!1301559))

(assert (= (and b!1301562 res!864706) b!1301561))

(assert (= (and b!1301561 c!124792) b!1301558))

(assert (= (and b!1301561 (not c!124792)) b!1301560))

(assert (= (or b!1301558 b!1301560) bm!63959))

(assert (=> b!1301559 m!1192231))

(assert (=> b!1301559 m!1192231))

(declare-fun m!1192275 () Bool)

(assert (=> b!1301559 m!1192275))

(assert (=> b!1301561 m!1192231))

(assert (=> b!1301561 m!1192231))

(assert (=> b!1301561 m!1192233))

(assert (=> b!1301562 m!1192231))

(assert (=> b!1301562 m!1192231))

(assert (=> b!1301562 m!1192233))

(assert (=> bm!63959 m!1192231))

(declare-fun m!1192277 () Bool)

(assert (=> bm!63959 m!1192277))

(assert (=> bm!63951 d!141257))

(declare-fun d!141259 () Bool)

(declare-fun isEmpty!1055 (List!29708) Bool)

(assert (=> d!141259 (= (isEmpty!1053 lt!582053) (isEmpty!1055 (toList!10134 lt!582053)))))

(declare-fun bs!37055 () Bool)

(assert (= bs!37055 d!141259))

(declare-fun m!1192279 () Bool)

(assert (=> bs!37055 m!1192279))

(assert (=> b!1301498 d!141259))

(declare-fun d!141261 () Bool)

(declare-fun res!864713 () Bool)

(declare-fun e!742386 () Bool)

(assert (=> d!141261 (=> res!864713 e!742386)))

(assert (=> d!141261 (= res!864713 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (= (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) k0!1205)))))

(assert (=> d!141261 (= (containsKey!722 (toList!10134 (ListLongMap!20238 Nil!29705)) k0!1205) e!742386)))

(declare-fun b!1301567 () Bool)

(declare-fun e!742387 () Bool)

(assert (=> b!1301567 (= e!742386 e!742387)))

(declare-fun res!864714 () Bool)

(assert (=> b!1301567 (=> (not res!864714) (not e!742387))))

(assert (=> b!1301567 (= res!864714 (and (or (not ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705)))) (bvsle (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) k0!1205)) ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (bvslt (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) k0!1205)))))

(declare-fun b!1301568 () Bool)

(assert (=> b!1301568 (= e!742387 (containsKey!722 (t!43286 (toList!10134 (ListLongMap!20238 Nil!29705))) k0!1205))))

(assert (= (and d!141261 (not res!864713)) b!1301567))

(assert (= (and b!1301567 res!864714) b!1301568))

(declare-fun m!1192281 () Bool)

(assert (=> b!1301568 m!1192281))

(assert (=> d!141191 d!141261))

(declare-fun d!141263 () Bool)

(declare-fun res!864715 () Bool)

(declare-fun e!742388 () Bool)

(assert (=> d!141263 (=> res!864715 e!742388)))

(assert (=> d!141263 (= res!864715 (and ((_ is Cons!29704) (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) (= (_1!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) k0!1205)))))

(assert (=> d!141263 (= (containsKey!722 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))) k0!1205) e!742388)))

(declare-fun b!1301569 () Bool)

(declare-fun e!742389 () Bool)

(assert (=> b!1301569 (= e!742388 e!742389)))

(declare-fun res!864716 () Bool)

(assert (=> b!1301569 (=> (not res!864716) (not e!742389))))

(assert (=> b!1301569 (= res!864716 (and (or (not ((_ is Cons!29704) (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) (bvsle (_1!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) k0!1205)) ((_ is Cons!29704) (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) (bvslt (_1!11301 (h!30913 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868))))) k0!1205)))))

(declare-fun b!1301570 () Bool)

(assert (=> b!1301570 (= e!742389 (containsKey!722 (t!43286 (toList!10134 (ite c!124722 lt!581867 (ite c!124723 lt!581876 lt!581868)))) k0!1205))))

(assert (= (and d!141263 (not res!864715)) b!1301569))

(assert (= (and b!1301569 res!864716) b!1301570))

(declare-fun m!1192283 () Bool)

(assert (=> b!1301570 m!1192283))

(assert (=> d!141203 d!141263))

(assert (=> d!141223 d!141219))

(assert (=> d!141223 d!141221))

(declare-fun d!141265 () Bool)

(assert (=> d!141265 (not (contains!8260 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) k0!1205))))

(assert (=> d!141265 true))

(declare-fun _$36!378 () Unit!43067)

(assert (=> d!141265 (= (choose!1905 (ListLongMap!20238 Nil!29705) (select (arr!41859 _keys!1741) from!2144) lt!581875 k0!1205) _$36!378)))

(declare-fun bs!37056 () Bool)

(assert (= bs!37056 d!141265))

(assert (=> bs!37056 m!1191993))

(assert (=> bs!37056 m!1191993))

(assert (=> bs!37056 m!1191995))

(assert (=> d!141223 d!141265))

(assert (=> d!141223 d!141191))

(declare-fun d!141267 () Bool)

(assert (=> d!141267 (isDefined!507 (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582080 () Unit!43067)

(assert (=> d!141267 (= lt!582080 (choose!1906 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!742390 () Bool)

(assert (=> d!141267 e!742390))

(declare-fun res!864717 () Bool)

(assert (=> d!141267 (=> (not res!864717) (not e!742390))))

(assert (=> d!141267 (= res!864717 (isStrictlySorted!870 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141267 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582080)))

(declare-fun b!1301572 () Bool)

(assert (=> b!1301572 (= e!742390 (containsKey!722 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141267 res!864717) b!1301572))

(assert (=> d!141267 m!1192113))

(assert (=> d!141267 m!1192113))

(assert (=> d!141267 m!1192115))

(declare-fun m!1192285 () Bool)

(assert (=> d!141267 m!1192285))

(declare-fun m!1192287 () Bool)

(assert (=> d!141267 m!1192287))

(assert (=> b!1301572 m!1192109))

(assert (=> b!1301369 d!141267))

(declare-fun d!141269 () Bool)

(assert (=> d!141269 (= (isDefined!507 (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1054 (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37057 () Bool)

(assert (= bs!37057 d!141269))

(assert (=> bs!37057 m!1192113))

(declare-fun m!1192289 () Bool)

(assert (=> bs!37057 m!1192289))

(assert (=> b!1301369 d!141269))

(declare-fun c!124793 () Bool)

(declare-fun d!141271 () Bool)

(assert (=> d!141271 (= c!124793 (and ((_ is Cons!29704) (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!742391 () Option!752)

(assert (=> d!141271 (= (getValueByKey!700 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742391)))

(declare-fun e!742392 () Option!752)

(declare-fun b!1301575 () Bool)

(assert (=> b!1301575 (= e!742392 (getValueByKey!700 (t!43286 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun b!1301574 () Bool)

(assert (=> b!1301574 (= e!742391 e!742392)))

(declare-fun c!124794 () Bool)

(assert (=> b!1301574 (= c!124794 (and ((_ is Cons!29704) (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1301576 () Bool)

(assert (=> b!1301576 (= e!742392 None!750)))

(declare-fun b!1301573 () Bool)

(assert (=> b!1301573 (= e!742391 (Some!751 (_2!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!141271 c!124793) b!1301573))

(assert (= (and d!141271 (not c!124793)) b!1301574))

(assert (= (and b!1301574 c!124794) b!1301575))

(assert (= (and b!1301574 (not c!124794)) b!1301576))

(declare-fun m!1192291 () Bool)

(assert (=> b!1301575 m!1192291))

(assert (=> b!1301369 d!141271))

(declare-fun d!141273 () Bool)

(declare-fun e!742393 () Bool)

(assert (=> d!141273 e!742393))

(declare-fun res!864718 () Bool)

(assert (=> d!141273 (=> res!864718 e!742393)))

(declare-fun lt!582083 () Bool)

(assert (=> d!141273 (= res!864718 (not lt!582083))))

(declare-fun lt!582082 () Bool)

(assert (=> d!141273 (= lt!582083 lt!582082)))

(declare-fun lt!582081 () Unit!43067)

(declare-fun e!742394 () Unit!43067)

(assert (=> d!141273 (= lt!582081 e!742394)))

(declare-fun c!124795 () Bool)

(assert (=> d!141273 (= c!124795 lt!582082)))

(assert (=> d!141273 (= lt!582082 (containsKey!722 (toList!10134 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(assert (=> d!141273 (= (contains!8260 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) k0!1205) lt!582083)))

(declare-fun b!1301577 () Bool)

(declare-fun lt!582084 () Unit!43067)

(assert (=> b!1301577 (= e!742394 lt!582084)))

(assert (=> b!1301577 (= lt!582084 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(assert (=> b!1301577 (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) k0!1205))))

(declare-fun b!1301578 () Bool)

(declare-fun Unit!43080 () Unit!43067)

(assert (=> b!1301578 (= e!742394 Unit!43080)))

(declare-fun b!1301579 () Bool)

(assert (=> b!1301579 (= e!742393 (isDefined!507 (getValueByKey!700 (toList!10134 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) k0!1205)))))

(assert (= (and d!141273 c!124795) b!1301577))

(assert (= (and d!141273 (not c!124795)) b!1301578))

(assert (= (and d!141273 (not res!864718)) b!1301579))

(declare-fun m!1192293 () Bool)

(assert (=> d!141273 m!1192293))

(declare-fun m!1192295 () Bool)

(assert (=> b!1301577 m!1192295))

(declare-fun m!1192297 () Bool)

(assert (=> b!1301577 m!1192297))

(assert (=> b!1301577 m!1192297))

(declare-fun m!1192299 () Bool)

(assert (=> b!1301577 m!1192299))

(assert (=> b!1301579 m!1192297))

(assert (=> b!1301579 m!1192297))

(assert (=> b!1301579 m!1192299))

(assert (=> d!141205 d!141273))

(declare-fun d!141275 () Bool)

(assert (=> d!141275 (contains!8260 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) k0!1205)))

(assert (=> d!141275 true))

(declare-fun _$21!120 () Unit!43067)

(assert (=> d!141275 (= (choose!1904 k0!1205 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)) (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) _$21!120)))

(declare-fun bs!37058 () Bool)

(assert (= bs!37058 d!141275))

(assert (=> bs!37058 m!1192101))

(assert (=> d!141205 d!141275))

(declare-fun d!141277 () Bool)

(declare-fun e!742395 () Bool)

(assert (=> d!141277 e!742395))

(declare-fun res!864719 () Bool)

(assert (=> d!141277 (=> res!864719 e!742395)))

(declare-fun lt!582087 () Bool)

(assert (=> d!141277 (= res!864719 (not lt!582087))))

(declare-fun lt!582086 () Bool)

(assert (=> d!141277 (= lt!582087 lt!582086)))

(declare-fun lt!582085 () Unit!43067)

(declare-fun e!742396 () Unit!43067)

(assert (=> d!141277 (= lt!582085 e!742396)))

(declare-fun c!124796 () Bool)

(assert (=> d!141277 (= c!124796 lt!582086)))

(assert (=> d!141277 (= lt!582086 (containsKey!722 (toList!10134 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> d!141277 (= (contains!8260 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))) k0!1205) lt!582087)))

(declare-fun b!1301580 () Bool)

(declare-fun lt!582088 () Unit!43067)

(assert (=> b!1301580 (= e!742396 lt!582088)))

(assert (=> b!1301580 (= lt!582088 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) k0!1205))))

(assert (=> b!1301580 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) k0!1205))))

(declare-fun b!1301581 () Bool)

(declare-fun Unit!43081 () Unit!43067)

(assert (=> b!1301581 (= e!742396 Unit!43081)))

(declare-fun b!1301582 () Bool)

(assert (=> b!1301582 (= e!742395 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) k0!1205)))))

(assert (= (and d!141277 c!124796) b!1301580))

(assert (= (and d!141277 (not c!124796)) b!1301581))

(assert (= (and d!141277 (not res!864719)) b!1301582))

(declare-fun m!1192301 () Bool)

(assert (=> d!141277 m!1192301))

(declare-fun m!1192303 () Bool)

(assert (=> b!1301580 m!1192303))

(declare-fun m!1192305 () Bool)

(assert (=> b!1301580 m!1192305))

(assert (=> b!1301580 m!1192305))

(declare-fun m!1192307 () Bool)

(assert (=> b!1301580 m!1192307))

(assert (=> b!1301582 m!1192305))

(assert (=> b!1301582 m!1192305))

(assert (=> b!1301582 m!1192307))

(assert (=> d!141205 d!141277))

(declare-fun d!141279 () Bool)

(declare-fun e!742397 () Bool)

(assert (=> d!141279 e!742397))

(declare-fun res!864721 () Bool)

(assert (=> d!141279 (=> (not res!864721) (not e!742397))))

(declare-fun lt!582090 () ListLongMap!20237)

(assert (=> d!141279 (= res!864721 (contains!8260 lt!582090 (_1!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))))))

(declare-fun lt!582089 () List!29708)

(assert (=> d!141279 (= lt!582090 (ListLongMap!20238 lt!582089))))

(declare-fun lt!582091 () Unit!43067)

(declare-fun lt!582092 () Unit!43067)

(assert (=> d!141279 (= lt!582091 lt!582092)))

(assert (=> d!141279 (= (getValueByKey!700 lt!582089 (_1!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) (Some!751 (_2!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141279 (= lt!582092 (lemmaContainsTupThenGetReturnValue!346 lt!582089 (_1!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))) (_2!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141279 (= lt!582089 (insertStrictlySorted!475 (toList!10134 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868))) (_1!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))) (_2!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))))))

(assert (=> d!141279 (= (+!4461 (ite c!124722 lt!581864 (ite c!124723 lt!581876 lt!581868)) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))) lt!582090)))

(declare-fun b!1301583 () Bool)

(declare-fun res!864720 () Bool)

(assert (=> b!1301583 (=> (not res!864720) (not e!742397))))

(assert (=> b!1301583 (= res!864720 (= (getValueByKey!700 (toList!10134 lt!582090) (_1!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387))))) (Some!751 (_2!11301 (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))))))))

(declare-fun b!1301584 () Bool)

(assert (=> b!1301584 (= e!742397 (contains!8261 (toList!10134 lt!582090) (tuple2!22581 (ite c!124722 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!124723 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!124722 minValue!1387 (ite c!124723 zeroValue!1387 minValue!1387)))))))

(assert (= (and d!141279 res!864721) b!1301583))

(assert (= (and b!1301583 res!864720) b!1301584))

(declare-fun m!1192309 () Bool)

(assert (=> d!141279 m!1192309))

(declare-fun m!1192311 () Bool)

(assert (=> d!141279 m!1192311))

(declare-fun m!1192313 () Bool)

(assert (=> d!141279 m!1192313))

(declare-fun m!1192315 () Bool)

(assert (=> d!141279 m!1192315))

(declare-fun m!1192317 () Bool)

(assert (=> b!1301583 m!1192317))

(declare-fun m!1192319 () Bool)

(assert (=> b!1301584 m!1192319))

(assert (=> d!141205 d!141279))

(declare-fun d!141281 () Bool)

(assert (=> d!141281 (= (apply!1017 lt!582024 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21137 (getValueByKey!700 (toList!10134 lt!582024) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37059 () Bool)

(assert (= bs!37059 d!141281))

(assert (=> bs!37059 m!1192267))

(assert (=> bs!37059 m!1192267))

(declare-fun m!1192321 () Bool)

(assert (=> bs!37059 m!1192321))

(assert (=> b!1301432 d!141281))

(assert (=> d!141193 d!141191))

(declare-fun d!141283 () Bool)

(assert (=> d!141283 (not (contains!8260 (ListLongMap!20238 Nil!29705) k0!1205))))

(assert (=> d!141283 true))

(declare-fun _$29!192 () Unit!43067)

(assert (=> d!141283 (= (choose!1903 k0!1205) _$29!192)))

(declare-fun bs!37060 () Bool)

(assert (= bs!37060 d!141283))

(assert (=> bs!37060 m!1191963))

(assert (=> d!141193 d!141283))

(assert (=> b!1301371 d!141269))

(assert (=> b!1301371 d!141271))

(declare-fun d!141285 () Bool)

(declare-fun e!742398 () Bool)

(assert (=> d!141285 e!742398))

(declare-fun res!864722 () Bool)

(assert (=> d!141285 (=> res!864722 e!742398)))

(declare-fun lt!582095 () Bool)

(assert (=> d!141285 (= res!864722 (not lt!582095))))

(declare-fun lt!582094 () Bool)

(assert (=> d!141285 (= lt!582095 lt!582094)))

(declare-fun lt!582093 () Unit!43067)

(declare-fun e!742399 () Unit!43067)

(assert (=> d!141285 (= lt!582093 e!742399)))

(declare-fun c!124797 () Bool)

(assert (=> d!141285 (= c!124797 lt!582094)))

(assert (=> d!141285 (= lt!582094 (containsKey!722 (toList!10134 lt!582024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141285 (= (contains!8260 lt!582024 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582095)))

(declare-fun b!1301585 () Bool)

(declare-fun lt!582096 () Unit!43067)

(assert (=> b!1301585 (= e!742399 lt!582096)))

(assert (=> b!1301585 (= lt!582096 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301585 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301586 () Bool)

(declare-fun Unit!43082 () Unit!43067)

(assert (=> b!1301586 (= e!742399 Unit!43082)))

(declare-fun b!1301587 () Bool)

(assert (=> b!1301587 (= e!742398 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141285 c!124797) b!1301585))

(assert (= (and d!141285 (not c!124797)) b!1301586))

(assert (= (and d!141285 (not res!864722)) b!1301587))

(declare-fun m!1192323 () Bool)

(assert (=> d!141285 m!1192323))

(declare-fun m!1192325 () Bool)

(assert (=> b!1301585 m!1192325))

(declare-fun m!1192327 () Bool)

(assert (=> b!1301585 m!1192327))

(assert (=> b!1301585 m!1192327))

(declare-fun m!1192329 () Bool)

(assert (=> b!1301585 m!1192329))

(assert (=> b!1301587 m!1192327))

(assert (=> b!1301587 m!1192327))

(assert (=> b!1301587 m!1192329))

(assert (=> bm!63944 d!141285))

(declare-fun d!141287 () Bool)

(declare-fun e!742400 () Bool)

(assert (=> d!141287 e!742400))

(declare-fun res!864723 () Bool)

(assert (=> d!141287 (=> res!864723 e!742400)))

(declare-fun lt!582099 () Bool)

(assert (=> d!141287 (= res!864723 (not lt!582099))))

(declare-fun lt!582098 () Bool)

(assert (=> d!141287 (= lt!582099 lt!582098)))

(declare-fun lt!582097 () Unit!43067)

(declare-fun e!742401 () Unit!43067)

(assert (=> d!141287 (= lt!582097 e!742401)))

(declare-fun c!124798 () Bool)

(assert (=> d!141287 (= c!124798 lt!582098)))

(assert (=> d!141287 (= lt!582098 (containsKey!722 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141287 (= (contains!8260 lt!581940 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582099)))

(declare-fun b!1301588 () Bool)

(declare-fun lt!582100 () Unit!43067)

(assert (=> b!1301588 (= e!742401 lt!582100)))

(assert (=> b!1301588 (= lt!582100 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> b!1301588 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301589 () Bool)

(declare-fun Unit!43083 () Unit!43067)

(assert (=> b!1301589 (= e!742401 Unit!43083)))

(declare-fun b!1301590 () Bool)

(assert (=> b!1301590 (= e!742400 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581940) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141287 c!124798) b!1301588))

(assert (= (and d!141287 (not c!124798)) b!1301589))

(assert (= (and d!141287 (not res!864723)) b!1301590))

(declare-fun m!1192331 () Bool)

(assert (=> d!141287 m!1192331))

(declare-fun m!1192333 () Bool)

(assert (=> b!1301588 m!1192333))

(assert (=> b!1301588 m!1192075))

(assert (=> b!1301588 m!1192075))

(declare-fun m!1192335 () Bool)

(assert (=> b!1301588 m!1192335))

(assert (=> b!1301590 m!1192075))

(assert (=> b!1301590 m!1192075))

(assert (=> b!1301590 m!1192335))

(assert (=> d!141197 d!141287))

(declare-fun d!141289 () Bool)

(declare-fun c!124799 () Bool)

(assert (=> d!141289 (= c!124799 (and ((_ is Cons!29704) lt!581939) (= (_1!11301 (h!30913 lt!581939)) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun e!742402 () Option!752)

(assert (=> d!141289 (= (getValueByKey!700 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) e!742402)))

(declare-fun b!1301593 () Bool)

(declare-fun e!742403 () Option!752)

(assert (=> b!1301593 (= e!742403 (getValueByKey!700 (t!43286 lt!581939) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301592 () Bool)

(assert (=> b!1301592 (= e!742402 e!742403)))

(declare-fun c!124800 () Bool)

(assert (=> b!1301592 (= c!124800 (and ((_ is Cons!29704) lt!581939) (not (= (_1!11301 (h!30913 lt!581939)) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun b!1301594 () Bool)

(assert (=> b!1301594 (= e!742403 None!750)))

(declare-fun b!1301591 () Bool)

(assert (=> b!1301591 (= e!742402 (Some!751 (_2!11301 (h!30913 lt!581939))))))

(assert (= (and d!141289 c!124799) b!1301591))

(assert (= (and d!141289 (not c!124799)) b!1301592))

(assert (= (and b!1301592 c!124800) b!1301593))

(assert (= (and b!1301592 (not c!124800)) b!1301594))

(declare-fun m!1192337 () Bool)

(assert (=> b!1301593 m!1192337))

(assert (=> d!141197 d!141289))

(declare-fun d!141291 () Bool)

(assert (=> d!141291 (= (getValueByKey!700 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!582103 () Unit!43067)

(declare-fun choose!1907 (List!29708 (_ BitVec 64) V!51579) Unit!43067)

(assert (=> d!141291 (= lt!582103 (choose!1907 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun e!742406 () Bool)

(assert (=> d!141291 e!742406))

(declare-fun res!864728 () Bool)

(assert (=> d!141291 (=> (not res!864728) (not e!742406))))

(assert (=> d!141291 (= res!864728 (isStrictlySorted!870 lt!581939))))

(assert (=> d!141291 (= (lemmaContainsTupThenGetReturnValue!346 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582103)))

(declare-fun b!1301599 () Bool)

(declare-fun res!864729 () Bool)

(assert (=> b!1301599 (=> (not res!864729) (not e!742406))))

(assert (=> b!1301599 (= res!864729 (containsKey!722 lt!581939 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301600 () Bool)

(assert (=> b!1301600 (= e!742406 (contains!8261 lt!581939 (tuple2!22581 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141291 res!864728) b!1301599))

(assert (= (and b!1301599 res!864729) b!1301600))

(assert (=> d!141291 m!1192069))

(declare-fun m!1192339 () Bool)

(assert (=> d!141291 m!1192339))

(declare-fun m!1192341 () Bool)

(assert (=> d!141291 m!1192341))

(declare-fun m!1192343 () Bool)

(assert (=> b!1301599 m!1192343))

(declare-fun m!1192345 () Bool)

(assert (=> b!1301600 m!1192345))

(assert (=> d!141197 d!141291))

(declare-fun bm!63966 () Bool)

(declare-fun c!124810 () Bool)

(declare-fun e!742418 () List!29708)

(declare-fun call!63971 () List!29708)

(declare-fun $colon$colon!667 (List!29708 tuple2!22580) List!29708)

(assert (=> bm!63966 (= call!63971 ($colon$colon!667 e!742418 (ite c!124810 (h!30913 (toList!10134 lt!581867)) (tuple2!22581 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))))

(declare-fun c!124811 () Bool)

(assert (=> bm!63966 (= c!124811 c!124810)))

(declare-fun b!1301621 () Bool)

(declare-fun e!742419 () Bool)

(declare-fun lt!582106 () List!29708)

(assert (=> b!1301621 (= e!742419 (contains!8261 lt!582106 (tuple2!22581 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1301622 () Bool)

(assert (=> b!1301622 (= e!742418 (insertStrictlySorted!475 (t!43286 (toList!10134 lt!581867)) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun b!1301623 () Bool)

(declare-fun c!124812 () Bool)

(assert (=> b!1301623 (= c!124812 (and ((_ is Cons!29704) (toList!10134 lt!581867)) (bvsgt (_1!11301 (h!30913 (toList!10134 lt!581867))) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun e!742421 () List!29708)

(declare-fun e!742420 () List!29708)

(assert (=> b!1301623 (= e!742421 e!742420)))

(declare-fun b!1301624 () Bool)

(declare-fun call!63969 () List!29708)

(assert (=> b!1301624 (= e!742421 call!63969)))

(declare-fun b!1301625 () Bool)

(declare-fun c!124809 () Bool)

(assert (=> b!1301625 (= e!742418 (ite c!124809 (t!43286 (toList!10134 lt!581867)) (ite c!124812 (Cons!29704 (h!30913 (toList!10134 lt!581867)) (t!43286 (toList!10134 lt!581867))) Nil!29705)))))

(declare-fun bm!63968 () Bool)

(assert (=> bm!63968 (= call!63969 call!63971)))

(declare-fun b!1301626 () Bool)

(declare-fun call!63970 () List!29708)

(assert (=> b!1301626 (= e!742420 call!63970)))

(declare-fun b!1301627 () Bool)

(assert (=> b!1301627 (= e!742420 call!63970)))

(declare-fun b!1301628 () Bool)

(declare-fun res!864734 () Bool)

(assert (=> b!1301628 (=> (not res!864734) (not e!742419))))

(assert (=> b!1301628 (= res!864734 (containsKey!722 lt!582106 (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun bm!63967 () Bool)

(assert (=> bm!63967 (= call!63970 call!63969)))

(declare-fun d!141293 () Bool)

(assert (=> d!141293 e!742419))

(declare-fun res!864735 () Bool)

(assert (=> d!141293 (=> (not res!864735) (not e!742419))))

(assert (=> d!141293 (= res!864735 (isStrictlySorted!870 lt!582106))))

(declare-fun e!742417 () List!29708)

(assert (=> d!141293 (= lt!582106 e!742417)))

(assert (=> d!141293 (= c!124810 (and ((_ is Cons!29704) (toList!10134 lt!581867)) (bvslt (_1!11301 (h!30913 (toList!10134 lt!581867))) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (=> d!141293 (isStrictlySorted!870 (toList!10134 lt!581867))))

(assert (=> d!141293 (= (insertStrictlySorted!475 (toList!10134 lt!581867) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) lt!582106)))

(declare-fun b!1301629 () Bool)

(assert (=> b!1301629 (= e!742417 call!63971)))

(declare-fun b!1301630 () Bool)

(assert (=> b!1301630 (= e!742417 e!742421)))

(assert (=> b!1301630 (= c!124809 (and ((_ is Cons!29704) (toList!10134 lt!581867)) (= (_1!11301 (h!30913 (toList!10134 lt!581867))) (_1!11301 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(assert (= (and d!141293 c!124810) b!1301629))

(assert (= (and d!141293 (not c!124810)) b!1301630))

(assert (= (and b!1301630 c!124809) b!1301624))

(assert (= (and b!1301630 (not c!124809)) b!1301623))

(assert (= (and b!1301623 c!124812) b!1301626))

(assert (= (and b!1301623 (not c!124812)) b!1301627))

(assert (= (or b!1301626 b!1301627) bm!63967))

(assert (= (or b!1301624 bm!63967) bm!63968))

(assert (= (or b!1301629 bm!63968) bm!63966))

(assert (= (and bm!63966 c!124811) b!1301622))

(assert (= (and bm!63966 (not c!124811)) b!1301625))

(assert (= (and d!141293 res!864735) b!1301628))

(assert (= (and b!1301628 res!864734) b!1301621))

(declare-fun m!1192347 () Bool)

(assert (=> b!1301621 m!1192347))

(declare-fun m!1192349 () Bool)

(assert (=> bm!63966 m!1192349))

(declare-fun m!1192351 () Bool)

(assert (=> d!141293 m!1192351))

(declare-fun m!1192353 () Bool)

(assert (=> d!141293 m!1192353))

(declare-fun m!1192355 () Bool)

(assert (=> b!1301622 m!1192355))

(declare-fun m!1192357 () Bool)

(assert (=> b!1301628 m!1192357))

(assert (=> d!141197 d!141293))

(declare-fun d!141295 () Bool)

(declare-fun lt!582107 () Bool)

(assert (=> d!141295 (= lt!582107 (select (content!643 (toList!10134 lt!581940)) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun e!742423 () Bool)

(assert (=> d!141295 (= lt!582107 e!742423)))

(declare-fun res!864736 () Bool)

(assert (=> d!141295 (=> (not res!864736) (not e!742423))))

(assert (=> d!141295 (= res!864736 ((_ is Cons!29704) (toList!10134 lt!581940)))))

(assert (=> d!141295 (= (contains!8261 (toList!10134 lt!581940) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!582107)))

(declare-fun b!1301631 () Bool)

(declare-fun e!742422 () Bool)

(assert (=> b!1301631 (= e!742423 e!742422)))

(declare-fun res!864737 () Bool)

(assert (=> b!1301631 (=> res!864737 e!742422)))

(assert (=> b!1301631 (= res!864737 (= (h!30913 (toList!10134 lt!581940)) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1301632 () Bool)

(assert (=> b!1301632 (= e!742422 (contains!8261 (t!43286 (toList!10134 lt!581940)) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141295 res!864736) b!1301631))

(assert (= (and b!1301631 (not res!864737)) b!1301632))

(declare-fun m!1192359 () Bool)

(assert (=> d!141295 m!1192359))

(declare-fun m!1192361 () Bool)

(assert (=> d!141295 m!1192361))

(declare-fun m!1192363 () Bool)

(assert (=> b!1301632 m!1192363))

(assert (=> b!1301362 d!141295))

(assert (=> d!141209 d!141213))

(assert (=> b!1301427 d!141195))

(declare-fun d!141297 () Bool)

(declare-fun res!864738 () Bool)

(declare-fun e!742424 () Bool)

(assert (=> d!141297 (=> res!864738 e!742424)))

(assert (=> d!141297 (= res!864738 (and ((_ is Cons!29704) (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141297 (= (containsKey!722 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742424)))

(declare-fun b!1301633 () Bool)

(declare-fun e!742425 () Bool)

(assert (=> b!1301633 (= e!742424 e!742425)))

(declare-fun res!864739 () Bool)

(assert (=> b!1301633 (=> (not res!864739) (not e!742425))))

(assert (=> b!1301633 (= res!864739 (and (or (not ((_ is Cons!29704) (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29704) (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11301 (h!30913 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1301634 () Bool)

(assert (=> b!1301634 (= e!742425 (containsKey!722 (t!43286 (toList!10134 (getCurrentListMap!5159 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141297 (not res!864738)) b!1301633))

(assert (= (and b!1301633 res!864739) b!1301634))

(declare-fun m!1192365 () Bool)

(assert (=> b!1301634 m!1192365))

(assert (=> d!141207 d!141297))

(declare-fun d!141299 () Bool)

(declare-fun lt!582110 () Bool)

(declare-fun content!644 (List!29709) (InoxSet (_ BitVec 64)))

(assert (=> d!141299 (= lt!582110 (select (content!644 Nil!29706) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!742431 () Bool)

(assert (=> d!141299 (= lt!582110 e!742431)))

(declare-fun res!864745 () Bool)

(assert (=> d!141299 (=> (not res!864745) (not e!742431))))

(assert (=> d!141299 (= res!864745 ((_ is Cons!29705) Nil!29706))))

(assert (=> d!141299 (= (contains!8262 Nil!29706 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)) lt!582110)))

(declare-fun b!1301639 () Bool)

(declare-fun e!742430 () Bool)

(assert (=> b!1301639 (= e!742431 e!742430)))

(declare-fun res!864744 () Bool)

(assert (=> b!1301639 (=> res!864744 e!742430)))

(assert (=> b!1301639 (= res!864744 (= (h!30914 Nil!29706) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301640 () Bool)

(assert (=> b!1301640 (= e!742430 (contains!8262 (t!43287 Nil!29706) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141299 res!864745) b!1301639))

(assert (= (and b!1301639 (not res!864744)) b!1301640))

(declare-fun m!1192367 () Bool)

(assert (=> d!141299 m!1192367))

(assert (=> d!141299 m!1192163))

(declare-fun m!1192369 () Bool)

(assert (=> d!141299 m!1192369))

(assert (=> b!1301640 m!1192163))

(declare-fun m!1192371 () Bool)

(assert (=> b!1301640 m!1192371))

(assert (=> b!1301446 d!141299))

(assert (=> bm!63946 d!141227))

(declare-fun d!141301 () Bool)

(declare-fun e!742432 () Bool)

(assert (=> d!141301 e!742432))

(declare-fun res!864746 () Bool)

(assert (=> d!141301 (=> res!864746 e!742432)))

(declare-fun lt!582113 () Bool)

(assert (=> d!141301 (= res!864746 (not lt!582113))))

(declare-fun lt!582112 () Bool)

(assert (=> d!141301 (= lt!582113 lt!582112)))

(declare-fun lt!582111 () Unit!43067)

(declare-fun e!742433 () Unit!43067)

(assert (=> d!141301 (= lt!582111 e!742433)))

(declare-fun c!124813 () Bool)

(assert (=> d!141301 (= c!124813 lt!582112)))

(assert (=> d!141301 (= lt!582112 (containsKey!722 (toList!10134 lt!582053) (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> d!141301 (= (contains!8260 lt!582053 (select (arr!41859 _keys!1741) from!2144)) lt!582113)))

(declare-fun b!1301641 () Bool)

(declare-fun lt!582114 () Unit!43067)

(assert (=> b!1301641 (= e!742433 lt!582114)))

(assert (=> b!1301641 (= lt!582114 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582053) (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301641 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1301642 () Bool)

(declare-fun Unit!43084 () Unit!43067)

(assert (=> b!1301642 (= e!742433 Unit!43084)))

(declare-fun b!1301643 () Bool)

(assert (=> b!1301643 (= e!742432 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) (select (arr!41859 _keys!1741) from!2144))))))

(assert (= (and d!141301 c!124813) b!1301641))

(assert (= (and d!141301 (not c!124813)) b!1301642))

(assert (= (and d!141301 (not res!864746)) b!1301643))

(assert (=> d!141301 m!1191961))

(declare-fun m!1192373 () Bool)

(assert (=> d!141301 m!1192373))

(assert (=> b!1301641 m!1191961))

(declare-fun m!1192375 () Bool)

(assert (=> b!1301641 m!1192375))

(assert (=> b!1301641 m!1191961))

(declare-fun m!1192377 () Bool)

(assert (=> b!1301641 m!1192377))

(assert (=> b!1301641 m!1192377))

(declare-fun m!1192379 () Bool)

(assert (=> b!1301641 m!1192379))

(assert (=> b!1301643 m!1191961))

(assert (=> b!1301643 m!1192377))

(assert (=> b!1301643 m!1192377))

(assert (=> b!1301643 m!1192379))

(assert (=> b!1301496 d!141301))

(declare-fun d!141303 () Bool)

(assert (=> d!141303 (= (apply!1017 lt!582053 (select (arr!41859 _keys!1741) from!2144)) (get!21137 (getValueByKey!700 (toList!10134 lt!582053) (select (arr!41859 _keys!1741) from!2144))))))

(declare-fun bs!37061 () Bool)

(assert (= bs!37061 d!141303))

(assert (=> bs!37061 m!1191961))

(assert (=> bs!37061 m!1192377))

(assert (=> bs!37061 m!1192377))

(declare-fun m!1192381 () Bool)

(assert (=> bs!37061 m!1192381))

(assert (=> b!1301494 d!141303))

(assert (=> b!1301494 d!141225))

(declare-fun d!141305 () Bool)

(assert (=> d!141305 (arrayContainsKey!0 _keys!1741 lt!582065 #b00000000000000000000000000000000)))

(declare-fun lt!582117 () Unit!43067)

(declare-fun choose!13 (array!86726 (_ BitVec 64) (_ BitVec 32)) Unit!43067)

(assert (=> d!141305 (= lt!582117 (choose!13 _keys!1741 lt!582065 #b00000000000000000000000000000000))))

(assert (=> d!141305 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141305 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582065 #b00000000000000000000000000000000) lt!582117)))

(declare-fun bs!37062 () Bool)

(assert (= bs!37062 d!141305))

(assert (=> bs!37062 m!1192219))

(declare-fun m!1192383 () Bool)

(assert (=> bs!37062 m!1192383))

(assert (=> b!1301512 d!141305))

(declare-fun d!141307 () Bool)

(declare-fun res!864751 () Bool)

(declare-fun e!742438 () Bool)

(assert (=> d!141307 (=> res!864751 e!742438)))

(assert (=> d!141307 (= res!864751 (= (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) lt!582065))))

(assert (=> d!141307 (= (arrayContainsKey!0 _keys!1741 lt!582065 #b00000000000000000000000000000000) e!742438)))

(declare-fun b!1301648 () Bool)

(declare-fun e!742439 () Bool)

(assert (=> b!1301648 (= e!742438 e!742439)))

(declare-fun res!864752 () Bool)

(assert (=> b!1301648 (=> (not res!864752) (not e!742439))))

(assert (=> b!1301648 (= res!864752 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(declare-fun b!1301649 () Bool)

(assert (=> b!1301649 (= e!742439 (arrayContainsKey!0 _keys!1741 lt!582065 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141307 (not res!864751)) b!1301648))

(assert (= (and b!1301648 res!864752) b!1301649))

(assert (=> d!141307 m!1192163))

(declare-fun m!1192385 () Bool)

(assert (=> b!1301649 m!1192385))

(assert (=> b!1301512 d!141307))

(declare-fun b!1301662 () Bool)

(declare-fun c!124820 () Bool)

(declare-fun lt!582126 () (_ BitVec 64))

(assert (=> b!1301662 (= c!124820 (= lt!582126 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!742447 () SeekEntryResult!10020)

(declare-fun e!742446 () SeekEntryResult!10020)

(assert (=> b!1301662 (= e!742447 e!742446)))

(declare-fun b!1301663 () Bool)

(declare-fun lt!582124 () SeekEntryResult!10020)

(assert (=> b!1301663 (= e!742446 (MissingZero!10020 (index!42453 lt!582124)))))

(declare-fun b!1301664 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86726 (_ BitVec 32)) SeekEntryResult!10020)

(assert (=> b!1301664 (= e!742446 (seekKeyOrZeroReturnVacant!0 (x!115593 lt!582124) (index!42453 lt!582124) (index!42453 lt!582124) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun d!141309 () Bool)

(declare-fun lt!582125 () SeekEntryResult!10020)

(assert (=> d!141309 (and (or ((_ is Undefined!10020) lt!582125) (not ((_ is Found!10020) lt!582125)) (and (bvsge (index!42452 lt!582125) #b00000000000000000000000000000000) (bvslt (index!42452 lt!582125) (size!42409 _keys!1741)))) (or ((_ is Undefined!10020) lt!582125) ((_ is Found!10020) lt!582125) (not ((_ is MissingZero!10020) lt!582125)) (and (bvsge (index!42451 lt!582125) #b00000000000000000000000000000000) (bvslt (index!42451 lt!582125) (size!42409 _keys!1741)))) (or ((_ is Undefined!10020) lt!582125) ((_ is Found!10020) lt!582125) ((_ is MissingZero!10020) lt!582125) (not ((_ is MissingVacant!10020) lt!582125)) (and (bvsge (index!42454 lt!582125) #b00000000000000000000000000000000) (bvslt (index!42454 lt!582125) (size!42409 _keys!1741)))) (or ((_ is Undefined!10020) lt!582125) (ite ((_ is Found!10020) lt!582125) (= (select (arr!41859 _keys!1741) (index!42452 lt!582125)) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10020) lt!582125) (= (select (arr!41859 _keys!1741) (index!42451 lt!582125)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10020) lt!582125) (= (select (arr!41859 _keys!1741) (index!42454 lt!582125)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!742448 () SeekEntryResult!10020)

(assert (=> d!141309 (= lt!582125 e!742448)))

(declare-fun c!124822 () Bool)

(assert (=> d!141309 (= c!124822 (and ((_ is Intermediate!10020) lt!582124) (undefined!10832 lt!582124)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86726 (_ BitVec 32)) SeekEntryResult!10020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141309 (= lt!582124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141309 (validMask!0 mask!2175)))

(assert (=> d!141309 (= (seekEntryOrOpen!0 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!582125)))

(declare-fun b!1301665 () Bool)

(assert (=> b!1301665 (= e!742448 Undefined!10020)))

(declare-fun b!1301666 () Bool)

(assert (=> b!1301666 (= e!742448 e!742447)))

(assert (=> b!1301666 (= lt!582126 (select (arr!41859 _keys!1741) (index!42453 lt!582124)))))

(declare-fun c!124821 () Bool)

(assert (=> b!1301666 (= c!124821 (= lt!582126 (select (arr!41859 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1301667 () Bool)

(assert (=> b!1301667 (= e!742447 (Found!10020 (index!42453 lt!582124)))))

(assert (= (and d!141309 c!124822) b!1301665))

(assert (= (and d!141309 (not c!124822)) b!1301666))

(assert (= (and b!1301666 c!124821) b!1301667))

(assert (= (and b!1301666 (not c!124821)) b!1301662))

(assert (= (and b!1301662 c!124820) b!1301663))

(assert (= (and b!1301662 (not c!124820)) b!1301664))

(assert (=> b!1301664 m!1192163))

(declare-fun m!1192387 () Bool)

(assert (=> b!1301664 m!1192387))

(assert (=> d!141309 m!1191977))

(declare-fun m!1192389 () Bool)

(assert (=> d!141309 m!1192389))

(declare-fun m!1192391 () Bool)

(assert (=> d!141309 m!1192391))

(declare-fun m!1192393 () Bool)

(assert (=> d!141309 m!1192393))

(declare-fun m!1192395 () Bool)

(assert (=> d!141309 m!1192395))

(assert (=> d!141309 m!1192163))

(declare-fun m!1192397 () Bool)

(assert (=> d!141309 m!1192397))

(assert (=> d!141309 m!1192163))

(assert (=> d!141309 m!1192395))

(declare-fun m!1192399 () Bool)

(assert (=> b!1301666 m!1192399))

(assert (=> b!1301512 d!141309))

(declare-fun d!141311 () Bool)

(assert (=> d!141311 (= (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205)) (not (isEmpty!1054 (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))))

(declare-fun bs!37063 () Bool)

(assert (= bs!37063 d!141311))

(assert (=> bs!37063 m!1192175))

(declare-fun m!1192401 () Bool)

(assert (=> bs!37063 m!1192401))

(assert (=> b!1301452 d!141311))

(declare-fun c!124823 () Bool)

(declare-fun d!141313 () Bool)

(assert (=> d!141313 (= c!124823 (and ((_ is Cons!29704) (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) (= (_1!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) k0!1205)))))

(declare-fun e!742449 () Option!752)

(assert (=> d!141313 (= (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205) e!742449)))

(declare-fun e!742450 () Option!752)

(declare-fun b!1301670 () Bool)

(assert (=> b!1301670 (= e!742450 (getValueByKey!700 (t!43286 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) k0!1205))))

(declare-fun b!1301669 () Bool)

(assert (=> b!1301669 (= e!742449 e!742450)))

(declare-fun c!124824 () Bool)

(assert (=> b!1301669 (= c!124824 (and ((_ is Cons!29704) (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) (not (= (_1!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) k0!1205))))))

(declare-fun b!1301671 () Bool)

(assert (=> b!1301671 (= e!742450 None!750)))

(declare-fun b!1301668 () Bool)

(assert (=> b!1301668 (= e!742449 (Some!751 (_2!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))))

(assert (= (and d!141313 c!124823) b!1301668))

(assert (= (and d!141313 (not c!124823)) b!1301669))

(assert (= (and b!1301669 c!124824) b!1301670))

(assert (= (and b!1301669 (not c!124824)) b!1301671))

(declare-fun m!1192403 () Bool)

(assert (=> b!1301670 m!1192403))

(assert (=> b!1301452 d!141313))

(declare-fun c!124825 () Bool)

(declare-fun d!141315 () Bool)

(assert (=> d!141315 (= c!124825 (and ((_ is Cons!29704) (toList!10134 lt!582030)) (= (_1!11301 (h!30913 (toList!10134 lt!582030))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(declare-fun e!742451 () Option!752)

(assert (=> d!141315 (= (getValueByKey!700 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) e!742451)))

(declare-fun e!742452 () Option!752)

(declare-fun b!1301674 () Bool)

(assert (=> b!1301674 (= e!742452 (getValueByKey!700 (t!43286 (toList!10134 lt!582030)) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun b!1301673 () Bool)

(assert (=> b!1301673 (= e!742451 e!742452)))

(declare-fun c!124826 () Bool)

(assert (=> b!1301673 (= c!124826 (and ((_ is Cons!29704) (toList!10134 lt!582030)) (not (= (_1!11301 (h!30913 (toList!10134 lt!582030))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))))

(declare-fun b!1301675 () Bool)

(assert (=> b!1301675 (= e!742452 None!750)))

(declare-fun b!1301672 () Bool)

(assert (=> b!1301672 (= e!742451 (Some!751 (_2!11301 (h!30913 (toList!10134 lt!582030)))))))

(assert (= (and d!141315 c!124825) b!1301672))

(assert (= (and d!141315 (not c!124825)) b!1301673))

(assert (= (and b!1301673 c!124826) b!1301674))

(assert (= (and b!1301673 (not c!124826)) b!1301675))

(declare-fun m!1192405 () Bool)

(assert (=> b!1301674 m!1192405))

(assert (=> b!1301453 d!141315))

(declare-fun d!141317 () Bool)

(assert (=> d!141317 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(declare-fun lt!582127 () Unit!43067)

(assert (=> d!141317 (= lt!582127 (choose!1906 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(declare-fun e!742453 () Bool)

(assert (=> d!141317 e!742453))

(declare-fun res!864753 () Bool)

(assert (=> d!141317 (=> (not res!864753) (not e!742453))))

(assert (=> d!141317 (= res!864753 (isStrictlySorted!870 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(assert (=> d!141317 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205) lt!582127)))

(declare-fun b!1301676 () Bool)

(assert (=> b!1301676 (= e!742453 (containsKey!722 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205))))

(assert (= (and d!141317 res!864753) b!1301676))

(assert (=> d!141317 m!1192175))

(assert (=> d!141317 m!1192175))

(assert (=> d!141317 m!1192177))

(declare-fun m!1192407 () Bool)

(assert (=> d!141317 m!1192407))

(declare-fun m!1192409 () Bool)

(assert (=> d!141317 m!1192409))

(assert (=> b!1301676 m!1192171))

(assert (=> b!1301450 d!141317))

(assert (=> b!1301450 d!141311))

(assert (=> b!1301450 d!141313))

(declare-fun d!141319 () Bool)

(assert (=> d!141319 (= (apply!1017 lt!582024 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21137 (getValueByKey!700 (toList!10134 lt!582024) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37064 () Bool)

(assert (= bs!37064 d!141319))

(assert (=> bs!37064 m!1192327))

(assert (=> bs!37064 m!1192327))

(declare-fun m!1192411 () Bool)

(assert (=> bs!37064 m!1192411))

(assert (=> b!1301424 d!141319))

(declare-fun d!141321 () Bool)

(assert (=> d!141321 (= (isDefined!507 (getValueByKey!700 (toList!10134 lt!581864) k0!1205)) (not (isEmpty!1054 (getValueByKey!700 (toList!10134 lt!581864) k0!1205))))))

(declare-fun bs!37065 () Bool)

(assert (= bs!37065 d!141321))

(assert (=> bs!37065 m!1192083))

(declare-fun m!1192413 () Bool)

(assert (=> bs!37065 m!1192413))

(assert (=> b!1301365 d!141321))

(declare-fun d!141323 () Bool)

(declare-fun c!124827 () Bool)

(assert (=> d!141323 (= c!124827 (and ((_ is Cons!29704) (toList!10134 lt!581864)) (= (_1!11301 (h!30913 (toList!10134 lt!581864))) k0!1205)))))

(declare-fun e!742454 () Option!752)

(assert (=> d!141323 (= (getValueByKey!700 (toList!10134 lt!581864) k0!1205) e!742454)))

(declare-fun b!1301679 () Bool)

(declare-fun e!742455 () Option!752)

(assert (=> b!1301679 (= e!742455 (getValueByKey!700 (t!43286 (toList!10134 lt!581864)) k0!1205))))

(declare-fun b!1301678 () Bool)

(assert (=> b!1301678 (= e!742454 e!742455)))

(declare-fun c!124828 () Bool)

(assert (=> b!1301678 (= c!124828 (and ((_ is Cons!29704) (toList!10134 lt!581864)) (not (= (_1!11301 (h!30913 (toList!10134 lt!581864))) k0!1205))))))

(declare-fun b!1301680 () Bool)

(assert (=> b!1301680 (= e!742455 None!750)))

(declare-fun b!1301677 () Bool)

(assert (=> b!1301677 (= e!742454 (Some!751 (_2!11301 (h!30913 (toList!10134 lt!581864)))))))

(assert (= (and d!141323 c!124827) b!1301677))

(assert (= (and d!141323 (not c!124827)) b!1301678))

(assert (= (and b!1301678 c!124828) b!1301679))

(assert (= (and b!1301678 (not c!124828)) b!1301680))

(declare-fun m!1192415 () Bool)

(assert (=> b!1301679 m!1192415))

(assert (=> b!1301365 d!141323))

(declare-fun d!141325 () Bool)

(declare-fun e!742456 () Bool)

(assert (=> d!141325 e!742456))

(declare-fun res!864755 () Bool)

(assert (=> d!141325 (=> (not res!864755) (not e!742456))))

(declare-fun lt!582129 () ListLongMap!20237)

(assert (=> d!141325 (= res!864755 (contains!8260 lt!582129 (_1!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!582128 () List!29708)

(assert (=> d!141325 (= lt!582129 (ListLongMap!20238 lt!582128))))

(declare-fun lt!582130 () Unit!43067)

(declare-fun lt!582131 () Unit!43067)

(assert (=> d!141325 (= lt!582130 lt!582131)))

(assert (=> d!141325 (= (getValueByKey!700 lt!582128 (_1!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141325 (= lt!582131 (lemmaContainsTupThenGetReturnValue!346 lt!582128 (_1!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141325 (= lt!582128 (insertStrictlySorted!475 (toList!10134 call!63950) (_1!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141325 (= (+!4461 call!63950 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!582129)))

(declare-fun b!1301681 () Bool)

(declare-fun res!864754 () Bool)

(assert (=> b!1301681 (=> (not res!864754) (not e!742456))))

(assert (=> b!1301681 (= res!864754 (= (getValueByKey!700 (toList!10134 lt!582129) (_1!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1301682 () Bool)

(assert (=> b!1301682 (= e!742456 (contains!8261 (toList!10134 lt!582129) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141325 res!864755) b!1301681))

(assert (= (and b!1301681 res!864754) b!1301682))

(declare-fun m!1192417 () Bool)

(assert (=> d!141325 m!1192417))

(declare-fun m!1192419 () Bool)

(assert (=> d!141325 m!1192419))

(declare-fun m!1192421 () Bool)

(assert (=> d!141325 m!1192421))

(declare-fun m!1192423 () Bool)

(assert (=> d!141325 m!1192423))

(declare-fun m!1192425 () Bool)

(assert (=> b!1301681 m!1192425))

(declare-fun m!1192427 () Bool)

(assert (=> b!1301682 m!1192427))

(assert (=> b!1301430 d!141325))

(assert (=> b!1301449 d!141245))

(declare-fun d!141327 () Bool)

(declare-fun e!742457 () Bool)

(assert (=> d!141327 e!742457))

(declare-fun res!864756 () Bool)

(assert (=> d!141327 (=> res!864756 e!742457)))

(declare-fun lt!582134 () Bool)

(assert (=> d!141327 (= res!864756 (not lt!582134))))

(declare-fun lt!582133 () Bool)

(assert (=> d!141327 (= lt!582134 lt!582133)))

(declare-fun lt!582132 () Unit!43067)

(declare-fun e!742458 () Unit!43067)

(assert (=> d!141327 (= lt!582132 e!742458)))

(declare-fun c!124829 () Bool)

(assert (=> d!141327 (= c!124829 lt!582133)))

(assert (=> d!141327 (= lt!582133 (containsKey!722 (toList!10134 lt!582024) (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> d!141327 (= (contains!8260 lt!582024 (select (arr!41859 _keys!1741) from!2144)) lt!582134)))

(declare-fun b!1301683 () Bool)

(declare-fun lt!582135 () Unit!43067)

(assert (=> b!1301683 (= e!742458 lt!582135)))

(assert (=> b!1301683 (= lt!582135 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582024) (select (arr!41859 _keys!1741) from!2144)))))

(assert (=> b!1301683 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) (select (arr!41859 _keys!1741) from!2144)))))

(declare-fun b!1301684 () Bool)

(declare-fun Unit!43085 () Unit!43067)

(assert (=> b!1301684 (= e!742458 Unit!43085)))

(declare-fun b!1301685 () Bool)

(assert (=> b!1301685 (= e!742457 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582024) (select (arr!41859 _keys!1741) from!2144))))))

(assert (= (and d!141327 c!124829) b!1301683))

(assert (= (and d!141327 (not c!124829)) b!1301684))

(assert (= (and d!141327 (not res!864756)) b!1301685))

(assert (=> d!141327 m!1191961))

(declare-fun m!1192429 () Bool)

(assert (=> d!141327 m!1192429))

(assert (=> b!1301683 m!1191961))

(declare-fun m!1192431 () Bool)

(assert (=> b!1301683 m!1192431))

(assert (=> b!1301683 m!1191961))

(assert (=> b!1301683 m!1192245))

(assert (=> b!1301683 m!1192245))

(declare-fun m!1192433 () Bool)

(assert (=> b!1301683 m!1192433))

(assert (=> b!1301685 m!1191961))

(assert (=> b!1301685 m!1192245))

(assert (=> b!1301685 m!1192245))

(assert (=> b!1301685 m!1192433))

(assert (=> b!1301429 d!141327))

(assert (=> b!1301448 d!141245))

(declare-fun d!141329 () Bool)

(declare-fun e!742459 () Bool)

(assert (=> d!141329 e!742459))

(declare-fun res!864757 () Bool)

(assert (=> d!141329 (=> res!864757 e!742459)))

(declare-fun lt!582138 () Bool)

(assert (=> d!141329 (= res!864757 (not lt!582138))))

(declare-fun lt!582137 () Bool)

(assert (=> d!141329 (= lt!582138 lt!582137)))

(declare-fun lt!582136 () Unit!43067)

(declare-fun e!742460 () Unit!43067)

(assert (=> d!141329 (= lt!582136 e!742460)))

(declare-fun c!124830 () Bool)

(assert (=> d!141329 (= c!124830 lt!582137)))

(assert (=> d!141329 (= lt!582137 (containsKey!722 (toList!10134 lt!582053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141329 (= (contains!8260 lt!582053 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582138)))

(declare-fun b!1301686 () Bool)

(declare-fun lt!582139 () Unit!43067)

(assert (=> b!1301686 (= e!742460 lt!582139)))

(assert (=> b!1301686 (= lt!582139 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301686 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301687 () Bool)

(declare-fun Unit!43086 () Unit!43067)

(assert (=> b!1301687 (= e!742460 Unit!43086)))

(declare-fun b!1301688 () Bool)

(assert (=> b!1301688 (= e!742459 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141329 c!124830) b!1301686))

(assert (= (and d!141329 (not c!124830)) b!1301687))

(assert (= (and d!141329 (not res!864757)) b!1301688))

(declare-fun m!1192435 () Bool)

(assert (=> d!141329 m!1192435))

(declare-fun m!1192437 () Bool)

(assert (=> b!1301686 m!1192437))

(declare-fun m!1192439 () Bool)

(assert (=> b!1301686 m!1192439))

(assert (=> b!1301686 m!1192439))

(declare-fun m!1192441 () Bool)

(assert (=> b!1301686 m!1192441))

(assert (=> b!1301688 m!1192439))

(assert (=> b!1301688 m!1192439))

(assert (=> b!1301688 m!1192441))

(assert (=> b!1301499 d!141329))

(declare-fun b!1301689 () Bool)

(declare-fun lt!582146 () Unit!43067)

(declare-fun lt!582142 () Unit!43067)

(assert (=> b!1301689 (= lt!582146 lt!582142)))

(declare-fun lt!582140 () (_ BitVec 64))

(declare-fun lt!582141 () ListLongMap!20237)

(declare-fun lt!582145 () (_ BitVec 64))

(declare-fun lt!582144 () V!51579)

(assert (=> b!1301689 (not (contains!8260 (+!4461 lt!582141 (tuple2!22581 lt!582145 lt!582144)) lt!582140))))

(assert (=> b!1301689 (= lt!582142 (addStillNotContains!459 lt!582141 lt!582145 lt!582144 lt!582140))))

(assert (=> b!1301689 (= lt!582140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1301689 (= lt!582144 (get!21134 (select (arr!41858 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1301689 (= lt!582145 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(declare-fun call!63972 () ListLongMap!20237)

(assert (=> b!1301689 (= lt!582141 call!63972)))

(declare-fun e!742467 () ListLongMap!20237)

(assert (=> b!1301689 (= e!742467 (+!4461 call!63972 (tuple2!22581 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21134 (select (arr!41858 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!141331 () Bool)

(declare-fun e!742461 () Bool)

(assert (=> d!141331 e!742461))

(declare-fun res!864760 () Bool)

(assert (=> d!141331 (=> (not res!864760) (not e!742461))))

(declare-fun lt!582143 () ListLongMap!20237)

(assert (=> d!141331 (= res!864760 (not (contains!8260 lt!582143 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!742463 () ListLongMap!20237)

(assert (=> d!141331 (= lt!582143 e!742463)))

(declare-fun c!124834 () Bool)

(assert (=> d!141331 (= c!124834 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(assert (=> d!141331 (validMask!0 mask!2175)))

(assert (=> d!141331 (= (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!582143)))

(declare-fun b!1301690 () Bool)

(declare-fun e!742462 () Bool)

(declare-fun e!742464 () Bool)

(assert (=> b!1301690 (= e!742462 e!742464)))

(declare-fun c!124832 () Bool)

(assert (=> b!1301690 (= c!124832 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(declare-fun b!1301691 () Bool)

(assert (=> b!1301691 (= e!742464 (= lt!582143 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1301692 () Bool)

(assert (=> b!1301692 (= e!742461 e!742462)))

(declare-fun c!124831 () Bool)

(declare-fun e!742466 () Bool)

(assert (=> b!1301692 (= c!124831 e!742466)))

(declare-fun res!864759 () Bool)

(assert (=> b!1301692 (=> (not res!864759) (not e!742466))))

(assert (=> b!1301692 (= res!864759 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(declare-fun b!1301693 () Bool)

(assert (=> b!1301693 (= e!742466 (validKeyInArray!0 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1301693 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1301694 () Bool)

(assert (=> b!1301694 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(assert (=> b!1301694 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42408 _values!1445)))))

(declare-fun e!742465 () Bool)

(assert (=> b!1301694 (= e!742465 (= (apply!1017 lt!582143 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21134 (select (arr!41858 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1301695 () Bool)

(assert (=> b!1301695 (= e!742463 e!742467)))

(declare-fun c!124833 () Bool)

(assert (=> b!1301695 (= c!124833 (validKeyInArray!0 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1301696 () Bool)

(assert (=> b!1301696 (= e!742462 e!742465)))

(assert (=> b!1301696 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42409 _keys!1741)))))

(declare-fun res!864761 () Bool)

(assert (=> b!1301696 (= res!864761 (contains!8260 lt!582143 (select (arr!41859 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1301696 (=> (not res!864761) (not e!742465))))

(declare-fun b!1301697 () Bool)

(assert (=> b!1301697 (= e!742467 call!63972)))

(declare-fun bm!63969 () Bool)

(assert (=> bm!63969 (= call!63972 (getCurrentListMapNoExtraKeys!6093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1301698 () Bool)

(assert (=> b!1301698 (= e!742464 (isEmpty!1053 lt!582143))))

(declare-fun b!1301699 () Bool)

(declare-fun res!864758 () Bool)

(assert (=> b!1301699 (=> (not res!864758) (not e!742461))))

(assert (=> b!1301699 (= res!864758 (not (contains!8260 lt!582143 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1301700 () Bool)

(assert (=> b!1301700 (= e!742463 (ListLongMap!20238 Nil!29705))))

(assert (= (and d!141331 c!124834) b!1301700))

(assert (= (and d!141331 (not c!124834)) b!1301695))

(assert (= (and b!1301695 c!124833) b!1301689))

(assert (= (and b!1301695 (not c!124833)) b!1301697))

(assert (= (or b!1301689 b!1301697) bm!63969))

(assert (= (and d!141331 res!864760) b!1301699))

(assert (= (and b!1301699 res!864758) b!1301692))

(assert (= (and b!1301692 res!864759) b!1301693))

(assert (= (and b!1301692 c!124831) b!1301696))

(assert (= (and b!1301692 (not c!124831)) b!1301690))

(assert (= (and b!1301696 res!864761) b!1301694))

(assert (= (and b!1301690 c!124832) b!1301691))

(assert (= (and b!1301690 (not c!124832)) b!1301698))

(declare-fun b_lambda!23205 () Bool)

(assert (=> (not b_lambda!23205) (not b!1301689)))

(assert (=> b!1301689 t!43285))

(declare-fun b_and!47347 () Bool)

(assert (= b_and!47345 (and (=> t!43285 result!23773) b_and!47347)))

(declare-fun b_lambda!23207 () Bool)

(assert (=> (not b_lambda!23207) (not b!1301694)))

(assert (=> b!1301694 t!43285))

(declare-fun b_and!47349 () Bool)

(assert (= b_and!47347 (and (=> t!43285 result!23773) b_and!47349)))

(declare-fun m!1192443 () Bool)

(assert (=> b!1301693 m!1192443))

(assert (=> b!1301693 m!1192443))

(declare-fun m!1192445 () Bool)

(assert (=> b!1301693 m!1192445))

(declare-fun m!1192447 () Bool)

(assert (=> b!1301699 m!1192447))

(declare-fun m!1192449 () Bool)

(assert (=> b!1301694 m!1192449))

(assert (=> b!1301694 m!1191989))

(declare-fun m!1192451 () Bool)

(assert (=> b!1301694 m!1192451))

(assert (=> b!1301694 m!1192449))

(assert (=> b!1301694 m!1192443))

(declare-fun m!1192453 () Bool)

(assert (=> b!1301694 m!1192453))

(assert (=> b!1301694 m!1192443))

(assert (=> b!1301694 m!1191989))

(assert (=> b!1301695 m!1192443))

(assert (=> b!1301695 m!1192443))

(assert (=> b!1301695 m!1192445))

(assert (=> b!1301696 m!1192443))

(assert (=> b!1301696 m!1192443))

(declare-fun m!1192455 () Bool)

(assert (=> b!1301696 m!1192455))

(declare-fun m!1192457 () Bool)

(assert (=> d!141331 m!1192457))

(assert (=> d!141331 m!1191977))

(declare-fun m!1192459 () Bool)

(assert (=> b!1301698 m!1192459))

(declare-fun m!1192461 () Bool)

(assert (=> bm!63969 m!1192461))

(assert (=> b!1301691 m!1192461))

(declare-fun m!1192463 () Bool)

(assert (=> b!1301689 m!1192463))

(assert (=> b!1301689 m!1191989))

(declare-fun m!1192465 () Bool)

(assert (=> b!1301689 m!1192465))

(assert (=> b!1301689 m!1192449))

(assert (=> b!1301689 m!1191989))

(assert (=> b!1301689 m!1192451))

(assert (=> b!1301689 m!1192449))

(declare-fun m!1192467 () Bool)

(assert (=> b!1301689 m!1192467))

(declare-fun m!1192469 () Bool)

(assert (=> b!1301689 m!1192469))

(assert (=> b!1301689 m!1192467))

(assert (=> b!1301689 m!1192443))

(assert (=> bm!63954 d!141331))

(declare-fun d!141333 () Bool)

(assert (=> d!141333 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581864) k0!1205))))

(declare-fun lt!582147 () Unit!43067)

(assert (=> d!141333 (= lt!582147 (choose!1906 (toList!10134 lt!581864) k0!1205))))

(declare-fun e!742468 () Bool)

(assert (=> d!141333 e!742468))

(declare-fun res!864762 () Bool)

(assert (=> d!141333 (=> (not res!864762) (not e!742468))))

(assert (=> d!141333 (= res!864762 (isStrictlySorted!870 (toList!10134 lt!581864)))))

(assert (=> d!141333 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!581864) k0!1205) lt!582147)))

(declare-fun b!1301701 () Bool)

(assert (=> b!1301701 (= e!742468 (containsKey!722 (toList!10134 lt!581864) k0!1205))))

(assert (= (and d!141333 res!864762) b!1301701))

(assert (=> d!141333 m!1192083))

(assert (=> d!141333 m!1192083))

(assert (=> d!141333 m!1192085))

(declare-fun m!1192471 () Bool)

(assert (=> d!141333 m!1192471))

(declare-fun m!1192473 () Bool)

(assert (=> d!141333 m!1192473))

(assert (=> b!1301701 m!1192079))

(assert (=> b!1301363 d!141333))

(assert (=> b!1301363 d!141321))

(assert (=> b!1301363 d!141323))

(declare-fun d!141335 () Bool)

(declare-fun e!742469 () Bool)

(assert (=> d!141335 e!742469))

(declare-fun res!864763 () Bool)

(assert (=> d!141335 (=> res!864763 e!742469)))

(declare-fun lt!582150 () Bool)

(assert (=> d!141335 (= res!864763 (not lt!582150))))

(declare-fun lt!582149 () Bool)

(assert (=> d!141335 (= lt!582150 lt!582149)))

(declare-fun lt!582148 () Unit!43067)

(declare-fun e!742470 () Unit!43067)

(assert (=> d!141335 (= lt!582148 e!742470)))

(declare-fun c!124835 () Bool)

(assert (=> d!141335 (= c!124835 lt!582149)))

(assert (=> d!141335 (= lt!582149 (containsKey!722 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(assert (=> d!141335 (= (contains!8260 lt!582030 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) lt!582150)))

(declare-fun b!1301702 () Bool)

(declare-fun lt!582151 () Unit!43067)

(assert (=> b!1301702 (= e!742470 lt!582151)))

(assert (=> b!1301702 (= lt!582151 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(assert (=> b!1301702 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun b!1301703 () Bool)

(declare-fun Unit!43087 () Unit!43067)

(assert (=> b!1301703 (= e!742470 Unit!43087)))

(declare-fun b!1301704 () Bool)

(assert (=> b!1301704 (= e!742469 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582030) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(assert (= (and d!141335 c!124835) b!1301702))

(assert (= (and d!141335 (not c!124835)) b!1301703))

(assert (= (and d!141335 (not res!864763)) b!1301704))

(declare-fun m!1192475 () Bool)

(assert (=> d!141335 m!1192475))

(declare-fun m!1192477 () Bool)

(assert (=> b!1301702 m!1192477))

(assert (=> b!1301702 m!1192187))

(assert (=> b!1301702 m!1192187))

(declare-fun m!1192479 () Bool)

(assert (=> b!1301702 m!1192479))

(assert (=> b!1301704 m!1192187))

(assert (=> b!1301704 m!1192187))

(assert (=> b!1301704 m!1192479))

(assert (=> d!141221 d!141335))

(declare-fun d!141337 () Bool)

(declare-fun c!124836 () Bool)

(assert (=> d!141337 (= c!124836 (and ((_ is Cons!29704) lt!582029) (= (_1!11301 (h!30913 lt!582029)) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(declare-fun e!742471 () Option!752)

(assert (=> d!141337 (= (getValueByKey!700 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) e!742471)))

(declare-fun b!1301707 () Bool)

(declare-fun e!742472 () Option!752)

(assert (=> b!1301707 (= e!742472 (getValueByKey!700 (t!43286 lt!582029) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun b!1301706 () Bool)

(assert (=> b!1301706 (= e!742471 e!742472)))

(declare-fun c!124837 () Bool)

(assert (=> b!1301706 (= c!124837 (and ((_ is Cons!29704) lt!582029) (not (= (_1!11301 (h!30913 lt!582029)) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))))

(declare-fun b!1301708 () Bool)

(assert (=> b!1301708 (= e!742472 None!750)))

(declare-fun b!1301705 () Bool)

(assert (=> b!1301705 (= e!742471 (Some!751 (_2!11301 (h!30913 lt!582029))))))

(assert (= (and d!141337 c!124836) b!1301705))

(assert (= (and d!141337 (not c!124836)) b!1301706))

(assert (= (and b!1301706 c!124837) b!1301707))

(assert (= (and b!1301706 (not c!124837)) b!1301708))

(declare-fun m!1192481 () Bool)

(assert (=> b!1301707 m!1192481))

(assert (=> d!141221 d!141337))

(declare-fun d!141339 () Bool)

(assert (=> d!141339 (= (getValueByKey!700 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) (Some!751 (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun lt!582152 () Unit!43067)

(assert (=> d!141339 (= lt!582152 (choose!1907 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun e!742473 () Bool)

(assert (=> d!141339 e!742473))

(declare-fun res!864764 () Bool)

(assert (=> d!141339 (=> (not res!864764) (not e!742473))))

(assert (=> d!141339 (= res!864764 (isStrictlySorted!870 lt!582029))))

(assert (=> d!141339 (= (lemmaContainsTupThenGetReturnValue!346 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) lt!582152)))

(declare-fun b!1301709 () Bool)

(declare-fun res!864765 () Bool)

(assert (=> b!1301709 (=> (not res!864765) (not e!742473))))

(assert (=> b!1301709 (= res!864765 (containsKey!722 lt!582029 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun b!1301710 () Bool)

(assert (=> b!1301710 (= e!742473 (contains!8261 lt!582029 (tuple2!22581 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(assert (= (and d!141339 res!864764) b!1301709))

(assert (= (and b!1301709 res!864765) b!1301710))

(assert (=> d!141339 m!1192181))

(declare-fun m!1192483 () Bool)

(assert (=> d!141339 m!1192483))

(declare-fun m!1192485 () Bool)

(assert (=> d!141339 m!1192485))

(declare-fun m!1192487 () Bool)

(assert (=> b!1301709 m!1192487))

(declare-fun m!1192489 () Bool)

(assert (=> b!1301710 m!1192489))

(assert (=> d!141221 d!141339))

(declare-fun call!63975 () List!29708)

(declare-fun c!124839 () Bool)

(declare-fun bm!63970 () Bool)

(declare-fun e!742475 () List!29708)

(assert (=> bm!63970 (= call!63975 ($colon$colon!667 e!742475 (ite c!124839 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705))) (tuple2!22581 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))))

(declare-fun c!124840 () Bool)

(assert (=> bm!63970 (= c!124840 c!124839)))

(declare-fun lt!582153 () List!29708)

(declare-fun b!1301711 () Bool)

(declare-fun e!742476 () Bool)

(assert (=> b!1301711 (= e!742476 (contains!8261 lt!582153 (tuple2!22581 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(declare-fun b!1301712 () Bool)

(assert (=> b!1301712 (= e!742475 (insertStrictlySorted!475 (t!43286 (toList!10134 (ListLongMap!20238 Nil!29705))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun c!124841 () Bool)

(declare-fun b!1301713 () Bool)

(assert (=> b!1301713 (= c!124841 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (bvsgt (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(declare-fun e!742478 () List!29708)

(declare-fun e!742477 () List!29708)

(assert (=> b!1301713 (= e!742478 e!742477)))

(declare-fun b!1301714 () Bool)

(declare-fun call!63973 () List!29708)

(assert (=> b!1301714 (= e!742478 call!63973)))

(declare-fun b!1301715 () Bool)

(declare-fun c!124838 () Bool)

(assert (=> b!1301715 (= e!742475 (ite c!124838 (t!43286 (toList!10134 (ListLongMap!20238 Nil!29705))) (ite c!124841 (Cons!29704 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705))) (t!43286 (toList!10134 (ListLongMap!20238 Nil!29705)))) Nil!29705)))))

(declare-fun bm!63972 () Bool)

(assert (=> bm!63972 (= call!63973 call!63975)))

(declare-fun b!1301716 () Bool)

(declare-fun call!63974 () List!29708)

(assert (=> b!1301716 (= e!742477 call!63974)))

(declare-fun b!1301717 () Bool)

(assert (=> b!1301717 (= e!742477 call!63974)))

(declare-fun b!1301718 () Bool)

(declare-fun res!864766 () Bool)

(assert (=> b!1301718 (=> (not res!864766) (not e!742476))))

(assert (=> b!1301718 (= res!864766 (containsKey!722 lt!582153 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))))

(declare-fun bm!63971 () Bool)

(assert (=> bm!63971 (= call!63974 call!63973)))

(declare-fun d!141341 () Bool)

(assert (=> d!141341 e!742476))

(declare-fun res!864767 () Bool)

(assert (=> d!141341 (=> (not res!864767) (not e!742476))))

(assert (=> d!141341 (= res!864767 (isStrictlySorted!870 lt!582153))))

(declare-fun e!742474 () List!29708)

(assert (=> d!141341 (= lt!582153 e!742474)))

(assert (=> d!141341 (= c!124839 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (bvslt (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(assert (=> d!141341 (isStrictlySorted!870 (toList!10134 (ListLongMap!20238 Nil!29705)))))

(assert (=> d!141341 (= (insertStrictlySorted!475 (toList!10134 (ListLongMap!20238 Nil!29705)) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) lt!582153)))

(declare-fun b!1301719 () Bool)

(assert (=> b!1301719 (= e!742474 call!63975)))

(declare-fun b!1301720 () Bool)

(assert (=> b!1301720 (= e!742474 e!742478)))

(assert (=> b!1301720 (= c!124838 (and ((_ is Cons!29704) (toList!10134 (ListLongMap!20238 Nil!29705))) (= (_1!11301 (h!30913 (toList!10134 (ListLongMap!20238 Nil!29705)))) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))))))

(assert (= (and d!141341 c!124839) b!1301719))

(assert (= (and d!141341 (not c!124839)) b!1301720))

(assert (= (and b!1301720 c!124838) b!1301714))

(assert (= (and b!1301720 (not c!124838)) b!1301713))

(assert (= (and b!1301713 c!124841) b!1301716))

(assert (= (and b!1301713 (not c!124841)) b!1301717))

(assert (= (or b!1301716 b!1301717) bm!63971))

(assert (= (or b!1301714 bm!63971) bm!63972))

(assert (= (or b!1301719 bm!63972) bm!63970))

(assert (= (and bm!63970 c!124840) b!1301712))

(assert (= (and bm!63970 (not c!124840)) b!1301715))

(assert (= (and d!141341 res!864767) b!1301718))

(assert (= (and b!1301718 res!864766) b!1301711))

(declare-fun m!1192491 () Bool)

(assert (=> b!1301711 m!1192491))

(declare-fun m!1192493 () Bool)

(assert (=> bm!63970 m!1192493))

(declare-fun m!1192495 () Bool)

(assert (=> d!141341 m!1192495))

(assert (=> d!141341 m!1192273))

(declare-fun m!1192497 () Bool)

(assert (=> b!1301712 m!1192497))

(declare-fun m!1192499 () Bool)

(assert (=> b!1301718 m!1192499))

(assert (=> d!141221 d!141341))

(declare-fun d!141343 () Bool)

(declare-fun res!864768 () Bool)

(declare-fun e!742479 () Bool)

(assert (=> d!141343 (=> res!864768 e!742479)))

(assert (=> d!141343 (= res!864768 (and ((_ is Cons!29704) (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) (= (_1!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) k0!1205)))))

(assert (=> d!141343 (= (containsKey!722 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))) k0!1205) e!742479)))

(declare-fun b!1301721 () Bool)

(declare-fun e!742480 () Bool)

(assert (=> b!1301721 (= e!742479 e!742480)))

(declare-fun res!864769 () Bool)

(assert (=> b!1301721 (=> (not res!864769) (not e!742480))))

(assert (=> b!1301721 (= res!864769 (and (or (not ((_ is Cons!29704) (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) (bvsle (_1!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) k0!1205)) ((_ is Cons!29704) (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) (bvslt (_1!11301 (h!30913 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875))))) k0!1205)))))

(declare-fun b!1301722 () Bool)

(assert (=> b!1301722 (= e!742480 (containsKey!722 (t!43286 (toList!10134 (+!4461 (ListLongMap!20238 Nil!29705) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) lt!581875)))) k0!1205))))

(assert (= (and d!141343 (not res!864768)) b!1301721))

(assert (= (and b!1301721 res!864769) b!1301722))

(declare-fun m!1192501 () Bool)

(assert (=> b!1301722 m!1192501))

(assert (=> d!141219 d!141343))

(declare-fun d!141345 () Bool)

(declare-fun e!742481 () Bool)

(assert (=> d!141345 e!742481))

(declare-fun res!864771 () Bool)

(assert (=> d!141345 (=> (not res!864771) (not e!742481))))

(declare-fun lt!582155 () ListLongMap!20237)

(assert (=> d!141345 (= res!864771 (contains!8260 lt!582155 (_1!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!582154 () List!29708)

(assert (=> d!141345 (= lt!582155 (ListLongMap!20238 lt!582154))))

(declare-fun lt!582156 () Unit!43067)

(declare-fun lt!582157 () Unit!43067)

(assert (=> d!141345 (= lt!582156 lt!582157)))

(assert (=> d!141345 (= (getValueByKey!700 lt!582154 (_1!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!751 (_2!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141345 (= lt!582157 (lemmaContainsTupThenGetReturnValue!346 lt!582154 (_1!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141345 (= lt!582154 (insertStrictlySorted!475 (toList!10134 (ite c!124752 call!63949 (ite c!124753 call!63951 call!63946))) (_1!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141345 (= (+!4461 (ite c!124752 call!63949 (ite c!124753 call!63951 call!63946)) (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!582155)))

(declare-fun b!1301723 () Bool)

(declare-fun res!864770 () Bool)

(assert (=> b!1301723 (=> (not res!864770) (not e!742481))))

(assert (=> b!1301723 (= res!864770 (= (getValueByKey!700 (toList!10134 lt!582155) (_1!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!751 (_2!11301 (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1301724 () Bool)

(assert (=> b!1301724 (= e!742481 (contains!8261 (toList!10134 lt!582155) (ite (or c!124752 c!124753) (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141345 res!864771) b!1301723))

(assert (= (and b!1301723 res!864770) b!1301724))

(declare-fun m!1192503 () Bool)

(assert (=> d!141345 m!1192503))

(declare-fun m!1192505 () Bool)

(assert (=> d!141345 m!1192505))

(declare-fun m!1192507 () Bool)

(assert (=> d!141345 m!1192507))

(declare-fun m!1192509 () Bool)

(assert (=> d!141345 m!1192509))

(declare-fun m!1192511 () Bool)

(assert (=> b!1301723 m!1192511))

(declare-fun m!1192513 () Bool)

(assert (=> b!1301724 m!1192513))

(assert (=> bm!63948 d!141345))

(declare-fun d!141347 () Bool)

(assert (=> d!141347 (= (get!21136 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301464 d!141347))

(assert (=> b!1301421 d!141195))

(assert (=> b!1301491 d!141331))

(declare-fun d!141349 () Bool)

(declare-fun e!742482 () Bool)

(assert (=> d!141349 e!742482))

(declare-fun res!864772 () Bool)

(assert (=> d!141349 (=> res!864772 e!742482)))

(declare-fun lt!582160 () Bool)

(assert (=> d!141349 (= res!864772 (not lt!582160))))

(declare-fun lt!582159 () Bool)

(assert (=> d!141349 (= lt!582160 lt!582159)))

(declare-fun lt!582158 () Unit!43067)

(declare-fun e!742483 () Unit!43067)

(assert (=> d!141349 (= lt!582158 e!742483)))

(declare-fun c!124842 () Bool)

(assert (=> d!141349 (= c!124842 lt!582159)))

(assert (=> d!141349 (= lt!582159 (containsKey!722 (toList!10134 lt!582053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141349 (= (contains!8260 lt!582053 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582160)))

(declare-fun b!1301725 () Bool)

(declare-fun lt!582161 () Unit!43067)

(assert (=> b!1301725 (= e!742483 lt!582161)))

(assert (=> b!1301725 (= lt!582161 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!582053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1301725 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1301726 () Bool)

(declare-fun Unit!43088 () Unit!43067)

(assert (=> b!1301726 (= e!742483 Unit!43088)))

(declare-fun b!1301727 () Bool)

(assert (=> b!1301727 (= e!742482 (isDefined!507 (getValueByKey!700 (toList!10134 lt!582053) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141349 c!124842) b!1301725))

(assert (= (and d!141349 (not c!124842)) b!1301726))

(assert (= (and d!141349 (not res!864772)) b!1301727))

(declare-fun m!1192515 () Bool)

(assert (=> d!141349 m!1192515))

(declare-fun m!1192517 () Bool)

(assert (=> b!1301725 m!1192517))

(declare-fun m!1192519 () Bool)

(assert (=> b!1301725 m!1192519))

(assert (=> b!1301725 m!1192519))

(declare-fun m!1192521 () Bool)

(assert (=> b!1301725 m!1192521))

(assert (=> b!1301727 m!1192519))

(assert (=> b!1301727 m!1192519))

(assert (=> b!1301727 m!1192521))

(assert (=> d!141227 d!141349))

(assert (=> d!141227 d!141213))

(declare-fun d!141351 () Bool)

(declare-fun e!742484 () Bool)

(assert (=> d!141351 e!742484))

(declare-fun res!864774 () Bool)

(assert (=> d!141351 (=> (not res!864774) (not e!742484))))

(declare-fun lt!582163 () ListLongMap!20237)

(assert (=> d!141351 (= res!864774 (contains!8260 lt!582163 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!582162 () List!29708)

(assert (=> d!141351 (= lt!582163 (ListLongMap!20238 lt!582162))))

(declare-fun lt!582164 () Unit!43067)

(declare-fun lt!582165 () Unit!43067)

(assert (=> d!141351 (= lt!582164 lt!582165)))

(assert (=> d!141351 (= (getValueByKey!700 lt!582162 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!751 (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141351 (= lt!582165 (lemmaContainsTupThenGetReturnValue!346 lt!582162 (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141351 (= lt!582162 (insertStrictlySorted!475 (toList!10134 call!63957) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141351 (= (+!4461 call!63957 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!582163)))

(declare-fun b!1301728 () Bool)

(declare-fun res!864773 () Bool)

(assert (=> b!1301728 (=> (not res!864773) (not e!742484))))

(assert (=> b!1301728 (= res!864773 (= (getValueByKey!700 (toList!10134 lt!582163) (_1!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!751 (_2!11301 (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1301729 () Bool)

(assert (=> b!1301729 (= e!742484 (contains!8261 (toList!10134 lt!582163) (tuple2!22581 (select (arr!41859 _keys!1741) from!2144) (get!21134 (select (arr!41858 _values!1445) from!2144) (dynLambda!3421 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141351 res!864774) b!1301728))

(assert (= (and b!1301728 res!864773) b!1301729))

(declare-fun m!1192523 () Bool)

(assert (=> d!141351 m!1192523))

(declare-fun m!1192525 () Bool)

(assert (=> d!141351 m!1192525))

(declare-fun m!1192527 () Bool)

(assert (=> d!141351 m!1192527))

(declare-fun m!1192529 () Bool)

(assert (=> d!141351 m!1192529))

(declare-fun m!1192531 () Bool)

(assert (=> b!1301728 m!1192531))

(declare-fun m!1192533 () Bool)

(assert (=> b!1301729 m!1192533))

(assert (=> b!1301489 d!141351))

(declare-fun d!141353 () Bool)

(declare-fun e!742485 () Bool)

(assert (=> d!141353 e!742485))

(declare-fun res!864775 () Bool)

(assert (=> d!141353 (=> res!864775 e!742485)))

(declare-fun lt!582168 () Bool)

(assert (=> d!141353 (= res!864775 (not lt!582168))))

(declare-fun lt!582167 () Bool)

(assert (=> d!141353 (= lt!582168 lt!582167)))

(declare-fun lt!582166 () Unit!43067)

(declare-fun e!742486 () Unit!43067)

(assert (=> d!141353 (= lt!582166 e!742486)))

(declare-fun c!124843 () Bool)

(assert (=> d!141353 (= c!124843 lt!582167)))

(assert (=> d!141353 (= lt!582167 (containsKey!722 (toList!10134 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054))) lt!582050))))

(assert (=> d!141353 (= (contains!8260 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054)) lt!582050) lt!582168)))

(declare-fun b!1301730 () Bool)

(declare-fun lt!582169 () Unit!43067)

(assert (=> b!1301730 (= e!742486 lt!582169)))

(assert (=> b!1301730 (= lt!582169 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054))) lt!582050))))

(assert (=> b!1301730 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054))) lt!582050))))

(declare-fun b!1301731 () Bool)

(declare-fun Unit!43089 () Unit!43067)

(assert (=> b!1301731 (= e!742486 Unit!43089)))

(declare-fun b!1301732 () Bool)

(assert (=> b!1301732 (= e!742485 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054))) lt!582050)))))

(assert (= (and d!141353 c!124843) b!1301730))

(assert (= (and d!141353 (not c!124843)) b!1301731))

(assert (= (and d!141353 (not res!864775)) b!1301732))

(declare-fun m!1192535 () Bool)

(assert (=> d!141353 m!1192535))

(declare-fun m!1192537 () Bool)

(assert (=> b!1301730 m!1192537))

(declare-fun m!1192539 () Bool)

(assert (=> b!1301730 m!1192539))

(assert (=> b!1301730 m!1192539))

(declare-fun m!1192541 () Bool)

(assert (=> b!1301730 m!1192541))

(assert (=> b!1301732 m!1192539))

(assert (=> b!1301732 m!1192539))

(assert (=> b!1301732 m!1192541))

(assert (=> b!1301489 d!141353))

(assert (=> b!1301489 d!141225))

(declare-fun d!141355 () Bool)

(assert (=> d!141355 (not (contains!8260 (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054)) lt!582050))))

(declare-fun lt!582170 () Unit!43067)

(assert (=> d!141355 (= lt!582170 (choose!1905 lt!582051 lt!582055 lt!582054 lt!582050))))

(declare-fun e!742487 () Bool)

(assert (=> d!141355 e!742487))

(declare-fun res!864776 () Bool)

(assert (=> d!141355 (=> (not res!864776) (not e!742487))))

(assert (=> d!141355 (= res!864776 (not (contains!8260 lt!582051 lt!582050)))))

(assert (=> d!141355 (= (addStillNotContains!459 lt!582051 lt!582055 lt!582054 lt!582050) lt!582170)))

(declare-fun b!1301733 () Bool)

(assert (=> b!1301733 (= e!742487 (not (= lt!582055 lt!582050)))))

(assert (= (and d!141355 res!864776) b!1301733))

(assert (=> d!141355 m!1192213))

(assert (=> d!141355 m!1192213))

(assert (=> d!141355 m!1192215))

(declare-fun m!1192543 () Bool)

(assert (=> d!141355 m!1192543))

(declare-fun m!1192545 () Bool)

(assert (=> d!141355 m!1192545))

(assert (=> b!1301489 d!141355))

(declare-fun d!141357 () Bool)

(declare-fun e!742488 () Bool)

(assert (=> d!141357 e!742488))

(declare-fun res!864778 () Bool)

(assert (=> d!141357 (=> (not res!864778) (not e!742488))))

(declare-fun lt!582172 () ListLongMap!20237)

(assert (=> d!141357 (= res!864778 (contains!8260 lt!582172 (_1!11301 (tuple2!22581 lt!582055 lt!582054))))))

(declare-fun lt!582171 () List!29708)

(assert (=> d!141357 (= lt!582172 (ListLongMap!20238 lt!582171))))

(declare-fun lt!582173 () Unit!43067)

(declare-fun lt!582174 () Unit!43067)

(assert (=> d!141357 (= lt!582173 lt!582174)))

(assert (=> d!141357 (= (getValueByKey!700 lt!582171 (_1!11301 (tuple2!22581 lt!582055 lt!582054))) (Some!751 (_2!11301 (tuple2!22581 lt!582055 lt!582054))))))

(assert (=> d!141357 (= lt!582174 (lemmaContainsTupThenGetReturnValue!346 lt!582171 (_1!11301 (tuple2!22581 lt!582055 lt!582054)) (_2!11301 (tuple2!22581 lt!582055 lt!582054))))))

(assert (=> d!141357 (= lt!582171 (insertStrictlySorted!475 (toList!10134 lt!582051) (_1!11301 (tuple2!22581 lt!582055 lt!582054)) (_2!11301 (tuple2!22581 lt!582055 lt!582054))))))

(assert (=> d!141357 (= (+!4461 lt!582051 (tuple2!22581 lt!582055 lt!582054)) lt!582172)))

(declare-fun b!1301734 () Bool)

(declare-fun res!864777 () Bool)

(assert (=> b!1301734 (=> (not res!864777) (not e!742488))))

(assert (=> b!1301734 (= res!864777 (= (getValueByKey!700 (toList!10134 lt!582172) (_1!11301 (tuple2!22581 lt!582055 lt!582054))) (Some!751 (_2!11301 (tuple2!22581 lt!582055 lt!582054)))))))

(declare-fun b!1301735 () Bool)

(assert (=> b!1301735 (= e!742488 (contains!8261 (toList!10134 lt!582172) (tuple2!22581 lt!582055 lt!582054)))))

(assert (= (and d!141357 res!864778) b!1301734))

(assert (= (and b!1301734 res!864777) b!1301735))

(declare-fun m!1192547 () Bool)

(assert (=> d!141357 m!1192547))

(declare-fun m!1192549 () Bool)

(assert (=> d!141357 m!1192549))

(declare-fun m!1192551 () Bool)

(assert (=> d!141357 m!1192551))

(declare-fun m!1192553 () Bool)

(assert (=> d!141357 m!1192553))

(declare-fun m!1192555 () Bool)

(assert (=> b!1301734 m!1192555))

(declare-fun m!1192557 () Bool)

(assert (=> b!1301735 m!1192557))

(assert (=> b!1301489 d!141357))

(declare-fun d!141359 () Bool)

(declare-fun res!864779 () Bool)

(declare-fun e!742489 () Bool)

(assert (=> d!141359 (=> res!864779 e!742489)))

(assert (=> d!141359 (= res!864779 (and ((_ is Cons!29704) (toList!10134 lt!581864)) (= (_1!11301 (h!30913 (toList!10134 lt!581864))) k0!1205)))))

(assert (=> d!141359 (= (containsKey!722 (toList!10134 lt!581864) k0!1205) e!742489)))

(declare-fun b!1301736 () Bool)

(declare-fun e!742490 () Bool)

(assert (=> b!1301736 (= e!742489 e!742490)))

(declare-fun res!864780 () Bool)

(assert (=> b!1301736 (=> (not res!864780) (not e!742490))))

(assert (=> b!1301736 (= res!864780 (and (or (not ((_ is Cons!29704) (toList!10134 lt!581864))) (bvsle (_1!11301 (h!30913 (toList!10134 lt!581864))) k0!1205)) ((_ is Cons!29704) (toList!10134 lt!581864)) (bvslt (_1!11301 (h!30913 (toList!10134 lt!581864))) k0!1205)))))

(declare-fun b!1301737 () Bool)

(assert (=> b!1301737 (= e!742490 (containsKey!722 (t!43286 (toList!10134 lt!581864)) k0!1205))))

(assert (= (and d!141359 (not res!864779)) b!1301736))

(assert (= (and b!1301736 res!864780) b!1301737))

(declare-fun m!1192559 () Bool)

(assert (=> b!1301737 m!1192559))

(assert (=> d!141199 d!141359))

(declare-fun d!141361 () Bool)

(declare-fun e!742491 () Bool)

(assert (=> d!141361 e!742491))

(declare-fun res!864781 () Bool)

(assert (=> d!141361 (=> res!864781 e!742491)))

(declare-fun lt!582177 () Bool)

(assert (=> d!141361 (= res!864781 (not lt!582177))))

(declare-fun lt!582176 () Bool)

(assert (=> d!141361 (= lt!582177 lt!582176)))

(declare-fun lt!582175 () Unit!43067)

(declare-fun e!742492 () Unit!43067)

(assert (=> d!141361 (= lt!582175 e!742492)))

(declare-fun c!124844 () Bool)

(assert (=> d!141361 (= c!124844 lt!582176)))

(assert (=> d!141361 (= lt!582176 (containsKey!722 (toList!10134 lt!581867) k0!1205))))

(assert (=> d!141361 (= (contains!8260 lt!581867 k0!1205) lt!582177)))

(declare-fun b!1301738 () Bool)

(declare-fun lt!582178 () Unit!43067)

(assert (=> b!1301738 (= e!742492 lt!582178)))

(assert (=> b!1301738 (= lt!582178 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 lt!581867) k0!1205))))

(assert (=> b!1301738 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581867) k0!1205))))

(declare-fun b!1301739 () Bool)

(declare-fun Unit!43090 () Unit!43067)

(assert (=> b!1301739 (= e!742492 Unit!43090)))

(declare-fun b!1301740 () Bool)

(assert (=> b!1301740 (= e!742491 (isDefined!507 (getValueByKey!700 (toList!10134 lt!581867) k0!1205)))))

(assert (= (and d!141361 c!124844) b!1301738))

(assert (= (and d!141361 (not c!124844)) b!1301739))

(assert (= (and d!141361 (not res!864781)) b!1301740))

(declare-fun m!1192561 () Bool)

(assert (=> d!141361 m!1192561))

(declare-fun m!1192563 () Bool)

(assert (=> b!1301738 m!1192563))

(declare-fun m!1192565 () Bool)

(assert (=> b!1301738 m!1192565))

(assert (=> b!1301738 m!1192565))

(declare-fun m!1192567 () Bool)

(assert (=> b!1301738 m!1192567))

(assert (=> b!1301740 m!1192565))

(assert (=> b!1301740 m!1192565))

(assert (=> b!1301740 m!1192567))

(assert (=> d!141201 d!141361))

(declare-fun d!141363 () Bool)

(assert (=> d!141363 (contains!8260 lt!581867 k0!1205)))

(assert (=> d!141363 true))

(declare-fun _$21!121 () Unit!43067)

(assert (=> d!141363 (= (choose!1904 k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 lt!581867) _$21!121)))

(declare-fun bs!37066 () Bool)

(assert (= bs!37066 d!141363))

(assert (=> bs!37066 m!1192087))

(assert (=> d!141201 d!141363))

(declare-fun d!141365 () Bool)

(declare-fun e!742493 () Bool)

(assert (=> d!141365 e!742493))

(declare-fun res!864782 () Bool)

(assert (=> d!141365 (=> res!864782 e!742493)))

(declare-fun lt!582181 () Bool)

(assert (=> d!141365 (= res!864782 (not lt!582181))))

(declare-fun lt!582180 () Bool)

(assert (=> d!141365 (= lt!582181 lt!582180)))

(declare-fun lt!582179 () Unit!43067)

(declare-fun e!742494 () Unit!43067)

(assert (=> d!141365 (= lt!582179 e!742494)))

(declare-fun c!124845 () Bool)

(assert (=> d!141365 (= c!124845 lt!582180)))

(assert (=> d!141365 (= lt!582180 (containsKey!722 (toList!10134 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141365 (= (contains!8260 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!582181)))

(declare-fun b!1301741 () Bool)

(declare-fun lt!582182 () Unit!43067)

(assert (=> b!1301741 (= e!742494 lt!582182)))

(assert (=> b!1301741 (= lt!582182 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> b!1301741 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1301742 () Bool)

(declare-fun Unit!43091 () Unit!43067)

(assert (=> b!1301742 (= e!742494 Unit!43091)))

(declare-fun b!1301743 () Bool)

(assert (=> b!1301743 (= e!742493 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!581867 (tuple2!22581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141365 c!124845) b!1301741))

(assert (= (and d!141365 (not c!124845)) b!1301742))

(assert (= (and d!141365 (not res!864782)) b!1301743))

(declare-fun m!1192569 () Bool)

(assert (=> d!141365 m!1192569))

(declare-fun m!1192571 () Bool)

(assert (=> b!1301741 m!1192571))

(declare-fun m!1192573 () Bool)

(assert (=> b!1301741 m!1192573))

(assert (=> b!1301741 m!1192573))

(declare-fun m!1192575 () Bool)

(assert (=> b!1301741 m!1192575))

(assert (=> b!1301743 m!1192573))

(assert (=> b!1301743 m!1192573))

(assert (=> b!1301743 m!1192575))

(assert (=> d!141201 d!141365))

(assert (=> d!141201 d!141197))

(declare-fun d!141367 () Bool)

(declare-fun e!742495 () Bool)

(assert (=> d!141367 e!742495))

(declare-fun res!864784 () Bool)

(assert (=> d!141367 (=> (not res!864784) (not e!742495))))

(declare-fun lt!582184 () ListLongMap!20237)

(assert (=> d!141367 (= res!864784 (contains!8260 lt!582184 (_1!11301 (tuple2!22581 lt!582008 zeroValue!1387))))))

(declare-fun lt!582183 () List!29708)

(assert (=> d!141367 (= lt!582184 (ListLongMap!20238 lt!582183))))

(declare-fun lt!582185 () Unit!43067)

(declare-fun lt!582186 () Unit!43067)

(assert (=> d!141367 (= lt!582185 lt!582186)))

(assert (=> d!141367 (= (getValueByKey!700 lt!582183 (_1!11301 (tuple2!22581 lt!582008 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582008 zeroValue!1387))))))

(assert (=> d!141367 (= lt!582186 (lemmaContainsTupThenGetReturnValue!346 lt!582183 (_1!11301 (tuple2!22581 lt!582008 zeroValue!1387)) (_2!11301 (tuple2!22581 lt!582008 zeroValue!1387))))))

(assert (=> d!141367 (= lt!582183 (insertStrictlySorted!475 (toList!10134 lt!582005) (_1!11301 (tuple2!22581 lt!582008 zeroValue!1387)) (_2!11301 (tuple2!22581 lt!582008 zeroValue!1387))))))

(assert (=> d!141367 (= (+!4461 lt!582005 (tuple2!22581 lt!582008 zeroValue!1387)) lt!582184)))

(declare-fun b!1301744 () Bool)

(declare-fun res!864783 () Bool)

(assert (=> b!1301744 (=> (not res!864783) (not e!742495))))

(assert (=> b!1301744 (= res!864783 (= (getValueByKey!700 (toList!10134 lt!582184) (_1!11301 (tuple2!22581 lt!582008 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582008 zeroValue!1387)))))))

(declare-fun b!1301745 () Bool)

(assert (=> b!1301745 (= e!742495 (contains!8261 (toList!10134 lt!582184) (tuple2!22581 lt!582008 zeroValue!1387)))))

(assert (= (and d!141367 res!864784) b!1301744))

(assert (= (and b!1301744 res!864783) b!1301745))

(declare-fun m!1192577 () Bool)

(assert (=> d!141367 m!1192577))

(declare-fun m!1192579 () Bool)

(assert (=> d!141367 m!1192579))

(declare-fun m!1192581 () Bool)

(assert (=> d!141367 m!1192581))

(declare-fun m!1192583 () Bool)

(assert (=> d!141367 m!1192583))

(declare-fun m!1192585 () Bool)

(assert (=> b!1301744 m!1192585))

(declare-fun m!1192587 () Bool)

(assert (=> b!1301745 m!1192587))

(assert (=> b!1301420 d!141367))

(declare-fun d!141369 () Bool)

(assert (=> d!141369 (= (apply!1017 (+!4461 lt!582016 (tuple2!22581 lt!582012 minValue!1387)) lt!582018) (get!21137 (getValueByKey!700 (toList!10134 (+!4461 lt!582016 (tuple2!22581 lt!582012 minValue!1387))) lt!582018)))))

(declare-fun bs!37067 () Bool)

(assert (= bs!37067 d!141369))

(declare-fun m!1192589 () Bool)

(assert (=> bs!37067 m!1192589))

(assert (=> bs!37067 m!1192589))

(declare-fun m!1192591 () Bool)

(assert (=> bs!37067 m!1192591))

(assert (=> b!1301420 d!141369))

(declare-fun d!141371 () Bool)

(assert (=> d!141371 (contains!8260 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387)) lt!582007)))

(declare-fun lt!582189 () Unit!43067)

(declare-fun choose!1908 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> d!141371 (= lt!582189 (choose!1908 lt!582009 lt!582006 zeroValue!1387 lt!582007))))

(assert (=> d!141371 (contains!8260 lt!582009 lt!582007)))

(assert (=> d!141371 (= (addStillContains!1105 lt!582009 lt!582006 zeroValue!1387 lt!582007) lt!582189)))

(declare-fun bs!37068 () Bool)

(assert (= bs!37068 d!141371))

(assert (=> bs!37068 m!1192139))

(assert (=> bs!37068 m!1192139))

(assert (=> bs!37068 m!1192149))

(declare-fun m!1192593 () Bool)

(assert (=> bs!37068 m!1192593))

(declare-fun m!1192595 () Bool)

(assert (=> bs!37068 m!1192595))

(assert (=> b!1301420 d!141371))

(declare-fun d!141373 () Bool)

(assert (=> d!141373 (= (apply!1017 (+!4461 lt!582005 (tuple2!22581 lt!582008 zeroValue!1387)) lt!582019) (get!21137 (getValueByKey!700 (toList!10134 (+!4461 lt!582005 (tuple2!22581 lt!582008 zeroValue!1387))) lt!582019)))))

(declare-fun bs!37069 () Bool)

(assert (= bs!37069 d!141373))

(declare-fun m!1192597 () Bool)

(assert (=> bs!37069 m!1192597))

(assert (=> bs!37069 m!1192597))

(declare-fun m!1192599 () Bool)

(assert (=> bs!37069 m!1192599))

(assert (=> b!1301420 d!141373))

(declare-fun d!141375 () Bool)

(declare-fun e!742496 () Bool)

(assert (=> d!141375 e!742496))

(declare-fun res!864786 () Bool)

(assert (=> d!141375 (=> (not res!864786) (not e!742496))))

(declare-fun lt!582191 () ListLongMap!20237)

(assert (=> d!141375 (= res!864786 (contains!8260 lt!582191 (_1!11301 (tuple2!22581 lt!582006 zeroValue!1387))))))

(declare-fun lt!582190 () List!29708)

(assert (=> d!141375 (= lt!582191 (ListLongMap!20238 lt!582190))))

(declare-fun lt!582192 () Unit!43067)

(declare-fun lt!582193 () Unit!43067)

(assert (=> d!141375 (= lt!582192 lt!582193)))

(assert (=> d!141375 (= (getValueByKey!700 lt!582190 (_1!11301 (tuple2!22581 lt!582006 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582006 zeroValue!1387))))))

(assert (=> d!141375 (= lt!582193 (lemmaContainsTupThenGetReturnValue!346 lt!582190 (_1!11301 (tuple2!22581 lt!582006 zeroValue!1387)) (_2!11301 (tuple2!22581 lt!582006 zeroValue!1387))))))

(assert (=> d!141375 (= lt!582190 (insertStrictlySorted!475 (toList!10134 lt!582009) (_1!11301 (tuple2!22581 lt!582006 zeroValue!1387)) (_2!11301 (tuple2!22581 lt!582006 zeroValue!1387))))))

(assert (=> d!141375 (= (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387)) lt!582191)))

(declare-fun b!1301747 () Bool)

(declare-fun res!864785 () Bool)

(assert (=> b!1301747 (=> (not res!864785) (not e!742496))))

(assert (=> b!1301747 (= res!864785 (= (getValueByKey!700 (toList!10134 lt!582191) (_1!11301 (tuple2!22581 lt!582006 zeroValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582006 zeroValue!1387)))))))

(declare-fun b!1301748 () Bool)

(assert (=> b!1301748 (= e!742496 (contains!8261 (toList!10134 lt!582191) (tuple2!22581 lt!582006 zeroValue!1387)))))

(assert (= (and d!141375 res!864786) b!1301747))

(assert (= (and b!1301747 res!864785) b!1301748))

(declare-fun m!1192601 () Bool)

(assert (=> d!141375 m!1192601))

(declare-fun m!1192603 () Bool)

(assert (=> d!141375 m!1192603))

(declare-fun m!1192605 () Bool)

(assert (=> d!141375 m!1192605))

(declare-fun m!1192607 () Bool)

(assert (=> d!141375 m!1192607))

(declare-fun m!1192609 () Bool)

(assert (=> b!1301747 m!1192609))

(declare-fun m!1192611 () Bool)

(assert (=> b!1301748 m!1192611))

(assert (=> b!1301420 d!141375))

(declare-fun d!141377 () Bool)

(assert (=> d!141377 (= (apply!1017 (+!4461 lt!582014 (tuple2!22581 lt!582022 minValue!1387)) lt!582015) (apply!1017 lt!582014 lt!582015))))

(declare-fun lt!582196 () Unit!43067)

(declare-fun choose!1909 (ListLongMap!20237 (_ BitVec 64) V!51579 (_ BitVec 64)) Unit!43067)

(assert (=> d!141377 (= lt!582196 (choose!1909 lt!582014 lt!582022 minValue!1387 lt!582015))))

(declare-fun e!742499 () Bool)

(assert (=> d!141377 e!742499))

(declare-fun res!864789 () Bool)

(assert (=> d!141377 (=> (not res!864789) (not e!742499))))

(assert (=> d!141377 (= res!864789 (contains!8260 lt!582014 lt!582015))))

(assert (=> d!141377 (= (addApplyDifferent!559 lt!582014 lt!582022 minValue!1387 lt!582015) lt!582196)))

(declare-fun b!1301752 () Bool)

(assert (=> b!1301752 (= e!742499 (not (= lt!582015 lt!582022)))))

(assert (= (and d!141377 res!864789) b!1301752))

(assert (=> d!141377 m!1192123))

(declare-fun m!1192613 () Bool)

(assert (=> d!141377 m!1192613))

(declare-fun m!1192615 () Bool)

(assert (=> d!141377 m!1192615))

(assert (=> d!141377 m!1192143))

(assert (=> d!141377 m!1192145))

(assert (=> d!141377 m!1192143))

(assert (=> b!1301420 d!141377))

(declare-fun d!141379 () Bool)

(declare-fun e!742500 () Bool)

(assert (=> d!141379 e!742500))

(declare-fun res!864791 () Bool)

(assert (=> d!141379 (=> (not res!864791) (not e!742500))))

(declare-fun lt!582198 () ListLongMap!20237)

(assert (=> d!141379 (= res!864791 (contains!8260 lt!582198 (_1!11301 (tuple2!22581 lt!582022 minValue!1387))))))

(declare-fun lt!582197 () List!29708)

(assert (=> d!141379 (= lt!582198 (ListLongMap!20238 lt!582197))))

(declare-fun lt!582199 () Unit!43067)

(declare-fun lt!582200 () Unit!43067)

(assert (=> d!141379 (= lt!582199 lt!582200)))

(assert (=> d!141379 (= (getValueByKey!700 lt!582197 (_1!11301 (tuple2!22581 lt!582022 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582022 minValue!1387))))))

(assert (=> d!141379 (= lt!582200 (lemmaContainsTupThenGetReturnValue!346 lt!582197 (_1!11301 (tuple2!22581 lt!582022 minValue!1387)) (_2!11301 (tuple2!22581 lt!582022 minValue!1387))))))

(assert (=> d!141379 (= lt!582197 (insertStrictlySorted!475 (toList!10134 lt!582014) (_1!11301 (tuple2!22581 lt!582022 minValue!1387)) (_2!11301 (tuple2!22581 lt!582022 minValue!1387))))))

(assert (=> d!141379 (= (+!4461 lt!582014 (tuple2!22581 lt!582022 minValue!1387)) lt!582198)))

(declare-fun b!1301753 () Bool)

(declare-fun res!864790 () Bool)

(assert (=> b!1301753 (=> (not res!864790) (not e!742500))))

(assert (=> b!1301753 (= res!864790 (= (getValueByKey!700 (toList!10134 lt!582198) (_1!11301 (tuple2!22581 lt!582022 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582022 minValue!1387)))))))

(declare-fun b!1301754 () Bool)

(assert (=> b!1301754 (= e!742500 (contains!8261 (toList!10134 lt!582198) (tuple2!22581 lt!582022 minValue!1387)))))

(assert (= (and d!141379 res!864791) b!1301753))

(assert (= (and b!1301753 res!864790) b!1301754))

(declare-fun m!1192617 () Bool)

(assert (=> d!141379 m!1192617))

(declare-fun m!1192619 () Bool)

(assert (=> d!141379 m!1192619))

(declare-fun m!1192621 () Bool)

(assert (=> d!141379 m!1192621))

(declare-fun m!1192623 () Bool)

(assert (=> d!141379 m!1192623))

(declare-fun m!1192625 () Bool)

(assert (=> b!1301753 m!1192625))

(declare-fun m!1192627 () Bool)

(assert (=> b!1301754 m!1192627))

(assert (=> b!1301420 d!141379))

(declare-fun d!141381 () Bool)

(declare-fun e!742501 () Bool)

(assert (=> d!141381 e!742501))

(declare-fun res!864792 () Bool)

(assert (=> d!141381 (=> res!864792 e!742501)))

(declare-fun lt!582203 () Bool)

(assert (=> d!141381 (= res!864792 (not lt!582203))))

(declare-fun lt!582202 () Bool)

(assert (=> d!141381 (= lt!582203 lt!582202)))

(declare-fun lt!582201 () Unit!43067)

(declare-fun e!742502 () Unit!43067)

(assert (=> d!141381 (= lt!582201 e!742502)))

(declare-fun c!124846 () Bool)

(assert (=> d!141381 (= c!124846 lt!582202)))

(assert (=> d!141381 (= lt!582202 (containsKey!722 (toList!10134 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387))) lt!582007))))

(assert (=> d!141381 (= (contains!8260 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387)) lt!582007) lt!582203)))

(declare-fun b!1301755 () Bool)

(declare-fun lt!582204 () Unit!43067)

(assert (=> b!1301755 (= e!742502 lt!582204)))

(assert (=> b!1301755 (= lt!582204 (lemmaContainsKeyImpliesGetValueByKeyDefined!468 (toList!10134 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387))) lt!582007))))

(assert (=> b!1301755 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387))) lt!582007))))

(declare-fun b!1301756 () Bool)

(declare-fun Unit!43092 () Unit!43067)

(assert (=> b!1301756 (= e!742502 Unit!43092)))

(declare-fun b!1301757 () Bool)

(assert (=> b!1301757 (= e!742501 (isDefined!507 (getValueByKey!700 (toList!10134 (+!4461 lt!582009 (tuple2!22581 lt!582006 zeroValue!1387))) lt!582007)))))

(assert (= (and d!141381 c!124846) b!1301755))

(assert (= (and d!141381 (not c!124846)) b!1301756))

(assert (= (and d!141381 (not res!864792)) b!1301757))

(declare-fun m!1192629 () Bool)

(assert (=> d!141381 m!1192629))

(declare-fun m!1192631 () Bool)

(assert (=> b!1301755 m!1192631))

(declare-fun m!1192633 () Bool)

(assert (=> b!1301755 m!1192633))

(assert (=> b!1301755 m!1192633))

(declare-fun m!1192635 () Bool)

(assert (=> b!1301755 m!1192635))

(assert (=> b!1301757 m!1192633))

(assert (=> b!1301757 m!1192633))

(assert (=> b!1301757 m!1192635))

(assert (=> b!1301420 d!141381))

(declare-fun d!141383 () Bool)

(assert (=> d!141383 (= (apply!1017 lt!582005 lt!582019) (get!21137 (getValueByKey!700 (toList!10134 lt!582005) lt!582019)))))

(declare-fun bs!37070 () Bool)

(assert (= bs!37070 d!141383))

(declare-fun m!1192637 () Bool)

(assert (=> bs!37070 m!1192637))

(assert (=> bs!37070 m!1192637))

(declare-fun m!1192639 () Bool)

(assert (=> bs!37070 m!1192639))

(assert (=> b!1301420 d!141383))

(declare-fun d!141385 () Bool)

(assert (=> d!141385 (= (apply!1017 (+!4461 lt!582005 (tuple2!22581 lt!582008 zeroValue!1387)) lt!582019) (apply!1017 lt!582005 lt!582019))))

(declare-fun lt!582205 () Unit!43067)

(assert (=> d!141385 (= lt!582205 (choose!1909 lt!582005 lt!582008 zeroValue!1387 lt!582019))))

(declare-fun e!742503 () Bool)

(assert (=> d!141385 e!742503))

(declare-fun res!864793 () Bool)

(assert (=> d!141385 (=> (not res!864793) (not e!742503))))

(assert (=> d!141385 (= res!864793 (contains!8260 lt!582005 lt!582019))))

(assert (=> d!141385 (= (addApplyDifferent!559 lt!582005 lt!582008 zeroValue!1387 lt!582019) lt!582205)))

(declare-fun b!1301758 () Bool)

(assert (=> b!1301758 (= e!742503 (not (= lt!582019 lt!582008)))))

(assert (= (and d!141385 res!864793) b!1301758))

(assert (=> d!141385 m!1192151))

(declare-fun m!1192641 () Bool)

(assert (=> d!141385 m!1192641))

(declare-fun m!1192643 () Bool)

(assert (=> d!141385 m!1192643))

(assert (=> d!141385 m!1192125))

(assert (=> d!141385 m!1192127))

(assert (=> d!141385 m!1192125))

(assert (=> b!1301420 d!141385))

(declare-fun d!141387 () Bool)

(assert (=> d!141387 (= (apply!1017 lt!582014 lt!582015) (get!21137 (getValueByKey!700 (toList!10134 lt!582014) lt!582015)))))

(declare-fun bs!37071 () Bool)

(assert (= bs!37071 d!141387))

(declare-fun m!1192645 () Bool)

(assert (=> bs!37071 m!1192645))

(assert (=> bs!37071 m!1192645))

(declare-fun m!1192647 () Bool)

(assert (=> bs!37071 m!1192647))

(assert (=> b!1301420 d!141387))

(declare-fun d!141389 () Bool)

(declare-fun e!742504 () Bool)

(assert (=> d!141389 e!742504))

(declare-fun res!864795 () Bool)

(assert (=> d!141389 (=> (not res!864795) (not e!742504))))

(declare-fun lt!582207 () ListLongMap!20237)

(assert (=> d!141389 (= res!864795 (contains!8260 lt!582207 (_1!11301 (tuple2!22581 lt!582012 minValue!1387))))))

(declare-fun lt!582206 () List!29708)

(assert (=> d!141389 (= lt!582207 (ListLongMap!20238 lt!582206))))

(declare-fun lt!582208 () Unit!43067)

(declare-fun lt!582209 () Unit!43067)

(assert (=> d!141389 (= lt!582208 lt!582209)))

(assert (=> d!141389 (= (getValueByKey!700 lt!582206 (_1!11301 (tuple2!22581 lt!582012 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582012 minValue!1387))))))

(assert (=> d!141389 (= lt!582209 (lemmaContainsTupThenGetReturnValue!346 lt!582206 (_1!11301 (tuple2!22581 lt!582012 minValue!1387)) (_2!11301 (tuple2!22581 lt!582012 minValue!1387))))))

(assert (=> d!141389 (= lt!582206 (insertStrictlySorted!475 (toList!10134 lt!582016) (_1!11301 (tuple2!22581 lt!582012 minValue!1387)) (_2!11301 (tuple2!22581 lt!582012 minValue!1387))))))

(assert (=> d!141389 (= (+!4461 lt!582016 (tuple2!22581 lt!582012 minValue!1387)) lt!582207)))

(declare-fun b!1301759 () Bool)

(declare-fun res!864794 () Bool)

(assert (=> b!1301759 (=> (not res!864794) (not e!742504))))

(assert (=> b!1301759 (= res!864794 (= (getValueByKey!700 (toList!10134 lt!582207) (_1!11301 (tuple2!22581 lt!582012 minValue!1387))) (Some!751 (_2!11301 (tuple2!22581 lt!582012 minValue!1387)))))))

(declare-fun b!1301760 () Bool)

(assert (=> b!1301760 (= e!742504 (contains!8261 (toList!10134 lt!582207) (tuple2!22581 lt!582012 minValue!1387)))))

(assert (= (and d!141389 res!864795) b!1301759))

(assert (= (and b!1301759 res!864794) b!1301760))

(declare-fun m!1192649 () Bool)

(assert (=> d!141389 m!1192649))

(declare-fun m!1192651 () Bool)

(assert (=> d!141389 m!1192651))

(declare-fun m!1192653 () Bool)

(assert (=> d!141389 m!1192653))

(declare-fun m!1192655 () Bool)

(assert (=> d!141389 m!1192655))

(declare-fun m!1192657 () Bool)

(assert (=> b!1301759 m!1192657))

(declare-fun m!1192659 () Bool)

(assert (=> b!1301760 m!1192659))

(assert (=> b!1301420 d!141389))

(assert (=> b!1301420 d!141227))

(declare-fun d!141391 () Bool)

(assert (=> d!141391 (= (apply!1017 (+!4461 lt!582014 (tuple2!22581 lt!582022 minValue!1387)) lt!582015) (get!21137 (getValueByKey!700 (toList!10134 (+!4461 lt!582014 (tuple2!22581 lt!582022 minValue!1387))) lt!582015)))))

(declare-fun bs!37072 () Bool)

(assert (= bs!37072 d!141391))

(declare-fun m!1192661 () Bool)

(assert (=> bs!37072 m!1192661))

(assert (=> bs!37072 m!1192661))

(declare-fun m!1192663 () Bool)

(assert (=> bs!37072 m!1192663))

(assert (=> b!1301420 d!141391))

(declare-fun d!141393 () Bool)

(assert (=> d!141393 (= (apply!1017 (+!4461 lt!582016 (tuple2!22581 lt!582012 minValue!1387)) lt!582018) (apply!1017 lt!582016 lt!582018))))

(declare-fun lt!582210 () Unit!43067)

(assert (=> d!141393 (= lt!582210 (choose!1909 lt!582016 lt!582012 minValue!1387 lt!582018))))

(declare-fun e!742505 () Bool)

(assert (=> d!141393 e!742505))

(declare-fun res!864796 () Bool)

(assert (=> d!141393 (=> (not res!864796) (not e!742505))))

(assert (=> d!141393 (= res!864796 (contains!8260 lt!582016 lt!582018))))

(assert (=> d!141393 (= (addApplyDifferent!559 lt!582016 lt!582012 minValue!1387 lt!582018) lt!582210)))

(declare-fun b!1301761 () Bool)

(assert (=> b!1301761 (= e!742505 (not (= lt!582018 lt!582012)))))

(assert (= (and d!141393 res!864796) b!1301761))

(assert (=> d!141393 m!1192137))

(declare-fun m!1192665 () Bool)

(assert (=> d!141393 m!1192665))

(declare-fun m!1192667 () Bool)

(assert (=> d!141393 m!1192667))

(assert (=> d!141393 m!1192129))

(assert (=> d!141393 m!1192131))

(assert (=> d!141393 m!1192129))

(assert (=> b!1301420 d!141393))

(declare-fun d!141395 () Bool)

(assert (=> d!141395 (= (apply!1017 lt!582016 lt!582018) (get!21137 (getValueByKey!700 (toList!10134 lt!582016) lt!582018)))))

(declare-fun bs!37073 () Bool)

(assert (= bs!37073 d!141395))

(declare-fun m!1192669 () Bool)

(assert (=> bs!37073 m!1192669))

(assert (=> bs!37073 m!1192669))

(declare-fun m!1192671 () Bool)

(assert (=> bs!37073 m!1192671))

(assert (=> b!1301420 d!141395))

(declare-fun mapNonEmpty!53868 () Bool)

(declare-fun mapRes!53868 () Bool)

(declare-fun tp!102795 () Bool)

(declare-fun e!742506 () Bool)

(assert (=> mapNonEmpty!53868 (= mapRes!53868 (and tp!102795 e!742506))))

(declare-fun mapRest!53868 () (Array (_ BitVec 32) ValueCell!16530))

(declare-fun mapValue!53868 () ValueCell!16530)

(declare-fun mapKey!53868 () (_ BitVec 32))

(assert (=> mapNonEmpty!53868 (= mapRest!53867 (store mapRest!53868 mapKey!53868 mapValue!53868))))

(declare-fun b!1301762 () Bool)

(assert (=> b!1301762 (= e!742506 tp_is_empty!34857)))

(declare-fun b!1301763 () Bool)

(declare-fun e!742507 () Bool)

(assert (=> b!1301763 (= e!742507 tp_is_empty!34857)))

(declare-fun mapIsEmpty!53868 () Bool)

(assert (=> mapIsEmpty!53868 mapRes!53868))

(declare-fun condMapEmpty!53868 () Bool)

(declare-fun mapDefault!53868 () ValueCell!16530)

(assert (=> mapNonEmpty!53867 (= condMapEmpty!53868 (= mapRest!53867 ((as const (Array (_ BitVec 32) ValueCell!16530)) mapDefault!53868)))))

(assert (=> mapNonEmpty!53867 (= tp!102794 (and e!742507 mapRes!53868))))

(assert (= (and mapNonEmpty!53867 condMapEmpty!53868) mapIsEmpty!53868))

(assert (= (and mapNonEmpty!53867 (not condMapEmpty!53868)) mapNonEmpty!53868))

(assert (= (and mapNonEmpty!53868 ((_ is ValueCellFull!16530) mapValue!53868)) b!1301762))

(assert (= (and mapNonEmpty!53867 ((_ is ValueCellFull!16530) mapDefault!53868)) b!1301763))

(declare-fun m!1192673 () Bool)

(assert (=> mapNonEmpty!53868 m!1192673))

(declare-fun b_lambda!23209 () Bool)

(assert (= b_lambda!23207 (or (and start!109824 b_free!29217) b_lambda!23209)))

(declare-fun b_lambda!23211 () Bool)

(assert (= b_lambda!23205 (or (and start!109824 b_free!29217) b_lambda!23211)))

(check-sat (not b_lambda!23191) (not b!1301734) (not d!141311) (not b!1301570) (not b!1301691) (not d!141355) (not b!1301748) (not d!141281) (not d!141283) (not d!141353) (not b_lambda!23199) (not b!1301641) (not b!1301552) (not b!1301689) (not b!1301695) (not bm!63959) (not b!1301740) (not b!1301693) (not b!1301679) (not b!1301640) (not b_next!29217) (not b!1301685) (not b!1301535) (not b!1301599) (not d!141349) (not b!1301753) (not b!1301704) (not b!1301621) (not d!141259) (not b!1301724) (not b!1301694) (not d!141277) (not d!141341) (not b!1301710) (not d!141317) (not d!141387) (not d!141269) (not b_lambda!23203) (not b!1301549) (not b!1301711) (not b!1301747) (not d!141379) (not d!141331) (not b!1301632) (not b_lambda!23201) (not b!1301575) (not d!141369) (not b!1301557) (not d!141275) (not b!1301683) (not b!1301722) (not b!1301760) (not d!141383) (not d!141321) (not b!1301593) (not mapNonEmpty!53868) (not b!1301588) (not b!1301572) (not b!1301628) (not b!1301590) (not b!1301699) (not d!141231) (not b!1301583) (not d!141295) (not b!1301732) (not b!1301707) (not b!1301743) (not d!141329) (not d!141303) (not b!1301682) (not b!1301741) (not b!1301681) (not d!141285) (not b!1301562) (not b!1301729) (not d!141365) (not d!141279) (not d!141367) (not d!141293) (not d!141301) (not b!1301670) (not d!141371) (not b!1301556) (not d!141357) (not d!141247) (not b!1301745) (not d!141255) (not b!1301643) (not d!141265) (not b!1301712) (not b!1301649) (not b_lambda!23209) (not b!1301686) (not b!1301727) (not b!1301634) (not b!1301735) (not b!1301664) (not b!1301587) (not b!1301728) (not b!1301674) (not b!1301579) (not b!1301600) (not b!1301582) (not d!141389) (not b!1301559) (not b_lambda!23211) (not d!141327) (not b!1301585) (not b!1301698) (not b!1301718) (not b!1301561) (not d!141345) (not b!1301755) (not bm!63966) (not b!1301622) (not d!141391) (not b!1301536) (not d!141339) (not d!141375) (not b!1301584) (not b!1301702) (not d!141305) (not d!141319) (not b!1301730) (not d!141299) (not b!1301701) (not d!141385) (not bm!63970) (not b!1301754) (not d!141377) b_and!47349 (not b!1301738) (not d!141333) (not bm!63969) (not d!141393) (not b!1301757) (not b!1301539) (not b!1301709) (not b!1301688) (not b!1301577) (not b!1301543) (not d!141241) (not b!1301723) (not d!141363) (not d!141325) (not d!141373) (not b!1301554) (not d!141381) (not b!1301531) (not d!141361) (not b!1301580) (not bm!63958) tp_is_empty!34857 (not d!141335) (not b!1301737) (not d!141251) (not d!141291) (not d!141309) (not b!1301759) (not d!141243) (not d!141239) (not d!141395) (not b!1301744) (not b!1301696) (not b!1301725) (not d!141287) (not d!141267) (not b!1301568) (not d!141273) (not b!1301676) (not d!141351))
(check-sat b_and!47349 (not b_next!29217))
