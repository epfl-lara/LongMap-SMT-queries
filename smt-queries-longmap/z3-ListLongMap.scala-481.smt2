; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10140 () Bool)

(assert start!10140)

(declare-fun b!76985 () Bool)

(declare-fun b_free!2161 () Bool)

(declare-fun b_next!2161 () Bool)

(assert (=> b!76985 (= b_free!2161 (not b_next!2161))))

(declare-fun tp!8680 () Bool)

(declare-fun b_and!4701 () Bool)

(assert (=> b!76985 (= tp!8680 b_and!4701)))

(declare-fun b!76973 () Bool)

(declare-fun b_free!2163 () Bool)

(declare-fun b_next!2163 () Bool)

(assert (=> b!76973 (= b_free!2163 (not b_next!2163))))

(declare-fun tp!8682 () Bool)

(declare-fun b_and!4703 () Bool)

(assert (=> b!76973 (= tp!8682 b_and!4703)))

(declare-fun b!76972 () Bool)

(declare-datatypes ((Unit!2222 0))(
  ( (Unit!2223) )
))
(declare-fun e!50286 () Unit!2222)

(declare-fun Unit!2224 () Unit!2222)

(assert (=> b!76972 (= e!50286 Unit!2224)))

(declare-fun lt!35145 () Unit!2222)

(declare-datatypes ((V!2977 0))(
  ( (V!2978 (val!1293 Int)) )
))
(declare-datatypes ((array!3925 0))(
  ( (array!3926 (arr!1870 (Array (_ BitVec 32) (_ BitVec 64))) (size!2112 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!905 0))(
  ( (ValueCellFull!905 (v!2570 V!2977)) (EmptyCell!905) )
))
(declare-datatypes ((array!3927 0))(
  ( (array!3928 (arr!1871 (Array (_ BitVec 32) ValueCell!905)) (size!2113 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!718 0))(
  ( (LongMapFixedSize!719 (defaultEntry!2262 Int) (mask!6252 (_ BitVec 32)) (extraKeys!2113 (_ BitVec 32)) (zeroValue!2160 V!2977) (minValue!2160 V!2977) (_size!408 (_ BitVec 32)) (_keys!3921 array!3925) (_values!2245 array!3927) (_vacant!408 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!514 0))(
  ( (Cell!515 (v!2571 LongMapFixedSize!718)) )
))
(declare-datatypes ((LongMap!514 0))(
  ( (LongMap!515 (underlying!268 Cell!514)) )
))
(declare-fun thiss!992 () LongMap!514)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!56 (array!3925 array!3927 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 64) (_ BitVec 32) Int) Unit!2222)

(assert (=> b!76972 (= lt!35145 (lemmaListMapContainsThenArrayContainsFrom!56 (_keys!3921 (v!2571 (underlying!268 thiss!992))) (_values!2245 (v!2571 (underlying!268 thiss!992))) (mask!6252 (v!2571 (underlying!268 thiss!992))) (extraKeys!2113 (v!2571 (underlying!268 thiss!992))) (zeroValue!2160 (v!2571 (underlying!268 thiss!992))) (minValue!2160 (v!2571 (underlying!268 thiss!992))) (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2571 (underlying!268 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!76972 (arrayContainsKey!0 (_keys!3921 (v!2571 (underlying!268 thiss!992))) (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!35155 () Unit!2222)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3925 (_ BitVec 32) (_ BitVec 32)) Unit!2222)

(assert (=> b!76972 (= lt!35155 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3921 (v!2571 (underlying!268 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1503 0))(
  ( (Nil!1500) (Cons!1499 (h!2087 (_ BitVec 64)) (t!5116 List!1503)) )
))
(declare-fun arrayNoDuplicates!0 (array!3925 (_ BitVec 32) List!1503) Bool)

(assert (=> b!76972 (arrayNoDuplicates!0 (_keys!3921 (v!2571 (underlying!268 thiss!992))) from!355 Nil!1500)))

(declare-fun lt!35154 () Unit!2222)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3925 (_ BitVec 32) (_ BitVec 64) List!1503) Unit!2222)

(assert (=> b!76972 (= lt!35154 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3921 (v!2571 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) (Cons!1499 (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) Nil!1500)))))

(assert (=> b!76972 false))

(declare-fun newMap!16 () LongMapFixedSize!718)

(declare-fun tp_is_empty!2497 () Bool)

(declare-fun e!50284 () Bool)

(declare-fun e!50290 () Bool)

(declare-fun array_inv!1173 (array!3925) Bool)

(declare-fun array_inv!1174 (array!3927) Bool)

(assert (=> b!76973 (= e!50284 (and tp!8682 tp_is_empty!2497 (array_inv!1173 (_keys!3921 newMap!16)) (array_inv!1174 (_values!2245 newMap!16)) e!50290))))

(declare-fun mapIsEmpty!3257 () Bool)

(declare-fun mapRes!3257 () Bool)

(assert (=> mapIsEmpty!3257 mapRes!3257))

(declare-fun b!76974 () Bool)

(declare-fun e!50285 () Bool)

(declare-fun e!50277 () Bool)

(assert (=> b!76974 (= e!50285 e!50277)))

(declare-fun b!76975 () Bool)

(declare-fun e!50274 () Bool)

(assert (=> b!76975 (= e!50274 tp_is_empty!2497)))

(declare-fun b!76976 () Bool)

(declare-fun e!50280 () Bool)

(declare-fun e!50283 () Bool)

(assert (=> b!76976 (= e!50280 (and e!50283 mapRes!3257))))

(declare-fun condMapEmpty!3257 () Bool)

(declare-fun mapDefault!3258 () ValueCell!905)

(assert (=> b!76976 (= condMapEmpty!3257 (= (arr!1871 (_values!2245 (v!2571 (underlying!268 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!905)) mapDefault!3258)))))

(declare-fun b!76977 () Bool)

(declare-fun e!50275 () Bool)

(declare-fun e!50289 () Bool)

(assert (=> b!76977 (= e!50275 e!50289)))

(declare-fun res!40472 () Bool)

(assert (=> b!76977 (=> (not res!40472) (not e!50289))))

(declare-datatypes ((tuple2!2158 0))(
  ( (tuple2!2159 (_1!1090 (_ BitVec 64)) (_2!1090 V!2977)) )
))
(declare-datatypes ((List!1504 0))(
  ( (Nil!1501) (Cons!1500 (h!2088 tuple2!2158) (t!5117 List!1504)) )
))
(declare-datatypes ((ListLongMap!1425 0))(
  ( (ListLongMap!1426 (toList!728 List!1504)) )
))
(declare-fun lt!35153 () ListLongMap!1425)

(declare-fun lt!35149 () ListLongMap!1425)

(assert (=> b!76977 (= res!40472 (= lt!35153 lt!35149))))

(declare-fun map!1166 (LongMapFixedSize!718) ListLongMap!1425)

(assert (=> b!76977 (= lt!35149 (map!1166 newMap!16))))

(declare-fun getCurrentListMap!418 (array!3925 array!3927 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!76977 (= lt!35153 (getCurrentListMap!418 (_keys!3921 (v!2571 (underlying!268 thiss!992))) (_values!2245 (v!2571 (underlying!268 thiss!992))) (mask!6252 (v!2571 (underlying!268 thiss!992))) (extraKeys!2113 (v!2571 (underlying!268 thiss!992))) (zeroValue!2160 (v!2571 (underlying!268 thiss!992))) (minValue!2160 (v!2571 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2571 (underlying!268 thiss!992)))))))

(declare-fun b!76978 () Bool)

(declare-fun e!50279 () Bool)

(assert (=> b!76978 (= e!50279 tp_is_empty!2497)))

(declare-fun mapNonEmpty!3257 () Bool)

(declare-fun mapRes!3258 () Bool)

(declare-fun tp!8681 () Bool)

(declare-fun e!50288 () Bool)

(assert (=> mapNonEmpty!3257 (= mapRes!3258 (and tp!8681 e!50288))))

(declare-fun mapValue!3258 () ValueCell!905)

(declare-fun mapRest!3258 () (Array (_ BitVec 32) ValueCell!905))

(declare-fun mapKey!3257 () (_ BitVec 32))

(assert (=> mapNonEmpty!3257 (= (arr!1871 (_values!2245 newMap!16)) (store mapRest!3258 mapKey!3257 mapValue!3258))))

(declare-fun b!76979 () Bool)

(declare-fun e!50278 () Bool)

(assert (=> b!76979 (= e!50278 e!50285)))

(declare-fun b!76980 () Bool)

(declare-fun e!50287 () Bool)

(declare-fun e!50276 () Bool)

(assert (=> b!76980 (= e!50287 e!50276)))

(declare-fun res!40467 () Bool)

(assert (=> b!76980 (=> (not res!40467) (not e!50276))))

(declare-datatypes ((tuple2!2160 0))(
  ( (tuple2!2161 (_1!1091 Bool) (_2!1091 LongMapFixedSize!718)) )
))
(declare-fun lt!35156 () tuple2!2160)

(assert (=> b!76980 (= res!40467 (and (_1!1091 lt!35156) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!35147 () Unit!2222)

(assert (=> b!76980 (= lt!35147 e!50286)))

(declare-fun c!11750 () Bool)

(declare-fun contains!733 (ListLongMap!1425 (_ BitVec 64)) Bool)

(assert (=> b!76980 (= c!11750 (contains!733 lt!35149 (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355)))))

(declare-fun lt!35150 () V!2977)

(declare-fun update!111 (LongMapFixedSize!718 (_ BitVec 64) V!2977) tuple2!2160)

(assert (=> b!76980 (= lt!35156 (update!111 newMap!16 (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) lt!35150))))

(declare-fun b!76981 () Bool)

(declare-fun res!40473 () Bool)

(assert (=> b!76981 (=> (not res!40473) (not e!50275))))

(assert (=> b!76981 (= res!40473 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2112 (_keys!3921 (v!2571 (underlying!268 thiss!992)))))))))

(declare-fun b!76982 () Bool)

(assert (=> b!76982 (= e!50290 (and e!50274 mapRes!3258))))

(declare-fun condMapEmpty!3258 () Bool)

(declare-fun mapDefault!3257 () ValueCell!905)

(assert (=> b!76982 (= condMapEmpty!3258 (= (arr!1871 (_values!2245 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!905)) mapDefault!3257)))))

(declare-fun mapIsEmpty!3258 () Bool)

(assert (=> mapIsEmpty!3258 mapRes!3258))

(declare-fun b!76983 () Bool)

(declare-fun res!40468 () Bool)

(assert (=> b!76983 (=> (not res!40468) (not e!50275))))

(assert (=> b!76983 (= res!40468 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6252 newMap!16)) (_size!408 (v!2571 (underlying!268 thiss!992)))))))

(declare-fun b!76984 () Bool)

(assert (=> b!76984 (= e!50288 tp_is_empty!2497)))

(assert (=> b!76985 (= e!50277 (and tp!8680 tp_is_empty!2497 (array_inv!1173 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) (array_inv!1174 (_values!2245 (v!2571 (underlying!268 thiss!992)))) e!50280))))

(declare-fun b!76986 () Bool)

(declare-fun Unit!2225 () Unit!2222)

(assert (=> b!76986 (= e!50286 Unit!2225)))

(declare-fun b!76987 () Bool)

(declare-fun res!40471 () Bool)

(assert (=> b!76987 (=> (not res!40471) (not e!50275))))

(declare-fun valid!315 (LongMapFixedSize!718) Bool)

(assert (=> b!76987 (= res!40471 (valid!315 newMap!16))))

(declare-fun b!76988 () Bool)

(assert (=> b!76988 (= e!50276 (not true))))

(declare-fun lt!35148 () ListLongMap!1425)

(declare-fun lt!35152 () tuple2!2158)

(declare-fun lt!35146 () tuple2!2158)

(declare-fun +!100 (ListLongMap!1425 tuple2!2158) ListLongMap!1425)

(assert (=> b!76988 (= (+!100 (+!100 lt!35148 lt!35152) lt!35146) (+!100 (+!100 lt!35148 lt!35146) lt!35152))))

(assert (=> b!76988 (= lt!35146 (tuple2!2159 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2160 (v!2571 (underlying!268 thiss!992)))))))

(assert (=> b!76988 (= lt!35152 (tuple2!2159 (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) lt!35150))))

(declare-fun lt!35151 () Unit!2222)

(declare-fun addCommutativeForDiffKeys!19 (ListLongMap!1425 (_ BitVec 64) V!2977 (_ BitVec 64) V!2977) Unit!2222)

(assert (=> b!76988 (= lt!35151 (addCommutativeForDiffKeys!19 lt!35148 (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) lt!35150 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2160 (v!2571 (underlying!268 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!64 (array!3925 array!3927 (_ BitVec 32) (_ BitVec 32) V!2977 V!2977 (_ BitVec 32) Int) ListLongMap!1425)

(assert (=> b!76988 (= lt!35148 (getCurrentListMapNoExtraKeys!64 (_keys!3921 (v!2571 (underlying!268 thiss!992))) (_values!2245 (v!2571 (underlying!268 thiss!992))) (mask!6252 (v!2571 (underlying!268 thiss!992))) (extraKeys!2113 (v!2571 (underlying!268 thiss!992))) (zeroValue!2160 (v!2571 (underlying!268 thiss!992))) (minValue!2160 (v!2571 (underlying!268 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2262 (v!2571 (underlying!268 thiss!992)))))))

(declare-fun mapNonEmpty!3258 () Bool)

(declare-fun tp!8679 () Bool)

(assert (=> mapNonEmpty!3258 (= mapRes!3257 (and tp!8679 e!50279))))

(declare-fun mapRest!3257 () (Array (_ BitVec 32) ValueCell!905))

(declare-fun mapValue!3257 () ValueCell!905)

(declare-fun mapKey!3258 () (_ BitVec 32))

(assert (=> mapNonEmpty!3258 (= (arr!1871 (_values!2245 (v!2571 (underlying!268 thiss!992)))) (store mapRest!3257 mapKey!3258 mapValue!3257))))

(declare-fun b!76989 () Bool)

(assert (=> b!76989 (= e!50283 tp_is_empty!2497)))

(declare-fun res!40469 () Bool)

(assert (=> start!10140 (=> (not res!40469) (not e!50275))))

(declare-fun valid!316 (LongMap!514) Bool)

(assert (=> start!10140 (= res!40469 (valid!316 thiss!992))))

(assert (=> start!10140 e!50275))

(assert (=> start!10140 e!50278))

(assert (=> start!10140 true))

(assert (=> start!10140 e!50284))

(declare-fun b!76990 () Bool)

(assert (=> b!76990 (= e!50289 e!50287)))

(declare-fun res!40470 () Bool)

(assert (=> b!76990 (=> (not res!40470) (not e!50287))))

(assert (=> b!76990 (= res!40470 (and (not (= (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1870 (_keys!3921 (v!2571 (underlying!268 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1168 (ValueCell!905 V!2977) V!2977)

(declare-fun dynLambda!334 (Int (_ BitVec 64)) V!2977)

(assert (=> b!76990 (= lt!35150 (get!1168 (select (arr!1871 (_values!2245 (v!2571 (underlying!268 thiss!992)))) from!355) (dynLambda!334 (defaultEntry!2262 (v!2571 (underlying!268 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!10140 res!40469) b!76981))

(assert (= (and b!76981 res!40473) b!76987))

(assert (= (and b!76987 res!40471) b!76983))

(assert (= (and b!76983 res!40468) b!76977))

(assert (= (and b!76977 res!40472) b!76990))

(assert (= (and b!76990 res!40470) b!76980))

(assert (= (and b!76980 c!11750) b!76972))

(assert (= (and b!76980 (not c!11750)) b!76986))

(assert (= (and b!76980 res!40467) b!76988))

(assert (= (and b!76976 condMapEmpty!3257) mapIsEmpty!3257))

(assert (= (and b!76976 (not condMapEmpty!3257)) mapNonEmpty!3258))

(get-info :version)

(assert (= (and mapNonEmpty!3258 ((_ is ValueCellFull!905) mapValue!3257)) b!76978))

(assert (= (and b!76976 ((_ is ValueCellFull!905) mapDefault!3258)) b!76989))

(assert (= b!76985 b!76976))

(assert (= b!76974 b!76985))

(assert (= b!76979 b!76974))

(assert (= start!10140 b!76979))

(assert (= (and b!76982 condMapEmpty!3258) mapIsEmpty!3258))

(assert (= (and b!76982 (not condMapEmpty!3258)) mapNonEmpty!3257))

(assert (= (and mapNonEmpty!3257 ((_ is ValueCellFull!905) mapValue!3258)) b!76984))

(assert (= (and b!76982 ((_ is ValueCellFull!905) mapDefault!3257)) b!76975))

(assert (= b!76973 b!76982))

(assert (= start!10140 b!76973))

(declare-fun b_lambda!3443 () Bool)

(assert (=> (not b_lambda!3443) (not b!76990)))

(declare-fun t!5113 () Bool)

(declare-fun tb!1585 () Bool)

(assert (=> (and b!76985 (= (defaultEntry!2262 (v!2571 (underlying!268 thiss!992))) (defaultEntry!2262 (v!2571 (underlying!268 thiss!992)))) t!5113) tb!1585))

(declare-fun result!2763 () Bool)

(assert (=> tb!1585 (= result!2763 tp_is_empty!2497)))

(assert (=> b!76990 t!5113))

(declare-fun b_and!4705 () Bool)

(assert (= b_and!4701 (and (=> t!5113 result!2763) b_and!4705)))

(declare-fun tb!1587 () Bool)

(declare-fun t!5115 () Bool)

(assert (=> (and b!76973 (= (defaultEntry!2262 newMap!16) (defaultEntry!2262 (v!2571 (underlying!268 thiss!992)))) t!5115) tb!1587))

(declare-fun result!2767 () Bool)

(assert (= result!2767 result!2763))

(assert (=> b!76990 t!5115))

(declare-fun b_and!4707 () Bool)

(assert (= b_and!4703 (and (=> t!5115 result!2767) b_and!4707)))

(declare-fun m!76825 () Bool)

(assert (=> mapNonEmpty!3257 m!76825))

(declare-fun m!76827 () Bool)

(assert (=> b!76990 m!76827))

(declare-fun m!76829 () Bool)

(assert (=> b!76990 m!76829))

(declare-fun m!76831 () Bool)

(assert (=> b!76990 m!76831))

(assert (=> b!76990 m!76829))

(assert (=> b!76990 m!76831))

(declare-fun m!76833 () Bool)

(assert (=> b!76990 m!76833))

(declare-fun m!76835 () Bool)

(assert (=> mapNonEmpty!3258 m!76835))

(declare-fun m!76837 () Bool)

(assert (=> b!76972 m!76837))

(declare-fun m!76839 () Bool)

(assert (=> b!76972 m!76839))

(assert (=> b!76972 m!76827))

(declare-fun m!76841 () Bool)

(assert (=> b!76972 m!76841))

(assert (=> b!76972 m!76827))

(assert (=> b!76972 m!76827))

(declare-fun m!76843 () Bool)

(assert (=> b!76972 m!76843))

(assert (=> b!76972 m!76827))

(declare-fun m!76845 () Bool)

(assert (=> b!76972 m!76845))

(assert (=> b!76980 m!76827))

(assert (=> b!76980 m!76827))

(declare-fun m!76847 () Bool)

(assert (=> b!76980 m!76847))

(assert (=> b!76980 m!76827))

(declare-fun m!76849 () Bool)

(assert (=> b!76980 m!76849))

(declare-fun m!76851 () Bool)

(assert (=> b!76977 m!76851))

(declare-fun m!76853 () Bool)

(assert (=> b!76977 m!76853))

(declare-fun m!76855 () Bool)

(assert (=> start!10140 m!76855))

(declare-fun m!76857 () Bool)

(assert (=> b!76985 m!76857))

(declare-fun m!76859 () Bool)

(assert (=> b!76985 m!76859))

(declare-fun m!76861 () Bool)

(assert (=> b!76988 m!76861))

(assert (=> b!76988 m!76861))

(declare-fun m!76863 () Bool)

(assert (=> b!76988 m!76863))

(declare-fun m!76865 () Bool)

(assert (=> b!76988 m!76865))

(assert (=> b!76988 m!76827))

(assert (=> b!76988 m!76865))

(declare-fun m!76867 () Bool)

(assert (=> b!76988 m!76867))

(assert (=> b!76988 m!76827))

(declare-fun m!76869 () Bool)

(assert (=> b!76988 m!76869))

(declare-fun m!76871 () Bool)

(assert (=> b!76988 m!76871))

(declare-fun m!76873 () Bool)

(assert (=> b!76973 m!76873))

(declare-fun m!76875 () Bool)

(assert (=> b!76973 m!76875))

(declare-fun m!76877 () Bool)

(assert (=> b!76987 m!76877))

(check-sat (not b!76988) (not b_lambda!3443) (not start!10140) b_and!4707 (not b!76985) tp_is_empty!2497 (not b!76980) (not b!76990) (not b!76972) (not b_next!2163) b_and!4705 (not b!76987) (not mapNonEmpty!3257) (not mapNonEmpty!3258) (not b!76977) (not b!76973) (not b_next!2161))
(check-sat b_and!4705 b_and!4707 (not b_next!2161) (not b_next!2163))
