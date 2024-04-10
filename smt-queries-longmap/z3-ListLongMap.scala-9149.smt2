; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109736 () Bool)

(assert start!109736)

(declare-fun b_free!29169 () Bool)

(declare-fun b_next!29169 () Bool)

(assert (=> start!109736 (= b_free!29169 (not b_next!29169))))

(declare-fun tp!102635 () Bool)

(declare-fun b_and!47271 () Bool)

(assert (=> start!109736 (= tp!102635 b_and!47271)))

(declare-fun b!1299888 () Bool)

(declare-fun res!863846 () Bool)

(declare-fun e!741522 () Bool)

(assert (=> b!1299888 (=> (not res!863846) (not e!741522))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!86626 0))(
  ( (array!86627 (arr!41811 (Array (_ BitVec 32) (_ BitVec 64))) (size!42361 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86626)

(assert (=> b!1299888 (= res!863846 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42361 _keys!1741))))))

(declare-fun b!1299889 () Bool)

(declare-fun res!863853 () Bool)

(assert (=> b!1299889 (=> (not res!863853) (not e!741522))))

(declare-datatypes ((V!51515 0))(
  ( (V!51516 (val!17479 Int)) )
))
(declare-fun minValue!1387 () V!51515)

(declare-fun zeroValue!1387 () V!51515)

(declare-datatypes ((ValueCell!16506 0))(
  ( (ValueCellFull!16506 (v!20085 V!51515)) (EmptyCell!16506) )
))
(declare-datatypes ((array!86628 0))(
  ( (array!86629 (arr!41812 (Array (_ BitVec 32) ValueCell!16506)) (size!42362 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86628)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22542 0))(
  ( (tuple2!22543 (_1!11282 (_ BitVec 64)) (_2!11282 V!51515)) )
))
(declare-datatypes ((List!29674 0))(
  ( (Nil!29671) (Cons!29670 (h!30879 tuple2!22542) (t!43244 List!29674)) )
))
(declare-datatypes ((ListLongMap!20199 0))(
  ( (ListLongMap!20200 (toList!10115 List!29674)) )
))
(declare-fun contains!8237 (ListLongMap!20199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5142 (array!86626 array!86628 (_ BitVec 32) (_ BitVec 32) V!51515 V!51515 (_ BitVec 32) Int) ListLongMap!20199)

(assert (=> b!1299889 (= res!863853 (contains!8237 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53783 () Bool)

(declare-fun mapRes!53783 () Bool)

(assert (=> mapIsEmpty!53783 mapRes!53783))

(declare-fun b!1299890 () Bool)

(declare-fun res!863852 () Bool)

(assert (=> b!1299890 (=> (not res!863852) (not e!741522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299890 (= res!863852 (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)))))

(declare-fun mapNonEmpty!53783 () Bool)

(declare-fun tp!102634 () Bool)

(declare-fun e!741523 () Bool)

(assert (=> mapNonEmpty!53783 (= mapRes!53783 (and tp!102634 e!741523))))

(declare-fun mapValue!53783 () ValueCell!16506)

(declare-fun mapKey!53783 () (_ BitVec 32))

(declare-fun mapRest!53783 () (Array (_ BitVec 32) ValueCell!16506))

(assert (=> mapNonEmpty!53783 (= (arr!41812 _values!1445) (store mapRest!53783 mapKey!53783 mapValue!53783))))

(declare-fun b!1299891 () Bool)

(declare-fun e!741526 () Bool)

(declare-fun tp_is_empty!34809 () Bool)

(assert (=> b!1299891 (= e!741526 tp_is_empty!34809)))

(declare-fun b!1299892 () Bool)

(declare-fun res!863849 () Bool)

(assert (=> b!1299892 (=> (not res!863849) (not e!741522))))

(assert (=> b!1299892 (= res!863849 (and (= (size!42362 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42361 _keys!1741) (size!42362 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299893 () Bool)

(declare-fun +!4447 (ListLongMap!20199 tuple2!22542) ListLongMap!20199)

(declare-fun getCurrentListMapNoExtraKeys!6078 (array!86626 array!86628 (_ BitVec 32) (_ BitVec 32) V!51515 V!51515 (_ BitVec 32) Int) ListLongMap!20199)

(assert (=> b!1299893 (= e!741522 (not (contains!8237 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205)))))

(declare-fun b!1299894 () Bool)

(declare-fun e!741524 () Bool)

(assert (=> b!1299894 (= e!741524 (and e!741526 mapRes!53783))))

(declare-fun condMapEmpty!53783 () Bool)

(declare-fun mapDefault!53783 () ValueCell!16506)

(assert (=> b!1299894 (= condMapEmpty!53783 (= (arr!41812 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16506)) mapDefault!53783)))))

(declare-fun b!1299895 () Bool)

(declare-fun res!863847 () Bool)

(assert (=> b!1299895 (=> (not res!863847) (not e!741522))))

(declare-datatypes ((List!29675 0))(
  ( (Nil!29672) (Cons!29671 (h!30880 (_ BitVec 64)) (t!43245 List!29675)) )
))
(declare-fun arrayNoDuplicates!0 (array!86626 (_ BitVec 32) List!29675) Bool)

(assert (=> b!1299895 (= res!863847 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29672))))

(declare-fun b!1299896 () Bool)

(declare-fun res!863850 () Bool)

(assert (=> b!1299896 (=> (not res!863850) (not e!741522))))

(assert (=> b!1299896 (= res!863850 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1299897 () Bool)

(declare-fun res!863851 () Bool)

(assert (=> b!1299897 (=> (not res!863851) (not e!741522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86626 (_ BitVec 32)) Bool)

(assert (=> b!1299897 (= res!863851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!863845 () Bool)

(assert (=> start!109736 (=> (not res!863845) (not e!741522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109736 (= res!863845 (validMask!0 mask!2175))))

(assert (=> start!109736 e!741522))

(assert (=> start!109736 tp_is_empty!34809))

(assert (=> start!109736 true))

(declare-fun array_inv!31637 (array!86628) Bool)

(assert (=> start!109736 (and (array_inv!31637 _values!1445) e!741524)))

(declare-fun array_inv!31638 (array!86626) Bool)

(assert (=> start!109736 (array_inv!31638 _keys!1741)))

(assert (=> start!109736 tp!102635))

(declare-fun b!1299898 () Bool)

(declare-fun res!863848 () Bool)

(assert (=> b!1299898 (=> (not res!863848) (not e!741522))))

(assert (=> b!1299898 (= res!863848 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741))))))

(declare-fun b!1299899 () Bool)

(assert (=> b!1299899 (= e!741523 tp_is_empty!34809)))

(assert (= (and start!109736 res!863845) b!1299892))

(assert (= (and b!1299892 res!863849) b!1299897))

(assert (= (and b!1299897 res!863851) b!1299895))

(assert (= (and b!1299895 res!863847) b!1299898))

(assert (= (and b!1299898 res!863848) b!1299889))

(assert (= (and b!1299889 res!863853) b!1299888))

(assert (= (and b!1299888 res!863846) b!1299890))

(assert (= (and b!1299890 res!863852) b!1299896))

(assert (= (and b!1299896 res!863850) b!1299893))

(assert (= (and b!1299894 condMapEmpty!53783) mapIsEmpty!53783))

(assert (= (and b!1299894 (not condMapEmpty!53783)) mapNonEmpty!53783))

(get-info :version)

(assert (= (and mapNonEmpty!53783 ((_ is ValueCellFull!16506) mapValue!53783)) b!1299899))

(assert (= (and b!1299894 ((_ is ValueCellFull!16506) mapDefault!53783)) b!1299891))

(assert (= start!109736 b!1299894))

(declare-fun m!1190959 () Bool)

(assert (=> b!1299897 m!1190959))

(declare-fun m!1190961 () Bool)

(assert (=> b!1299890 m!1190961))

(assert (=> b!1299890 m!1190961))

(declare-fun m!1190963 () Bool)

(assert (=> b!1299890 m!1190963))

(declare-fun m!1190965 () Bool)

(assert (=> start!109736 m!1190965))

(declare-fun m!1190967 () Bool)

(assert (=> start!109736 m!1190967))

(declare-fun m!1190969 () Bool)

(assert (=> start!109736 m!1190969))

(declare-fun m!1190971 () Bool)

(assert (=> b!1299889 m!1190971))

(assert (=> b!1299889 m!1190971))

(declare-fun m!1190973 () Bool)

(assert (=> b!1299889 m!1190973))

(declare-fun m!1190975 () Bool)

(assert (=> b!1299895 m!1190975))

(declare-fun m!1190977 () Bool)

(assert (=> b!1299893 m!1190977))

(assert (=> b!1299893 m!1190977))

(declare-fun m!1190979 () Bool)

(assert (=> b!1299893 m!1190979))

(assert (=> b!1299893 m!1190979))

(declare-fun m!1190981 () Bool)

(assert (=> b!1299893 m!1190981))

(declare-fun m!1190983 () Bool)

(assert (=> mapNonEmpty!53783 m!1190983))

(check-sat (not b!1299890) tp_is_empty!34809 (not b!1299897) (not mapNonEmpty!53783) (not b!1299893) (not start!109736) (not b!1299895) (not b_next!29169) (not b!1299889) b_and!47271)
(check-sat b_and!47271 (not b_next!29169))
(get-model)

(declare-fun d!141131 () Bool)

(assert (=> d!141131 (= (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)) (and (not (= (select (arr!41811 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41811 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1299890 d!141131))

(declare-fun b!1299946 () Bool)

(declare-fun e!741553 () Bool)

(declare-fun call!63603 () Bool)

(assert (=> b!1299946 (= e!741553 call!63603)))

(declare-fun b!1299947 () Bool)

(declare-fun e!741552 () Bool)

(declare-fun contains!8238 (List!29675 (_ BitVec 64)) Bool)

(assert (=> b!1299947 (= e!741552 (contains!8238 Nil!29672 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141133 () Bool)

(declare-fun res!863888 () Bool)

(declare-fun e!741551 () Bool)

(assert (=> d!141133 (=> res!863888 e!741551)))

(assert (=> d!141133 (= res!863888 (bvsge #b00000000000000000000000000000000 (size!42361 _keys!1741)))))

(assert (=> d!141133 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29672) e!741551)))

(declare-fun b!1299948 () Bool)

(declare-fun e!741550 () Bool)

(assert (=> b!1299948 (= e!741550 e!741553)))

(declare-fun c!124521 () Bool)

(assert (=> b!1299948 (= c!124521 (validKeyInArray!0 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1299949 () Bool)

(assert (=> b!1299949 (= e!741553 call!63603)))

(declare-fun b!1299950 () Bool)

(assert (=> b!1299950 (= e!741551 e!741550)))

(declare-fun res!863887 () Bool)

(assert (=> b!1299950 (=> (not res!863887) (not e!741550))))

(assert (=> b!1299950 (= res!863887 (not e!741552))))

(declare-fun res!863889 () Bool)

(assert (=> b!1299950 (=> (not res!863889) (not e!741552))))

(assert (=> b!1299950 (= res!863889 (validKeyInArray!0 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63600 () Bool)

(assert (=> bm!63600 (= call!63603 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124521 (Cons!29671 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000) Nil!29672) Nil!29672)))))

(assert (= (and d!141133 (not res!863888)) b!1299950))

(assert (= (and b!1299950 res!863889) b!1299947))

(assert (= (and b!1299950 res!863887) b!1299948))

(assert (= (and b!1299948 c!124521) b!1299946))

(assert (= (and b!1299948 (not c!124521)) b!1299949))

(assert (= (or b!1299946 b!1299949) bm!63600))

(declare-fun m!1191011 () Bool)

(assert (=> b!1299947 m!1191011))

(assert (=> b!1299947 m!1191011))

(declare-fun m!1191013 () Bool)

(assert (=> b!1299947 m!1191013))

(assert (=> b!1299948 m!1191011))

(assert (=> b!1299948 m!1191011))

(declare-fun m!1191015 () Bool)

(assert (=> b!1299948 m!1191015))

(assert (=> b!1299950 m!1191011))

(assert (=> b!1299950 m!1191011))

(assert (=> b!1299950 m!1191015))

(assert (=> bm!63600 m!1191011))

(declare-fun m!1191017 () Bool)

(assert (=> bm!63600 m!1191017))

(assert (=> b!1299895 d!141133))

(declare-fun d!141135 () Bool)

(declare-fun e!741559 () Bool)

(assert (=> d!141135 e!741559))

(declare-fun res!863892 () Bool)

(assert (=> d!141135 (=> res!863892 e!741559)))

(declare-fun lt!581146 () Bool)

(assert (=> d!141135 (= res!863892 (not lt!581146))))

(declare-fun lt!581148 () Bool)

(assert (=> d!141135 (= lt!581146 lt!581148)))

(declare-datatypes ((Unit!43030 0))(
  ( (Unit!43031) )
))
(declare-fun lt!581147 () Unit!43030)

(declare-fun e!741558 () Unit!43030)

(assert (=> d!141135 (= lt!581147 e!741558)))

(declare-fun c!124524 () Bool)

(assert (=> d!141135 (= c!124524 lt!581148)))

(declare-fun containsKey!720 (List!29674 (_ BitVec 64)) Bool)

(assert (=> d!141135 (= lt!581148 (containsKey!720 (toList!10115 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(assert (=> d!141135 (= (contains!8237 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205) lt!581146)))

(declare-fun b!1299957 () Bool)

(declare-fun lt!581145 () Unit!43030)

(assert (=> b!1299957 (= e!741558 lt!581145)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!466 (List!29674 (_ BitVec 64)) Unit!43030)

(assert (=> b!1299957 (= lt!581145 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10115 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-datatypes ((Option!750 0))(
  ( (Some!749 (v!20087 V!51515)) (None!748) )
))
(declare-fun isDefined!505 (Option!750) Bool)

(declare-fun getValueByKey!698 (List!29674 (_ BitVec 64)) Option!750)

(assert (=> b!1299957 (isDefined!505 (getValueByKey!698 (toList!10115 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205))))

(declare-fun b!1299958 () Bool)

(declare-fun Unit!43032 () Unit!43030)

(assert (=> b!1299958 (= e!741558 Unit!43032)))

(declare-fun b!1299959 () Bool)

(assert (=> b!1299959 (= e!741559 (isDefined!505 (getValueByKey!698 (toList!10115 (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) k0!1205)))))

(assert (= (and d!141135 c!124524) b!1299957))

(assert (= (and d!141135 (not c!124524)) b!1299958))

(assert (= (and d!141135 (not res!863892)) b!1299959))

(declare-fun m!1191019 () Bool)

(assert (=> d!141135 m!1191019))

(declare-fun m!1191021 () Bool)

(assert (=> b!1299957 m!1191021))

(declare-fun m!1191023 () Bool)

(assert (=> b!1299957 m!1191023))

(assert (=> b!1299957 m!1191023))

(declare-fun m!1191025 () Bool)

(assert (=> b!1299957 m!1191025))

(assert (=> b!1299959 m!1191023))

(assert (=> b!1299959 m!1191023))

(assert (=> b!1299959 m!1191025))

(assert (=> b!1299893 d!141135))

(declare-fun d!141137 () Bool)

(declare-fun e!741562 () Bool)

(assert (=> d!141137 e!741562))

(declare-fun res!863898 () Bool)

(assert (=> d!141137 (=> (not res!863898) (not e!741562))))

(declare-fun lt!581158 () ListLongMap!20199)

(assert (=> d!141137 (= res!863898 (contains!8237 lt!581158 (_1!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581157 () List!29674)

(assert (=> d!141137 (= lt!581158 (ListLongMap!20200 lt!581157))))

(declare-fun lt!581159 () Unit!43030)

(declare-fun lt!581160 () Unit!43030)

(assert (=> d!141137 (= lt!581159 lt!581160)))

(assert (=> d!141137 (= (getValueByKey!698 lt!581157 (_1!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!749 (_2!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!344 (List!29674 (_ BitVec 64) V!51515) Unit!43030)

(assert (=> d!141137 (= lt!581160 (lemmaContainsTupThenGetReturnValue!344 lt!581157 (_1!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun insertStrictlySorted!473 (List!29674 (_ BitVec 64) V!51515) List!29674)

(assert (=> d!141137 (= lt!581157 (insertStrictlySorted!473 (toList!10115 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141137 (= (+!4447 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581158)))

(declare-fun b!1299964 () Bool)

(declare-fun res!863897 () Bool)

(assert (=> b!1299964 (=> (not res!863897) (not e!741562))))

(assert (=> b!1299964 (= res!863897 (= (getValueByKey!698 (toList!10115 lt!581158) (_1!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!749 (_2!11282 (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1299965 () Bool)

(declare-fun contains!8239 (List!29674 tuple2!22542) Bool)

(assert (=> b!1299965 (= e!741562 (contains!8239 (toList!10115 lt!581158) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141137 res!863898) b!1299964))

(assert (= (and b!1299964 res!863897) b!1299965))

(declare-fun m!1191027 () Bool)

(assert (=> d!141137 m!1191027))

(declare-fun m!1191029 () Bool)

(assert (=> d!141137 m!1191029))

(declare-fun m!1191031 () Bool)

(assert (=> d!141137 m!1191031))

(declare-fun m!1191033 () Bool)

(assert (=> d!141137 m!1191033))

(declare-fun m!1191035 () Bool)

(assert (=> b!1299964 m!1191035))

(declare-fun m!1191037 () Bool)

(assert (=> b!1299965 m!1191037))

(assert (=> b!1299893 d!141137))

(declare-fun b!1299990 () Bool)

(declare-fun e!741579 () ListLongMap!20199)

(declare-fun call!63606 () ListLongMap!20199)

(assert (=> b!1299990 (= e!741579 call!63606)))

(declare-fun b!1299991 () Bool)

(declare-fun e!741582 () Bool)

(declare-fun e!741580 () Bool)

(assert (=> b!1299991 (= e!741582 e!741580)))

(assert (=> b!1299991 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun lt!581175 () ListLongMap!20199)

(declare-fun res!863908 () Bool)

(assert (=> b!1299991 (= res!863908 (contains!8237 lt!581175 (select (arr!41811 _keys!1741) from!2144)))))

(assert (=> b!1299991 (=> (not res!863908) (not e!741580))))

(declare-fun bm!63603 () Bool)

(assert (=> bm!63603 (= call!63606 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1299993 () Bool)

(declare-fun lt!581178 () Unit!43030)

(declare-fun lt!581181 () Unit!43030)

(assert (=> b!1299993 (= lt!581178 lt!581181)))

(declare-fun lt!581180 () (_ BitVec 64))

(declare-fun lt!581179 () (_ BitVec 64))

(declare-fun lt!581176 () ListLongMap!20199)

(declare-fun lt!581177 () V!51515)

(assert (=> b!1299993 (not (contains!8237 (+!4447 lt!581176 (tuple2!22543 lt!581180 lt!581177)) lt!581179))))

(declare-fun addStillNotContains!457 (ListLongMap!20199 (_ BitVec 64) V!51515 (_ BitVec 64)) Unit!43030)

(assert (=> b!1299993 (= lt!581181 (addStillNotContains!457 lt!581176 lt!581180 lt!581177 lt!581179))))

(assert (=> b!1299993 (= lt!581179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!21116 (ValueCell!16506 V!51515) V!51515)

(declare-fun dynLambda!3419 (Int (_ BitVec 64)) V!51515)

(assert (=> b!1299993 (= lt!581177 (get!21116 (select (arr!41812 _values!1445) from!2144) (dynLambda!3419 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1299993 (= lt!581180 (select (arr!41811 _keys!1741) from!2144))))

(assert (=> b!1299993 (= lt!581176 call!63606)))

(assert (=> b!1299993 (= e!741579 (+!4447 call!63606 (tuple2!22543 (select (arr!41811 _keys!1741) from!2144) (get!21116 (select (arr!41812 _values!1445) from!2144) (dynLambda!3419 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1299994 () Bool)

(declare-fun e!741577 () Bool)

(assert (=> b!1299994 (= e!741577 (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)))))

(assert (=> b!1299994 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1299995 () Bool)

(declare-fun res!863910 () Bool)

(declare-fun e!741581 () Bool)

(assert (=> b!1299995 (=> (not res!863910) (not e!741581))))

(assert (=> b!1299995 (= res!863910 (not (contains!8237 lt!581175 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1299996 () Bool)

(declare-fun e!741583 () ListLongMap!20199)

(assert (=> b!1299996 (= e!741583 (ListLongMap!20200 Nil!29671))))

(declare-fun b!1299997 () Bool)

(assert (=> b!1299997 (= e!741581 e!741582)))

(declare-fun c!124534 () Bool)

(assert (=> b!1299997 (= c!124534 e!741577)))

(declare-fun res!863909 () Bool)

(assert (=> b!1299997 (=> (not res!863909) (not e!741577))))

(assert (=> b!1299997 (= res!863909 (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun b!1299998 () Bool)

(declare-fun e!741578 () Bool)

(assert (=> b!1299998 (= e!741582 e!741578)))

(declare-fun c!124535 () Bool)

(assert (=> b!1299998 (= c!124535 (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun b!1299999 () Bool)

(assert (=> b!1299999 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741)))))

(assert (=> b!1299999 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42362 _values!1445)))))

(declare-fun apply!1015 (ListLongMap!20199 (_ BitVec 64)) V!51515)

(assert (=> b!1299999 (= e!741580 (= (apply!1015 lt!581175 (select (arr!41811 _keys!1741) from!2144)) (get!21116 (select (arr!41812 _values!1445) from!2144) (dynLambda!3419 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141139 () Bool)

(assert (=> d!141139 e!741581))

(declare-fun res!863907 () Bool)

(assert (=> d!141139 (=> (not res!863907) (not e!741581))))

(assert (=> d!141139 (= res!863907 (not (contains!8237 lt!581175 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141139 (= lt!581175 e!741583)))

(declare-fun c!124533 () Bool)

(assert (=> d!141139 (= c!124533 (bvsge from!2144 (size!42361 _keys!1741)))))

(assert (=> d!141139 (validMask!0 mask!2175)))

(assert (=> d!141139 (= (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581175)))

(declare-fun b!1299992 () Bool)

(assert (=> b!1299992 (= e!741583 e!741579)))

(declare-fun c!124536 () Bool)

(assert (=> b!1299992 (= c!124536 (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)))))

(declare-fun b!1300000 () Bool)

(assert (=> b!1300000 (= e!741578 (= lt!581175 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1300001 () Bool)

(declare-fun isEmpty!1051 (ListLongMap!20199) Bool)

(assert (=> b!1300001 (= e!741578 (isEmpty!1051 lt!581175))))

(assert (= (and d!141139 c!124533) b!1299996))

(assert (= (and d!141139 (not c!124533)) b!1299992))

(assert (= (and b!1299992 c!124536) b!1299993))

(assert (= (and b!1299992 (not c!124536)) b!1299990))

(assert (= (or b!1299993 b!1299990) bm!63603))

(assert (= (and d!141139 res!863907) b!1299995))

(assert (= (and b!1299995 res!863910) b!1299997))

(assert (= (and b!1299997 res!863909) b!1299994))

(assert (= (and b!1299997 c!124534) b!1299991))

(assert (= (and b!1299997 (not c!124534)) b!1299998))

(assert (= (and b!1299991 res!863908) b!1299999))

(assert (= (and b!1299998 c!124535) b!1300000))

(assert (= (and b!1299998 (not c!124535)) b!1300001))

(declare-fun b_lambda!23161 () Bool)

(assert (=> (not b_lambda!23161) (not b!1299993)))

(declare-fun t!43247 () Bool)

(declare-fun tb!11375 () Bool)

(assert (=> (and start!109736 (= defaultEntry!1448 defaultEntry!1448) t!43247) tb!11375))

(declare-fun result!23757 () Bool)

(assert (=> tb!11375 (= result!23757 tp_is_empty!34809)))

(assert (=> b!1299993 t!43247))

(declare-fun b_and!47275 () Bool)

(assert (= b_and!47271 (and (=> t!43247 result!23757) b_and!47275)))

(declare-fun b_lambda!23163 () Bool)

(assert (=> (not b_lambda!23163) (not b!1299999)))

(assert (=> b!1299999 t!43247))

(declare-fun b_and!47277 () Bool)

(assert (= b_and!47275 (and (=> t!43247 result!23757) b_and!47277)))

(assert (=> b!1299992 m!1190961))

(assert (=> b!1299992 m!1190961))

(assert (=> b!1299992 m!1190963))

(assert (=> b!1299993 m!1190961))

(declare-fun m!1191039 () Bool)

(assert (=> b!1299993 m!1191039))

(declare-fun m!1191041 () Bool)

(assert (=> b!1299993 m!1191041))

(declare-fun m!1191043 () Bool)

(assert (=> b!1299993 m!1191043))

(declare-fun m!1191045 () Bool)

(assert (=> b!1299993 m!1191045))

(assert (=> b!1299993 m!1191039))

(assert (=> b!1299993 m!1191041))

(declare-fun m!1191047 () Bool)

(assert (=> b!1299993 m!1191047))

(assert (=> b!1299993 m!1191045))

(declare-fun m!1191049 () Bool)

(assert (=> b!1299993 m!1191049))

(declare-fun m!1191051 () Bool)

(assert (=> b!1299993 m!1191051))

(declare-fun m!1191053 () Bool)

(assert (=> b!1299995 m!1191053))

(assert (=> b!1299991 m!1190961))

(assert (=> b!1299991 m!1190961))

(declare-fun m!1191055 () Bool)

(assert (=> b!1299991 m!1191055))

(declare-fun m!1191057 () Bool)

(assert (=> b!1300001 m!1191057))

(assert (=> b!1299999 m!1190961))

(assert (=> b!1299999 m!1190961))

(declare-fun m!1191059 () Bool)

(assert (=> b!1299999 m!1191059))

(assert (=> b!1299999 m!1191039))

(assert (=> b!1299999 m!1191041))

(assert (=> b!1299999 m!1191039))

(assert (=> b!1299999 m!1191041))

(assert (=> b!1299999 m!1191047))

(declare-fun m!1191061 () Bool)

(assert (=> bm!63603 m!1191061))

(assert (=> b!1299994 m!1190961))

(assert (=> b!1299994 m!1190961))

(assert (=> b!1299994 m!1190963))

(assert (=> b!1300000 m!1191061))

(declare-fun m!1191063 () Bool)

(assert (=> d!141139 m!1191063))

(assert (=> d!141139 m!1190965))

(assert (=> b!1299893 d!141139))

(declare-fun bm!63606 () Bool)

(declare-fun call!63609 () Bool)

(assert (=> bm!63606 (= call!63609 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300012 () Bool)

(declare-fun e!741592 () Bool)

(declare-fun e!741591 () Bool)

(assert (=> b!1300012 (= e!741592 e!741591)))

(declare-fun lt!581190 () (_ BitVec 64))

(assert (=> b!1300012 (= lt!581190 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581188 () Unit!43030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86626 (_ BitVec 64) (_ BitVec 32)) Unit!43030)

(assert (=> b!1300012 (= lt!581188 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581190 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300012 (arrayContainsKey!0 _keys!1741 lt!581190 #b00000000000000000000000000000000)))

(declare-fun lt!581189 () Unit!43030)

(assert (=> b!1300012 (= lt!581189 lt!581188)))

(declare-fun res!863915 () Bool)

(declare-datatypes ((SeekEntryResult!10018 0))(
  ( (MissingZero!10018 (index!42443 (_ BitVec 32))) (Found!10018 (index!42444 (_ BitVec 32))) (Intermediate!10018 (undefined!10830 Bool) (index!42445 (_ BitVec 32)) (x!115474 (_ BitVec 32))) (Undefined!10018) (MissingVacant!10018 (index!42446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86626 (_ BitVec 32)) SeekEntryResult!10018)

(assert (=> b!1300012 (= res!863915 (= (seekEntryOrOpen!0 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10018 #b00000000000000000000000000000000)))))

(assert (=> b!1300012 (=> (not res!863915) (not e!741591))))

(declare-fun b!1300013 () Bool)

(declare-fun e!741590 () Bool)

(assert (=> b!1300013 (= e!741590 e!741592)))

(declare-fun c!124539 () Bool)

(assert (=> b!1300013 (= c!124539 (validKeyInArray!0 (select (arr!41811 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300014 () Bool)

(assert (=> b!1300014 (= e!741591 call!63609)))

(declare-fun d!141141 () Bool)

(declare-fun res!863916 () Bool)

(assert (=> d!141141 (=> res!863916 e!741590)))

(assert (=> d!141141 (= res!863916 (bvsge #b00000000000000000000000000000000 (size!42361 _keys!1741)))))

(assert (=> d!141141 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741590)))

(declare-fun b!1300015 () Bool)

(assert (=> b!1300015 (= e!741592 call!63609)))

(assert (= (and d!141141 (not res!863916)) b!1300013))

(assert (= (and b!1300013 c!124539) b!1300012))

(assert (= (and b!1300013 (not c!124539)) b!1300015))

(assert (= (and b!1300012 res!863915) b!1300014))

(assert (= (or b!1300014 b!1300015) bm!63606))

(declare-fun m!1191065 () Bool)

(assert (=> bm!63606 m!1191065))

(assert (=> b!1300012 m!1191011))

(declare-fun m!1191067 () Bool)

(assert (=> b!1300012 m!1191067))

(declare-fun m!1191069 () Bool)

(assert (=> b!1300012 m!1191069))

(assert (=> b!1300012 m!1191011))

(declare-fun m!1191071 () Bool)

(assert (=> b!1300012 m!1191071))

(assert (=> b!1300013 m!1191011))

(assert (=> b!1300013 m!1191011))

(assert (=> b!1300013 m!1191015))

(assert (=> b!1299897 d!141141))

(declare-fun d!141143 () Bool)

(declare-fun e!741594 () Bool)

(assert (=> d!141143 e!741594))

(declare-fun res!863917 () Bool)

(assert (=> d!141143 (=> res!863917 e!741594)))

(declare-fun lt!581192 () Bool)

(assert (=> d!141143 (= res!863917 (not lt!581192))))

(declare-fun lt!581194 () Bool)

(assert (=> d!141143 (= lt!581192 lt!581194)))

(declare-fun lt!581193 () Unit!43030)

(declare-fun e!741593 () Unit!43030)

(assert (=> d!141143 (= lt!581193 e!741593)))

(declare-fun c!124540 () Bool)

(assert (=> d!141143 (= c!124540 lt!581194)))

(assert (=> d!141143 (= lt!581194 (containsKey!720 (toList!10115 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141143 (= (contains!8237 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581192)))

(declare-fun b!1300016 () Bool)

(declare-fun lt!581191 () Unit!43030)

(assert (=> b!1300016 (= e!741593 lt!581191)))

(assert (=> b!1300016 (= lt!581191 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10115 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1300016 (isDefined!505 (getValueByKey!698 (toList!10115 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300017 () Bool)

(declare-fun Unit!43033 () Unit!43030)

(assert (=> b!1300017 (= e!741593 Unit!43033)))

(declare-fun b!1300018 () Bool)

(assert (=> b!1300018 (= e!741594 (isDefined!505 (getValueByKey!698 (toList!10115 (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141143 c!124540) b!1300016))

(assert (= (and d!141143 (not c!124540)) b!1300017))

(assert (= (and d!141143 (not res!863917)) b!1300018))

(declare-fun m!1191073 () Bool)

(assert (=> d!141143 m!1191073))

(declare-fun m!1191075 () Bool)

(assert (=> b!1300016 m!1191075))

(declare-fun m!1191077 () Bool)

(assert (=> b!1300016 m!1191077))

(assert (=> b!1300016 m!1191077))

(declare-fun m!1191079 () Bool)

(assert (=> b!1300016 m!1191079))

(assert (=> b!1300018 m!1191077))

(assert (=> b!1300018 m!1191077))

(assert (=> b!1300018 m!1191079))

(assert (=> b!1299889 d!141143))

(declare-fun bm!63621 () Bool)

(declare-fun call!63629 () ListLongMap!20199)

(declare-fun call!63630 () ListLongMap!20199)

(assert (=> bm!63621 (= call!63629 call!63630)))

(declare-fun b!1300061 () Bool)

(declare-fun e!741625 () ListLongMap!20199)

(declare-fun e!741622 () ListLongMap!20199)

(assert (=> b!1300061 (= e!741625 e!741622)))

(declare-fun c!124556 () Bool)

(assert (=> b!1300061 (= c!124556 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!141145 () Bool)

(declare-fun e!741626 () Bool)

(assert (=> d!141145 e!741626))

(declare-fun res!863939 () Bool)

(assert (=> d!141145 (=> (not res!863939) (not e!741626))))

(assert (=> d!141145 (= res!863939 (or (bvsge from!2144 (size!42361 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741)))))))

(declare-fun lt!581245 () ListLongMap!20199)

(declare-fun lt!581257 () ListLongMap!20199)

(assert (=> d!141145 (= lt!581245 lt!581257)))

(declare-fun lt!581251 () Unit!43030)

(declare-fun e!741628 () Unit!43030)

(assert (=> d!141145 (= lt!581251 e!741628)))

(declare-fun c!124554 () Bool)

(declare-fun e!741633 () Bool)

(assert (=> d!141145 (= c!124554 e!741633)))

(declare-fun res!863938 () Bool)

(assert (=> d!141145 (=> (not res!863938) (not e!741633))))

(assert (=> d!141145 (= res!863938 (bvslt from!2144 (size!42361 _keys!1741)))))

(assert (=> d!141145 (= lt!581257 e!741625)))

(declare-fun c!124558 () Bool)

(assert (=> d!141145 (= c!124558 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141145 (validMask!0 mask!2175)))

(assert (=> d!141145 (= (getCurrentListMap!5142 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581245)))

(declare-fun b!1300062 () Bool)

(assert (=> b!1300062 (= e!741622 call!63629)))

(declare-fun b!1300063 () Bool)

(declare-fun e!741629 () Bool)

(declare-fun e!741630 () Bool)

(assert (=> b!1300063 (= e!741629 e!741630)))

(declare-fun res!863942 () Bool)

(declare-fun call!63628 () Bool)

(assert (=> b!1300063 (= res!863942 call!63628)))

(assert (=> b!1300063 (=> (not res!863942) (not e!741630))))

(declare-fun b!1300064 () Bool)

(assert (=> b!1300064 (= e!741626 e!741629)))

(declare-fun c!124555 () Bool)

(assert (=> b!1300064 (= c!124555 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300065 () Bool)

(declare-fun e!741624 () Bool)

(declare-fun call!63626 () Bool)

(assert (=> b!1300065 (= e!741624 (not call!63626))))

(declare-fun b!1300066 () Bool)

(declare-fun e!741621 () ListLongMap!20199)

(assert (=> b!1300066 (= e!741621 call!63629)))

(declare-fun b!1300067 () Bool)

(declare-fun res!863941 () Bool)

(assert (=> b!1300067 (=> (not res!863941) (not e!741626))))

(assert (=> b!1300067 (= res!863941 e!741624)))

(declare-fun c!124553 () Bool)

(assert (=> b!1300067 (= c!124553 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1300068 () Bool)

(assert (=> b!1300068 (= e!741630 (= (apply!1015 lt!581245 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300069 () Bool)

(declare-fun res!863944 () Bool)

(assert (=> b!1300069 (=> (not res!863944) (not e!741626))))

(declare-fun e!741627 () Bool)

(assert (=> b!1300069 (= res!863944 e!741627)))

(declare-fun res!863940 () Bool)

(assert (=> b!1300069 (=> res!863940 e!741627)))

(declare-fun e!741623 () Bool)

(assert (=> b!1300069 (= res!863940 (not e!741623))))

(declare-fun res!863936 () Bool)

(assert (=> b!1300069 (=> (not res!863936) (not e!741623))))

(assert (=> b!1300069 (= res!863936 (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun bm!63622 () Bool)

(declare-fun call!63627 () ListLongMap!20199)

(declare-fun call!63625 () ListLongMap!20199)

(assert (=> bm!63622 (= call!63627 call!63625)))

(declare-fun b!1300070 () Bool)

(assert (=> b!1300070 (= e!741633 (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)))))

(declare-fun b!1300071 () Bool)

(assert (=> b!1300071 (= e!741623 (validKeyInArray!0 (select (arr!41811 _keys!1741) from!2144)))))

(declare-fun bm!63623 () Bool)

(declare-fun call!63624 () ListLongMap!20199)

(assert (=> bm!63623 (= call!63630 (+!4447 (ite c!124558 call!63624 (ite c!124556 call!63625 call!63627)) (ite (or c!124558 c!124556) (tuple2!22543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1300072 () Bool)

(declare-fun e!741632 () Bool)

(assert (=> b!1300072 (= e!741632 (= (apply!1015 lt!581245 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300073 () Bool)

(declare-fun e!741631 () Bool)

(assert (=> b!1300073 (= e!741631 (= (apply!1015 lt!581245 (select (arr!41811 _keys!1741) from!2144)) (get!21116 (select (arr!41812 _values!1445) from!2144) (dynLambda!3419 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300073 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42362 _values!1445)))))

(assert (=> b!1300073 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun b!1300074 () Bool)

(assert (=> b!1300074 (= e!741624 e!741632)))

(declare-fun res!863937 () Bool)

(assert (=> b!1300074 (= res!863937 call!63626)))

(assert (=> b!1300074 (=> (not res!863937) (not e!741632))))

(declare-fun b!1300075 () Bool)

(assert (=> b!1300075 (= e!741627 e!741631)))

(declare-fun res!863943 () Bool)

(assert (=> b!1300075 (=> (not res!863943) (not e!741631))))

(assert (=> b!1300075 (= res!863943 (contains!8237 lt!581245 (select (arr!41811 _keys!1741) from!2144)))))

(assert (=> b!1300075 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42361 _keys!1741)))))

(declare-fun b!1300076 () Bool)

(declare-fun lt!581242 () Unit!43030)

(assert (=> b!1300076 (= e!741628 lt!581242)))

(declare-fun lt!581253 () ListLongMap!20199)

(assert (=> b!1300076 (= lt!581253 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581252 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581248 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581248 (select (arr!41811 _keys!1741) from!2144))))

(declare-fun lt!581259 () Unit!43030)

(declare-fun addStillContains!1103 (ListLongMap!20199 (_ BitVec 64) V!51515 (_ BitVec 64)) Unit!43030)

(assert (=> b!1300076 (= lt!581259 (addStillContains!1103 lt!581253 lt!581252 zeroValue!1387 lt!581248))))

(assert (=> b!1300076 (contains!8237 (+!4447 lt!581253 (tuple2!22543 lt!581252 zeroValue!1387)) lt!581248)))

(declare-fun lt!581246 () Unit!43030)

(assert (=> b!1300076 (= lt!581246 lt!581259)))

(declare-fun lt!581258 () ListLongMap!20199)

(assert (=> b!1300076 (= lt!581258 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581249 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581249 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581260 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581260 (select (arr!41811 _keys!1741) from!2144))))

(declare-fun lt!581250 () Unit!43030)

(declare-fun addApplyDifferent!557 (ListLongMap!20199 (_ BitVec 64) V!51515 (_ BitVec 64)) Unit!43030)

(assert (=> b!1300076 (= lt!581250 (addApplyDifferent!557 lt!581258 lt!581249 minValue!1387 lt!581260))))

(assert (=> b!1300076 (= (apply!1015 (+!4447 lt!581258 (tuple2!22543 lt!581249 minValue!1387)) lt!581260) (apply!1015 lt!581258 lt!581260))))

(declare-fun lt!581239 () Unit!43030)

(assert (=> b!1300076 (= lt!581239 lt!581250)))

(declare-fun lt!581255 () ListLongMap!20199)

(assert (=> b!1300076 (= lt!581255 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581256 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581256 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581247 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581247 (select (arr!41811 _keys!1741) from!2144))))

(declare-fun lt!581244 () Unit!43030)

(assert (=> b!1300076 (= lt!581244 (addApplyDifferent!557 lt!581255 lt!581256 zeroValue!1387 lt!581247))))

(assert (=> b!1300076 (= (apply!1015 (+!4447 lt!581255 (tuple2!22543 lt!581256 zeroValue!1387)) lt!581247) (apply!1015 lt!581255 lt!581247))))

(declare-fun lt!581241 () Unit!43030)

(assert (=> b!1300076 (= lt!581241 lt!581244)))

(declare-fun lt!581254 () ListLongMap!20199)

(assert (=> b!1300076 (= lt!581254 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581243 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581240 () (_ BitVec 64))

(assert (=> b!1300076 (= lt!581240 (select (arr!41811 _keys!1741) from!2144))))

(assert (=> b!1300076 (= lt!581242 (addApplyDifferent!557 lt!581254 lt!581243 minValue!1387 lt!581240))))

(assert (=> b!1300076 (= (apply!1015 (+!4447 lt!581254 (tuple2!22543 lt!581243 minValue!1387)) lt!581240) (apply!1015 lt!581254 lt!581240))))

(declare-fun bm!63624 () Bool)

(assert (=> bm!63624 (= call!63626 (contains!8237 lt!581245 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63625 () Bool)

(assert (=> bm!63625 (= call!63624 (getCurrentListMapNoExtraKeys!6078 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300077 () Bool)

(declare-fun c!124557 () Bool)

(assert (=> b!1300077 (= c!124557 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1300077 (= e!741622 e!741621)))

(declare-fun bm!63626 () Bool)

(assert (=> bm!63626 (= call!63628 (contains!8237 lt!581245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63627 () Bool)

(assert (=> bm!63627 (= call!63625 call!63624)))

(declare-fun b!1300078 () Bool)

(assert (=> b!1300078 (= e!741625 (+!4447 call!63630 (tuple2!22543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1300079 () Bool)

(declare-fun Unit!43034 () Unit!43030)

(assert (=> b!1300079 (= e!741628 Unit!43034)))

(declare-fun b!1300080 () Bool)

(assert (=> b!1300080 (= e!741629 (not call!63628))))

(declare-fun b!1300081 () Bool)

(assert (=> b!1300081 (= e!741621 call!63627)))

(assert (= (and d!141145 c!124558) b!1300078))

(assert (= (and d!141145 (not c!124558)) b!1300061))

(assert (= (and b!1300061 c!124556) b!1300062))

(assert (= (and b!1300061 (not c!124556)) b!1300077))

(assert (= (and b!1300077 c!124557) b!1300066))

(assert (= (and b!1300077 (not c!124557)) b!1300081))

(assert (= (or b!1300066 b!1300081) bm!63622))

(assert (= (or b!1300062 bm!63622) bm!63627))

(assert (= (or b!1300062 b!1300066) bm!63621))

(assert (= (or b!1300078 bm!63627) bm!63625))

(assert (= (or b!1300078 bm!63621) bm!63623))

(assert (= (and d!141145 res!863938) b!1300070))

(assert (= (and d!141145 c!124554) b!1300076))

(assert (= (and d!141145 (not c!124554)) b!1300079))

(assert (= (and d!141145 res!863939) b!1300069))

(assert (= (and b!1300069 res!863936) b!1300071))

(assert (= (and b!1300069 (not res!863940)) b!1300075))

(assert (= (and b!1300075 res!863943) b!1300073))

(assert (= (and b!1300069 res!863944) b!1300067))

(assert (= (and b!1300067 c!124553) b!1300074))

(assert (= (and b!1300067 (not c!124553)) b!1300065))

(assert (= (and b!1300074 res!863937) b!1300072))

(assert (= (or b!1300074 b!1300065) bm!63624))

(assert (= (and b!1300067 res!863941) b!1300064))

(assert (= (and b!1300064 c!124555) b!1300063))

(assert (= (and b!1300064 (not c!124555)) b!1300080))

(assert (= (and b!1300063 res!863942) b!1300068))

(assert (= (or b!1300063 b!1300080) bm!63626))

(declare-fun b_lambda!23165 () Bool)

(assert (=> (not b_lambda!23165) (not b!1300073)))

(assert (=> b!1300073 t!43247))

(declare-fun b_and!47279 () Bool)

(assert (= b_and!47277 (and (=> t!43247 result!23757) b_and!47279)))

(assert (=> bm!63625 m!1190977))

(assert (=> d!141145 m!1190965))

(declare-fun m!1191081 () Bool)

(assert (=> bm!63624 m!1191081))

(declare-fun m!1191083 () Bool)

(assert (=> b!1300068 m!1191083))

(declare-fun m!1191085 () Bool)

(assert (=> b!1300076 m!1191085))

(declare-fun m!1191087 () Bool)

(assert (=> b!1300076 m!1191087))

(assert (=> b!1300076 m!1191085))

(declare-fun m!1191089 () Bool)

(assert (=> b!1300076 m!1191089))

(declare-fun m!1191091 () Bool)

(assert (=> b!1300076 m!1191091))

(declare-fun m!1191093 () Bool)

(assert (=> b!1300076 m!1191093))

(declare-fun m!1191095 () Bool)

(assert (=> b!1300076 m!1191095))

(assert (=> b!1300076 m!1190961))

(declare-fun m!1191097 () Bool)

(assert (=> b!1300076 m!1191097))

(declare-fun m!1191099 () Bool)

(assert (=> b!1300076 m!1191099))

(declare-fun m!1191101 () Bool)

(assert (=> b!1300076 m!1191101))

(declare-fun m!1191103 () Bool)

(assert (=> b!1300076 m!1191103))

(declare-fun m!1191105 () Bool)

(assert (=> b!1300076 m!1191105))

(assert (=> b!1300076 m!1191093))

(declare-fun m!1191107 () Bool)

(assert (=> b!1300076 m!1191107))

(assert (=> b!1300076 m!1190977))

(declare-fun m!1191109 () Bool)

(assert (=> b!1300076 m!1191109))

(assert (=> b!1300076 m!1191101))

(declare-fun m!1191111 () Bool)

(assert (=> b!1300076 m!1191111))

(assert (=> b!1300076 m!1191097))

(declare-fun m!1191113 () Bool)

(assert (=> b!1300076 m!1191113))

(declare-fun m!1191115 () Bool)

(assert (=> bm!63626 m!1191115))

(assert (=> b!1300070 m!1190961))

(assert (=> b!1300070 m!1190961))

(assert (=> b!1300070 m!1190963))

(declare-fun m!1191117 () Bool)

(assert (=> b!1300078 m!1191117))

(declare-fun m!1191119 () Bool)

(assert (=> b!1300072 m!1191119))

(assert (=> b!1300073 m!1191039))

(assert (=> b!1300073 m!1191041))

(assert (=> b!1300073 m!1191039))

(assert (=> b!1300073 m!1191041))

(assert (=> b!1300073 m!1191047))

(assert (=> b!1300073 m!1190961))

(declare-fun m!1191121 () Bool)

(assert (=> b!1300073 m!1191121))

(assert (=> b!1300073 m!1190961))

(assert (=> b!1300075 m!1190961))

(assert (=> b!1300075 m!1190961))

(declare-fun m!1191123 () Bool)

(assert (=> b!1300075 m!1191123))

(assert (=> b!1300071 m!1190961))

(assert (=> b!1300071 m!1190961))

(assert (=> b!1300071 m!1190963))

(declare-fun m!1191125 () Bool)

(assert (=> bm!63623 m!1191125))

(assert (=> b!1299889 d!141145))

(declare-fun d!141147 () Bool)

(assert (=> d!141147 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109736 d!141147))

(declare-fun d!141149 () Bool)

(assert (=> d!141149 (= (array_inv!31637 _values!1445) (bvsge (size!42362 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109736 d!141149))

(declare-fun d!141151 () Bool)

(assert (=> d!141151 (= (array_inv!31638 _keys!1741) (bvsge (size!42361 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109736 d!141151))

(declare-fun mapIsEmpty!53789 () Bool)

(declare-fun mapRes!53789 () Bool)

(assert (=> mapIsEmpty!53789 mapRes!53789))

(declare-fun mapNonEmpty!53789 () Bool)

(declare-fun tp!102644 () Bool)

(declare-fun e!741638 () Bool)

(assert (=> mapNonEmpty!53789 (= mapRes!53789 (and tp!102644 e!741638))))

(declare-fun mapValue!53789 () ValueCell!16506)

(declare-fun mapRest!53789 () (Array (_ BitVec 32) ValueCell!16506))

(declare-fun mapKey!53789 () (_ BitVec 32))

(assert (=> mapNonEmpty!53789 (= mapRest!53783 (store mapRest!53789 mapKey!53789 mapValue!53789))))

(declare-fun condMapEmpty!53789 () Bool)

(declare-fun mapDefault!53789 () ValueCell!16506)

(assert (=> mapNonEmpty!53783 (= condMapEmpty!53789 (= mapRest!53783 ((as const (Array (_ BitVec 32) ValueCell!16506)) mapDefault!53789)))))

(declare-fun e!741639 () Bool)

(assert (=> mapNonEmpty!53783 (= tp!102634 (and e!741639 mapRes!53789))))

(declare-fun b!1300089 () Bool)

(assert (=> b!1300089 (= e!741639 tp_is_empty!34809)))

(declare-fun b!1300088 () Bool)

(assert (=> b!1300088 (= e!741638 tp_is_empty!34809)))

(assert (= (and mapNonEmpty!53783 condMapEmpty!53789) mapIsEmpty!53789))

(assert (= (and mapNonEmpty!53783 (not condMapEmpty!53789)) mapNonEmpty!53789))

(assert (= (and mapNonEmpty!53789 ((_ is ValueCellFull!16506) mapValue!53789)) b!1300088))

(assert (= (and mapNonEmpty!53783 ((_ is ValueCellFull!16506) mapDefault!53789)) b!1300089))

(declare-fun m!1191127 () Bool)

(assert (=> mapNonEmpty!53789 m!1191127))

(declare-fun b_lambda!23167 () Bool)

(assert (= b_lambda!23165 (or (and start!109736 b_free!29169) b_lambda!23167)))

(declare-fun b_lambda!23169 () Bool)

(assert (= b_lambda!23163 (or (and start!109736 b_free!29169) b_lambda!23169)))

(declare-fun b_lambda!23171 () Bool)

(assert (= b_lambda!23161 (or (and start!109736 b_free!29169) b_lambda!23171)))

(check-sat (not bm!63623) (not bm!63606) (not bm!63625) (not b!1299957) (not b!1300001) (not b!1300078) (not b_next!29169) (not b!1299948) (not b!1300018) (not b!1299993) (not b!1299947) (not b!1300076) (not b!1300016) (not b!1300068) (not b!1299992) (not b!1299964) (not b!1299994) (not bm!63600) (not b!1300073) (not b!1300013) (not b_lambda!23169) (not b!1299959) (not b!1299950) (not bm!63603) (not b!1300071) tp_is_empty!34809 (not bm!63624) (not b!1299991) (not b!1300070) (not bm!63626) (not b!1299965) b_and!47279 (not b!1300012) (not d!141135) (not b!1300075) (not d!141143) (not b!1300000) (not b!1300072) (not b!1299999) (not b!1299995) (not d!141137) (not d!141145) (not b_lambda!23171) (not mapNonEmpty!53789) (not d!141139) (not b_lambda!23167))
(check-sat b_and!47279 (not b_next!29169))
