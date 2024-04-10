; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13684 () Bool)

(assert start!13684)

(declare-fun b!125935 () Bool)

(declare-fun b_free!2849 () Bool)

(declare-fun b_next!2849 () Bool)

(assert (=> b!125935 (= b_free!2849 (not b_next!2849))))

(declare-fun tp!10956 () Bool)

(declare-fun b_and!7751 () Bool)

(assert (=> b!125935 (= tp!10956 b_and!7751)))

(declare-fun b!125945 () Bool)

(declare-fun b_free!2851 () Bool)

(declare-fun b_next!2851 () Bool)

(assert (=> b!125945 (= b_free!2851 (not b_next!2851))))

(declare-fun tp!10953 () Bool)

(declare-fun b_and!7753 () Bool)

(assert (=> b!125945 (= tp!10953 b_and!7753)))

(declare-fun b!125929 () Bool)

(declare-fun e!82278 () Bool)

(declare-fun e!82279 () Bool)

(assert (=> b!125929 (= e!82278 e!82279)))

(declare-fun res!60959 () Bool)

(assert (=> b!125929 (=> (not res!60959) (not e!82279))))

(declare-datatypes ((V!3435 0))(
  ( (V!3436 (val!1465 Int)) )
))
(declare-datatypes ((array!4699 0))(
  ( (array!4700 (arr!2225 (Array (_ BitVec 32) (_ BitVec 64))) (size!2489 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1077 0))(
  ( (ValueCellFull!1077 (v!3123 V!3435)) (EmptyCell!1077) )
))
(declare-datatypes ((array!4701 0))(
  ( (array!4702 (arr!2226 (Array (_ BitVec 32) ValueCell!1077)) (size!2490 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1062 0))(
  ( (LongMapFixedSize!1063 (defaultEntry!2783 Int) (mask!7039 (_ BitVec 32)) (extraKeys!2564 (_ BitVec 32)) (zeroValue!2646 V!3435) (minValue!2646 V!3435) (_size!580 (_ BitVec 32)) (_keys!4516 array!4699) (_values!2766 array!4701) (_vacant!580 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!856 0))(
  ( (Cell!857 (v!3124 LongMapFixedSize!1062)) )
))
(declare-datatypes ((LongMap!856 0))(
  ( (LongMap!857 (underlying!439 Cell!856)) )
))
(declare-fun thiss!992 () LongMap!856)

(declare-datatypes ((tuple2!2576 0))(
  ( (tuple2!2577 (_1!1299 (_ BitVec 64)) (_2!1299 V!3435)) )
))
(declare-datatypes ((List!1698 0))(
  ( (Nil!1695) (Cons!1694 (h!2296 tuple2!2576) (t!6045 List!1698)) )
))
(declare-datatypes ((ListLongMap!1681 0))(
  ( (ListLongMap!1682 (toList!856 List!1698)) )
))
(declare-fun lt!64952 () ListLongMap!1681)

(declare-fun lt!64953 () ListLongMap!1681)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!125929 (= res!60959 (and (= lt!64953 lt!64952) (not (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1062)

(declare-fun map!1387 (LongMapFixedSize!1062) ListLongMap!1681)

(assert (=> b!125929 (= lt!64952 (map!1387 newMap!16))))

(declare-fun getCurrentListMap!536 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) Int) ListLongMap!1681)

(assert (=> b!125929 (= lt!64953 (getCurrentListMap!536 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!125930 () Bool)

(declare-fun e!82286 () Bool)

(declare-fun e!82280 () Bool)

(assert (=> b!125930 (= e!82286 e!82280)))

(declare-fun b!125931 () Bool)

(declare-fun e!82287 () Bool)

(declare-fun e!82285 () Bool)

(declare-fun mapRes!4499 () Bool)

(assert (=> b!125931 (= e!82287 (and e!82285 mapRes!4499))))

(declare-fun condMapEmpty!4500 () Bool)

(declare-fun mapDefault!4500 () ValueCell!1077)

(assert (=> b!125931 (= condMapEmpty!4500 (= (arr!2226 (_values!2766 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4500)))))

(declare-fun b!125932 () Bool)

(declare-fun e!82284 () Bool)

(declare-fun e!82282 () Bool)

(declare-fun mapRes!4500 () Bool)

(assert (=> b!125932 (= e!82284 (and e!82282 mapRes!4500))))

(declare-fun condMapEmpty!4499 () Bool)

(declare-fun mapDefault!4499 () ValueCell!1077)

(assert (=> b!125932 (= condMapEmpty!4499 (= (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4499)))))

(declare-fun b!125933 () Bool)

(declare-fun tp_is_empty!2841 () Bool)

(assert (=> b!125933 (= e!82282 tp_is_empty!2841)))

(declare-fun b!125934 () Bool)

(declare-fun e!82275 () Bool)

(assert (=> b!125934 (= e!82275 e!82286)))

(declare-fun array_inv!1397 (array!4699) Bool)

(declare-fun array_inv!1398 (array!4701) Bool)

(assert (=> b!125935 (= e!82280 (and tp!10956 tp_is_empty!2841 (array_inv!1397 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (array_inv!1398 (_values!2766 (v!3124 (underlying!439 thiss!992)))) e!82284))))

(declare-fun b!125936 () Bool)

(declare-fun e!82288 () Bool)

(assert (=> b!125936 (= e!82288 tp_is_empty!2841)))

(declare-fun b!125937 () Bool)

(declare-fun e!82274 () Bool)

(assert (=> b!125937 (= e!82274 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4500 () Bool)

(declare-fun tp!10955 () Bool)

(assert (=> mapNonEmpty!4500 (= mapRes!4500 (and tp!10955 e!82288))))

(declare-fun mapKey!4499 () (_ BitVec 32))

(declare-fun mapRest!4500 () (Array (_ BitVec 32) ValueCell!1077))

(declare-fun mapValue!4499 () ValueCell!1077)

(assert (=> mapNonEmpty!4500 (= (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (store mapRest!4500 mapKey!4499 mapValue!4499))))

(declare-fun b!125938 () Bool)

(declare-fun res!60963 () Bool)

(assert (=> b!125938 (=> (not res!60963) (not e!82278))))

(assert (=> b!125938 (= res!60963 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7039 newMap!16)) (_size!580 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!125939 () Bool)

(declare-fun res!60962 () Bool)

(declare-fun e!82283 () Bool)

(assert (=> b!125939 (=> (not res!60962) (not e!82283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!125939 (= res!60962 (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun mapIsEmpty!4499 () Bool)

(assert (=> mapIsEmpty!4499 mapRes!4500))

(declare-fun b!125940 () Bool)

(assert (=> b!125940 (= e!82279 e!82283)))

(declare-fun res!60960 () Bool)

(assert (=> b!125940 (=> (not res!60960) (not e!82283))))

(declare-fun contains!877 (ListLongMap!1681 (_ BitVec 64)) Bool)

(assert (=> b!125940 (= res!60960 (contains!877 lt!64952 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2578 0))(
  ( (tuple2!2579 (_1!1300 Bool) (_2!1300 LongMapFixedSize!1062)) )
))
(declare-fun lt!64954 () tuple2!2578)

(declare-fun update!182 (LongMapFixedSize!1062 (_ BitVec 64) V!3435) tuple2!2578)

(declare-fun get!1443 (ValueCell!1077 V!3435) V!3435)

(declare-fun dynLambda!413 (Int (_ BitVec 64)) V!3435)

(assert (=> b!125940 (= lt!64954 (update!182 newMap!16 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!60964 () Bool)

(assert (=> start!13684 (=> (not res!60964) (not e!82278))))

(declare-fun valid!504 (LongMap!856) Bool)

(assert (=> start!13684 (= res!60964 (valid!504 thiss!992))))

(assert (=> start!13684 e!82278))

(assert (=> start!13684 e!82275))

(assert (=> start!13684 true))

(declare-fun e!82281 () Bool)

(assert (=> start!13684 e!82281))

(declare-fun mapNonEmpty!4499 () Bool)

(declare-fun tp!10954 () Bool)

(assert (=> mapNonEmpty!4499 (= mapRes!4499 (and tp!10954 e!82274))))

(declare-fun mapRest!4499 () (Array (_ BitVec 32) ValueCell!1077))

(declare-fun mapValue!4500 () ValueCell!1077)

(declare-fun mapKey!4500 () (_ BitVec 32))

(assert (=> mapNonEmpty!4499 (= (arr!2226 (_values!2766 newMap!16)) (store mapRest!4499 mapKey!4500 mapValue!4500))))

(declare-fun b!125941 () Bool)

(assert (=> b!125941 (= e!82283 (and (= (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7039 (v!3124 (underlying!439 thiss!992))))) (not (= (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!125942 () Bool)

(assert (=> b!125942 (= e!82285 tp_is_empty!2841)))

(declare-fun mapIsEmpty!4500 () Bool)

(assert (=> mapIsEmpty!4500 mapRes!4499))

(declare-fun b!125943 () Bool)

(declare-fun res!60961 () Bool)

(assert (=> b!125943 (=> (not res!60961) (not e!82278))))

(declare-fun valid!505 (LongMapFixedSize!1062) Bool)

(assert (=> b!125943 (= res!60961 (valid!505 newMap!16))))

(declare-fun b!125944 () Bool)

(declare-fun res!60965 () Bool)

(assert (=> b!125944 (=> (not res!60965) (not e!82278))))

(assert (=> b!125944 (= res!60965 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!125945 (= e!82281 (and tp!10953 tp_is_empty!2841 (array_inv!1397 (_keys!4516 newMap!16)) (array_inv!1398 (_values!2766 newMap!16)) e!82287))))

(assert (= (and start!13684 res!60964) b!125944))

(assert (= (and b!125944 res!60965) b!125943))

(assert (= (and b!125943 res!60961) b!125938))

(assert (= (and b!125938 res!60963) b!125929))

(assert (= (and b!125929 res!60959) b!125940))

(assert (= (and b!125940 res!60960) b!125939))

(assert (= (and b!125939 res!60962) b!125941))

(assert (= (and b!125932 condMapEmpty!4499) mapIsEmpty!4499))

(assert (= (and b!125932 (not condMapEmpty!4499)) mapNonEmpty!4500))

(get-info :version)

(assert (= (and mapNonEmpty!4500 ((_ is ValueCellFull!1077) mapValue!4499)) b!125936))

(assert (= (and b!125932 ((_ is ValueCellFull!1077) mapDefault!4499)) b!125933))

(assert (= b!125935 b!125932))

(assert (= b!125930 b!125935))

(assert (= b!125934 b!125930))

(assert (= start!13684 b!125934))

(assert (= (and b!125931 condMapEmpty!4500) mapIsEmpty!4500))

(assert (= (and b!125931 (not condMapEmpty!4500)) mapNonEmpty!4499))

(assert (= (and mapNonEmpty!4499 ((_ is ValueCellFull!1077) mapValue!4500)) b!125937))

(assert (= (and b!125931 ((_ is ValueCellFull!1077) mapDefault!4500)) b!125942))

(assert (= b!125945 b!125931))

(assert (= start!13684 b!125945))

(declare-fun b_lambda!5549 () Bool)

(assert (=> (not b_lambda!5549) (not b!125940)))

(declare-fun t!6042 () Bool)

(declare-fun tb!2309 () Bool)

(assert (=> (and b!125935 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))) t!6042) tb!2309))

(declare-fun result!3833 () Bool)

(assert (=> tb!2309 (= result!3833 tp_is_empty!2841)))

(assert (=> b!125940 t!6042))

(declare-fun b_and!7755 () Bool)

(assert (= b_and!7751 (and (=> t!6042 result!3833) b_and!7755)))

(declare-fun t!6044 () Bool)

(declare-fun tb!2311 () Bool)

(assert (=> (and b!125945 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))) t!6044) tb!2311))

(declare-fun result!3837 () Bool)

(assert (= result!3837 result!3833))

(assert (=> b!125940 t!6044))

(declare-fun b_and!7757 () Bool)

(assert (= b_and!7753 (and (=> t!6044 result!3837) b_and!7757)))

(declare-fun m!146825 () Bool)

(assert (=> start!13684 m!146825))

(declare-fun m!146827 () Bool)

(assert (=> b!125935 m!146827))

(declare-fun m!146829 () Bool)

(assert (=> b!125935 m!146829))

(declare-fun m!146831 () Bool)

(assert (=> mapNonEmpty!4499 m!146831))

(declare-fun m!146833 () Bool)

(assert (=> b!125945 m!146833))

(declare-fun m!146835 () Bool)

(assert (=> b!125945 m!146835))

(declare-fun m!146837 () Bool)

(assert (=> b!125943 m!146837))

(declare-fun m!146839 () Bool)

(assert (=> b!125939 m!146839))

(declare-fun m!146841 () Bool)

(assert (=> b!125940 m!146841))

(declare-fun m!146843 () Bool)

(assert (=> b!125940 m!146843))

(declare-fun m!146845 () Bool)

(assert (=> b!125940 m!146845))

(assert (=> b!125940 m!146843))

(declare-fun m!146847 () Bool)

(assert (=> b!125940 m!146847))

(assert (=> b!125940 m!146845))

(declare-fun m!146849 () Bool)

(assert (=> b!125940 m!146849))

(assert (=> b!125940 m!146841))

(assert (=> b!125940 m!146847))

(assert (=> b!125940 m!146847))

(declare-fun m!146851 () Bool)

(assert (=> b!125940 m!146851))

(assert (=> b!125929 m!146847))

(declare-fun m!146853 () Bool)

(assert (=> b!125929 m!146853))

(declare-fun m!146855 () Bool)

(assert (=> b!125929 m!146855))

(declare-fun m!146857 () Bool)

(assert (=> mapNonEmpty!4500 m!146857))

(check-sat tp_is_empty!2841 b_and!7757 (not start!13684) (not mapNonEmpty!4499) (not b!125929) (not b_next!2851) (not b_lambda!5549) (not b!125935) (not b!125945) b_and!7755 (not mapNonEmpty!4500) (not b!125939) (not b!125943) (not b_next!2849) (not b!125940))
(check-sat b_and!7755 b_and!7757 (not b_next!2849) (not b_next!2851))
(get-model)

(declare-fun b_lambda!5553 () Bool)

(assert (= b_lambda!5549 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5553)))

(check-sat tp_is_empty!2841 b_and!7757 (not start!13684) (not mapNonEmpty!4499) (not b!125929) (not b_next!2851) (not b!125935) (not b!125945) b_and!7755 (not mapNonEmpty!4500) (not b!125939) (not b_lambda!5553) (not b!125943) (not b_next!2849) (not b!125940))
(check-sat b_and!7755 b_and!7757 (not b_next!2849) (not b_next!2851))
(get-model)

(declare-fun d!37927 () Bool)

(assert (=> d!37927 (= (map!1387 newMap!16) (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bs!5218 () Bool)

(assert (= bs!5218 d!37927))

(declare-fun m!146893 () Bool)

(assert (=> bs!5218 m!146893))

(assert (=> b!125929 d!37927))

(declare-fun b!126043 () Bool)

(declare-fun c!22987 () Bool)

(assert (=> b!126043 (= c!22987 (and (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82370 () ListLongMap!1681)

(declare-fun e!82366 () ListLongMap!1681)

(assert (=> b!126043 (= e!82370 e!82366)))

(declare-fun bm!13505 () Bool)

(declare-fun call!13510 () Bool)

(declare-fun lt!65008 () ListLongMap!1681)

(assert (=> bm!13505 (= call!13510 (contains!877 lt!65008 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126044 () Bool)

(declare-fun e!82369 () ListLongMap!1681)

(assert (=> b!126044 (= e!82369 e!82370)))

(declare-fun c!22990 () Bool)

(assert (=> b!126044 (= c!22990 (and (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126045 () Bool)

(declare-datatypes ((Unit!3924 0))(
  ( (Unit!3925) )
))
(declare-fun e!82360 () Unit!3924)

(declare-fun Unit!3926 () Unit!3924)

(assert (=> b!126045 (= e!82360 Unit!3926)))

(declare-fun b!126046 () Bool)

(declare-fun e!82368 () Bool)

(declare-fun e!82363 () Bool)

(assert (=> b!126046 (= e!82368 e!82363)))

(declare-fun res!61011 () Bool)

(assert (=> b!126046 (= res!61011 call!13510)))

(assert (=> b!126046 (=> (not res!61011) (not e!82363))))

(declare-fun b!126047 () Bool)

(declare-fun e!82372 () Bool)

(declare-fun e!82365 () Bool)

(assert (=> b!126047 (= e!82372 e!82365)))

(declare-fun res!61005 () Bool)

(assert (=> b!126047 (=> (not res!61005) (not e!82365))))

(assert (=> b!126047 (= res!61005 (contains!877 lt!65008 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126047 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126048 () Bool)

(assert (=> b!126048 (= e!82368 (not call!13510))))

(declare-fun d!37929 () Bool)

(declare-fun e!82362 () Bool)

(assert (=> d!37929 e!82362))

(declare-fun res!61007 () Bool)

(assert (=> d!37929 (=> (not res!61007) (not e!82362))))

(assert (=> d!37929 (= res!61007 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65017 () ListLongMap!1681)

(assert (=> d!37929 (= lt!65008 lt!65017)))

(declare-fun lt!65023 () Unit!3924)

(assert (=> d!37929 (= lt!65023 e!82360)))

(declare-fun c!22989 () Bool)

(declare-fun e!82361 () Bool)

(assert (=> d!37929 (= c!22989 e!82361)))

(declare-fun res!61009 () Bool)

(assert (=> d!37929 (=> (not res!61009) (not e!82361))))

(assert (=> d!37929 (= res!61009 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!37929 (= lt!65017 e!82369)))

(declare-fun c!22986 () Bool)

(assert (=> d!37929 (= c!22986 (and (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37929 (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!37929 (= (getCurrentListMap!536 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))) lt!65008)))

(declare-fun b!126049 () Bool)

(declare-fun lt!65012 () Unit!3924)

(assert (=> b!126049 (= e!82360 lt!65012)))

(declare-fun lt!65020 () ListLongMap!1681)

(declare-fun getCurrentListMapNoExtraKeys!136 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) Int) ListLongMap!1681)

(assert (=> b!126049 (= lt!65020 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65014 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65027 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65027 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65013 () Unit!3924)

(declare-fun addStillContains!87 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> b!126049 (= lt!65013 (addStillContains!87 lt!65020 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65027))))

(declare-fun +!170 (ListLongMap!1681 tuple2!2576) ListLongMap!1681)

(assert (=> b!126049 (contains!877 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65027)))

(declare-fun lt!65019 () Unit!3924)

(assert (=> b!126049 (= lt!65019 lt!65013)))

(declare-fun lt!65028 () ListLongMap!1681)

(assert (=> b!126049 (= lt!65028 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65025 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65025 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65029 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65015 () Unit!3924)

(declare-fun addApplyDifferent!87 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> b!126049 (= lt!65015 (addApplyDifferent!87 lt!65028 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65029))))

(declare-fun apply!111 (ListLongMap!1681 (_ BitVec 64)) V!3435)

(assert (=> b!126049 (= (apply!111 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65029) (apply!111 lt!65028 lt!65029))))

(declare-fun lt!65011 () Unit!3924)

(assert (=> b!126049 (= lt!65011 lt!65015)))

(declare-fun lt!65021 () ListLongMap!1681)

(assert (=> b!126049 (= lt!65021 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65026 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65018 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65018 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!65010 () Unit!3924)

(assert (=> b!126049 (= lt!65010 (addApplyDifferent!87 lt!65021 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65018))))

(assert (=> b!126049 (= (apply!111 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65018) (apply!111 lt!65021 lt!65018))))

(declare-fun lt!65024 () Unit!3924)

(assert (=> b!126049 (= lt!65024 lt!65010)))

(declare-fun lt!65016 () ListLongMap!1681)

(assert (=> b!126049 (= lt!65016 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun lt!65022 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65009 () (_ BitVec 64))

(assert (=> b!126049 (= lt!65009 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!126049 (= lt!65012 (addApplyDifferent!87 lt!65016 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65009))))

(assert (=> b!126049 (= (apply!111 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65009) (apply!111 lt!65016 lt!65009))))

(declare-fun b!126050 () Bool)

(declare-fun res!61012 () Bool)

(assert (=> b!126050 (=> (not res!61012) (not e!82362))))

(declare-fun e!82367 () Bool)

(assert (=> b!126050 (= res!61012 e!82367)))

(declare-fun c!22988 () Bool)

(assert (=> b!126050 (= c!22988 (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126051 () Bool)

(declare-fun e!82371 () Bool)

(assert (=> b!126051 (= e!82371 (= (apply!111 lt!65008 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126052 () Bool)

(assert (=> b!126052 (= e!82367 e!82371)))

(declare-fun res!61010 () Bool)

(declare-fun call!13511 () Bool)

(assert (=> b!126052 (= res!61010 call!13511)))

(assert (=> b!126052 (=> (not res!61010) (not e!82371))))

(declare-fun b!126053 () Bool)

(assert (=> b!126053 (= e!82363 (= (apply!111 lt!65008 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun bm!13506 () Bool)

(declare-fun call!13508 () ListLongMap!1681)

(declare-fun call!13514 () ListLongMap!1681)

(assert (=> bm!13506 (= call!13508 call!13514)))

(declare-fun b!126054 () Bool)

(assert (=> b!126054 (= e!82367 (not call!13511))))

(declare-fun call!13513 () ListLongMap!1681)

(declare-fun call!13512 () ListLongMap!1681)

(declare-fun bm!13507 () Bool)

(assert (=> bm!13507 (= call!13513 (+!170 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun bm!13508 () Bool)

(assert (=> bm!13508 (= call!13511 (contains!877 lt!65008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126055 () Bool)

(declare-fun call!13509 () ListLongMap!1681)

(assert (=> b!126055 (= e!82366 call!13509)))

(declare-fun b!126056 () Bool)

(assert (=> b!126056 (= e!82370 call!13509)))

(declare-fun b!126057 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!126057 (= e!82361 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!13509 () Bool)

(assert (=> bm!13509 (= call!13509 call!13513)))

(declare-fun b!126058 () Bool)

(assert (=> b!126058 (= e!82362 e!82368)))

(declare-fun c!22991 () Bool)

(assert (=> b!126058 (= c!22991 (not (= (bvand (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126059 () Bool)

(assert (=> b!126059 (= e!82365 (= (apply!111 lt!65008 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126059 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126059 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126060 () Bool)

(declare-fun res!61006 () Bool)

(assert (=> b!126060 (=> (not res!61006) (not e!82362))))

(assert (=> b!126060 (= res!61006 e!82372)))

(declare-fun res!61013 () Bool)

(assert (=> b!126060 (=> res!61013 e!82372)))

(declare-fun e!82364 () Bool)

(assert (=> b!126060 (= res!61013 (not e!82364))))

(declare-fun res!61008 () Bool)

(assert (=> b!126060 (=> (not res!61008) (not e!82364))))

(assert (=> b!126060 (= res!61008 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126061 () Bool)

(assert (=> b!126061 (= e!82364 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126062 () Bool)

(assert (=> b!126062 (= e!82369 (+!170 call!13513 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126063 () Bool)

(assert (=> b!126063 (= e!82366 call!13512)))

(declare-fun bm!13510 () Bool)

(assert (=> bm!13510 (= call!13514 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun bm!13511 () Bool)

(assert (=> bm!13511 (= call!13512 call!13508)))

(assert (= (and d!37929 c!22986) b!126062))

(assert (= (and d!37929 (not c!22986)) b!126044))

(assert (= (and b!126044 c!22990) b!126056))

(assert (= (and b!126044 (not c!22990)) b!126043))

(assert (= (and b!126043 c!22987) b!126055))

(assert (= (and b!126043 (not c!22987)) b!126063))

(assert (= (or b!126055 b!126063) bm!13511))

(assert (= (or b!126056 bm!13511) bm!13506))

(assert (= (or b!126056 b!126055) bm!13509))

(assert (= (or b!126062 bm!13506) bm!13510))

(assert (= (or b!126062 bm!13509) bm!13507))

(assert (= (and d!37929 res!61009) b!126057))

(assert (= (and d!37929 c!22989) b!126049))

(assert (= (and d!37929 (not c!22989)) b!126045))

(assert (= (and d!37929 res!61007) b!126060))

(assert (= (and b!126060 res!61008) b!126061))

(assert (= (and b!126060 (not res!61013)) b!126047))

(assert (= (and b!126047 res!61005) b!126059))

(assert (= (and b!126060 res!61006) b!126050))

(assert (= (and b!126050 c!22988) b!126052))

(assert (= (and b!126050 (not c!22988)) b!126054))

(assert (= (and b!126052 res!61010) b!126051))

(assert (= (or b!126052 b!126054) bm!13508))

(assert (= (and b!126050 res!61012) b!126058))

(assert (= (and b!126058 c!22991) b!126046))

(assert (= (and b!126058 (not c!22991)) b!126048))

(assert (= (and b!126046 res!61011) b!126053))

(assert (= (or b!126046 b!126048) bm!13505))

(declare-fun b_lambda!5555 () Bool)

(assert (=> (not b_lambda!5555) (not b!126059)))

(assert (=> b!126059 t!6042))

(declare-fun b_and!7767 () Bool)

(assert (= b_and!7755 (and (=> t!6042 result!3833) b_and!7767)))

(assert (=> b!126059 t!6044))

(declare-fun b_and!7769 () Bool)

(assert (= b_and!7757 (and (=> t!6044 result!3837) b_and!7769)))

(declare-fun m!146895 () Bool)

(assert (=> b!126047 m!146895))

(assert (=> b!126047 m!146895))

(declare-fun m!146897 () Bool)

(assert (=> b!126047 m!146897))

(assert (=> d!37929 m!146839))

(declare-fun m!146899 () Bool)

(assert (=> b!126049 m!146899))

(declare-fun m!146901 () Bool)

(assert (=> b!126049 m!146901))

(assert (=> b!126049 m!146901))

(declare-fun m!146903 () Bool)

(assert (=> b!126049 m!146903))

(declare-fun m!146905 () Bool)

(assert (=> b!126049 m!146905))

(declare-fun m!146907 () Bool)

(assert (=> b!126049 m!146907))

(declare-fun m!146909 () Bool)

(assert (=> b!126049 m!146909))

(declare-fun m!146911 () Bool)

(assert (=> b!126049 m!146911))

(declare-fun m!146913 () Bool)

(assert (=> b!126049 m!146913))

(assert (=> b!126049 m!146905))

(declare-fun m!146915 () Bool)

(assert (=> b!126049 m!146915))

(declare-fun m!146917 () Bool)

(assert (=> b!126049 m!146917))

(declare-fun m!146919 () Bool)

(assert (=> b!126049 m!146919))

(declare-fun m!146921 () Bool)

(assert (=> b!126049 m!146921))

(declare-fun m!146923 () Bool)

(assert (=> b!126049 m!146923))

(assert (=> b!126049 m!146895))

(assert (=> b!126049 m!146907))

(declare-fun m!146925 () Bool)

(assert (=> b!126049 m!146925))

(declare-fun m!146927 () Bool)

(assert (=> b!126049 m!146927))

(declare-fun m!146929 () Bool)

(assert (=> b!126049 m!146929))

(assert (=> b!126049 m!146919))

(declare-fun m!146931 () Bool)

(assert (=> bm!13505 m!146931))

(assert (=> b!126061 m!146895))

(assert (=> b!126061 m!146895))

(declare-fun m!146933 () Bool)

(assert (=> b!126061 m!146933))

(declare-fun m!146935 () Bool)

(assert (=> b!126053 m!146935))

(assert (=> b!126057 m!146895))

(assert (=> b!126057 m!146895))

(assert (=> b!126057 m!146933))

(declare-fun m!146937 () Bool)

(assert (=> bm!13507 m!146937))

(declare-fun m!146939 () Bool)

(assert (=> b!126062 m!146939))

(assert (=> bm!13510 m!146927))

(assert (=> b!126059 m!146895))

(assert (=> b!126059 m!146843))

(declare-fun m!146941 () Bool)

(assert (=> b!126059 m!146941))

(assert (=> b!126059 m!146843))

(declare-fun m!146943 () Bool)

(assert (=> b!126059 m!146943))

(assert (=> b!126059 m!146941))

(assert (=> b!126059 m!146895))

(declare-fun m!146945 () Bool)

(assert (=> b!126059 m!146945))

(declare-fun m!146947 () Bool)

(assert (=> b!126051 m!146947))

(declare-fun m!146949 () Bool)

(assert (=> bm!13508 m!146949))

(assert (=> b!125929 d!37929))

(declare-fun d!37931 () Bool)

(declare-fun e!82378 () Bool)

(assert (=> d!37931 e!82378))

(declare-fun res!61016 () Bool)

(assert (=> d!37931 (=> res!61016 e!82378)))

(declare-fun lt!65039 () Bool)

(assert (=> d!37931 (= res!61016 (not lt!65039))))

(declare-fun lt!65038 () Bool)

(assert (=> d!37931 (= lt!65039 lt!65038)))

(declare-fun lt!65041 () Unit!3924)

(declare-fun e!82377 () Unit!3924)

(assert (=> d!37931 (= lt!65041 e!82377)))

(declare-fun c!22994 () Bool)

(assert (=> d!37931 (= c!22994 lt!65038)))

(declare-fun containsKey!171 (List!1698 (_ BitVec 64)) Bool)

(assert (=> d!37931 (= lt!65038 (containsKey!171 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!37931 (= (contains!877 lt!64952 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65039)))

(declare-fun b!126070 () Bool)

(declare-fun lt!65040 () Unit!3924)

(assert (=> b!126070 (= e!82377 lt!65040)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!119 (List!1698 (_ BitVec 64)) Unit!3924)

(assert (=> b!126070 (= lt!65040 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-datatypes ((Option!173 0))(
  ( (Some!172 (v!3128 V!3435)) (None!171) )
))
(declare-fun isDefined!120 (Option!173) Bool)

(declare-fun getValueByKey!167 (List!1698 (_ BitVec 64)) Option!173)

(assert (=> b!126070 (isDefined!120 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126071 () Bool)

(declare-fun Unit!3927 () Unit!3924)

(assert (=> b!126071 (= e!82377 Unit!3927)))

(declare-fun b!126072 () Bool)

(assert (=> b!126072 (= e!82378 (isDefined!120 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!37931 c!22994) b!126070))

(assert (= (and d!37931 (not c!22994)) b!126071))

(assert (= (and d!37931 (not res!61016)) b!126072))

(assert (=> d!37931 m!146847))

(declare-fun m!146951 () Bool)

(assert (=> d!37931 m!146951))

(assert (=> b!126070 m!146847))

(declare-fun m!146953 () Bool)

(assert (=> b!126070 m!146953))

(assert (=> b!126070 m!146847))

(declare-fun m!146955 () Bool)

(assert (=> b!126070 m!146955))

(assert (=> b!126070 m!146955))

(declare-fun m!146957 () Bool)

(assert (=> b!126070 m!146957))

(assert (=> b!126072 m!146847))

(assert (=> b!126072 m!146955))

(assert (=> b!126072 m!146955))

(assert (=> b!126072 m!146957))

(assert (=> b!125940 d!37931))

(declare-fun b!126153 () Bool)

(declare-fun e!82437 () Bool)

(declare-fun call!13570 () Bool)

(assert (=> b!126153 (= e!82437 (not call!13570))))

(declare-fun bm!13560 () Bool)

(declare-fun call!13571 () ListLongMap!1681)

(declare-fun lt!65097 () tuple2!2578)

(assert (=> bm!13560 (= call!13571 (map!1387 (_2!1300 lt!65097)))))

(declare-fun call!13578 () ListLongMap!1681)

(declare-fun b!126154 () Bool)

(declare-fun e!82440 () Bool)

(assert (=> b!126154 (= e!82440 (= call!13571 (+!170 call!13578 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13561 () Bool)

(declare-datatypes ((SeekEntryResult!270 0))(
  ( (MissingZero!270 (index!3235 (_ BitVec 32))) (Found!270 (index!3236 (_ BitVec 32))) (Intermediate!270 (undefined!1082 Bool) (index!3237 (_ BitVec 32)) (x!14963 (_ BitVec 32))) (Undefined!270) (MissingVacant!270 (index!3238 (_ BitVec 32))) )
))
(declare-fun call!13582 () SeekEntryResult!270)

(declare-fun call!13566 () SeekEntryResult!270)

(assert (=> bm!13561 (= call!13582 call!13566)))

(declare-fun b!126155 () Bool)

(declare-fun e!82428 () tuple2!2578)

(declare-fun e!82421 () tuple2!2578)

(assert (=> b!126155 (= e!82428 e!82421)))

(declare-fun lt!65119 () SeekEntryResult!270)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4699 (_ BitVec 32)) SeekEntryResult!270)

(assert (=> b!126155 (= lt!65119 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun c!23029 () Bool)

(assert (=> b!126155 (= c!23029 ((_ is Undefined!270) lt!65119))))

(declare-fun b!126156 () Bool)

(declare-fun e!82422 () tuple2!2578)

(assert (=> b!126156 (= e!82428 e!82422)))

(declare-fun c!23024 () Bool)

(assert (=> b!126156 (= c!23024 (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126157 () Bool)

(declare-fun e!82439 () Unit!3924)

(declare-fun lt!65105 () Unit!3924)

(assert (=> b!126157 (= e!82439 lt!65105)))

(declare-fun call!13569 () Unit!3924)

(assert (=> b!126157 (= lt!65105 call!13569)))

(declare-fun lt!65120 () SeekEntryResult!270)

(assert (=> b!126157 (= lt!65120 call!13582)))

(declare-fun c!23031 () Bool)

(assert (=> b!126157 (= c!23031 ((_ is MissingZero!270) lt!65120))))

(declare-fun e!82424 () Bool)

(assert (=> b!126157 e!82424))

(declare-fun bm!13562 () Bool)

(declare-fun call!13564 () Bool)

(declare-fun call!13563 () Bool)

(assert (=> bm!13562 (= call!13564 call!13563)))

(declare-fun e!82423 () ListLongMap!1681)

(declare-fun call!13580 () ListLongMap!1681)

(declare-fun c!23022 () Bool)

(declare-fun bm!13563 () Bool)

(assert (=> bm!13563 (= call!13580 (+!170 e!82423 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23032 () Bool)

(assert (=> bm!13563 (= c!23032 c!23022)))

(declare-fun e!82431 () Bool)

(declare-fun b!126158 () Bool)

(declare-fun lt!65100 () SeekEntryResult!270)

(assert (=> b!126158 (= e!82431 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65100)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun bm!13564 () Bool)

(declare-fun call!13573 () Bool)

(assert (=> bm!13564 (= call!13573 call!13563)))

(declare-fun b!126159 () Bool)

(declare-fun res!61049 () Bool)

(declare-fun e!82425 () Bool)

(assert (=> b!126159 (=> (not res!61049) (not e!82425))))

(declare-fun call!13575 () Bool)

(assert (=> b!126159 (= res!61049 call!13575)))

(declare-fun e!82436 () Bool)

(assert (=> b!126159 (= e!82436 e!82425)))

(declare-fun bm!13565 () Bool)

(declare-fun call!13583 () ListLongMap!1681)

(declare-fun call!13576 () ListLongMap!1681)

(assert (=> bm!13565 (= call!13583 call!13576)))

(declare-fun b!126160 () Bool)

(assert (=> b!126160 (= e!82423 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun b!126161 () Bool)

(declare-fun e!82429 () Unit!3924)

(declare-fun Unit!3928 () Unit!3924)

(assert (=> b!126161 (= e!82429 Unit!3928)))

(declare-fun lt!65102 () Unit!3924)

(assert (=> b!126161 (= lt!65102 call!13569)))

(declare-fun lt!65103 () SeekEntryResult!270)

(declare-fun call!13577 () SeekEntryResult!270)

(assert (=> b!126161 (= lt!65103 call!13577)))

(declare-fun c!23028 () Bool)

(assert (=> b!126161 (= c!23028 ((_ is MissingZero!270) lt!65103))))

(assert (=> b!126161 e!82436))

(declare-fun lt!65107 () Unit!3924)

(assert (=> b!126161 (= lt!65107 lt!65102)))

(assert (=> b!126161 false))

(declare-fun bm!13566 () Bool)

(assert (=> bm!13566 (= call!13566 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun bm!13567 () Bool)

(declare-fun call!13567 () Bool)

(assert (=> bm!13567 (= call!13570 call!13567)))

(declare-fun b!126162 () Bool)

(declare-fun lt!65117 () Unit!3924)

(assert (=> b!126162 (= e!82429 lt!65117)))

(declare-fun call!13581 () Unit!3924)

(assert (=> b!126162 (= lt!65117 call!13581)))

(declare-fun lt!65108 () SeekEntryResult!270)

(assert (=> b!126162 (= lt!65108 call!13577)))

(declare-fun res!61053 () Bool)

(assert (=> b!126162 (= res!61053 ((_ is Found!270) lt!65108))))

(declare-fun e!82426 () Bool)

(assert (=> b!126162 (=> (not res!61053) (not e!82426))))

(assert (=> b!126162 e!82426))

(declare-fun bm!13568 () Bool)

(assert (=> bm!13568 (= call!13575 call!13564)))

(declare-fun b!126163 () Bool)

(declare-fun res!61045 () Bool)

(assert (=> b!126163 (= res!61045 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82441 () Bool)

(assert (=> b!126163 (=> (not res!61045) (not e!82441))))

(declare-fun lt!65113 () (_ BitVec 32))

(declare-fun bm!13569 () Bool)

(declare-fun lt!65106 () (_ BitVec 32))

(declare-fun call!13585 () ListLongMap!1681)

(assert (=> bm!13569 (= call!13585 (getCurrentListMap!536 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun c!23030 () Bool)

(declare-fun bm!13570 () Bool)

(declare-fun c!23026 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13570 (= call!13563 (inRange!0 (ite c!23029 (ite c!23026 (index!3236 lt!65100) (ite c!23031 (index!3235 lt!65120) (index!3238 lt!65120))) (ite c!23030 (index!3236 lt!65108) (ite c!23028 (index!3235 lt!65103) (index!3238 lt!65103)))) (mask!7039 newMap!16)))))

(declare-fun b!126164 () Bool)

(declare-fun lt!65096 () Unit!3924)

(declare-fun lt!65098 () Unit!3924)

(assert (=> b!126164 (= lt!65096 lt!65098)))

(declare-fun call!13572 () Bool)

(assert (=> b!126164 call!13572))

(declare-fun lt!65109 () array!4701)

(declare-fun lemmaValidKeyInArrayIsInListMap!117 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) Int) Unit!3924)

(assert (=> b!126164 (= lt!65098 (lemmaValidKeyInArrayIsInListMap!117 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (defaultEntry!2783 newMap!16)))))

(assert (=> b!126164 (= lt!65109 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))))

(declare-fun lt!65118 () Unit!3924)

(declare-fun lt!65122 () Unit!3924)

(assert (=> b!126164 (= lt!65118 lt!65122)))

(assert (=> b!126164 (= call!13580 call!13585)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) (_ BitVec 64) V!3435 Int) Unit!3924)

(assert (=> b!126164 (= lt!65122 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65101 () Unit!3924)

(assert (=> b!126164 (= lt!65101 e!82429)))

(assert (=> b!126164 (= c!23030 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82432 () tuple2!2578)

(assert (=> b!126164 (= e!82432 (tuple2!2579 true (LongMapFixedSize!1063 (defaultEntry!2783 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (_size!580 newMap!16) (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (_vacant!580 newMap!16))))))

(declare-fun bm!13571 () Bool)

(declare-fun call!13579 () Bool)

(assert (=> bm!13571 (= call!13579 call!13573)))

(declare-fun b!126165 () Bool)

(declare-fun res!61057 () Bool)

(assert (=> b!126165 (=> (not res!61057) (not e!82425))))

(assert (=> b!126165 (= res!61057 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126166 () Bool)

(declare-fun lt!65121 () Unit!3924)

(assert (=> b!126166 (= lt!65121 e!82439)))

(assert (=> b!126166 (= c!23026 call!13572)))

(assert (=> b!126166 (= e!82421 (tuple2!2579 false newMap!16))))

(declare-fun b!126167 () Bool)

(declare-fun e!82434 () Bool)

(assert (=> b!126167 (= e!82434 e!82440)))

(declare-fun res!61056 () Bool)

(assert (=> b!126167 (= res!61056 (contains!877 call!13571 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126167 (=> (not res!61056) (not e!82440))))

(declare-fun b!126168 () Bool)

(declare-fun lt!65112 () tuple2!2578)

(declare-fun call!13574 () tuple2!2578)

(assert (=> b!126168 (= lt!65112 call!13574)))

(assert (=> b!126168 (= e!82432 (tuple2!2579 (_1!1300 lt!65112) (_2!1300 lt!65112)))))

(declare-fun b!126169 () Bool)

(declare-fun call!13586 () Bool)

(assert (=> b!126169 (= e!82425 (not call!13586))))

(declare-fun b!126170 () Bool)

(declare-fun c!23021 () Bool)

(assert (=> b!126170 (= c!23021 ((_ is MissingVacant!270) lt!65103))))

(declare-fun e!82430 () Bool)

(assert (=> b!126170 (= e!82436 e!82430)))

(declare-fun b!126171 () Bool)

(declare-fun c!23033 () Bool)

(assert (=> b!126171 (= c!23033 ((_ is MissingVacant!270) lt!65120))))

(declare-fun e!82433 () Bool)

(assert (=> b!126171 (= e!82424 e!82433)))

(declare-fun b!126172 () Bool)

(declare-fun lt!65110 () Unit!3924)

(declare-fun lt!65116 () Unit!3924)

(assert (=> b!126172 (= lt!65110 lt!65116)))

(declare-fun call!13584 () ListLongMap!1681)

(declare-fun call!13568 () ListLongMap!1681)

(assert (=> b!126172 (= call!13584 call!13568)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!56 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 V!3435 Int) Unit!3924)

(assert (=> b!126172 (= lt!65116 (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65113 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) (defaultEntry!2783 newMap!16)))))

(assert (=> b!126172 (= lt!65113 (bvor (extraKeys!2564 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!126172 (= e!82422 (tuple2!2579 true (LongMapFixedSize!1063 (defaultEntry!2783 newMap!16) (mask!7039 newMap!16) (bvor (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) (_size!580 newMap!16) (_keys!4516 newMap!16) (_values!2766 newMap!16) (_vacant!580 newMap!16))))))

(declare-fun b!126173 () Bool)

(declare-fun res!61047 () Bool)

(assert (=> b!126173 (= res!61047 call!13564)))

(assert (=> b!126173 (=> (not res!61047) (not e!82426))))

(declare-fun b!126174 () Bool)

(declare-fun e!82438 () tuple2!2578)

(declare-fun lt!65115 () tuple2!2578)

(assert (=> b!126174 (= e!82438 (tuple2!2579 (_1!1300 lt!65115) (_2!1300 lt!65115)))))

(assert (=> b!126174 (= lt!65115 call!13574)))

(declare-fun bm!13572 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) Int) Unit!3924)

(assert (=> bm!13572 (= call!13581 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(declare-fun b!126175 () Bool)

(assert (=> b!126175 (= e!82433 e!82437)))

(declare-fun res!61046 () Bool)

(assert (=> b!126175 (= res!61046 call!13579)))

(assert (=> b!126175 (=> (not res!61046) (not e!82437))))

(declare-fun b!126176 () Bool)

(assert (=> b!126176 (= e!82430 e!82441)))

(declare-fun res!61054 () Bool)

(assert (=> b!126176 (= res!61054 call!13575)))

(assert (=> b!126176 (=> (not res!61054) (not e!82441))))

(declare-fun b!126177 () Bool)

(declare-fun res!61048 () Bool)

(assert (=> b!126177 (= res!61048 call!13573)))

(assert (=> b!126177 (=> (not res!61048) (not e!82431))))

(declare-fun bm!13573 () Bool)

(assert (=> bm!13573 (= call!13572 (contains!877 call!13583 (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(declare-fun b!126178 () Bool)

(assert (=> b!126178 (= e!82438 e!82432)))

(declare-fun c!23025 () Bool)

(assert (=> b!126178 (= c!23025 ((_ is MissingZero!270) lt!65119))))

(declare-fun b!126179 () Bool)

(declare-fun res!61050 () Bool)

(declare-fun e!82427 () Bool)

(assert (=> b!126179 (=> (not res!61050) (not e!82427))))

(assert (=> b!126179 (= res!61050 call!13579)))

(assert (=> b!126179 (= e!82424 e!82427)))

(declare-fun bm!13574 () Bool)

(assert (=> bm!13574 (= call!13586 call!13567)))

(declare-fun b!126180 () Bool)

(declare-fun Unit!3929 () Unit!3924)

(assert (=> b!126180 (= e!82439 Unit!3929)))

(declare-fun lt!65114 () Unit!3924)

(assert (=> b!126180 (= lt!65114 call!13581)))

(assert (=> b!126180 (= lt!65100 call!13582)))

(declare-fun res!61052 () Bool)

(assert (=> b!126180 (= res!61052 ((_ is Found!270) lt!65100))))

(assert (=> b!126180 (=> (not res!61052) (not e!82431))))

(assert (=> b!126180 e!82431))

(declare-fun lt!65111 () Unit!3924)

(assert (=> b!126180 (= lt!65111 lt!65114)))

(assert (=> b!126180 false))

(declare-fun b!126181 () Bool)

(declare-fun call!13565 () ListLongMap!1681)

(assert (=> b!126181 (= e!82423 call!13565)))

(declare-fun c!23023 () Bool)

(declare-fun bm!13575 () Bool)

(declare-fun updateHelperNewKey!56 (LongMapFixedSize!1062 (_ BitVec 64) V!3435 (_ BitVec 32)) tuple2!2578)

(assert (=> bm!13575 (= call!13574 (updateHelperNewKey!56 newMap!16 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(declare-fun b!126182 () Bool)

(assert (=> b!126182 (= e!82426 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65108)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun bm!13576 () Bool)

(assert (=> bm!13576 (= call!13576 (getCurrentListMap!536 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun b!126183 () Bool)

(declare-fun res!61058 () Bool)

(assert (=> b!126183 (=> (not res!61058) (not e!82427))))

(assert (=> b!126183 (= res!61058 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65120)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126184 () Bool)

(assert (=> b!126184 (= c!23023 ((_ is MissingVacant!270) lt!65119))))

(assert (=> b!126184 (= e!82421 e!82438)))

(declare-fun bm!13577 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) Int) Unit!3924)

(assert (=> bm!13577 (= call!13569 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13578 () Bool)

(assert (=> bm!13578 (= call!13565 call!13576)))

(declare-fun bm!13579 () Bool)

(assert (=> bm!13579 (= call!13578 (map!1387 newMap!16))))

(declare-fun bm!13580 () Bool)

(assert (=> bm!13580 (= call!13584 call!13580)))

(declare-fun b!126185 () Bool)

(assert (=> b!126185 (= e!82441 (not call!13586))))

(declare-fun b!126186 () Bool)

(declare-fun lt!65099 () Unit!3924)

(declare-fun lt!65104 () Unit!3924)

(assert (=> b!126186 (= lt!65099 lt!65104)))

(assert (=> b!126186 (= call!13584 call!13568)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 V!3435 Int) Unit!3924)

(assert (=> b!126186 (= lt!65104 (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(assert (=> b!126186 (= lt!65106 (bvor (extraKeys!2564 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!126186 (= e!82422 (tuple2!2579 true (LongMapFixedSize!1063 (defaultEntry!2783 newMap!16) (mask!7039 newMap!16) (bvor (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!580 newMap!16) (_keys!4516 newMap!16) (_values!2766 newMap!16) (_vacant!580 newMap!16))))))

(declare-fun b!126187 () Bool)

(declare-fun e!82435 () Bool)

(assert (=> b!126187 (= e!82435 e!82434)))

(declare-fun c!23027 () Bool)

(assert (=> b!126187 (= c!23027 (_1!1300 lt!65097))))

(declare-fun b!126188 () Bool)

(assert (=> b!126188 (= e!82430 ((_ is Undefined!270) lt!65103))))

(declare-fun b!126189 () Bool)

(declare-fun res!61055 () Bool)

(assert (=> b!126189 (= res!61055 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65120)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126189 (=> (not res!61055) (not e!82437))))

(declare-fun b!126190 () Bool)

(assert (=> b!126190 (= e!82427 (not call!13570))))

(declare-fun bm!13581 () Bool)

(assert (=> bm!13581 (= call!13568 call!13585)))

(declare-fun bm!13582 () Bool)

(assert (=> bm!13582 (= call!13577 call!13566)))

(declare-fun b!126191 () Bool)

(assert (=> b!126191 (= e!82434 (= call!13571 call!13578))))

(declare-fun b!126192 () Bool)

(assert (=> b!126192 (= e!82433 ((_ is Undefined!270) lt!65120))))

(declare-fun d!37933 () Bool)

(assert (=> d!37933 e!82435))

(declare-fun res!61051 () Bool)

(assert (=> d!37933 (=> (not res!61051) (not e!82435))))

(assert (=> d!37933 (= res!61051 (valid!505 (_2!1300 lt!65097)))))

(assert (=> d!37933 (= lt!65097 e!82428)))

(assert (=> d!37933 (= c!23022 (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvneg (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!37933 (valid!505 newMap!16)))

(assert (=> d!37933 (= (update!182 newMap!16 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!65097)))

(declare-fun bm!13583 () Bool)

(declare-fun arrayContainsKey!0 (array!4699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13583 (= call!13567 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(assert (= (and d!37933 c!23022) b!126156))

(assert (= (and d!37933 (not c!23022)) b!126155))

(assert (= (and b!126156 c!23024) b!126172))

(assert (= (and b!126156 (not c!23024)) b!126186))

(assert (= (or b!126172 b!126186) bm!13581))

(assert (= (or b!126172 b!126186) bm!13578))

(assert (= (or b!126172 b!126186) bm!13580))

(assert (= (and b!126155 c!23029) b!126166))

(assert (= (and b!126155 (not c!23029)) b!126184))

(assert (= (and b!126166 c!23026) b!126180))

(assert (= (and b!126166 (not c!23026)) b!126157))

(assert (= (and b!126180 res!61052) b!126177))

(assert (= (and b!126177 res!61048) b!126158))

(assert (= (and b!126157 c!23031) b!126179))

(assert (= (and b!126157 (not c!23031)) b!126171))

(assert (= (and b!126179 res!61050) b!126183))

(assert (= (and b!126183 res!61058) b!126190))

(assert (= (and b!126171 c!23033) b!126175))

(assert (= (and b!126171 (not c!23033)) b!126192))

(assert (= (and b!126175 res!61046) b!126189))

(assert (= (and b!126189 res!61055) b!126153))

(assert (= (or b!126179 b!126175) bm!13571))

(assert (= (or b!126190 b!126153) bm!13567))

(assert (= (or b!126177 bm!13571) bm!13564))

(assert (= (or b!126180 b!126157) bm!13561))

(assert (= (and b!126184 c!23023) b!126174))

(assert (= (and b!126184 (not c!23023)) b!126178))

(assert (= (and b!126178 c!23025) b!126168))

(assert (= (and b!126178 (not c!23025)) b!126164))

(assert (= (and b!126164 c!23030) b!126162))

(assert (= (and b!126164 (not c!23030)) b!126161))

(assert (= (and b!126162 res!61053) b!126173))

(assert (= (and b!126173 res!61047) b!126182))

(assert (= (and b!126161 c!23028) b!126159))

(assert (= (and b!126161 (not c!23028)) b!126170))

(assert (= (and b!126159 res!61049) b!126165))

(assert (= (and b!126165 res!61057) b!126169))

(assert (= (and b!126170 c!23021) b!126176))

(assert (= (and b!126170 (not c!23021)) b!126188))

(assert (= (and b!126176 res!61054) b!126163))

(assert (= (and b!126163 res!61045) b!126185))

(assert (= (or b!126159 b!126176) bm!13568))

(assert (= (or b!126169 b!126185) bm!13574))

(assert (= (or b!126173 bm!13568) bm!13562))

(assert (= (or b!126162 b!126161) bm!13582))

(assert (= (or b!126174 b!126168) bm!13575))

(assert (= (or bm!13564 bm!13562) bm!13570))

(assert (= (or b!126157 b!126161) bm!13577))

(assert (= (or b!126166 b!126164) bm!13565))

(assert (= (or bm!13567 bm!13574) bm!13583))

(assert (= (or b!126180 b!126162) bm!13572))

(assert (= (or bm!13561 bm!13582) bm!13566))

(assert (= (or b!126166 b!126164) bm!13573))

(assert (= (or bm!13581 b!126164) bm!13569))

(assert (= (or bm!13578 bm!13565) bm!13576))

(assert (= (or bm!13580 b!126164) bm!13563))

(assert (= (and bm!13563 c!23032) b!126181))

(assert (= (and bm!13563 (not c!23032)) b!126160))

(assert (= (and d!37933 res!61051) b!126187))

(assert (= (and b!126187 c!23027) b!126167))

(assert (= (and b!126187 (not c!23027)) b!126191))

(assert (= (and b!126167 res!61056) b!126154))

(assert (= (or b!126154 b!126191) bm!13579))

(assert (= (or b!126167 b!126154 b!126191) bm!13560))

(declare-fun m!146959 () Bool)

(assert (=> bm!13560 m!146959))

(assert (=> bm!13583 m!146847))

(declare-fun m!146961 () Bool)

(assert (=> bm!13583 m!146961))

(declare-fun m!146963 () Bool)

(assert (=> b!126165 m!146963))

(assert (=> bm!13577 m!146847))

(declare-fun m!146965 () Bool)

(assert (=> bm!13577 m!146965))

(declare-fun m!146967 () Bool)

(assert (=> bm!13569 m!146967))

(declare-fun m!146969 () Bool)

(assert (=> bm!13569 m!146969))

(assert (=> b!126167 m!146847))

(declare-fun m!146971 () Bool)

(assert (=> b!126167 m!146971))

(declare-fun m!146973 () Bool)

(assert (=> b!126182 m!146973))

(assert (=> b!126160 m!146893))

(declare-fun m!146975 () Bool)

(assert (=> d!37933 m!146975))

(assert (=> d!37933 m!146837))

(assert (=> bm!13566 m!146847))

(declare-fun m!146977 () Bool)

(assert (=> bm!13566 m!146977))

(declare-fun m!146979 () Bool)

(assert (=> bm!13570 m!146979))

(assert (=> b!126186 m!146845))

(declare-fun m!146981 () Bool)

(assert (=> b!126186 m!146981))

(assert (=> bm!13575 m!146847))

(assert (=> bm!13575 m!146845))

(declare-fun m!146983 () Bool)

(assert (=> bm!13575 m!146983))

(declare-fun m!146985 () Bool)

(assert (=> b!126189 m!146985))

(assert (=> b!126164 m!146893))

(assert (=> b!126164 m!146847))

(declare-fun m!146987 () Bool)

(assert (=> b!126164 m!146987))

(assert (=> b!126164 m!146847))

(assert (=> b!126164 m!146845))

(declare-fun m!146989 () Bool)

(assert (=> b!126164 m!146989))

(assert (=> b!126164 m!146967))

(declare-fun m!146991 () Bool)

(assert (=> b!126164 m!146991))

(assert (=> b!126164 m!146893))

(declare-fun m!146993 () Bool)

(assert (=> b!126163 m!146993))

(declare-fun m!146995 () Bool)

(assert (=> bm!13576 m!146995))

(declare-fun m!146997 () Bool)

(assert (=> b!126154 m!146997))

(declare-fun m!146999 () Bool)

(assert (=> bm!13563 m!146999))

(assert (=> b!126172 m!146845))

(declare-fun m!147001 () Bool)

(assert (=> b!126172 m!147001))

(declare-fun m!147003 () Bool)

(assert (=> bm!13573 m!147003))

(declare-fun m!147005 () Bool)

(assert (=> bm!13573 m!147005))

(declare-fun m!147007 () Bool)

(assert (=> b!126183 m!147007))

(assert (=> bm!13579 m!146853))

(assert (=> b!126155 m!146847))

(assert (=> b!126155 m!146977))

(assert (=> bm!13572 m!146847))

(declare-fun m!147009 () Bool)

(assert (=> bm!13572 m!147009))

(declare-fun m!147011 () Bool)

(assert (=> b!126158 m!147011))

(assert (=> b!125940 d!37933))

(declare-fun d!37935 () Bool)

(declare-fun c!23036 () Bool)

(assert (=> d!37935 (= c!23036 ((_ is ValueCellFull!1077) (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82444 () V!3435)

(assert (=> d!37935 (= (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82444)))

(declare-fun b!126197 () Bool)

(declare-fun get!1445 (ValueCell!1077 V!3435) V!3435)

(assert (=> b!126197 (= e!82444 (get!1445 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126198 () Bool)

(declare-fun get!1446 (ValueCell!1077 V!3435) V!3435)

(assert (=> b!126198 (= e!82444 (get!1446 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37935 c!23036) b!126197))

(assert (= (and d!37935 (not c!23036)) b!126198))

(assert (=> b!126197 m!146841))

(assert (=> b!126197 m!146843))

(declare-fun m!147013 () Bool)

(assert (=> b!126197 m!147013))

(assert (=> b!126198 m!146841))

(assert (=> b!126198 m!146843))

(declare-fun m!147015 () Bool)

(assert (=> b!126198 m!147015))

(assert (=> b!125940 d!37935))

(declare-fun d!37937 () Bool)

(assert (=> d!37937 (= (array_inv!1397 (_keys!4516 newMap!16)) (bvsge (size!2489 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125945 d!37937))

(declare-fun d!37939 () Bool)

(assert (=> d!37939 (= (array_inv!1398 (_values!2766 newMap!16)) (bvsge (size!2490 (_values!2766 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!125945 d!37939))

(declare-fun d!37941 () Bool)

(assert (=> d!37941 (= (array_inv!1397 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvsge (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!125935 d!37941))

(declare-fun d!37943 () Bool)

(assert (=> d!37943 (= (array_inv!1398 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvsge (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!125935 d!37943))

(declare-fun d!37945 () Bool)

(declare-fun res!61065 () Bool)

(declare-fun e!82447 () Bool)

(assert (=> d!37945 (=> (not res!61065) (not e!82447))))

(declare-fun simpleValid!87 (LongMapFixedSize!1062) Bool)

(assert (=> d!37945 (= res!61065 (simpleValid!87 newMap!16))))

(assert (=> d!37945 (= (valid!505 newMap!16) e!82447)))

(declare-fun b!126205 () Bool)

(declare-fun res!61066 () Bool)

(assert (=> b!126205 (=> (not res!61066) (not e!82447))))

(declare-fun arrayCountValidKeys!0 (array!4699 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!126205 (= res!61066 (= (arrayCountValidKeys!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (_size!580 newMap!16)))))

(declare-fun b!126206 () Bool)

(declare-fun res!61067 () Bool)

(assert (=> b!126206 (=> (not res!61067) (not e!82447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4699 (_ BitVec 32)) Bool)

(assert (=> b!126206 (= res!61067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun b!126207 () Bool)

(declare-datatypes ((List!1700 0))(
  ( (Nil!1697) (Cons!1696 (h!2298 (_ BitVec 64)) (t!6051 List!1700)) )
))
(declare-fun arrayNoDuplicates!0 (array!4699 (_ BitVec 32) List!1700) Bool)

(assert (=> b!126207 (= e!82447 (arrayNoDuplicates!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!37945 res!61065) b!126205))

(assert (= (and b!126205 res!61066) b!126206))

(assert (= (and b!126206 res!61067) b!126207))

(declare-fun m!147017 () Bool)

(assert (=> d!37945 m!147017))

(declare-fun m!147019 () Bool)

(assert (=> b!126205 m!147019))

(declare-fun m!147021 () Bool)

(assert (=> b!126206 m!147021))

(declare-fun m!147023 () Bool)

(assert (=> b!126207 m!147023))

(assert (=> b!125943 d!37945))

(declare-fun d!37947 () Bool)

(assert (=> d!37947 (= (valid!504 thiss!992) (valid!505 (v!3124 (underlying!439 thiss!992))))))

(declare-fun bs!5219 () Bool)

(assert (= bs!5219 d!37947))

(declare-fun m!147025 () Bool)

(assert (=> bs!5219 m!147025))

(assert (=> start!13684 d!37947))

(declare-fun d!37949 () Bool)

(assert (=> d!37949 (= (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992)))) (and (or (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000001111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000011111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000001111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000011111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000001111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000011111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000001111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000011111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000001111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000011111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000001111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000011111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000001111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000011111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000001111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000011111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000111111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00001111111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00011111111111111111111111111111) (= (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!125939 d!37949))

(declare-fun mapIsEmpty!4509 () Bool)

(declare-fun mapRes!4509 () Bool)

(assert (=> mapIsEmpty!4509 mapRes!4509))

(declare-fun condMapEmpty!4509 () Bool)

(declare-fun mapDefault!4509 () ValueCell!1077)

(assert (=> mapNonEmpty!4500 (= condMapEmpty!4509 (= mapRest!4500 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4509)))))

(declare-fun e!82452 () Bool)

(assert (=> mapNonEmpty!4500 (= tp!10955 (and e!82452 mapRes!4509))))

(declare-fun b!126215 () Bool)

(assert (=> b!126215 (= e!82452 tp_is_empty!2841)))

(declare-fun b!126214 () Bool)

(declare-fun e!82453 () Bool)

(assert (=> b!126214 (= e!82453 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4509 () Bool)

(declare-fun tp!10971 () Bool)

(assert (=> mapNonEmpty!4509 (= mapRes!4509 (and tp!10971 e!82453))))

(declare-fun mapRest!4509 () (Array (_ BitVec 32) ValueCell!1077))

(declare-fun mapValue!4509 () ValueCell!1077)

(declare-fun mapKey!4509 () (_ BitVec 32))

(assert (=> mapNonEmpty!4509 (= mapRest!4500 (store mapRest!4509 mapKey!4509 mapValue!4509))))

(assert (= (and mapNonEmpty!4500 condMapEmpty!4509) mapIsEmpty!4509))

(assert (= (and mapNonEmpty!4500 (not condMapEmpty!4509)) mapNonEmpty!4509))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1077) mapValue!4509)) b!126214))

(assert (= (and mapNonEmpty!4500 ((_ is ValueCellFull!1077) mapDefault!4509)) b!126215))

(declare-fun m!147027 () Bool)

(assert (=> mapNonEmpty!4509 m!147027))

(declare-fun mapIsEmpty!4510 () Bool)

(declare-fun mapRes!4510 () Bool)

(assert (=> mapIsEmpty!4510 mapRes!4510))

(declare-fun condMapEmpty!4510 () Bool)

(declare-fun mapDefault!4510 () ValueCell!1077)

(assert (=> mapNonEmpty!4499 (= condMapEmpty!4510 (= mapRest!4499 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4510)))))

(declare-fun e!82454 () Bool)

(assert (=> mapNonEmpty!4499 (= tp!10954 (and e!82454 mapRes!4510))))

(declare-fun b!126217 () Bool)

(assert (=> b!126217 (= e!82454 tp_is_empty!2841)))

(declare-fun b!126216 () Bool)

(declare-fun e!82455 () Bool)

(assert (=> b!126216 (= e!82455 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4510 () Bool)

(declare-fun tp!10972 () Bool)

(assert (=> mapNonEmpty!4510 (= mapRes!4510 (and tp!10972 e!82455))))

(declare-fun mapKey!4510 () (_ BitVec 32))

(declare-fun mapValue!4510 () ValueCell!1077)

(declare-fun mapRest!4510 () (Array (_ BitVec 32) ValueCell!1077))

(assert (=> mapNonEmpty!4510 (= mapRest!4499 (store mapRest!4510 mapKey!4510 mapValue!4510))))

(assert (= (and mapNonEmpty!4499 condMapEmpty!4510) mapIsEmpty!4510))

(assert (= (and mapNonEmpty!4499 (not condMapEmpty!4510)) mapNonEmpty!4510))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1077) mapValue!4510)) b!126216))

(assert (= (and mapNonEmpty!4499 ((_ is ValueCellFull!1077) mapDefault!4510)) b!126217))

(declare-fun m!147029 () Bool)

(assert (=> mapNonEmpty!4510 m!147029))

(declare-fun b_lambda!5557 () Bool)

(assert (= b_lambda!5555 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5557)))

(check-sat (not b!126051) (not b!126197) (not bm!13569) (not d!37933) (not d!37929) (not b!126155) (not b!126072) (not b!126049) (not b_lambda!5553) (not b!126062) (not b!126205) (not b!126059) (not b!126070) (not bm!13508) b_and!7767 tp_is_empty!2841 (not bm!13563) (not b!126053) (not bm!13575) (not bm!13579) (not bm!13507) (not d!37927) (not bm!13570) (not b!126198) (not d!37945) (not b_next!2849) (not d!37931) (not b!126057) b_and!7769 (not bm!13572) (not bm!13566) (not b!126186) (not b!126167) (not bm!13577) (not bm!13510) (not b!126160) (not mapNonEmpty!4510) (not b!126047) (not b!126164) (not bm!13560) (not b_next!2851) (not b_lambda!5557) (not b!126172) (not bm!13505) (not b!126061) (not mapNonEmpty!4509) (not b!126207) (not b!126206) (not b!126154) (not bm!13576) (not bm!13573) (not bm!13583) (not d!37947))
(check-sat b_and!7767 b_and!7769 (not b_next!2849) (not b_next!2851))
(get-model)

(declare-fun d!37951 () Bool)

(declare-fun get!1447 (Option!173) V!3435)

(assert (=> d!37951 (= (apply!111 lt!65008 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1447 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5220 () Bool)

(assert (= bs!5220 d!37951))

(assert (=> bs!5220 m!146895))

(declare-fun m!147031 () Bool)

(assert (=> bs!5220 m!147031))

(assert (=> bs!5220 m!147031))

(declare-fun m!147033 () Bool)

(assert (=> bs!5220 m!147033))

(assert (=> b!126059 d!37951))

(declare-fun d!37953 () Bool)

(declare-fun c!23037 () Bool)

(assert (=> d!37953 (= c!23037 ((_ is ValueCellFull!1077) (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82456 () V!3435)

(assert (=> d!37953 (= (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82456)))

(declare-fun b!126218 () Bool)

(assert (=> b!126218 (= e!82456 (get!1445 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126219 () Bool)

(assert (=> b!126219 (= e!82456 (get!1446 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37953 c!23037) b!126218))

(assert (= (and d!37953 (not c!23037)) b!126219))

(assert (=> b!126218 m!146941))

(assert (=> b!126218 m!146843))

(declare-fun m!147035 () Bool)

(assert (=> b!126218 m!147035))

(assert (=> b!126219 m!146941))

(assert (=> b!126219 m!146843))

(declare-fun m!147037 () Bool)

(assert (=> b!126219 m!147037))

(assert (=> b!126059 d!37953))

(declare-fun b!126228 () Bool)

(declare-fun e!82462 () (_ BitVec 32))

(declare-fun call!13589 () (_ BitVec 32))

(assert (=> b!126228 (= e!82462 call!13589)))

(declare-fun d!37955 () Bool)

(declare-fun lt!65125 () (_ BitVec 32))

(assert (=> d!37955 (and (bvsge lt!65125 #b00000000000000000000000000000000) (bvsle lt!65125 (bvsub (size!2489 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82461 () (_ BitVec 32))

(assert (=> d!37955 (= lt!65125 e!82461)))

(declare-fun c!23043 () Bool)

(assert (=> d!37955 (= c!23043 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!37955 (and (bvsle #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2489 (_keys!4516 newMap!16)) (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!37955 (= (arrayCountValidKeys!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) lt!65125)))

(declare-fun b!126229 () Bool)

(assert (=> b!126229 (= e!82461 #b00000000000000000000000000000000)))

(declare-fun bm!13586 () Bool)

(assert (=> bm!13586 (= call!13589 (arrayCountValidKeys!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126230 () Bool)

(assert (=> b!126230 (= e!82462 (bvadd #b00000000000000000000000000000001 call!13589))))

(declare-fun b!126231 () Bool)

(assert (=> b!126231 (= e!82461 e!82462)))

(declare-fun c!23042 () Bool)

(assert (=> b!126231 (= c!23042 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!37955 c!23043) b!126229))

(assert (= (and d!37955 (not c!23043)) b!126231))

(assert (= (and b!126231 c!23042) b!126230))

(assert (= (and b!126231 (not c!23042)) b!126228))

(assert (= (or b!126230 b!126228) bm!13586))

(declare-fun m!147039 () Bool)

(assert (=> bm!13586 m!147039))

(declare-fun m!147041 () Bool)

(assert (=> b!126231 m!147041))

(assert (=> b!126231 m!147041))

(declare-fun m!147043 () Bool)

(assert (=> b!126231 m!147043))

(assert (=> b!126205 d!37955))

(declare-fun b!126248 () Bool)

(declare-fun e!82474 () Bool)

(declare-fun lt!65130 () SeekEntryResult!270)

(assert (=> b!126248 (= e!82474 ((_ is Undefined!270) lt!65130))))

(declare-fun call!13595 () Bool)

(declare-fun bm!13591 () Bool)

(assert (=> bm!13591 (= call!13595 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126249 () Bool)

(declare-fun e!82473 () Bool)

(declare-fun e!82472 () Bool)

(assert (=> b!126249 (= e!82473 e!82472)))

(declare-fun res!61077 () Bool)

(declare-fun call!13594 () Bool)

(assert (=> b!126249 (= res!61077 call!13594)))

(assert (=> b!126249 (=> (not res!61077) (not e!82472))))

(declare-fun c!23049 () Bool)

(declare-fun bm!13592 () Bool)

(assert (=> bm!13592 (= call!13594 (inRange!0 (ite c!23049 (index!3235 lt!65130) (index!3238 lt!65130)) (mask!7039 newMap!16)))))

(declare-fun b!126250 () Bool)

(assert (=> b!126250 (= e!82473 e!82474)))

(declare-fun c!23048 () Bool)

(assert (=> b!126250 (= c!23048 ((_ is MissingVacant!270) lt!65130))))

(declare-fun b!126251 () Bool)

(declare-fun res!61079 () Bool)

(declare-fun e!82471 () Bool)

(assert (=> b!126251 (=> (not res!61079) (not e!82471))))

(assert (=> b!126251 (= res!61079 call!13594)))

(assert (=> b!126251 (= e!82474 e!82471)))

(declare-fun b!126252 () Bool)

(assert (=> b!126252 (= e!82472 (not call!13595))))

(declare-fun b!126253 () Bool)

(assert (=> b!126253 (and (bvsge (index!3235 lt!65130) #b00000000000000000000000000000000) (bvslt (index!3235 lt!65130) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61076 () Bool)

(assert (=> b!126253 (= res!61076 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65130)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126253 (=> (not res!61076) (not e!82472))))

(declare-fun d!37957 () Bool)

(assert (=> d!37957 e!82473))

(assert (=> d!37957 (= c!23049 ((_ is MissingZero!270) lt!65130))))

(assert (=> d!37957 (= lt!65130 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun lt!65131 () Unit!3924)

(declare-fun choose!760 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) Int) Unit!3924)

(assert (=> d!37957 (= lt!65131 (choose!760 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(assert (=> d!37957 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37957 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)) lt!65131)))

(declare-fun b!126254 () Bool)

(declare-fun res!61078 () Bool)

(assert (=> b!126254 (=> (not res!61078) (not e!82471))))

(assert (=> b!126254 (= res!61078 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65130)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126254 (and (bvsge (index!3238 lt!65130) #b00000000000000000000000000000000) (bvslt (index!3238 lt!65130) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126255 () Bool)

(assert (=> b!126255 (= e!82471 (not call!13595))))

(assert (= (and d!37957 c!23049) b!126249))

(assert (= (and d!37957 (not c!23049)) b!126250))

(assert (= (and b!126249 res!61077) b!126253))

(assert (= (and b!126253 res!61076) b!126252))

(assert (= (and b!126250 c!23048) b!126251))

(assert (= (and b!126250 (not c!23048)) b!126248))

(assert (= (and b!126251 res!61079) b!126254))

(assert (= (and b!126254 res!61078) b!126255))

(assert (= (or b!126249 b!126251) bm!13592))

(assert (= (or b!126252 b!126255) bm!13591))

(declare-fun m!147045 () Bool)

(assert (=> b!126253 m!147045))

(declare-fun m!147047 () Bool)

(assert (=> b!126254 m!147047))

(assert (=> d!37957 m!146847))

(assert (=> d!37957 m!146977))

(assert (=> d!37957 m!146847))

(declare-fun m!147049 () Bool)

(assert (=> d!37957 m!147049))

(declare-fun m!147051 () Bool)

(assert (=> d!37957 m!147051))

(declare-fun m!147053 () Bool)

(assert (=> bm!13592 m!147053))

(assert (=> bm!13591 m!146847))

(assert (=> bm!13591 m!146961))

(assert (=> bm!13577 d!37957))

(declare-fun b!126265 () Bool)

(declare-fun res!61090 () Bool)

(declare-fun e!82477 () Bool)

(assert (=> b!126265 (=> (not res!61090) (not e!82477))))

(declare-fun size!2493 (LongMapFixedSize!1062) (_ BitVec 32))

(assert (=> b!126265 (= res!61090 (bvsge (size!2493 newMap!16) (_size!580 newMap!16)))))

(declare-fun b!126264 () Bool)

(declare-fun res!61091 () Bool)

(assert (=> b!126264 (=> (not res!61091) (not e!82477))))

(assert (=> b!126264 (= res!61091 (and (= (size!2490 (_values!2766 newMap!16)) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001)) (= (size!2489 (_keys!4516 newMap!16)) (size!2490 (_values!2766 newMap!16))) (bvsge (_size!580 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!580 newMap!16) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!37959 () Bool)

(declare-fun res!61089 () Bool)

(assert (=> d!37959 (=> (not res!61089) (not e!82477))))

(assert (=> d!37959 (= res!61089 (validMask!0 (mask!7039 newMap!16)))))

(assert (=> d!37959 (= (simpleValid!87 newMap!16) e!82477)))

(declare-fun b!126266 () Bool)

(declare-fun res!61088 () Bool)

(assert (=> b!126266 (=> (not res!61088) (not e!82477))))

(assert (=> b!126266 (= res!61088 (= (size!2493 newMap!16) (bvadd (_size!580 newMap!16) (bvsdiv (bvadd (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!126267 () Bool)

(assert (=> b!126267 (= e!82477 (and (bvsge (extraKeys!2564 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2564 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!580 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!37959 res!61089) b!126264))

(assert (= (and b!126264 res!61091) b!126265))

(assert (= (and b!126265 res!61090) b!126266))

(assert (= (and b!126266 res!61088) b!126267))

(declare-fun m!147055 () Bool)

(assert (=> b!126265 m!147055))

(assert (=> d!37959 m!147051))

(assert (=> b!126266 m!147055))

(assert (=> d!37945 d!37959))

(declare-fun d!37961 () Bool)

(assert (=> d!37961 (= (get!1445 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3123 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126197 d!37961))

(declare-fun d!37963 () Bool)

(declare-fun e!82479 () Bool)

(assert (=> d!37963 e!82479))

(declare-fun res!61092 () Bool)

(assert (=> d!37963 (=> res!61092 e!82479)))

(declare-fun lt!65133 () Bool)

(assert (=> d!37963 (= res!61092 (not lt!65133))))

(declare-fun lt!65132 () Bool)

(assert (=> d!37963 (= lt!65133 lt!65132)))

(declare-fun lt!65135 () Unit!3924)

(declare-fun e!82478 () Unit!3924)

(assert (=> d!37963 (= lt!65135 e!82478)))

(declare-fun c!23050 () Bool)

(assert (=> d!37963 (= c!23050 lt!65132)))

(assert (=> d!37963 (= lt!65132 (containsKey!171 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37963 (= (contains!877 lt!65008 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65133)))

(declare-fun b!126268 () Bool)

(declare-fun lt!65134 () Unit!3924)

(assert (=> b!126268 (= e!82478 lt!65134)))

(assert (=> b!126268 (= lt!65134 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126268 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126269 () Bool)

(declare-fun Unit!3930 () Unit!3924)

(assert (=> b!126269 (= e!82478 Unit!3930)))

(declare-fun b!126270 () Bool)

(assert (=> b!126270 (= e!82479 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37963 c!23050) b!126268))

(assert (= (and d!37963 (not c!23050)) b!126269))

(assert (= (and d!37963 (not res!61092)) b!126270))

(declare-fun m!147057 () Bool)

(assert (=> d!37963 m!147057))

(declare-fun m!147059 () Bool)

(assert (=> b!126268 m!147059))

(declare-fun m!147061 () Bool)

(assert (=> b!126268 m!147061))

(assert (=> b!126268 m!147061))

(declare-fun m!147063 () Bool)

(assert (=> b!126268 m!147063))

(assert (=> b!126270 m!147061))

(assert (=> b!126270 m!147061))

(assert (=> b!126270 m!147063))

(assert (=> bm!13505 d!37963))

(declare-fun d!37965 () Bool)

(declare-fun e!82482 () Bool)

(assert (=> d!37965 e!82482))

(declare-fun res!61097 () Bool)

(assert (=> d!37965 (=> (not res!61097) (not e!82482))))

(declare-fun lt!65146 () ListLongMap!1681)

(assert (=> d!37965 (= res!61097 (contains!877 lt!65146 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65144 () List!1698)

(assert (=> d!37965 (= lt!65146 (ListLongMap!1682 lt!65144))))

(declare-fun lt!65145 () Unit!3924)

(declare-fun lt!65147 () Unit!3924)

(assert (=> d!37965 (= lt!65145 lt!65147)))

(assert (=> d!37965 (= (getValueByKey!167 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!82 (List!1698 (_ BitVec 64) V!3435) Unit!3924)

(assert (=> d!37965 (= lt!65147 (lemmaContainsTupThenGetReturnValue!82 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!85 (List!1698 (_ BitVec 64) V!3435) List!1698)

(assert (=> d!37965 (= lt!65144 (insertStrictlySorted!85 (toList!856 e!82423) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!37965 (= (+!170 e!82423 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65146)))

(declare-fun b!126275 () Bool)

(declare-fun res!61098 () Bool)

(assert (=> b!126275 (=> (not res!61098) (not e!82482))))

(assert (=> b!126275 (= res!61098 (= (getValueByKey!167 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126276 () Bool)

(declare-fun contains!879 (List!1698 tuple2!2576) Bool)

(assert (=> b!126276 (= e!82482 (contains!879 (toList!856 lt!65146) (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!37965 res!61097) b!126275))

(assert (= (and b!126275 res!61098) b!126276))

(declare-fun m!147065 () Bool)

(assert (=> d!37965 m!147065))

(declare-fun m!147067 () Bool)

(assert (=> d!37965 m!147067))

(declare-fun m!147069 () Bool)

(assert (=> d!37965 m!147069))

(declare-fun m!147071 () Bool)

(assert (=> d!37965 m!147071))

(declare-fun m!147073 () Bool)

(assert (=> b!126275 m!147073))

(declare-fun m!147075 () Bool)

(assert (=> b!126276 m!147075))

(assert (=> bm!13563 d!37965))

(declare-fun d!37967 () Bool)

(assert (=> d!37967 (= (get!1446 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126198 d!37967))

(declare-fun d!37969 () Bool)

(declare-fun isEmpty!396 (Option!173) Bool)

(assert (=> d!37969 (= (isDefined!120 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!396 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5221 () Bool)

(assert (= bs!5221 d!37969))

(assert (=> bs!5221 m!146955))

(declare-fun m!147077 () Bool)

(assert (=> bs!5221 m!147077))

(assert (=> b!126072 d!37969))

(declare-fun c!23055 () Bool)

(declare-fun d!37971 () Bool)

(assert (=> d!37971 (= c!23055 (and ((_ is Cons!1694) (toList!856 lt!64952)) (= (_1!1299 (h!2296 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun e!82487 () Option!173)

(assert (=> d!37971 (= (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82487)))

(declare-fun b!126286 () Bool)

(declare-fun e!82488 () Option!173)

(assert (=> b!126286 (= e!82487 e!82488)))

(declare-fun c!23056 () Bool)

(assert (=> b!126286 (= c!23056 (and ((_ is Cons!1694) (toList!856 lt!64952)) (not (= (_1!1299 (h!2296 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun b!126288 () Bool)

(assert (=> b!126288 (= e!82488 None!171)))

(declare-fun b!126287 () Bool)

(assert (=> b!126287 (= e!82488 (getValueByKey!167 (t!6045 (toList!856 lt!64952)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126285 () Bool)

(assert (=> b!126285 (= e!82487 (Some!172 (_2!1299 (h!2296 (toList!856 lt!64952)))))))

(assert (= (and d!37971 c!23055) b!126285))

(assert (= (and d!37971 (not c!23055)) b!126286))

(assert (= (and b!126286 c!23056) b!126287))

(assert (= (and b!126286 (not c!23056)) b!126288))

(assert (=> b!126287 m!146847))

(declare-fun m!147079 () Bool)

(assert (=> b!126287 m!147079))

(assert (=> b!126072 d!37971))

(declare-fun b!126297 () Bool)

(declare-fun e!82497 () Bool)

(declare-fun e!82496 () Bool)

(assert (=> b!126297 (= e!82497 e!82496)))

(declare-fun lt!65154 () (_ BitVec 64))

(assert (=> b!126297 (= lt!65154 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65155 () Unit!3924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4699 (_ BitVec 64) (_ BitVec 32)) Unit!3924)

(assert (=> b!126297 (= lt!65155 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000))))

(assert (=> b!126297 (arrayContainsKey!0 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000)))

(declare-fun lt!65156 () Unit!3924)

(assert (=> b!126297 (= lt!65156 lt!65155)))

(declare-fun res!61103 () Bool)

(assert (=> b!126297 (= res!61103 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (_keys!4516 newMap!16) (mask!7039 newMap!16)) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!126297 (=> (not res!61103) (not e!82496))))

(declare-fun b!126298 () Bool)

(declare-fun e!82495 () Bool)

(assert (=> b!126298 (= e!82495 e!82497)))

(declare-fun c!23059 () Bool)

(assert (=> b!126298 (= c!23059 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13595 () Bool)

(declare-fun call!13598 () Bool)

(assert (=> bm!13595 (= call!13598 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun b!126299 () Bool)

(assert (=> b!126299 (= e!82496 call!13598)))

(declare-fun d!37973 () Bool)

(declare-fun res!61104 () Bool)

(assert (=> d!37973 (=> res!61104 e!82495)))

(assert (=> d!37973 (= res!61104 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!37973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 newMap!16) (mask!7039 newMap!16)) e!82495)))

(declare-fun b!126300 () Bool)

(assert (=> b!126300 (= e!82497 call!13598)))

(assert (= (and d!37973 (not res!61104)) b!126298))

(assert (= (and b!126298 c!23059) b!126297))

(assert (= (and b!126298 (not c!23059)) b!126300))

(assert (= (and b!126297 res!61103) b!126299))

(assert (= (or b!126299 b!126300) bm!13595))

(assert (=> b!126297 m!147041))

(declare-fun m!147081 () Bool)

(assert (=> b!126297 m!147081))

(declare-fun m!147083 () Bool)

(assert (=> b!126297 m!147083))

(assert (=> b!126297 m!147041))

(declare-fun m!147085 () Bool)

(assert (=> b!126297 m!147085))

(assert (=> b!126298 m!147041))

(assert (=> b!126298 m!147041))

(assert (=> b!126298 m!147043))

(declare-fun m!147087 () Bool)

(assert (=> bm!13595 m!147087))

(assert (=> b!126206 d!37973))

(declare-fun d!37975 () Bool)

(assert (=> d!37975 (= (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126057 d!37975))

(assert (=> d!37929 d!37949))

(declare-fun b!126313 () Bool)

(declare-fun e!82505 () SeekEntryResult!270)

(declare-fun e!82504 () SeekEntryResult!270)

(assert (=> b!126313 (= e!82505 e!82504)))

(declare-fun lt!65163 () (_ BitVec 64))

(declare-fun lt!65165 () SeekEntryResult!270)

(assert (=> b!126313 (= lt!65163 (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65165)))))

(declare-fun c!23066 () Bool)

(assert (=> b!126313 (= c!23066 (= lt!65163 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126314 () Bool)

(assert (=> b!126314 (= e!82505 Undefined!270)))

(declare-fun b!126315 () Bool)

(declare-fun c!23067 () Bool)

(assert (=> b!126315 (= c!23067 (= lt!65163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82506 () SeekEntryResult!270)

(assert (=> b!126315 (= e!82504 e!82506)))

(declare-fun b!126316 () Bool)

(assert (=> b!126316 (= e!82506 (MissingZero!270 (index!3237 lt!65165)))))

(declare-fun b!126317 () Bool)

(assert (=> b!126317 (= e!82504 (Found!270 (index!3237 lt!65165)))))

(declare-fun b!126318 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4699 (_ BitVec 32)) SeekEntryResult!270)

(assert (=> b!126318 (= e!82506 (seekKeyOrZeroReturnVacant!0 (x!14963 lt!65165) (index!3237 lt!65165) (index!3237 lt!65165) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun lt!65164 () SeekEntryResult!270)

(declare-fun d!37977 () Bool)

(assert (=> d!37977 (and (or ((_ is Undefined!270) lt!65164) (not ((_ is Found!270) lt!65164)) (and (bvsge (index!3236 lt!65164) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65164) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65164) ((_ is Found!270) lt!65164) (not ((_ is MissingZero!270) lt!65164)) (and (bvsge (index!3235 lt!65164) #b00000000000000000000000000000000) (bvslt (index!3235 lt!65164) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65164) ((_ is Found!270) lt!65164) ((_ is MissingZero!270) lt!65164) (not ((_ is MissingVacant!270) lt!65164)) (and (bvsge (index!3238 lt!65164) #b00000000000000000000000000000000) (bvslt (index!3238 lt!65164) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65164) (ite ((_ is Found!270) lt!65164) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65164)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite ((_ is MissingZero!270) lt!65164) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65164)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!270) lt!65164) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65164)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37977 (= lt!65164 e!82505)))

(declare-fun c!23068 () Bool)

(assert (=> d!37977 (= c!23068 (and ((_ is Intermediate!270) lt!65165) (undefined!1082 lt!65165)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4699 (_ BitVec 32)) SeekEntryResult!270)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!37977 (= lt!65165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(assert (=> d!37977 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37977 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)) lt!65164)))

(assert (= (and d!37977 c!23068) b!126314))

(assert (= (and d!37977 (not c!23068)) b!126313))

(assert (= (and b!126313 c!23066) b!126317))

(assert (= (and b!126313 (not c!23066)) b!126315))

(assert (= (and b!126315 c!23067) b!126316))

(assert (= (and b!126315 (not c!23067)) b!126318))

(declare-fun m!147089 () Bool)

(assert (=> b!126313 m!147089))

(assert (=> b!126318 m!146847))

(declare-fun m!147091 () Bool)

(assert (=> b!126318 m!147091))

(declare-fun m!147093 () Bool)

(assert (=> d!37977 m!147093))

(declare-fun m!147095 () Bool)

(assert (=> d!37977 m!147095))

(declare-fun m!147097 () Bool)

(assert (=> d!37977 m!147097))

(assert (=> d!37977 m!146847))

(declare-fun m!147099 () Bool)

(assert (=> d!37977 m!147099))

(declare-fun m!147101 () Bool)

(assert (=> d!37977 m!147101))

(assert (=> d!37977 m!147051))

(assert (=> d!37977 m!146847))

(assert (=> d!37977 m!147097))

(assert (=> b!126155 d!37977))

(declare-fun b!126319 () Bool)

(declare-fun c!23070 () Bool)

(assert (=> b!126319 (= c!23070 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82517 () ListLongMap!1681)

(declare-fun e!82513 () ListLongMap!1681)

(assert (=> b!126319 (= e!82517 e!82513)))

(declare-fun bm!13596 () Bool)

(declare-fun call!13601 () Bool)

(declare-fun lt!65166 () ListLongMap!1681)

(assert (=> bm!13596 (= call!13601 (contains!877 lt!65166 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126320 () Bool)

(declare-fun e!82516 () ListLongMap!1681)

(assert (=> b!126320 (= e!82516 e!82517)))

(declare-fun c!23073 () Bool)

(assert (=> b!126320 (= c!23073 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126321 () Bool)

(declare-fun e!82507 () Unit!3924)

(declare-fun Unit!3931 () Unit!3924)

(assert (=> b!126321 (= e!82507 Unit!3931)))

(declare-fun b!126322 () Bool)

(declare-fun e!82515 () Bool)

(declare-fun e!82510 () Bool)

(assert (=> b!126322 (= e!82515 e!82510)))

(declare-fun res!61111 () Bool)

(assert (=> b!126322 (= res!61111 call!13601)))

(assert (=> b!126322 (=> (not res!61111) (not e!82510))))

(declare-fun b!126323 () Bool)

(declare-fun e!82519 () Bool)

(declare-fun e!82512 () Bool)

(assert (=> b!126323 (= e!82519 e!82512)))

(declare-fun res!61105 () Bool)

(assert (=> b!126323 (=> (not res!61105) (not e!82512))))

(assert (=> b!126323 (= res!61105 (contains!877 lt!65166 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126324 () Bool)

(assert (=> b!126324 (= e!82515 (not call!13601))))

(declare-fun d!37979 () Bool)

(declare-fun e!82509 () Bool)

(assert (=> d!37979 e!82509))

(declare-fun res!61107 () Bool)

(assert (=> d!37979 (=> (not res!61107) (not e!82509))))

(assert (=> d!37979 (= res!61107 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65175 () ListLongMap!1681)

(assert (=> d!37979 (= lt!65166 lt!65175)))

(declare-fun lt!65181 () Unit!3924)

(assert (=> d!37979 (= lt!65181 e!82507)))

(declare-fun c!23072 () Bool)

(declare-fun e!82508 () Bool)

(assert (=> d!37979 (= c!23072 e!82508)))

(declare-fun res!61109 () Bool)

(assert (=> d!37979 (=> (not res!61109) (not e!82508))))

(assert (=> d!37979 (= res!61109 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!37979 (= lt!65175 e!82516)))

(declare-fun c!23069 () Bool)

(assert (=> d!37979 (= c!23069 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37979 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37979 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65166)))

(declare-fun b!126325 () Bool)

(declare-fun lt!65170 () Unit!3924)

(assert (=> b!126325 (= e!82507 lt!65170)))

(declare-fun lt!65178 () ListLongMap!1681)

(assert (=> b!126325 (= lt!65178 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65172 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65185 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65185 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65171 () Unit!3924)

(assert (=> b!126325 (= lt!65171 (addStillContains!87 lt!65178 lt!65172 (zeroValue!2646 newMap!16) lt!65185))))

(assert (=> b!126325 (contains!877 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) lt!65185)))

(declare-fun lt!65177 () Unit!3924)

(assert (=> b!126325 (= lt!65177 lt!65171)))

(declare-fun lt!65186 () ListLongMap!1681)

(assert (=> b!126325 (= lt!65186 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65183 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65183 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65187 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65187 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65173 () Unit!3924)

(assert (=> b!126325 (= lt!65173 (addApplyDifferent!87 lt!65186 lt!65183 (minValue!2646 newMap!16) lt!65187))))

(assert (=> b!126325 (= (apply!111 (+!170 lt!65186 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) lt!65187) (apply!111 lt!65186 lt!65187))))

(declare-fun lt!65169 () Unit!3924)

(assert (=> b!126325 (= lt!65169 lt!65173)))

(declare-fun lt!65179 () ListLongMap!1681)

(assert (=> b!126325 (= lt!65179 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65184 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65176 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65176 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65168 () Unit!3924)

(assert (=> b!126325 (= lt!65168 (addApplyDifferent!87 lt!65179 lt!65184 (zeroValue!2646 newMap!16) lt!65176))))

(assert (=> b!126325 (= (apply!111 (+!170 lt!65179 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) lt!65176) (apply!111 lt!65179 lt!65176))))

(declare-fun lt!65182 () Unit!3924)

(assert (=> b!126325 (= lt!65182 lt!65168)))

(declare-fun lt!65174 () ListLongMap!1681)

(assert (=> b!126325 (= lt!65174 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65180 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65180 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65167 () (_ BitVec 64))

(assert (=> b!126325 (= lt!65167 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126325 (= lt!65170 (addApplyDifferent!87 lt!65174 lt!65180 (minValue!2646 newMap!16) lt!65167))))

(assert (=> b!126325 (= (apply!111 (+!170 lt!65174 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) lt!65167) (apply!111 lt!65174 lt!65167))))

(declare-fun b!126326 () Bool)

(declare-fun res!61112 () Bool)

(assert (=> b!126326 (=> (not res!61112) (not e!82509))))

(declare-fun e!82514 () Bool)

(assert (=> b!126326 (= res!61112 e!82514)))

(declare-fun c!23071 () Bool)

(assert (=> b!126326 (= c!23071 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126327 () Bool)

(declare-fun e!82518 () Bool)

(assert (=> b!126327 (= e!82518 (= (apply!111 lt!65166 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!126328 () Bool)

(assert (=> b!126328 (= e!82514 e!82518)))

(declare-fun res!61110 () Bool)

(declare-fun call!13602 () Bool)

(assert (=> b!126328 (= res!61110 call!13602)))

(assert (=> b!126328 (=> (not res!61110) (not e!82518))))

(declare-fun b!126329 () Bool)

(assert (=> b!126329 (= e!82510 (= (apply!111 lt!65166 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13597 () Bool)

(declare-fun call!13599 () ListLongMap!1681)

(declare-fun call!13605 () ListLongMap!1681)

(assert (=> bm!13597 (= call!13599 call!13605)))

(declare-fun b!126330 () Bool)

(assert (=> b!126330 (= e!82514 (not call!13602))))

(declare-fun call!13603 () ListLongMap!1681)

(declare-fun bm!13598 () Bool)

(declare-fun call!13604 () ListLongMap!1681)

(assert (=> bm!13598 (= call!13604 (+!170 (ite c!23069 call!13605 (ite c!23073 call!13599 call!13603)) (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13599 () Bool)

(assert (=> bm!13599 (= call!13602 (contains!877 lt!65166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126331 () Bool)

(declare-fun call!13600 () ListLongMap!1681)

(assert (=> b!126331 (= e!82513 call!13600)))

(declare-fun b!126332 () Bool)

(assert (=> b!126332 (= e!82517 call!13600)))

(declare-fun b!126333 () Bool)

(assert (=> b!126333 (= e!82508 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13600 () Bool)

(assert (=> bm!13600 (= call!13600 call!13604)))

(declare-fun b!126334 () Bool)

(assert (=> b!126334 (= e!82509 e!82515)))

(declare-fun c!23074 () Bool)

(assert (=> b!126334 (= c!23074 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126335 () Bool)

(assert (=> b!126335 (= e!82512 (= (apply!111 lt!65166 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109))))))

(assert (=> b!126335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126336 () Bool)

(declare-fun res!61106 () Bool)

(assert (=> b!126336 (=> (not res!61106) (not e!82509))))

(assert (=> b!126336 (= res!61106 e!82519)))

(declare-fun res!61113 () Bool)

(assert (=> b!126336 (=> res!61113 e!82519)))

(declare-fun e!82511 () Bool)

(assert (=> b!126336 (= res!61113 (not e!82511))))

(declare-fun res!61108 () Bool)

(assert (=> b!126336 (=> (not res!61108) (not e!82511))))

(assert (=> b!126336 (= res!61108 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126337 () Bool)

(assert (=> b!126337 (= e!82511 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126338 () Bool)

(assert (=> b!126338 (= e!82516 (+!170 call!13604 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126339 () Bool)

(assert (=> b!126339 (= e!82513 call!13603)))

(declare-fun bm!13601 () Bool)

(assert (=> bm!13601 (= call!13605 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13602 () Bool)

(assert (=> bm!13602 (= call!13603 call!13599)))

(assert (= (and d!37979 c!23069) b!126338))

(assert (= (and d!37979 (not c!23069)) b!126320))

(assert (= (and b!126320 c!23073) b!126332))

(assert (= (and b!126320 (not c!23073)) b!126319))

(assert (= (and b!126319 c!23070) b!126331))

(assert (= (and b!126319 (not c!23070)) b!126339))

(assert (= (or b!126331 b!126339) bm!13602))

(assert (= (or b!126332 bm!13602) bm!13597))

(assert (= (or b!126332 b!126331) bm!13600))

(assert (= (or b!126338 bm!13597) bm!13601))

(assert (= (or b!126338 bm!13600) bm!13598))

(assert (= (and d!37979 res!61109) b!126333))

(assert (= (and d!37979 c!23072) b!126325))

(assert (= (and d!37979 (not c!23072)) b!126321))

(assert (= (and d!37979 res!61107) b!126336))

(assert (= (and b!126336 res!61108) b!126337))

(assert (= (and b!126336 (not res!61113)) b!126323))

(assert (= (and b!126323 res!61105) b!126335))

(assert (= (and b!126336 res!61106) b!126326))

(assert (= (and b!126326 c!23071) b!126328))

(assert (= (and b!126326 (not c!23071)) b!126330))

(assert (= (and b!126328 res!61110) b!126327))

(assert (= (or b!126328 b!126330) bm!13599))

(assert (= (and b!126326 res!61112) b!126334))

(assert (= (and b!126334 c!23074) b!126322))

(assert (= (and b!126334 (not c!23074)) b!126324))

(assert (= (and b!126322 res!61111) b!126329))

(assert (= (or b!126322 b!126324) bm!13596))

(declare-fun b_lambda!5559 () Bool)

(assert (=> (not b_lambda!5559) (not b!126335)))

(declare-fun t!6053 () Bool)

(declare-fun tb!2317 () Bool)

(assert (=> (and b!125935 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16)) t!6053) tb!2317))

(declare-fun result!3847 () Bool)

(assert (=> tb!2317 (= result!3847 tp_is_empty!2841)))

(assert (=> b!126335 t!6053))

(declare-fun b_and!7771 () Bool)

(assert (= b_and!7767 (and (=> t!6053 result!3847) b_and!7771)))

(declare-fun t!6055 () Bool)

(declare-fun tb!2319 () Bool)

(assert (=> (and b!125945 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 newMap!16)) t!6055) tb!2319))

(declare-fun result!3849 () Bool)

(assert (= result!3849 result!3847))

(assert (=> b!126335 t!6055))

(declare-fun b_and!7773 () Bool)

(assert (= b_and!7769 (and (=> t!6055 result!3849) b_and!7773)))

(assert (=> b!126323 m!147041))

(assert (=> b!126323 m!147041))

(declare-fun m!147103 () Bool)

(assert (=> b!126323 m!147103))

(assert (=> d!37979 m!147051))

(declare-fun m!147105 () Bool)

(assert (=> b!126325 m!147105))

(declare-fun m!147107 () Bool)

(assert (=> b!126325 m!147107))

(assert (=> b!126325 m!147107))

(declare-fun m!147109 () Bool)

(assert (=> b!126325 m!147109))

(declare-fun m!147111 () Bool)

(assert (=> b!126325 m!147111))

(declare-fun m!147113 () Bool)

(assert (=> b!126325 m!147113))

(declare-fun m!147115 () Bool)

(assert (=> b!126325 m!147115))

(declare-fun m!147117 () Bool)

(assert (=> b!126325 m!147117))

(declare-fun m!147119 () Bool)

(assert (=> b!126325 m!147119))

(assert (=> b!126325 m!147111))

(declare-fun m!147121 () Bool)

(assert (=> b!126325 m!147121))

(declare-fun m!147123 () Bool)

(assert (=> b!126325 m!147123))

(declare-fun m!147125 () Bool)

(assert (=> b!126325 m!147125))

(declare-fun m!147127 () Bool)

(assert (=> b!126325 m!147127))

(declare-fun m!147129 () Bool)

(assert (=> b!126325 m!147129))

(assert (=> b!126325 m!147041))

(assert (=> b!126325 m!147113))

(declare-fun m!147131 () Bool)

(assert (=> b!126325 m!147131))

(declare-fun m!147133 () Bool)

(assert (=> b!126325 m!147133))

(declare-fun m!147135 () Bool)

(assert (=> b!126325 m!147135))

(assert (=> b!126325 m!147125))

(declare-fun m!147137 () Bool)

(assert (=> bm!13596 m!147137))

(assert (=> b!126337 m!147041))

(assert (=> b!126337 m!147041))

(assert (=> b!126337 m!147043))

(declare-fun m!147139 () Bool)

(assert (=> b!126329 m!147139))

(assert (=> b!126333 m!147041))

(assert (=> b!126333 m!147041))

(assert (=> b!126333 m!147043))

(declare-fun m!147141 () Bool)

(assert (=> bm!13598 m!147141))

(declare-fun m!147143 () Bool)

(assert (=> b!126338 m!147143))

(assert (=> bm!13601 m!147133))

(assert (=> b!126335 m!147041))

(declare-fun m!147145 () Bool)

(assert (=> b!126335 m!147145))

(declare-fun m!147147 () Bool)

(assert (=> b!126335 m!147147))

(assert (=> b!126335 m!147145))

(declare-fun m!147149 () Bool)

(assert (=> b!126335 m!147149))

(assert (=> b!126335 m!147147))

(assert (=> b!126335 m!147041))

(declare-fun m!147151 () Bool)

(assert (=> b!126335 m!147151))

(declare-fun m!147153 () Bool)

(assert (=> b!126327 m!147153))

(declare-fun m!147155 () Bool)

(assert (=> bm!13599 m!147155))

(assert (=> bm!13576 d!37979))

(declare-fun d!37981 () Bool)

(assert (=> d!37981 (isDefined!120 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65190 () Unit!3924)

(declare-fun choose!761 (List!1698 (_ BitVec 64)) Unit!3924)

(assert (=> d!37981 (= lt!65190 (choose!761 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82522 () Bool)

(assert (=> d!37981 e!82522))

(declare-fun res!61116 () Bool)

(assert (=> d!37981 (=> (not res!61116) (not e!82522))))

(declare-fun isStrictlySorted!317 (List!1698) Bool)

(assert (=> d!37981 (= res!61116 (isStrictlySorted!317 (toList!856 lt!64952)))))

(assert (=> d!37981 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65190)))

(declare-fun b!126342 () Bool)

(assert (=> b!126342 (= e!82522 (containsKey!171 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!37981 res!61116) b!126342))

(assert (=> d!37981 m!146847))

(assert (=> d!37981 m!146955))

(assert (=> d!37981 m!146955))

(assert (=> d!37981 m!146957))

(assert (=> d!37981 m!146847))

(declare-fun m!147157 () Bool)

(assert (=> d!37981 m!147157))

(declare-fun m!147159 () Bool)

(assert (=> d!37981 m!147159))

(assert (=> b!126342 m!146847))

(assert (=> b!126342 m!146951))

(assert (=> b!126070 d!37981))

(assert (=> b!126070 d!37969))

(assert (=> b!126070 d!37971))

(declare-fun d!37983 () Bool)

(declare-fun e!82524 () Bool)

(assert (=> d!37983 e!82524))

(declare-fun res!61117 () Bool)

(assert (=> d!37983 (=> res!61117 e!82524)))

(declare-fun lt!65192 () Bool)

(assert (=> d!37983 (= res!61117 (not lt!65192))))

(declare-fun lt!65191 () Bool)

(assert (=> d!37983 (= lt!65192 lt!65191)))

(declare-fun lt!65194 () Unit!3924)

(declare-fun e!82523 () Unit!3924)

(assert (=> d!37983 (= lt!65194 e!82523)))

(declare-fun c!23075 () Bool)

(assert (=> d!37983 (= c!23075 lt!65191)))

(assert (=> d!37983 (= lt!65191 (containsKey!171 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!37983 (= (contains!877 call!13571 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65192)))

(declare-fun b!126343 () Bool)

(declare-fun lt!65193 () Unit!3924)

(assert (=> b!126343 (= e!82523 lt!65193)))

(assert (=> b!126343 (= lt!65193 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126343 (isDefined!120 (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126344 () Bool)

(declare-fun Unit!3932 () Unit!3924)

(assert (=> b!126344 (= e!82523 Unit!3932)))

(declare-fun b!126345 () Bool)

(assert (=> b!126345 (= e!82524 (isDefined!120 (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!37983 c!23075) b!126343))

(assert (= (and d!37983 (not c!23075)) b!126344))

(assert (= (and d!37983 (not res!61117)) b!126345))

(assert (=> d!37983 m!146847))

(declare-fun m!147161 () Bool)

(assert (=> d!37983 m!147161))

(assert (=> b!126343 m!146847))

(declare-fun m!147163 () Bool)

(assert (=> b!126343 m!147163))

(assert (=> b!126343 m!146847))

(declare-fun m!147165 () Bool)

(assert (=> b!126343 m!147165))

(assert (=> b!126343 m!147165))

(declare-fun m!147167 () Bool)

(assert (=> b!126343 m!147167))

(assert (=> b!126345 m!146847))

(assert (=> b!126345 m!147165))

(assert (=> b!126345 m!147165))

(assert (=> b!126345 m!147167))

(assert (=> b!126167 d!37983))

(declare-fun d!37985 () Bool)

(assert (=> d!37985 (= (map!1387 (_2!1300 lt!65097)) (getCurrentListMap!536 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun bs!5222 () Bool)

(assert (= bs!5222 d!37985))

(declare-fun m!147169 () Bool)

(assert (=> bs!5222 m!147169))

(assert (=> bm!13560 d!37985))

(declare-fun b!126380 () Bool)

(declare-fun res!61136 () Bool)

(declare-fun lt!65270 () SeekEntryResult!270)

(assert (=> b!126380 (= res!61136 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82544 () Bool)

(assert (=> b!126380 (=> (not res!61136) (not e!82544))))

(declare-fun b!126381 () Bool)

(declare-fun e!82542 () Bool)

(assert (=> b!126381 (= e!82542 e!82544)))

(declare-fun res!61141 () Bool)

(declare-fun call!13616 () Bool)

(assert (=> b!126381 (= res!61141 call!13616)))

(assert (=> b!126381 (=> (not res!61141) (not e!82544))))

(declare-fun b!126382 () Bool)

(declare-fun e!82546 () Unit!3924)

(declare-fun Unit!3933 () Unit!3924)

(assert (=> b!126382 (= e!82546 Unit!3933)))

(declare-fun bm!13611 () Bool)

(declare-fun call!13615 () SeekEntryResult!270)

(assert (=> bm!13611 (= call!13615 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun c!23084 () Bool)

(declare-fun lt!65258 () SeekEntryResult!270)

(declare-fun c!23086 () Bool)

(declare-fun bm!13612 () Bool)

(declare-fun call!13617 () Bool)

(assert (=> bm!13612 (= call!13617 (inRange!0 (ite c!23086 (index!3236 lt!65258) (ite c!23084 (index!3235 lt!65270) (index!3238 lt!65270))) (mask!7039 newMap!16)))))

(declare-fun b!126383 () Bool)

(declare-fun call!13614 () Bool)

(assert (=> b!126383 (= e!82544 (not call!13614))))

(declare-fun b!126384 () Bool)

(declare-fun e!82547 () Unit!3924)

(declare-fun Unit!3934 () Unit!3924)

(assert (=> b!126384 (= e!82547 Unit!3934)))

(declare-fun lt!65259 () Unit!3924)

(assert (=> b!126384 (= lt!65259 (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(assert (=> b!126384 (= lt!65258 call!13615)))

(declare-fun res!61144 () Bool)

(assert (=> b!126384 (= res!61144 ((_ is Found!270) lt!65258))))

(declare-fun e!82545 () Bool)

(assert (=> b!126384 (=> (not res!61144) (not e!82545))))

(assert (=> b!126384 e!82545))

(declare-fun lt!65266 () Unit!3924)

(assert (=> b!126384 (= lt!65266 lt!65259)))

(assert (=> b!126384 false))

(declare-fun b!126385 () Bool)

(declare-fun Unit!3935 () Unit!3924)

(assert (=> b!126385 (= e!82546 Unit!3935)))

(declare-fun lt!65283 () Unit!3924)

(declare-fun lemmaArrayContainsKeyThenInListMap!37 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) (_ BitVec 32) Int) Unit!3924)

(assert (=> b!126385 (= lt!65283 (lemmaArrayContainsKeyThenInListMap!37 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(assert (=> b!126385 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))

(declare-fun lt!65282 () Unit!3924)

(assert (=> b!126385 (= lt!65282 lt!65283)))

(assert (=> b!126385 false))

(declare-fun d!37987 () Bool)

(declare-fun e!82541 () Bool)

(assert (=> d!37987 e!82541))

(declare-fun res!61140 () Bool)

(assert (=> d!37987 (=> (not res!61140) (not e!82541))))

(declare-fun lt!65284 () tuple2!2578)

(assert (=> d!37987 (= res!61140 (_1!1300 lt!65284))))

(assert (=> d!37987 (= lt!65284 (tuple2!2579 true (LongMapFixedSize!1063 (defaultEntry!2783 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (bvadd (_size!580 newMap!16) #b00000000000000000000000000000001) (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (_vacant!580 newMap!16))))))

(declare-fun lt!65261 () Unit!3924)

(declare-fun lt!65269 () Unit!3924)

(assert (=> d!37987 (= lt!65261 lt!65269)))

(declare-fun lt!65264 () array!4699)

(declare-fun lt!65278 () array!4701)

(assert (=> d!37987 (contains!877 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(assert (=> d!37987 (= lt!65269 (lemmaValidKeyInArrayIsInListMap!117 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (defaultEntry!2783 newMap!16)))))

(assert (=> d!37987 (= lt!65278 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))))

(assert (=> d!37987 (= lt!65264 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun lt!65279 () Unit!3924)

(declare-fun lt!65274 () Unit!3924)

(assert (=> d!37987 (= lt!65279 lt!65274)))

(declare-fun lt!65267 () array!4699)

(assert (=> d!37987 (= (arrayCountValidKeys!0 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4699 (_ BitVec 32)) Unit!3924)

(assert (=> d!37987 (= lt!65274 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(assert (=> d!37987 (= lt!65267 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun lt!65281 () Unit!3924)

(declare-fun lt!65280 () Unit!3924)

(assert (=> d!37987 (= lt!65281 lt!65280)))

(declare-fun lt!65275 () array!4699)

(assert (=> d!37987 (arrayContainsKey!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!37987 (= lt!65280 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(assert (=> d!37987 (= lt!65275 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun lt!65255 () Unit!3924)

(declare-fun lt!65271 () Unit!3924)

(assert (=> d!37987 (= lt!65255 lt!65271)))

(assert (=> d!37987 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!37 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) (_ BitVec 64) V!3435 Int) Unit!3924)

(assert (=> d!37987 (= lt!65271 (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65262 () Unit!3924)

(declare-fun lt!65276 () Unit!3924)

(assert (=> d!37987 (= lt!65262 lt!65276)))

(assert (=> d!37987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (mask!7039 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4699 (_ BitVec 32) (_ BitVec 32)) Unit!3924)

(assert (=> d!37987 (= lt!65276 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (mask!7039 newMap!16)))))

(declare-fun lt!65265 () Unit!3924)

(declare-fun lt!65277 () Unit!3924)

(assert (=> d!37987 (= lt!65265 lt!65277)))

(assert (=> d!37987 (= (arrayCountValidKeys!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4699 (_ BitVec 32) (_ BitVec 64)) Unit!3924)

(assert (=> d!37987 (= lt!65277 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65268 () Unit!3924)

(declare-fun lt!65256 () Unit!3924)

(assert (=> d!37987 (= lt!65268 lt!65256)))

(declare-fun lt!65260 () List!1700)

(declare-fun lt!65263 () (_ BitVec 32))

(assert (=> d!37987 (arrayNoDuplicates!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) lt!65263 lt!65260)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4699 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1700) Unit!3924)

(assert (=> d!37987 (= lt!65256 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) lt!65263 lt!65260))))

(assert (=> d!37987 (= lt!65260 Nil!1697)))

(assert (=> d!37987 (= lt!65263 #b00000000000000000000000000000000)))

(declare-fun lt!65272 () Unit!3924)

(assert (=> d!37987 (= lt!65272 e!82546)))

(declare-fun c!23087 () Bool)

(assert (=> d!37987 (= c!23087 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!65257 () Unit!3924)

(assert (=> d!37987 (= lt!65257 e!82547)))

(assert (=> d!37987 (= c!23086 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!37987 (valid!505 newMap!16)))

(assert (=> d!37987 (= (updateHelperNewKey!56 newMap!16 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))) lt!65284)))

(declare-fun b!126386 () Bool)

(declare-fun res!61139 () Bool)

(declare-fun e!82548 () Bool)

(assert (=> b!126386 (=> (not res!61139) (not e!82548))))

(assert (=> b!126386 (= res!61139 call!13616)))

(declare-fun e!82543 () Bool)

(assert (=> b!126386 (= e!82543 e!82548)))

(declare-fun b!126387 () Bool)

(declare-fun res!61142 () Bool)

(assert (=> b!126387 (=> (not res!61142) (not e!82548))))

(assert (=> b!126387 (= res!61142 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126388 () Bool)

(declare-fun lt!65273 () Unit!3924)

(assert (=> b!126388 (= e!82547 lt!65273)))

(assert (=> b!126388 (= lt!65273 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(assert (=> b!126388 (= lt!65270 call!13615)))

(assert (=> b!126388 (= c!23084 ((_ is MissingZero!270) lt!65270))))

(assert (=> b!126388 e!82543))

(declare-fun b!126389 () Bool)

(declare-fun c!23085 () Bool)

(assert (=> b!126389 (= c!23085 ((_ is MissingVacant!270) lt!65270))))

(assert (=> b!126389 (= e!82543 e!82542)))

(declare-fun bm!13613 () Bool)

(assert (=> bm!13613 (= call!13616 call!13617)))

(declare-fun b!126390 () Bool)

(assert (=> b!126390 (= e!82545 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65258)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun bm!13614 () Bool)

(assert (=> bm!13614 (= call!13614 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!126391 () Bool)

(assert (=> b!126391 (= e!82542 ((_ is Undefined!270) lt!65270))))

(declare-fun b!126392 () Bool)

(declare-fun res!61138 () Bool)

(assert (=> b!126392 (=> (not res!61138) (not e!82541))))

(assert (=> b!126392 (= res!61138 (contains!877 (map!1387 (_2!1300 lt!65284)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126393 () Bool)

(assert (=> b!126393 (= e!82548 (not call!13614))))

(declare-fun b!126394 () Bool)

(declare-fun res!61137 () Bool)

(assert (=> b!126394 (=> (not res!61137) (not e!82541))))

(assert (=> b!126394 (= res!61137 (valid!505 (_2!1300 lt!65284)))))

(declare-fun b!126395 () Bool)

(assert (=> b!126395 (= e!82541 (= (map!1387 (_2!1300 lt!65284)) (+!170 (map!1387 newMap!16) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126396 () Bool)

(declare-fun res!61143 () Bool)

(assert (=> b!126396 (= res!61143 call!13617)))

(assert (=> b!126396 (=> (not res!61143) (not e!82545))))

(assert (= (and d!37987 c!23086) b!126384))

(assert (= (and d!37987 (not c!23086)) b!126388))

(assert (= (and b!126384 res!61144) b!126396))

(assert (= (and b!126396 res!61143) b!126390))

(assert (= (and b!126388 c!23084) b!126386))

(assert (= (and b!126388 (not c!23084)) b!126389))

(assert (= (and b!126386 res!61139) b!126387))

(assert (= (and b!126387 res!61142) b!126393))

(assert (= (and b!126389 c!23085) b!126381))

(assert (= (and b!126389 (not c!23085)) b!126391))

(assert (= (and b!126381 res!61141) b!126380))

(assert (= (and b!126380 res!61136) b!126383))

(assert (= (or b!126386 b!126381) bm!13613))

(assert (= (or b!126393 b!126383) bm!13614))

(assert (= (or b!126396 bm!13613) bm!13612))

(assert (= (or b!126384 b!126388) bm!13611))

(assert (= (and d!37987 c!23087) b!126385))

(assert (= (and d!37987 (not c!23087)) b!126382))

(assert (= (and d!37987 res!61140) b!126394))

(assert (= (and b!126394 res!61137) b!126392))

(assert (= (and b!126392 res!61138) b!126395))

(declare-fun m!147171 () Bool)

(assert (=> bm!13612 m!147171))

(declare-fun m!147173 () Bool)

(assert (=> b!126387 m!147173))

(declare-fun m!147175 () Bool)

(assert (=> b!126395 m!147175))

(assert (=> b!126395 m!146853))

(assert (=> b!126395 m!146853))

(declare-fun m!147177 () Bool)

(assert (=> b!126395 m!147177))

(assert (=> b!126384 m!146847))

(assert (=> b!126384 m!147009))

(assert (=> bm!13611 m!146847))

(assert (=> bm!13611 m!146977))

(assert (=> bm!13614 m!146847))

(assert (=> bm!13614 m!146961))

(declare-fun m!147179 () Bool)

(assert (=> b!126394 m!147179))

(declare-fun m!147181 () Bool)

(assert (=> d!37987 m!147181))

(assert (=> d!37987 m!146837))

(assert (=> d!37987 m!146847))

(assert (=> d!37987 m!146845))

(declare-fun m!147183 () Bool)

(assert (=> d!37987 m!147183))

(assert (=> d!37987 m!146893))

(declare-fun m!147185 () Bool)

(assert (=> d!37987 m!147185))

(declare-fun m!147187 () Bool)

(assert (=> d!37987 m!147187))

(assert (=> d!37987 m!146847))

(declare-fun m!147189 () Bool)

(assert (=> d!37987 m!147189))

(assert (=> d!37987 m!146847))

(declare-fun m!147191 () Bool)

(assert (=> d!37987 m!147191))

(assert (=> d!37987 m!146847))

(assert (=> d!37987 m!146961))

(assert (=> d!37987 m!147019))

(declare-fun m!147193 () Bool)

(assert (=> d!37987 m!147193))

(declare-fun m!147195 () Bool)

(assert (=> d!37987 m!147195))

(declare-fun m!147197 () Bool)

(assert (=> d!37987 m!147197))

(declare-fun m!147199 () Bool)

(assert (=> d!37987 m!147199))

(assert (=> d!37987 m!147193))

(declare-fun m!147201 () Bool)

(assert (=> d!37987 m!147201))

(assert (=> d!37987 m!146893))

(assert (=> d!37987 m!146847))

(declare-fun m!147203 () Bool)

(assert (=> d!37987 m!147203))

(assert (=> d!37987 m!146893))

(assert (=> d!37987 m!146847))

(assert (=> d!37987 m!146987))

(assert (=> d!37987 m!146847))

(declare-fun m!147205 () Bool)

(assert (=> d!37987 m!147205))

(declare-fun m!147207 () Bool)

(assert (=> d!37987 m!147207))

(declare-fun m!147209 () Bool)

(assert (=> d!37987 m!147209))

(assert (=> d!37987 m!147199))

(assert (=> d!37987 m!146847))

(declare-fun m!147211 () Bool)

(assert (=> d!37987 m!147211))

(declare-fun m!147213 () Bool)

(assert (=> d!37987 m!147213))

(declare-fun m!147215 () Bool)

(assert (=> d!37987 m!147215))

(declare-fun m!147217 () Bool)

(assert (=> d!37987 m!147217))

(assert (=> b!126388 m!146847))

(assert (=> b!126388 m!146965))

(assert (=> b!126392 m!147175))

(assert (=> b!126392 m!147175))

(assert (=> b!126392 m!146847))

(declare-fun m!147219 () Bool)

(assert (=> b!126392 m!147219))

(declare-fun m!147221 () Bool)

(assert (=> b!126380 m!147221))

(declare-fun m!147223 () Bool)

(assert (=> b!126390 m!147223))

(assert (=> b!126385 m!146847))

(declare-fun m!147225 () Bool)

(assert (=> b!126385 m!147225))

(assert (=> b!126385 m!146893))

(assert (=> b!126385 m!146893))

(assert (=> b!126385 m!146847))

(assert (=> b!126385 m!146987))

(assert (=> bm!13575 d!37987))

(declare-fun d!37989 () Bool)

(declare-fun e!82550 () Bool)

(assert (=> d!37989 e!82550))

(declare-fun res!61145 () Bool)

(assert (=> d!37989 (=> res!61145 e!82550)))

(declare-fun lt!65286 () Bool)

(assert (=> d!37989 (= res!61145 (not lt!65286))))

(declare-fun lt!65285 () Bool)

(assert (=> d!37989 (= lt!65286 lt!65285)))

(declare-fun lt!65288 () Unit!3924)

(declare-fun e!82549 () Unit!3924)

(assert (=> d!37989 (= lt!65288 e!82549)))

(declare-fun c!23088 () Bool)

(assert (=> d!37989 (= c!23088 lt!65285)))

(assert (=> d!37989 (= lt!65285 (containsKey!171 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!37989 (= (contains!877 lt!65008 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65286)))

(declare-fun b!126397 () Bool)

(declare-fun lt!65287 () Unit!3924)

(assert (=> b!126397 (= e!82549 lt!65287)))

(assert (=> b!126397 (= lt!65287 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126397 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126398 () Bool)

(declare-fun Unit!3936 () Unit!3924)

(assert (=> b!126398 (= e!82549 Unit!3936)))

(declare-fun b!126399 () Bool)

(assert (=> b!126399 (= e!82550 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!37989 c!23088) b!126397))

(assert (= (and d!37989 (not c!23088)) b!126398))

(assert (= (and d!37989 (not res!61145)) b!126399))

(declare-fun m!147227 () Bool)

(assert (=> d!37989 m!147227))

(declare-fun m!147229 () Bool)

(assert (=> b!126397 m!147229))

(declare-fun m!147231 () Bool)

(assert (=> b!126397 m!147231))

(assert (=> b!126397 m!147231))

(declare-fun m!147233 () Bool)

(assert (=> b!126397 m!147233))

(assert (=> b!126399 m!147231))

(assert (=> b!126399 m!147231))

(assert (=> b!126399 m!147233))

(assert (=> bm!13508 d!37989))

(declare-fun d!37991 () Bool)

(declare-fun e!82553 () Bool)

(assert (=> d!37991 e!82553))

(declare-fun res!61148 () Bool)

(assert (=> d!37991 (=> (not res!61148) (not e!82553))))

(assert (=> d!37991 (= res!61148 (and (bvsge (index!3236 lt!65119) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65119) (size!2489 (_keys!4516 newMap!16)))))))

(declare-fun lt!65291 () Unit!3924)

(declare-fun choose!762 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) Int) Unit!3924)

(assert (=> d!37991 (= lt!65291 (choose!762 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (defaultEntry!2783 newMap!16)))))

(assert (=> d!37991 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37991 (= (lemmaValidKeyInArrayIsInListMap!117 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (defaultEntry!2783 newMap!16)) lt!65291)))

(declare-fun b!126402 () Bool)

(assert (=> b!126402 (= e!82553 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))

(assert (= (and d!37991 res!61148) b!126402))

(declare-fun m!147235 () Bool)

(assert (=> d!37991 m!147235))

(assert (=> d!37991 m!147051))

(declare-fun m!147237 () Bool)

(assert (=> b!126402 m!147237))

(assert (=> b!126402 m!147003))

(assert (=> b!126402 m!147237))

(assert (=> b!126402 m!147003))

(declare-fun m!147239 () Bool)

(assert (=> b!126402 m!147239))

(assert (=> b!126164 d!37991))

(declare-fun d!37993 () Bool)

(declare-fun e!82556 () Bool)

(assert (=> d!37993 e!82556))

(declare-fun res!61151 () Bool)

(assert (=> d!37993 (=> (not res!61151) (not e!82556))))

(assert (=> d!37993 (= res!61151 (and (bvsge (index!3236 lt!65119) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65119) (size!2490 (_values!2766 newMap!16)))))))

(declare-fun lt!65294 () Unit!3924)

(declare-fun choose!763 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) (_ BitVec 64) V!3435 Int) Unit!3924)

(assert (=> d!37993 (= lt!65294 (choose!763 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(assert (=> d!37993 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37993 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)) lt!65294)))

(declare-fun b!126405 () Bool)

(assert (=> b!126405 (= e!82556 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))))

(assert (= (and d!37993 res!61151) b!126405))

(assert (=> d!37993 m!146847))

(assert (=> d!37993 m!146845))

(declare-fun m!147241 () Bool)

(assert (=> d!37993 m!147241))

(assert (=> d!37993 m!147051))

(assert (=> b!126405 m!146893))

(assert (=> b!126405 m!146893))

(assert (=> b!126405 m!147185))

(assert (=> b!126405 m!146967))

(declare-fun m!147243 () Bool)

(assert (=> b!126405 m!147243))

(assert (=> b!126164 d!37993))

(declare-fun d!37995 () Bool)

(declare-fun e!82558 () Bool)

(assert (=> d!37995 e!82558))

(declare-fun res!61152 () Bool)

(assert (=> d!37995 (=> res!61152 e!82558)))

(declare-fun lt!65296 () Bool)

(assert (=> d!37995 (= res!61152 (not lt!65296))))

(declare-fun lt!65295 () Bool)

(assert (=> d!37995 (= lt!65296 lt!65295)))

(declare-fun lt!65298 () Unit!3924)

(declare-fun e!82557 () Unit!3924)

(assert (=> d!37995 (= lt!65298 e!82557)))

(declare-fun c!23089 () Bool)

(assert (=> d!37995 (= c!23089 lt!65295)))

(assert (=> d!37995 (= lt!65295 (containsKey!171 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!37995 (= (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65296)))

(declare-fun b!126406 () Bool)

(declare-fun lt!65297 () Unit!3924)

(assert (=> b!126406 (= e!82557 lt!65297)))

(assert (=> b!126406 (= lt!65297 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126406 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126407 () Bool)

(declare-fun Unit!3937 () Unit!3924)

(assert (=> b!126407 (= e!82557 Unit!3937)))

(declare-fun b!126408 () Bool)

(assert (=> b!126408 (= e!82558 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!37995 c!23089) b!126406))

(assert (= (and d!37995 (not c!23089)) b!126407))

(assert (= (and d!37995 (not res!61152)) b!126408))

(assert (=> d!37995 m!146847))

(declare-fun m!147245 () Bool)

(assert (=> d!37995 m!147245))

(assert (=> b!126406 m!146847))

(declare-fun m!147247 () Bool)

(assert (=> b!126406 m!147247))

(assert (=> b!126406 m!146847))

(declare-fun m!147249 () Bool)

(assert (=> b!126406 m!147249))

(assert (=> b!126406 m!147249))

(declare-fun m!147251 () Bool)

(assert (=> b!126406 m!147251))

(assert (=> b!126408 m!146847))

(assert (=> b!126408 m!147249))

(assert (=> b!126408 m!147249))

(assert (=> b!126408 m!147251))

(assert (=> b!126164 d!37995))

(declare-fun b!126409 () Bool)

(declare-fun c!23091 () Bool)

(assert (=> b!126409 (= c!23091 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82569 () ListLongMap!1681)

(declare-fun e!82565 () ListLongMap!1681)

(assert (=> b!126409 (= e!82569 e!82565)))

(declare-fun bm!13615 () Bool)

(declare-fun call!13620 () Bool)

(declare-fun lt!65299 () ListLongMap!1681)

(assert (=> bm!13615 (= call!13620 (contains!877 lt!65299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126410 () Bool)

(declare-fun e!82568 () ListLongMap!1681)

(assert (=> b!126410 (= e!82568 e!82569)))

(declare-fun c!23094 () Bool)

(assert (=> b!126410 (= c!23094 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126411 () Bool)

(declare-fun e!82559 () Unit!3924)

(declare-fun Unit!3938 () Unit!3924)

(assert (=> b!126411 (= e!82559 Unit!3938)))

(declare-fun b!126412 () Bool)

(declare-fun e!82567 () Bool)

(declare-fun e!82562 () Bool)

(assert (=> b!126412 (= e!82567 e!82562)))

(declare-fun res!61159 () Bool)

(assert (=> b!126412 (= res!61159 call!13620)))

(assert (=> b!126412 (=> (not res!61159) (not e!82562))))

(declare-fun b!126413 () Bool)

(declare-fun e!82571 () Bool)

(declare-fun e!82564 () Bool)

(assert (=> b!126413 (= e!82571 e!82564)))

(declare-fun res!61153 () Bool)

(assert (=> b!126413 (=> (not res!61153) (not e!82564))))

(assert (=> b!126413 (= res!61153 (contains!877 lt!65299 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126414 () Bool)

(assert (=> b!126414 (= e!82567 (not call!13620))))

(declare-fun d!37997 () Bool)

(declare-fun e!82561 () Bool)

(assert (=> d!37997 e!82561))

(declare-fun res!61155 () Bool)

(assert (=> d!37997 (=> (not res!61155) (not e!82561))))

(assert (=> d!37997 (= res!61155 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65308 () ListLongMap!1681)

(assert (=> d!37997 (= lt!65299 lt!65308)))

(declare-fun lt!65314 () Unit!3924)

(assert (=> d!37997 (= lt!65314 e!82559)))

(declare-fun c!23093 () Bool)

(declare-fun e!82560 () Bool)

(assert (=> d!37997 (= c!23093 e!82560)))

(declare-fun res!61157 () Bool)

(assert (=> d!37997 (=> (not res!61157) (not e!82560))))

(assert (=> d!37997 (= res!61157 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!37997 (= lt!65308 e!82568)))

(declare-fun c!23090 () Bool)

(assert (=> d!37997 (= c!23090 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!37997 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!37997 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65299)))

(declare-fun b!126415 () Bool)

(declare-fun lt!65303 () Unit!3924)

(assert (=> b!126415 (= e!82559 lt!65303)))

(declare-fun lt!65311 () ListLongMap!1681)

(assert (=> b!126415 (= lt!65311 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65305 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65305 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65318 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65318 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65304 () Unit!3924)

(assert (=> b!126415 (= lt!65304 (addStillContains!87 lt!65311 lt!65305 (zeroValue!2646 newMap!16) lt!65318))))

(assert (=> b!126415 (contains!877 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) lt!65318)))

(declare-fun lt!65310 () Unit!3924)

(assert (=> b!126415 (= lt!65310 lt!65304)))

(declare-fun lt!65319 () ListLongMap!1681)

(assert (=> b!126415 (= lt!65319 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65316 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65316 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65320 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65320 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65306 () Unit!3924)

(assert (=> b!126415 (= lt!65306 (addApplyDifferent!87 lt!65319 lt!65316 (minValue!2646 newMap!16) lt!65320))))

(assert (=> b!126415 (= (apply!111 (+!170 lt!65319 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) lt!65320) (apply!111 lt!65319 lt!65320))))

(declare-fun lt!65302 () Unit!3924)

(assert (=> b!126415 (= lt!65302 lt!65306)))

(declare-fun lt!65312 () ListLongMap!1681)

(assert (=> b!126415 (= lt!65312 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65317 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65309 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65309 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65301 () Unit!3924)

(assert (=> b!126415 (= lt!65301 (addApplyDifferent!87 lt!65312 lt!65317 (zeroValue!2646 newMap!16) lt!65309))))

(assert (=> b!126415 (= (apply!111 (+!170 lt!65312 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) lt!65309) (apply!111 lt!65312 lt!65309))))

(declare-fun lt!65315 () Unit!3924)

(assert (=> b!126415 (= lt!65315 lt!65301)))

(declare-fun lt!65307 () ListLongMap!1681)

(assert (=> b!126415 (= lt!65307 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65313 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65313 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65300 () (_ BitVec 64))

(assert (=> b!126415 (= lt!65300 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126415 (= lt!65303 (addApplyDifferent!87 lt!65307 lt!65313 (minValue!2646 newMap!16) lt!65300))))

(assert (=> b!126415 (= (apply!111 (+!170 lt!65307 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) lt!65300) (apply!111 lt!65307 lt!65300))))

(declare-fun b!126416 () Bool)

(declare-fun res!61160 () Bool)

(assert (=> b!126416 (=> (not res!61160) (not e!82561))))

(declare-fun e!82566 () Bool)

(assert (=> b!126416 (= res!61160 e!82566)))

(declare-fun c!23092 () Bool)

(assert (=> b!126416 (= c!23092 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126417 () Bool)

(declare-fun e!82570 () Bool)

(assert (=> b!126417 (= e!82570 (= (apply!111 lt!65299 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!126418 () Bool)

(assert (=> b!126418 (= e!82566 e!82570)))

(declare-fun res!61158 () Bool)

(declare-fun call!13621 () Bool)

(assert (=> b!126418 (= res!61158 call!13621)))

(assert (=> b!126418 (=> (not res!61158) (not e!82570))))

(declare-fun b!126419 () Bool)

(assert (=> b!126419 (= e!82562 (= (apply!111 lt!65299 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13616 () Bool)

(declare-fun call!13618 () ListLongMap!1681)

(declare-fun call!13624 () ListLongMap!1681)

(assert (=> bm!13616 (= call!13618 call!13624)))

(declare-fun b!126420 () Bool)

(assert (=> b!126420 (= e!82566 (not call!13621))))

(declare-fun call!13622 () ListLongMap!1681)

(declare-fun bm!13617 () Bool)

(declare-fun call!13623 () ListLongMap!1681)

(assert (=> bm!13617 (= call!13623 (+!170 (ite c!23090 call!13624 (ite c!23094 call!13618 call!13622)) (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13618 () Bool)

(assert (=> bm!13618 (= call!13621 (contains!877 lt!65299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126421 () Bool)

(declare-fun call!13619 () ListLongMap!1681)

(assert (=> b!126421 (= e!82565 call!13619)))

(declare-fun b!126422 () Bool)

(assert (=> b!126422 (= e!82569 call!13619)))

(declare-fun b!126423 () Bool)

(assert (=> b!126423 (= e!82560 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13619 () Bool)

(assert (=> bm!13619 (= call!13619 call!13623)))

(declare-fun b!126424 () Bool)

(assert (=> b!126424 (= e!82561 e!82567)))

(declare-fun c!23095 () Bool)

(assert (=> b!126424 (= c!23095 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126425 () Bool)

(assert (=> b!126425 (= e!82564 (= (apply!111 lt!65299 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_values!2766 newMap!16))))))

(assert (=> b!126425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126426 () Bool)

(declare-fun res!61154 () Bool)

(assert (=> b!126426 (=> (not res!61154) (not e!82561))))

(assert (=> b!126426 (= res!61154 e!82571)))

(declare-fun res!61161 () Bool)

(assert (=> b!126426 (=> res!61161 e!82571)))

(declare-fun e!82563 () Bool)

(assert (=> b!126426 (= res!61161 (not e!82563))))

(declare-fun res!61156 () Bool)

(assert (=> b!126426 (=> (not res!61156) (not e!82563))))

(assert (=> b!126426 (= res!61156 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126427 () Bool)

(assert (=> b!126427 (= e!82563 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126428 () Bool)

(assert (=> b!126428 (= e!82568 (+!170 call!13623 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126429 () Bool)

(assert (=> b!126429 (= e!82565 call!13622)))

(declare-fun bm!13620 () Bool)

(assert (=> bm!13620 (= call!13624 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13621 () Bool)

(assert (=> bm!13621 (= call!13622 call!13618)))

(assert (= (and d!37997 c!23090) b!126428))

(assert (= (and d!37997 (not c!23090)) b!126410))

(assert (= (and b!126410 c!23094) b!126422))

(assert (= (and b!126410 (not c!23094)) b!126409))

(assert (= (and b!126409 c!23091) b!126421))

(assert (= (and b!126409 (not c!23091)) b!126429))

(assert (= (or b!126421 b!126429) bm!13621))

(assert (= (or b!126422 bm!13621) bm!13616))

(assert (= (or b!126422 b!126421) bm!13619))

(assert (= (or b!126428 bm!13616) bm!13620))

(assert (= (or b!126428 bm!13619) bm!13617))

(assert (= (and d!37997 res!61157) b!126423))

(assert (= (and d!37997 c!23093) b!126415))

(assert (= (and d!37997 (not c!23093)) b!126411))

(assert (= (and d!37997 res!61155) b!126426))

(assert (= (and b!126426 res!61156) b!126427))

(assert (= (and b!126426 (not res!61161)) b!126413))

(assert (= (and b!126413 res!61153) b!126425))

(assert (= (and b!126426 res!61154) b!126416))

(assert (= (and b!126416 c!23092) b!126418))

(assert (= (and b!126416 (not c!23092)) b!126420))

(assert (= (and b!126418 res!61158) b!126417))

(assert (= (or b!126418 b!126420) bm!13618))

(assert (= (and b!126416 res!61160) b!126424))

(assert (= (and b!126424 c!23095) b!126412))

(assert (= (and b!126424 (not c!23095)) b!126414))

(assert (= (and b!126412 res!61159) b!126419))

(assert (= (or b!126412 b!126414) bm!13615))

(declare-fun b_lambda!5561 () Bool)

(assert (=> (not b_lambda!5561) (not b!126425)))

(assert (=> b!126425 t!6053))

(declare-fun b_and!7775 () Bool)

(assert (= b_and!7771 (and (=> t!6053 result!3847) b_and!7775)))

(assert (=> b!126425 t!6055))

(declare-fun b_and!7777 () Bool)

(assert (= b_and!7773 (and (=> t!6055 result!3849) b_and!7777)))

(assert (=> b!126413 m!147041))

(assert (=> b!126413 m!147041))

(declare-fun m!147253 () Bool)

(assert (=> b!126413 m!147253))

(assert (=> d!37997 m!147051))

(declare-fun m!147255 () Bool)

(assert (=> b!126415 m!147255))

(declare-fun m!147257 () Bool)

(assert (=> b!126415 m!147257))

(assert (=> b!126415 m!147257))

(declare-fun m!147259 () Bool)

(assert (=> b!126415 m!147259))

(declare-fun m!147261 () Bool)

(assert (=> b!126415 m!147261))

(declare-fun m!147263 () Bool)

(assert (=> b!126415 m!147263))

(declare-fun m!147265 () Bool)

(assert (=> b!126415 m!147265))

(declare-fun m!147267 () Bool)

(assert (=> b!126415 m!147267))

(declare-fun m!147269 () Bool)

(assert (=> b!126415 m!147269))

(assert (=> b!126415 m!147261))

(declare-fun m!147271 () Bool)

(assert (=> b!126415 m!147271))

(declare-fun m!147273 () Bool)

(assert (=> b!126415 m!147273))

(declare-fun m!147275 () Bool)

(assert (=> b!126415 m!147275))

(declare-fun m!147277 () Bool)

(assert (=> b!126415 m!147277))

(declare-fun m!147279 () Bool)

(assert (=> b!126415 m!147279))

(assert (=> b!126415 m!147041))

(assert (=> b!126415 m!147263))

(declare-fun m!147281 () Bool)

(assert (=> b!126415 m!147281))

(declare-fun m!147283 () Bool)

(assert (=> b!126415 m!147283))

(declare-fun m!147285 () Bool)

(assert (=> b!126415 m!147285))

(assert (=> b!126415 m!147275))

(declare-fun m!147287 () Bool)

(assert (=> bm!13615 m!147287))

(assert (=> b!126427 m!147041))

(assert (=> b!126427 m!147041))

(assert (=> b!126427 m!147043))

(declare-fun m!147289 () Bool)

(assert (=> b!126419 m!147289))

(assert (=> b!126423 m!147041))

(assert (=> b!126423 m!147041))

(assert (=> b!126423 m!147043))

(declare-fun m!147291 () Bool)

(assert (=> bm!13617 m!147291))

(declare-fun m!147293 () Bool)

(assert (=> b!126428 m!147293))

(assert (=> bm!13620 m!147283))

(assert (=> b!126425 m!147041))

(assert (=> b!126425 m!147145))

(declare-fun m!147295 () Bool)

(assert (=> b!126425 m!147295))

(assert (=> b!126425 m!147145))

(declare-fun m!147297 () Bool)

(assert (=> b!126425 m!147297))

(assert (=> b!126425 m!147295))

(assert (=> b!126425 m!147041))

(declare-fun m!147299 () Bool)

(assert (=> b!126425 m!147299))

(declare-fun m!147301 () Bool)

(assert (=> b!126417 m!147301))

(declare-fun m!147303 () Bool)

(assert (=> bm!13618 m!147303))

(assert (=> b!126164 d!37997))

(declare-fun d!37999 () Bool)

(declare-fun e!82572 () Bool)

(assert (=> d!37999 e!82572))

(declare-fun res!61162 () Bool)

(assert (=> d!37999 (=> (not res!61162) (not e!82572))))

(declare-fun lt!65323 () ListLongMap!1681)

(assert (=> d!37999 (= res!61162 (contains!877 lt!65323 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65321 () List!1698)

(assert (=> d!37999 (= lt!65323 (ListLongMap!1682 lt!65321))))

(declare-fun lt!65322 () Unit!3924)

(declare-fun lt!65324 () Unit!3924)

(assert (=> d!37999 (= lt!65322 lt!65324)))

(assert (=> d!37999 (= (getValueByKey!167 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37999 (= lt!65324 (lemmaContainsTupThenGetReturnValue!82 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37999 (= lt!65321 (insertStrictlySorted!85 (toList!856 call!13578) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!37999 (= (+!170 call!13578 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65323)))

(declare-fun b!126430 () Bool)

(declare-fun res!61163 () Bool)

(assert (=> b!126430 (=> (not res!61163) (not e!82572))))

(assert (=> b!126430 (= res!61163 (= (getValueByKey!167 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126431 () Bool)

(assert (=> b!126431 (= e!82572 (contains!879 (toList!856 lt!65323) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!37999 res!61162) b!126430))

(assert (= (and b!126430 res!61163) b!126431))

(declare-fun m!147305 () Bool)

(assert (=> d!37999 m!147305))

(declare-fun m!147307 () Bool)

(assert (=> d!37999 m!147307))

(declare-fun m!147309 () Bool)

(assert (=> d!37999 m!147309))

(declare-fun m!147311 () Bool)

(assert (=> d!37999 m!147311))

(declare-fun m!147313 () Bool)

(assert (=> b!126430 m!147313))

(declare-fun m!147315 () Bool)

(assert (=> b!126431 m!147315))

(assert (=> b!126154 d!37999))

(declare-fun b!126432 () Bool)

(declare-fun c!23097 () Bool)

(assert (=> b!126432 (= c!23097 (and (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82583 () ListLongMap!1681)

(declare-fun e!82579 () ListLongMap!1681)

(assert (=> b!126432 (= e!82583 e!82579)))

(declare-fun bm!13622 () Bool)

(declare-fun call!13627 () Bool)

(declare-fun lt!65325 () ListLongMap!1681)

(assert (=> bm!13622 (= call!13627 (contains!877 lt!65325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126433 () Bool)

(declare-fun e!82582 () ListLongMap!1681)

(assert (=> b!126433 (= e!82582 e!82583)))

(declare-fun c!23100 () Bool)

(assert (=> b!126433 (= c!23100 (and (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126434 () Bool)

(declare-fun e!82573 () Unit!3924)

(declare-fun Unit!3939 () Unit!3924)

(assert (=> b!126434 (= e!82573 Unit!3939)))

(declare-fun b!126435 () Bool)

(declare-fun e!82581 () Bool)

(declare-fun e!82576 () Bool)

(assert (=> b!126435 (= e!82581 e!82576)))

(declare-fun res!61170 () Bool)

(assert (=> b!126435 (= res!61170 call!13627)))

(assert (=> b!126435 (=> (not res!61170) (not e!82576))))

(declare-fun b!126436 () Bool)

(declare-fun e!82585 () Bool)

(declare-fun e!82578 () Bool)

(assert (=> b!126436 (= e!82585 e!82578)))

(declare-fun res!61164 () Bool)

(assert (=> b!126436 (=> (not res!61164) (not e!82578))))

(assert (=> b!126436 (= res!61164 (contains!877 lt!65325 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126436 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126437 () Bool)

(assert (=> b!126437 (= e!82581 (not call!13627))))

(declare-fun d!38001 () Bool)

(declare-fun e!82575 () Bool)

(assert (=> d!38001 e!82575))

(declare-fun res!61166 () Bool)

(assert (=> d!38001 (=> (not res!61166) (not e!82575))))

(assert (=> d!38001 (= res!61166 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65334 () ListLongMap!1681)

(assert (=> d!38001 (= lt!65325 lt!65334)))

(declare-fun lt!65340 () Unit!3924)

(assert (=> d!38001 (= lt!65340 e!82573)))

(declare-fun c!23099 () Bool)

(declare-fun e!82574 () Bool)

(assert (=> d!38001 (= c!23099 e!82574)))

(declare-fun res!61168 () Bool)

(assert (=> d!38001 (=> (not res!61168) (not e!82574))))

(assert (=> d!38001 (= res!61168 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38001 (= lt!65334 e!82582)))

(declare-fun c!23096 () Bool)

(assert (=> d!38001 (= c!23096 (and (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38001 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38001 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65325)))

(declare-fun b!126438 () Bool)

(declare-fun lt!65329 () Unit!3924)

(assert (=> b!126438 (= e!82573 lt!65329)))

(declare-fun lt!65337 () ListLongMap!1681)

(assert (=> b!126438 (= lt!65337 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65331 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65344 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65344 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65330 () Unit!3924)

(assert (=> b!126438 (= lt!65330 (addStillContains!87 lt!65337 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65344))))

(assert (=> b!126438 (contains!877 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65344)))

(declare-fun lt!65336 () Unit!3924)

(assert (=> b!126438 (= lt!65336 lt!65330)))

(declare-fun lt!65345 () ListLongMap!1681)

(assert (=> b!126438 (= lt!65345 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65342 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65342 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65346 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65346 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65332 () Unit!3924)

(assert (=> b!126438 (= lt!65332 (addApplyDifferent!87 lt!65345 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65346))))

(assert (=> b!126438 (= (apply!111 (+!170 lt!65345 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65346) (apply!111 lt!65345 lt!65346))))

(declare-fun lt!65328 () Unit!3924)

(assert (=> b!126438 (= lt!65328 lt!65332)))

(declare-fun lt!65338 () ListLongMap!1681)

(assert (=> b!126438 (= lt!65338 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65343 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65335 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65335 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65327 () Unit!3924)

(assert (=> b!126438 (= lt!65327 (addApplyDifferent!87 lt!65338 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65335))))

(assert (=> b!126438 (= (apply!111 (+!170 lt!65338 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65335) (apply!111 lt!65338 lt!65335))))

(declare-fun lt!65341 () Unit!3924)

(assert (=> b!126438 (= lt!65341 lt!65327)))

(declare-fun lt!65333 () ListLongMap!1681)

(assert (=> b!126438 (= lt!65333 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65339 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65339 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65326 () (_ BitVec 64))

(assert (=> b!126438 (= lt!65326 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126438 (= lt!65329 (addApplyDifferent!87 lt!65333 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65326))))

(assert (=> b!126438 (= (apply!111 (+!170 lt!65333 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65326) (apply!111 lt!65333 lt!65326))))

(declare-fun b!126439 () Bool)

(declare-fun res!61171 () Bool)

(assert (=> b!126439 (=> (not res!61171) (not e!82575))))

(declare-fun e!82580 () Bool)

(assert (=> b!126439 (= res!61171 e!82580)))

(declare-fun c!23098 () Bool)

(assert (=> b!126439 (= c!23098 (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126440 () Bool)

(declare-fun e!82584 () Bool)

(assert (=> b!126440 (= e!82584 (= (apply!111 lt!65325 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))

(declare-fun b!126441 () Bool)

(assert (=> b!126441 (= e!82580 e!82584)))

(declare-fun res!61169 () Bool)

(declare-fun call!13628 () Bool)

(assert (=> b!126441 (= res!61169 call!13628)))

(assert (=> b!126441 (=> (not res!61169) (not e!82584))))

(declare-fun b!126442 () Bool)

(assert (=> b!126442 (= e!82576 (= (apply!111 lt!65325 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))

(declare-fun bm!13623 () Bool)

(declare-fun call!13625 () ListLongMap!1681)

(declare-fun call!13631 () ListLongMap!1681)

(assert (=> bm!13623 (= call!13625 call!13631)))

(declare-fun b!126443 () Bool)

(assert (=> b!126443 (= e!82580 (not call!13628))))

(declare-fun call!13629 () ListLongMap!1681)

(declare-fun bm!13624 () Bool)

(declare-fun call!13630 () ListLongMap!1681)

(assert (=> bm!13624 (= call!13630 (+!170 (ite c!23096 call!13631 (ite c!23100 call!13625 call!13629)) (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(declare-fun bm!13625 () Bool)

(assert (=> bm!13625 (= call!13628 (contains!877 lt!65325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126444 () Bool)

(declare-fun call!13626 () ListLongMap!1681)

(assert (=> b!126444 (= e!82579 call!13626)))

(declare-fun b!126445 () Bool)

(assert (=> b!126445 (= e!82583 call!13626)))

(declare-fun b!126446 () Bool)

(assert (=> b!126446 (= e!82574 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13626 () Bool)

(assert (=> bm!13626 (= call!13626 call!13630)))

(declare-fun b!126447 () Bool)

(assert (=> b!126447 (= e!82575 e!82581)))

(declare-fun c!23101 () Bool)

(assert (=> b!126447 (= c!23101 (not (= (bvand (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126448 () Bool)

(assert (=> b!126448 (= e!82578 (= (apply!111 lt!65325 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))))))))

(assert (=> b!126448 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126449 () Bool)

(declare-fun res!61165 () Bool)

(assert (=> b!126449 (=> (not res!61165) (not e!82575))))

(assert (=> b!126449 (= res!61165 e!82585)))

(declare-fun res!61172 () Bool)

(assert (=> b!126449 (=> res!61172 e!82585)))

(declare-fun e!82577 () Bool)

(assert (=> b!126449 (= res!61172 (not e!82577))))

(declare-fun res!61167 () Bool)

(assert (=> b!126449 (=> (not res!61167) (not e!82577))))

(assert (=> b!126449 (= res!61167 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126450 () Bool)

(assert (=> b!126450 (= e!82577 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126451 () Bool)

(assert (=> b!126451 (= e!82582 (+!170 call!13630 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))

(declare-fun b!126452 () Bool)

(assert (=> b!126452 (= e!82579 call!13629)))

(declare-fun bm!13627 () Bool)

(assert (=> bm!13627 (= call!13631 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13628 () Bool)

(assert (=> bm!13628 (= call!13629 call!13625)))

(assert (= (and d!38001 c!23096) b!126451))

(assert (= (and d!38001 (not c!23096)) b!126433))

(assert (= (and b!126433 c!23100) b!126445))

(assert (= (and b!126433 (not c!23100)) b!126432))

(assert (= (and b!126432 c!23097) b!126444))

(assert (= (and b!126432 (not c!23097)) b!126452))

(assert (= (or b!126444 b!126452) bm!13628))

(assert (= (or b!126445 bm!13628) bm!13623))

(assert (= (or b!126445 b!126444) bm!13626))

(assert (= (or b!126451 bm!13623) bm!13627))

(assert (= (or b!126451 bm!13626) bm!13624))

(assert (= (and d!38001 res!61168) b!126446))

(assert (= (and d!38001 c!23099) b!126438))

(assert (= (and d!38001 (not c!23099)) b!126434))

(assert (= (and d!38001 res!61166) b!126449))

(assert (= (and b!126449 res!61167) b!126450))

(assert (= (and b!126449 (not res!61172)) b!126436))

(assert (= (and b!126436 res!61164) b!126448))

(assert (= (and b!126449 res!61165) b!126439))

(assert (= (and b!126439 c!23098) b!126441))

(assert (= (and b!126439 (not c!23098)) b!126443))

(assert (= (and b!126441 res!61169) b!126440))

(assert (= (or b!126441 b!126443) bm!13625))

(assert (= (and b!126439 res!61171) b!126447))

(assert (= (and b!126447 c!23101) b!126435))

(assert (= (and b!126447 (not c!23101)) b!126437))

(assert (= (and b!126435 res!61170) b!126442))

(assert (= (or b!126435 b!126437) bm!13622))

(declare-fun b_lambda!5563 () Bool)

(assert (=> (not b_lambda!5563) (not b!126448)))

(assert (=> b!126448 t!6053))

(declare-fun b_and!7779 () Bool)

(assert (= b_and!7775 (and (=> t!6053 result!3847) b_and!7779)))

(assert (=> b!126448 t!6055))

(declare-fun b_and!7781 () Bool)

(assert (= b_and!7777 (and (=> t!6055 result!3849) b_and!7781)))

(assert (=> b!126436 m!147041))

(assert (=> b!126436 m!147041))

(declare-fun m!147317 () Bool)

(assert (=> b!126436 m!147317))

(assert (=> d!38001 m!147051))

(declare-fun m!147319 () Bool)

(assert (=> b!126438 m!147319))

(declare-fun m!147321 () Bool)

(assert (=> b!126438 m!147321))

(assert (=> b!126438 m!147321))

(declare-fun m!147323 () Bool)

(assert (=> b!126438 m!147323))

(declare-fun m!147325 () Bool)

(assert (=> b!126438 m!147325))

(declare-fun m!147327 () Bool)

(assert (=> b!126438 m!147327))

(declare-fun m!147329 () Bool)

(assert (=> b!126438 m!147329))

(declare-fun m!147331 () Bool)

(assert (=> b!126438 m!147331))

(declare-fun m!147333 () Bool)

(assert (=> b!126438 m!147333))

(assert (=> b!126438 m!147325))

(declare-fun m!147335 () Bool)

(assert (=> b!126438 m!147335))

(declare-fun m!147337 () Bool)

(assert (=> b!126438 m!147337))

(declare-fun m!147339 () Bool)

(assert (=> b!126438 m!147339))

(declare-fun m!147341 () Bool)

(assert (=> b!126438 m!147341))

(declare-fun m!147343 () Bool)

(assert (=> b!126438 m!147343))

(assert (=> b!126438 m!147041))

(assert (=> b!126438 m!147327))

(declare-fun m!147345 () Bool)

(assert (=> b!126438 m!147345))

(declare-fun m!147347 () Bool)

(assert (=> b!126438 m!147347))

(declare-fun m!147349 () Bool)

(assert (=> b!126438 m!147349))

(assert (=> b!126438 m!147339))

(declare-fun m!147351 () Bool)

(assert (=> bm!13622 m!147351))

(assert (=> b!126450 m!147041))

(assert (=> b!126450 m!147041))

(assert (=> b!126450 m!147043))

(declare-fun m!147353 () Bool)

(assert (=> b!126442 m!147353))

(assert (=> b!126446 m!147041))

(assert (=> b!126446 m!147041))

(assert (=> b!126446 m!147043))

(declare-fun m!147355 () Bool)

(assert (=> bm!13624 m!147355))

(declare-fun m!147357 () Bool)

(assert (=> b!126451 m!147357))

(assert (=> bm!13627 m!147347))

(assert (=> b!126448 m!147041))

(assert (=> b!126448 m!147145))

(declare-fun m!147359 () Bool)

(assert (=> b!126448 m!147359))

(assert (=> b!126448 m!147145))

(declare-fun m!147361 () Bool)

(assert (=> b!126448 m!147361))

(assert (=> b!126448 m!147359))

(assert (=> b!126448 m!147041))

(declare-fun m!147363 () Bool)

(assert (=> b!126448 m!147363))

(declare-fun m!147365 () Bool)

(assert (=> b!126440 m!147365))

(declare-fun m!147367 () Bool)

(assert (=> bm!13625 m!147367))

(assert (=> bm!13569 d!38001))

(declare-fun d!38003 () Bool)

(assert (=> d!38003 (= (inRange!0 (ite c!23029 (ite c!23026 (index!3236 lt!65100) (ite c!23031 (index!3235 lt!65120) (index!3238 lt!65120))) (ite c!23030 (index!3236 lt!65108) (ite c!23028 (index!3235 lt!65103) (index!3238 lt!65103)))) (mask!7039 newMap!16)) (and (bvsge (ite c!23029 (ite c!23026 (index!3236 lt!65100) (ite c!23031 (index!3235 lt!65120) (index!3238 lt!65120))) (ite c!23030 (index!3236 lt!65108) (ite c!23028 (index!3235 lt!65103) (index!3238 lt!65103)))) #b00000000000000000000000000000000) (bvslt (ite c!23029 (ite c!23026 (index!3236 lt!65100) (ite c!23031 (index!3235 lt!65120) (index!3238 lt!65120))) (ite c!23030 (index!3236 lt!65108) (ite c!23028 (index!3235 lt!65103) (index!3238 lt!65103)))) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13570 d!38003))

(declare-fun d!38005 () Bool)

(declare-fun e!82586 () Bool)

(assert (=> d!38005 e!82586))

(declare-fun res!61173 () Bool)

(assert (=> d!38005 (=> (not res!61173) (not e!82586))))

(declare-fun lt!65349 () ListLongMap!1681)

(assert (=> d!38005 (= res!61173 (contains!877 lt!65349 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65347 () List!1698)

(assert (=> d!38005 (= lt!65349 (ListLongMap!1682 lt!65347))))

(declare-fun lt!65348 () Unit!3924)

(declare-fun lt!65350 () Unit!3924)

(assert (=> d!38005 (= lt!65348 lt!65350)))

(assert (=> d!38005 (= (getValueByKey!167 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (Some!172 (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38005 (= lt!65350 (lemmaContainsTupThenGetReturnValue!82 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38005 (= lt!65347 (insertStrictlySorted!85 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38005 (= (+!170 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65349)))

(declare-fun b!126453 () Bool)

(declare-fun res!61174 () Bool)

(assert (=> b!126453 (=> (not res!61174) (not e!82586))))

(assert (=> b!126453 (= res!61174 (= (getValueByKey!167 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (Some!172 (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126454 () Bool)

(assert (=> b!126454 (= e!82586 (contains!879 (toList!856 lt!65349) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (= (and d!38005 res!61173) b!126453))

(assert (= (and b!126453 res!61174) b!126454))

(declare-fun m!147369 () Bool)

(assert (=> d!38005 m!147369))

(declare-fun m!147371 () Bool)

(assert (=> d!38005 m!147371))

(declare-fun m!147373 () Bool)

(assert (=> d!38005 m!147373))

(declare-fun m!147375 () Bool)

(assert (=> d!38005 m!147375))

(declare-fun m!147377 () Bool)

(assert (=> b!126453 m!147377))

(declare-fun m!147379 () Bool)

(assert (=> b!126454 m!147379))

(assert (=> bm!13507 d!38005))

(declare-fun d!38007 () Bool)

(declare-fun res!61179 () Bool)

(declare-fun e!82591 () Bool)

(assert (=> d!38007 (=> res!61179 e!82591)))

(assert (=> d!38007 (= res!61179 (= (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38007 (= (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82591)))

(declare-fun b!126459 () Bool)

(declare-fun e!82592 () Bool)

(assert (=> b!126459 (= e!82591 e!82592)))

(declare-fun res!61180 () Bool)

(assert (=> b!126459 (=> (not res!61180) (not e!82592))))

(assert (=> b!126459 (= res!61180 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126460 () Bool)

(assert (=> b!126460 (= e!82592 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38007 (not res!61179)) b!126459))

(assert (= (and b!126459 res!61180) b!126460))

(assert (=> d!38007 m!147041))

(assert (=> b!126460 m!146847))

(declare-fun m!147381 () Bool)

(assert (=> b!126460 m!147381))

(assert (=> bm!13583 d!38007))

(declare-fun d!38009 () Bool)

(declare-fun res!61181 () Bool)

(declare-fun e!82593 () Bool)

(assert (=> d!38009 (=> (not res!61181) (not e!82593))))

(assert (=> d!38009 (= res!61181 (simpleValid!87 (_2!1300 lt!65097)))))

(assert (=> d!38009 (= (valid!505 (_2!1300 lt!65097)) e!82593)))

(declare-fun b!126461 () Bool)

(declare-fun res!61182 () Bool)

(assert (=> b!126461 (=> (not res!61182) (not e!82593))))

(assert (=> b!126461 (= res!61182 (= (arrayCountValidKeys!0 (_keys!4516 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))) (_size!580 (_2!1300 lt!65097))))))

(declare-fun b!126462 () Bool)

(declare-fun res!61183 () Bool)

(assert (=> b!126462 (=> (not res!61183) (not e!82593))))

(assert (=> b!126462 (= res!61183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097))))))

(declare-fun b!126463 () Bool)

(assert (=> b!126463 (= e!82593 (arrayNoDuplicates!0 (_keys!4516 (_2!1300 lt!65097)) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38009 res!61181) b!126461))

(assert (= (and b!126461 res!61182) b!126462))

(assert (= (and b!126462 res!61183) b!126463))

(declare-fun m!147383 () Bool)

(assert (=> d!38009 m!147383))

(declare-fun m!147385 () Bool)

(assert (=> b!126461 m!147385))

(declare-fun m!147387 () Bool)

(assert (=> b!126462 m!147387))

(declare-fun m!147389 () Bool)

(assert (=> b!126463 m!147389))

(assert (=> d!37933 d!38009))

(assert (=> d!37933 d!37945))

(assert (=> d!37927 d!37997))

(declare-fun d!38011 () Bool)

(declare-fun e!82595 () Bool)

(assert (=> d!38011 e!82595))

(declare-fun res!61184 () Bool)

(assert (=> d!38011 (=> res!61184 e!82595)))

(declare-fun lt!65352 () Bool)

(assert (=> d!38011 (= res!61184 (not lt!65352))))

(declare-fun lt!65351 () Bool)

(assert (=> d!38011 (= lt!65352 lt!65351)))

(declare-fun lt!65354 () Unit!3924)

(declare-fun e!82594 () Unit!3924)

(assert (=> d!38011 (= lt!65354 e!82594)))

(declare-fun c!23102 () Bool)

(assert (=> d!38011 (= c!23102 lt!65351)))

(assert (=> d!38011 (= lt!65351 (containsKey!171 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(assert (=> d!38011 (= (contains!877 call!13583 (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))) lt!65352)))

(declare-fun b!126464 () Bool)

(declare-fun lt!65353 () Unit!3924)

(assert (=> b!126464 (= e!82594 lt!65353)))

(assert (=> b!126464 (= lt!65353 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(assert (=> b!126464 (isDefined!120 (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(declare-fun b!126465 () Bool)

(declare-fun Unit!3940 () Unit!3924)

(assert (=> b!126465 (= e!82594 Unit!3940)))

(declare-fun b!126466 () Bool)

(assert (=> b!126466 (= e!82595 (isDefined!120 (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))))

(assert (= (and d!38011 c!23102) b!126464))

(assert (= (and d!38011 (not c!23102)) b!126465))

(assert (= (and d!38011 (not res!61184)) b!126466))

(declare-fun m!147391 () Bool)

(assert (=> d!38011 m!147391))

(declare-fun m!147393 () Bool)

(assert (=> b!126464 m!147393))

(declare-fun m!147395 () Bool)

(assert (=> b!126464 m!147395))

(assert (=> b!126464 m!147395))

(declare-fun m!147397 () Bool)

(assert (=> b!126464 m!147397))

(assert (=> b!126466 m!147395))

(assert (=> b!126466 m!147395))

(assert (=> b!126466 m!147397))

(assert (=> bm!13573 d!38011))

(declare-fun d!38013 () Bool)

(declare-fun res!61185 () Bool)

(declare-fun e!82596 () Bool)

(assert (=> d!38013 (=> (not res!61185) (not e!82596))))

(assert (=> d!38013 (= res!61185 (simpleValid!87 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38013 (= (valid!505 (v!3124 (underlying!439 thiss!992))) e!82596)))

(declare-fun b!126467 () Bool)

(declare-fun res!61186 () Bool)

(assert (=> b!126467 (=> (not res!61186) (not e!82596))))

(assert (=> b!126467 (= res!61186 (= (arrayCountValidKeys!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))) (_size!580 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126468 () Bool)

(declare-fun res!61187 () Bool)

(assert (=> b!126468 (=> (not res!61187) (not e!82596))))

(assert (=> b!126468 (= res!61187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!126469 () Bool)

(assert (=> b!126469 (= e!82596 (arrayNoDuplicates!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38013 res!61185) b!126467))

(assert (= (and b!126467 res!61186) b!126468))

(assert (= (and b!126468 res!61187) b!126469))

(declare-fun m!147399 () Bool)

(assert (=> d!38013 m!147399))

(declare-fun m!147401 () Bool)

(assert (=> b!126467 m!147401))

(declare-fun m!147403 () Bool)

(assert (=> b!126468 m!147403))

(declare-fun m!147405 () Bool)

(assert (=> b!126469 m!147405))

(assert (=> d!37947 d!38013))

(declare-fun d!38015 () Bool)

(assert (=> d!38015 (= (apply!111 lt!65008 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5223 () Bool)

(assert (= bs!5223 d!38015))

(assert (=> bs!5223 m!147061))

(assert (=> bs!5223 m!147061))

(declare-fun m!147407 () Bool)

(assert (=> bs!5223 m!147407))

(assert (=> b!126053 d!38015))

(declare-fun d!38017 () Bool)

(assert (=> d!38017 (= (apply!111 lt!65028 lt!65029) (get!1447 (getValueByKey!167 (toList!856 lt!65028) lt!65029)))))

(declare-fun bs!5224 () Bool)

(assert (= bs!5224 d!38017))

(declare-fun m!147409 () Bool)

(assert (=> bs!5224 m!147409))

(assert (=> bs!5224 m!147409))

(declare-fun m!147411 () Bool)

(assert (=> bs!5224 m!147411))

(assert (=> b!126049 d!38017))

(declare-fun d!38019 () Bool)

(assert (=> d!38019 (= (apply!111 lt!65016 lt!65009) (get!1447 (getValueByKey!167 (toList!856 lt!65016) lt!65009)))))

(declare-fun bs!5225 () Bool)

(assert (= bs!5225 d!38019))

(declare-fun m!147413 () Bool)

(assert (=> bs!5225 m!147413))

(assert (=> bs!5225 m!147413))

(declare-fun m!147415 () Bool)

(assert (=> bs!5225 m!147415))

(assert (=> b!126049 d!38019))

(declare-fun d!38021 () Bool)

(assert (=> d!38021 (= (apply!111 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65029) (apply!111 lt!65028 lt!65029))))

(declare-fun lt!65357 () Unit!3924)

(declare-fun choose!764 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> d!38021 (= lt!65357 (choose!764 lt!65028 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65029))))

(declare-fun e!82599 () Bool)

(assert (=> d!38021 e!82599))

(declare-fun res!61190 () Bool)

(assert (=> d!38021 (=> (not res!61190) (not e!82599))))

(assert (=> d!38021 (= res!61190 (contains!877 lt!65028 lt!65029))))

(assert (=> d!38021 (= (addApplyDifferent!87 lt!65028 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65029) lt!65357)))

(declare-fun b!126473 () Bool)

(assert (=> b!126473 (= e!82599 (not (= lt!65029 lt!65025)))))

(assert (= (and d!38021 res!61190) b!126473))

(assert (=> d!38021 m!146901))

(assert (=> d!38021 m!146903))

(declare-fun m!147417 () Bool)

(assert (=> d!38021 m!147417))

(assert (=> d!38021 m!146925))

(declare-fun m!147419 () Bool)

(assert (=> d!38021 m!147419))

(assert (=> d!38021 m!146901))

(assert (=> b!126049 d!38021))

(declare-fun d!38023 () Bool)

(assert (=> d!38023 (= (apply!111 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65018) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65018)))))

(declare-fun bs!5226 () Bool)

(assert (= bs!5226 d!38023))

(declare-fun m!147421 () Bool)

(assert (=> bs!5226 m!147421))

(assert (=> bs!5226 m!147421))

(declare-fun m!147423 () Bool)

(assert (=> bs!5226 m!147423))

(assert (=> b!126049 d!38023))

(declare-fun d!38025 () Bool)

(declare-fun e!82600 () Bool)

(assert (=> d!38025 e!82600))

(declare-fun res!61191 () Bool)

(assert (=> d!38025 (=> (not res!61191) (not e!82600))))

(declare-fun lt!65360 () ListLongMap!1681)

(assert (=> d!38025 (= res!61191 (contains!877 lt!65360 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65358 () List!1698)

(assert (=> d!38025 (= lt!65360 (ListLongMap!1682 lt!65358))))

(declare-fun lt!65359 () Unit!3924)

(declare-fun lt!65361 () Unit!3924)

(assert (=> d!38025 (= lt!65359 lt!65361)))

(assert (=> d!38025 (= (getValueByKey!167 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38025 (= lt!65361 (lemmaContainsTupThenGetReturnValue!82 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38025 (= lt!65358 (insertStrictlySorted!85 (toList!856 lt!65016) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38025 (= (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65360)))

(declare-fun b!126474 () Bool)

(declare-fun res!61192 () Bool)

(assert (=> b!126474 (=> (not res!61192) (not e!82600))))

(assert (=> b!126474 (= res!61192 (= (getValueByKey!167 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126475 () Bool)

(assert (=> b!126475 (= e!82600 (contains!879 (toList!856 lt!65360) (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38025 res!61191) b!126474))

(assert (= (and b!126474 res!61192) b!126475))

(declare-fun m!147425 () Bool)

(assert (=> d!38025 m!147425))

(declare-fun m!147427 () Bool)

(assert (=> d!38025 m!147427))

(declare-fun m!147429 () Bool)

(assert (=> d!38025 m!147429))

(declare-fun m!147431 () Bool)

(assert (=> d!38025 m!147431))

(declare-fun m!147433 () Bool)

(assert (=> b!126474 m!147433))

(declare-fun m!147435 () Bool)

(assert (=> b!126475 m!147435))

(assert (=> b!126049 d!38025))

(declare-fun d!38027 () Bool)

(assert (=> d!38027 (contains!877 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65027)))

(declare-fun lt!65364 () Unit!3924)

(declare-fun choose!765 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> d!38027 (= lt!65364 (choose!765 lt!65020 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65027))))

(assert (=> d!38027 (contains!877 lt!65020 lt!65027)))

(assert (=> d!38027 (= (addStillContains!87 lt!65020 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65027) lt!65364)))

(declare-fun bs!5227 () Bool)

(assert (= bs!5227 d!38027))

(assert (=> bs!5227 m!146905))

(assert (=> bs!5227 m!146905))

(assert (=> bs!5227 m!146915))

(declare-fun m!147437 () Bool)

(assert (=> bs!5227 m!147437))

(declare-fun m!147439 () Bool)

(assert (=> bs!5227 m!147439))

(assert (=> b!126049 d!38027))

(declare-fun d!38029 () Bool)

(assert (=> d!38029 (= (apply!111 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65018) (apply!111 lt!65021 lt!65018))))

(declare-fun lt!65365 () Unit!3924)

(assert (=> d!38029 (= lt!65365 (choose!764 lt!65021 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65018))))

(declare-fun e!82601 () Bool)

(assert (=> d!38029 e!82601))

(declare-fun res!61193 () Bool)

(assert (=> d!38029 (=> (not res!61193) (not e!82601))))

(assert (=> d!38029 (= res!61193 (contains!877 lt!65021 lt!65018))))

(assert (=> d!38029 (= (addApplyDifferent!87 lt!65021 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65018) lt!65365)))

(declare-fun b!126477 () Bool)

(assert (=> b!126477 (= e!82601 (not (= lt!65018 lt!65026)))))

(assert (= (and d!38029 res!61193) b!126477))

(assert (=> d!38029 m!146907))

(assert (=> d!38029 m!146909))

(declare-fun m!147441 () Bool)

(assert (=> d!38029 m!147441))

(assert (=> d!38029 m!146899))

(declare-fun m!147443 () Bool)

(assert (=> d!38029 m!147443))

(assert (=> d!38029 m!146907))

(assert (=> b!126049 d!38029))

(declare-fun d!38031 () Bool)

(assert (=> d!38031 (= (apply!111 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65009) (apply!111 lt!65016 lt!65009))))

(declare-fun lt!65366 () Unit!3924)

(assert (=> d!38031 (= lt!65366 (choose!764 lt!65016 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65009))))

(declare-fun e!82602 () Bool)

(assert (=> d!38031 e!82602))

(declare-fun res!61194 () Bool)

(assert (=> d!38031 (=> (not res!61194) (not e!82602))))

(assert (=> d!38031 (= res!61194 (contains!877 lt!65016 lt!65009))))

(assert (=> d!38031 (= (addApplyDifferent!87 lt!65016 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65009) lt!65366)))

(declare-fun b!126478 () Bool)

(assert (=> b!126478 (= e!82602 (not (= lt!65009 lt!65022)))))

(assert (= (and d!38031 res!61194) b!126478))

(assert (=> d!38031 m!146919))

(assert (=> d!38031 m!146921))

(declare-fun m!147445 () Bool)

(assert (=> d!38031 m!147445))

(assert (=> d!38031 m!146911))

(declare-fun m!147447 () Bool)

(assert (=> d!38031 m!147447))

(assert (=> d!38031 m!146919))

(assert (=> b!126049 d!38031))

(declare-fun d!38033 () Bool)

(assert (=> d!38033 (= (apply!111 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65029) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65029)))))

(declare-fun bs!5228 () Bool)

(assert (= bs!5228 d!38033))

(declare-fun m!147449 () Bool)

(assert (=> bs!5228 m!147449))

(assert (=> bs!5228 m!147449))

(declare-fun m!147451 () Bool)

(assert (=> bs!5228 m!147451))

(assert (=> b!126049 d!38033))

(declare-fun d!38035 () Bool)

(declare-fun e!82603 () Bool)

(assert (=> d!38035 e!82603))

(declare-fun res!61195 () Bool)

(assert (=> d!38035 (=> (not res!61195) (not e!82603))))

(declare-fun lt!65369 () ListLongMap!1681)

(assert (=> d!38035 (= res!61195 (contains!877 lt!65369 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65367 () List!1698)

(assert (=> d!38035 (= lt!65369 (ListLongMap!1682 lt!65367))))

(declare-fun lt!65368 () Unit!3924)

(declare-fun lt!65370 () Unit!3924)

(assert (=> d!38035 (= lt!65368 lt!65370)))

(assert (=> d!38035 (= (getValueByKey!167 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38035 (= lt!65370 (lemmaContainsTupThenGetReturnValue!82 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38035 (= lt!65367 (insertStrictlySorted!85 (toList!856 lt!65021) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38035 (= (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65369)))

(declare-fun b!126479 () Bool)

(declare-fun res!61196 () Bool)

(assert (=> b!126479 (=> (not res!61196) (not e!82603))))

(assert (=> b!126479 (= res!61196 (= (getValueByKey!167 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126480 () Bool)

(assert (=> b!126480 (= e!82603 (contains!879 (toList!856 lt!65369) (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38035 res!61195) b!126479))

(assert (= (and b!126479 res!61196) b!126480))

(declare-fun m!147453 () Bool)

(assert (=> d!38035 m!147453))

(declare-fun m!147455 () Bool)

(assert (=> d!38035 m!147455))

(declare-fun m!147457 () Bool)

(assert (=> d!38035 m!147457))

(declare-fun m!147459 () Bool)

(assert (=> d!38035 m!147459))

(declare-fun m!147461 () Bool)

(assert (=> b!126479 m!147461))

(declare-fun m!147463 () Bool)

(assert (=> b!126480 m!147463))

(assert (=> b!126049 d!38035))

(declare-fun d!38037 () Bool)

(assert (=> d!38037 (= (apply!111 lt!65021 lt!65018) (get!1447 (getValueByKey!167 (toList!856 lt!65021) lt!65018)))))

(declare-fun bs!5229 () Bool)

(assert (= bs!5229 d!38037))

(declare-fun m!147465 () Bool)

(assert (=> bs!5229 m!147465))

(assert (=> bs!5229 m!147465))

(declare-fun m!147467 () Bool)

(assert (=> bs!5229 m!147467))

(assert (=> b!126049 d!38037))

(declare-fun b!126505 () Bool)

(declare-fun e!82621 () Bool)

(declare-fun e!82619 () Bool)

(assert (=> b!126505 (= e!82621 e!82619)))

(declare-fun c!23113 () Bool)

(declare-fun e!82624 () Bool)

(assert (=> b!126505 (= c!23113 e!82624)))

(declare-fun res!61207 () Bool)

(assert (=> b!126505 (=> (not res!61207) (not e!82624))))

(assert (=> b!126505 (= res!61207 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126506 () Bool)

(assert (=> b!126506 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126506 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun lt!65390 () ListLongMap!1681)

(declare-fun e!82620 () Bool)

(assert (=> b!126506 (= e!82620 (= (apply!111 lt!65390 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126507 () Bool)

(assert (=> b!126507 (= e!82624 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126507 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!126508 () Bool)

(assert (=> b!126508 (= e!82619 e!82620)))

(assert (=> b!126508 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun res!61206 () Bool)

(assert (=> b!126508 (= res!61206 (contains!877 lt!65390 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126508 (=> (not res!61206) (not e!82620))))

(declare-fun b!126509 () Bool)

(declare-fun e!82622 () ListLongMap!1681)

(assert (=> b!126509 (= e!82622 (ListLongMap!1682 Nil!1695))))

(declare-fun b!126510 () Bool)

(declare-fun e!82623 () ListLongMap!1681)

(assert (=> b!126510 (= e!82622 e!82623)))

(declare-fun c!23114 () Bool)

(assert (=> b!126510 (= c!23114 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126511 () Bool)

(declare-fun lt!65391 () Unit!3924)

(declare-fun lt!65385 () Unit!3924)

(assert (=> b!126511 (= lt!65391 lt!65385)))

(declare-fun lt!65386 () V!3435)

(declare-fun lt!65389 () (_ BitVec 64))

(declare-fun lt!65388 () ListLongMap!1681)

(declare-fun lt!65387 () (_ BitVec 64))

(assert (=> b!126511 (not (contains!877 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386)) lt!65387))))

(declare-fun addStillNotContains!56 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> b!126511 (= lt!65385 (addStillNotContains!56 lt!65388 lt!65389 lt!65386 lt!65387))))

(assert (=> b!126511 (= lt!65387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126511 (= lt!65386 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126511 (= lt!65389 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!13634 () ListLongMap!1681)

(assert (=> b!126511 (= lt!65388 call!13634)))

(assert (=> b!126511 (= e!82623 (+!170 call!13634 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126512 () Bool)

(declare-fun e!82618 () Bool)

(declare-fun isEmpty!397 (ListLongMap!1681) Bool)

(assert (=> b!126512 (= e!82618 (isEmpty!397 lt!65390))))

(declare-fun b!126513 () Bool)

(assert (=> b!126513 (= e!82619 e!82618)))

(declare-fun c!23112 () Bool)

(assert (=> b!126513 (= c!23112 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126514 () Bool)

(declare-fun res!61205 () Bool)

(assert (=> b!126514 (=> (not res!61205) (not e!82621))))

(assert (=> b!126514 (= res!61205 (not (contains!877 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126515 () Bool)

(assert (=> b!126515 (= e!82618 (= lt!65390 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126516 () Bool)

(assert (=> b!126516 (= e!82623 call!13634)))

(declare-fun d!38039 () Bool)

(assert (=> d!38039 e!82621))

(declare-fun res!61208 () Bool)

(assert (=> d!38039 (=> (not res!61208) (not e!82621))))

(assert (=> d!38039 (= res!61208 (not (contains!877 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38039 (= lt!65390 e!82622)))

(declare-fun c!23111 () Bool)

(assert (=> d!38039 (= c!23111 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38039 (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38039 (= (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))) lt!65390)))

(declare-fun bm!13631 () Bool)

(assert (=> bm!13631 (= call!13634 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(assert (= (and d!38039 c!23111) b!126509))

(assert (= (and d!38039 (not c!23111)) b!126510))

(assert (= (and b!126510 c!23114) b!126511))

(assert (= (and b!126510 (not c!23114)) b!126516))

(assert (= (or b!126511 b!126516) bm!13631))

(assert (= (and d!38039 res!61208) b!126514))

(assert (= (and b!126514 res!61205) b!126505))

(assert (= (and b!126505 res!61207) b!126507))

(assert (= (and b!126505 c!23113) b!126508))

(assert (= (and b!126505 (not c!23113)) b!126513))

(assert (= (and b!126508 res!61206) b!126506))

(assert (= (and b!126513 c!23112) b!126515))

(assert (= (and b!126513 (not c!23112)) b!126512))

(declare-fun b_lambda!5565 () Bool)

(assert (=> (not b_lambda!5565) (not b!126506)))

(assert (=> b!126506 t!6042))

(declare-fun b_and!7783 () Bool)

(assert (= b_and!7779 (and (=> t!6042 result!3833) b_and!7783)))

(assert (=> b!126506 t!6044))

(declare-fun b_and!7785 () Bool)

(assert (= b_and!7781 (and (=> t!6044 result!3837) b_and!7785)))

(declare-fun b_lambda!5567 () Bool)

(assert (=> (not b_lambda!5567) (not b!126511)))

(assert (=> b!126511 t!6042))

(declare-fun b_and!7787 () Bool)

(assert (= b_and!7783 (and (=> t!6042 result!3833) b_and!7787)))

(assert (=> b!126511 t!6044))

(declare-fun b_and!7789 () Bool)

(assert (= b_and!7785 (and (=> t!6044 result!3837) b_and!7789)))

(declare-fun m!147469 () Bool)

(assert (=> b!126515 m!147469))

(assert (=> b!126508 m!146895))

(assert (=> b!126508 m!146895))

(declare-fun m!147471 () Bool)

(assert (=> b!126508 m!147471))

(assert (=> b!126507 m!146895))

(assert (=> b!126507 m!146895))

(assert (=> b!126507 m!146933))

(declare-fun m!147473 () Bool)

(assert (=> b!126512 m!147473))

(declare-fun m!147475 () Bool)

(assert (=> d!38039 m!147475))

(assert (=> d!38039 m!146839))

(declare-fun m!147477 () Bool)

(assert (=> b!126511 m!147477))

(declare-fun m!147479 () Bool)

(assert (=> b!126511 m!147479))

(assert (=> b!126511 m!146941))

(assert (=> b!126511 m!146843))

(assert (=> b!126511 m!146943))

(assert (=> b!126511 m!147479))

(declare-fun m!147481 () Bool)

(assert (=> b!126511 m!147481))

(assert (=> b!126511 m!146941))

(assert (=> b!126511 m!146895))

(declare-fun m!147483 () Bool)

(assert (=> b!126511 m!147483))

(assert (=> b!126511 m!146843))

(assert (=> bm!13631 m!147469))

(declare-fun m!147485 () Bool)

(assert (=> b!126514 m!147485))

(assert (=> b!126510 m!146895))

(assert (=> b!126510 m!146895))

(assert (=> b!126510 m!146933))

(assert (=> b!126506 m!146941))

(assert (=> b!126506 m!146843))

(assert (=> b!126506 m!146943))

(assert (=> b!126506 m!146941))

(assert (=> b!126506 m!146895))

(declare-fun m!147487 () Bool)

(assert (=> b!126506 m!147487))

(assert (=> b!126506 m!146895))

(assert (=> b!126506 m!146843))

(assert (=> b!126049 d!38039))

(declare-fun d!38041 () Bool)

(assert (=> d!38041 (= (apply!111 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65009) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65009)))))

(declare-fun bs!5230 () Bool)

(assert (= bs!5230 d!38041))

(declare-fun m!147489 () Bool)

(assert (=> bs!5230 m!147489))

(assert (=> bs!5230 m!147489))

(declare-fun m!147491 () Bool)

(assert (=> bs!5230 m!147491))

(assert (=> b!126049 d!38041))

(declare-fun d!38043 () Bool)

(declare-fun e!82626 () Bool)

(assert (=> d!38043 e!82626))

(declare-fun res!61209 () Bool)

(assert (=> d!38043 (=> res!61209 e!82626)))

(declare-fun lt!65393 () Bool)

(assert (=> d!38043 (= res!61209 (not lt!65393))))

(declare-fun lt!65392 () Bool)

(assert (=> d!38043 (= lt!65393 lt!65392)))

(declare-fun lt!65395 () Unit!3924)

(declare-fun e!82625 () Unit!3924)

(assert (=> d!38043 (= lt!65395 e!82625)))

(declare-fun c!23115 () Bool)

(assert (=> d!38043 (= c!23115 lt!65392)))

(assert (=> d!38043 (= lt!65392 (containsKey!171 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(assert (=> d!38043 (= (contains!877 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65027) lt!65393)))

(declare-fun b!126517 () Bool)

(declare-fun lt!65394 () Unit!3924)

(assert (=> b!126517 (= e!82625 lt!65394)))

(assert (=> b!126517 (= lt!65394 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(assert (=> b!126517 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(declare-fun b!126518 () Bool)

(declare-fun Unit!3941 () Unit!3924)

(assert (=> b!126518 (= e!82625 Unit!3941)))

(declare-fun b!126519 () Bool)

(assert (=> b!126519 (= e!82626 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027)))))

(assert (= (and d!38043 c!23115) b!126517))

(assert (= (and d!38043 (not c!23115)) b!126518))

(assert (= (and d!38043 (not res!61209)) b!126519))

(declare-fun m!147493 () Bool)

(assert (=> d!38043 m!147493))

(declare-fun m!147495 () Bool)

(assert (=> b!126517 m!147495))

(declare-fun m!147497 () Bool)

(assert (=> b!126517 m!147497))

(assert (=> b!126517 m!147497))

(declare-fun m!147499 () Bool)

(assert (=> b!126517 m!147499))

(assert (=> b!126519 m!147497))

(assert (=> b!126519 m!147497))

(assert (=> b!126519 m!147499))

(assert (=> b!126049 d!38043))

(declare-fun d!38045 () Bool)

(declare-fun e!82627 () Bool)

(assert (=> d!38045 e!82627))

(declare-fun res!61210 () Bool)

(assert (=> d!38045 (=> (not res!61210) (not e!82627))))

(declare-fun lt!65398 () ListLongMap!1681)

(assert (=> d!38045 (= res!61210 (contains!877 lt!65398 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65396 () List!1698)

(assert (=> d!38045 (= lt!65398 (ListLongMap!1682 lt!65396))))

(declare-fun lt!65397 () Unit!3924)

(declare-fun lt!65399 () Unit!3924)

(assert (=> d!38045 (= lt!65397 lt!65399)))

(assert (=> d!38045 (= (getValueByKey!167 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38045 (= lt!65399 (lemmaContainsTupThenGetReturnValue!82 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38045 (= lt!65396 (insertStrictlySorted!85 (toList!856 lt!65020) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38045 (= (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65398)))

(declare-fun b!126520 () Bool)

(declare-fun res!61211 () Bool)

(assert (=> b!126520 (=> (not res!61211) (not e!82627))))

(assert (=> b!126520 (= res!61211 (= (getValueByKey!167 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126521 () Bool)

(assert (=> b!126521 (= e!82627 (contains!879 (toList!856 lt!65398) (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38045 res!61210) b!126520))

(assert (= (and b!126520 res!61211) b!126521))

(declare-fun m!147501 () Bool)

(assert (=> d!38045 m!147501))

(declare-fun m!147503 () Bool)

(assert (=> d!38045 m!147503))

(declare-fun m!147505 () Bool)

(assert (=> d!38045 m!147505))

(declare-fun m!147507 () Bool)

(assert (=> d!38045 m!147507))

(declare-fun m!147509 () Bool)

(assert (=> b!126520 m!147509))

(declare-fun m!147511 () Bool)

(assert (=> b!126521 m!147511))

(assert (=> b!126049 d!38045))

(declare-fun d!38047 () Bool)

(declare-fun e!82628 () Bool)

(assert (=> d!38047 e!82628))

(declare-fun res!61212 () Bool)

(assert (=> d!38047 (=> (not res!61212) (not e!82628))))

(declare-fun lt!65402 () ListLongMap!1681)

(assert (=> d!38047 (= res!61212 (contains!877 lt!65402 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65400 () List!1698)

(assert (=> d!38047 (= lt!65402 (ListLongMap!1682 lt!65400))))

(declare-fun lt!65401 () Unit!3924)

(declare-fun lt!65403 () Unit!3924)

(assert (=> d!38047 (= lt!65401 lt!65403)))

(assert (=> d!38047 (= (getValueByKey!167 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38047 (= lt!65403 (lemmaContainsTupThenGetReturnValue!82 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38047 (= lt!65400 (insertStrictlySorted!85 (toList!856 lt!65028) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38047 (= (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65402)))

(declare-fun b!126522 () Bool)

(declare-fun res!61213 () Bool)

(assert (=> b!126522 (=> (not res!61213) (not e!82628))))

(assert (=> b!126522 (= res!61213 (= (getValueByKey!167 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126523 () Bool)

(assert (=> b!126523 (= e!82628 (contains!879 (toList!856 lt!65402) (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38047 res!61212) b!126522))

(assert (= (and b!126522 res!61213) b!126523))

(declare-fun m!147513 () Bool)

(assert (=> d!38047 m!147513))

(declare-fun m!147515 () Bool)

(assert (=> d!38047 m!147515))

(declare-fun m!147517 () Bool)

(assert (=> d!38047 m!147517))

(declare-fun m!147519 () Bool)

(assert (=> d!38047 m!147519))

(declare-fun m!147521 () Bool)

(assert (=> b!126522 m!147521))

(declare-fun m!147523 () Bool)

(assert (=> b!126523 m!147523))

(assert (=> b!126049 d!38047))

(declare-fun d!38049 () Bool)

(assert (=> d!38049 (= (apply!111 lt!65008 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5231 () Bool)

(assert (= bs!5231 d!38049))

(assert (=> bs!5231 m!147231))

(assert (=> bs!5231 m!147231))

(declare-fun m!147525 () Bool)

(assert (=> bs!5231 m!147525))

(assert (=> b!126051 d!38049))

(assert (=> bm!13566 d!37977))

(declare-fun d!38051 () Bool)

(declare-fun e!82630 () Bool)

(assert (=> d!38051 e!82630))

(declare-fun res!61214 () Bool)

(assert (=> d!38051 (=> res!61214 e!82630)))

(declare-fun lt!65405 () Bool)

(assert (=> d!38051 (= res!61214 (not lt!65405))))

(declare-fun lt!65404 () Bool)

(assert (=> d!38051 (= lt!65405 lt!65404)))

(declare-fun lt!65407 () Unit!3924)

(declare-fun e!82629 () Unit!3924)

(assert (=> d!38051 (= lt!65407 e!82629)))

(declare-fun c!23116 () Bool)

(assert (=> d!38051 (= c!23116 lt!65404)))

(assert (=> d!38051 (= lt!65404 (containsKey!171 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38051 (= (contains!877 lt!65008 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65405)))

(declare-fun b!126524 () Bool)

(declare-fun lt!65406 () Unit!3924)

(assert (=> b!126524 (= e!82629 lt!65406)))

(assert (=> b!126524 (= lt!65406 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126524 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126525 () Bool)

(declare-fun Unit!3942 () Unit!3924)

(assert (=> b!126525 (= e!82629 Unit!3942)))

(declare-fun b!126526 () Bool)

(assert (=> b!126526 (= e!82630 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38051 c!23116) b!126524))

(assert (= (and d!38051 (not c!23116)) b!126525))

(assert (= (and d!38051 (not res!61214)) b!126526))

(assert (=> d!38051 m!146895))

(declare-fun m!147527 () Bool)

(assert (=> d!38051 m!147527))

(assert (=> b!126524 m!146895))

(declare-fun m!147529 () Bool)

(assert (=> b!126524 m!147529))

(assert (=> b!126524 m!146895))

(assert (=> b!126524 m!147031))

(assert (=> b!126524 m!147031))

(declare-fun m!147531 () Bool)

(assert (=> b!126524 m!147531))

(assert (=> b!126526 m!146895))

(assert (=> b!126526 m!147031))

(assert (=> b!126526 m!147031))

(assert (=> b!126526 m!147531))

(assert (=> b!126047 d!38051))

(assert (=> bm!13510 d!38039))

(declare-fun d!38053 () Bool)

(assert (=> d!38053 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65410 () Unit!3924)

(declare-fun choose!766 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 V!3435 Int) Unit!3924)

(assert (=> d!38053 (= lt!65410 (choose!766 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(assert (=> d!38053 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38053 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)) lt!65410)))

(declare-fun bs!5232 () Bool)

(assert (= bs!5232 d!38053))

(assert (=> bs!5232 m!146845))

(declare-fun m!147533 () Bool)

(assert (=> bs!5232 m!147533))

(assert (=> bs!5232 m!146845))

(declare-fun m!147535 () Bool)

(assert (=> bs!5232 m!147535))

(assert (=> bs!5232 m!146893))

(declare-fun m!147537 () Bool)

(assert (=> bs!5232 m!147537))

(assert (=> bs!5232 m!146893))

(assert (=> bs!5232 m!147051))

(assert (=> b!126186 d!38053))

(assert (=> b!126160 d!37997))

(declare-fun d!38055 () Bool)

(declare-fun res!61219 () Bool)

(declare-fun e!82635 () Bool)

(assert (=> d!38055 (=> res!61219 e!82635)))

(assert (=> d!38055 (= res!61219 (and ((_ is Cons!1694) (toList!856 lt!64952)) (= (_1!1299 (h!2296 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38055 (= (containsKey!171 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82635)))

(declare-fun b!126531 () Bool)

(declare-fun e!82636 () Bool)

(assert (=> b!126531 (= e!82635 e!82636)))

(declare-fun res!61220 () Bool)

(assert (=> b!126531 (=> (not res!61220) (not e!82636))))

(assert (=> b!126531 (= res!61220 (and (or (not ((_ is Cons!1694) (toList!856 lt!64952))) (bvsle (_1!1299 (h!2296 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!856 lt!64952)) (bvslt (_1!1299 (h!2296 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!126532 () Bool)

(assert (=> b!126532 (= e!82636 (containsKey!171 (t!6045 (toList!856 lt!64952)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38055 (not res!61219)) b!126531))

(assert (= (and b!126531 res!61220) b!126532))

(assert (=> b!126532 m!146847))

(declare-fun m!147539 () Bool)

(assert (=> b!126532 m!147539))

(assert (=> d!37931 d!38055))

(declare-fun d!38057 () Bool)

(declare-fun e!82639 () Bool)

(assert (=> d!38057 e!82639))

(declare-fun res!61225 () Bool)

(assert (=> d!38057 (=> (not res!61225) (not e!82639))))

(declare-fun lt!65415 () SeekEntryResult!270)

(assert (=> d!38057 (= res!61225 ((_ is Found!270) lt!65415))))

(assert (=> d!38057 (= lt!65415 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun lt!65416 () Unit!3924)

(declare-fun choose!767 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) Int) Unit!3924)

(assert (=> d!38057 (= lt!65416 (choose!767 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)))))

(assert (=> d!38057 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38057 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)) lt!65416)))

(declare-fun b!126537 () Bool)

(declare-fun res!61226 () Bool)

(assert (=> b!126537 (=> (not res!61226) (not e!82639))))

(assert (=> b!126537 (= res!61226 (inRange!0 (index!3236 lt!65415) (mask!7039 newMap!16)))))

(declare-fun b!126538 () Bool)

(assert (=> b!126538 (= e!82639 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65415)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!126538 (and (bvsge (index!3236 lt!65415) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65415) (size!2489 (_keys!4516 newMap!16))))))

(assert (= (and d!38057 res!61225) b!126537))

(assert (= (and b!126537 res!61226) b!126538))

(assert (=> d!38057 m!146847))

(assert (=> d!38057 m!146977))

(assert (=> d!38057 m!146847))

(declare-fun m!147541 () Bool)

(assert (=> d!38057 m!147541))

(assert (=> d!38057 m!147051))

(declare-fun m!147543 () Bool)

(assert (=> b!126537 m!147543))

(declare-fun m!147545 () Bool)

(assert (=> b!126538 m!147545))

(assert (=> bm!13572 d!38057))

(assert (=> b!126061 d!37975))

(declare-fun b!126549 () Bool)

(declare-fun e!82649 () Bool)

(declare-fun call!13637 () Bool)

(assert (=> b!126549 (= e!82649 call!13637)))

(declare-fun b!126550 () Bool)

(assert (=> b!126550 (= e!82649 call!13637)))

(declare-fun b!126551 () Bool)

(declare-fun e!82648 () Bool)

(assert (=> b!126551 (= e!82648 e!82649)))

(declare-fun c!23119 () Bool)

(assert (=> b!126551 (= c!23119 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13634 () Bool)

(assert (=> bm!13634 (= call!13637 (arrayNoDuplicates!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23119 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!38059 () Bool)

(declare-fun res!61233 () Bool)

(declare-fun e!82651 () Bool)

(assert (=> d!38059 (=> res!61233 e!82651)))

(assert (=> d!38059 (= res!61233 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38059 (= (arrayNoDuplicates!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 Nil!1697) e!82651)))

(declare-fun b!126552 () Bool)

(assert (=> b!126552 (= e!82651 e!82648)))

(declare-fun res!61235 () Bool)

(assert (=> b!126552 (=> (not res!61235) (not e!82648))))

(declare-fun e!82650 () Bool)

(assert (=> b!126552 (= res!61235 (not e!82650))))

(declare-fun res!61234 () Bool)

(assert (=> b!126552 (=> (not res!61234) (not e!82650))))

(assert (=> b!126552 (= res!61234 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126553 () Bool)

(declare-fun contains!880 (List!1700 (_ BitVec 64)) Bool)

(assert (=> b!126553 (= e!82650 (contains!880 Nil!1697 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38059 (not res!61233)) b!126552))

(assert (= (and b!126552 res!61234) b!126553))

(assert (= (and b!126552 res!61235) b!126551))

(assert (= (and b!126551 c!23119) b!126550))

(assert (= (and b!126551 (not c!23119)) b!126549))

(assert (= (or b!126550 b!126549) bm!13634))

(assert (=> b!126551 m!147041))

(assert (=> b!126551 m!147041))

(assert (=> b!126551 m!147043))

(assert (=> bm!13634 m!147041))

(declare-fun m!147547 () Bool)

(assert (=> bm!13634 m!147547))

(assert (=> b!126552 m!147041))

(assert (=> b!126552 m!147041))

(assert (=> b!126552 m!147043))

(assert (=> b!126553 m!147041))

(assert (=> b!126553 m!147041))

(declare-fun m!147549 () Bool)

(assert (=> b!126553 m!147549))

(assert (=> b!126207 d!38059))

(assert (=> bm!13579 d!37927))

(declare-fun d!38061 () Bool)

(assert (=> d!38061 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65419 () Unit!3924)

(declare-fun choose!768 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 V!3435 Int) Unit!3924)

(assert (=> d!38061 (= lt!65419 (choose!768 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65113 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) (defaultEntry!2783 newMap!16)))))

(assert (=> d!38061 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38061 (= (lemmaChangeZeroKeyThenAddPairToListMap!56 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65113 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) (defaultEntry!2783 newMap!16)) lt!65419)))

(declare-fun bs!5233 () Bool)

(assert (= bs!5233 d!38061))

(assert (=> bs!5233 m!147051))

(assert (=> bs!5233 m!146893))

(declare-fun m!147551 () Bool)

(assert (=> bs!5233 m!147551))

(assert (=> bs!5233 m!146893))

(assert (=> bs!5233 m!146845))

(declare-fun m!147553 () Bool)

(assert (=> bs!5233 m!147553))

(assert (=> bs!5233 m!146845))

(declare-fun m!147555 () Bool)

(assert (=> bs!5233 m!147555))

(assert (=> b!126172 d!38061))

(declare-fun d!38063 () Bool)

(declare-fun e!82652 () Bool)

(assert (=> d!38063 e!82652))

(declare-fun res!61236 () Bool)

(assert (=> d!38063 (=> (not res!61236) (not e!82652))))

(declare-fun lt!65422 () ListLongMap!1681)

(assert (=> d!38063 (= res!61236 (contains!877 lt!65422 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65420 () List!1698)

(assert (=> d!38063 (= lt!65422 (ListLongMap!1682 lt!65420))))

(declare-fun lt!65421 () Unit!3924)

(declare-fun lt!65423 () Unit!3924)

(assert (=> d!38063 (= lt!65421 lt!65423)))

(assert (=> d!38063 (= (getValueByKey!167 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38063 (= lt!65423 (lemmaContainsTupThenGetReturnValue!82 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38063 (= lt!65420 (insertStrictlySorted!85 (toList!856 call!13513) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38063 (= (+!170 call!13513 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65422)))

(declare-fun b!126554 () Bool)

(declare-fun res!61237 () Bool)

(assert (=> b!126554 (=> (not res!61237) (not e!82652))))

(assert (=> b!126554 (= res!61237 (= (getValueByKey!167 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126555 () Bool)

(assert (=> b!126555 (= e!82652 (contains!879 (toList!856 lt!65422) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38063 res!61236) b!126554))

(assert (= (and b!126554 res!61237) b!126555))

(declare-fun m!147557 () Bool)

(assert (=> d!38063 m!147557))

(declare-fun m!147559 () Bool)

(assert (=> d!38063 m!147559))

(declare-fun m!147561 () Bool)

(assert (=> d!38063 m!147561))

(declare-fun m!147563 () Bool)

(assert (=> d!38063 m!147563))

(declare-fun m!147565 () Bool)

(assert (=> b!126554 m!147565))

(declare-fun m!147567 () Bool)

(assert (=> b!126555 m!147567))

(assert (=> b!126062 d!38063))

(declare-fun mapIsEmpty!4511 () Bool)

(declare-fun mapRes!4511 () Bool)

(assert (=> mapIsEmpty!4511 mapRes!4511))

(declare-fun condMapEmpty!4511 () Bool)

(declare-fun mapDefault!4511 () ValueCell!1077)

(assert (=> mapNonEmpty!4510 (= condMapEmpty!4511 (= mapRest!4510 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4511)))))

(declare-fun e!82653 () Bool)

(assert (=> mapNonEmpty!4510 (= tp!10972 (and e!82653 mapRes!4511))))

(declare-fun b!126557 () Bool)

(assert (=> b!126557 (= e!82653 tp_is_empty!2841)))

(declare-fun b!126556 () Bool)

(declare-fun e!82654 () Bool)

(assert (=> b!126556 (= e!82654 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4511 () Bool)

(declare-fun tp!10973 () Bool)

(assert (=> mapNonEmpty!4511 (= mapRes!4511 (and tp!10973 e!82654))))

(declare-fun mapValue!4511 () ValueCell!1077)

(declare-fun mapRest!4511 () (Array (_ BitVec 32) ValueCell!1077))

(declare-fun mapKey!4511 () (_ BitVec 32))

(assert (=> mapNonEmpty!4511 (= mapRest!4510 (store mapRest!4511 mapKey!4511 mapValue!4511))))

(assert (= (and mapNonEmpty!4510 condMapEmpty!4511) mapIsEmpty!4511))

(assert (= (and mapNonEmpty!4510 (not condMapEmpty!4511)) mapNonEmpty!4511))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1077) mapValue!4511)) b!126556))

(assert (= (and mapNonEmpty!4510 ((_ is ValueCellFull!1077) mapDefault!4511)) b!126557))

(declare-fun m!147569 () Bool)

(assert (=> mapNonEmpty!4511 m!147569))

(declare-fun mapIsEmpty!4512 () Bool)

(declare-fun mapRes!4512 () Bool)

(assert (=> mapIsEmpty!4512 mapRes!4512))

(declare-fun condMapEmpty!4512 () Bool)

(declare-fun mapDefault!4512 () ValueCell!1077)

(assert (=> mapNonEmpty!4509 (= condMapEmpty!4512 (= mapRest!4509 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4512)))))

(declare-fun e!82655 () Bool)

(assert (=> mapNonEmpty!4509 (= tp!10971 (and e!82655 mapRes!4512))))

(declare-fun b!126559 () Bool)

(assert (=> b!126559 (= e!82655 tp_is_empty!2841)))

(declare-fun b!126558 () Bool)

(declare-fun e!82656 () Bool)

(assert (=> b!126558 (= e!82656 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4512 () Bool)

(declare-fun tp!10974 () Bool)

(assert (=> mapNonEmpty!4512 (= mapRes!4512 (and tp!10974 e!82656))))

(declare-fun mapKey!4512 () (_ BitVec 32))

(declare-fun mapValue!4512 () ValueCell!1077)

(declare-fun mapRest!4512 () (Array (_ BitVec 32) ValueCell!1077))

(assert (=> mapNonEmpty!4512 (= mapRest!4509 (store mapRest!4512 mapKey!4512 mapValue!4512))))

(assert (= (and mapNonEmpty!4509 condMapEmpty!4512) mapIsEmpty!4512))

(assert (= (and mapNonEmpty!4509 (not condMapEmpty!4512)) mapNonEmpty!4512))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1077) mapValue!4512)) b!126558))

(assert (= (and mapNonEmpty!4509 ((_ is ValueCellFull!1077) mapDefault!4512)) b!126559))

(declare-fun m!147571 () Bool)

(assert (=> mapNonEmpty!4512 m!147571))

(declare-fun b_lambda!5569 () Bool)

(assert (= b_lambda!5563 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5569)))

(declare-fun b_lambda!5571 () Bool)

(assert (= b_lambda!5565 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5571)))

(declare-fun b_lambda!5573 () Bool)

(assert (= b_lambda!5567 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5573)))

(declare-fun b_lambda!5575 () Bool)

(assert (= b_lambda!5559 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5575)))

(declare-fun b_lambda!5577 () Bool)

(assert (= b_lambda!5561 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5577)))

(check-sat (not d!37999) (not d!38061) (not b_lambda!5553) (not bm!13622) (not b_lambda!5575) (not d!37957) (not d!37981) (not b!126276) (not b!126515) (not bm!13601) (not d!38039) (not b!126325) (not d!37989) (not bm!13599) (not mapNonEmpty!4511) (not d!38013) tp_is_empty!2841 (not d!38017) (not b!126523) (not b!126520) (not d!37977) (not b!126517) b_and!7789 (not b!126522) (not b!126440) (not b!126298) (not b!126415) (not b!126423) (not d!37969) (not d!38021) (not b!126394) (not b!126521) (not b!126399) (not b!126537) (not d!38029) (not b!126474) (not bm!13618) (not b!126467) (not b!126431) (not bm!13598) (not d!38041) (not b!126442) (not b!126425) (not b!126511) (not b!126343) (not bm!13586) (not b!126510) (not b!126333) (not bm!13625) (not d!38037) (not b_next!2849) (not d!38009) (not bm!13595) (not b!126384) (not b!126287) (not b!126231) (not b!126406) (not b!126392) (not b!126460) (not b!126329) (not d!37963) (not b!126419) (not d!37979) (not bm!13620) (not b!126417) (not b!126430) (not bm!13624) (not b!126554) (not b!126268) (not d!37959) (not b!126408) (not b!126405) (not d!37995) (not b!126265) (not d!38057) (not b!126514) (not d!38047) (not d!38045) (not b!126480) (not d!37991) (not b!126219) (not d!38001) (not d!38023) (not b!126479) (not d!38027) (not d!37951) (not b!126270) (not b!126519) (not bm!13592) (not bm!13615) (not b_lambda!5573) (not b!126551) (not b!126318) (not bm!13611) (not b!126402) (not b!126553) (not b!126427) (not b!126413) (not b!126327) (not bm!13614) (not b!126266) (not b!126342) (not b!126446) (not b!126395) (not d!37985) (not d!38053) (not d!38043) (not b!126448) (not b!126526) (not b_next!2851) (not b!126450) (not b_lambda!5557) (not b!126555) (not b!126385) (not bm!13591) (not d!37965) (not b!126335) (not bm!13596) (not b!126507) (not b!126506) (not b!126453) (not b!126218) (not b!126462) (not mapNonEmpty!4512) (not d!38051) (not bm!13631) (not b!126532) (not b!126451) (not b!126428) (not bm!13617) (not d!38033) (not d!37993) (not d!38005) (not d!37997) (not b_lambda!5571) (not d!37987) (not bm!13612) (not d!38035) (not b!126337) (not b!126475) (not b!126454) (not d!37983) (not d!38011) (not b!126466) (not b!126345) (not b!126297) (not b!126436) (not bm!13634) (not b_lambda!5569) (not d!38063) (not d!38049) (not d!38025) (not b!126275) (not b!126438) (not b_lambda!5577) (not b!126388) (not d!38015) (not d!38031) (not d!38019) (not b!126338) (not b!126463) (not b!126469) (not b!126468) (not b!126464) (not b!126512) (not b!126323) (not b!126397) b_and!7787 (not bm!13627) (not b!126552) (not b!126508) (not b!126524) (not b!126461))
(check-sat b_and!7787 b_and!7789 (not b_next!2849) (not b_next!2851))
(get-model)

(declare-fun d!38065 () Bool)

(assert (=> d!38065 (= (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!396 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5234 () Bool)

(assert (= bs!5234 d!38065))

(assert (=> bs!5234 m!147031))

(declare-fun m!147573 () Bool)

(assert (=> bs!5234 m!147573))

(assert (=> b!126526 d!38065))

(declare-fun d!38067 () Bool)

(declare-fun c!23120 () Bool)

(assert (=> d!38067 (= c!23120 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!82657 () Option!173)

(assert (=> d!38067 (= (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!82657)))

(declare-fun b!126561 () Bool)

(declare-fun e!82658 () Option!173)

(assert (=> b!126561 (= e!82657 e!82658)))

(declare-fun c!23121 () Bool)

(assert (=> b!126561 (= c!23121 (and ((_ is Cons!1694) (toList!856 lt!65008)) (not (= (_1!1299 (h!2296 (toList!856 lt!65008))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!126563 () Bool)

(assert (=> b!126563 (= e!82658 None!171)))

(declare-fun b!126562 () Bool)

(assert (=> b!126562 (= e!82658 (getValueByKey!167 (t!6045 (toList!856 lt!65008)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!126560 () Bool)

(assert (=> b!126560 (= e!82657 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65008)))))))

(assert (= (and d!38067 c!23120) b!126560))

(assert (= (and d!38067 (not c!23120)) b!126561))

(assert (= (and b!126561 c!23121) b!126562))

(assert (= (and b!126561 (not c!23121)) b!126563))

(assert (=> b!126562 m!146895))

(declare-fun m!147575 () Bool)

(assert (=> b!126562 m!147575))

(assert (=> b!126526 d!38067))

(declare-fun d!38069 () Bool)

(declare-fun e!82659 () Bool)

(assert (=> d!38069 e!82659))

(declare-fun res!61238 () Bool)

(assert (=> d!38069 (=> (not res!61238) (not e!82659))))

(declare-fun lt!65426 () ListLongMap!1681)

(assert (=> d!38069 (= res!61238 (contains!877 lt!65426 (_1!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(declare-fun lt!65424 () List!1698)

(assert (=> d!38069 (= lt!65426 (ListLongMap!1682 lt!65424))))

(declare-fun lt!65425 () Unit!3924)

(declare-fun lt!65427 () Unit!3924)

(assert (=> d!38069 (= lt!65425 lt!65427)))

(assert (=> d!38069 (= (getValueByKey!167 lt!65424 (_1!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38069 (= lt!65427 (lemmaContainsTupThenGetReturnValue!82 lt!65424 (_1!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (_2!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38069 (= lt!65424 (insertStrictlySorted!85 (toList!856 (ite c!23069 call!13605 (ite c!23073 call!13599 call!13603))) (_1!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (_2!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38069 (= (+!170 (ite c!23069 call!13605 (ite c!23073 call!13599 call!13603)) (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) lt!65426)))

(declare-fun b!126564 () Bool)

(declare-fun res!61239 () Bool)

(assert (=> b!126564 (=> (not res!61239) (not e!82659))))

(assert (=> b!126564 (= res!61239 (= (getValueByKey!167 (toList!856 lt!65426) (_1!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))))

(declare-fun b!126565 () Bool)

(assert (=> b!126565 (= e!82659 (contains!879 (toList!856 lt!65426) (ite (or c!23069 c!23073) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (= (and d!38069 res!61238) b!126564))

(assert (= (and b!126564 res!61239) b!126565))

(declare-fun m!147577 () Bool)

(assert (=> d!38069 m!147577))

(declare-fun m!147579 () Bool)

(assert (=> d!38069 m!147579))

(declare-fun m!147581 () Bool)

(assert (=> d!38069 m!147581))

(declare-fun m!147583 () Bool)

(assert (=> d!38069 m!147583))

(declare-fun m!147585 () Bool)

(assert (=> b!126564 m!147585))

(declare-fun m!147587 () Bool)

(assert (=> b!126565 m!147587))

(assert (=> bm!13598 d!38069))

(declare-fun d!38071 () Bool)

(declare-fun lt!65433 () SeekEntryResult!270)

(assert (=> d!38071 (and (or ((_ is Undefined!270) lt!65433) (not ((_ is Found!270) lt!65433)) (and (bvsge (index!3236 lt!65433) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65433) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65433) ((_ is Found!270) lt!65433) (not ((_ is MissingVacant!270) lt!65433)) (not (= (index!3238 lt!65433) (index!3237 lt!65165))) (and (bvsge (index!3238 lt!65433) #b00000000000000000000000000000000) (bvslt (index!3238 lt!65433) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65433) (ite ((_ is Found!270) lt!65433) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65433)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (and ((_ is MissingVacant!270) lt!65433) (= (index!3238 lt!65433) (index!3237 lt!65165)) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!82667 () SeekEntryResult!270)

(assert (=> d!38071 (= lt!65433 e!82667)))

(declare-fun c!23130 () Bool)

(assert (=> d!38071 (= c!23130 (bvsge (x!14963 lt!65165) #b01111111111111111111111111111110))))

(declare-fun lt!65432 () (_ BitVec 64))

(assert (=> d!38071 (= lt!65432 (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65165)))))

(assert (=> d!38071 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38071 (= (seekKeyOrZeroReturnVacant!0 (x!14963 lt!65165) (index!3237 lt!65165) (index!3237 lt!65165) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)) lt!65433)))

(declare-fun b!126578 () Bool)

(declare-fun e!82668 () SeekEntryResult!270)

(assert (=> b!126578 (= e!82667 e!82668)))

(declare-fun c!23128 () Bool)

(assert (=> b!126578 (= c!23128 (= lt!65432 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82666 () SeekEntryResult!270)

(declare-fun b!126579 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!126579 (= e!82666 (seekKeyOrZeroReturnVacant!0 (bvadd (x!14963 lt!65165) #b00000000000000000000000000000001) (nextIndex!0 (index!3237 lt!65165) (x!14963 lt!65165) (mask!7039 newMap!16)) (index!3237 lt!65165) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun b!126580 () Bool)

(assert (=> b!126580 (= e!82666 (MissingVacant!270 (index!3237 lt!65165)))))

(declare-fun b!126581 () Bool)

(assert (=> b!126581 (= e!82667 Undefined!270)))

(declare-fun b!126582 () Bool)

(declare-fun c!23129 () Bool)

(assert (=> b!126582 (= c!23129 (= lt!65432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126582 (= e!82668 e!82666)))

(declare-fun b!126583 () Bool)

(assert (=> b!126583 (= e!82668 (Found!270 (index!3237 lt!65165)))))

(assert (= (and d!38071 c!23130) b!126581))

(assert (= (and d!38071 (not c!23130)) b!126578))

(assert (= (and b!126578 c!23128) b!126583))

(assert (= (and b!126578 (not c!23128)) b!126582))

(assert (= (and b!126582 c!23129) b!126580))

(assert (= (and b!126582 (not c!23129)) b!126579))

(declare-fun m!147589 () Bool)

(assert (=> d!38071 m!147589))

(declare-fun m!147591 () Bool)

(assert (=> d!38071 m!147591))

(assert (=> d!38071 m!147089))

(assert (=> d!38071 m!147051))

(declare-fun m!147593 () Bool)

(assert (=> b!126579 m!147593))

(assert (=> b!126579 m!147593))

(assert (=> b!126579 m!146847))

(declare-fun m!147595 () Bool)

(assert (=> b!126579 m!147595))

(assert (=> b!126318 d!38071))

(declare-fun b!126584 () Bool)

(declare-fun e!82672 () Bool)

(declare-fun e!82670 () Bool)

(assert (=> b!126584 (= e!82672 e!82670)))

(declare-fun c!23133 () Bool)

(declare-fun e!82675 () Bool)

(assert (=> b!126584 (= c!23133 e!82675)))

(declare-fun res!61242 () Bool)

(assert (=> b!126584 (=> (not res!61242) (not e!82675))))

(assert (=> b!126584 (= res!61242 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126585 () Bool)

(assert (=> b!126585 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> b!126585 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun lt!65439 () ListLongMap!1681)

(declare-fun e!82671 () Bool)

(assert (=> b!126585 (= e!82671 (= (apply!111 lt!65439 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126586 () Bool)

(assert (=> b!126586 (= e!82675 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!126586 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!126587 () Bool)

(assert (=> b!126587 (= e!82670 e!82671)))

(assert (=> b!126587 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun res!61241 () Bool)

(assert (=> b!126587 (= res!61241 (contains!877 lt!65439 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!126587 (=> (not res!61241) (not e!82671))))

(declare-fun b!126588 () Bool)

(declare-fun e!82673 () ListLongMap!1681)

(assert (=> b!126588 (= e!82673 (ListLongMap!1682 Nil!1695))))

(declare-fun b!126589 () Bool)

(declare-fun e!82674 () ListLongMap!1681)

(assert (=> b!126589 (= e!82673 e!82674)))

(declare-fun c!23134 () Bool)

(assert (=> b!126589 (= c!23134 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!126590 () Bool)

(declare-fun lt!65440 () Unit!3924)

(declare-fun lt!65434 () Unit!3924)

(assert (=> b!126590 (= lt!65440 lt!65434)))

(declare-fun lt!65435 () V!3435)

(declare-fun lt!65437 () ListLongMap!1681)

(declare-fun lt!65438 () (_ BitVec 64))

(declare-fun lt!65436 () (_ BitVec 64))

(assert (=> b!126590 (not (contains!877 (+!170 lt!65437 (tuple2!2577 lt!65438 lt!65435)) lt!65436))))

(assert (=> b!126590 (= lt!65434 (addStillNotContains!56 lt!65437 lt!65438 lt!65435 lt!65436))))

(assert (=> b!126590 (= lt!65436 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126590 (= lt!65435 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126590 (= lt!65438 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!13638 () ListLongMap!1681)

(assert (=> b!126590 (= lt!65437 call!13638)))

(assert (=> b!126590 (= e!82674 (+!170 call!13638 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126591 () Bool)

(declare-fun e!82669 () Bool)

(assert (=> b!126591 (= e!82669 (isEmpty!397 lt!65439))))

(declare-fun b!126592 () Bool)

(assert (=> b!126592 (= e!82670 e!82669)))

(declare-fun c!23132 () Bool)

(assert (=> b!126592 (= c!23132 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126593 () Bool)

(declare-fun res!61240 () Bool)

(assert (=> b!126593 (=> (not res!61240) (not e!82672))))

(assert (=> b!126593 (= res!61240 (not (contains!877 lt!65439 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126594 () Bool)

(assert (=> b!126594 (= e!82669 (= lt!65439 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126595 () Bool)

(assert (=> b!126595 (= e!82674 call!13638)))

(declare-fun d!38073 () Bool)

(assert (=> d!38073 e!82672))

(declare-fun res!61243 () Bool)

(assert (=> d!38073 (=> (not res!61243) (not e!82672))))

(assert (=> d!38073 (= res!61243 (not (contains!877 lt!65439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38073 (= lt!65439 e!82673)))

(declare-fun c!23131 () Bool)

(assert (=> d!38073 (= c!23131 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38073 (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992))))))

(assert (=> d!38073 (= (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))) lt!65439)))

(declare-fun bm!13635 () Bool)

(assert (=> bm!13635 (= call!13638 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (_values!2766 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992))) (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) (minValue!2646 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992)))))))

(assert (= (and d!38073 c!23131) b!126588))

(assert (= (and d!38073 (not c!23131)) b!126589))

(assert (= (and b!126589 c!23134) b!126590))

(assert (= (and b!126589 (not c!23134)) b!126595))

(assert (= (or b!126590 b!126595) bm!13635))

(assert (= (and d!38073 res!61243) b!126593))

(assert (= (and b!126593 res!61240) b!126584))

(assert (= (and b!126584 res!61242) b!126586))

(assert (= (and b!126584 c!23133) b!126587))

(assert (= (and b!126584 (not c!23133)) b!126592))

(assert (= (and b!126587 res!61241) b!126585))

(assert (= (and b!126592 c!23132) b!126594))

(assert (= (and b!126592 (not c!23132)) b!126591))

(declare-fun b_lambda!5579 () Bool)

(assert (=> (not b_lambda!5579) (not b!126585)))

(assert (=> b!126585 t!6042))

(declare-fun b_and!7791 () Bool)

(assert (= b_and!7787 (and (=> t!6042 result!3833) b_and!7791)))

(assert (=> b!126585 t!6044))

(declare-fun b_and!7793 () Bool)

(assert (= b_and!7789 (and (=> t!6044 result!3837) b_and!7793)))

(declare-fun b_lambda!5581 () Bool)

(assert (=> (not b_lambda!5581) (not b!126590)))

(assert (=> b!126590 t!6042))

(declare-fun b_and!7795 () Bool)

(assert (= b_and!7791 (and (=> t!6042 result!3833) b_and!7795)))

(assert (=> b!126590 t!6044))

(declare-fun b_and!7797 () Bool)

(assert (= b_and!7793 (and (=> t!6044 result!3837) b_and!7797)))

(declare-fun m!147597 () Bool)

(assert (=> b!126594 m!147597))

(declare-fun m!147599 () Bool)

(assert (=> b!126587 m!147599))

(assert (=> b!126587 m!147599))

(declare-fun m!147601 () Bool)

(assert (=> b!126587 m!147601))

(assert (=> b!126586 m!147599))

(assert (=> b!126586 m!147599))

(declare-fun m!147603 () Bool)

(assert (=> b!126586 m!147603))

(declare-fun m!147605 () Bool)

(assert (=> b!126591 m!147605))

(declare-fun m!147607 () Bool)

(assert (=> d!38073 m!147607))

(assert (=> d!38073 m!146839))

(declare-fun m!147609 () Bool)

(assert (=> b!126590 m!147609))

(declare-fun m!147611 () Bool)

(assert (=> b!126590 m!147611))

(declare-fun m!147613 () Bool)

(assert (=> b!126590 m!147613))

(assert (=> b!126590 m!146843))

(declare-fun m!147615 () Bool)

(assert (=> b!126590 m!147615))

(assert (=> b!126590 m!147611))

(declare-fun m!147617 () Bool)

(assert (=> b!126590 m!147617))

(assert (=> b!126590 m!147613))

(assert (=> b!126590 m!147599))

(declare-fun m!147619 () Bool)

(assert (=> b!126590 m!147619))

(assert (=> b!126590 m!146843))

(assert (=> bm!13635 m!147597))

(declare-fun m!147621 () Bool)

(assert (=> b!126593 m!147621))

(assert (=> b!126589 m!147599))

(assert (=> b!126589 m!147599))

(assert (=> b!126589 m!147603))

(assert (=> b!126585 m!147613))

(assert (=> b!126585 m!146843))

(assert (=> b!126585 m!147615))

(assert (=> b!126585 m!147613))

(assert (=> b!126585 m!147599))

(declare-fun m!147623 () Bool)

(assert (=> b!126585 m!147623))

(assert (=> b!126585 m!147599))

(assert (=> b!126585 m!146843))

(assert (=> bm!13631 d!38073))

(declare-fun d!38075 () Bool)

(assert (=> d!38075 (= (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126551 d!38075))

(assert (=> b!126507 d!37975))

(assert (=> b!126298 d!38075))

(declare-fun d!38077 () Bool)

(assert (=> d!38077 (isDefined!120 (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65441 () Unit!3924)

(assert (=> d!38077 (= lt!65441 (choose!761 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!82676 () Bool)

(assert (=> d!38077 e!82676))

(declare-fun res!61244 () Bool)

(assert (=> d!38077 (=> (not res!61244) (not e!82676))))

(assert (=> d!38077 (= res!61244 (isStrictlySorted!317 (toList!856 call!13571)))))

(assert (=> d!38077 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65441)))

(declare-fun b!126596 () Bool)

(assert (=> b!126596 (= e!82676 (containsKey!171 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38077 res!61244) b!126596))

(assert (=> d!38077 m!146847))

(assert (=> d!38077 m!147165))

(assert (=> d!38077 m!147165))

(assert (=> d!38077 m!147167))

(assert (=> d!38077 m!146847))

(declare-fun m!147625 () Bool)

(assert (=> d!38077 m!147625))

(declare-fun m!147627 () Bool)

(assert (=> d!38077 m!147627))

(assert (=> b!126596 m!146847))

(assert (=> b!126596 m!147161))

(assert (=> b!126343 d!38077))

(declare-fun d!38079 () Bool)

(assert (=> d!38079 (= (isDefined!120 (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!396 (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5235 () Bool)

(assert (= bs!5235 d!38079))

(assert (=> bs!5235 m!147165))

(declare-fun m!147629 () Bool)

(assert (=> bs!5235 m!147629))

(assert (=> b!126343 d!38079))

(declare-fun d!38081 () Bool)

(declare-fun c!23135 () Bool)

(assert (=> d!38081 (= c!23135 (and ((_ is Cons!1694) (toList!856 call!13571)) (= (_1!1299 (h!2296 (toList!856 call!13571))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun e!82677 () Option!173)

(assert (=> d!38081 (= (getValueByKey!167 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82677)))

(declare-fun b!126598 () Bool)

(declare-fun e!82678 () Option!173)

(assert (=> b!126598 (= e!82677 e!82678)))

(declare-fun c!23136 () Bool)

(assert (=> b!126598 (= c!23136 (and ((_ is Cons!1694) (toList!856 call!13571)) (not (= (_1!1299 (h!2296 (toList!856 call!13571))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun b!126600 () Bool)

(assert (=> b!126600 (= e!82678 None!171)))

(declare-fun b!126599 () Bool)

(assert (=> b!126599 (= e!82678 (getValueByKey!167 (t!6045 (toList!856 call!13571)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!126597 () Bool)

(assert (=> b!126597 (= e!82677 (Some!172 (_2!1299 (h!2296 (toList!856 call!13571)))))))

(assert (= (and d!38081 c!23135) b!126597))

(assert (= (and d!38081 (not c!23135)) b!126598))

(assert (= (and b!126598 c!23136) b!126599))

(assert (= (and b!126598 (not c!23136)) b!126600))

(assert (=> b!126599 m!146847))

(declare-fun m!147631 () Bool)

(assert (=> b!126599 m!147631))

(assert (=> b!126343 d!38081))

(declare-fun d!38083 () Bool)

(declare-fun e!82680 () Bool)

(assert (=> d!38083 e!82680))

(declare-fun res!61245 () Bool)

(assert (=> d!38083 (=> res!61245 e!82680)))

(declare-fun lt!65443 () Bool)

(assert (=> d!38083 (= res!61245 (not lt!65443))))

(declare-fun lt!65442 () Bool)

(assert (=> d!38083 (= lt!65443 lt!65442)))

(declare-fun lt!65445 () Unit!3924)

(declare-fun e!82679 () Unit!3924)

(assert (=> d!38083 (= lt!65445 e!82679)))

(declare-fun c!23137 () Bool)

(assert (=> d!38083 (= c!23137 lt!65442)))

(assert (=> d!38083 (= lt!65442 (containsKey!171 (toList!856 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38083 (= (contains!877 lt!65390 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65443)))

(declare-fun b!126601 () Bool)

(declare-fun lt!65444 () Unit!3924)

(assert (=> b!126601 (= e!82679 lt!65444)))

(assert (=> b!126601 (= lt!65444 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126601 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126602 () Bool)

(declare-fun Unit!3943 () Unit!3924)

(assert (=> b!126602 (= e!82679 Unit!3943)))

(declare-fun b!126603 () Bool)

(assert (=> b!126603 (= e!82680 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38083 c!23137) b!126601))

(assert (= (and d!38083 (not c!23137)) b!126602))

(assert (= (and d!38083 (not res!61245)) b!126603))

(declare-fun m!147633 () Bool)

(assert (=> d!38083 m!147633))

(declare-fun m!147635 () Bool)

(assert (=> b!126601 m!147635))

(declare-fun m!147637 () Bool)

(assert (=> b!126601 m!147637))

(assert (=> b!126601 m!147637))

(declare-fun m!147639 () Bool)

(assert (=> b!126601 m!147639))

(assert (=> b!126603 m!147637))

(assert (=> b!126603 m!147637))

(assert (=> b!126603 m!147639))

(assert (=> d!38039 d!38083))

(assert (=> d!38039 d!37949))

(declare-fun d!38085 () Bool)

(assert (=> d!38085 (= (apply!111 lt!65299 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1447 (getValueByKey!167 (toList!856 lt!65299) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5236 () Bool)

(assert (= bs!5236 d!38085))

(assert (=> bs!5236 m!147041))

(declare-fun m!147641 () Bool)

(assert (=> bs!5236 m!147641))

(assert (=> bs!5236 m!147641))

(declare-fun m!147643 () Bool)

(assert (=> bs!5236 m!147643))

(assert (=> b!126425 d!38085))

(declare-fun d!38087 () Bool)

(declare-fun c!23138 () Bool)

(assert (=> d!38087 (= c!23138 ((_ is ValueCellFull!1077) (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82681 () V!3435)

(assert (=> d!38087 (= (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82681)))

(declare-fun b!126604 () Bool)

(assert (=> b!126604 (= e!82681 (get!1445 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126605 () Bool)

(assert (=> b!126605 (= e!82681 (get!1446 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38087 c!23138) b!126604))

(assert (= (and d!38087 (not c!23138)) b!126605))

(assert (=> b!126604 m!147295))

(assert (=> b!126604 m!147145))

(declare-fun m!147645 () Bool)

(assert (=> b!126604 m!147645))

(assert (=> b!126605 m!147295))

(assert (=> b!126605 m!147145))

(declare-fun m!147647 () Bool)

(assert (=> b!126605 m!147647))

(assert (=> b!126425 d!38087))

(declare-fun d!38089 () Bool)

(assert (=> d!38089 (= (inRange!0 (ite c!23086 (index!3236 lt!65258) (ite c!23084 (index!3235 lt!65270) (index!3238 lt!65270))) (mask!7039 newMap!16)) (and (bvsge (ite c!23086 (index!3236 lt!65258) (ite c!23084 (index!3235 lt!65270) (index!3238 lt!65270))) #b00000000000000000000000000000000) (bvslt (ite c!23086 (index!3236 lt!65258) (ite c!23084 (index!3235 lt!65270) (index!3238 lt!65270))) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13612 d!38089))

(declare-fun lt!65448 () Bool)

(declare-fun d!38091 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!125 (List!1698) (InoxSet tuple2!2576))

(assert (=> d!38091 (= lt!65448 (select (content!125 (toList!856 lt!65369)) (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82686 () Bool)

(assert (=> d!38091 (= lt!65448 e!82686)))

(declare-fun res!61251 () Bool)

(assert (=> d!38091 (=> (not res!61251) (not e!82686))))

(assert (=> d!38091 (= res!61251 ((_ is Cons!1694) (toList!856 lt!65369)))))

(assert (=> d!38091 (= (contains!879 (toList!856 lt!65369) (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65448)))

(declare-fun b!126610 () Bool)

(declare-fun e!82687 () Bool)

(assert (=> b!126610 (= e!82686 e!82687)))

(declare-fun res!61250 () Bool)

(assert (=> b!126610 (=> res!61250 e!82687)))

(assert (=> b!126610 (= res!61250 (= (h!2296 (toList!856 lt!65369)) (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126611 () Bool)

(assert (=> b!126611 (= e!82687 (contains!879 (t!6045 (toList!856 lt!65369)) (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38091 res!61251) b!126610))

(assert (= (and b!126610 (not res!61250)) b!126611))

(declare-fun m!147649 () Bool)

(assert (=> d!38091 m!147649))

(declare-fun m!147651 () Bool)

(assert (=> d!38091 m!147651))

(declare-fun m!147653 () Bool)

(assert (=> b!126611 m!147653))

(assert (=> b!126480 d!38091))

(assert (=> b!126337 d!38075))

(declare-fun d!38093 () Bool)

(declare-fun c!23139 () Bool)

(assert (=> d!38093 (= c!23139 (and ((_ is Cons!1694) (toList!856 lt!65360)) (= (_1!1299 (h!2296 (toList!856 lt!65360))) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82688 () Option!173)

(assert (=> d!38093 (= (getValueByKey!167 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82688)))

(declare-fun b!126613 () Bool)

(declare-fun e!82689 () Option!173)

(assert (=> b!126613 (= e!82688 e!82689)))

(declare-fun c!23140 () Bool)

(assert (=> b!126613 (= c!23140 (and ((_ is Cons!1694) (toList!856 lt!65360)) (not (= (_1!1299 (h!2296 (toList!856 lt!65360))) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126615 () Bool)

(assert (=> b!126615 (= e!82689 None!171)))

(declare-fun b!126614 () Bool)

(assert (=> b!126614 (= e!82689 (getValueByKey!167 (t!6045 (toList!856 lt!65360)) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126612 () Bool)

(assert (=> b!126612 (= e!82688 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65360)))))))

(assert (= (and d!38093 c!23139) b!126612))

(assert (= (and d!38093 (not c!23139)) b!126613))

(assert (= (and b!126613 c!23140) b!126614))

(assert (= (and b!126613 (not c!23140)) b!126615))

(declare-fun m!147655 () Bool)

(assert (=> b!126614 m!147655))

(assert (=> b!126474 d!38093))

(declare-fun d!38095 () Bool)

(declare-fun c!23141 () Bool)

(assert (=> d!38095 (= c!23141 (and ((_ is Cons!1694) (toList!856 lt!65398)) (= (_1!1299 (h!2296 (toList!856 lt!65398))) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82690 () Option!173)

(assert (=> d!38095 (= (getValueByKey!167 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82690)))

(declare-fun b!126617 () Bool)

(declare-fun e!82691 () Option!173)

(assert (=> b!126617 (= e!82690 e!82691)))

(declare-fun c!23142 () Bool)

(assert (=> b!126617 (= c!23142 (and ((_ is Cons!1694) (toList!856 lt!65398)) (not (= (_1!1299 (h!2296 (toList!856 lt!65398))) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126619 () Bool)

(assert (=> b!126619 (= e!82691 None!171)))

(declare-fun b!126618 () Bool)

(assert (=> b!126618 (= e!82691 (getValueByKey!167 (t!6045 (toList!856 lt!65398)) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126616 () Bool)

(assert (=> b!126616 (= e!82690 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65398)))))))

(assert (= (and d!38095 c!23141) b!126616))

(assert (= (and d!38095 (not c!23141)) b!126617))

(assert (= (and b!126617 c!23142) b!126618))

(assert (= (and b!126617 (not c!23142)) b!126619))

(declare-fun m!147657 () Bool)

(assert (=> b!126618 m!147657))

(assert (=> b!126520 d!38095))

(declare-fun d!38097 () Bool)

(assert (=> d!38097 (= (apply!111 lt!65325 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1447 (getValueByKey!167 (toList!856 lt!65325) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5237 () Bool)

(assert (= bs!5237 d!38097))

(assert (=> bs!5237 m!147041))

(declare-fun m!147659 () Bool)

(assert (=> bs!5237 m!147659))

(assert (=> bs!5237 m!147659))

(declare-fun m!147661 () Bool)

(assert (=> bs!5237 m!147661))

(assert (=> b!126448 d!38097))

(declare-fun d!38099 () Bool)

(declare-fun c!23143 () Bool)

(assert (=> d!38099 (= c!23143 ((_ is ValueCellFull!1077) (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!82692 () V!3435)

(assert (=> d!38099 (= (get!1443 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!82692)))

(declare-fun b!126620 () Bool)

(assert (=> b!126620 (= e!82692 (get!1445 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126621 () Bool)

(assert (=> b!126621 (= e!82692 (get!1446 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38099 c!23143) b!126620))

(assert (= (and d!38099 (not c!23143)) b!126621))

(assert (=> b!126620 m!147359))

(assert (=> b!126620 m!147145))

(declare-fun m!147663 () Bool)

(assert (=> b!126620 m!147663))

(assert (=> b!126621 m!147359))

(assert (=> b!126621 m!147145))

(declare-fun m!147665 () Bool)

(assert (=> b!126621 m!147665))

(assert (=> b!126448 d!38099))

(declare-fun d!38101 () Bool)

(assert (=> d!38101 (= (get!1447 (getValueByKey!167 (toList!856 lt!65016) lt!65009)) (v!3128 (getValueByKey!167 (toList!856 lt!65016) lt!65009)))))

(assert (=> d!38019 d!38101))

(declare-fun d!38103 () Bool)

(declare-fun c!23144 () Bool)

(assert (=> d!38103 (= c!23144 (and ((_ is Cons!1694) (toList!856 lt!65016)) (= (_1!1299 (h!2296 (toList!856 lt!65016))) lt!65009)))))

(declare-fun e!82693 () Option!173)

(assert (=> d!38103 (= (getValueByKey!167 (toList!856 lt!65016) lt!65009) e!82693)))

(declare-fun b!126623 () Bool)

(declare-fun e!82694 () Option!173)

(assert (=> b!126623 (= e!82693 e!82694)))

(declare-fun c!23145 () Bool)

(assert (=> b!126623 (= c!23145 (and ((_ is Cons!1694) (toList!856 lt!65016)) (not (= (_1!1299 (h!2296 (toList!856 lt!65016))) lt!65009))))))

(declare-fun b!126625 () Bool)

(assert (=> b!126625 (= e!82694 None!171)))

(declare-fun b!126624 () Bool)

(assert (=> b!126624 (= e!82694 (getValueByKey!167 (t!6045 (toList!856 lt!65016)) lt!65009))))

(declare-fun b!126622 () Bool)

(assert (=> b!126622 (= e!82693 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65016)))))))

(assert (= (and d!38103 c!23144) b!126622))

(assert (= (and d!38103 (not c!23144)) b!126623))

(assert (= (and b!126623 c!23145) b!126624))

(assert (= (and b!126623 (not c!23145)) b!126625))

(declare-fun m!147667 () Bool)

(assert (=> b!126624 m!147667))

(assert (=> d!38019 d!38103))

(declare-fun d!38105 () Bool)

(declare-fun e!82695 () Bool)

(assert (=> d!38105 e!82695))

(declare-fun res!61252 () Bool)

(assert (=> d!38105 (=> (not res!61252) (not e!82695))))

(declare-fun lt!65451 () ListLongMap!1681)

(assert (=> d!38105 (= res!61252 (contains!877 lt!65451 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65449 () List!1698)

(assert (=> d!38105 (= lt!65451 (ListLongMap!1682 lt!65449))))

(declare-fun lt!65450 () Unit!3924)

(declare-fun lt!65452 () Unit!3924)

(assert (=> d!38105 (= lt!65450 lt!65452)))

(assert (=> d!38105 (= (getValueByKey!167 lt!65449 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38105 (= lt!65452 (lemmaContainsTupThenGetReturnValue!82 lt!65449 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38105 (= lt!65449 (insertStrictlySorted!85 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38105 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65451)))

(declare-fun b!126626 () Bool)

(declare-fun res!61253 () Bool)

(assert (=> b!126626 (=> (not res!61253) (not e!82695))))

(assert (=> b!126626 (= res!61253 (= (getValueByKey!167 (toList!856 lt!65451) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126627 () Bool)

(assert (=> b!126627 (= e!82695 (contains!879 (toList!856 lt!65451) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38105 res!61252) b!126626))

(assert (= (and b!126626 res!61253) b!126627))

(declare-fun m!147669 () Bool)

(assert (=> d!38105 m!147669))

(declare-fun m!147671 () Bool)

(assert (=> d!38105 m!147671))

(declare-fun m!147673 () Bool)

(assert (=> d!38105 m!147673))

(declare-fun m!147675 () Bool)

(assert (=> d!38105 m!147675))

(declare-fun m!147677 () Bool)

(assert (=> b!126626 m!147677))

(declare-fun m!147679 () Bool)

(assert (=> b!126627 m!147679))

(assert (=> d!37987 d!38105))

(declare-fun d!38107 () Bool)

(declare-fun e!82696 () Bool)

(assert (=> d!38107 e!82696))

(declare-fun res!61254 () Bool)

(assert (=> d!38107 (=> (not res!61254) (not e!82696))))

(assert (=> d!38107 (= res!61254 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 lt!65264))))))

(declare-fun lt!65453 () Unit!3924)

(assert (=> d!38107 (= lt!65453 (choose!762 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (defaultEntry!2783 newMap!16)))))

(assert (=> d!38107 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38107 (= (lemmaValidKeyInArrayIsInListMap!117 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (defaultEntry!2783 newMap!16)) lt!65453)))

(declare-fun b!126628 () Bool)

(assert (=> b!126628 (= e!82696 (contains!877 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 lt!65264) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(assert (= (and d!38107 res!61254) b!126628))

(declare-fun m!147681 () Bool)

(assert (=> d!38107 m!147681))

(assert (=> d!38107 m!147051))

(assert (=> b!126628 m!147199))

(declare-fun m!147683 () Bool)

(assert (=> b!126628 m!147683))

(assert (=> b!126628 m!147199))

(assert (=> b!126628 m!147683))

(declare-fun m!147685 () Bool)

(assert (=> b!126628 m!147685))

(assert (=> d!37987 d!38107))

(declare-fun d!38109 () Bool)

(assert (=> d!38109 (= (arrayCountValidKeys!0 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!65456 () Unit!3924)

(declare-fun choose!2 (array!4699 (_ BitVec 32)) Unit!3924)

(assert (=> d!38109 (= lt!65456 (choose!2 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(declare-fun e!82699 () Bool)

(assert (=> d!38109 e!82699))

(declare-fun res!61259 () Bool)

(assert (=> d!38109 (=> (not res!61259) (not e!82699))))

(assert (=> d!38109 (= res!61259 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 lt!65267))))))

(assert (=> d!38109 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))) lt!65456)))

(declare-fun b!126633 () Bool)

(declare-fun res!61260 () Bool)

(assert (=> b!126633 (=> (not res!61260) (not e!82699))))

(assert (=> b!126633 (= res!61260 (validKeyInArray!0 (select (arr!2225 lt!65267) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(declare-fun b!126634 () Bool)

(assert (=> b!126634 (= e!82699 (bvslt (size!2489 lt!65267) #b01111111111111111111111111111111))))

(assert (= (and d!38109 res!61259) b!126633))

(assert (= (and b!126633 res!61260) b!126634))

(assert (=> d!38109 m!147213))

(declare-fun m!147687 () Bool)

(assert (=> d!38109 m!147687))

(declare-fun m!147689 () Bool)

(assert (=> b!126633 m!147689))

(assert (=> b!126633 m!147689))

(declare-fun m!147691 () Bool)

(assert (=> b!126633 m!147691))

(assert (=> d!37987 d!38109))

(assert (=> d!37987 d!37995))

(assert (=> d!37987 d!37997))

(declare-fun b!126635 () Bool)

(declare-fun e!82701 () (_ BitVec 32))

(declare-fun call!13639 () (_ BitVec 32))

(assert (=> b!126635 (= e!82701 call!13639)))

(declare-fun d!38111 () Bool)

(declare-fun lt!65457 () (_ BitVec 32))

(assert (=> d!38111 (and (bvsge lt!65457 #b00000000000000000000000000000000) (bvsle lt!65457 (bvsub (size!2489 lt!65267) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(declare-fun e!82700 () (_ BitVec 32))

(assert (=> d!38111 (= lt!65457 e!82700)))

(declare-fun c!23147 () Bool)

(assert (=> d!38111 (= c!23147 (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)))))

(assert (=> d!38111 (and (bvsle (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)) (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001) (size!2489 lt!65267)))))

(assert (=> d!38111 (= (arrayCountValidKeys!0 lt!65267 (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)) lt!65457)))

(declare-fun b!126636 () Bool)

(assert (=> b!126636 (= e!82700 #b00000000000000000000000000000000)))

(declare-fun bm!13636 () Bool)

(assert (=> bm!13636 (= call!13639 (arrayCountValidKeys!0 lt!65267 (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001) (bvadd (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000001)))))

(declare-fun b!126637 () Bool)

(assert (=> b!126637 (= e!82701 (bvadd #b00000000000000000000000000000001 call!13639))))

(declare-fun b!126638 () Bool)

(assert (=> b!126638 (= e!82700 e!82701)))

(declare-fun c!23146 () Bool)

(assert (=> b!126638 (= c!23146 (validKeyInArray!0 (select (arr!2225 lt!65267) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(assert (= (and d!38111 c!23147) b!126636))

(assert (= (and d!38111 (not c!23147)) b!126638))

(assert (= (and b!126638 c!23146) b!126637))

(assert (= (and b!126638 (not c!23146)) b!126635))

(assert (= (or b!126637 b!126635) bm!13636))

(declare-fun m!147693 () Bool)

(assert (=> bm!13636 m!147693))

(assert (=> b!126638 m!147689))

(assert (=> b!126638 m!147689))

(assert (=> b!126638 m!147691))

(assert (=> d!37987 d!38111))

(declare-fun d!38113 () Bool)

(declare-fun e!82703 () Bool)

(assert (=> d!38113 e!82703))

(declare-fun res!61261 () Bool)

(assert (=> d!38113 (=> res!61261 e!82703)))

(declare-fun lt!65459 () Bool)

(assert (=> d!38113 (= res!61261 (not lt!65459))))

(declare-fun lt!65458 () Bool)

(assert (=> d!38113 (= lt!65459 lt!65458)))

(declare-fun lt!65461 () Unit!3924)

(declare-fun e!82702 () Unit!3924)

(assert (=> d!38113 (= lt!65461 e!82702)))

(declare-fun c!23148 () Bool)

(assert (=> d!38113 (= c!23148 lt!65458)))

(assert (=> d!38113 (= lt!65458 (containsKey!171 (toList!856 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(assert (=> d!38113 (= (contains!877 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))) lt!65459)))

(declare-fun b!126639 () Bool)

(declare-fun lt!65460 () Unit!3924)

(assert (=> b!126639 (= e!82702 lt!65460)))

(assert (=> b!126639 (= lt!65460 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(assert (=> b!126639 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)))))))

(declare-fun b!126640 () Bool)

(declare-fun Unit!3944 () Unit!3924)

(assert (=> b!126640 (= e!82702 Unit!3944)))

(declare-fun b!126641 () Bool)

(assert (=> b!126641 (= e!82703 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))))

(assert (= (and d!38113 c!23148) b!126639))

(assert (= (and d!38113 (not c!23148)) b!126640))

(assert (= (and d!38113 (not res!61261)) b!126641))

(assert (=> d!38113 m!147193))

(declare-fun m!147695 () Bool)

(assert (=> d!38113 m!147695))

(assert (=> b!126639 m!147193))

(declare-fun m!147697 () Bool)

(assert (=> b!126639 m!147697))

(assert (=> b!126639 m!147193))

(declare-fun m!147699 () Bool)

(assert (=> b!126639 m!147699))

(assert (=> b!126639 m!147699))

(declare-fun m!147701 () Bool)

(assert (=> b!126639 m!147701))

(assert (=> b!126641 m!147193))

(assert (=> b!126641 m!147699))

(assert (=> b!126641 m!147699))

(assert (=> b!126641 m!147701))

(assert (=> d!37987 d!38113))

(declare-fun b!126642 () Bool)

(declare-fun e!82706 () Bool)

(declare-fun e!82705 () Bool)

(assert (=> b!126642 (= e!82706 e!82705)))

(declare-fun lt!65462 () (_ BitVec 64))

(assert (=> b!126642 (= lt!65462 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65463 () Unit!3924)

(assert (=> b!126642 (= lt!65463 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) lt!65462 #b00000000000000000000000000000000))))

(assert (=> b!126642 (arrayContainsKey!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) lt!65462 #b00000000000000000000000000000000)))

(declare-fun lt!65464 () Unit!3924)

(assert (=> b!126642 (= lt!65464 lt!65463)))

(declare-fun res!61262 () Bool)

(assert (=> b!126642 (= res!61262 (= (seekEntryOrOpen!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000) (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (mask!7039 newMap!16)) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!126642 (=> (not res!61262) (not e!82705))))

(declare-fun b!126643 () Bool)

(declare-fun e!82704 () Bool)

(assert (=> b!126643 (= e!82704 e!82706)))

(declare-fun c!23149 () Bool)

(assert (=> b!126643 (= c!23149 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13637 () Bool)

(declare-fun call!13640 () Bool)

(assert (=> bm!13637 (= call!13640 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (mask!7039 newMap!16)))))

(declare-fun b!126644 () Bool)

(assert (=> b!126644 (= e!82705 call!13640)))

(declare-fun d!38115 () Bool)

(declare-fun res!61263 () Bool)

(assert (=> d!38115 (=> res!61263 e!82704)))

(assert (=> d!38115 (= res!61263 (bvsge #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(assert (=> d!38115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (mask!7039 newMap!16)) e!82704)))

(declare-fun b!126645 () Bool)

(assert (=> b!126645 (= e!82706 call!13640)))

(assert (= (and d!38115 (not res!61263)) b!126643))

(assert (= (and b!126643 c!23149) b!126642))

(assert (= (and b!126643 (not c!23149)) b!126645))

(assert (= (and b!126642 res!61262) b!126644))

(assert (= (or b!126644 b!126645) bm!13637))

(declare-fun m!147703 () Bool)

(assert (=> b!126642 m!147703))

(declare-fun m!147705 () Bool)

(assert (=> b!126642 m!147705))

(declare-fun m!147707 () Bool)

(assert (=> b!126642 m!147707))

(assert (=> b!126642 m!147703))

(declare-fun m!147709 () Bool)

(assert (=> b!126642 m!147709))

(assert (=> b!126643 m!147703))

(assert (=> b!126643 m!147703))

(declare-fun m!147711 () Bool)

(assert (=> b!126643 m!147711))

(declare-fun m!147713 () Bool)

(assert (=> bm!13637 m!147713))

(assert (=> d!37987 d!38115))

(declare-fun b!126646 () Bool)

(declare-fun c!23151 () Bool)

(assert (=> b!126646 (= c!23151 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82717 () ListLongMap!1681)

(declare-fun e!82713 () ListLongMap!1681)

(assert (=> b!126646 (= e!82717 e!82713)))

(declare-fun bm!13638 () Bool)

(declare-fun call!13643 () Bool)

(declare-fun lt!65465 () ListLongMap!1681)

(assert (=> bm!13638 (= call!13643 (contains!877 lt!65465 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126647 () Bool)

(declare-fun e!82716 () ListLongMap!1681)

(assert (=> b!126647 (= e!82716 e!82717)))

(declare-fun c!23154 () Bool)

(assert (=> b!126647 (= c!23154 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126648 () Bool)

(declare-fun e!82707 () Unit!3924)

(declare-fun Unit!3945 () Unit!3924)

(assert (=> b!126648 (= e!82707 Unit!3945)))

(declare-fun b!126649 () Bool)

(declare-fun e!82715 () Bool)

(declare-fun e!82710 () Bool)

(assert (=> b!126649 (= e!82715 e!82710)))

(declare-fun res!61270 () Bool)

(assert (=> b!126649 (= res!61270 call!13643)))

(assert (=> b!126649 (=> (not res!61270) (not e!82710))))

(declare-fun b!126650 () Bool)

(declare-fun e!82719 () Bool)

(declare-fun e!82712 () Bool)

(assert (=> b!126650 (= e!82719 e!82712)))

(declare-fun res!61264 () Bool)

(assert (=> b!126650 (=> (not res!61264) (not e!82712))))

(assert (=> b!126650 (= res!61264 (contains!877 lt!65465 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!126650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun b!126651 () Bool)

(assert (=> b!126651 (= e!82715 (not call!13643))))

(declare-fun d!38117 () Bool)

(declare-fun e!82709 () Bool)

(assert (=> d!38117 e!82709))

(declare-fun res!61266 () Bool)

(assert (=> d!38117 (=> (not res!61266) (not e!82709))))

(assert (=> d!38117 (= res!61266 (or (bvsge #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))))

(declare-fun lt!65474 () ListLongMap!1681)

(assert (=> d!38117 (= lt!65465 lt!65474)))

(declare-fun lt!65480 () Unit!3924)

(assert (=> d!38117 (= lt!65480 e!82707)))

(declare-fun c!23153 () Bool)

(declare-fun e!82708 () Bool)

(assert (=> d!38117 (= c!23153 e!82708)))

(declare-fun res!61268 () Bool)

(assert (=> d!38117 (=> (not res!61268) (not e!82708))))

(assert (=> d!38117 (= res!61268 (bvslt #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(assert (=> d!38117 (= lt!65474 e!82716)))

(declare-fun c!23150 () Bool)

(assert (=> d!38117 (= c!23150 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38117 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38117 (= (getCurrentListMap!536 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65465)))

(declare-fun b!126652 () Bool)

(declare-fun lt!65469 () Unit!3924)

(assert (=> b!126652 (= e!82707 lt!65469)))

(declare-fun lt!65477 () ListLongMap!1681)

(assert (=> b!126652 (= lt!65477 (getCurrentListMapNoExtraKeys!136 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65471 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65484 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65484 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65470 () Unit!3924)

(assert (=> b!126652 (= lt!65470 (addStillContains!87 lt!65477 lt!65471 (zeroValue!2646 newMap!16) lt!65484))))

(assert (=> b!126652 (contains!877 (+!170 lt!65477 (tuple2!2577 lt!65471 (zeroValue!2646 newMap!16))) lt!65484)))

(declare-fun lt!65476 () Unit!3924)

(assert (=> b!126652 (= lt!65476 lt!65470)))

(declare-fun lt!65485 () ListLongMap!1681)

(assert (=> b!126652 (= lt!65485 (getCurrentListMapNoExtraKeys!136 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65482 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65486 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65486 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65472 () Unit!3924)

(assert (=> b!126652 (= lt!65472 (addApplyDifferent!87 lt!65485 lt!65482 (minValue!2646 newMap!16) lt!65486))))

(assert (=> b!126652 (= (apply!111 (+!170 lt!65485 (tuple2!2577 lt!65482 (minValue!2646 newMap!16))) lt!65486) (apply!111 lt!65485 lt!65486))))

(declare-fun lt!65468 () Unit!3924)

(assert (=> b!126652 (= lt!65468 lt!65472)))

(declare-fun lt!65478 () ListLongMap!1681)

(assert (=> b!126652 (= lt!65478 (getCurrentListMapNoExtraKeys!136 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65483 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65475 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65475 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!65467 () Unit!3924)

(assert (=> b!126652 (= lt!65467 (addApplyDifferent!87 lt!65478 lt!65483 (zeroValue!2646 newMap!16) lt!65475))))

(assert (=> b!126652 (= (apply!111 (+!170 lt!65478 (tuple2!2577 lt!65483 (zeroValue!2646 newMap!16))) lt!65475) (apply!111 lt!65478 lt!65475))))

(declare-fun lt!65481 () Unit!3924)

(assert (=> b!126652 (= lt!65481 lt!65467)))

(declare-fun lt!65473 () ListLongMap!1681)

(assert (=> b!126652 (= lt!65473 (getCurrentListMapNoExtraKeys!136 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65479 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65479 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65466 () (_ BitVec 64))

(assert (=> b!126652 (= lt!65466 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!126652 (= lt!65469 (addApplyDifferent!87 lt!65473 lt!65479 (minValue!2646 newMap!16) lt!65466))))

(assert (=> b!126652 (= (apply!111 (+!170 lt!65473 (tuple2!2577 lt!65479 (minValue!2646 newMap!16))) lt!65466) (apply!111 lt!65473 lt!65466))))

(declare-fun b!126653 () Bool)

(declare-fun res!61271 () Bool)

(assert (=> b!126653 (=> (not res!61271) (not e!82709))))

(declare-fun e!82714 () Bool)

(assert (=> b!126653 (= res!61271 e!82714)))

(declare-fun c!23152 () Bool)

(assert (=> b!126653 (= c!23152 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126654 () Bool)

(declare-fun e!82718 () Bool)

(assert (=> b!126654 (= e!82718 (= (apply!111 lt!65465 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!126655 () Bool)

(assert (=> b!126655 (= e!82714 e!82718)))

(declare-fun res!61269 () Bool)

(declare-fun call!13644 () Bool)

(assert (=> b!126655 (= res!61269 call!13644)))

(assert (=> b!126655 (=> (not res!61269) (not e!82718))))

(declare-fun b!126656 () Bool)

(assert (=> b!126656 (= e!82710 (= (apply!111 lt!65465 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13639 () Bool)

(declare-fun call!13641 () ListLongMap!1681)

(declare-fun call!13647 () ListLongMap!1681)

(assert (=> bm!13639 (= call!13641 call!13647)))

(declare-fun b!126657 () Bool)

(assert (=> b!126657 (= e!82714 (not call!13644))))

(declare-fun call!13645 () ListLongMap!1681)

(declare-fun bm!13640 () Bool)

(declare-fun call!13646 () ListLongMap!1681)

(assert (=> bm!13640 (= call!13646 (+!170 (ite c!23150 call!13647 (ite c!23154 call!13641 call!13645)) (ite (or c!23150 c!23154) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13641 () Bool)

(assert (=> bm!13641 (= call!13644 (contains!877 lt!65465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126658 () Bool)

(declare-fun call!13642 () ListLongMap!1681)

(assert (=> b!126658 (= e!82713 call!13642)))

(declare-fun b!126659 () Bool)

(assert (=> b!126659 (= e!82717 call!13642)))

(declare-fun b!126660 () Bool)

(assert (=> b!126660 (= e!82708 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13642 () Bool)

(assert (=> bm!13642 (= call!13642 call!13646)))

(declare-fun b!126661 () Bool)

(assert (=> b!126661 (= e!82709 e!82715)))

(declare-fun c!23155 () Bool)

(assert (=> b!126661 (= c!23155 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126662 () Bool)

(assert (=> b!126662 (= e!82712 (= (apply!111 lt!65465 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))))))

(assert (=> b!126662 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun b!126663 () Bool)

(declare-fun res!61265 () Bool)

(assert (=> b!126663 (=> (not res!61265) (not e!82709))))

(assert (=> b!126663 (= res!61265 e!82719)))

(declare-fun res!61272 () Bool)

(assert (=> b!126663 (=> res!61272 e!82719)))

(declare-fun e!82711 () Bool)

(assert (=> b!126663 (= res!61272 (not e!82711))))

(declare-fun res!61267 () Bool)

(assert (=> b!126663 (=> (not res!61267) (not e!82711))))

(assert (=> b!126663 (= res!61267 (bvslt #b00000000000000000000000000000000 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun b!126664 () Bool)

(assert (=> b!126664 (= e!82711 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!126665 () Bool)

(assert (=> b!126665 (= e!82716 (+!170 call!13646 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126666 () Bool)

(assert (=> b!126666 (= e!82713 call!13645)))

(declare-fun bm!13643 () Bool)

(assert (=> bm!13643 (= call!13647 (getCurrentListMapNoExtraKeys!136 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13644 () Bool)

(assert (=> bm!13644 (= call!13645 call!13641)))

(assert (= (and d!38117 c!23150) b!126665))

(assert (= (and d!38117 (not c!23150)) b!126647))

(assert (= (and b!126647 c!23154) b!126659))

(assert (= (and b!126647 (not c!23154)) b!126646))

(assert (= (and b!126646 c!23151) b!126658))

(assert (= (and b!126646 (not c!23151)) b!126666))

(assert (= (or b!126658 b!126666) bm!13644))

(assert (= (or b!126659 bm!13644) bm!13639))

(assert (= (or b!126659 b!126658) bm!13642))

(assert (= (or b!126665 bm!13639) bm!13643))

(assert (= (or b!126665 bm!13642) bm!13640))

(assert (= (and d!38117 res!61268) b!126660))

(assert (= (and d!38117 c!23153) b!126652))

(assert (= (and d!38117 (not c!23153)) b!126648))

(assert (= (and d!38117 res!61266) b!126663))

(assert (= (and b!126663 res!61267) b!126664))

(assert (= (and b!126663 (not res!61272)) b!126650))

(assert (= (and b!126650 res!61264) b!126662))

(assert (= (and b!126663 res!61265) b!126653))

(assert (= (and b!126653 c!23152) b!126655))

(assert (= (and b!126653 (not c!23152)) b!126657))

(assert (= (and b!126655 res!61269) b!126654))

(assert (= (or b!126655 b!126657) bm!13641))

(assert (= (and b!126653 res!61271) b!126661))

(assert (= (and b!126661 c!23155) b!126649))

(assert (= (and b!126661 (not c!23155)) b!126651))

(assert (= (and b!126649 res!61270) b!126656))

(assert (= (or b!126649 b!126651) bm!13638))

(declare-fun b_lambda!5583 () Bool)

(assert (=> (not b_lambda!5583) (not b!126662)))

(assert (=> b!126662 t!6053))

(declare-fun b_and!7799 () Bool)

(assert (= b_and!7795 (and (=> t!6053 result!3847) b_and!7799)))

(assert (=> b!126662 t!6055))

(declare-fun b_and!7801 () Bool)

(assert (= b_and!7797 (and (=> t!6055 result!3849) b_and!7801)))

(assert (=> b!126650 m!147703))

(assert (=> b!126650 m!147703))

(declare-fun m!147715 () Bool)

(assert (=> b!126650 m!147715))

(assert (=> d!38117 m!147051))

(declare-fun m!147717 () Bool)

(assert (=> b!126652 m!147717))

(declare-fun m!147719 () Bool)

(assert (=> b!126652 m!147719))

(assert (=> b!126652 m!147719))

(declare-fun m!147721 () Bool)

(assert (=> b!126652 m!147721))

(declare-fun m!147723 () Bool)

(assert (=> b!126652 m!147723))

(declare-fun m!147725 () Bool)

(assert (=> b!126652 m!147725))

(declare-fun m!147727 () Bool)

(assert (=> b!126652 m!147727))

(declare-fun m!147729 () Bool)

(assert (=> b!126652 m!147729))

(declare-fun m!147731 () Bool)

(assert (=> b!126652 m!147731))

(assert (=> b!126652 m!147723))

(declare-fun m!147733 () Bool)

(assert (=> b!126652 m!147733))

(declare-fun m!147735 () Bool)

(assert (=> b!126652 m!147735))

(declare-fun m!147737 () Bool)

(assert (=> b!126652 m!147737))

(declare-fun m!147739 () Bool)

(assert (=> b!126652 m!147739))

(declare-fun m!147741 () Bool)

(assert (=> b!126652 m!147741))

(assert (=> b!126652 m!147703))

(assert (=> b!126652 m!147725))

(declare-fun m!147743 () Bool)

(assert (=> b!126652 m!147743))

(declare-fun m!147745 () Bool)

(assert (=> b!126652 m!147745))

(declare-fun m!147747 () Bool)

(assert (=> b!126652 m!147747))

(assert (=> b!126652 m!147737))

(declare-fun m!147749 () Bool)

(assert (=> bm!13638 m!147749))

(assert (=> b!126664 m!147703))

(assert (=> b!126664 m!147703))

(assert (=> b!126664 m!147711))

(declare-fun m!147751 () Bool)

(assert (=> b!126656 m!147751))

(assert (=> b!126660 m!147703))

(assert (=> b!126660 m!147703))

(assert (=> b!126660 m!147711))

(declare-fun m!147753 () Bool)

(assert (=> bm!13640 m!147753))

(declare-fun m!147755 () Bool)

(assert (=> b!126665 m!147755))

(assert (=> bm!13643 m!147745))

(assert (=> b!126662 m!147703))

(assert (=> b!126662 m!147145))

(declare-fun m!147757 () Bool)

(assert (=> b!126662 m!147757))

(assert (=> b!126662 m!147145))

(declare-fun m!147759 () Bool)

(assert (=> b!126662 m!147759))

(assert (=> b!126662 m!147757))

(assert (=> b!126662 m!147703))

(declare-fun m!147761 () Bool)

(assert (=> b!126662 m!147761))

(declare-fun m!147763 () Bool)

(assert (=> b!126654 m!147763))

(declare-fun m!147765 () Bool)

(assert (=> bm!13641 m!147765))

(assert (=> d!37987 d!38117))

(declare-fun b!126667 () Bool)

(declare-fun e!82721 () (_ BitVec 32))

(declare-fun call!13648 () (_ BitVec 32))

(assert (=> b!126667 (= e!82721 call!13648)))

(declare-fun lt!65487 () (_ BitVec 32))

(declare-fun d!38119 () Bool)

(assert (=> d!38119 (and (bvsge lt!65487 #b00000000000000000000000000000000) (bvsle lt!65487 (bvsub (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun e!82720 () (_ BitVec 32))

(assert (=> d!38119 (= lt!65487 e!82720)))

(declare-fun c!23157 () Bool)

(assert (=> d!38119 (= c!23157 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38119 (and (bvsle #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2489 (_keys!4516 newMap!16)) (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(assert (=> d!38119 (= (arrayCountValidKeys!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) lt!65487)))

(declare-fun b!126668 () Bool)

(assert (=> b!126668 (= e!82720 #b00000000000000000000000000000000)))

(declare-fun bm!13645 () Bool)

(assert (=> bm!13645 (= call!13648 (arrayCountValidKeys!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126669 () Bool)

(assert (=> b!126669 (= e!82721 (bvadd #b00000000000000000000000000000001 call!13648))))

(declare-fun b!126670 () Bool)

(assert (=> b!126670 (= e!82720 e!82721)))

(declare-fun c!23156 () Bool)

(assert (=> b!126670 (= c!23156 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38119 c!23157) b!126668))

(assert (= (and d!38119 (not c!23157)) b!126670))

(assert (= (and b!126670 c!23156) b!126669))

(assert (= (and b!126670 (not c!23156)) b!126667))

(assert (= (or b!126669 b!126667) bm!13645))

(declare-fun m!147767 () Bool)

(assert (=> bm!13645 m!147767))

(assert (=> b!126670 m!147703))

(assert (=> b!126670 m!147703))

(assert (=> b!126670 m!147711))

(assert (=> d!37987 d!38119))

(declare-fun b!126671 () Bool)

(declare-fun c!23159 () Bool)

(assert (=> b!126671 (= c!23159 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82732 () ListLongMap!1681)

(declare-fun e!82728 () ListLongMap!1681)

(assert (=> b!126671 (= e!82732 e!82728)))

(declare-fun bm!13646 () Bool)

(declare-fun call!13651 () Bool)

(declare-fun lt!65488 () ListLongMap!1681)

(assert (=> bm!13646 (= call!13651 (contains!877 lt!65488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126672 () Bool)

(declare-fun e!82731 () ListLongMap!1681)

(assert (=> b!126672 (= e!82731 e!82732)))

(declare-fun c!23162 () Bool)

(assert (=> b!126672 (= c!23162 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126673 () Bool)

(declare-fun e!82722 () Unit!3924)

(declare-fun Unit!3946 () Unit!3924)

(assert (=> b!126673 (= e!82722 Unit!3946)))

(declare-fun b!126674 () Bool)

(declare-fun e!82730 () Bool)

(declare-fun e!82725 () Bool)

(assert (=> b!126674 (= e!82730 e!82725)))

(declare-fun res!61279 () Bool)

(assert (=> b!126674 (= res!61279 call!13651)))

(assert (=> b!126674 (=> (not res!61279) (not e!82725))))

(declare-fun b!126675 () Bool)

(declare-fun e!82734 () Bool)

(declare-fun e!82727 () Bool)

(assert (=> b!126675 (= e!82734 e!82727)))

(declare-fun res!61273 () Bool)

(assert (=> b!126675 (=> (not res!61273) (not e!82727))))

(assert (=> b!126675 (= res!61273 (contains!877 lt!65488 (select (arr!2225 lt!65264) #b00000000000000000000000000000000)))))

(assert (=> b!126675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 lt!65264)))))

(declare-fun b!126676 () Bool)

(assert (=> b!126676 (= e!82730 (not call!13651))))

(declare-fun d!38121 () Bool)

(declare-fun e!82724 () Bool)

(assert (=> d!38121 e!82724))

(declare-fun res!61275 () Bool)

(assert (=> d!38121 (=> (not res!61275) (not e!82724))))

(assert (=> d!38121 (= res!61275 (or (bvsge #b00000000000000000000000000000000 (size!2489 lt!65264)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 lt!65264)))))))

(declare-fun lt!65497 () ListLongMap!1681)

(assert (=> d!38121 (= lt!65488 lt!65497)))

(declare-fun lt!65503 () Unit!3924)

(assert (=> d!38121 (= lt!65503 e!82722)))

(declare-fun c!23161 () Bool)

(declare-fun e!82723 () Bool)

(assert (=> d!38121 (= c!23161 e!82723)))

(declare-fun res!61277 () Bool)

(assert (=> d!38121 (=> (not res!61277) (not e!82723))))

(assert (=> d!38121 (= res!61277 (bvslt #b00000000000000000000000000000000 (size!2489 lt!65264)))))

(assert (=> d!38121 (= lt!65497 e!82731)))

(declare-fun c!23158 () Bool)

(assert (=> d!38121 (= c!23158 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38121 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38121 (= (getCurrentListMap!536 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65488)))

(declare-fun b!126677 () Bool)

(declare-fun lt!65492 () Unit!3924)

(assert (=> b!126677 (= e!82722 lt!65492)))

(declare-fun lt!65500 () ListLongMap!1681)

(assert (=> b!126677 (= lt!65500 (getCurrentListMapNoExtraKeys!136 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65494 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65507 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65507 (select (arr!2225 lt!65264) #b00000000000000000000000000000000))))

(declare-fun lt!65493 () Unit!3924)

(assert (=> b!126677 (= lt!65493 (addStillContains!87 lt!65500 lt!65494 (zeroValue!2646 newMap!16) lt!65507))))

(assert (=> b!126677 (contains!877 (+!170 lt!65500 (tuple2!2577 lt!65494 (zeroValue!2646 newMap!16))) lt!65507)))

(declare-fun lt!65499 () Unit!3924)

(assert (=> b!126677 (= lt!65499 lt!65493)))

(declare-fun lt!65508 () ListLongMap!1681)

(assert (=> b!126677 (= lt!65508 (getCurrentListMapNoExtraKeys!136 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65505 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65505 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65509 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65509 (select (arr!2225 lt!65264) #b00000000000000000000000000000000))))

(declare-fun lt!65495 () Unit!3924)

(assert (=> b!126677 (= lt!65495 (addApplyDifferent!87 lt!65508 lt!65505 (minValue!2646 newMap!16) lt!65509))))

(assert (=> b!126677 (= (apply!111 (+!170 lt!65508 (tuple2!2577 lt!65505 (minValue!2646 newMap!16))) lt!65509) (apply!111 lt!65508 lt!65509))))

(declare-fun lt!65491 () Unit!3924)

(assert (=> b!126677 (= lt!65491 lt!65495)))

(declare-fun lt!65501 () ListLongMap!1681)

(assert (=> b!126677 (= lt!65501 (getCurrentListMapNoExtraKeys!136 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65506 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65498 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65498 (select (arr!2225 lt!65264) #b00000000000000000000000000000000))))

(declare-fun lt!65490 () Unit!3924)

(assert (=> b!126677 (= lt!65490 (addApplyDifferent!87 lt!65501 lt!65506 (zeroValue!2646 newMap!16) lt!65498))))

(assert (=> b!126677 (= (apply!111 (+!170 lt!65501 (tuple2!2577 lt!65506 (zeroValue!2646 newMap!16))) lt!65498) (apply!111 lt!65501 lt!65498))))

(declare-fun lt!65504 () Unit!3924)

(assert (=> b!126677 (= lt!65504 lt!65490)))

(declare-fun lt!65496 () ListLongMap!1681)

(assert (=> b!126677 (= lt!65496 (getCurrentListMapNoExtraKeys!136 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65502 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65489 () (_ BitVec 64))

(assert (=> b!126677 (= lt!65489 (select (arr!2225 lt!65264) #b00000000000000000000000000000000))))

(assert (=> b!126677 (= lt!65492 (addApplyDifferent!87 lt!65496 lt!65502 (minValue!2646 newMap!16) lt!65489))))

(assert (=> b!126677 (= (apply!111 (+!170 lt!65496 (tuple2!2577 lt!65502 (minValue!2646 newMap!16))) lt!65489) (apply!111 lt!65496 lt!65489))))

(declare-fun b!126678 () Bool)

(declare-fun res!61280 () Bool)

(assert (=> b!126678 (=> (not res!61280) (not e!82724))))

(declare-fun e!82729 () Bool)

(assert (=> b!126678 (= res!61280 e!82729)))

(declare-fun c!23160 () Bool)

(assert (=> b!126678 (= c!23160 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126679 () Bool)

(declare-fun e!82733 () Bool)

(assert (=> b!126679 (= e!82733 (= (apply!111 lt!65488 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!126680 () Bool)

(assert (=> b!126680 (= e!82729 e!82733)))

(declare-fun res!61278 () Bool)

(declare-fun call!13652 () Bool)

(assert (=> b!126680 (= res!61278 call!13652)))

(assert (=> b!126680 (=> (not res!61278) (not e!82733))))

(declare-fun b!126681 () Bool)

(assert (=> b!126681 (= e!82725 (= (apply!111 lt!65488 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13647 () Bool)

(declare-fun call!13649 () ListLongMap!1681)

(declare-fun call!13655 () ListLongMap!1681)

(assert (=> bm!13647 (= call!13649 call!13655)))

(declare-fun b!126682 () Bool)

(assert (=> b!126682 (= e!82729 (not call!13652))))

(declare-fun bm!13648 () Bool)

(declare-fun call!13654 () ListLongMap!1681)

(declare-fun call!13653 () ListLongMap!1681)

(assert (=> bm!13648 (= call!13654 (+!170 (ite c!23158 call!13655 (ite c!23162 call!13649 call!13653)) (ite (or c!23158 c!23162) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13649 () Bool)

(assert (=> bm!13649 (= call!13652 (contains!877 lt!65488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126683 () Bool)

(declare-fun call!13650 () ListLongMap!1681)

(assert (=> b!126683 (= e!82728 call!13650)))

(declare-fun b!126684 () Bool)

(assert (=> b!126684 (= e!82732 call!13650)))

(declare-fun b!126685 () Bool)

(assert (=> b!126685 (= e!82723 (validKeyInArray!0 (select (arr!2225 lt!65264) #b00000000000000000000000000000000)))))

(declare-fun bm!13650 () Bool)

(assert (=> bm!13650 (= call!13650 call!13654)))

(declare-fun b!126686 () Bool)

(assert (=> b!126686 (= e!82724 e!82730)))

(declare-fun c!23163 () Bool)

(assert (=> b!126686 (= c!23163 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126687 () Bool)

(assert (=> b!126687 (= e!82727 (= (apply!111 lt!65488 (select (arr!2225 lt!65264) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 lt!65278) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 lt!65278)))))

(assert (=> b!126687 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 lt!65264)))))

(declare-fun b!126688 () Bool)

(declare-fun res!61274 () Bool)

(assert (=> b!126688 (=> (not res!61274) (not e!82724))))

(assert (=> b!126688 (= res!61274 e!82734)))

(declare-fun res!61281 () Bool)

(assert (=> b!126688 (=> res!61281 e!82734)))

(declare-fun e!82726 () Bool)

(assert (=> b!126688 (= res!61281 (not e!82726))))

(declare-fun res!61276 () Bool)

(assert (=> b!126688 (=> (not res!61276) (not e!82726))))

(assert (=> b!126688 (= res!61276 (bvslt #b00000000000000000000000000000000 (size!2489 lt!65264)))))

(declare-fun b!126689 () Bool)

(assert (=> b!126689 (= e!82726 (validKeyInArray!0 (select (arr!2225 lt!65264) #b00000000000000000000000000000000)))))

(declare-fun b!126690 () Bool)

(assert (=> b!126690 (= e!82731 (+!170 call!13654 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126691 () Bool)

(assert (=> b!126691 (= e!82728 call!13653)))

(declare-fun bm!13651 () Bool)

(assert (=> bm!13651 (= call!13655 (getCurrentListMapNoExtraKeys!136 lt!65264 lt!65278 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13652 () Bool)

(assert (=> bm!13652 (= call!13653 call!13649)))

(assert (= (and d!38121 c!23158) b!126690))

(assert (= (and d!38121 (not c!23158)) b!126672))

(assert (= (and b!126672 c!23162) b!126684))

(assert (= (and b!126672 (not c!23162)) b!126671))

(assert (= (and b!126671 c!23159) b!126683))

(assert (= (and b!126671 (not c!23159)) b!126691))

(assert (= (or b!126683 b!126691) bm!13652))

(assert (= (or b!126684 bm!13652) bm!13647))

(assert (= (or b!126684 b!126683) bm!13650))

(assert (= (or b!126690 bm!13647) bm!13651))

(assert (= (or b!126690 bm!13650) bm!13648))

(assert (= (and d!38121 res!61277) b!126685))

(assert (= (and d!38121 c!23161) b!126677))

(assert (= (and d!38121 (not c!23161)) b!126673))

(assert (= (and d!38121 res!61275) b!126688))

(assert (= (and b!126688 res!61276) b!126689))

(assert (= (and b!126688 (not res!61281)) b!126675))

(assert (= (and b!126675 res!61273) b!126687))

(assert (= (and b!126688 res!61274) b!126678))

(assert (= (and b!126678 c!23160) b!126680))

(assert (= (and b!126678 (not c!23160)) b!126682))

(assert (= (and b!126680 res!61278) b!126679))

(assert (= (or b!126680 b!126682) bm!13649))

(assert (= (and b!126678 res!61280) b!126686))

(assert (= (and b!126686 c!23163) b!126674))

(assert (= (and b!126686 (not c!23163)) b!126676))

(assert (= (and b!126674 res!61279) b!126681))

(assert (= (or b!126674 b!126676) bm!13646))

(declare-fun b_lambda!5585 () Bool)

(assert (=> (not b_lambda!5585) (not b!126687)))

(assert (=> b!126687 t!6053))

(declare-fun b_and!7803 () Bool)

(assert (= b_and!7799 (and (=> t!6053 result!3847) b_and!7803)))

(assert (=> b!126687 t!6055))

(declare-fun b_and!7805 () Bool)

(assert (= b_and!7801 (and (=> t!6055 result!3849) b_and!7805)))

(declare-fun m!147769 () Bool)

(assert (=> b!126675 m!147769))

(assert (=> b!126675 m!147769))

(declare-fun m!147771 () Bool)

(assert (=> b!126675 m!147771))

(assert (=> d!38121 m!147051))

(declare-fun m!147773 () Bool)

(assert (=> b!126677 m!147773))

(declare-fun m!147775 () Bool)

(assert (=> b!126677 m!147775))

(assert (=> b!126677 m!147775))

(declare-fun m!147777 () Bool)

(assert (=> b!126677 m!147777))

(declare-fun m!147779 () Bool)

(assert (=> b!126677 m!147779))

(declare-fun m!147781 () Bool)

(assert (=> b!126677 m!147781))

(declare-fun m!147783 () Bool)

(assert (=> b!126677 m!147783))

(declare-fun m!147785 () Bool)

(assert (=> b!126677 m!147785))

(declare-fun m!147787 () Bool)

(assert (=> b!126677 m!147787))

(assert (=> b!126677 m!147779))

(declare-fun m!147789 () Bool)

(assert (=> b!126677 m!147789))

(declare-fun m!147791 () Bool)

(assert (=> b!126677 m!147791))

(declare-fun m!147793 () Bool)

(assert (=> b!126677 m!147793))

(declare-fun m!147795 () Bool)

(assert (=> b!126677 m!147795))

(declare-fun m!147797 () Bool)

(assert (=> b!126677 m!147797))

(assert (=> b!126677 m!147769))

(assert (=> b!126677 m!147781))

(declare-fun m!147799 () Bool)

(assert (=> b!126677 m!147799))

(declare-fun m!147801 () Bool)

(assert (=> b!126677 m!147801))

(declare-fun m!147803 () Bool)

(assert (=> b!126677 m!147803))

(assert (=> b!126677 m!147793))

(declare-fun m!147805 () Bool)

(assert (=> bm!13646 m!147805))

(assert (=> b!126689 m!147769))

(assert (=> b!126689 m!147769))

(declare-fun m!147807 () Bool)

(assert (=> b!126689 m!147807))

(declare-fun m!147809 () Bool)

(assert (=> b!126681 m!147809))

(assert (=> b!126685 m!147769))

(assert (=> b!126685 m!147769))

(assert (=> b!126685 m!147807))

(declare-fun m!147811 () Bool)

(assert (=> bm!13648 m!147811))

(declare-fun m!147813 () Bool)

(assert (=> b!126690 m!147813))

(assert (=> bm!13651 m!147801))

(assert (=> b!126687 m!147769))

(assert (=> b!126687 m!147145))

(declare-fun m!147815 () Bool)

(assert (=> b!126687 m!147815))

(assert (=> b!126687 m!147145))

(declare-fun m!147817 () Bool)

(assert (=> b!126687 m!147817))

(assert (=> b!126687 m!147815))

(assert (=> b!126687 m!147769))

(declare-fun m!147819 () Bool)

(assert (=> b!126687 m!147819))

(declare-fun m!147821 () Bool)

(assert (=> b!126679 m!147821))

(declare-fun m!147823 () Bool)

(assert (=> bm!13649 m!147823))

(assert (=> d!37987 d!38121))

(declare-fun d!38123 () Bool)

(assert (=> d!38123 (arrayContainsKey!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!65512 () Unit!3924)

(declare-fun choose!13 (array!4699 (_ BitVec 64) (_ BitVec 32)) Unit!3924)

(assert (=> d!38123 (= lt!65512 (choose!13 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))

(assert (=> d!38123 (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000)))

(assert (=> d!38123 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))) lt!65512)))

(declare-fun bs!5238 () Bool)

(assert (= bs!5238 d!38123))

(assert (=> bs!5238 m!146847))

(assert (=> bs!5238 m!147205))

(assert (=> bs!5238 m!146847))

(declare-fun m!147825 () Bool)

(assert (=> bs!5238 m!147825))

(assert (=> d!37987 d!38123))

(declare-fun b!126702 () Bool)

(declare-fun e!82739 () Bool)

(assert (=> b!126702 (= e!82739 (bvslt (size!2489 (_keys!4516 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!126700 () Bool)

(declare-fun res!61293 () Bool)

(assert (=> b!126700 (=> (not res!61293) (not e!82739))))

(assert (=> b!126700 (= res!61293 (not (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119))))))))

(declare-fun e!82740 () Bool)

(declare-fun b!126703 () Bool)

(assert (=> b!126703 (= e!82740 (= (arrayCountValidKeys!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4516 newMap!16) #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun d!38125 () Bool)

(assert (=> d!38125 e!82740))

(declare-fun res!61291 () Bool)

(assert (=> d!38125 (=> (not res!61291) (not e!82740))))

(assert (=> d!38125 (= res!61291 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 (_keys!4516 newMap!16)))))))

(declare-fun lt!65515 () Unit!3924)

(declare-fun choose!1 (array!4699 (_ BitVec 32) (_ BitVec 64)) Unit!3924)

(assert (=> d!38125 (= lt!65515 (choose!1 (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38125 e!82739))

(declare-fun res!61292 () Bool)

(assert (=> d!38125 (=> (not res!61292) (not e!82739))))

(assert (=> d!38125 (= res!61292 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 (_keys!4516 newMap!16)))))))

(assert (=> d!38125 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65515)))

(declare-fun b!126701 () Bool)

(declare-fun res!61290 () Bool)

(assert (=> b!126701 (=> (not res!61290) (not e!82739))))

(assert (=> b!126701 (= res!61290 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38125 res!61292) b!126700))

(assert (= (and b!126700 res!61293) b!126701))

(assert (= (and b!126701 res!61290) b!126702))

(assert (= (and d!38125 res!61291) b!126703))

(declare-fun m!147827 () Bool)

(assert (=> b!126700 m!147827))

(assert (=> b!126700 m!147827))

(declare-fun m!147829 () Bool)

(assert (=> b!126700 m!147829))

(assert (=> b!126703 m!147197))

(assert (=> b!126703 m!147215))

(assert (=> b!126703 m!147019))

(assert (=> d!38125 m!146847))

(declare-fun m!147831 () Bool)

(assert (=> d!38125 m!147831))

(assert (=> b!126701 m!146847))

(declare-fun m!147833 () Bool)

(assert (=> b!126701 m!147833))

(assert (=> d!37987 d!38125))

(declare-fun d!38127 () Bool)

(declare-fun res!61294 () Bool)

(declare-fun e!82741 () Bool)

(assert (=> d!38127 (=> res!61294 e!82741)))

(assert (=> d!38127 (= res!61294 (= (select (arr!2225 lt!65275) #b00000000000000000000000000000000) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38127 (= (arrayContainsKey!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000) e!82741)))

(declare-fun b!126704 () Bool)

(declare-fun e!82742 () Bool)

(assert (=> b!126704 (= e!82741 e!82742)))

(declare-fun res!61295 () Bool)

(assert (=> b!126704 (=> (not res!61295) (not e!82742))))

(assert (=> b!126704 (= res!61295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 lt!65275)))))

(declare-fun b!126705 () Bool)

(assert (=> b!126705 (= e!82742 (arrayContainsKey!0 lt!65275 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38127 (not res!61294)) b!126704))

(assert (= (and b!126704 res!61295) b!126705))

(declare-fun m!147835 () Bool)

(assert (=> d!38127 m!147835))

(assert (=> b!126705 m!146847))

(declare-fun m!147837 () Bool)

(assert (=> b!126705 m!147837))

(assert (=> d!37987 d!38127))

(assert (=> d!37987 d!37945))

(assert (=> d!37987 d!38007))

(declare-fun d!38129 () Bool)

(declare-fun e!82745 () Bool)

(assert (=> d!38129 e!82745))

(declare-fun res!61298 () Bool)

(assert (=> d!38129 (=> (not res!61298) (not e!82745))))

(assert (=> d!38129 (= res!61298 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 (_keys!4516 newMap!16))) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2490 (_values!2766 newMap!16)))))))

(declare-fun lt!65518 () Unit!3924)

(declare-fun choose!769 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 32) (_ BitVec 64) V!3435 Int) Unit!3924)

(assert (=> d!38129 (= lt!65518 (choose!769 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)))))

(assert (=> d!38129 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38129 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!37 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)) lt!65518)))

(declare-fun b!126708 () Bool)

(assert (=> b!126708 (= e!82745 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))))

(assert (= (and d!38129 res!61298) b!126708))

(assert (=> d!38129 m!146847))

(assert (=> d!38129 m!146845))

(declare-fun m!147839 () Bool)

(assert (=> d!38129 m!147839))

(assert (=> d!38129 m!147051))

(assert (=> b!126708 m!146893))

(assert (=> b!126708 m!147209))

(assert (=> b!126708 m!146893))

(assert (=> b!126708 m!147185))

(assert (=> b!126708 m!147197))

(assert (=> b!126708 m!147195))

(assert (=> d!37987 d!38129))

(declare-fun d!38131 () Bool)

(declare-fun e!82748 () Bool)

(assert (=> d!38131 e!82748))

(declare-fun res!61301 () Bool)

(assert (=> d!38131 (=> (not res!61301) (not e!82748))))

(assert (=> d!38131 (= res!61301 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 (_keys!4516 newMap!16)))))))

(declare-fun lt!65521 () Unit!3924)

(declare-fun choose!41 (array!4699 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1700) Unit!3924)

(assert (=> d!38131 (= lt!65521 (choose!41 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) lt!65263 lt!65260))))

(assert (=> d!38131 (bvslt (size!2489 (_keys!4516 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!38131 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) lt!65263 lt!65260) lt!65521)))

(declare-fun b!126711 () Bool)

(assert (=> b!126711 (= e!82748 (arrayNoDuplicates!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) lt!65263 lt!65260))))

(assert (= (and d!38131 res!61301) b!126711))

(assert (=> d!38131 m!146847))

(declare-fun m!147841 () Bool)

(assert (=> d!38131 m!147841))

(assert (=> b!126711 m!147197))

(assert (=> b!126711 m!147207))

(assert (=> d!37987 d!38131))

(declare-fun b!126712 () Bool)

(declare-fun e!82750 () Bool)

(declare-fun call!13656 () Bool)

(assert (=> b!126712 (= e!82750 call!13656)))

(declare-fun b!126713 () Bool)

(assert (=> b!126713 (= e!82750 call!13656)))

(declare-fun b!126714 () Bool)

(declare-fun e!82749 () Bool)

(assert (=> b!126714 (= e!82749 e!82750)))

(declare-fun c!23164 () Bool)

(assert (=> b!126714 (= c!23164 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) lt!65263)))))

(declare-fun bm!13653 () Bool)

(assert (=> bm!13653 (= call!13656 (arrayNoDuplicates!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (bvadd lt!65263 #b00000000000000000000000000000001) (ite c!23164 (Cons!1696 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) lt!65263) lt!65260) lt!65260)))))

(declare-fun d!38133 () Bool)

(declare-fun res!61302 () Bool)

(declare-fun e!82752 () Bool)

(assert (=> d!38133 (=> res!61302 e!82752)))

(assert (=> d!38133 (= res!61302 (bvsge lt!65263 (size!2489 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))))))))

(assert (=> d!38133 (= (arrayNoDuplicates!0 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) lt!65263 lt!65260) e!82752)))

(declare-fun b!126715 () Bool)

(assert (=> b!126715 (= e!82752 e!82749)))

(declare-fun res!61304 () Bool)

(assert (=> b!126715 (=> (not res!61304) (not e!82749))))

(declare-fun e!82751 () Bool)

(assert (=> b!126715 (= res!61304 (not e!82751))))

(declare-fun res!61303 () Bool)

(assert (=> b!126715 (=> (not res!61303) (not e!82751))))

(assert (=> b!126715 (= res!61303 (validKeyInArray!0 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) lt!65263)))))

(declare-fun b!126716 () Bool)

(assert (=> b!126716 (= e!82751 (contains!880 lt!65260 (select (arr!2225 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16)))) lt!65263)))))

(assert (= (and d!38133 (not res!61302)) b!126715))

(assert (= (and b!126715 res!61303) b!126716))

(assert (= (and b!126715 res!61304) b!126714))

(assert (= (and b!126714 c!23164) b!126713))

(assert (= (and b!126714 (not c!23164)) b!126712))

(assert (= (or b!126713 b!126712) bm!13653))

(declare-fun m!147843 () Bool)

(assert (=> b!126714 m!147843))

(assert (=> b!126714 m!147843))

(declare-fun m!147845 () Bool)

(assert (=> b!126714 m!147845))

(assert (=> bm!13653 m!147843))

(declare-fun m!147847 () Bool)

(assert (=> bm!13653 m!147847))

(assert (=> b!126715 m!147843))

(assert (=> b!126715 m!147843))

(assert (=> b!126715 m!147845))

(assert (=> b!126716 m!147843))

(assert (=> b!126716 m!147843))

(declare-fun m!147849 () Bool)

(assert (=> b!126716 m!147849))

(assert (=> d!37987 d!38133))

(declare-fun d!38135 () Bool)

(declare-fun e!82755 () Bool)

(assert (=> d!38135 e!82755))

(declare-fun res!61307 () Bool)

(assert (=> d!38135 (=> (not res!61307) (not e!82755))))

(assert (=> d!38135 (= res!61307 (and (bvsge (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) #b00000000000000000000000000000000) (bvslt (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (size!2489 (_keys!4516 newMap!16)))))))

(declare-fun lt!65524 () Unit!3924)

(declare-fun choose!102 ((_ BitVec 64) array!4699 (_ BitVec 32) (_ BitVec 32)) Unit!3924)

(assert (=> d!38135 (= lt!65524 (choose!102 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (mask!7039 newMap!16)))))

(assert (=> d!38135 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38135 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (mask!7039 newMap!16)) lt!65524)))

(declare-fun b!126719 () Bool)

(assert (=> b!126719 (= e!82755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4700 (store (arr!2225 (_keys!4516 newMap!16)) (ite c!23023 (index!3238 lt!65119) (index!3235 lt!65119)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (size!2489 (_keys!4516 newMap!16))) (mask!7039 newMap!16)))))

(assert (= (and d!38135 res!61307) b!126719))

(assert (=> d!38135 m!146847))

(declare-fun m!147851 () Bool)

(assert (=> d!38135 m!147851))

(assert (=> d!38135 m!147051))

(assert (=> b!126719 m!147197))

(assert (=> b!126719 m!147217))

(assert (=> d!37987 d!38135))

(assert (=> d!37987 d!37955))

(declare-fun b!126721 () Bool)

(declare-fun res!61310 () Bool)

(declare-fun e!82756 () Bool)

(assert (=> b!126721 (=> (not res!61310) (not e!82756))))

(assert (=> b!126721 (= res!61310 (bvsge (size!2493 (_2!1300 lt!65097)) (_size!580 (_2!1300 lt!65097))))))

(declare-fun b!126720 () Bool)

(declare-fun res!61311 () Bool)

(assert (=> b!126720 (=> (not res!61311) (not e!82756))))

(assert (=> b!126720 (= res!61311 (and (= (size!2490 (_values!2766 (_2!1300 lt!65097))) (bvadd (mask!7039 (_2!1300 lt!65097)) #b00000000000000000000000000000001)) (= (size!2489 (_keys!4516 (_2!1300 lt!65097))) (size!2490 (_values!2766 (_2!1300 lt!65097)))) (bvsge (_size!580 (_2!1300 lt!65097)) #b00000000000000000000000000000000) (bvsle (_size!580 (_2!1300 lt!65097)) (bvadd (mask!7039 (_2!1300 lt!65097)) #b00000000000000000000000000000001))))))

(declare-fun d!38137 () Bool)

(declare-fun res!61309 () Bool)

(assert (=> d!38137 (=> (not res!61309) (not e!82756))))

(assert (=> d!38137 (= res!61309 (validMask!0 (mask!7039 (_2!1300 lt!65097))))))

(assert (=> d!38137 (= (simpleValid!87 (_2!1300 lt!65097)) e!82756)))

(declare-fun b!126722 () Bool)

(declare-fun res!61308 () Bool)

(assert (=> b!126722 (=> (not res!61308) (not e!82756))))

(assert (=> b!126722 (= res!61308 (= (size!2493 (_2!1300 lt!65097)) (bvadd (_size!580 (_2!1300 lt!65097)) (bvsdiv (bvadd (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!126723 () Bool)

(assert (=> b!126723 (= e!82756 (and (bvsge (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000000) (bvsle (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000011) (bvsge (_vacant!580 (_2!1300 lt!65097)) #b00000000000000000000000000000000)))))

(assert (= (and d!38137 res!61309) b!126720))

(assert (= (and b!126720 res!61311) b!126721))

(assert (= (and b!126721 res!61310) b!126722))

(assert (= (and b!126722 res!61308) b!126723))

(declare-fun m!147853 () Bool)

(assert (=> b!126721 m!147853))

(declare-fun m!147855 () Bool)

(assert (=> d!38137 m!147855))

(assert (=> b!126722 m!147853))

(assert (=> d!38009 d!38137))

(declare-fun d!38139 () Bool)

(declare-fun c!23165 () Bool)

(assert (=> d!38139 (= c!23165 (and ((_ is Cons!1694) (toList!856 lt!65349)) (= (_1!1299 (h!2296 (toList!856 lt!65349))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun e!82757 () Option!173)

(assert (=> d!38139 (= (getValueByKey!167 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) e!82757)))

(declare-fun b!126725 () Bool)

(declare-fun e!82758 () Option!173)

(assert (=> b!126725 (= e!82757 e!82758)))

(declare-fun c!23166 () Bool)

(assert (=> b!126725 (= c!23166 (and ((_ is Cons!1694) (toList!856 lt!65349)) (not (= (_1!1299 (h!2296 (toList!856 lt!65349))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!126727 () Bool)

(assert (=> b!126727 (= e!82758 None!171)))

(declare-fun b!126726 () Bool)

(assert (=> b!126726 (= e!82758 (getValueByKey!167 (t!6045 (toList!856 lt!65349)) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126724 () Bool)

(assert (=> b!126724 (= e!82757 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65349)))))))

(assert (= (and d!38139 c!23165) b!126724))

(assert (= (and d!38139 (not c!23165)) b!126725))

(assert (= (and b!126725 c!23166) b!126726))

(assert (= (and b!126725 (not c!23166)) b!126727))

(declare-fun m!147857 () Bool)

(assert (=> b!126726 m!147857))

(assert (=> b!126453 d!38139))

(declare-fun d!38141 () Bool)

(assert (=> d!38141 (= (get!1447 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3128 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38049 d!38141))

(declare-fun d!38143 () Bool)

(declare-fun c!23167 () Bool)

(assert (=> d!38143 (= c!23167 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!82759 () Option!173)

(assert (=> d!38143 (= (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000) e!82759)))

(declare-fun b!126729 () Bool)

(declare-fun e!82760 () Option!173)

(assert (=> b!126729 (= e!82759 e!82760)))

(declare-fun c!23168 () Bool)

(assert (=> b!126729 (= c!23168 (and ((_ is Cons!1694) (toList!856 lt!65008)) (not (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126731 () Bool)

(assert (=> b!126731 (= e!82760 None!171)))

(declare-fun b!126730 () Bool)

(assert (=> b!126730 (= e!82760 (getValueByKey!167 (t!6045 (toList!856 lt!65008)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126728 () Bool)

(assert (=> b!126728 (= e!82759 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65008)))))))

(assert (= (and d!38143 c!23167) b!126728))

(assert (= (and d!38143 (not c!23167)) b!126729))

(assert (= (and b!126729 c!23168) b!126730))

(assert (= (and b!126729 (not c!23168)) b!126731))

(declare-fun m!147859 () Bool)

(assert (=> b!126730 m!147859))

(assert (=> d!38049 d!38143))

(declare-fun d!38145 () Bool)

(declare-fun e!82762 () Bool)

(assert (=> d!38145 e!82762))

(declare-fun res!61312 () Bool)

(assert (=> d!38145 (=> res!61312 e!82762)))

(declare-fun lt!65526 () Bool)

(assert (=> d!38145 (= res!61312 (not lt!65526))))

(declare-fun lt!65525 () Bool)

(assert (=> d!38145 (= lt!65526 lt!65525)))

(declare-fun lt!65528 () Unit!3924)

(declare-fun e!82761 () Unit!3924)

(assert (=> d!38145 (= lt!65528 e!82761)))

(declare-fun c!23169 () Bool)

(assert (=> d!38145 (= c!23169 lt!65525)))

(assert (=> d!38145 (= lt!65525 (containsKey!171 (toList!856 lt!65166) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38145 (= (contains!877 lt!65166 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65526)))

(declare-fun b!126732 () Bool)

(declare-fun lt!65527 () Unit!3924)

(assert (=> b!126732 (= e!82761 lt!65527)))

(assert (=> b!126732 (= lt!65527 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65166) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126732 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126733 () Bool)

(declare-fun Unit!3947 () Unit!3924)

(assert (=> b!126733 (= e!82761 Unit!3947)))

(declare-fun b!126734 () Bool)

(assert (=> b!126734 (= e!82762 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38145 c!23169) b!126732))

(assert (= (and d!38145 (not c!23169)) b!126733))

(assert (= (and d!38145 (not res!61312)) b!126734))

(declare-fun m!147861 () Bool)

(assert (=> d!38145 m!147861))

(declare-fun m!147863 () Bool)

(assert (=> b!126732 m!147863))

(declare-fun m!147865 () Bool)

(assert (=> b!126732 m!147865))

(assert (=> b!126732 m!147865))

(declare-fun m!147867 () Bool)

(assert (=> b!126732 m!147867))

(assert (=> b!126734 m!147865))

(assert (=> b!126734 m!147865))

(assert (=> b!126734 m!147867))

(assert (=> bm!13599 d!38145))

(declare-fun d!38147 () Bool)

(declare-fun e!82764 () Bool)

(assert (=> d!38147 e!82764))

(declare-fun res!61313 () Bool)

(assert (=> d!38147 (=> res!61313 e!82764)))

(declare-fun lt!65530 () Bool)

(assert (=> d!38147 (= res!61313 (not lt!65530))))

(declare-fun lt!65529 () Bool)

(assert (=> d!38147 (= lt!65530 lt!65529)))

(declare-fun lt!65532 () Unit!3924)

(declare-fun e!82763 () Unit!3924)

(assert (=> d!38147 (= lt!65532 e!82763)))

(declare-fun c!23170 () Bool)

(assert (=> d!38147 (= c!23170 lt!65529)))

(assert (=> d!38147 (= lt!65529 (containsKey!171 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38147 (= (contains!877 lt!65360 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65530)))

(declare-fun b!126735 () Bool)

(declare-fun lt!65531 () Unit!3924)

(assert (=> b!126735 (= e!82763 lt!65531)))

(assert (=> b!126735 (= lt!65531 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!126735 (isDefined!120 (getValueByKey!167 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126736 () Bool)

(declare-fun Unit!3948 () Unit!3924)

(assert (=> b!126736 (= e!82763 Unit!3948)))

(declare-fun b!126737 () Bool)

(assert (=> b!126737 (= e!82764 (isDefined!120 (getValueByKey!167 (toList!856 lt!65360) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38147 c!23170) b!126735))

(assert (= (and d!38147 (not c!23170)) b!126736))

(assert (= (and d!38147 (not res!61313)) b!126737))

(declare-fun m!147869 () Bool)

(assert (=> d!38147 m!147869))

(declare-fun m!147871 () Bool)

(assert (=> b!126735 m!147871))

(assert (=> b!126735 m!147433))

(assert (=> b!126735 m!147433))

(declare-fun m!147873 () Bool)

(assert (=> b!126735 m!147873))

(assert (=> b!126737 m!147433))

(assert (=> b!126737 m!147433))

(assert (=> b!126737 m!147873))

(assert (=> d!38025 d!38147))

(declare-fun c!23171 () Bool)

(declare-fun d!38149 () Bool)

(assert (=> d!38149 (= c!23171 (and ((_ is Cons!1694) lt!65358) (= (_1!1299 (h!2296 lt!65358)) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82765 () Option!173)

(assert (=> d!38149 (= (getValueByKey!167 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82765)))

(declare-fun b!126739 () Bool)

(declare-fun e!82766 () Option!173)

(assert (=> b!126739 (= e!82765 e!82766)))

(declare-fun c!23172 () Bool)

(assert (=> b!126739 (= c!23172 (and ((_ is Cons!1694) lt!65358) (not (= (_1!1299 (h!2296 lt!65358)) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126741 () Bool)

(assert (=> b!126741 (= e!82766 None!171)))

(declare-fun b!126740 () Bool)

(assert (=> b!126740 (= e!82766 (getValueByKey!167 (t!6045 lt!65358) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126738 () Bool)

(assert (=> b!126738 (= e!82765 (Some!172 (_2!1299 (h!2296 lt!65358))))))

(assert (= (and d!38149 c!23171) b!126738))

(assert (= (and d!38149 (not c!23171)) b!126739))

(assert (= (and b!126739 c!23172) b!126740))

(assert (= (and b!126739 (not c!23172)) b!126741))

(declare-fun m!147875 () Bool)

(assert (=> b!126740 m!147875))

(assert (=> d!38025 d!38149))

(declare-fun d!38151 () Bool)

(assert (=> d!38151 (= (getValueByKey!167 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65535 () Unit!3924)

(declare-fun choose!770 (List!1698 (_ BitVec 64) V!3435) Unit!3924)

(assert (=> d!38151 (= lt!65535 (choose!770 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82769 () Bool)

(assert (=> d!38151 e!82769))

(declare-fun res!61318 () Bool)

(assert (=> d!38151 (=> (not res!61318) (not e!82769))))

(assert (=> d!38151 (= res!61318 (isStrictlySorted!317 lt!65358))))

(assert (=> d!38151 (= (lemmaContainsTupThenGetReturnValue!82 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65535)))

(declare-fun b!126746 () Bool)

(declare-fun res!61319 () Bool)

(assert (=> b!126746 (=> (not res!61319) (not e!82769))))

(assert (=> b!126746 (= res!61319 (containsKey!171 lt!65358 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126747 () Bool)

(assert (=> b!126747 (= e!82769 (contains!879 lt!65358 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38151 res!61318) b!126746))

(assert (= (and b!126746 res!61319) b!126747))

(assert (=> d!38151 m!147427))

(declare-fun m!147877 () Bool)

(assert (=> d!38151 m!147877))

(declare-fun m!147879 () Bool)

(assert (=> d!38151 m!147879))

(declare-fun m!147881 () Bool)

(assert (=> b!126746 m!147881))

(declare-fun m!147883 () Bool)

(assert (=> b!126747 m!147883))

(assert (=> d!38025 d!38151))

(declare-fun e!82780 () List!1698)

(declare-fun b!126768 () Bool)

(declare-fun c!23184 () Bool)

(declare-fun c!23182 () Bool)

(assert (=> b!126768 (= e!82780 (ite c!23182 (t!6045 (toList!856 lt!65016)) (ite c!23184 (Cons!1694 (h!2296 (toList!856 lt!65016)) (t!6045 (toList!856 lt!65016))) Nil!1695)))))

(declare-fun call!13664 () List!1698)

(declare-fun c!23183 () Bool)

(declare-fun bm!13660 () Bool)

(declare-fun $colon$colon!89 (List!1698 tuple2!2576) List!1698)

(assert (=> bm!13660 (= call!13664 ($colon$colon!89 e!82780 (ite c!23183 (h!2296 (toList!856 lt!65016)) (tuple2!2577 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23181 () Bool)

(assert (=> bm!13660 (= c!23181 c!23183)))

(declare-fun b!126769 () Bool)

(assert (=> b!126769 (= e!82780 (insertStrictlySorted!85 (t!6045 (toList!856 lt!65016)) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65538 () List!1698)

(declare-fun e!82781 () Bool)

(declare-fun b!126770 () Bool)

(assert (=> b!126770 (= e!82781 (contains!879 lt!65538 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126771 () Bool)

(declare-fun e!82784 () List!1698)

(declare-fun call!13663 () List!1698)

(assert (=> b!126771 (= e!82784 call!13663)))

(declare-fun b!126772 () Bool)

(declare-fun e!82783 () List!1698)

(declare-fun call!13665 () List!1698)

(assert (=> b!126772 (= e!82783 call!13665)))

(declare-fun b!126773 () Bool)

(assert (=> b!126773 (= e!82783 call!13665)))

(declare-fun b!126774 () Bool)

(declare-fun e!82782 () List!1698)

(assert (=> b!126774 (= e!82782 call!13664)))

(declare-fun d!38153 () Bool)

(assert (=> d!38153 e!82781))

(declare-fun res!61324 () Bool)

(assert (=> d!38153 (=> (not res!61324) (not e!82781))))

(assert (=> d!38153 (= res!61324 (isStrictlySorted!317 lt!65538))))

(assert (=> d!38153 (= lt!65538 e!82782)))

(assert (=> d!38153 (= c!23183 (and ((_ is Cons!1694) (toList!856 lt!65016)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65016))) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38153 (isStrictlySorted!317 (toList!856 lt!65016))))

(assert (=> d!38153 (= (insertStrictlySorted!85 (toList!856 lt!65016) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65538)))

(declare-fun bm!13661 () Bool)

(assert (=> bm!13661 (= call!13663 call!13664)))

(declare-fun bm!13662 () Bool)

(assert (=> bm!13662 (= call!13665 call!13663)))

(declare-fun b!126775 () Bool)

(declare-fun res!61325 () Bool)

(assert (=> b!126775 (=> (not res!61325) (not e!82781))))

(assert (=> b!126775 (= res!61325 (containsKey!171 lt!65538 (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126776 () Bool)

(assert (=> b!126776 (= c!23184 (and ((_ is Cons!1694) (toList!856 lt!65016)) (bvsgt (_1!1299 (h!2296 (toList!856 lt!65016))) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!126776 (= e!82784 e!82783)))

(declare-fun b!126777 () Bool)

(assert (=> b!126777 (= e!82782 e!82784)))

(assert (=> b!126777 (= c!23182 (and ((_ is Cons!1694) (toList!856 lt!65016)) (= (_1!1299 (h!2296 (toList!856 lt!65016))) (_1!1299 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38153 c!23183) b!126774))

(assert (= (and d!38153 (not c!23183)) b!126777))

(assert (= (and b!126777 c!23182) b!126771))

(assert (= (and b!126777 (not c!23182)) b!126776))

(assert (= (and b!126776 c!23184) b!126773))

(assert (= (and b!126776 (not c!23184)) b!126772))

(assert (= (or b!126773 b!126772) bm!13662))

(assert (= (or b!126771 bm!13662) bm!13661))

(assert (= (or b!126774 bm!13661) bm!13660))

(assert (= (and bm!13660 c!23181) b!126769))

(assert (= (and bm!13660 (not c!23181)) b!126768))

(assert (= (and d!38153 res!61324) b!126775))

(assert (= (and b!126775 res!61325) b!126770))

(declare-fun m!147885 () Bool)

(assert (=> b!126769 m!147885))

(declare-fun m!147887 () Bool)

(assert (=> b!126770 m!147887))

(declare-fun m!147889 () Bool)

(assert (=> d!38153 m!147889))

(declare-fun m!147891 () Bool)

(assert (=> d!38153 m!147891))

(declare-fun m!147893 () Bool)

(assert (=> b!126775 m!147893))

(declare-fun m!147895 () Bool)

(assert (=> bm!13660 m!147895))

(assert (=> d!38025 d!38153))

(declare-fun d!38155 () Bool)

(declare-fun e!82786 () Bool)

(assert (=> d!38155 e!82786))

(declare-fun res!61326 () Bool)

(assert (=> d!38155 (=> res!61326 e!82786)))

(declare-fun lt!65540 () Bool)

(assert (=> d!38155 (= res!61326 (not lt!65540))))

(declare-fun lt!65539 () Bool)

(assert (=> d!38155 (= lt!65540 lt!65539)))

(declare-fun lt!65542 () Unit!3924)

(declare-fun e!82785 () Unit!3924)

(assert (=> d!38155 (= lt!65542 e!82785)))

(declare-fun c!23185 () Bool)

(assert (=> d!38155 (= c!23185 lt!65539)))

(assert (=> d!38155 (= lt!65539 (containsKey!171 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38155 (= (contains!877 lt!65398 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65540)))

(declare-fun b!126778 () Bool)

(declare-fun lt!65541 () Unit!3924)

(assert (=> b!126778 (= e!82785 lt!65541)))

(assert (=> b!126778 (= lt!65541 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!126778 (isDefined!120 (getValueByKey!167 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126779 () Bool)

(declare-fun Unit!3949 () Unit!3924)

(assert (=> b!126779 (= e!82785 Unit!3949)))

(declare-fun b!126780 () Bool)

(assert (=> b!126780 (= e!82786 (isDefined!120 (getValueByKey!167 (toList!856 lt!65398) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38155 c!23185) b!126778))

(assert (= (and d!38155 (not c!23185)) b!126779))

(assert (= (and d!38155 (not res!61326)) b!126780))

(declare-fun m!147897 () Bool)

(assert (=> d!38155 m!147897))

(declare-fun m!147899 () Bool)

(assert (=> b!126778 m!147899))

(assert (=> b!126778 m!147509))

(assert (=> b!126778 m!147509))

(declare-fun m!147901 () Bool)

(assert (=> b!126778 m!147901))

(assert (=> b!126780 m!147509))

(assert (=> b!126780 m!147509))

(assert (=> b!126780 m!147901))

(assert (=> d!38045 d!38155))

(declare-fun c!23186 () Bool)

(declare-fun d!38157 () Bool)

(assert (=> d!38157 (= c!23186 (and ((_ is Cons!1694) lt!65396) (= (_1!1299 (h!2296 lt!65396)) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82787 () Option!173)

(assert (=> d!38157 (= (getValueByKey!167 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82787)))

(declare-fun b!126782 () Bool)

(declare-fun e!82788 () Option!173)

(assert (=> b!126782 (= e!82787 e!82788)))

(declare-fun c!23187 () Bool)

(assert (=> b!126782 (= c!23187 (and ((_ is Cons!1694) lt!65396) (not (= (_1!1299 (h!2296 lt!65396)) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126784 () Bool)

(assert (=> b!126784 (= e!82788 None!171)))

(declare-fun b!126783 () Bool)

(assert (=> b!126783 (= e!82788 (getValueByKey!167 (t!6045 lt!65396) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126781 () Bool)

(assert (=> b!126781 (= e!82787 (Some!172 (_2!1299 (h!2296 lt!65396))))))

(assert (= (and d!38157 c!23186) b!126781))

(assert (= (and d!38157 (not c!23186)) b!126782))

(assert (= (and b!126782 c!23187) b!126783))

(assert (= (and b!126782 (not c!23187)) b!126784))

(declare-fun m!147903 () Bool)

(assert (=> b!126783 m!147903))

(assert (=> d!38045 d!38157))

(declare-fun d!38159 () Bool)

(assert (=> d!38159 (= (getValueByKey!167 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65543 () Unit!3924)

(assert (=> d!38159 (= lt!65543 (choose!770 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82789 () Bool)

(assert (=> d!38159 e!82789))

(declare-fun res!61327 () Bool)

(assert (=> d!38159 (=> (not res!61327) (not e!82789))))

(assert (=> d!38159 (= res!61327 (isStrictlySorted!317 lt!65396))))

(assert (=> d!38159 (= (lemmaContainsTupThenGetReturnValue!82 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65543)))

(declare-fun b!126785 () Bool)

(declare-fun res!61328 () Bool)

(assert (=> b!126785 (=> (not res!61328) (not e!82789))))

(assert (=> b!126785 (= res!61328 (containsKey!171 lt!65396 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126786 () Bool)

(assert (=> b!126786 (= e!82789 (contains!879 lt!65396 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38159 res!61327) b!126785))

(assert (= (and b!126785 res!61328) b!126786))

(assert (=> d!38159 m!147503))

(declare-fun m!147905 () Bool)

(assert (=> d!38159 m!147905))

(declare-fun m!147907 () Bool)

(assert (=> d!38159 m!147907))

(declare-fun m!147909 () Bool)

(assert (=> b!126785 m!147909))

(declare-fun m!147911 () Bool)

(assert (=> b!126786 m!147911))

(assert (=> d!38045 d!38159))

(declare-fun c!23191 () Bool)

(declare-fun b!126787 () Bool)

(declare-fun e!82790 () List!1698)

(declare-fun c!23189 () Bool)

(assert (=> b!126787 (= e!82790 (ite c!23189 (t!6045 (toList!856 lt!65020)) (ite c!23191 (Cons!1694 (h!2296 (toList!856 lt!65020)) (t!6045 (toList!856 lt!65020))) Nil!1695)))))

(declare-fun c!23190 () Bool)

(declare-fun call!13667 () List!1698)

(declare-fun bm!13663 () Bool)

(assert (=> bm!13663 (= call!13667 ($colon$colon!89 e!82790 (ite c!23190 (h!2296 (toList!856 lt!65020)) (tuple2!2577 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23188 () Bool)

(assert (=> bm!13663 (= c!23188 c!23190)))

(declare-fun b!126788 () Bool)

(assert (=> b!126788 (= e!82790 (insertStrictlySorted!85 (t!6045 (toList!856 lt!65020)) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82791 () Bool)

(declare-fun b!126789 () Bool)

(declare-fun lt!65544 () List!1698)

(assert (=> b!126789 (= e!82791 (contains!879 lt!65544 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!126790 () Bool)

(declare-fun e!82794 () List!1698)

(declare-fun call!13666 () List!1698)

(assert (=> b!126790 (= e!82794 call!13666)))

(declare-fun b!126791 () Bool)

(declare-fun e!82793 () List!1698)

(declare-fun call!13668 () List!1698)

(assert (=> b!126791 (= e!82793 call!13668)))

(declare-fun b!126792 () Bool)

(assert (=> b!126792 (= e!82793 call!13668)))

(declare-fun b!126793 () Bool)

(declare-fun e!82792 () List!1698)

(assert (=> b!126793 (= e!82792 call!13667)))

(declare-fun d!38161 () Bool)

(assert (=> d!38161 e!82791))

(declare-fun res!61329 () Bool)

(assert (=> d!38161 (=> (not res!61329) (not e!82791))))

(assert (=> d!38161 (= res!61329 (isStrictlySorted!317 lt!65544))))

(assert (=> d!38161 (= lt!65544 e!82792)))

(assert (=> d!38161 (= c!23190 (and ((_ is Cons!1694) (toList!856 lt!65020)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65020))) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38161 (isStrictlySorted!317 (toList!856 lt!65020))))

(assert (=> d!38161 (= (insertStrictlySorted!85 (toList!856 lt!65020) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65544)))

(declare-fun bm!13664 () Bool)

(assert (=> bm!13664 (= call!13666 call!13667)))

(declare-fun bm!13665 () Bool)

(assert (=> bm!13665 (= call!13668 call!13666)))

(declare-fun b!126794 () Bool)

(declare-fun res!61330 () Bool)

(assert (=> b!126794 (=> (not res!61330) (not e!82791))))

(assert (=> b!126794 (= res!61330 (containsKey!171 lt!65544 (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126795 () Bool)

(assert (=> b!126795 (= c!23191 (and ((_ is Cons!1694) (toList!856 lt!65020)) (bvsgt (_1!1299 (h!2296 (toList!856 lt!65020))) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!126795 (= e!82794 e!82793)))

(declare-fun b!126796 () Bool)

(assert (=> b!126796 (= e!82792 e!82794)))

(assert (=> b!126796 (= c!23189 (and ((_ is Cons!1694) (toList!856 lt!65020)) (= (_1!1299 (h!2296 (toList!856 lt!65020))) (_1!1299 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38161 c!23190) b!126793))

(assert (= (and d!38161 (not c!23190)) b!126796))

(assert (= (and b!126796 c!23189) b!126790))

(assert (= (and b!126796 (not c!23189)) b!126795))

(assert (= (and b!126795 c!23191) b!126792))

(assert (= (and b!126795 (not c!23191)) b!126791))

(assert (= (or b!126792 b!126791) bm!13665))

(assert (= (or b!126790 bm!13665) bm!13664))

(assert (= (or b!126793 bm!13664) bm!13663))

(assert (= (and bm!13663 c!23188) b!126788))

(assert (= (and bm!13663 (not c!23188)) b!126787))

(assert (= (and d!38161 res!61329) b!126794))

(assert (= (and b!126794 res!61330) b!126789))

(declare-fun m!147913 () Bool)

(assert (=> b!126788 m!147913))

(declare-fun m!147915 () Bool)

(assert (=> b!126789 m!147915))

(declare-fun m!147917 () Bool)

(assert (=> d!38161 m!147917))

(declare-fun m!147919 () Bool)

(assert (=> d!38161 m!147919))

(declare-fun m!147921 () Bool)

(assert (=> b!126794 m!147921))

(declare-fun m!147923 () Bool)

(assert (=> bm!13663 m!147923))

(assert (=> d!38045 d!38161))

(declare-fun d!38163 () Bool)

(declare-fun res!61331 () Bool)

(declare-fun e!82795 () Bool)

(assert (=> d!38163 (=> res!61331 e!82795)))

(assert (=> d!38163 (= res!61331 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65027)))))

(assert (=> d!38163 (= (containsKey!171 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027) e!82795)))

(declare-fun b!126797 () Bool)

(declare-fun e!82796 () Bool)

(assert (=> b!126797 (= e!82795 e!82796)))

(declare-fun res!61332 () Bool)

(assert (=> b!126797 (=> (not res!61332) (not e!82796))))

(assert (=> b!126797 (= res!61332 (and (or (not ((_ is Cons!1694) (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) (bvsle (_1!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65027)) ((_ is Cons!1694) (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (bvslt (_1!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65027)))))

(declare-fun b!126798 () Bool)

(assert (=> b!126798 (= e!82796 (containsKey!171 (t!6045 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65027))))

(assert (= (and d!38163 (not res!61331)) b!126797))

(assert (= (and b!126797 res!61332) b!126798))

(declare-fun m!147925 () Bool)

(assert (=> b!126798 m!147925))

(assert (=> d!38043 d!38163))

(declare-fun d!38165 () Bool)

(declare-fun e!82797 () Bool)

(assert (=> d!38165 e!82797))

(declare-fun res!61333 () Bool)

(assert (=> d!38165 (=> (not res!61333) (not e!82797))))

(declare-fun lt!65547 () ListLongMap!1681)

(assert (=> d!38165 (= res!61333 (contains!877 lt!65547 (_1!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65545 () List!1698)

(assert (=> d!38165 (= lt!65547 (ListLongMap!1682 lt!65545))))

(declare-fun lt!65546 () Unit!3924)

(declare-fun lt!65548 () Unit!3924)

(assert (=> d!38165 (= lt!65546 lt!65548)))

(assert (=> d!38165 (= (getValueByKey!167 lt!65545 (_1!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38165 (= lt!65548 (lemmaContainsTupThenGetReturnValue!82 lt!65545 (_1!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38165 (= lt!65545 (insertStrictlySorted!85 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (_1!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38165 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65547)))

(declare-fun b!126799 () Bool)

(declare-fun res!61334 () Bool)

(assert (=> b!126799 (=> (not res!61334) (not e!82797))))

(assert (=> b!126799 (= res!61334 (= (getValueByKey!167 (toList!856 lt!65547) (_1!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126800 () Bool)

(assert (=> b!126800 (= e!82797 (contains!879 (toList!856 lt!65547) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38165 res!61333) b!126799))

(assert (= (and b!126799 res!61334) b!126800))

(declare-fun m!147927 () Bool)

(assert (=> d!38165 m!147927))

(declare-fun m!147929 () Bool)

(assert (=> d!38165 m!147929))

(declare-fun m!147931 () Bool)

(assert (=> d!38165 m!147931))

(declare-fun m!147933 () Bool)

(assert (=> d!38165 m!147933))

(declare-fun m!147935 () Bool)

(assert (=> b!126799 m!147935))

(declare-fun m!147937 () Bool)

(assert (=> b!126800 m!147937))

(assert (=> d!38061 d!38165))

(declare-fun d!38167 () Bool)

(assert (=> d!38167 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(assert (=> d!38167 true))

(declare-fun _$7!107 () Unit!3924)

(assert (=> d!38167 (= (choose!768 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65113 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) (defaultEntry!2783 newMap!16)) _$7!107)))

(declare-fun bs!5239 () Bool)

(assert (= bs!5239 d!38167))

(assert (=> bs!5239 m!146893))

(assert (=> bs!5239 m!146893))

(assert (=> bs!5239 m!147551))

(assert (=> bs!5239 m!146845))

(assert (=> bs!5239 m!147555))

(assert (=> d!38061 d!38167))

(declare-fun b!126801 () Bool)

(declare-fun c!23193 () Bool)

(assert (=> b!126801 (= c!23193 (and (not (= (bvand lt!65113 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65113 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82808 () ListLongMap!1681)

(declare-fun e!82804 () ListLongMap!1681)

(assert (=> b!126801 (= e!82808 e!82804)))

(declare-fun bm!13666 () Bool)

(declare-fun call!13671 () Bool)

(declare-fun lt!65549 () ListLongMap!1681)

(assert (=> bm!13666 (= call!13671 (contains!877 lt!65549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126802 () Bool)

(declare-fun e!82807 () ListLongMap!1681)

(assert (=> b!126802 (= e!82807 e!82808)))

(declare-fun c!23196 () Bool)

(assert (=> b!126802 (= c!23196 (and (not (= (bvand lt!65113 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65113 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126803 () Bool)

(declare-fun e!82798 () Unit!3924)

(declare-fun Unit!3950 () Unit!3924)

(assert (=> b!126803 (= e!82798 Unit!3950)))

(declare-fun b!126804 () Bool)

(declare-fun e!82806 () Bool)

(declare-fun e!82801 () Bool)

(assert (=> b!126804 (= e!82806 e!82801)))

(declare-fun res!61341 () Bool)

(assert (=> b!126804 (= res!61341 call!13671)))

(assert (=> b!126804 (=> (not res!61341) (not e!82801))))

(declare-fun b!126805 () Bool)

(declare-fun e!82810 () Bool)

(declare-fun e!82803 () Bool)

(assert (=> b!126805 (= e!82810 e!82803)))

(declare-fun res!61335 () Bool)

(assert (=> b!126805 (=> (not res!61335) (not e!82803))))

(assert (=> b!126805 (= res!61335 (contains!877 lt!65549 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126805 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126806 () Bool)

(assert (=> b!126806 (= e!82806 (not call!13671))))

(declare-fun d!38169 () Bool)

(declare-fun e!82800 () Bool)

(assert (=> d!38169 e!82800))

(declare-fun res!61337 () Bool)

(assert (=> d!38169 (=> (not res!61337) (not e!82800))))

(assert (=> d!38169 (= res!61337 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65558 () ListLongMap!1681)

(assert (=> d!38169 (= lt!65549 lt!65558)))

(declare-fun lt!65564 () Unit!3924)

(assert (=> d!38169 (= lt!65564 e!82798)))

(declare-fun c!23195 () Bool)

(declare-fun e!82799 () Bool)

(assert (=> d!38169 (= c!23195 e!82799)))

(declare-fun res!61339 () Bool)

(assert (=> d!38169 (=> (not res!61339) (not e!82799))))

(assert (=> d!38169 (= res!61339 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38169 (= lt!65558 e!82807)))

(declare-fun c!23192 () Bool)

(assert (=> d!38169 (= c!23192 (and (not (= (bvand lt!65113 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65113 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38169 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38169 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65549)))

(declare-fun b!126807 () Bool)

(declare-fun lt!65553 () Unit!3924)

(assert (=> b!126807 (= e!82798 lt!65553)))

(declare-fun lt!65561 () ListLongMap!1681)

(assert (=> b!126807 (= lt!65561 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65555 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65568 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65568 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65554 () Unit!3924)

(assert (=> b!126807 (= lt!65554 (addStillContains!87 lt!65561 lt!65555 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65568))))

(assert (=> b!126807 (contains!877 (+!170 lt!65561 (tuple2!2577 lt!65555 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65568)))

(declare-fun lt!65560 () Unit!3924)

(assert (=> b!126807 (= lt!65560 lt!65554)))

(declare-fun lt!65569 () ListLongMap!1681)

(assert (=> b!126807 (= lt!65569 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65566 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65566 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65570 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65570 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65556 () Unit!3924)

(assert (=> b!126807 (= lt!65556 (addApplyDifferent!87 lt!65569 lt!65566 (minValue!2646 newMap!16) lt!65570))))

(assert (=> b!126807 (= (apply!111 (+!170 lt!65569 (tuple2!2577 lt!65566 (minValue!2646 newMap!16))) lt!65570) (apply!111 lt!65569 lt!65570))))

(declare-fun lt!65552 () Unit!3924)

(assert (=> b!126807 (= lt!65552 lt!65556)))

(declare-fun lt!65562 () ListLongMap!1681)

(assert (=> b!126807 (= lt!65562 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65567 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65559 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65559 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65551 () Unit!3924)

(assert (=> b!126807 (= lt!65551 (addApplyDifferent!87 lt!65562 lt!65567 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65559))))

(assert (=> b!126807 (= (apply!111 (+!170 lt!65562 (tuple2!2577 lt!65567 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65559) (apply!111 lt!65562 lt!65559))))

(declare-fun lt!65565 () Unit!3924)

(assert (=> b!126807 (= lt!65565 lt!65551)))

(declare-fun lt!65557 () ListLongMap!1681)

(assert (=> b!126807 (= lt!65557 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65563 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65563 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65550 () (_ BitVec 64))

(assert (=> b!126807 (= lt!65550 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126807 (= lt!65553 (addApplyDifferent!87 lt!65557 lt!65563 (minValue!2646 newMap!16) lt!65550))))

(assert (=> b!126807 (= (apply!111 (+!170 lt!65557 (tuple2!2577 lt!65563 (minValue!2646 newMap!16))) lt!65550) (apply!111 lt!65557 lt!65550))))

(declare-fun b!126808 () Bool)

(declare-fun res!61342 () Bool)

(assert (=> b!126808 (=> (not res!61342) (not e!82800))))

(declare-fun e!82805 () Bool)

(assert (=> b!126808 (= res!61342 e!82805)))

(declare-fun c!23194 () Bool)

(assert (=> b!126808 (= c!23194 (not (= (bvand lt!65113 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126809 () Bool)

(declare-fun e!82809 () Bool)

(assert (=> b!126809 (= e!82809 (= (apply!111 lt!65549 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126810 () Bool)

(assert (=> b!126810 (= e!82805 e!82809)))

(declare-fun res!61340 () Bool)

(declare-fun call!13672 () Bool)

(assert (=> b!126810 (= res!61340 call!13672)))

(assert (=> b!126810 (=> (not res!61340) (not e!82809))))

(declare-fun b!126811 () Bool)

(assert (=> b!126811 (= e!82801 (= (apply!111 lt!65549 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13667 () Bool)

(declare-fun call!13669 () ListLongMap!1681)

(declare-fun call!13675 () ListLongMap!1681)

(assert (=> bm!13667 (= call!13669 call!13675)))

(declare-fun b!126812 () Bool)

(assert (=> b!126812 (= e!82805 (not call!13672))))

(declare-fun bm!13668 () Bool)

(declare-fun call!13674 () ListLongMap!1681)

(declare-fun call!13673 () ListLongMap!1681)

(assert (=> bm!13668 (= call!13674 (+!170 (ite c!23192 call!13675 (ite c!23196 call!13669 call!13673)) (ite (or c!23192 c!23196) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13669 () Bool)

(assert (=> bm!13669 (= call!13672 (contains!877 lt!65549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126813 () Bool)

(declare-fun call!13670 () ListLongMap!1681)

(assert (=> b!126813 (= e!82804 call!13670)))

(declare-fun b!126814 () Bool)

(assert (=> b!126814 (= e!82808 call!13670)))

(declare-fun b!126815 () Bool)

(assert (=> b!126815 (= e!82799 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13670 () Bool)

(assert (=> bm!13670 (= call!13670 call!13674)))

(declare-fun b!126816 () Bool)

(assert (=> b!126816 (= e!82800 e!82806)))

(declare-fun c!23197 () Bool)

(assert (=> b!126816 (= c!23197 (not (= (bvand lt!65113 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126817 () Bool)

(assert (=> b!126817 (= e!82803 (= (apply!111 lt!65549 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_values!2766 newMap!16))))))

(assert (=> b!126817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126818 () Bool)

(declare-fun res!61336 () Bool)

(assert (=> b!126818 (=> (not res!61336) (not e!82800))))

(assert (=> b!126818 (= res!61336 e!82810)))

(declare-fun res!61343 () Bool)

(assert (=> b!126818 (=> res!61343 e!82810)))

(declare-fun e!82802 () Bool)

(assert (=> b!126818 (= res!61343 (not e!82802))))

(declare-fun res!61338 () Bool)

(assert (=> b!126818 (=> (not res!61338) (not e!82802))))

(assert (=> b!126818 (= res!61338 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126819 () Bool)

(assert (=> b!126819 (= e!82802 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126820 () Bool)

(assert (=> b!126820 (= e!82807 (+!170 call!13674 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126821 () Bool)

(assert (=> b!126821 (= e!82804 call!13673)))

(declare-fun bm!13671 () Bool)

(assert (=> bm!13671 (= call!13675 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65113 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13672 () Bool)

(assert (=> bm!13672 (= call!13673 call!13669)))

(assert (= (and d!38169 c!23192) b!126820))

(assert (= (and d!38169 (not c!23192)) b!126802))

(assert (= (and b!126802 c!23196) b!126814))

(assert (= (and b!126802 (not c!23196)) b!126801))

(assert (= (and b!126801 c!23193) b!126813))

(assert (= (and b!126801 (not c!23193)) b!126821))

(assert (= (or b!126813 b!126821) bm!13672))

(assert (= (or b!126814 bm!13672) bm!13667))

(assert (= (or b!126814 b!126813) bm!13670))

(assert (= (or b!126820 bm!13667) bm!13671))

(assert (= (or b!126820 bm!13670) bm!13668))

(assert (= (and d!38169 res!61339) b!126815))

(assert (= (and d!38169 c!23195) b!126807))

(assert (= (and d!38169 (not c!23195)) b!126803))

(assert (= (and d!38169 res!61337) b!126818))

(assert (= (and b!126818 res!61338) b!126819))

(assert (= (and b!126818 (not res!61343)) b!126805))

(assert (= (and b!126805 res!61335) b!126817))

(assert (= (and b!126818 res!61336) b!126808))

(assert (= (and b!126808 c!23194) b!126810))

(assert (= (and b!126808 (not c!23194)) b!126812))

(assert (= (and b!126810 res!61340) b!126809))

(assert (= (or b!126810 b!126812) bm!13669))

(assert (= (and b!126808 res!61342) b!126816))

(assert (= (and b!126816 c!23197) b!126804))

(assert (= (and b!126816 (not c!23197)) b!126806))

(assert (= (and b!126804 res!61341) b!126811))

(assert (= (or b!126804 b!126806) bm!13666))

(declare-fun b_lambda!5587 () Bool)

(assert (=> (not b_lambda!5587) (not b!126817)))

(assert (=> b!126817 t!6053))

(declare-fun b_and!7807 () Bool)

(assert (= b_and!7803 (and (=> t!6053 result!3847) b_and!7807)))

(assert (=> b!126817 t!6055))

(declare-fun b_and!7809 () Bool)

(assert (= b_and!7805 (and (=> t!6055 result!3849) b_and!7809)))

(assert (=> b!126805 m!147041))

(assert (=> b!126805 m!147041))

(declare-fun m!147939 () Bool)

(assert (=> b!126805 m!147939))

(assert (=> d!38169 m!147051))

(declare-fun m!147941 () Bool)

(assert (=> b!126807 m!147941))

(declare-fun m!147943 () Bool)

(assert (=> b!126807 m!147943))

(assert (=> b!126807 m!147943))

(declare-fun m!147945 () Bool)

(assert (=> b!126807 m!147945))

(declare-fun m!147947 () Bool)

(assert (=> b!126807 m!147947))

(declare-fun m!147949 () Bool)

(assert (=> b!126807 m!147949))

(declare-fun m!147951 () Bool)

(assert (=> b!126807 m!147951))

(declare-fun m!147953 () Bool)

(assert (=> b!126807 m!147953))

(declare-fun m!147955 () Bool)

(assert (=> b!126807 m!147955))

(assert (=> b!126807 m!147947))

(declare-fun m!147957 () Bool)

(assert (=> b!126807 m!147957))

(assert (=> b!126807 m!146845))

(declare-fun m!147959 () Bool)

(assert (=> b!126807 m!147959))

(declare-fun m!147961 () Bool)

(assert (=> b!126807 m!147961))

(declare-fun m!147963 () Bool)

(assert (=> b!126807 m!147963))

(assert (=> b!126807 m!146845))

(declare-fun m!147965 () Bool)

(assert (=> b!126807 m!147965))

(assert (=> b!126807 m!147041))

(assert (=> b!126807 m!147949))

(declare-fun m!147967 () Bool)

(assert (=> b!126807 m!147967))

(assert (=> b!126807 m!146845))

(declare-fun m!147969 () Bool)

(assert (=> b!126807 m!147969))

(declare-fun m!147971 () Bool)

(assert (=> b!126807 m!147971))

(assert (=> b!126807 m!147961))

(declare-fun m!147973 () Bool)

(assert (=> bm!13666 m!147973))

(assert (=> b!126819 m!147041))

(assert (=> b!126819 m!147041))

(assert (=> b!126819 m!147043))

(declare-fun m!147975 () Bool)

(assert (=> b!126811 m!147975))

(assert (=> b!126815 m!147041))

(assert (=> b!126815 m!147041))

(assert (=> b!126815 m!147043))

(declare-fun m!147977 () Bool)

(assert (=> bm!13668 m!147977))

(declare-fun m!147979 () Bool)

(assert (=> b!126820 m!147979))

(assert (=> bm!13671 m!146845))

(assert (=> bm!13671 m!147969))

(assert (=> b!126817 m!147041))

(assert (=> b!126817 m!147145))

(assert (=> b!126817 m!147295))

(assert (=> b!126817 m!147145))

(assert (=> b!126817 m!147297))

(assert (=> b!126817 m!147295))

(assert (=> b!126817 m!147041))

(declare-fun m!147981 () Bool)

(assert (=> b!126817 m!147981))

(declare-fun m!147983 () Bool)

(assert (=> b!126809 m!147983))

(declare-fun m!147985 () Bool)

(assert (=> bm!13669 m!147985))

(assert (=> d!38061 d!38169))

(assert (=> d!38061 d!37997))

(declare-fun d!38171 () Bool)

(assert (=> d!38171 (= (validMask!0 (mask!7039 newMap!16)) (and (or (= (mask!7039 newMap!16) #b00000000000000000000000000000111) (= (mask!7039 newMap!16) #b00000000000000000000000000001111) (= (mask!7039 newMap!16) #b00000000000000000000000000011111) (= (mask!7039 newMap!16) #b00000000000000000000000000111111) (= (mask!7039 newMap!16) #b00000000000000000000000001111111) (= (mask!7039 newMap!16) #b00000000000000000000000011111111) (= (mask!7039 newMap!16) #b00000000000000000000000111111111) (= (mask!7039 newMap!16) #b00000000000000000000001111111111) (= (mask!7039 newMap!16) #b00000000000000000000011111111111) (= (mask!7039 newMap!16) #b00000000000000000000111111111111) (= (mask!7039 newMap!16) #b00000000000000000001111111111111) (= (mask!7039 newMap!16) #b00000000000000000011111111111111) (= (mask!7039 newMap!16) #b00000000000000000111111111111111) (= (mask!7039 newMap!16) #b00000000000000001111111111111111) (= (mask!7039 newMap!16) #b00000000000000011111111111111111) (= (mask!7039 newMap!16) #b00000000000000111111111111111111) (= (mask!7039 newMap!16) #b00000000000001111111111111111111) (= (mask!7039 newMap!16) #b00000000000011111111111111111111) (= (mask!7039 newMap!16) #b00000000000111111111111111111111) (= (mask!7039 newMap!16) #b00000000001111111111111111111111) (= (mask!7039 newMap!16) #b00000000011111111111111111111111) (= (mask!7039 newMap!16) #b00000000111111111111111111111111) (= (mask!7039 newMap!16) #b00000001111111111111111111111111) (= (mask!7039 newMap!16) #b00000011111111111111111111111111) (= (mask!7039 newMap!16) #b00000111111111111111111111111111) (= (mask!7039 newMap!16) #b00001111111111111111111111111111) (= (mask!7039 newMap!16) #b00011111111111111111111111111111) (= (mask!7039 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7039 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38061 d!38171))

(assert (=> b!126515 d!38073))

(declare-fun d!38173 () Bool)

(declare-fun e!82812 () Bool)

(assert (=> d!38173 e!82812))

(declare-fun res!61344 () Bool)

(assert (=> d!38173 (=> res!61344 e!82812)))

(declare-fun lt!65572 () Bool)

(assert (=> d!38173 (= res!61344 (not lt!65572))))

(declare-fun lt!65571 () Bool)

(assert (=> d!38173 (= lt!65572 lt!65571)))

(declare-fun lt!65574 () Unit!3924)

(declare-fun e!82811 () Unit!3924)

(assert (=> d!38173 (= lt!65574 e!82811)))

(declare-fun c!23198 () Bool)

(assert (=> d!38173 (= c!23198 lt!65571)))

(assert (=> d!38173 (= lt!65571 (containsKey!171 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38173 (= (contains!877 lt!65146 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65572)))

(declare-fun b!126822 () Bool)

(declare-fun lt!65573 () Unit!3924)

(assert (=> b!126822 (= e!82811 lt!65573)))

(assert (=> b!126822 (= lt!65573 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!126822 (isDefined!120 (getValueByKey!167 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126823 () Bool)

(declare-fun Unit!3951 () Unit!3924)

(assert (=> b!126823 (= e!82811 Unit!3951)))

(declare-fun b!126824 () Bool)

(assert (=> b!126824 (= e!82812 (isDefined!120 (getValueByKey!167 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38173 c!23198) b!126822))

(assert (= (and d!38173 (not c!23198)) b!126823))

(assert (= (and d!38173 (not res!61344)) b!126824))

(declare-fun m!147987 () Bool)

(assert (=> d!38173 m!147987))

(declare-fun m!147989 () Bool)

(assert (=> b!126822 m!147989))

(assert (=> b!126822 m!147073))

(assert (=> b!126822 m!147073))

(declare-fun m!147991 () Bool)

(assert (=> b!126822 m!147991))

(assert (=> b!126824 m!147073))

(assert (=> b!126824 m!147073))

(assert (=> b!126824 m!147991))

(assert (=> d!37965 d!38173))

(declare-fun d!38175 () Bool)

(declare-fun c!23199 () Bool)

(assert (=> d!38175 (= c!23199 (and ((_ is Cons!1694) lt!65144) (= (_1!1299 (h!2296 lt!65144)) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!82813 () Option!173)

(assert (=> d!38175 (= (getValueByKey!167 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!82813)))

(declare-fun b!126826 () Bool)

(declare-fun e!82814 () Option!173)

(assert (=> b!126826 (= e!82813 e!82814)))

(declare-fun c!23200 () Bool)

(assert (=> b!126826 (= c!23200 (and ((_ is Cons!1694) lt!65144) (not (= (_1!1299 (h!2296 lt!65144)) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!126828 () Bool)

(assert (=> b!126828 (= e!82814 None!171)))

(declare-fun b!126827 () Bool)

(assert (=> b!126827 (= e!82814 (getValueByKey!167 (t!6045 lt!65144) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126825 () Bool)

(assert (=> b!126825 (= e!82813 (Some!172 (_2!1299 (h!2296 lt!65144))))))

(assert (= (and d!38175 c!23199) b!126825))

(assert (= (and d!38175 (not c!23199)) b!126826))

(assert (= (and b!126826 c!23200) b!126827))

(assert (= (and b!126826 (not c!23200)) b!126828))

(declare-fun m!147993 () Bool)

(assert (=> b!126827 m!147993))

(assert (=> d!37965 d!38175))

(declare-fun d!38177 () Bool)

(assert (=> d!38177 (= (getValueByKey!167 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!172 (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!65575 () Unit!3924)

(assert (=> d!38177 (= lt!65575 (choose!770 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82815 () Bool)

(assert (=> d!38177 e!82815))

(declare-fun res!61345 () Bool)

(assert (=> d!38177 (=> (not res!61345) (not e!82815))))

(assert (=> d!38177 (= res!61345 (isStrictlySorted!317 lt!65144))))

(assert (=> d!38177 (= (lemmaContainsTupThenGetReturnValue!82 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65575)))

(declare-fun b!126829 () Bool)

(declare-fun res!61346 () Bool)

(assert (=> b!126829 (=> (not res!61346) (not e!82815))))

(assert (=> b!126829 (= res!61346 (containsKey!171 lt!65144 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126830 () Bool)

(assert (=> b!126830 (= e!82815 (contains!879 lt!65144 (tuple2!2577 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38177 res!61345) b!126829))

(assert (= (and b!126829 res!61346) b!126830))

(assert (=> d!38177 m!147067))

(declare-fun m!147995 () Bool)

(assert (=> d!38177 m!147995))

(declare-fun m!147997 () Bool)

(assert (=> d!38177 m!147997))

(declare-fun m!147999 () Bool)

(assert (=> b!126829 m!147999))

(declare-fun m!148001 () Bool)

(assert (=> b!126830 m!148001))

(assert (=> d!37965 d!38177))

(declare-fun c!23204 () Bool)

(declare-fun e!82816 () List!1698)

(declare-fun b!126831 () Bool)

(declare-fun c!23202 () Bool)

(assert (=> b!126831 (= e!82816 (ite c!23202 (t!6045 (toList!856 e!82423)) (ite c!23204 (Cons!1694 (h!2296 (toList!856 e!82423)) (t!6045 (toList!856 e!82423))) Nil!1695)))))

(declare-fun call!13677 () List!1698)

(declare-fun c!23203 () Bool)

(declare-fun bm!13673 () Bool)

(assert (=> bm!13673 (= call!13677 ($colon$colon!89 e!82816 (ite c!23203 (h!2296 (toList!856 e!82423)) (tuple2!2577 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23201 () Bool)

(assert (=> bm!13673 (= c!23201 c!23203)))

(declare-fun b!126832 () Bool)

(assert (=> b!126832 (= e!82816 (insertStrictlySorted!85 (t!6045 (toList!856 e!82423)) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126833 () Bool)

(declare-fun e!82817 () Bool)

(declare-fun lt!65576 () List!1698)

(assert (=> b!126833 (= e!82817 (contains!879 lt!65576 (tuple2!2577 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126834 () Bool)

(declare-fun e!82820 () List!1698)

(declare-fun call!13676 () List!1698)

(assert (=> b!126834 (= e!82820 call!13676)))

(declare-fun b!126835 () Bool)

(declare-fun e!82819 () List!1698)

(declare-fun call!13678 () List!1698)

(assert (=> b!126835 (= e!82819 call!13678)))

(declare-fun b!126836 () Bool)

(assert (=> b!126836 (= e!82819 call!13678)))

(declare-fun b!126837 () Bool)

(declare-fun e!82818 () List!1698)

(assert (=> b!126837 (= e!82818 call!13677)))

(declare-fun d!38179 () Bool)

(assert (=> d!38179 e!82817))

(declare-fun res!61347 () Bool)

(assert (=> d!38179 (=> (not res!61347) (not e!82817))))

(assert (=> d!38179 (= res!61347 (isStrictlySorted!317 lt!65576))))

(assert (=> d!38179 (= lt!65576 e!82818)))

(assert (=> d!38179 (= c!23203 (and ((_ is Cons!1694) (toList!856 e!82423)) (bvslt (_1!1299 (h!2296 (toList!856 e!82423))) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!38179 (isStrictlySorted!317 (toList!856 e!82423))))

(assert (=> d!38179 (= (insertStrictlySorted!85 (toList!856 e!82423) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!65576)))

(declare-fun bm!13674 () Bool)

(assert (=> bm!13674 (= call!13676 call!13677)))

(declare-fun bm!13675 () Bool)

(assert (=> bm!13675 (= call!13678 call!13676)))

(declare-fun b!126838 () Bool)

(declare-fun res!61348 () Bool)

(assert (=> b!126838 (=> (not res!61348) (not e!82817))))

(assert (=> b!126838 (= res!61348 (containsKey!171 lt!65576 (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126839 () Bool)

(assert (=> b!126839 (= c!23204 (and ((_ is Cons!1694) (toList!856 e!82423)) (bvsgt (_1!1299 (h!2296 (toList!856 e!82423))) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!126839 (= e!82820 e!82819)))

(declare-fun b!126840 () Bool)

(assert (=> b!126840 (= e!82818 e!82820)))

(assert (=> b!126840 (= c!23202 (and ((_ is Cons!1694) (toList!856 e!82423)) (= (_1!1299 (h!2296 (toList!856 e!82423))) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!38179 c!23203) b!126837))

(assert (= (and d!38179 (not c!23203)) b!126840))

(assert (= (and b!126840 c!23202) b!126834))

(assert (= (and b!126840 (not c!23202)) b!126839))

(assert (= (and b!126839 c!23204) b!126836))

(assert (= (and b!126839 (not c!23204)) b!126835))

(assert (= (or b!126836 b!126835) bm!13675))

(assert (= (or b!126834 bm!13675) bm!13674))

(assert (= (or b!126837 bm!13674) bm!13673))

(assert (= (and bm!13673 c!23201) b!126832))

(assert (= (and bm!13673 (not c!23201)) b!126831))

(assert (= (and d!38179 res!61347) b!126838))

(assert (= (and b!126838 res!61348) b!126833))

(declare-fun m!148003 () Bool)

(assert (=> b!126832 m!148003))

(declare-fun m!148005 () Bool)

(assert (=> b!126833 m!148005))

(declare-fun m!148007 () Bool)

(assert (=> d!38179 m!148007))

(declare-fun m!148009 () Bool)

(assert (=> d!38179 m!148009))

(declare-fun m!148011 () Bool)

(assert (=> b!126838 m!148011))

(declare-fun m!148013 () Bool)

(assert (=> bm!13673 m!148013))

(assert (=> d!37965 d!38179))

(declare-fun d!38181 () Bool)

(declare-fun res!61349 () Bool)

(declare-fun e!82821 () Bool)

(assert (=> d!38181 (=> res!61349 e!82821)))

(assert (=> d!38181 (= res!61349 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38181 (= (containsKey!171 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000) e!82821)))

(declare-fun b!126841 () Bool)

(declare-fun e!82822 () Bool)

(assert (=> b!126841 (= e!82821 e!82822)))

(declare-fun res!61350 () Bool)

(assert (=> b!126841 (=> (not res!61350) (not e!82822))))

(assert (=> b!126841 (= res!61350 (and (or (not ((_ is Cons!1694) (toList!856 lt!65008))) (bvsle (_1!1299 (h!2296 (toList!856 lt!65008))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1694) (toList!856 lt!65008)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65008))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126842 () Bool)

(assert (=> b!126842 (= e!82822 (containsKey!171 (t!6045 (toList!856 lt!65008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38181 (not res!61349)) b!126841))

(assert (= (and b!126841 res!61350) b!126842))

(declare-fun m!148015 () Bool)

(assert (=> b!126842 m!148015))

(assert (=> d!37963 d!38181))

(declare-fun d!38183 () Bool)

(assert (=> d!38183 (= (apply!111 (+!170 lt!65312 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) lt!65309) (apply!111 lt!65312 lt!65309))))

(declare-fun lt!65577 () Unit!3924)

(assert (=> d!38183 (= lt!65577 (choose!764 lt!65312 lt!65317 (zeroValue!2646 newMap!16) lt!65309))))

(declare-fun e!82823 () Bool)

(assert (=> d!38183 e!82823))

(declare-fun res!61351 () Bool)

(assert (=> d!38183 (=> (not res!61351) (not e!82823))))

(assert (=> d!38183 (= res!61351 (contains!877 lt!65312 lt!65309))))

(assert (=> d!38183 (= (addApplyDifferent!87 lt!65312 lt!65317 (zeroValue!2646 newMap!16) lt!65309) lt!65577)))

(declare-fun b!126843 () Bool)

(assert (=> b!126843 (= e!82823 (not (= lt!65309 lt!65317)))))

(assert (= (and d!38183 res!61351) b!126843))

(assert (=> d!38183 m!147263))

(assert (=> d!38183 m!147265))

(declare-fun m!148017 () Bool)

(assert (=> d!38183 m!148017))

(assert (=> d!38183 m!147255))

(declare-fun m!148019 () Bool)

(assert (=> d!38183 m!148019))

(assert (=> d!38183 m!147263))

(assert (=> b!126415 d!38183))

(declare-fun d!38185 () Bool)

(declare-fun e!82824 () Bool)

(assert (=> d!38185 e!82824))

(declare-fun res!61352 () Bool)

(assert (=> d!38185 (=> (not res!61352) (not e!82824))))

(declare-fun lt!65580 () ListLongMap!1681)

(assert (=> d!38185 (= res!61352 (contains!877 lt!65580 (_1!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))))))

(declare-fun lt!65578 () List!1698)

(assert (=> d!38185 (= lt!65580 (ListLongMap!1682 lt!65578))))

(declare-fun lt!65579 () Unit!3924)

(declare-fun lt!65581 () Unit!3924)

(assert (=> d!38185 (= lt!65579 lt!65581)))

(assert (=> d!38185 (= (getValueByKey!167 lt!65578 (_1!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))))))

(assert (=> d!38185 (= lt!65581 (lemmaContainsTupThenGetReturnValue!82 lt!65578 (_1!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))))))

(assert (=> d!38185 (= lt!65578 (insertStrictlySorted!85 (toList!856 lt!65307) (_1!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))))))

(assert (=> d!38185 (= (+!170 lt!65307 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) lt!65580)))

(declare-fun b!126844 () Bool)

(declare-fun res!61353 () Bool)

(assert (=> b!126844 (=> (not res!61353) (not e!82824))))

(assert (=> b!126844 (= res!61353 (= (getValueByKey!167 (toList!856 lt!65580) (_1!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))))))))

(declare-fun b!126845 () Bool)

(assert (=> b!126845 (= e!82824 (contains!879 (toList!856 lt!65580) (tuple2!2577 lt!65313 (minValue!2646 newMap!16))))))

(assert (= (and d!38185 res!61352) b!126844))

(assert (= (and b!126844 res!61353) b!126845))

(declare-fun m!148021 () Bool)

(assert (=> d!38185 m!148021))

(declare-fun m!148023 () Bool)

(assert (=> d!38185 m!148023))

(declare-fun m!148025 () Bool)

(assert (=> d!38185 m!148025))

(declare-fun m!148027 () Bool)

(assert (=> d!38185 m!148027))

(declare-fun m!148029 () Bool)

(assert (=> b!126844 m!148029))

(declare-fun m!148031 () Bool)

(assert (=> b!126845 m!148031))

(assert (=> b!126415 d!38185))

(declare-fun d!38187 () Bool)

(assert (=> d!38187 (= (apply!111 lt!65307 lt!65300) (get!1447 (getValueByKey!167 (toList!856 lt!65307) lt!65300)))))

(declare-fun bs!5240 () Bool)

(assert (= bs!5240 d!38187))

(declare-fun m!148033 () Bool)

(assert (=> bs!5240 m!148033))

(assert (=> bs!5240 m!148033))

(declare-fun m!148035 () Bool)

(assert (=> bs!5240 m!148035))

(assert (=> b!126415 d!38187))

(declare-fun d!38189 () Bool)

(declare-fun e!82825 () Bool)

(assert (=> d!38189 e!82825))

(declare-fun res!61354 () Bool)

(assert (=> d!38189 (=> (not res!61354) (not e!82825))))

(declare-fun lt!65584 () ListLongMap!1681)

(assert (=> d!38189 (= res!61354 (contains!877 lt!65584 (_1!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))))))

(declare-fun lt!65582 () List!1698)

(assert (=> d!38189 (= lt!65584 (ListLongMap!1682 lt!65582))))

(declare-fun lt!65583 () Unit!3924)

(declare-fun lt!65585 () Unit!3924)

(assert (=> d!38189 (= lt!65583 lt!65585)))

(assert (=> d!38189 (= (getValueByKey!167 lt!65582 (_1!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38189 (= lt!65585 (lemmaContainsTupThenGetReturnValue!82 lt!65582 (_1!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38189 (= lt!65582 (insertStrictlySorted!85 (toList!856 lt!65312) (_1!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38189 (= (+!170 lt!65312 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) lt!65584)))

(declare-fun b!126846 () Bool)

(declare-fun res!61355 () Bool)

(assert (=> b!126846 (=> (not res!61355) (not e!82825))))

(assert (=> b!126846 (= res!61355 (= (getValueByKey!167 (toList!856 lt!65584) (_1!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))))))))

(declare-fun b!126847 () Bool)

(assert (=> b!126847 (= e!82825 (contains!879 (toList!856 lt!65584) (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))))))

(assert (= (and d!38189 res!61354) b!126846))

(assert (= (and b!126846 res!61355) b!126847))

(declare-fun m!148037 () Bool)

(assert (=> d!38189 m!148037))

(declare-fun m!148039 () Bool)

(assert (=> d!38189 m!148039))

(declare-fun m!148041 () Bool)

(assert (=> d!38189 m!148041))

(declare-fun m!148043 () Bool)

(assert (=> d!38189 m!148043))

(declare-fun m!148045 () Bool)

(assert (=> b!126846 m!148045))

(declare-fun m!148047 () Bool)

(assert (=> b!126847 m!148047))

(assert (=> b!126415 d!38189))

(declare-fun d!38191 () Bool)

(declare-fun e!82827 () Bool)

(assert (=> d!38191 e!82827))

(declare-fun res!61356 () Bool)

(assert (=> d!38191 (=> res!61356 e!82827)))

(declare-fun lt!65587 () Bool)

(assert (=> d!38191 (= res!61356 (not lt!65587))))

(declare-fun lt!65586 () Bool)

(assert (=> d!38191 (= lt!65587 lt!65586)))

(declare-fun lt!65589 () Unit!3924)

(declare-fun e!82826 () Unit!3924)

(assert (=> d!38191 (= lt!65589 e!82826)))

(declare-fun c!23205 () Bool)

(assert (=> d!38191 (= c!23205 lt!65586)))

(assert (=> d!38191 (= lt!65586 (containsKey!171 (toList!856 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) lt!65318))))

(assert (=> d!38191 (= (contains!877 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) lt!65318) lt!65587)))

(declare-fun b!126848 () Bool)

(declare-fun lt!65588 () Unit!3924)

(assert (=> b!126848 (= e!82826 lt!65588)))

(assert (=> b!126848 (= lt!65588 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) lt!65318))))

(assert (=> b!126848 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) lt!65318))))

(declare-fun b!126849 () Bool)

(declare-fun Unit!3952 () Unit!3924)

(assert (=> b!126849 (= e!82826 Unit!3952)))

(declare-fun b!126850 () Bool)

(assert (=> b!126850 (= e!82827 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) lt!65318)))))

(assert (= (and d!38191 c!23205) b!126848))

(assert (= (and d!38191 (not c!23205)) b!126849))

(assert (= (and d!38191 (not res!61356)) b!126850))

(declare-fun m!148049 () Bool)

(assert (=> d!38191 m!148049))

(declare-fun m!148051 () Bool)

(assert (=> b!126848 m!148051))

(declare-fun m!148053 () Bool)

(assert (=> b!126848 m!148053))

(assert (=> b!126848 m!148053))

(declare-fun m!148055 () Bool)

(assert (=> b!126848 m!148055))

(assert (=> b!126850 m!148053))

(assert (=> b!126850 m!148053))

(assert (=> b!126850 m!148055))

(assert (=> b!126415 d!38191))

(declare-fun d!38193 () Bool)

(assert (=> d!38193 (= (apply!111 (+!170 lt!65307 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) lt!65300) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65307 (tuple2!2577 lt!65313 (minValue!2646 newMap!16)))) lt!65300)))))

(declare-fun bs!5241 () Bool)

(assert (= bs!5241 d!38193))

(declare-fun m!148057 () Bool)

(assert (=> bs!5241 m!148057))

(assert (=> bs!5241 m!148057))

(declare-fun m!148059 () Bool)

(assert (=> bs!5241 m!148059))

(assert (=> b!126415 d!38193))

(declare-fun d!38195 () Bool)

(assert (=> d!38195 (= (apply!111 (+!170 lt!65307 (tuple2!2577 lt!65313 (minValue!2646 newMap!16))) lt!65300) (apply!111 lt!65307 lt!65300))))

(declare-fun lt!65590 () Unit!3924)

(assert (=> d!38195 (= lt!65590 (choose!764 lt!65307 lt!65313 (minValue!2646 newMap!16) lt!65300))))

(declare-fun e!82828 () Bool)

(assert (=> d!38195 e!82828))

(declare-fun res!61357 () Bool)

(assert (=> d!38195 (=> (not res!61357) (not e!82828))))

(assert (=> d!38195 (= res!61357 (contains!877 lt!65307 lt!65300))))

(assert (=> d!38195 (= (addApplyDifferent!87 lt!65307 lt!65313 (minValue!2646 newMap!16) lt!65300) lt!65590)))

(declare-fun b!126851 () Bool)

(assert (=> b!126851 (= e!82828 (not (= lt!65300 lt!65313)))))

(assert (= (and d!38195 res!61357) b!126851))

(assert (=> d!38195 m!147275))

(assert (=> d!38195 m!147277))

(declare-fun m!148061 () Bool)

(assert (=> d!38195 m!148061))

(assert (=> d!38195 m!147267))

(declare-fun m!148063 () Bool)

(assert (=> d!38195 m!148063))

(assert (=> d!38195 m!147275))

(assert (=> b!126415 d!38195))

(declare-fun d!38197 () Bool)

(assert (=> d!38197 (contains!877 (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) lt!65318)))

(declare-fun lt!65591 () Unit!3924)

(assert (=> d!38197 (= lt!65591 (choose!765 lt!65311 lt!65305 (zeroValue!2646 newMap!16) lt!65318))))

(assert (=> d!38197 (contains!877 lt!65311 lt!65318)))

(assert (=> d!38197 (= (addStillContains!87 lt!65311 lt!65305 (zeroValue!2646 newMap!16) lt!65318) lt!65591)))

(declare-fun bs!5242 () Bool)

(assert (= bs!5242 d!38197))

(assert (=> bs!5242 m!147261))

(assert (=> bs!5242 m!147261))

(assert (=> bs!5242 m!147271))

(declare-fun m!148065 () Bool)

(assert (=> bs!5242 m!148065))

(declare-fun m!148067 () Bool)

(assert (=> bs!5242 m!148067))

(assert (=> b!126415 d!38197))

(declare-fun d!38199 () Bool)

(assert (=> d!38199 (= (apply!111 lt!65312 lt!65309) (get!1447 (getValueByKey!167 (toList!856 lt!65312) lt!65309)))))

(declare-fun bs!5243 () Bool)

(assert (= bs!5243 d!38199))

(declare-fun m!148069 () Bool)

(assert (=> bs!5243 m!148069))

(assert (=> bs!5243 m!148069))

(declare-fun m!148071 () Bool)

(assert (=> bs!5243 m!148071))

(assert (=> b!126415 d!38199))

(declare-fun d!38201 () Bool)

(assert (=> d!38201 (= (apply!111 (+!170 lt!65319 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) lt!65320) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65319 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))) lt!65320)))))

(declare-fun bs!5244 () Bool)

(assert (= bs!5244 d!38201))

(declare-fun m!148073 () Bool)

(assert (=> bs!5244 m!148073))

(assert (=> bs!5244 m!148073))

(declare-fun m!148075 () Bool)

(assert (=> bs!5244 m!148075))

(assert (=> b!126415 d!38201))

(declare-fun d!38203 () Bool)

(assert (=> d!38203 (= (apply!111 (+!170 lt!65312 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16))) lt!65309) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65312 (tuple2!2577 lt!65317 (zeroValue!2646 newMap!16)))) lt!65309)))))

(declare-fun bs!5245 () Bool)

(assert (= bs!5245 d!38203))

(declare-fun m!148077 () Bool)

(assert (=> bs!5245 m!148077))

(assert (=> bs!5245 m!148077))

(declare-fun m!148079 () Bool)

(assert (=> bs!5245 m!148079))

(assert (=> b!126415 d!38203))

(declare-fun d!38205 () Bool)

(declare-fun e!82829 () Bool)

(assert (=> d!38205 e!82829))

(declare-fun res!61358 () Bool)

(assert (=> d!38205 (=> (not res!61358) (not e!82829))))

(declare-fun lt!65594 () ListLongMap!1681)

(assert (=> d!38205 (= res!61358 (contains!877 lt!65594 (_1!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))))))

(declare-fun lt!65592 () List!1698)

(assert (=> d!38205 (= lt!65594 (ListLongMap!1682 lt!65592))))

(declare-fun lt!65593 () Unit!3924)

(declare-fun lt!65595 () Unit!3924)

(assert (=> d!38205 (= lt!65593 lt!65595)))

(assert (=> d!38205 (= (getValueByKey!167 lt!65592 (_1!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))))))

(assert (=> d!38205 (= lt!65595 (lemmaContainsTupThenGetReturnValue!82 lt!65592 (_1!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))))))

(assert (=> d!38205 (= lt!65592 (insertStrictlySorted!85 (toList!856 lt!65319) (_1!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))))))

(assert (=> d!38205 (= (+!170 lt!65319 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) lt!65594)))

(declare-fun b!126852 () Bool)

(declare-fun res!61359 () Bool)

(assert (=> b!126852 (=> (not res!61359) (not e!82829))))

(assert (=> b!126852 (= res!61359 (= (getValueByKey!167 (toList!856 lt!65594) (_1!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))))))))

(declare-fun b!126853 () Bool)

(assert (=> b!126853 (= e!82829 (contains!879 (toList!856 lt!65594) (tuple2!2577 lt!65316 (minValue!2646 newMap!16))))))

(assert (= (and d!38205 res!61358) b!126852))

(assert (= (and b!126852 res!61359) b!126853))

(declare-fun m!148081 () Bool)

(assert (=> d!38205 m!148081))

(declare-fun m!148083 () Bool)

(assert (=> d!38205 m!148083))

(declare-fun m!148085 () Bool)

(assert (=> d!38205 m!148085))

(declare-fun m!148087 () Bool)

(assert (=> d!38205 m!148087))

(declare-fun m!148089 () Bool)

(assert (=> b!126852 m!148089))

(declare-fun m!148091 () Bool)

(assert (=> b!126853 m!148091))

(assert (=> b!126415 d!38205))

(declare-fun d!38207 () Bool)

(assert (=> d!38207 (= (apply!111 (+!170 lt!65319 (tuple2!2577 lt!65316 (minValue!2646 newMap!16))) lt!65320) (apply!111 lt!65319 lt!65320))))

(declare-fun lt!65596 () Unit!3924)

(assert (=> d!38207 (= lt!65596 (choose!764 lt!65319 lt!65316 (minValue!2646 newMap!16) lt!65320))))

(declare-fun e!82830 () Bool)

(assert (=> d!38207 e!82830))

(declare-fun res!61360 () Bool)

(assert (=> d!38207 (=> (not res!61360) (not e!82830))))

(assert (=> d!38207 (= res!61360 (contains!877 lt!65319 lt!65320))))

(assert (=> d!38207 (= (addApplyDifferent!87 lt!65319 lt!65316 (minValue!2646 newMap!16) lt!65320) lt!65596)))

(declare-fun b!126854 () Bool)

(assert (=> b!126854 (= e!82830 (not (= lt!65320 lt!65316)))))

(assert (= (and d!38207 res!61360) b!126854))

(assert (=> d!38207 m!147257))

(assert (=> d!38207 m!147259))

(declare-fun m!148093 () Bool)

(assert (=> d!38207 m!148093))

(assert (=> d!38207 m!147281))

(declare-fun m!148095 () Bool)

(assert (=> d!38207 m!148095))

(assert (=> d!38207 m!147257))

(assert (=> b!126415 d!38207))

(declare-fun d!38209 () Bool)

(declare-fun e!82831 () Bool)

(assert (=> d!38209 e!82831))

(declare-fun res!61361 () Bool)

(assert (=> d!38209 (=> (not res!61361) (not e!82831))))

(declare-fun lt!65599 () ListLongMap!1681)

(assert (=> d!38209 (= res!61361 (contains!877 lt!65599 (_1!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))))))

(declare-fun lt!65597 () List!1698)

(assert (=> d!38209 (= lt!65599 (ListLongMap!1682 lt!65597))))

(declare-fun lt!65598 () Unit!3924)

(declare-fun lt!65600 () Unit!3924)

(assert (=> d!38209 (= lt!65598 lt!65600)))

(assert (=> d!38209 (= (getValueByKey!167 lt!65597 (_1!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38209 (= lt!65600 (lemmaContainsTupThenGetReturnValue!82 lt!65597 (_1!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38209 (= lt!65597 (insertStrictlySorted!85 (toList!856 lt!65311) (_1!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38209 (= (+!170 lt!65311 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))) lt!65599)))

(declare-fun b!126855 () Bool)

(declare-fun res!61362 () Bool)

(assert (=> b!126855 (=> (not res!61362) (not e!82831))))

(assert (=> b!126855 (= res!61362 (= (getValueByKey!167 (toList!856 lt!65599) (_1!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))))))))

(declare-fun b!126856 () Bool)

(assert (=> b!126856 (= e!82831 (contains!879 (toList!856 lt!65599) (tuple2!2577 lt!65305 (zeroValue!2646 newMap!16))))))

(assert (= (and d!38209 res!61361) b!126855))

(assert (= (and b!126855 res!61362) b!126856))

(declare-fun m!148097 () Bool)

(assert (=> d!38209 m!148097))

(declare-fun m!148099 () Bool)

(assert (=> d!38209 m!148099))

(declare-fun m!148101 () Bool)

(assert (=> d!38209 m!148101))

(declare-fun m!148103 () Bool)

(assert (=> d!38209 m!148103))

(declare-fun m!148105 () Bool)

(assert (=> b!126855 m!148105))

(declare-fun m!148107 () Bool)

(assert (=> b!126856 m!148107))

(assert (=> b!126415 d!38209))

(declare-fun d!38211 () Bool)

(assert (=> d!38211 (= (apply!111 lt!65319 lt!65320) (get!1447 (getValueByKey!167 (toList!856 lt!65319) lt!65320)))))

(declare-fun bs!5246 () Bool)

(assert (= bs!5246 d!38211))

(declare-fun m!148109 () Bool)

(assert (=> bs!5246 m!148109))

(assert (=> bs!5246 m!148109))

(declare-fun m!148111 () Bool)

(assert (=> bs!5246 m!148111))

(assert (=> b!126415 d!38211))

(declare-fun b!126857 () Bool)

(declare-fun e!82835 () Bool)

(declare-fun e!82833 () Bool)

(assert (=> b!126857 (= e!82835 e!82833)))

(declare-fun c!23208 () Bool)

(declare-fun e!82838 () Bool)

(assert (=> b!126857 (= c!23208 e!82838)))

(declare-fun res!61365 () Bool)

(assert (=> b!126857 (=> (not res!61365) (not e!82838))))

(assert (=> b!126857 (= res!61365 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126858 () Bool)

(assert (=> b!126858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> b!126858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_values!2766 newMap!16))))))

(declare-fun e!82834 () Bool)

(declare-fun lt!65606 () ListLongMap!1681)

(assert (=> b!126858 (= e!82834 (= (apply!111 lt!65606 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126859 () Bool)

(assert (=> b!126859 (= e!82838 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126859 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126860 () Bool)

(assert (=> b!126860 (= e!82833 e!82834)))

(assert (=> b!126860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61364 () Bool)

(assert (=> b!126860 (= res!61364 (contains!877 lt!65606 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126860 (=> (not res!61364) (not e!82834))))

(declare-fun b!126861 () Bool)

(declare-fun e!82836 () ListLongMap!1681)

(assert (=> b!126861 (= e!82836 (ListLongMap!1682 Nil!1695))))

(declare-fun b!126862 () Bool)

(declare-fun e!82837 () ListLongMap!1681)

(assert (=> b!126862 (= e!82836 e!82837)))

(declare-fun c!23209 () Bool)

(assert (=> b!126862 (= c!23209 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126863 () Bool)

(declare-fun lt!65607 () Unit!3924)

(declare-fun lt!65601 () Unit!3924)

(assert (=> b!126863 (= lt!65607 lt!65601)))

(declare-fun lt!65604 () ListLongMap!1681)

(declare-fun lt!65603 () (_ BitVec 64))

(declare-fun lt!65605 () (_ BitVec 64))

(declare-fun lt!65602 () V!3435)

(assert (=> b!126863 (not (contains!877 (+!170 lt!65604 (tuple2!2577 lt!65605 lt!65602)) lt!65603))))

(assert (=> b!126863 (= lt!65601 (addStillNotContains!56 lt!65604 lt!65605 lt!65602 lt!65603))))

(assert (=> b!126863 (= lt!65603 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126863 (= lt!65602 (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126863 (= lt!65605 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13679 () ListLongMap!1681)

(assert (=> b!126863 (= lt!65604 call!13679)))

(assert (=> b!126863 (= e!82837 (+!170 call!13679 (tuple2!2577 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126864 () Bool)

(declare-fun e!82832 () Bool)

(assert (=> b!126864 (= e!82832 (isEmpty!397 lt!65606))))

(declare-fun b!126865 () Bool)

(assert (=> b!126865 (= e!82833 e!82832)))

(declare-fun c!23207 () Bool)

(assert (=> b!126865 (= c!23207 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126866 () Bool)

(declare-fun res!61363 () Bool)

(assert (=> b!126866 (=> (not res!61363) (not e!82835))))

(assert (=> b!126866 (= res!61363 (not (contains!877 lt!65606 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126867 () Bool)

(assert (=> b!126867 (= e!82832 (= lt!65606 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16))))))

(declare-fun b!126868 () Bool)

(assert (=> b!126868 (= e!82837 call!13679)))

(declare-fun d!38213 () Bool)

(assert (=> d!38213 e!82835))

(declare-fun res!61366 () Bool)

(assert (=> d!38213 (=> (not res!61366) (not e!82835))))

(assert (=> d!38213 (= res!61366 (not (contains!877 lt!65606 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38213 (= lt!65606 e!82836)))

(declare-fun c!23206 () Bool)

(assert (=> d!38213 (= c!23206 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38213 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38213 (= (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65606)))

(declare-fun bm!13676 () Bool)

(assert (=> bm!13676 (= call!13679 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16)))))

(assert (= (and d!38213 c!23206) b!126861))

(assert (= (and d!38213 (not c!23206)) b!126862))

(assert (= (and b!126862 c!23209) b!126863))

(assert (= (and b!126862 (not c!23209)) b!126868))

(assert (= (or b!126863 b!126868) bm!13676))

(assert (= (and d!38213 res!61366) b!126866))

(assert (= (and b!126866 res!61363) b!126857))

(assert (= (and b!126857 res!61365) b!126859))

(assert (= (and b!126857 c!23208) b!126860))

(assert (= (and b!126857 (not c!23208)) b!126865))

(assert (= (and b!126860 res!61364) b!126858))

(assert (= (and b!126865 c!23207) b!126867))

(assert (= (and b!126865 (not c!23207)) b!126864))

(declare-fun b_lambda!5589 () Bool)

(assert (=> (not b_lambda!5589) (not b!126858)))

(assert (=> b!126858 t!6053))

(declare-fun b_and!7811 () Bool)

(assert (= b_and!7807 (and (=> t!6053 result!3847) b_and!7811)))

(assert (=> b!126858 t!6055))

(declare-fun b_and!7813 () Bool)

(assert (= b_and!7809 (and (=> t!6055 result!3849) b_and!7813)))

(declare-fun b_lambda!5591 () Bool)

(assert (=> (not b_lambda!5591) (not b!126863)))

(assert (=> b!126863 t!6053))

(declare-fun b_and!7815 () Bool)

(assert (= b_and!7811 (and (=> t!6053 result!3847) b_and!7815)))

(assert (=> b!126863 t!6055))

(declare-fun b_and!7817 () Bool)

(assert (= b_and!7813 (and (=> t!6055 result!3849) b_and!7817)))

(declare-fun m!148113 () Bool)

(assert (=> b!126867 m!148113))

(assert (=> b!126860 m!147041))

(assert (=> b!126860 m!147041))

(declare-fun m!148115 () Bool)

(assert (=> b!126860 m!148115))

(assert (=> b!126859 m!147041))

(assert (=> b!126859 m!147041))

(assert (=> b!126859 m!147043))

(declare-fun m!148117 () Bool)

(assert (=> b!126864 m!148117))

(declare-fun m!148119 () Bool)

(assert (=> d!38213 m!148119))

(assert (=> d!38213 m!147051))

(declare-fun m!148121 () Bool)

(assert (=> b!126863 m!148121))

(declare-fun m!148123 () Bool)

(assert (=> b!126863 m!148123))

(assert (=> b!126863 m!147295))

(assert (=> b!126863 m!147145))

(assert (=> b!126863 m!147297))

(assert (=> b!126863 m!148123))

(declare-fun m!148125 () Bool)

(assert (=> b!126863 m!148125))

(assert (=> b!126863 m!147295))

(assert (=> b!126863 m!147041))

(declare-fun m!148127 () Bool)

(assert (=> b!126863 m!148127))

(assert (=> b!126863 m!147145))

(assert (=> bm!13676 m!148113))

(declare-fun m!148129 () Bool)

(assert (=> b!126866 m!148129))

(assert (=> b!126862 m!147041))

(assert (=> b!126862 m!147041))

(assert (=> b!126862 m!147043))

(assert (=> b!126858 m!147295))

(assert (=> b!126858 m!147145))

(assert (=> b!126858 m!147297))

(assert (=> b!126858 m!147295))

(assert (=> b!126858 m!147041))

(declare-fun m!148131 () Bool)

(assert (=> b!126858 m!148131))

(assert (=> b!126858 m!147041))

(assert (=> b!126858 m!147145))

(assert (=> b!126415 d!38213))

(declare-fun d!38215 () Bool)

(assert (=> d!38215 (= (apply!111 lt!65325 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5247 () Bool)

(assert (= bs!5247 d!38215))

(declare-fun m!148133 () Bool)

(assert (=> bs!5247 m!148133))

(assert (=> bs!5247 m!148133))

(declare-fun m!148135 () Bool)

(assert (=> bs!5247 m!148135))

(assert (=> b!126442 d!38215))

(declare-fun d!38217 () Bool)

(assert (=> d!38217 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))

(assert (=> d!38217 true))

(declare-fun _$16!142 () Unit!3924)

(assert (=> d!38217 (= (choose!762 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (defaultEntry!2783 newMap!16)) _$16!142)))

(declare-fun bs!5248 () Bool)

(assert (= bs!5248 d!38217))

(assert (=> bs!5248 m!147237))

(assert (=> bs!5248 m!147003))

(assert (=> bs!5248 m!147237))

(assert (=> bs!5248 m!147003))

(assert (=> bs!5248 m!147239))

(assert (=> d!37991 d!38217))

(assert (=> d!37991 d!38171))

(declare-fun d!38219 () Bool)

(assert (=> d!38219 (= (apply!111 (+!170 lt!65333 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65326) (apply!111 lt!65333 lt!65326))))

(declare-fun lt!65608 () Unit!3924)

(assert (=> d!38219 (= lt!65608 (choose!764 lt!65333 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65326))))

(declare-fun e!82839 () Bool)

(assert (=> d!38219 e!82839))

(declare-fun res!61367 () Bool)

(assert (=> d!38219 (=> (not res!61367) (not e!82839))))

(assert (=> d!38219 (= res!61367 (contains!877 lt!65333 lt!65326))))

(assert (=> d!38219 (= (addApplyDifferent!87 lt!65333 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65326) lt!65608)))

(declare-fun b!126869 () Bool)

(assert (=> b!126869 (= e!82839 (not (= lt!65326 lt!65339)))))

(assert (= (and d!38219 res!61367) b!126869))

(assert (=> d!38219 m!147339))

(assert (=> d!38219 m!147341))

(declare-fun m!148137 () Bool)

(assert (=> d!38219 m!148137))

(assert (=> d!38219 m!147331))

(declare-fun m!148139 () Bool)

(assert (=> d!38219 m!148139))

(assert (=> d!38219 m!147339))

(assert (=> b!126438 d!38219))

(declare-fun d!38221 () Bool)

(declare-fun e!82841 () Bool)

(assert (=> d!38221 e!82841))

(declare-fun res!61368 () Bool)

(assert (=> d!38221 (=> res!61368 e!82841)))

(declare-fun lt!65610 () Bool)

(assert (=> d!38221 (= res!61368 (not lt!65610))))

(declare-fun lt!65609 () Bool)

(assert (=> d!38221 (= lt!65610 lt!65609)))

(declare-fun lt!65612 () Unit!3924)

(declare-fun e!82840 () Unit!3924)

(assert (=> d!38221 (= lt!65612 e!82840)))

(declare-fun c!23210 () Bool)

(assert (=> d!38221 (= c!23210 lt!65609)))

(assert (=> d!38221 (= lt!65609 (containsKey!171 (toList!856 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) lt!65344))))

(assert (=> d!38221 (= (contains!877 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65344) lt!65610)))

(declare-fun b!126870 () Bool)

(declare-fun lt!65611 () Unit!3924)

(assert (=> b!126870 (= e!82840 lt!65611)))

(assert (=> b!126870 (= lt!65611 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) lt!65344))))

(assert (=> b!126870 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) lt!65344))))

(declare-fun b!126871 () Bool)

(declare-fun Unit!3953 () Unit!3924)

(assert (=> b!126871 (= e!82840 Unit!3953)))

(declare-fun b!126872 () Bool)

(assert (=> b!126872 (= e!82841 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) lt!65344)))))

(assert (= (and d!38221 c!23210) b!126870))

(assert (= (and d!38221 (not c!23210)) b!126871))

(assert (= (and d!38221 (not res!61368)) b!126872))

(declare-fun m!148141 () Bool)

(assert (=> d!38221 m!148141))

(declare-fun m!148143 () Bool)

(assert (=> b!126870 m!148143))

(declare-fun m!148145 () Bool)

(assert (=> b!126870 m!148145))

(assert (=> b!126870 m!148145))

(declare-fun m!148147 () Bool)

(assert (=> b!126870 m!148147))

(assert (=> b!126872 m!148145))

(assert (=> b!126872 m!148145))

(assert (=> b!126872 m!148147))

(assert (=> b!126438 d!38221))

(declare-fun d!38223 () Bool)

(assert (=> d!38223 (= (apply!111 (+!170 lt!65345 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65346) (apply!111 lt!65345 lt!65346))))

(declare-fun lt!65613 () Unit!3924)

(assert (=> d!38223 (= lt!65613 (choose!764 lt!65345 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65346))))

(declare-fun e!82842 () Bool)

(assert (=> d!38223 e!82842))

(declare-fun res!61369 () Bool)

(assert (=> d!38223 (=> (not res!61369) (not e!82842))))

(assert (=> d!38223 (= res!61369 (contains!877 lt!65345 lt!65346))))

(assert (=> d!38223 (= (addApplyDifferent!87 lt!65345 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) lt!65346) lt!65613)))

(declare-fun b!126873 () Bool)

(assert (=> b!126873 (= e!82842 (not (= lt!65346 lt!65342)))))

(assert (= (and d!38223 res!61369) b!126873))

(assert (=> d!38223 m!147321))

(assert (=> d!38223 m!147323))

(declare-fun m!148149 () Bool)

(assert (=> d!38223 m!148149))

(assert (=> d!38223 m!147345))

(declare-fun m!148151 () Bool)

(assert (=> d!38223 m!148151))

(assert (=> d!38223 m!147321))

(assert (=> b!126438 d!38223))

(declare-fun d!38225 () Bool)

(assert (=> d!38225 (= (apply!111 lt!65338 lt!65335) (get!1447 (getValueByKey!167 (toList!856 lt!65338) lt!65335)))))

(declare-fun bs!5249 () Bool)

(assert (= bs!5249 d!38225))

(declare-fun m!148153 () Bool)

(assert (=> bs!5249 m!148153))

(assert (=> bs!5249 m!148153))

(declare-fun m!148155 () Bool)

(assert (=> bs!5249 m!148155))

(assert (=> b!126438 d!38225))

(declare-fun b!126874 () Bool)

(declare-fun e!82846 () Bool)

(declare-fun e!82844 () Bool)

(assert (=> b!126874 (= e!82846 e!82844)))

(declare-fun c!23213 () Bool)

(declare-fun e!82849 () Bool)

(assert (=> b!126874 (= c!23213 e!82849)))

(declare-fun res!61372 () Bool)

(assert (=> b!126874 (=> (not res!61372) (not e!82849))))

(assert (=> b!126874 (= res!61372 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126875 () Bool)

(assert (=> b!126875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> b!126875 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))))))))

(declare-fun e!82845 () Bool)

(declare-fun lt!65619 () ListLongMap!1681)

(assert (=> b!126875 (= e!82845 (= (apply!111 lt!65619 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126876 () Bool)

(assert (=> b!126876 (= e!82849 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126876 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126877 () Bool)

(assert (=> b!126877 (= e!82844 e!82845)))

(assert (=> b!126877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61371 () Bool)

(assert (=> b!126877 (= res!61371 (contains!877 lt!65619 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126877 (=> (not res!61371) (not e!82845))))

(declare-fun b!126878 () Bool)

(declare-fun e!82847 () ListLongMap!1681)

(assert (=> b!126878 (= e!82847 (ListLongMap!1682 Nil!1695))))

(declare-fun b!126879 () Bool)

(declare-fun e!82848 () ListLongMap!1681)

(assert (=> b!126879 (= e!82847 e!82848)))

(declare-fun c!23214 () Bool)

(assert (=> b!126879 (= c!23214 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126880 () Bool)

(declare-fun lt!65620 () Unit!3924)

(declare-fun lt!65614 () Unit!3924)

(assert (=> b!126880 (= lt!65620 lt!65614)))

(declare-fun lt!65617 () ListLongMap!1681)

(declare-fun lt!65615 () V!3435)

(declare-fun lt!65618 () (_ BitVec 64))

(declare-fun lt!65616 () (_ BitVec 64))

(assert (=> b!126880 (not (contains!877 (+!170 lt!65617 (tuple2!2577 lt!65618 lt!65615)) lt!65616))))

(assert (=> b!126880 (= lt!65614 (addStillNotContains!56 lt!65617 lt!65618 lt!65615 lt!65616))))

(assert (=> b!126880 (= lt!65616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126880 (= lt!65615 (get!1443 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126880 (= lt!65618 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13680 () ListLongMap!1681)

(assert (=> b!126880 (= lt!65617 call!13680)))

(assert (=> b!126880 (= e!82848 (+!170 call!13680 (tuple2!2577 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (get!1443 (select (arr!2226 (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126881 () Bool)

(declare-fun e!82843 () Bool)

(assert (=> b!126881 (= e!82843 (isEmpty!397 lt!65619))))

(declare-fun b!126882 () Bool)

(assert (=> b!126882 (= e!82844 e!82843)))

(declare-fun c!23212 () Bool)

(assert (=> b!126882 (= c!23212 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126883 () Bool)

(declare-fun res!61370 () Bool)

(assert (=> b!126883 (=> (not res!61370) (not e!82846))))

(assert (=> b!126883 (= res!61370 (not (contains!877 lt!65619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126884 () Bool)

(assert (=> b!126884 (= e!82843 (= lt!65619 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16))))))

(declare-fun b!126885 () Bool)

(assert (=> b!126885 (= e!82848 call!13680)))

(declare-fun d!38227 () Bool)

(assert (=> d!38227 e!82846))

(declare-fun res!61373 () Bool)

(assert (=> d!38227 (=> (not res!61373) (not e!82846))))

(assert (=> d!38227 (= res!61373 (not (contains!877 lt!65619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38227 (= lt!65619 e!82847)))

(declare-fun c!23211 () Bool)

(assert (=> d!38227 (= c!23211 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38227 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38227 (= (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65619)))

(declare-fun bm!13677 () Bool)

(assert (=> bm!13677 (= call!13680 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite c!23022 (_values!2766 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) (mask!7039 newMap!16) (ite c!23022 (ite c!23024 lt!65113 lt!65106) (extraKeys!2564 newMap!16)) (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16)))))

(assert (= (and d!38227 c!23211) b!126878))

(assert (= (and d!38227 (not c!23211)) b!126879))

(assert (= (and b!126879 c!23214) b!126880))

(assert (= (and b!126879 (not c!23214)) b!126885))

(assert (= (or b!126880 b!126885) bm!13677))

(assert (= (and d!38227 res!61373) b!126883))

(assert (= (and b!126883 res!61370) b!126874))

(assert (= (and b!126874 res!61372) b!126876))

(assert (= (and b!126874 c!23213) b!126877))

(assert (= (and b!126874 (not c!23213)) b!126882))

(assert (= (and b!126877 res!61371) b!126875))

(assert (= (and b!126882 c!23212) b!126884))

(assert (= (and b!126882 (not c!23212)) b!126881))

(declare-fun b_lambda!5593 () Bool)

(assert (=> (not b_lambda!5593) (not b!126875)))

(assert (=> b!126875 t!6053))

(declare-fun b_and!7819 () Bool)

(assert (= b_and!7815 (and (=> t!6053 result!3847) b_and!7819)))

(assert (=> b!126875 t!6055))

(declare-fun b_and!7821 () Bool)

(assert (= b_and!7817 (and (=> t!6055 result!3849) b_and!7821)))

(declare-fun b_lambda!5595 () Bool)

(assert (=> (not b_lambda!5595) (not b!126880)))

(assert (=> b!126880 t!6053))

(declare-fun b_and!7823 () Bool)

(assert (= b_and!7819 (and (=> t!6053 result!3847) b_and!7823)))

(assert (=> b!126880 t!6055))

(declare-fun b_and!7825 () Bool)

(assert (= b_and!7821 (and (=> t!6055 result!3849) b_and!7825)))

(declare-fun m!148157 () Bool)

(assert (=> b!126884 m!148157))

(assert (=> b!126877 m!147041))

(assert (=> b!126877 m!147041))

(declare-fun m!148159 () Bool)

(assert (=> b!126877 m!148159))

(assert (=> b!126876 m!147041))

(assert (=> b!126876 m!147041))

(assert (=> b!126876 m!147043))

(declare-fun m!148161 () Bool)

(assert (=> b!126881 m!148161))

(declare-fun m!148163 () Bool)

(assert (=> d!38227 m!148163))

(assert (=> d!38227 m!147051))

(declare-fun m!148165 () Bool)

(assert (=> b!126880 m!148165))

(declare-fun m!148167 () Bool)

(assert (=> b!126880 m!148167))

(assert (=> b!126880 m!147359))

(assert (=> b!126880 m!147145))

(assert (=> b!126880 m!147361))

(assert (=> b!126880 m!148167))

(declare-fun m!148169 () Bool)

(assert (=> b!126880 m!148169))

(assert (=> b!126880 m!147359))

(assert (=> b!126880 m!147041))

(declare-fun m!148171 () Bool)

(assert (=> b!126880 m!148171))

(assert (=> b!126880 m!147145))

(assert (=> bm!13677 m!148157))

(declare-fun m!148173 () Bool)

(assert (=> b!126883 m!148173))

(assert (=> b!126879 m!147041))

(assert (=> b!126879 m!147041))

(assert (=> b!126879 m!147043))

(assert (=> b!126875 m!147359))

(assert (=> b!126875 m!147145))

(assert (=> b!126875 m!147361))

(assert (=> b!126875 m!147359))

(assert (=> b!126875 m!147041))

(declare-fun m!148175 () Bool)

(assert (=> b!126875 m!148175))

(assert (=> b!126875 m!147041))

(assert (=> b!126875 m!147145))

(assert (=> b!126438 d!38227))

(declare-fun d!38229 () Bool)

(declare-fun e!82850 () Bool)

(assert (=> d!38229 e!82850))

(declare-fun res!61374 () Bool)

(assert (=> d!38229 (=> (not res!61374) (not e!82850))))

(declare-fun lt!65623 () ListLongMap!1681)

(assert (=> d!38229 (= res!61374 (contains!877 lt!65623 (_1!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(declare-fun lt!65621 () List!1698)

(assert (=> d!38229 (= lt!65623 (ListLongMap!1682 lt!65621))))

(declare-fun lt!65622 () Unit!3924)

(declare-fun lt!65624 () Unit!3924)

(assert (=> d!38229 (= lt!65622 lt!65624)))

(assert (=> d!38229 (= (getValueByKey!167 lt!65621 (_1!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38229 (= lt!65624 (lemmaContainsTupThenGetReturnValue!82 lt!65621 (_1!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38229 (= lt!65621 (insertStrictlySorted!85 (toList!856 lt!65333) (_1!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38229 (= (+!170 lt!65333 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65623)))

(declare-fun b!126886 () Bool)

(declare-fun res!61375 () Bool)

(assert (=> b!126886 (=> (not res!61375) (not e!82850))))

(assert (=> b!126886 (= res!61375 (= (getValueByKey!167 (toList!856 lt!65623) (_1!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(declare-fun b!126887 () Bool)

(assert (=> b!126887 (= e!82850 (contains!879 (toList!856 lt!65623) (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))

(assert (= (and d!38229 res!61374) b!126886))

(assert (= (and b!126886 res!61375) b!126887))

(declare-fun m!148177 () Bool)

(assert (=> d!38229 m!148177))

(declare-fun m!148179 () Bool)

(assert (=> d!38229 m!148179))

(declare-fun m!148181 () Bool)

(assert (=> d!38229 m!148181))

(declare-fun m!148183 () Bool)

(assert (=> d!38229 m!148183))

(declare-fun m!148185 () Bool)

(assert (=> b!126886 m!148185))

(declare-fun m!148187 () Bool)

(assert (=> b!126887 m!148187))

(assert (=> b!126438 d!38229))

(declare-fun d!38231 () Bool)

(assert (=> d!38231 (contains!877 (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65344)))

(declare-fun lt!65625 () Unit!3924)

(assert (=> d!38231 (= lt!65625 (choose!765 lt!65337 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65344))))

(assert (=> d!38231 (contains!877 lt!65337 lt!65344)))

(assert (=> d!38231 (= (addStillContains!87 lt!65337 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65344) lt!65625)))

(declare-fun bs!5250 () Bool)

(assert (= bs!5250 d!38231))

(assert (=> bs!5250 m!147325))

(assert (=> bs!5250 m!147325))

(assert (=> bs!5250 m!147335))

(declare-fun m!148189 () Bool)

(assert (=> bs!5250 m!148189))

(declare-fun m!148191 () Bool)

(assert (=> bs!5250 m!148191))

(assert (=> b!126438 d!38231))

(declare-fun d!38233 () Bool)

(declare-fun e!82851 () Bool)

(assert (=> d!38233 e!82851))

(declare-fun res!61376 () Bool)

(assert (=> d!38233 (=> (not res!61376) (not e!82851))))

(declare-fun lt!65628 () ListLongMap!1681)

(assert (=> d!38233 (= res!61376 (contains!877 lt!65628 (_1!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(declare-fun lt!65626 () List!1698)

(assert (=> d!38233 (= lt!65628 (ListLongMap!1682 lt!65626))))

(declare-fun lt!65627 () Unit!3924)

(declare-fun lt!65629 () Unit!3924)

(assert (=> d!38233 (= lt!65627 lt!65629)))

(assert (=> d!38233 (= (getValueByKey!167 lt!65626 (_1!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38233 (= lt!65629 (lemmaContainsTupThenGetReturnValue!82 lt!65626 (_1!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38233 (= lt!65626 (insertStrictlySorted!85 (toList!856 lt!65345) (_1!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38233 (= (+!170 lt!65345 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65628)))

(declare-fun b!126888 () Bool)

(declare-fun res!61377 () Bool)

(assert (=> b!126888 (=> (not res!61377) (not e!82851))))

(assert (=> b!126888 (= res!61377 (= (getValueByKey!167 (toList!856 lt!65628) (_1!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(declare-fun b!126889 () Bool)

(assert (=> b!126889 (= e!82851 (contains!879 (toList!856 lt!65628) (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))

(assert (= (and d!38233 res!61376) b!126888))

(assert (= (and b!126888 res!61377) b!126889))

(declare-fun m!148193 () Bool)

(assert (=> d!38233 m!148193))

(declare-fun m!148195 () Bool)

(assert (=> d!38233 m!148195))

(declare-fun m!148197 () Bool)

(assert (=> d!38233 m!148197))

(declare-fun m!148199 () Bool)

(assert (=> d!38233 m!148199))

(declare-fun m!148201 () Bool)

(assert (=> b!126888 m!148201))

(declare-fun m!148203 () Bool)

(assert (=> b!126889 m!148203))

(assert (=> b!126438 d!38233))

(declare-fun d!38235 () Bool)

(declare-fun e!82852 () Bool)

(assert (=> d!38235 e!82852))

(declare-fun res!61378 () Bool)

(assert (=> d!38235 (=> (not res!61378) (not e!82852))))

(declare-fun lt!65632 () ListLongMap!1681)

(assert (=> d!38235 (= res!61378 (contains!877 lt!65632 (_1!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(declare-fun lt!65630 () List!1698)

(assert (=> d!38235 (= lt!65632 (ListLongMap!1682 lt!65630))))

(declare-fun lt!65631 () Unit!3924)

(declare-fun lt!65633 () Unit!3924)

(assert (=> d!38235 (= lt!65631 lt!65633)))

(assert (=> d!38235 (= (getValueByKey!167 lt!65630 (_1!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38235 (= lt!65633 (lemmaContainsTupThenGetReturnValue!82 lt!65630 (_1!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38235 (= lt!65630 (insertStrictlySorted!85 (toList!856 lt!65338) (_1!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38235 (= (+!170 lt!65338 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65632)))

(declare-fun b!126890 () Bool)

(declare-fun res!61379 () Bool)

(assert (=> b!126890 (=> (not res!61379) (not e!82852))))

(assert (=> b!126890 (= res!61379 (= (getValueByKey!167 (toList!856 lt!65632) (_1!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))))))))

(declare-fun b!126891 () Bool)

(assert (=> b!126891 (= e!82852 (contains!879 (toList!856 lt!65632) (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))))))

(assert (= (and d!38235 res!61378) b!126890))

(assert (= (and b!126890 res!61379) b!126891))

(declare-fun m!148205 () Bool)

(assert (=> d!38235 m!148205))

(declare-fun m!148207 () Bool)

(assert (=> d!38235 m!148207))

(declare-fun m!148209 () Bool)

(assert (=> d!38235 m!148209))

(declare-fun m!148211 () Bool)

(assert (=> d!38235 m!148211))

(declare-fun m!148213 () Bool)

(assert (=> b!126890 m!148213))

(declare-fun m!148215 () Bool)

(assert (=> b!126891 m!148215))

(assert (=> b!126438 d!38235))

(declare-fun d!38237 () Bool)

(assert (=> d!38237 (= (apply!111 lt!65345 lt!65346) (get!1447 (getValueByKey!167 (toList!856 lt!65345) lt!65346)))))

(declare-fun bs!5251 () Bool)

(assert (= bs!5251 d!38237))

(declare-fun m!148217 () Bool)

(assert (=> bs!5251 m!148217))

(assert (=> bs!5251 m!148217))

(declare-fun m!148219 () Bool)

(assert (=> bs!5251 m!148219))

(assert (=> b!126438 d!38237))

(declare-fun d!38239 () Bool)

(assert (=> d!38239 (= (apply!111 (+!170 lt!65338 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65335) (apply!111 lt!65338 lt!65335))))

(declare-fun lt!65634 () Unit!3924)

(assert (=> d!38239 (= lt!65634 (choose!764 lt!65338 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65335))))

(declare-fun e!82853 () Bool)

(assert (=> d!38239 e!82853))

(declare-fun res!61380 () Bool)

(assert (=> d!38239 (=> (not res!61380) (not e!82853))))

(assert (=> d!38239 (= res!61380 (contains!877 lt!65338 lt!65335))))

(assert (=> d!38239 (= (addApplyDifferent!87 lt!65338 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)) lt!65335) lt!65634)))

(declare-fun b!126892 () Bool)

(assert (=> b!126892 (= e!82853 (not (= lt!65335 lt!65343)))))

(assert (= (and d!38239 res!61380) b!126892))

(assert (=> d!38239 m!147327))

(assert (=> d!38239 m!147329))

(declare-fun m!148221 () Bool)

(assert (=> d!38239 m!148221))

(assert (=> d!38239 m!147319))

(declare-fun m!148223 () Bool)

(assert (=> d!38239 m!148223))

(assert (=> d!38239 m!147327))

(assert (=> b!126438 d!38239))

(declare-fun d!38241 () Bool)

(declare-fun e!82854 () Bool)

(assert (=> d!38241 e!82854))

(declare-fun res!61381 () Bool)

(assert (=> d!38241 (=> (not res!61381) (not e!82854))))

(declare-fun lt!65637 () ListLongMap!1681)

(assert (=> d!38241 (= res!61381 (contains!877 lt!65637 (_1!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(declare-fun lt!65635 () List!1698)

(assert (=> d!38241 (= lt!65637 (ListLongMap!1682 lt!65635))))

(declare-fun lt!65636 () Unit!3924)

(declare-fun lt!65638 () Unit!3924)

(assert (=> d!38241 (= lt!65636 lt!65638)))

(assert (=> d!38241 (= (getValueByKey!167 lt!65635 (_1!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38241 (= lt!65638 (lemmaContainsTupThenGetReturnValue!82 lt!65635 (_1!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38241 (= lt!65635 (insertStrictlySorted!85 (toList!856 lt!65337) (_1!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))))))

(assert (=> d!38241 (= (+!170 lt!65337 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65637)))

(declare-fun b!126893 () Bool)

(declare-fun res!61382 () Bool)

(assert (=> b!126893 (=> (not res!61382) (not e!82854))))

(assert (=> b!126893 (= res!61382 (= (getValueByKey!167 (toList!856 lt!65637) (_1!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))))))))

(declare-fun b!126894 () Bool)

(assert (=> b!126894 (= e!82854 (contains!879 (toList!856 lt!65637) (tuple2!2577 lt!65331 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))))))

(assert (= (and d!38241 res!61381) b!126893))

(assert (= (and b!126893 res!61382) b!126894))

(declare-fun m!148225 () Bool)

(assert (=> d!38241 m!148225))

(declare-fun m!148227 () Bool)

(assert (=> d!38241 m!148227))

(declare-fun m!148229 () Bool)

(assert (=> d!38241 m!148229))

(declare-fun m!148231 () Bool)

(assert (=> d!38241 m!148231))

(declare-fun m!148233 () Bool)

(assert (=> b!126893 m!148233))

(declare-fun m!148235 () Bool)

(assert (=> b!126894 m!148235))

(assert (=> b!126438 d!38241))

(declare-fun d!38243 () Bool)

(assert (=> d!38243 (= (apply!111 (+!170 lt!65345 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65346) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65345 (tuple2!2577 lt!65342 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) lt!65346)))))

(declare-fun bs!5252 () Bool)

(assert (= bs!5252 d!38243))

(declare-fun m!148237 () Bool)

(assert (=> bs!5252 m!148237))

(assert (=> bs!5252 m!148237))

(declare-fun m!148239 () Bool)

(assert (=> bs!5252 m!148239))

(assert (=> b!126438 d!38243))

(declare-fun d!38245 () Bool)

(assert (=> d!38245 (= (apply!111 (+!170 lt!65338 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16)))) lt!65335) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65338 (tuple2!2577 lt!65343 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))))) lt!65335)))))

(declare-fun bs!5253 () Bool)

(assert (= bs!5253 d!38245))

(declare-fun m!148241 () Bool)

(assert (=> bs!5253 m!148241))

(assert (=> bs!5253 m!148241))

(declare-fun m!148243 () Bool)

(assert (=> bs!5253 m!148243))

(assert (=> b!126438 d!38245))

(declare-fun d!38247 () Bool)

(assert (=> d!38247 (= (apply!111 (+!170 lt!65333 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65326) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65333 (tuple2!2577 lt!65339 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) lt!65326)))))

(declare-fun bs!5254 () Bool)

(assert (= bs!5254 d!38247))

(declare-fun m!148245 () Bool)

(assert (=> bs!5254 m!148245))

(assert (=> bs!5254 m!148245))

(declare-fun m!148247 () Bool)

(assert (=> bs!5254 m!148247))

(assert (=> b!126438 d!38247))

(declare-fun d!38249 () Bool)

(assert (=> d!38249 (= (apply!111 lt!65333 lt!65326) (get!1447 (getValueByKey!167 (toList!856 lt!65333) lt!65326)))))

(declare-fun bs!5255 () Bool)

(assert (= bs!5255 d!38249))

(declare-fun m!148249 () Bool)

(assert (=> bs!5255 m!148249))

(assert (=> bs!5255 m!148249))

(declare-fun m!148251 () Bool)

(assert (=> bs!5255 m!148251))

(assert (=> b!126438 d!38249))

(declare-fun d!38251 () Bool)

(assert (=> d!38251 (= (apply!111 lt!65166 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65166) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5256 () Bool)

(assert (= bs!5256 d!38251))

(assert (=> bs!5256 m!147865))

(assert (=> bs!5256 m!147865))

(declare-fun m!148253 () Bool)

(assert (=> bs!5256 m!148253))

(assert (=> b!126327 d!38251))

(declare-fun d!38253 () Bool)

(declare-fun lt!65641 () Bool)

(declare-fun content!126 (List!1700) (InoxSet (_ BitVec 64)))

(assert (=> d!38253 (= lt!65641 (select (content!126 Nil!1697) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!82859 () Bool)

(assert (=> d!38253 (= lt!65641 e!82859)))

(declare-fun res!61388 () Bool)

(assert (=> d!38253 (=> (not res!61388) (not e!82859))))

(assert (=> d!38253 (= res!61388 ((_ is Cons!1696) Nil!1697))))

(assert (=> d!38253 (= (contains!880 Nil!1697 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) lt!65641)))

(declare-fun b!126899 () Bool)

(declare-fun e!82860 () Bool)

(assert (=> b!126899 (= e!82859 e!82860)))

(declare-fun res!61387 () Bool)

(assert (=> b!126899 (=> res!61387 e!82860)))

(assert (=> b!126899 (= res!61387 (= (h!2298 Nil!1697) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126900 () Bool)

(assert (=> b!126900 (= e!82860 (contains!880 (t!6051 Nil!1697) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38253 res!61388) b!126899))

(assert (= (and b!126899 (not res!61387)) b!126900))

(declare-fun m!148255 () Bool)

(assert (=> d!38253 m!148255))

(assert (=> d!38253 m!147041))

(declare-fun m!148257 () Bool)

(assert (=> d!38253 m!148257))

(assert (=> b!126900 m!147041))

(declare-fun m!148259 () Bool)

(assert (=> b!126900 m!148259))

(assert (=> b!126553 d!38253))

(assert (=> b!126510 d!37975))

(declare-fun d!38255 () Bool)

(declare-fun e!82862 () Bool)

(assert (=> d!38255 e!82862))

(declare-fun res!61389 () Bool)

(assert (=> d!38255 (=> res!61389 e!82862)))

(declare-fun lt!65643 () Bool)

(assert (=> d!38255 (= res!61389 (not lt!65643))))

(declare-fun lt!65642 () Bool)

(assert (=> d!38255 (= lt!65643 lt!65642)))

(declare-fun lt!65645 () Unit!3924)

(declare-fun e!82861 () Unit!3924)

(assert (=> d!38255 (= lt!65645 e!82861)))

(declare-fun c!23215 () Bool)

(assert (=> d!38255 (= c!23215 lt!65642)))

(assert (=> d!38255 (= lt!65642 (containsKey!171 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38255 (= (contains!877 lt!65323 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65643)))

(declare-fun b!126901 () Bool)

(declare-fun lt!65644 () Unit!3924)

(assert (=> b!126901 (= e!82861 lt!65644)))

(assert (=> b!126901 (= lt!65644 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!126901 (isDefined!120 (getValueByKey!167 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126902 () Bool)

(declare-fun Unit!3954 () Unit!3924)

(assert (=> b!126902 (= e!82861 Unit!3954)))

(declare-fun b!126903 () Bool)

(assert (=> b!126903 (= e!82862 (isDefined!120 (getValueByKey!167 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38255 c!23215) b!126901))

(assert (= (and d!38255 (not c!23215)) b!126902))

(assert (= (and d!38255 (not res!61389)) b!126903))

(declare-fun m!148261 () Bool)

(assert (=> d!38255 m!148261))

(declare-fun m!148263 () Bool)

(assert (=> b!126901 m!148263))

(assert (=> b!126901 m!147313))

(assert (=> b!126901 m!147313))

(declare-fun m!148265 () Bool)

(assert (=> b!126901 m!148265))

(assert (=> b!126903 m!147313))

(assert (=> b!126903 m!147313))

(assert (=> b!126903 m!148265))

(assert (=> d!37999 d!38255))

(declare-fun d!38257 () Bool)

(declare-fun c!23216 () Bool)

(assert (=> d!38257 (= c!23216 (and ((_ is Cons!1694) lt!65321) (= (_1!1299 (h!2296 lt!65321)) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!82863 () Option!173)

(assert (=> d!38257 (= (getValueByKey!167 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!82863)))

(declare-fun b!126905 () Bool)

(declare-fun e!82864 () Option!173)

(assert (=> b!126905 (= e!82863 e!82864)))

(declare-fun c!23217 () Bool)

(assert (=> b!126905 (= c!23217 (and ((_ is Cons!1694) lt!65321) (not (= (_1!1299 (h!2296 lt!65321)) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!126907 () Bool)

(assert (=> b!126907 (= e!82864 None!171)))

(declare-fun b!126906 () Bool)

(assert (=> b!126906 (= e!82864 (getValueByKey!167 (t!6045 lt!65321) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126904 () Bool)

(assert (=> b!126904 (= e!82863 (Some!172 (_2!1299 (h!2296 lt!65321))))))

(assert (= (and d!38257 c!23216) b!126904))

(assert (= (and d!38257 (not c!23216)) b!126905))

(assert (= (and b!126905 c!23217) b!126906))

(assert (= (and b!126905 (not c!23217)) b!126907))

(declare-fun m!148267 () Bool)

(assert (=> b!126906 m!148267))

(assert (=> d!37999 d!38257))

(declare-fun d!38259 () Bool)

(assert (=> d!38259 (= (getValueByKey!167 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65646 () Unit!3924)

(assert (=> d!38259 (= lt!65646 (choose!770 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!82865 () Bool)

(assert (=> d!38259 e!82865))

(declare-fun res!61390 () Bool)

(assert (=> d!38259 (=> (not res!61390) (not e!82865))))

(assert (=> d!38259 (= res!61390 (isStrictlySorted!317 lt!65321))))

(assert (=> d!38259 (= (lemmaContainsTupThenGetReturnValue!82 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65646)))

(declare-fun b!126908 () Bool)

(declare-fun res!61391 () Bool)

(assert (=> b!126908 (=> (not res!61391) (not e!82865))))

(assert (=> b!126908 (= res!61391 (containsKey!171 lt!65321 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126909 () Bool)

(assert (=> b!126909 (= e!82865 (contains!879 lt!65321 (tuple2!2577 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38259 res!61390) b!126908))

(assert (= (and b!126908 res!61391) b!126909))

(assert (=> d!38259 m!147307))

(declare-fun m!148269 () Bool)

(assert (=> d!38259 m!148269))

(declare-fun m!148271 () Bool)

(assert (=> d!38259 m!148271))

(declare-fun m!148273 () Bool)

(assert (=> b!126908 m!148273))

(declare-fun m!148275 () Bool)

(assert (=> b!126909 m!148275))

(assert (=> d!37999 d!38259))

(declare-fun c!23219 () Bool)

(declare-fun c!23221 () Bool)

(declare-fun e!82866 () List!1698)

(declare-fun b!126910 () Bool)

(assert (=> b!126910 (= e!82866 (ite c!23219 (t!6045 (toList!856 call!13578)) (ite c!23221 (Cons!1694 (h!2296 (toList!856 call!13578)) (t!6045 (toList!856 call!13578))) Nil!1695)))))

(declare-fun call!13682 () List!1698)

(declare-fun c!23220 () Bool)

(declare-fun bm!13678 () Bool)

(assert (=> bm!13678 (= call!13682 ($colon$colon!89 e!82866 (ite c!23220 (h!2296 (toList!856 call!13578)) (tuple2!2577 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23218 () Bool)

(assert (=> bm!13678 (= c!23218 c!23220)))

(declare-fun b!126911 () Bool)

(assert (=> b!126911 (= e!82866 (insertStrictlySorted!85 (t!6045 (toList!856 call!13578)) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65647 () List!1698)

(declare-fun e!82867 () Bool)

(declare-fun b!126912 () Bool)

(assert (=> b!126912 (= e!82867 (contains!879 lt!65647 (tuple2!2577 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!126913 () Bool)

(declare-fun e!82870 () List!1698)

(declare-fun call!13681 () List!1698)

(assert (=> b!126913 (= e!82870 call!13681)))

(declare-fun b!126914 () Bool)

(declare-fun e!82869 () List!1698)

(declare-fun call!13683 () List!1698)

(assert (=> b!126914 (= e!82869 call!13683)))

(declare-fun b!126915 () Bool)

(assert (=> b!126915 (= e!82869 call!13683)))

(declare-fun b!126916 () Bool)

(declare-fun e!82868 () List!1698)

(assert (=> b!126916 (= e!82868 call!13682)))

(declare-fun d!38261 () Bool)

(assert (=> d!38261 e!82867))

(declare-fun res!61392 () Bool)

(assert (=> d!38261 (=> (not res!61392) (not e!82867))))

(assert (=> d!38261 (= res!61392 (isStrictlySorted!317 lt!65647))))

(assert (=> d!38261 (= lt!65647 e!82868)))

(assert (=> d!38261 (= c!23220 (and ((_ is Cons!1694) (toList!856 call!13578)) (bvslt (_1!1299 (h!2296 (toList!856 call!13578))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38261 (isStrictlySorted!317 (toList!856 call!13578))))

(assert (=> d!38261 (= (insertStrictlySorted!85 (toList!856 call!13578) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65647)))

(declare-fun bm!13679 () Bool)

(assert (=> bm!13679 (= call!13681 call!13682)))

(declare-fun bm!13680 () Bool)

(assert (=> bm!13680 (= call!13683 call!13681)))

(declare-fun b!126917 () Bool)

(declare-fun res!61393 () Bool)

(assert (=> b!126917 (=> (not res!61393) (not e!82867))))

(assert (=> b!126917 (= res!61393 (containsKey!171 lt!65647 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!126918 () Bool)

(assert (=> b!126918 (= c!23221 (and ((_ is Cons!1694) (toList!856 call!13578)) (bvsgt (_1!1299 (h!2296 (toList!856 call!13578))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!126918 (= e!82870 e!82869)))

(declare-fun b!126919 () Bool)

(assert (=> b!126919 (= e!82868 e!82870)))

(assert (=> b!126919 (= c!23219 (and ((_ is Cons!1694) (toList!856 call!13578)) (= (_1!1299 (h!2296 (toList!856 call!13578))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!38261 c!23220) b!126916))

(assert (= (and d!38261 (not c!23220)) b!126919))

(assert (= (and b!126919 c!23219) b!126913))

(assert (= (and b!126919 (not c!23219)) b!126918))

(assert (= (and b!126918 c!23221) b!126915))

(assert (= (and b!126918 (not c!23221)) b!126914))

(assert (= (or b!126915 b!126914) bm!13680))

(assert (= (or b!126913 bm!13680) bm!13679))

(assert (= (or b!126916 bm!13679) bm!13678))

(assert (= (and bm!13678 c!23218) b!126911))

(assert (= (and bm!13678 (not c!23218)) b!126910))

(assert (= (and d!38261 res!61392) b!126917))

(assert (= (and b!126917 res!61393) b!126912))

(declare-fun m!148277 () Bool)

(assert (=> b!126911 m!148277))

(declare-fun m!148279 () Bool)

(assert (=> b!126912 m!148279))

(declare-fun m!148281 () Bool)

(assert (=> d!38261 m!148281))

(declare-fun m!148283 () Bool)

(assert (=> d!38261 m!148283))

(declare-fun m!148285 () Bool)

(assert (=> b!126917 m!148285))

(declare-fun m!148287 () Bool)

(assert (=> bm!13678 m!148287))

(assert (=> d!37999 d!38261))

(declare-fun d!38263 () Bool)

(declare-fun e!82871 () Bool)

(assert (=> d!38263 e!82871))

(declare-fun res!61394 () Bool)

(assert (=> d!38263 (=> (not res!61394) (not e!82871))))

(declare-fun lt!65650 () ListLongMap!1681)

(assert (=> d!38263 (= res!61394 (contains!877 lt!65650 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun lt!65648 () List!1698)

(assert (=> d!38263 (= lt!65650 (ListLongMap!1682 lt!65648))))

(declare-fun lt!65649 () Unit!3924)

(declare-fun lt!65651 () Unit!3924)

(assert (=> d!38263 (= lt!65649 lt!65651)))

(assert (=> d!38263 (= (getValueByKey!167 lt!65648 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38263 (= lt!65651 (lemmaContainsTupThenGetReturnValue!82 lt!65648 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38263 (= lt!65648 (insertStrictlySorted!85 (toList!856 call!13623) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38263 (= (+!170 call!13623 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) lt!65650)))

(declare-fun b!126920 () Bool)

(declare-fun res!61395 () Bool)

(assert (=> b!126920 (=> (not res!61395) (not e!82871))))

(assert (=> b!126920 (= res!61395 (= (getValueByKey!167 (toList!856 lt!65650) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(declare-fun b!126921 () Bool)

(assert (=> b!126921 (= e!82871 (contains!879 (toList!856 lt!65650) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(assert (= (and d!38263 res!61394) b!126920))

(assert (= (and b!126920 res!61395) b!126921))

(declare-fun m!148289 () Bool)

(assert (=> d!38263 m!148289))

(declare-fun m!148291 () Bool)

(assert (=> d!38263 m!148291))

(declare-fun m!148293 () Bool)

(assert (=> d!38263 m!148293))

(declare-fun m!148295 () Bool)

(assert (=> d!38263 m!148295))

(declare-fun m!148297 () Bool)

(assert (=> b!126920 m!148297))

(declare-fun m!148299 () Bool)

(assert (=> b!126921 m!148299))

(assert (=> b!126428 d!38263))

(declare-fun d!38265 () Bool)

(assert (=> d!38265 (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))

(declare-fun lt!65654 () Unit!3924)

(declare-fun choose!771 (array!4699 array!4701 (_ BitVec 32) (_ BitVec 32) V!3435 V!3435 (_ BitVec 64) (_ BitVec 32) Int) Unit!3924)

(assert (=> d!38265 (= lt!65654 (choose!771 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(assert (=> d!38265 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38265 (= (lemmaArrayContainsKeyThenInListMap!37 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65654)))

(declare-fun bs!5257 () Bool)

(assert (= bs!5257 d!38265))

(assert (=> bs!5257 m!146893))

(assert (=> bs!5257 m!146893))

(assert (=> bs!5257 m!146847))

(assert (=> bs!5257 m!146987))

(assert (=> bs!5257 m!146847))

(declare-fun m!148301 () Bool)

(assert (=> bs!5257 m!148301))

(assert (=> bs!5257 m!147051))

(assert (=> b!126385 d!38265))

(assert (=> b!126385 d!37995))

(assert (=> b!126385 d!37997))

(declare-fun d!38267 () Bool)

(declare-fun c!23222 () Bool)

(assert (=> d!38267 (= c!23222 (and ((_ is Cons!1694) (toList!856 lt!65369)) (= (_1!1299 (h!2296 (toList!856 lt!65369))) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82872 () Option!173)

(assert (=> d!38267 (= (getValueByKey!167 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82872)))

(declare-fun b!126923 () Bool)

(declare-fun e!82873 () Option!173)

(assert (=> b!126923 (= e!82872 e!82873)))

(declare-fun c!23223 () Bool)

(assert (=> b!126923 (= c!23223 (and ((_ is Cons!1694) (toList!856 lt!65369)) (not (= (_1!1299 (h!2296 (toList!856 lt!65369))) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!126925 () Bool)

(assert (=> b!126925 (= e!82873 None!171)))

(declare-fun b!126924 () Bool)

(assert (=> b!126924 (= e!82873 (getValueByKey!167 (t!6045 (toList!856 lt!65369)) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!126922 () Bool)

(assert (=> b!126922 (= e!82872 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65369)))))))

(assert (= (and d!38267 c!23222) b!126922))

(assert (= (and d!38267 (not c!23222)) b!126923))

(assert (= (and b!126923 c!23223) b!126924))

(assert (= (and b!126923 (not c!23223)) b!126925))

(declare-fun m!148303 () Bool)

(assert (=> b!126924 m!148303))

(assert (=> b!126479 d!38267))

(declare-fun b!126926 () Bool)

(declare-fun e!82877 () Bool)

(declare-fun e!82875 () Bool)

(assert (=> b!126926 (= e!82877 e!82875)))

(declare-fun c!23226 () Bool)

(declare-fun e!82880 () Bool)

(assert (=> b!126926 (= c!23226 e!82880)))

(declare-fun res!61398 () Bool)

(assert (=> b!126926 (=> (not res!61398) (not e!82880))))

(assert (=> b!126926 (= res!61398 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126927 () Bool)

(assert (=> b!126927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> b!126927 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109))))))

(declare-fun lt!65660 () ListLongMap!1681)

(declare-fun e!82876 () Bool)

(assert (=> b!126927 (= e!82876 (= (apply!111 lt!65660 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126928 () Bool)

(assert (=> b!126928 (= e!82880 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126928 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!126929 () Bool)

(assert (=> b!126929 (= e!82875 e!82876)))

(assert (=> b!126929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61397 () Bool)

(assert (=> b!126929 (= res!61397 (contains!877 lt!65660 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126929 (=> (not res!61397) (not e!82876))))

(declare-fun b!126930 () Bool)

(declare-fun e!82878 () ListLongMap!1681)

(assert (=> b!126930 (= e!82878 (ListLongMap!1682 Nil!1695))))

(declare-fun b!126931 () Bool)

(declare-fun e!82879 () ListLongMap!1681)

(assert (=> b!126931 (= e!82878 e!82879)))

(declare-fun c!23227 () Bool)

(assert (=> b!126931 (= c!23227 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126932 () Bool)

(declare-fun lt!65661 () Unit!3924)

(declare-fun lt!65655 () Unit!3924)

(assert (=> b!126932 (= lt!65661 lt!65655)))

(declare-fun lt!65659 () (_ BitVec 64))

(declare-fun lt!65657 () (_ BitVec 64))

(declare-fun lt!65656 () V!3435)

(declare-fun lt!65658 () ListLongMap!1681)

(assert (=> b!126932 (not (contains!877 (+!170 lt!65658 (tuple2!2577 lt!65659 lt!65656)) lt!65657))))

(assert (=> b!126932 (= lt!65655 (addStillNotContains!56 lt!65658 lt!65659 lt!65656 lt!65657))))

(assert (=> b!126932 (= lt!65657 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!126932 (= lt!65656 (get!1443 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126932 (= lt!65659 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13684 () ListLongMap!1681)

(assert (=> b!126932 (= lt!65658 call!13684)))

(assert (=> b!126932 (= e!82879 (+!170 call!13684 (tuple2!2577 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (get!1443 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!126933 () Bool)

(declare-fun e!82874 () Bool)

(assert (=> b!126933 (= e!82874 (isEmpty!397 lt!65660))))

(declare-fun b!126934 () Bool)

(assert (=> b!126934 (= e!82875 e!82874)))

(declare-fun c!23225 () Bool)

(assert (=> b!126934 (= c!23225 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126935 () Bool)

(declare-fun res!61396 () Bool)

(assert (=> b!126935 (=> (not res!61396) (not e!82877))))

(assert (=> b!126935 (= res!61396 (not (contains!877 lt!65660 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!126936 () Bool)

(assert (=> b!126936 (= e!82874 (= lt!65660 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16))))))

(declare-fun b!126937 () Bool)

(assert (=> b!126937 (= e!82879 call!13684)))

(declare-fun d!38269 () Bool)

(assert (=> d!38269 e!82877))

(declare-fun res!61399 () Bool)

(assert (=> d!38269 (=> (not res!61399) (not e!82877))))

(assert (=> d!38269 (= res!61399 (not (contains!877 lt!65660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38269 (= lt!65660 e!82878)))

(declare-fun c!23224 () Bool)

(assert (=> d!38269 (= c!23224 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38269 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38269 (= (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65660)))

(declare-fun bm!13681 () Bool)

(assert (=> bm!13681 (= call!13684 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2783 newMap!16)))))

(assert (= (and d!38269 c!23224) b!126930))

(assert (= (and d!38269 (not c!23224)) b!126931))

(assert (= (and b!126931 c!23227) b!126932))

(assert (= (and b!126931 (not c!23227)) b!126937))

(assert (= (or b!126932 b!126937) bm!13681))

(assert (= (and d!38269 res!61399) b!126935))

(assert (= (and b!126935 res!61396) b!126926))

(assert (= (and b!126926 res!61398) b!126928))

(assert (= (and b!126926 c!23226) b!126929))

(assert (= (and b!126926 (not c!23226)) b!126934))

(assert (= (and b!126929 res!61397) b!126927))

(assert (= (and b!126934 c!23225) b!126936))

(assert (= (and b!126934 (not c!23225)) b!126933))

(declare-fun b_lambda!5597 () Bool)

(assert (=> (not b_lambda!5597) (not b!126927)))

(assert (=> b!126927 t!6053))

(declare-fun b_and!7827 () Bool)

(assert (= b_and!7823 (and (=> t!6053 result!3847) b_and!7827)))

(assert (=> b!126927 t!6055))

(declare-fun b_and!7829 () Bool)

(assert (= b_and!7825 (and (=> t!6055 result!3849) b_and!7829)))

(declare-fun b_lambda!5599 () Bool)

(assert (=> (not b_lambda!5599) (not b!126932)))

(assert (=> b!126932 t!6053))

(declare-fun b_and!7831 () Bool)

(assert (= b_and!7827 (and (=> t!6053 result!3847) b_and!7831)))

(assert (=> b!126932 t!6055))

(declare-fun b_and!7833 () Bool)

(assert (= b_and!7829 (and (=> t!6055 result!3849) b_and!7833)))

(declare-fun m!148305 () Bool)

(assert (=> b!126936 m!148305))

(assert (=> b!126929 m!147041))

(assert (=> b!126929 m!147041))

(declare-fun m!148307 () Bool)

(assert (=> b!126929 m!148307))

(assert (=> b!126928 m!147041))

(assert (=> b!126928 m!147041))

(assert (=> b!126928 m!147043))

(declare-fun m!148309 () Bool)

(assert (=> b!126933 m!148309))

(declare-fun m!148311 () Bool)

(assert (=> d!38269 m!148311))

(assert (=> d!38269 m!147051))

(declare-fun m!148313 () Bool)

(assert (=> b!126932 m!148313))

(declare-fun m!148315 () Bool)

(assert (=> b!126932 m!148315))

(assert (=> b!126932 m!147147))

(assert (=> b!126932 m!147145))

(assert (=> b!126932 m!147149))

(assert (=> b!126932 m!148315))

(declare-fun m!148317 () Bool)

(assert (=> b!126932 m!148317))

(assert (=> b!126932 m!147147))

(assert (=> b!126932 m!147041))

(declare-fun m!148319 () Bool)

(assert (=> b!126932 m!148319))

(assert (=> b!126932 m!147145))

(assert (=> bm!13681 m!148305))

(declare-fun m!148321 () Bool)

(assert (=> b!126935 m!148321))

(assert (=> b!126931 m!147041))

(assert (=> b!126931 m!147041))

(assert (=> b!126931 m!147043))

(assert (=> b!126927 m!147147))

(assert (=> b!126927 m!147145))

(assert (=> b!126927 m!147149))

(assert (=> b!126927 m!147147))

(assert (=> b!126927 m!147041))

(declare-fun m!148323 () Bool)

(assert (=> b!126927 m!148323))

(assert (=> b!126927 m!147041))

(assert (=> b!126927 m!147145))

(assert (=> bm!13601 d!38269))

(declare-fun d!38271 () Bool)

(declare-fun e!82881 () Bool)

(assert (=> d!38271 e!82881))

(declare-fun res!61400 () Bool)

(assert (=> d!38271 (=> (not res!61400) (not e!82881))))

(declare-fun lt!65664 () ListLongMap!1681)

(assert (=> d!38271 (= res!61400 (contains!877 lt!65664 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(declare-fun lt!65662 () List!1698)

(assert (=> d!38271 (= lt!65664 (ListLongMap!1682 lt!65662))))

(declare-fun lt!65663 () Unit!3924)

(declare-fun lt!65665 () Unit!3924)

(assert (=> d!38271 (= lt!65663 lt!65665)))

(assert (=> d!38271 (= (getValueByKey!167 lt!65662 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38271 (= lt!65665 (lemmaContainsTupThenGetReturnValue!82 lt!65662 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38271 (= lt!65662 (insertStrictlySorted!85 (toList!856 call!13630) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (=> d!38271 (= (+!170 call!13630 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))) lt!65664)))

(declare-fun b!126938 () Bool)

(declare-fun res!61401 () Bool)

(assert (=> b!126938 (=> (not res!61401) (not e!82881))))

(assert (=> b!126938 (= res!61401 (= (getValueByKey!167 (toList!856 lt!65664) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(declare-fun b!126939 () Bool)

(assert (=> b!126939 (= e!82881 (contains!879 (toList!856 lt!65664) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))

(assert (= (and d!38271 res!61400) b!126938))

(assert (= (and b!126938 res!61401) b!126939))

(declare-fun m!148325 () Bool)

(assert (=> d!38271 m!148325))

(declare-fun m!148327 () Bool)

(assert (=> d!38271 m!148327))

(declare-fun m!148329 () Bool)

(assert (=> d!38271 m!148329))

(declare-fun m!148331 () Bool)

(assert (=> d!38271 m!148331))

(declare-fun m!148333 () Bool)

(assert (=> b!126938 m!148333))

(declare-fun m!148335 () Bool)

(assert (=> b!126939 m!148335))

(assert (=> b!126451 d!38271))

(declare-fun lt!65666 () Bool)

(declare-fun d!38273 () Bool)

(assert (=> d!38273 (= lt!65666 (select (content!125 (toList!856 lt!65402)) (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82882 () Bool)

(assert (=> d!38273 (= lt!65666 e!82882)))

(declare-fun res!61403 () Bool)

(assert (=> d!38273 (=> (not res!61403) (not e!82882))))

(assert (=> d!38273 (= res!61403 ((_ is Cons!1694) (toList!856 lt!65402)))))

(assert (=> d!38273 (= (contains!879 (toList!856 lt!65402) (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65666)))

(declare-fun b!126940 () Bool)

(declare-fun e!82883 () Bool)

(assert (=> b!126940 (= e!82882 e!82883)))

(declare-fun res!61402 () Bool)

(assert (=> b!126940 (=> res!61402 e!82883)))

(assert (=> b!126940 (= res!61402 (= (h!2296 (toList!856 lt!65402)) (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126941 () Bool)

(assert (=> b!126941 (= e!82883 (contains!879 (t!6045 (toList!856 lt!65402)) (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38273 res!61403) b!126940))

(assert (= (and b!126940 (not res!61402)) b!126941))

(declare-fun m!148337 () Bool)

(assert (=> d!38273 m!148337))

(declare-fun m!148339 () Bool)

(assert (=> d!38273 m!148339))

(declare-fun m!148341 () Bool)

(assert (=> b!126941 m!148341))

(assert (=> b!126523 d!38273))

(declare-fun d!38275 () Bool)

(assert (=> d!38275 (= (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!396 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5258 () Bool)

(assert (= bs!5258 d!38275))

(assert (=> bs!5258 m!147061))

(declare-fun m!148343 () Bool)

(assert (=> bs!5258 m!148343))

(assert (=> b!126270 d!38275))

(declare-fun d!38277 () Bool)

(declare-fun c!23228 () Bool)

(assert (=> d!38277 (= c!23228 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!82884 () Option!173)

(assert (=> d!38277 (= (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000) e!82884)))

(declare-fun b!126943 () Bool)

(declare-fun e!82885 () Option!173)

(assert (=> b!126943 (= e!82884 e!82885)))

(declare-fun c!23229 () Bool)

(assert (=> b!126943 (= c!23229 (and ((_ is Cons!1694) (toList!856 lt!65008)) (not (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!126945 () Bool)

(assert (=> b!126945 (= e!82885 None!171)))

(declare-fun b!126944 () Bool)

(assert (=> b!126944 (= e!82885 (getValueByKey!167 (t!6045 (toList!856 lt!65008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126942 () Bool)

(assert (=> b!126942 (= e!82884 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65008)))))))

(assert (= (and d!38277 c!23228) b!126942))

(assert (= (and d!38277 (not c!23228)) b!126943))

(assert (= (and b!126943 c!23229) b!126944))

(assert (= (and b!126943 (not c!23229)) b!126945))

(declare-fun m!148345 () Bool)

(assert (=> b!126944 m!148345))

(assert (=> b!126270 d!38277))

(declare-fun d!38279 () Bool)

(declare-fun lt!65667 () Bool)

(assert (=> d!38279 (= lt!65667 (select (content!125 (toList!856 lt!65422)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!82886 () Bool)

(assert (=> d!38279 (= lt!65667 e!82886)))

(declare-fun res!61405 () Bool)

(assert (=> d!38279 (=> (not res!61405) (not e!82886))))

(assert (=> d!38279 (= res!61405 ((_ is Cons!1694) (toList!856 lt!65422)))))

(assert (=> d!38279 (= (contains!879 (toList!856 lt!65422) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65667)))

(declare-fun b!126946 () Bool)

(declare-fun e!82887 () Bool)

(assert (=> b!126946 (= e!82886 e!82887)))

(declare-fun res!61404 () Bool)

(assert (=> b!126946 (=> res!61404 e!82887)))

(assert (=> b!126946 (= res!61404 (= (h!2296 (toList!856 lt!65422)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!126947 () Bool)

(assert (=> b!126947 (= e!82887 (contains!879 (t!6045 (toList!856 lt!65422)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38279 res!61405) b!126946))

(assert (= (and b!126946 (not res!61404)) b!126947))

(declare-fun m!148347 () Bool)

(assert (=> d!38279 m!148347))

(declare-fun m!148349 () Bool)

(assert (=> d!38279 m!148349))

(declare-fun m!148351 () Bool)

(assert (=> b!126947 m!148351))

(assert (=> b!126555 d!38279))

(declare-fun d!38281 () Bool)

(assert (=> d!38281 (= (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027)) (not (isEmpty!396 (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))))

(declare-fun bs!5259 () Bool)

(assert (= bs!5259 d!38281))

(assert (=> bs!5259 m!147497))

(declare-fun m!148353 () Bool)

(assert (=> bs!5259 m!148353))

(assert (=> b!126519 d!38281))

(declare-fun d!38283 () Bool)

(declare-fun c!23230 () Bool)

(assert (=> d!38283 (= c!23230 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65027)))))

(declare-fun e!82888 () Option!173)

(assert (=> d!38283 (= (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027) e!82888)))

(declare-fun b!126949 () Bool)

(declare-fun e!82889 () Option!173)

(assert (=> b!126949 (= e!82888 e!82889)))

(declare-fun c!23231 () Bool)

(assert (=> b!126949 (= c!23231 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65027))))))

(declare-fun b!126951 () Bool)

(assert (=> b!126951 (= e!82889 None!171)))

(declare-fun b!126950 () Bool)

(assert (=> b!126950 (= e!82889 (getValueByKey!167 (t!6045 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65027))))

(declare-fun b!126948 () Bool)

(assert (=> b!126948 (= e!82888 (Some!172 (_2!1299 (h!2296 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38283 c!23230) b!126948))

(assert (= (and d!38283 (not c!23230)) b!126949))

(assert (= (and b!126949 c!23231) b!126950))

(assert (= (and b!126949 (not c!23231)) b!126951))

(declare-fun m!148355 () Bool)

(assert (=> b!126950 m!148355))

(assert (=> b!126519 d!38283))

(assert (=> d!37979 d!38171))

(assert (=> b!126405 d!38105))

(assert (=> b!126405 d!37997))

(declare-fun b!126952 () Bool)

(declare-fun c!23233 () Bool)

(assert (=> b!126952 (= c!23233 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82900 () ListLongMap!1681)

(declare-fun e!82896 () ListLongMap!1681)

(assert (=> b!126952 (= e!82900 e!82896)))

(declare-fun bm!13682 () Bool)

(declare-fun call!13687 () Bool)

(declare-fun lt!65668 () ListLongMap!1681)

(assert (=> bm!13682 (= call!13687 (contains!877 lt!65668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126953 () Bool)

(declare-fun e!82899 () ListLongMap!1681)

(assert (=> b!126953 (= e!82899 e!82900)))

(declare-fun c!23236 () Bool)

(assert (=> b!126953 (= c!23236 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126954 () Bool)

(declare-fun e!82890 () Unit!3924)

(declare-fun Unit!3955 () Unit!3924)

(assert (=> b!126954 (= e!82890 Unit!3955)))

(declare-fun b!126955 () Bool)

(declare-fun e!82898 () Bool)

(declare-fun e!82893 () Bool)

(assert (=> b!126955 (= e!82898 e!82893)))

(declare-fun res!61412 () Bool)

(assert (=> b!126955 (= res!61412 call!13687)))

(assert (=> b!126955 (=> (not res!61412) (not e!82893))))

(declare-fun b!126956 () Bool)

(declare-fun e!82902 () Bool)

(declare-fun e!82895 () Bool)

(assert (=> b!126956 (= e!82902 e!82895)))

(declare-fun res!61406 () Bool)

(assert (=> b!126956 (=> (not res!61406) (not e!82895))))

(assert (=> b!126956 (= res!61406 (contains!877 lt!65668 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126956 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126957 () Bool)

(assert (=> b!126957 (= e!82898 (not call!13687))))

(declare-fun d!38285 () Bool)

(declare-fun e!82892 () Bool)

(assert (=> d!38285 e!82892))

(declare-fun res!61408 () Bool)

(assert (=> d!38285 (=> (not res!61408) (not e!82892))))

(assert (=> d!38285 (= res!61408 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65677 () ListLongMap!1681)

(assert (=> d!38285 (= lt!65668 lt!65677)))

(declare-fun lt!65683 () Unit!3924)

(assert (=> d!38285 (= lt!65683 e!82890)))

(declare-fun c!23235 () Bool)

(declare-fun e!82891 () Bool)

(assert (=> d!38285 (= c!23235 e!82891)))

(declare-fun res!61410 () Bool)

(assert (=> d!38285 (=> (not res!61410) (not e!82891))))

(assert (=> d!38285 (= res!61410 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38285 (= lt!65677 e!82899)))

(declare-fun c!23232 () Bool)

(assert (=> d!38285 (= c!23232 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38285 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38285 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65668)))

(declare-fun b!126958 () Bool)

(declare-fun lt!65672 () Unit!3924)

(assert (=> b!126958 (= e!82890 lt!65672)))

(declare-fun lt!65680 () ListLongMap!1681)

(assert (=> b!126958 (= lt!65680 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65674 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65687 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65687 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65673 () Unit!3924)

(assert (=> b!126958 (= lt!65673 (addStillContains!87 lt!65680 lt!65674 (zeroValue!2646 newMap!16) lt!65687))))

(assert (=> b!126958 (contains!877 (+!170 lt!65680 (tuple2!2577 lt!65674 (zeroValue!2646 newMap!16))) lt!65687)))

(declare-fun lt!65679 () Unit!3924)

(assert (=> b!126958 (= lt!65679 lt!65673)))

(declare-fun lt!65688 () ListLongMap!1681)

(assert (=> b!126958 (= lt!65688 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65685 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65689 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65689 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65675 () Unit!3924)

(assert (=> b!126958 (= lt!65675 (addApplyDifferent!87 lt!65688 lt!65685 (minValue!2646 newMap!16) lt!65689))))

(assert (=> b!126958 (= (apply!111 (+!170 lt!65688 (tuple2!2577 lt!65685 (minValue!2646 newMap!16))) lt!65689) (apply!111 lt!65688 lt!65689))))

(declare-fun lt!65671 () Unit!3924)

(assert (=> b!126958 (= lt!65671 lt!65675)))

(declare-fun lt!65681 () ListLongMap!1681)

(assert (=> b!126958 (= lt!65681 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65686 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65678 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65678 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65670 () Unit!3924)

(assert (=> b!126958 (= lt!65670 (addApplyDifferent!87 lt!65681 lt!65686 (zeroValue!2646 newMap!16) lt!65678))))

(assert (=> b!126958 (= (apply!111 (+!170 lt!65681 (tuple2!2577 lt!65686 (zeroValue!2646 newMap!16))) lt!65678) (apply!111 lt!65681 lt!65678))))

(declare-fun lt!65684 () Unit!3924)

(assert (=> b!126958 (= lt!65684 lt!65670)))

(declare-fun lt!65676 () ListLongMap!1681)

(assert (=> b!126958 (= lt!65676 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65682 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65682 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65669 () (_ BitVec 64))

(assert (=> b!126958 (= lt!65669 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!126958 (= lt!65672 (addApplyDifferent!87 lt!65676 lt!65682 (minValue!2646 newMap!16) lt!65669))))

(assert (=> b!126958 (= (apply!111 (+!170 lt!65676 (tuple2!2577 lt!65682 (minValue!2646 newMap!16))) lt!65669) (apply!111 lt!65676 lt!65669))))

(declare-fun b!126959 () Bool)

(declare-fun res!61413 () Bool)

(assert (=> b!126959 (=> (not res!61413) (not e!82892))))

(declare-fun e!82897 () Bool)

(assert (=> b!126959 (= res!61413 e!82897)))

(declare-fun c!23234 () Bool)

(assert (=> b!126959 (= c!23234 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!126960 () Bool)

(declare-fun e!82901 () Bool)

(assert (=> b!126960 (= e!82901 (= (apply!111 lt!65668 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!126961 () Bool)

(assert (=> b!126961 (= e!82897 e!82901)))

(declare-fun res!61411 () Bool)

(declare-fun call!13688 () Bool)

(assert (=> b!126961 (= res!61411 call!13688)))

(assert (=> b!126961 (=> (not res!61411) (not e!82901))))

(declare-fun b!126962 () Bool)

(assert (=> b!126962 (= e!82893 (= (apply!111 lt!65668 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13683 () Bool)

(declare-fun call!13685 () ListLongMap!1681)

(declare-fun call!13691 () ListLongMap!1681)

(assert (=> bm!13683 (= call!13685 call!13691)))

(declare-fun b!126963 () Bool)

(assert (=> b!126963 (= e!82897 (not call!13688))))

(declare-fun call!13689 () ListLongMap!1681)

(declare-fun bm!13684 () Bool)

(declare-fun call!13690 () ListLongMap!1681)

(assert (=> bm!13684 (= call!13690 (+!170 (ite c!23232 call!13691 (ite c!23236 call!13685 call!13689)) (ite (or c!23232 c!23236) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13685 () Bool)

(assert (=> bm!13685 (= call!13688 (contains!877 lt!65668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126964 () Bool)

(declare-fun call!13686 () ListLongMap!1681)

(assert (=> b!126964 (= e!82896 call!13686)))

(declare-fun b!126965 () Bool)

(assert (=> b!126965 (= e!82900 call!13686)))

(declare-fun b!126966 () Bool)

(assert (=> b!126966 (= e!82891 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13686 () Bool)

(assert (=> bm!13686 (= call!13686 call!13690)))

(declare-fun b!126967 () Bool)

(assert (=> b!126967 (= e!82892 e!82898)))

(declare-fun c!23237 () Bool)

(assert (=> b!126967 (= c!23237 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!126968 () Bool)

(assert (=> b!126968 (= e!82895 (= (apply!111 lt!65668 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!126968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))))))))

(assert (=> b!126968 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126969 () Bool)

(declare-fun res!61407 () Bool)

(assert (=> b!126969 (=> (not res!61407) (not e!82892))))

(assert (=> b!126969 (= res!61407 e!82902)))

(declare-fun res!61414 () Bool)

(assert (=> b!126969 (=> res!61414 e!82902)))

(declare-fun e!82894 () Bool)

(assert (=> b!126969 (= res!61414 (not e!82894))))

(declare-fun res!61409 () Bool)

(assert (=> b!126969 (=> (not res!61409) (not e!82894))))

(assert (=> b!126969 (= res!61409 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126970 () Bool)

(assert (=> b!126970 (= e!82894 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126971 () Bool)

(assert (=> b!126971 (= e!82899 (+!170 call!13690 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!126972 () Bool)

(assert (=> b!126972 (= e!82896 call!13689)))

(declare-fun bm!13687 () Bool)

(assert (=> bm!13687 (= call!13691 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13688 () Bool)

(assert (=> bm!13688 (= call!13689 call!13685)))

(assert (= (and d!38285 c!23232) b!126971))

(assert (= (and d!38285 (not c!23232)) b!126953))

(assert (= (and b!126953 c!23236) b!126965))

(assert (= (and b!126953 (not c!23236)) b!126952))

(assert (= (and b!126952 c!23233) b!126964))

(assert (= (and b!126952 (not c!23233)) b!126972))

(assert (= (or b!126964 b!126972) bm!13688))

(assert (= (or b!126965 bm!13688) bm!13683))

(assert (= (or b!126965 b!126964) bm!13686))

(assert (= (or b!126971 bm!13683) bm!13687))

(assert (= (or b!126971 bm!13686) bm!13684))

(assert (= (and d!38285 res!61410) b!126966))

(assert (= (and d!38285 c!23235) b!126958))

(assert (= (and d!38285 (not c!23235)) b!126954))

(assert (= (and d!38285 res!61408) b!126969))

(assert (= (and b!126969 res!61409) b!126970))

(assert (= (and b!126969 (not res!61414)) b!126956))

(assert (= (and b!126956 res!61406) b!126968))

(assert (= (and b!126969 res!61407) b!126959))

(assert (= (and b!126959 c!23234) b!126961))

(assert (= (and b!126959 (not c!23234)) b!126963))

(assert (= (and b!126961 res!61411) b!126960))

(assert (= (or b!126961 b!126963) bm!13685))

(assert (= (and b!126959 res!61413) b!126967))

(assert (= (and b!126967 c!23237) b!126955))

(assert (= (and b!126967 (not c!23237)) b!126957))

(assert (= (and b!126955 res!61412) b!126962))

(assert (= (or b!126955 b!126957) bm!13682))

(declare-fun b_lambda!5601 () Bool)

(assert (=> (not b_lambda!5601) (not b!126968)))

(assert (=> b!126968 t!6053))

(declare-fun b_and!7835 () Bool)

(assert (= b_and!7831 (and (=> t!6053 result!3847) b_and!7835)))

(assert (=> b!126968 t!6055))

(declare-fun b_and!7837 () Bool)

(assert (= b_and!7833 (and (=> t!6055 result!3849) b_and!7837)))

(assert (=> b!126956 m!147041))

(assert (=> b!126956 m!147041))

(declare-fun m!148357 () Bool)

(assert (=> b!126956 m!148357))

(assert (=> d!38285 m!147051))

(declare-fun m!148359 () Bool)

(assert (=> b!126958 m!148359))

(declare-fun m!148361 () Bool)

(assert (=> b!126958 m!148361))

(assert (=> b!126958 m!148361))

(declare-fun m!148363 () Bool)

(assert (=> b!126958 m!148363))

(declare-fun m!148365 () Bool)

(assert (=> b!126958 m!148365))

(declare-fun m!148367 () Bool)

(assert (=> b!126958 m!148367))

(declare-fun m!148369 () Bool)

(assert (=> b!126958 m!148369))

(declare-fun m!148371 () Bool)

(assert (=> b!126958 m!148371))

(declare-fun m!148373 () Bool)

(assert (=> b!126958 m!148373))

(assert (=> b!126958 m!148365))

(declare-fun m!148375 () Bool)

(assert (=> b!126958 m!148375))

(declare-fun m!148377 () Bool)

(assert (=> b!126958 m!148377))

(declare-fun m!148379 () Bool)

(assert (=> b!126958 m!148379))

(declare-fun m!148381 () Bool)

(assert (=> b!126958 m!148381))

(declare-fun m!148383 () Bool)

(assert (=> b!126958 m!148383))

(assert (=> b!126958 m!147041))

(assert (=> b!126958 m!148367))

(declare-fun m!148385 () Bool)

(assert (=> b!126958 m!148385))

(declare-fun m!148387 () Bool)

(assert (=> b!126958 m!148387))

(declare-fun m!148389 () Bool)

(assert (=> b!126958 m!148389))

(assert (=> b!126958 m!148379))

(declare-fun m!148391 () Bool)

(assert (=> bm!13682 m!148391))

(assert (=> b!126970 m!147041))

(assert (=> b!126970 m!147041))

(assert (=> b!126970 m!147043))

(declare-fun m!148393 () Bool)

(assert (=> b!126962 m!148393))

(assert (=> b!126966 m!147041))

(assert (=> b!126966 m!147041))

(assert (=> b!126966 m!147043))

(declare-fun m!148395 () Bool)

(assert (=> bm!13684 m!148395))

(declare-fun m!148397 () Bool)

(assert (=> b!126971 m!148397))

(assert (=> bm!13687 m!148387))

(assert (=> b!126968 m!147041))

(assert (=> b!126968 m!147145))

(declare-fun m!148399 () Bool)

(assert (=> b!126968 m!148399))

(assert (=> b!126968 m!147145))

(declare-fun m!148401 () Bool)

(assert (=> b!126968 m!148401))

(assert (=> b!126968 m!148399))

(assert (=> b!126968 m!147041))

(declare-fun m!148403 () Bool)

(assert (=> b!126968 m!148403))

(declare-fun m!148405 () Bool)

(assert (=> b!126960 m!148405))

(declare-fun m!148407 () Bool)

(assert (=> bm!13685 m!148407))

(assert (=> b!126405 d!38285))

(declare-fun d!38287 () Bool)

(declare-fun e!82904 () Bool)

(assert (=> d!38287 e!82904))

(declare-fun res!61415 () Bool)

(assert (=> d!38287 (=> res!61415 e!82904)))

(declare-fun lt!65691 () Bool)

(assert (=> d!38287 (= res!61415 (not lt!65691))))

(declare-fun lt!65690 () Bool)

(assert (=> d!38287 (= lt!65691 lt!65690)))

(declare-fun lt!65693 () Unit!3924)

(declare-fun e!82903 () Unit!3924)

(assert (=> d!38287 (= lt!65693 e!82903)))

(declare-fun c!23238 () Bool)

(assert (=> d!38287 (= c!23238 lt!65690)))

(assert (=> d!38287 (= lt!65690 (containsKey!171 (toList!856 lt!65166) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38287 (= (contains!877 lt!65166 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) lt!65691)))

(declare-fun b!126973 () Bool)

(declare-fun lt!65692 () Unit!3924)

(assert (=> b!126973 (= e!82903 lt!65692)))

(assert (=> b!126973 (= lt!65692 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65166) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!126973 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126974 () Bool)

(declare-fun Unit!3956 () Unit!3924)

(assert (=> b!126974 (= e!82903 Unit!3956)))

(declare-fun b!126975 () Bool)

(assert (=> b!126975 (= e!82904 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38287 c!23238) b!126973))

(assert (= (and d!38287 (not c!23238)) b!126974))

(assert (= (and d!38287 (not res!61415)) b!126975))

(assert (=> d!38287 m!147041))

(declare-fun m!148409 () Bool)

(assert (=> d!38287 m!148409))

(assert (=> b!126973 m!147041))

(declare-fun m!148411 () Bool)

(assert (=> b!126973 m!148411))

(assert (=> b!126973 m!147041))

(declare-fun m!148413 () Bool)

(assert (=> b!126973 m!148413))

(assert (=> b!126973 m!148413))

(declare-fun m!148415 () Bool)

(assert (=> b!126973 m!148415))

(assert (=> b!126975 m!147041))

(assert (=> b!126975 m!148413))

(assert (=> b!126975 m!148413))

(assert (=> b!126975 m!148415))

(assert (=> b!126323 d!38287))

(assert (=> d!38021 d!38033))

(assert (=> d!38021 d!38017))

(declare-fun d!38289 () Bool)

(declare-fun e!82906 () Bool)

(assert (=> d!38289 e!82906))

(declare-fun res!61416 () Bool)

(assert (=> d!38289 (=> res!61416 e!82906)))

(declare-fun lt!65695 () Bool)

(assert (=> d!38289 (= res!61416 (not lt!65695))))

(declare-fun lt!65694 () Bool)

(assert (=> d!38289 (= lt!65695 lt!65694)))

(declare-fun lt!65697 () Unit!3924)

(declare-fun e!82905 () Unit!3924)

(assert (=> d!38289 (= lt!65697 e!82905)))

(declare-fun c!23239 () Bool)

(assert (=> d!38289 (= c!23239 lt!65694)))

(assert (=> d!38289 (= lt!65694 (containsKey!171 (toList!856 lt!65028) lt!65029))))

(assert (=> d!38289 (= (contains!877 lt!65028 lt!65029) lt!65695)))

(declare-fun b!126976 () Bool)

(declare-fun lt!65696 () Unit!3924)

(assert (=> b!126976 (= e!82905 lt!65696)))

(assert (=> b!126976 (= lt!65696 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65028) lt!65029))))

(assert (=> b!126976 (isDefined!120 (getValueByKey!167 (toList!856 lt!65028) lt!65029))))

(declare-fun b!126977 () Bool)

(declare-fun Unit!3957 () Unit!3924)

(assert (=> b!126977 (= e!82905 Unit!3957)))

(declare-fun b!126978 () Bool)

(assert (=> b!126978 (= e!82906 (isDefined!120 (getValueByKey!167 (toList!856 lt!65028) lt!65029)))))

(assert (= (and d!38289 c!23239) b!126976))

(assert (= (and d!38289 (not c!23239)) b!126977))

(assert (= (and d!38289 (not res!61416)) b!126978))

(declare-fun m!148417 () Bool)

(assert (=> d!38289 m!148417))

(declare-fun m!148419 () Bool)

(assert (=> b!126976 m!148419))

(assert (=> b!126976 m!147409))

(assert (=> b!126976 m!147409))

(declare-fun m!148421 () Bool)

(assert (=> b!126976 m!148421))

(assert (=> b!126978 m!147409))

(assert (=> b!126978 m!147409))

(assert (=> b!126978 m!148421))

(assert (=> d!38021 d!38289))

(assert (=> d!38021 d!38047))

(declare-fun d!38291 () Bool)

(assert (=> d!38291 (= (apply!111 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65029) (apply!111 lt!65028 lt!65029))))

(assert (=> d!38291 true))

(declare-fun _$34!947 () Unit!3924)

(assert (=> d!38291 (= (choose!764 lt!65028 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65029) _$34!947)))

(declare-fun bs!5260 () Bool)

(assert (= bs!5260 d!38291))

(assert (=> bs!5260 m!146901))

(assert (=> bs!5260 m!146901))

(assert (=> bs!5260 m!146903))

(assert (=> bs!5260 m!146925))

(assert (=> d!38021 d!38291))

(declare-fun d!38293 () Bool)

(assert (=> d!38293 (= (apply!111 lt!65390 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1447 (getValueByKey!167 (toList!856 lt!65390) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5261 () Bool)

(assert (= bs!5261 d!38293))

(assert (=> bs!5261 m!146895))

(declare-fun m!148423 () Bool)

(assert (=> bs!5261 m!148423))

(assert (=> bs!5261 m!148423))

(declare-fun m!148425 () Bool)

(assert (=> bs!5261 m!148425))

(assert (=> b!126506 d!38293))

(assert (=> b!126506 d!37953))

(declare-fun d!38295 () Bool)

(assert (=> d!38295 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (array!4702 (store (arr!2226 (_values!2766 newMap!16)) (index!3236 lt!65119) (ValueCellFull!1077 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2490 (_values!2766 newMap!16))) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(assert (=> d!38295 true))

(declare-fun _$5!125 () Unit!3924)

(assert (=> d!38295 (= (choose!763 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (index!3236 lt!65119) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)) _$5!125)))

(declare-fun bs!5262 () Bool)

(assert (= bs!5262 d!38295))

(assert (=> bs!5262 m!146893))

(assert (=> bs!5262 m!146893))

(assert (=> bs!5262 m!147185))

(assert (=> bs!5262 m!146967))

(assert (=> bs!5262 m!147243))

(assert (=> d!37993 d!38295))

(assert (=> d!37993 d!38171))

(declare-fun d!38297 () Bool)

(declare-fun e!82908 () Bool)

(assert (=> d!38297 e!82908))

(declare-fun res!61417 () Bool)

(assert (=> d!38297 (=> res!61417 e!82908)))

(declare-fun lt!65699 () Bool)

(assert (=> d!38297 (= res!61417 (not lt!65699))))

(declare-fun lt!65698 () Bool)

(assert (=> d!38297 (= lt!65699 lt!65698)))

(declare-fun lt!65701 () Unit!3924)

(declare-fun e!82907 () Unit!3924)

(assert (=> d!38297 (= lt!65701 e!82907)))

(declare-fun c!23240 () Bool)

(assert (=> d!38297 (= c!23240 lt!65698)))

(assert (=> d!38297 (= lt!65698 (containsKey!171 (toList!856 lt!65166) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38297 (= (contains!877 lt!65166 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65699)))

(declare-fun b!126980 () Bool)

(declare-fun lt!65700 () Unit!3924)

(assert (=> b!126980 (= e!82907 lt!65700)))

(assert (=> b!126980 (= lt!65700 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65166) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126980 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!126981 () Bool)

(declare-fun Unit!3958 () Unit!3924)

(assert (=> b!126981 (= e!82907 Unit!3958)))

(declare-fun b!126982 () Bool)

(assert (=> b!126982 (= e!82908 (isDefined!120 (getValueByKey!167 (toList!856 lt!65166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38297 c!23240) b!126980))

(assert (= (and d!38297 (not c!23240)) b!126981))

(assert (= (and d!38297 (not res!61417)) b!126982))

(declare-fun m!148427 () Bool)

(assert (=> d!38297 m!148427))

(declare-fun m!148429 () Bool)

(assert (=> b!126980 m!148429))

(declare-fun m!148431 () Bool)

(assert (=> b!126980 m!148431))

(assert (=> b!126980 m!148431))

(declare-fun m!148433 () Bool)

(assert (=> b!126980 m!148433))

(assert (=> b!126982 m!148431))

(assert (=> b!126982 m!148431))

(assert (=> b!126982 m!148433))

(assert (=> bm!13596 d!38297))

(declare-fun d!38299 () Bool)

(assert (=> d!38299 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65702 () Unit!3924)

(assert (=> d!38299 (= lt!65702 (choose!761 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82909 () Bool)

(assert (=> d!38299 e!82909))

(declare-fun res!61418 () Bool)

(assert (=> d!38299 (=> (not res!61418) (not e!82909))))

(assert (=> d!38299 (= res!61418 (isStrictlySorted!317 (toList!856 lt!65008)))))

(assert (=> d!38299 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000) lt!65702)))

(declare-fun b!126983 () Bool)

(assert (=> b!126983 (= e!82909 (containsKey!171 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38299 res!61418) b!126983))

(assert (=> d!38299 m!147231))

(assert (=> d!38299 m!147231))

(assert (=> d!38299 m!147233))

(declare-fun m!148435 () Bool)

(assert (=> d!38299 m!148435))

(declare-fun m!148437 () Bool)

(assert (=> d!38299 m!148437))

(assert (=> b!126983 m!147227))

(assert (=> b!126397 d!38299))

(declare-fun d!38301 () Bool)

(assert (=> d!38301 (= (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!396 (getValueByKey!167 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5263 () Bool)

(assert (= bs!5263 d!38301))

(assert (=> bs!5263 m!147231))

(declare-fun m!148439 () Bool)

(assert (=> bs!5263 m!148439))

(assert (=> b!126397 d!38301))

(assert (=> b!126397 d!38143))

(declare-fun b!126984 () Bool)

(declare-fun e!82911 () Bool)

(declare-fun call!13692 () Bool)

(assert (=> b!126984 (= e!82911 call!13692)))

(declare-fun b!126985 () Bool)

(assert (=> b!126985 (= e!82911 call!13692)))

(declare-fun b!126986 () Bool)

(declare-fun e!82910 () Bool)

(assert (=> b!126986 (= e!82910 e!82911)))

(declare-fun c!23241 () Bool)

(assert (=> b!126986 (= c!23241 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun bm!13689 () Bool)

(assert (=> bm!13689 (= call!13692 (arrayNoDuplicates!0 (_keys!4516 (_2!1300 lt!65097)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23241 (Cons!1696 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!38303 () Bool)

(declare-fun res!61419 () Bool)

(declare-fun e!82913 () Bool)

(assert (=> d!38303 (=> res!61419 e!82913)))

(assert (=> d!38303 (= res!61419 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(assert (=> d!38303 (= (arrayNoDuplicates!0 (_keys!4516 (_2!1300 lt!65097)) #b00000000000000000000000000000000 Nil!1697) e!82913)))

(declare-fun b!126987 () Bool)

(assert (=> b!126987 (= e!82913 e!82910)))

(declare-fun res!61421 () Bool)

(assert (=> b!126987 (=> (not res!61421) (not e!82910))))

(declare-fun e!82912 () Bool)

(assert (=> b!126987 (= res!61421 (not e!82912))))

(declare-fun res!61420 () Bool)

(assert (=> b!126987 (=> (not res!61420) (not e!82912))))

(assert (=> b!126987 (= res!61420 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun b!126988 () Bool)

(assert (=> b!126988 (= e!82912 (contains!880 Nil!1697 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(assert (= (and d!38303 (not res!61419)) b!126987))

(assert (= (and b!126987 res!61420) b!126988))

(assert (= (and b!126987 res!61421) b!126986))

(assert (= (and b!126986 c!23241) b!126985))

(assert (= (and b!126986 (not c!23241)) b!126984))

(assert (= (or b!126985 b!126984) bm!13689))

(declare-fun m!148441 () Bool)

(assert (=> b!126986 m!148441))

(assert (=> b!126986 m!148441))

(declare-fun m!148443 () Bool)

(assert (=> b!126986 m!148443))

(assert (=> bm!13689 m!148441))

(declare-fun m!148445 () Bool)

(assert (=> bm!13689 m!148445))

(assert (=> b!126987 m!148441))

(assert (=> b!126987 m!148441))

(assert (=> b!126987 m!148443))

(assert (=> b!126988 m!148441))

(assert (=> b!126988 m!148441))

(declare-fun m!148447 () Bool)

(assert (=> b!126988 m!148447))

(assert (=> b!126463 d!38303))

(declare-fun d!38305 () Bool)

(assert (=> d!38305 (arrayContainsKey!0 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000)))

(declare-fun lt!65703 () Unit!3924)

(assert (=> d!38305 (= lt!65703 (choose!13 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000))))

(assert (=> d!38305 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!38305 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000) lt!65703)))

(declare-fun bs!5264 () Bool)

(assert (= bs!5264 d!38305))

(assert (=> bs!5264 m!147083))

(declare-fun m!148449 () Bool)

(assert (=> bs!5264 m!148449))

(assert (=> b!126297 d!38305))

(declare-fun d!38307 () Bool)

(declare-fun res!61422 () Bool)

(declare-fun e!82914 () Bool)

(assert (=> d!38307 (=> res!61422 e!82914)))

(assert (=> d!38307 (= res!61422 (= (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) lt!65154))))

(assert (=> d!38307 (= (arrayContainsKey!0 (_keys!4516 newMap!16) lt!65154 #b00000000000000000000000000000000) e!82914)))

(declare-fun b!126989 () Bool)

(declare-fun e!82915 () Bool)

(assert (=> b!126989 (= e!82914 e!82915)))

(declare-fun res!61423 () Bool)

(assert (=> b!126989 (=> (not res!61423) (not e!82915))))

(assert (=> b!126989 (= res!61423 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!126990 () Bool)

(assert (=> b!126990 (= e!82915 (arrayContainsKey!0 (_keys!4516 newMap!16) lt!65154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38307 (not res!61422)) b!126989))

(assert (= (and b!126989 res!61423) b!126990))

(assert (=> d!38307 m!147041))

(declare-fun m!148451 () Bool)

(assert (=> b!126990 m!148451))

(assert (=> b!126297 d!38307))

(declare-fun b!126991 () Bool)

(declare-fun e!82917 () SeekEntryResult!270)

(declare-fun e!82916 () SeekEntryResult!270)

(assert (=> b!126991 (= e!82917 e!82916)))

(declare-fun lt!65704 () (_ BitVec 64))

(declare-fun lt!65706 () SeekEntryResult!270)

(assert (=> b!126991 (= lt!65704 (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65706)))))

(declare-fun c!23242 () Bool)

(assert (=> b!126991 (= c!23242 (= lt!65704 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!126992 () Bool)

(assert (=> b!126992 (= e!82917 Undefined!270)))

(declare-fun b!126993 () Bool)

(declare-fun c!23243 () Bool)

(assert (=> b!126993 (= c!23243 (= lt!65704 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!82918 () SeekEntryResult!270)

(assert (=> b!126993 (= e!82916 e!82918)))

(declare-fun b!126994 () Bool)

(assert (=> b!126994 (= e!82918 (MissingZero!270 (index!3237 lt!65706)))))

(declare-fun b!126995 () Bool)

(assert (=> b!126995 (= e!82916 (Found!270 (index!3237 lt!65706)))))

(declare-fun b!126996 () Bool)

(assert (=> b!126996 (= e!82918 (seekKeyOrZeroReturnVacant!0 (x!14963 lt!65706) (index!3237 lt!65706) (index!3237 lt!65706) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun d!38309 () Bool)

(declare-fun lt!65705 () SeekEntryResult!270)

(assert (=> d!38309 (and (or ((_ is Undefined!270) lt!65705) (not ((_ is Found!270) lt!65705)) (and (bvsge (index!3236 lt!65705) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65705) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65705) ((_ is Found!270) lt!65705) (not ((_ is MissingZero!270) lt!65705)) (and (bvsge (index!3235 lt!65705) #b00000000000000000000000000000000) (bvslt (index!3235 lt!65705) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65705) ((_ is Found!270) lt!65705) ((_ is MissingZero!270) lt!65705) (not ((_ is MissingVacant!270) lt!65705)) (and (bvsge (index!3238 lt!65705) #b00000000000000000000000000000000) (bvslt (index!3238 lt!65705) (size!2489 (_keys!4516 newMap!16))))) (or ((_ is Undefined!270) lt!65705) (ite ((_ is Found!270) lt!65705) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65705)) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!270) lt!65705) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65705)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!270) lt!65705) (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65705)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38309 (= lt!65705 e!82917)))

(declare-fun c!23244 () Bool)

(assert (=> d!38309 (= c!23244 (and ((_ is Intermediate!270) lt!65706) (undefined!1082 lt!65706)))))

(assert (=> d!38309 (= lt!65706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (mask!7039 newMap!16)) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(assert (=> d!38309 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38309 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) (_keys!4516 newMap!16) (mask!7039 newMap!16)) lt!65705)))

(assert (= (and d!38309 c!23244) b!126992))

(assert (= (and d!38309 (not c!23244)) b!126991))

(assert (= (and b!126991 c!23242) b!126995))

(assert (= (and b!126991 (not c!23242)) b!126993))

(assert (= (and b!126993 c!23243) b!126994))

(assert (= (and b!126993 (not c!23243)) b!126996))

(declare-fun m!148453 () Bool)

(assert (=> b!126991 m!148453))

(assert (=> b!126996 m!147041))

(declare-fun m!148455 () Bool)

(assert (=> b!126996 m!148455))

(declare-fun m!148457 () Bool)

(assert (=> d!38309 m!148457))

(declare-fun m!148459 () Bool)

(assert (=> d!38309 m!148459))

(declare-fun m!148461 () Bool)

(assert (=> d!38309 m!148461))

(assert (=> d!38309 m!147041))

(declare-fun m!148463 () Bool)

(assert (=> d!38309 m!148463))

(declare-fun m!148465 () Bool)

(assert (=> d!38309 m!148465))

(assert (=> d!38309 m!147051))

(assert (=> d!38309 m!147041))

(assert (=> d!38309 m!148461))

(assert (=> b!126297 d!38309))

(declare-fun d!38311 () Bool)

(assert (=> d!38311 (= (isDefined!120 (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))) (not (isEmpty!396 (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))))

(declare-fun bs!5265 () Bool)

(assert (= bs!5265 d!38311))

(assert (=> bs!5265 m!147395))

(declare-fun m!148467 () Bool)

(assert (=> bs!5265 m!148467))

(assert (=> b!126466 d!38311))

(declare-fun c!23245 () Bool)

(declare-fun d!38313 () Bool)

(assert (=> d!38313 (= c!23245 (and ((_ is Cons!1694) (toList!856 call!13583)) (= (_1!1299 (h!2296 (toList!856 call!13583))) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))))

(declare-fun e!82919 () Option!173)

(assert (=> d!38313 (= (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))) e!82919)))

(declare-fun b!126998 () Bool)

(declare-fun e!82920 () Option!173)

(assert (=> b!126998 (= e!82919 e!82920)))

(declare-fun c!23246 () Bool)

(assert (=> b!126998 (= c!23246 (and ((_ is Cons!1694) (toList!856 call!13583)) (not (= (_1!1299 (h!2296 (toList!856 call!13583))) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))))

(declare-fun b!127000 () Bool)

(assert (=> b!127000 (= e!82920 None!171)))

(declare-fun b!126999 () Bool)

(assert (=> b!126999 (= e!82920 (getValueByKey!167 (t!6045 (toList!856 call!13583)) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(declare-fun b!126997 () Bool)

(assert (=> b!126997 (= e!82919 (Some!172 (_2!1299 (h!2296 (toList!856 call!13583)))))))

(assert (= (and d!38313 c!23245) b!126997))

(assert (= (and d!38313 (not c!23245)) b!126998))

(assert (= (and b!126998 c!23246) b!126999))

(assert (= (and b!126998 (not c!23246)) b!127000))

(declare-fun m!148469 () Bool)

(assert (=> b!126999 m!148469))

(assert (=> b!126466 d!38313))

(assert (=> bm!13611 d!37977))

(assert (=> bm!13591 d!38007))

(declare-fun d!38315 () Bool)

(declare-fun e!82921 () Bool)

(assert (=> d!38315 e!82921))

(declare-fun res!61424 () Bool)

(assert (=> d!38315 (=> (not res!61424) (not e!82921))))

(declare-fun lt!65709 () ListLongMap!1681)

(assert (=> d!38315 (= res!61424 (contains!877 lt!65709 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65707 () List!1698)

(assert (=> d!38315 (= lt!65709 (ListLongMap!1682 lt!65707))))

(declare-fun lt!65708 () Unit!3924)

(declare-fun lt!65710 () Unit!3924)

(assert (=> d!38315 (= lt!65708 lt!65710)))

(assert (=> d!38315 (= (getValueByKey!167 lt!65707 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38315 (= lt!65710 (lemmaContainsTupThenGetReturnValue!82 lt!65707 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38315 (= lt!65707 (insertStrictlySorted!85 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38315 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65709)))

(declare-fun b!127001 () Bool)

(declare-fun res!61425 () Bool)

(assert (=> b!127001 (=> (not res!61425) (not e!82921))))

(assert (=> b!127001 (= res!61425 (= (getValueByKey!167 (toList!856 lt!65709) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127002 () Bool)

(assert (=> b!127002 (= e!82921 (contains!879 (toList!856 lt!65709) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38315 res!61424) b!127001))

(assert (= (and b!127001 res!61425) b!127002))

(declare-fun m!148471 () Bool)

(assert (=> d!38315 m!148471))

(declare-fun m!148473 () Bool)

(assert (=> d!38315 m!148473))

(declare-fun m!148475 () Bool)

(assert (=> d!38315 m!148475))

(declare-fun m!148477 () Bool)

(assert (=> d!38315 m!148477))

(declare-fun m!148479 () Bool)

(assert (=> b!127001 m!148479))

(declare-fun m!148481 () Bool)

(assert (=> b!127002 m!148481))

(assert (=> d!38053 d!38315))

(declare-fun d!38317 () Bool)

(assert (=> d!38317 (= (+!170 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(assert (=> d!38317 true))

(declare-fun _$8!109 () Unit!3924)

(assert (=> d!38317 (= (choose!766 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2783 newMap!16)) _$8!109)))

(declare-fun bs!5266 () Bool)

(assert (= bs!5266 d!38317))

(assert (=> bs!5266 m!146893))

(assert (=> bs!5266 m!146893))

(assert (=> bs!5266 m!147537))

(assert (=> bs!5266 m!146845))

(assert (=> bs!5266 m!147533))

(assert (=> d!38053 d!38317))

(assert (=> d!38053 d!37997))

(declare-fun b!127003 () Bool)

(declare-fun c!23248 () Bool)

(assert (=> b!127003 (= c!23248 (and (not (= (bvand lt!65106 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!65106 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82932 () ListLongMap!1681)

(declare-fun e!82928 () ListLongMap!1681)

(assert (=> b!127003 (= e!82932 e!82928)))

(declare-fun bm!13690 () Bool)

(declare-fun call!13695 () Bool)

(declare-fun lt!65711 () ListLongMap!1681)

(assert (=> bm!13690 (= call!13695 (contains!877 lt!65711 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127004 () Bool)

(declare-fun e!82931 () ListLongMap!1681)

(assert (=> b!127004 (= e!82931 e!82932)))

(declare-fun c!23251 () Bool)

(assert (=> b!127004 (= c!23251 (and (not (= (bvand lt!65106 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!65106 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127005 () Bool)

(declare-fun e!82922 () Unit!3924)

(declare-fun Unit!3959 () Unit!3924)

(assert (=> b!127005 (= e!82922 Unit!3959)))

(declare-fun b!127006 () Bool)

(declare-fun e!82930 () Bool)

(declare-fun e!82925 () Bool)

(assert (=> b!127006 (= e!82930 e!82925)))

(declare-fun res!61432 () Bool)

(assert (=> b!127006 (= res!61432 call!13695)))

(assert (=> b!127006 (=> (not res!61432) (not e!82925))))

(declare-fun b!127007 () Bool)

(declare-fun e!82934 () Bool)

(declare-fun e!82927 () Bool)

(assert (=> b!127007 (= e!82934 e!82927)))

(declare-fun res!61426 () Bool)

(assert (=> b!127007 (=> (not res!61426) (not e!82927))))

(assert (=> b!127007 (= res!61426 (contains!877 lt!65711 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127008 () Bool)

(assert (=> b!127008 (= e!82930 (not call!13695))))

(declare-fun d!38319 () Bool)

(declare-fun e!82924 () Bool)

(assert (=> d!38319 e!82924))

(declare-fun res!61428 () Bool)

(assert (=> d!38319 (=> (not res!61428) (not e!82924))))

(assert (=> d!38319 (= res!61428 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65720 () ListLongMap!1681)

(assert (=> d!38319 (= lt!65711 lt!65720)))

(declare-fun lt!65726 () Unit!3924)

(assert (=> d!38319 (= lt!65726 e!82922)))

(declare-fun c!23250 () Bool)

(declare-fun e!82923 () Bool)

(assert (=> d!38319 (= c!23250 e!82923)))

(declare-fun res!61430 () Bool)

(assert (=> d!38319 (=> (not res!61430) (not e!82923))))

(assert (=> d!38319 (= res!61430 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38319 (= lt!65720 e!82931)))

(declare-fun c!23247 () Bool)

(assert (=> d!38319 (= c!23247 (and (not (= (bvand lt!65106 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!65106 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38319 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38319 (= (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65711)))

(declare-fun b!127009 () Bool)

(declare-fun lt!65715 () Unit!3924)

(assert (=> b!127009 (= e!82922 lt!65715)))

(declare-fun lt!65723 () ListLongMap!1681)

(assert (=> b!127009 (= lt!65723 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65717 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65730 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65730 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65716 () Unit!3924)

(assert (=> b!127009 (= lt!65716 (addStillContains!87 lt!65723 lt!65717 (zeroValue!2646 newMap!16) lt!65730))))

(assert (=> b!127009 (contains!877 (+!170 lt!65723 (tuple2!2577 lt!65717 (zeroValue!2646 newMap!16))) lt!65730)))

(declare-fun lt!65722 () Unit!3924)

(assert (=> b!127009 (= lt!65722 lt!65716)))

(declare-fun lt!65731 () ListLongMap!1681)

(assert (=> b!127009 (= lt!65731 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65728 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65728 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65732 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65732 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65718 () Unit!3924)

(assert (=> b!127009 (= lt!65718 (addApplyDifferent!87 lt!65731 lt!65728 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65732))))

(assert (=> b!127009 (= (apply!111 (+!170 lt!65731 (tuple2!2577 lt!65728 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65732) (apply!111 lt!65731 lt!65732))))

(declare-fun lt!65714 () Unit!3924)

(assert (=> b!127009 (= lt!65714 lt!65718)))

(declare-fun lt!65724 () ListLongMap!1681)

(assert (=> b!127009 (= lt!65724 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65729 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65721 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65721 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65713 () Unit!3924)

(assert (=> b!127009 (= lt!65713 (addApplyDifferent!87 lt!65724 lt!65729 (zeroValue!2646 newMap!16) lt!65721))))

(assert (=> b!127009 (= (apply!111 (+!170 lt!65724 (tuple2!2577 lt!65729 (zeroValue!2646 newMap!16))) lt!65721) (apply!111 lt!65724 lt!65721))))

(declare-fun lt!65727 () Unit!3924)

(assert (=> b!127009 (= lt!65727 lt!65713)))

(declare-fun lt!65719 () ListLongMap!1681)

(assert (=> b!127009 (= lt!65719 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65725 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65725 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65712 () (_ BitVec 64))

(assert (=> b!127009 (= lt!65712 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127009 (= lt!65715 (addApplyDifferent!87 lt!65719 lt!65725 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!65712))))

(assert (=> b!127009 (= (apply!111 (+!170 lt!65719 (tuple2!2577 lt!65725 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65712) (apply!111 lt!65719 lt!65712))))

(declare-fun b!127010 () Bool)

(declare-fun res!61433 () Bool)

(assert (=> b!127010 (=> (not res!61433) (not e!82924))))

(declare-fun e!82929 () Bool)

(assert (=> b!127010 (= res!61433 e!82929)))

(declare-fun c!23249 () Bool)

(assert (=> b!127010 (= c!23249 (not (= (bvand lt!65106 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127011 () Bool)

(declare-fun e!82933 () Bool)

(assert (=> b!127011 (= e!82933 (= (apply!111 lt!65711 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!127012 () Bool)

(assert (=> b!127012 (= e!82929 e!82933)))

(declare-fun res!61431 () Bool)

(declare-fun call!13696 () Bool)

(assert (=> b!127012 (= res!61431 call!13696)))

(assert (=> b!127012 (=> (not res!61431) (not e!82933))))

(declare-fun b!127013 () Bool)

(assert (=> b!127013 (= e!82925 (= (apply!111 lt!65711 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!13691 () Bool)

(declare-fun call!13693 () ListLongMap!1681)

(declare-fun call!13699 () ListLongMap!1681)

(assert (=> bm!13691 (= call!13693 call!13699)))

(declare-fun b!127014 () Bool)

(assert (=> b!127014 (= e!82929 (not call!13696))))

(declare-fun bm!13692 () Bool)

(declare-fun call!13698 () ListLongMap!1681)

(declare-fun call!13697 () ListLongMap!1681)

(assert (=> bm!13692 (= call!13698 (+!170 (ite c!23247 call!13699 (ite c!23251 call!13693 call!13697)) (ite (or c!23247 c!23251) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13693 () Bool)

(assert (=> bm!13693 (= call!13696 (contains!877 lt!65711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127015 () Bool)

(declare-fun call!13694 () ListLongMap!1681)

(assert (=> b!127015 (= e!82928 call!13694)))

(declare-fun b!127016 () Bool)

(assert (=> b!127016 (= e!82932 call!13694)))

(declare-fun b!127017 () Bool)

(assert (=> b!127017 (= e!82923 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13694 () Bool)

(assert (=> bm!13694 (= call!13694 call!13698)))

(declare-fun b!127018 () Bool)

(assert (=> b!127018 (= e!82924 e!82930)))

(declare-fun c!23252 () Bool)

(assert (=> b!127018 (= c!23252 (not (= (bvand lt!65106 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127019 () Bool)

(assert (=> b!127019 (= e!82927 (= (apply!111 lt!65711 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (_values!2766 newMap!16)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_values!2766 newMap!16))))))

(assert (=> b!127019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127020 () Bool)

(declare-fun res!61427 () Bool)

(assert (=> b!127020 (=> (not res!61427) (not e!82924))))

(assert (=> b!127020 (= res!61427 e!82934)))

(declare-fun res!61434 () Bool)

(assert (=> b!127020 (=> res!61434 e!82934)))

(declare-fun e!82926 () Bool)

(assert (=> b!127020 (= res!61434 (not e!82926))))

(declare-fun res!61429 () Bool)

(assert (=> b!127020 (=> (not res!61429) (not e!82926))))

(assert (=> b!127020 (= res!61429 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127021 () Bool)

(assert (=> b!127021 (= e!82926 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127022 () Bool)

(assert (=> b!127022 (= e!82931 (+!170 call!13698 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!127023 () Bool)

(assert (=> b!127023 (= e!82928 call!13697)))

(declare-fun bm!13695 () Bool)

(assert (=> bm!13695 (= call!13699 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) lt!65106 (zeroValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13696 () Bool)

(assert (=> bm!13696 (= call!13697 call!13693)))

(assert (= (and d!38319 c!23247) b!127022))

(assert (= (and d!38319 (not c!23247)) b!127004))

(assert (= (and b!127004 c!23251) b!127016))

(assert (= (and b!127004 (not c!23251)) b!127003))

(assert (= (and b!127003 c!23248) b!127015))

(assert (= (and b!127003 (not c!23248)) b!127023))

(assert (= (or b!127015 b!127023) bm!13696))

(assert (= (or b!127016 bm!13696) bm!13691))

(assert (= (or b!127016 b!127015) bm!13694))

(assert (= (or b!127022 bm!13691) bm!13695))

(assert (= (or b!127022 bm!13694) bm!13692))

(assert (= (and d!38319 res!61430) b!127017))

(assert (= (and d!38319 c!23250) b!127009))

(assert (= (and d!38319 (not c!23250)) b!127005))

(assert (= (and d!38319 res!61428) b!127020))

(assert (= (and b!127020 res!61429) b!127021))

(assert (= (and b!127020 (not res!61434)) b!127007))

(assert (= (and b!127007 res!61426) b!127019))

(assert (= (and b!127020 res!61427) b!127010))

(assert (= (and b!127010 c!23249) b!127012))

(assert (= (and b!127010 (not c!23249)) b!127014))

(assert (= (and b!127012 res!61431) b!127011))

(assert (= (or b!127012 b!127014) bm!13693))

(assert (= (and b!127010 res!61433) b!127018))

(assert (= (and b!127018 c!23252) b!127006))

(assert (= (and b!127018 (not c!23252)) b!127008))

(assert (= (and b!127006 res!61432) b!127013))

(assert (= (or b!127006 b!127008) bm!13690))

(declare-fun b_lambda!5603 () Bool)

(assert (=> (not b_lambda!5603) (not b!127019)))

(assert (=> b!127019 t!6053))

(declare-fun b_and!7839 () Bool)

(assert (= b_and!7835 (and (=> t!6053 result!3847) b_and!7839)))

(assert (=> b!127019 t!6055))

(declare-fun b_and!7841 () Bool)

(assert (= b_and!7837 (and (=> t!6055 result!3849) b_and!7841)))

(assert (=> b!127007 m!147041))

(assert (=> b!127007 m!147041))

(declare-fun m!148483 () Bool)

(assert (=> b!127007 m!148483))

(assert (=> d!38319 m!147051))

(declare-fun m!148485 () Bool)

(assert (=> b!127009 m!148485))

(declare-fun m!148487 () Bool)

(assert (=> b!127009 m!148487))

(assert (=> b!127009 m!148487))

(declare-fun m!148489 () Bool)

(assert (=> b!127009 m!148489))

(declare-fun m!148491 () Bool)

(assert (=> b!127009 m!148491))

(declare-fun m!148493 () Bool)

(assert (=> b!127009 m!148493))

(declare-fun m!148495 () Bool)

(assert (=> b!127009 m!148495))

(declare-fun m!148497 () Bool)

(assert (=> b!127009 m!148497))

(assert (=> b!127009 m!146845))

(declare-fun m!148499 () Bool)

(assert (=> b!127009 m!148499))

(assert (=> b!127009 m!148491))

(declare-fun m!148501 () Bool)

(assert (=> b!127009 m!148501))

(declare-fun m!148503 () Bool)

(assert (=> b!127009 m!148503))

(declare-fun m!148505 () Bool)

(assert (=> b!127009 m!148505))

(declare-fun m!148507 () Bool)

(assert (=> b!127009 m!148507))

(declare-fun m!148509 () Bool)

(assert (=> b!127009 m!148509))

(assert (=> b!127009 m!147041))

(assert (=> b!127009 m!148493))

(declare-fun m!148511 () Bool)

(assert (=> b!127009 m!148511))

(assert (=> b!127009 m!146845))

(declare-fun m!148513 () Bool)

(assert (=> b!127009 m!148513))

(assert (=> b!127009 m!146845))

(declare-fun m!148515 () Bool)

(assert (=> b!127009 m!148515))

(assert (=> b!127009 m!148505))

(declare-fun m!148517 () Bool)

(assert (=> bm!13690 m!148517))

(assert (=> b!127021 m!147041))

(assert (=> b!127021 m!147041))

(assert (=> b!127021 m!147043))

(declare-fun m!148519 () Bool)

(assert (=> b!127013 m!148519))

(assert (=> b!127017 m!147041))

(assert (=> b!127017 m!147041))

(assert (=> b!127017 m!147043))

(declare-fun m!148521 () Bool)

(assert (=> bm!13692 m!148521))

(declare-fun m!148523 () Bool)

(assert (=> b!127022 m!148523))

(assert (=> bm!13695 m!146845))

(assert (=> bm!13695 m!148513))

(assert (=> b!127019 m!147041))

(assert (=> b!127019 m!147145))

(assert (=> b!127019 m!147295))

(assert (=> b!127019 m!147145))

(assert (=> b!127019 m!147297))

(assert (=> b!127019 m!147295))

(assert (=> b!127019 m!147041))

(declare-fun m!148525 () Bool)

(assert (=> b!127019 m!148525))

(declare-fun m!148527 () Bool)

(assert (=> b!127011 m!148527))

(declare-fun m!148529 () Bool)

(assert (=> bm!13693 m!148529))

(assert (=> d!38053 d!38319))

(assert (=> d!38053 d!38171))

(declare-fun d!38321 () Bool)

(assert (=> d!38321 (= (get!1446 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!126219 d!38321))

(declare-fun d!38323 () Bool)

(assert (=> d!38323 (= (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) (not (isEmpty!396 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun bs!5267 () Bool)

(assert (= bs!5267 d!38323))

(assert (=> bs!5267 m!147249))

(declare-fun m!148531 () Bool)

(assert (=> bs!5267 m!148531))

(assert (=> b!126408 d!38323))

(declare-fun c!23253 () Bool)

(declare-fun d!38325 () Bool)

(assert (=> d!38325 (= c!23253 (and ((_ is Cons!1694) (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (= (_1!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun e!82935 () Option!173)

(assert (=> d!38325 (= (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82935)))

(declare-fun b!127025 () Bool)

(declare-fun e!82936 () Option!173)

(assert (=> b!127025 (= e!82935 e!82936)))

(declare-fun c!23254 () Bool)

(assert (=> b!127025 (= c!23254 (and ((_ is Cons!1694) (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (not (= (_1!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun b!127027 () Bool)

(assert (=> b!127027 (= e!82936 None!171)))

(declare-fun b!127026 () Bool)

(assert (=> b!127026 (= e!82936 (getValueByKey!167 (t!6045 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!127024 () Bool)

(assert (=> b!127024 (= e!82935 (Some!172 (_2!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))))))

(assert (= (and d!38325 c!23253) b!127024))

(assert (= (and d!38325 (not c!23253)) b!127025))

(assert (= (and b!127025 c!23254) b!127026))

(assert (= (and b!127025 (not c!23254)) b!127027))

(assert (=> b!127026 m!146847))

(declare-fun m!148533 () Bool)

(assert (=> b!127026 m!148533))

(assert (=> b!126408 d!38325))

(declare-fun b!127028 () Bool)

(declare-fun e!82938 () (_ BitVec 32))

(declare-fun call!13700 () (_ BitVec 32))

(assert (=> b!127028 (= e!82938 call!13700)))

(declare-fun d!38327 () Bool)

(declare-fun lt!65733 () (_ BitVec 32))

(assert (=> d!38327 (and (bvsge lt!65733 #b00000000000000000000000000000000) (bvsle lt!65733 (bvsub (size!2489 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!82937 () (_ BitVec 32))

(assert (=> d!38327 (= lt!65733 e!82937)))

(declare-fun c!23256 () Bool)

(assert (=> d!38327 (= c!23256 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38327 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2489 (_keys!4516 newMap!16)) (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38327 (= (arrayCountValidKeys!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))) lt!65733)))

(declare-fun b!127029 () Bool)

(assert (=> b!127029 (= e!82937 #b00000000000000000000000000000000)))

(declare-fun bm!13697 () Bool)

(assert (=> bm!13697 (= call!13700 (arrayCountValidKeys!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127030 () Bool)

(assert (=> b!127030 (= e!82938 (bvadd #b00000000000000000000000000000001 call!13700))))

(declare-fun b!127031 () Bool)

(assert (=> b!127031 (= e!82937 e!82938)))

(declare-fun c!23255 () Bool)

(assert (=> b!127031 (= c!23255 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!38327 c!23256) b!127029))

(assert (= (and d!38327 (not c!23256)) b!127031))

(assert (= (and b!127031 c!23255) b!127030))

(assert (= (and b!127031 (not c!23255)) b!127028))

(assert (= (or b!127030 b!127028) bm!13697))

(declare-fun m!148535 () Bool)

(assert (=> bm!13697 m!148535))

(declare-fun m!148537 () Bool)

(assert (=> b!127031 m!148537))

(assert (=> b!127031 m!148537))

(declare-fun m!148539 () Bool)

(assert (=> b!127031 m!148539))

(assert (=> bm!13586 d!38327))

(assert (=> d!38031 d!38019))

(assert (=> d!38031 d!38041))

(assert (=> d!38031 d!38025))

(declare-fun d!38329 () Bool)

(assert (=> d!38329 (= (apply!111 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65009) (apply!111 lt!65016 lt!65009))))

(assert (=> d!38329 true))

(declare-fun _$34!948 () Unit!3924)

(assert (=> d!38329 (= (choose!764 lt!65016 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65009) _$34!948)))

(declare-fun bs!5268 () Bool)

(assert (= bs!5268 d!38329))

(assert (=> bs!5268 m!146919))

(assert (=> bs!5268 m!146919))

(assert (=> bs!5268 m!146921))

(assert (=> bs!5268 m!146911))

(assert (=> d!38031 d!38329))

(declare-fun d!38331 () Bool)

(declare-fun e!82940 () Bool)

(assert (=> d!38331 e!82940))

(declare-fun res!61435 () Bool)

(assert (=> d!38331 (=> res!61435 e!82940)))

(declare-fun lt!65735 () Bool)

(assert (=> d!38331 (= res!61435 (not lt!65735))))

(declare-fun lt!65734 () Bool)

(assert (=> d!38331 (= lt!65735 lt!65734)))

(declare-fun lt!65737 () Unit!3924)

(declare-fun e!82939 () Unit!3924)

(assert (=> d!38331 (= lt!65737 e!82939)))

(declare-fun c!23257 () Bool)

(assert (=> d!38331 (= c!23257 lt!65734)))

(assert (=> d!38331 (= lt!65734 (containsKey!171 (toList!856 lt!65016) lt!65009))))

(assert (=> d!38331 (= (contains!877 lt!65016 lt!65009) lt!65735)))

(declare-fun b!127032 () Bool)

(declare-fun lt!65736 () Unit!3924)

(assert (=> b!127032 (= e!82939 lt!65736)))

(assert (=> b!127032 (= lt!65736 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65016) lt!65009))))

(assert (=> b!127032 (isDefined!120 (getValueByKey!167 (toList!856 lt!65016) lt!65009))))

(declare-fun b!127033 () Bool)

(declare-fun Unit!3960 () Unit!3924)

(assert (=> b!127033 (= e!82939 Unit!3960)))

(declare-fun b!127034 () Bool)

(assert (=> b!127034 (= e!82940 (isDefined!120 (getValueByKey!167 (toList!856 lt!65016) lt!65009)))))

(assert (= (and d!38331 c!23257) b!127032))

(assert (= (and d!38331 (not c!23257)) b!127033))

(assert (= (and d!38331 (not res!61435)) b!127034))

(declare-fun m!148541 () Bool)

(assert (=> d!38331 m!148541))

(declare-fun m!148543 () Bool)

(assert (=> b!127032 m!148543))

(assert (=> b!127032 m!147413))

(assert (=> b!127032 m!147413))

(declare-fun m!148545 () Bool)

(assert (=> b!127032 m!148545))

(assert (=> b!127034 m!147413))

(assert (=> b!127034 m!147413))

(assert (=> b!127034 m!148545))

(assert (=> d!38031 d!38331))

(declare-fun d!38333 () Bool)

(declare-fun e!82942 () Bool)

(assert (=> d!38333 e!82942))

(declare-fun res!61436 () Bool)

(assert (=> d!38333 (=> res!61436 e!82942)))

(declare-fun lt!65739 () Bool)

(assert (=> d!38333 (= res!61436 (not lt!65739))))

(declare-fun lt!65738 () Bool)

(assert (=> d!38333 (= lt!65739 lt!65738)))

(declare-fun lt!65741 () Unit!3924)

(declare-fun e!82941 () Unit!3924)

(assert (=> d!38333 (= lt!65741 e!82941)))

(declare-fun c!23258 () Bool)

(assert (=> d!38333 (= c!23258 lt!65738)))

(assert (=> d!38333 (= lt!65738 (containsKey!171 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38333 (= (contains!877 lt!65369 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65739)))

(declare-fun b!127035 () Bool)

(declare-fun lt!65740 () Unit!3924)

(assert (=> b!127035 (= e!82941 lt!65740)))

(assert (=> b!127035 (= lt!65740 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127035 (isDefined!120 (getValueByKey!167 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127036 () Bool)

(declare-fun Unit!3961 () Unit!3924)

(assert (=> b!127036 (= e!82941 Unit!3961)))

(declare-fun b!127037 () Bool)

(assert (=> b!127037 (= e!82942 (isDefined!120 (getValueByKey!167 (toList!856 lt!65369) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38333 c!23258) b!127035))

(assert (= (and d!38333 (not c!23258)) b!127036))

(assert (= (and d!38333 (not res!61436)) b!127037))

(declare-fun m!148547 () Bool)

(assert (=> d!38333 m!148547))

(declare-fun m!148549 () Bool)

(assert (=> b!127035 m!148549))

(assert (=> b!127035 m!147461))

(assert (=> b!127035 m!147461))

(declare-fun m!148551 () Bool)

(assert (=> b!127035 m!148551))

(assert (=> b!127037 m!147461))

(assert (=> b!127037 m!147461))

(assert (=> b!127037 m!148551))

(assert (=> d!38035 d!38333))

(declare-fun d!38335 () Bool)

(declare-fun c!23259 () Bool)

(assert (=> d!38335 (= c!23259 (and ((_ is Cons!1694) lt!65367) (= (_1!1299 (h!2296 lt!65367)) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!82943 () Option!173)

(assert (=> d!38335 (= (getValueByKey!167 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!82943)))

(declare-fun b!127039 () Bool)

(declare-fun e!82944 () Option!173)

(assert (=> b!127039 (= e!82943 e!82944)))

(declare-fun c!23260 () Bool)

(assert (=> b!127039 (= c!23260 (and ((_ is Cons!1694) lt!65367) (not (= (_1!1299 (h!2296 lt!65367)) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127041 () Bool)

(assert (=> b!127041 (= e!82944 None!171)))

(declare-fun b!127040 () Bool)

(assert (=> b!127040 (= e!82944 (getValueByKey!167 (t!6045 lt!65367) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127038 () Bool)

(assert (=> b!127038 (= e!82943 (Some!172 (_2!1299 (h!2296 lt!65367))))))

(assert (= (and d!38335 c!23259) b!127038))

(assert (= (and d!38335 (not c!23259)) b!127039))

(assert (= (and b!127039 c!23260) b!127040))

(assert (= (and b!127039 (not c!23260)) b!127041))

(declare-fun m!148553 () Bool)

(assert (=> b!127040 m!148553))

(assert (=> d!38035 d!38335))

(declare-fun d!38337 () Bool)

(assert (=> d!38337 (= (getValueByKey!167 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65742 () Unit!3924)

(assert (=> d!38337 (= lt!65742 (choose!770 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!82945 () Bool)

(assert (=> d!38337 e!82945))

(declare-fun res!61437 () Bool)

(assert (=> d!38337 (=> (not res!61437) (not e!82945))))

(assert (=> d!38337 (= res!61437 (isStrictlySorted!317 lt!65367))))

(assert (=> d!38337 (= (lemmaContainsTupThenGetReturnValue!82 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65742)))

(declare-fun b!127042 () Bool)

(declare-fun res!61438 () Bool)

(assert (=> b!127042 (=> (not res!61438) (not e!82945))))

(assert (=> b!127042 (= res!61438 (containsKey!171 lt!65367 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127043 () Bool)

(assert (=> b!127043 (= e!82945 (contains!879 lt!65367 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38337 res!61437) b!127042))

(assert (= (and b!127042 res!61438) b!127043))

(assert (=> d!38337 m!147455))

(declare-fun m!148555 () Bool)

(assert (=> d!38337 m!148555))

(declare-fun m!148557 () Bool)

(assert (=> d!38337 m!148557))

(declare-fun m!148559 () Bool)

(assert (=> b!127042 m!148559))

(declare-fun m!148561 () Bool)

(assert (=> b!127043 m!148561))

(assert (=> d!38035 d!38337))

(declare-fun b!127044 () Bool)

(declare-fun c!23262 () Bool)

(declare-fun e!82946 () List!1698)

(declare-fun c!23264 () Bool)

(assert (=> b!127044 (= e!82946 (ite c!23262 (t!6045 (toList!856 lt!65021)) (ite c!23264 (Cons!1694 (h!2296 (toList!856 lt!65021)) (t!6045 (toList!856 lt!65021))) Nil!1695)))))

(declare-fun call!13702 () List!1698)

(declare-fun c!23263 () Bool)

(declare-fun bm!13698 () Bool)

(assert (=> bm!13698 (= call!13702 ($colon$colon!89 e!82946 (ite c!23263 (h!2296 (toList!856 lt!65021)) (tuple2!2577 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23261 () Bool)

(assert (=> bm!13698 (= c!23261 c!23263)))

(declare-fun b!127045 () Bool)

(assert (=> b!127045 (= e!82946 (insertStrictlySorted!85 (t!6045 (toList!856 lt!65021)) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65743 () List!1698)

(declare-fun b!127046 () Bool)

(declare-fun e!82947 () Bool)

(assert (=> b!127046 (= e!82947 (contains!879 lt!65743 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127047 () Bool)

(declare-fun e!82950 () List!1698)

(declare-fun call!13701 () List!1698)

(assert (=> b!127047 (= e!82950 call!13701)))

(declare-fun b!127048 () Bool)

(declare-fun e!82949 () List!1698)

(declare-fun call!13703 () List!1698)

(assert (=> b!127048 (= e!82949 call!13703)))

(declare-fun b!127049 () Bool)

(assert (=> b!127049 (= e!82949 call!13703)))

(declare-fun b!127050 () Bool)

(declare-fun e!82948 () List!1698)

(assert (=> b!127050 (= e!82948 call!13702)))

(declare-fun d!38339 () Bool)

(assert (=> d!38339 e!82947))

(declare-fun res!61439 () Bool)

(assert (=> d!38339 (=> (not res!61439) (not e!82947))))

(assert (=> d!38339 (= res!61439 (isStrictlySorted!317 lt!65743))))

(assert (=> d!38339 (= lt!65743 e!82948)))

(assert (=> d!38339 (= c!23263 (and ((_ is Cons!1694) (toList!856 lt!65021)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65021))) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38339 (isStrictlySorted!317 (toList!856 lt!65021))))

(assert (=> d!38339 (= (insertStrictlySorted!85 (toList!856 lt!65021) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65743)))

(declare-fun bm!13699 () Bool)

(assert (=> bm!13699 (= call!13701 call!13702)))

(declare-fun bm!13700 () Bool)

(assert (=> bm!13700 (= call!13703 call!13701)))

(declare-fun b!127051 () Bool)

(declare-fun res!61440 () Bool)

(assert (=> b!127051 (=> (not res!61440) (not e!82947))))

(assert (=> b!127051 (= res!61440 (containsKey!171 lt!65743 (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127052 () Bool)

(assert (=> b!127052 (= c!23264 (and ((_ is Cons!1694) (toList!856 lt!65021)) (bvsgt (_1!1299 (h!2296 (toList!856 lt!65021))) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127052 (= e!82950 e!82949)))

(declare-fun b!127053 () Bool)

(assert (=> b!127053 (= e!82948 e!82950)))

(assert (=> b!127053 (= c!23262 (and ((_ is Cons!1694) (toList!856 lt!65021)) (= (_1!1299 (h!2296 (toList!856 lt!65021))) (_1!1299 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38339 c!23263) b!127050))

(assert (= (and d!38339 (not c!23263)) b!127053))

(assert (= (and b!127053 c!23262) b!127047))

(assert (= (and b!127053 (not c!23262)) b!127052))

(assert (= (and b!127052 c!23264) b!127049))

(assert (= (and b!127052 (not c!23264)) b!127048))

(assert (= (or b!127049 b!127048) bm!13700))

(assert (= (or b!127047 bm!13700) bm!13699))

(assert (= (or b!127050 bm!13699) bm!13698))

(assert (= (and bm!13698 c!23261) b!127045))

(assert (= (and bm!13698 (not c!23261)) b!127044))

(assert (= (and d!38339 res!61439) b!127051))

(assert (= (and b!127051 res!61440) b!127046))

(declare-fun m!148563 () Bool)

(assert (=> b!127045 m!148563))

(declare-fun m!148565 () Bool)

(assert (=> b!127046 m!148565))

(declare-fun m!148567 () Bool)

(assert (=> d!38339 m!148567))

(declare-fun m!148569 () Bool)

(assert (=> d!38339 m!148569))

(declare-fun m!148571 () Bool)

(assert (=> b!127051 m!148571))

(declare-fun m!148573 () Bool)

(assert (=> bm!13698 m!148573))

(assert (=> d!38035 d!38339))

(assert (=> b!126333 d!38075))

(declare-fun b!127054 () Bool)

(declare-fun e!82952 () Bool)

(declare-fun call!13704 () Bool)

(assert (=> b!127054 (= e!82952 call!13704)))

(declare-fun b!127055 () Bool)

(assert (=> b!127055 (= e!82952 call!13704)))

(declare-fun b!127056 () Bool)

(declare-fun e!82951 () Bool)

(assert (=> b!127056 (= e!82951 e!82952)))

(declare-fun c!23265 () Bool)

(assert (=> b!127056 (= c!23265 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13701 () Bool)

(assert (=> bm!13701 (= call!13704 (arrayNoDuplicates!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23265 (Cons!1696 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000) Nil!1697) Nil!1697)))))

(declare-fun d!38341 () Bool)

(declare-fun res!61441 () Bool)

(declare-fun e!82954 () Bool)

(assert (=> d!38341 (=> res!61441 e!82954)))

(assert (=> d!38341 (= res!61441 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38341 (= (arrayNoDuplicates!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 Nil!1697) e!82954)))

(declare-fun b!127057 () Bool)

(assert (=> b!127057 (= e!82954 e!82951)))

(declare-fun res!61443 () Bool)

(assert (=> b!127057 (=> (not res!61443) (not e!82951))))

(declare-fun e!82953 () Bool)

(assert (=> b!127057 (= res!61443 (not e!82953))))

(declare-fun res!61442 () Bool)

(assert (=> b!127057 (=> (not res!61442) (not e!82953))))

(assert (=> b!127057 (= res!61442 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!127058 () Bool)

(assert (=> b!127058 (= e!82953 (contains!880 Nil!1697 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38341 (not res!61441)) b!127057))

(assert (= (and b!127057 res!61442) b!127058))

(assert (= (and b!127057 res!61443) b!127056))

(assert (= (and b!127056 c!23265) b!127055))

(assert (= (and b!127056 (not c!23265)) b!127054))

(assert (= (or b!127055 b!127054) bm!13701))

(declare-fun m!148575 () Bool)

(assert (=> b!127056 m!148575))

(assert (=> b!127056 m!148575))

(declare-fun m!148577 () Bool)

(assert (=> b!127056 m!148577))

(assert (=> bm!13701 m!148575))

(declare-fun m!148579 () Bool)

(assert (=> bm!13701 m!148579))

(assert (=> b!127057 m!148575))

(assert (=> b!127057 m!148575))

(assert (=> b!127057 m!148577))

(assert (=> b!127058 m!148575))

(assert (=> b!127058 m!148575))

(declare-fun m!148581 () Bool)

(assert (=> b!127058 m!148581))

(assert (=> b!126469 d!38341))

(declare-fun d!38343 () Bool)

(declare-fun e!82956 () Bool)

(assert (=> d!38343 e!82956))

(declare-fun res!61444 () Bool)

(assert (=> d!38343 (=> res!61444 e!82956)))

(declare-fun lt!65745 () Bool)

(assert (=> d!38343 (= res!61444 (not lt!65745))))

(declare-fun lt!65744 () Bool)

(assert (=> d!38343 (= lt!65745 lt!65744)))

(declare-fun lt!65747 () Unit!3924)

(declare-fun e!82955 () Unit!3924)

(assert (=> d!38343 (= lt!65747 e!82955)))

(declare-fun c!23266 () Bool)

(assert (=> d!38343 (= c!23266 lt!65744)))

(assert (=> d!38343 (= lt!65744 (containsKey!171 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))

(assert (=> d!38343 (= (contains!877 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))) lt!65745)))

(declare-fun b!127059 () Bool)

(declare-fun lt!65746 () Unit!3924)

(assert (=> b!127059 (= e!82955 lt!65746)))

(assert (=> b!127059 (= lt!65746 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))

(assert (=> b!127059 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))

(declare-fun b!127060 () Bool)

(declare-fun Unit!3962 () Unit!3924)

(assert (=> b!127060 (= e!82955 Unit!3962)))

(declare-fun b!127061 () Bool)

(assert (=> b!127061 (= e!82956 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(assert (= (and d!38343 c!23266) b!127059))

(assert (= (and d!38343 (not c!23266)) b!127060))

(assert (= (and d!38343 (not res!61444)) b!127061))

(assert (=> d!38343 m!147003))

(declare-fun m!148583 () Bool)

(assert (=> d!38343 m!148583))

(assert (=> b!127059 m!147003))

(declare-fun m!148585 () Bool)

(assert (=> b!127059 m!148585))

(assert (=> b!127059 m!147003))

(declare-fun m!148587 () Bool)

(assert (=> b!127059 m!148587))

(assert (=> b!127059 m!148587))

(declare-fun m!148589 () Bool)

(assert (=> b!127059 m!148589))

(assert (=> b!127061 m!147003))

(assert (=> b!127061 m!148587))

(assert (=> b!127061 m!148587))

(assert (=> b!127061 m!148589))

(assert (=> b!126402 d!38343))

(declare-fun b!127062 () Bool)

(declare-fun c!23268 () Bool)

(assert (=> b!127062 (= c!23268 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82967 () ListLongMap!1681)

(declare-fun e!82963 () ListLongMap!1681)

(assert (=> b!127062 (= e!82967 e!82963)))

(declare-fun bm!13702 () Bool)

(declare-fun call!13707 () Bool)

(declare-fun lt!65748 () ListLongMap!1681)

(assert (=> bm!13702 (= call!13707 (contains!877 lt!65748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127063 () Bool)

(declare-fun e!82966 () ListLongMap!1681)

(assert (=> b!127063 (= e!82966 e!82967)))

(declare-fun c!23271 () Bool)

(assert (=> b!127063 (= c!23271 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127064 () Bool)

(declare-fun e!82957 () Unit!3924)

(declare-fun Unit!3963 () Unit!3924)

(assert (=> b!127064 (= e!82957 Unit!3963)))

(declare-fun b!127065 () Bool)

(declare-fun e!82965 () Bool)

(declare-fun e!82960 () Bool)

(assert (=> b!127065 (= e!82965 e!82960)))

(declare-fun res!61451 () Bool)

(assert (=> b!127065 (= res!61451 call!13707)))

(assert (=> b!127065 (=> (not res!61451) (not e!82960))))

(declare-fun b!127066 () Bool)

(declare-fun e!82969 () Bool)

(declare-fun e!82962 () Bool)

(assert (=> b!127066 (= e!82969 e!82962)))

(declare-fun res!61445 () Bool)

(assert (=> b!127066 (=> (not res!61445) (not e!82962))))

(assert (=> b!127066 (= res!61445 (contains!877 lt!65748 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127067 () Bool)

(assert (=> b!127067 (= e!82965 (not call!13707))))

(declare-fun d!38345 () Bool)

(declare-fun e!82959 () Bool)

(assert (=> d!38345 e!82959))

(declare-fun res!61447 () Bool)

(assert (=> d!38345 (=> (not res!61447) (not e!82959))))

(assert (=> d!38345 (= res!61447 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))))

(declare-fun lt!65757 () ListLongMap!1681)

(assert (=> d!38345 (= lt!65748 lt!65757)))

(declare-fun lt!65763 () Unit!3924)

(assert (=> d!38345 (= lt!65763 e!82957)))

(declare-fun c!23270 () Bool)

(declare-fun e!82958 () Bool)

(assert (=> d!38345 (= c!23270 e!82958)))

(declare-fun res!61449 () Bool)

(assert (=> d!38345 (=> (not res!61449) (not e!82958))))

(assert (=> d!38345 (= res!61449 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38345 (= lt!65757 e!82966)))

(declare-fun c!23267 () Bool)

(assert (=> d!38345 (= c!23267 (and (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38345 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38345 (= (getCurrentListMap!536 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)) lt!65748)))

(declare-fun b!127068 () Bool)

(declare-fun lt!65752 () Unit!3924)

(assert (=> b!127068 (= e!82957 lt!65752)))

(declare-fun lt!65760 () ListLongMap!1681)

(assert (=> b!127068 (= lt!65760 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65754 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65754 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65767 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65767 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65753 () Unit!3924)

(assert (=> b!127068 (= lt!65753 (addStillContains!87 lt!65760 lt!65754 (zeroValue!2646 newMap!16) lt!65767))))

(assert (=> b!127068 (contains!877 (+!170 lt!65760 (tuple2!2577 lt!65754 (zeroValue!2646 newMap!16))) lt!65767)))

(declare-fun lt!65759 () Unit!3924)

(assert (=> b!127068 (= lt!65759 lt!65753)))

(declare-fun lt!65768 () ListLongMap!1681)

(assert (=> b!127068 (= lt!65768 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65765 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65769 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65769 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65755 () Unit!3924)

(assert (=> b!127068 (= lt!65755 (addApplyDifferent!87 lt!65768 lt!65765 (minValue!2646 newMap!16) lt!65769))))

(assert (=> b!127068 (= (apply!111 (+!170 lt!65768 (tuple2!2577 lt!65765 (minValue!2646 newMap!16))) lt!65769) (apply!111 lt!65768 lt!65769))))

(declare-fun lt!65751 () Unit!3924)

(assert (=> b!127068 (= lt!65751 lt!65755)))

(declare-fun lt!65761 () ListLongMap!1681)

(assert (=> b!127068 (= lt!65761 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65766 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65758 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65758 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!65750 () Unit!3924)

(assert (=> b!127068 (= lt!65750 (addApplyDifferent!87 lt!65761 lt!65766 (zeroValue!2646 newMap!16) lt!65758))))

(assert (=> b!127068 (= (apply!111 (+!170 lt!65761 (tuple2!2577 lt!65766 (zeroValue!2646 newMap!16))) lt!65758) (apply!111 lt!65761 lt!65758))))

(declare-fun lt!65764 () Unit!3924)

(assert (=> b!127068 (= lt!65764 lt!65750)))

(declare-fun lt!65756 () ListLongMap!1681)

(assert (=> b!127068 (= lt!65756 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun lt!65762 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65762 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65749 () (_ BitVec 64))

(assert (=> b!127068 (= lt!65749 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127068 (= lt!65752 (addApplyDifferent!87 lt!65756 lt!65762 (minValue!2646 newMap!16) lt!65749))))

(assert (=> b!127068 (= (apply!111 (+!170 lt!65756 (tuple2!2577 lt!65762 (minValue!2646 newMap!16))) lt!65749) (apply!111 lt!65756 lt!65749))))

(declare-fun b!127069 () Bool)

(declare-fun res!61452 () Bool)

(assert (=> b!127069 (=> (not res!61452) (not e!82959))))

(declare-fun e!82964 () Bool)

(assert (=> b!127069 (= res!61452 e!82964)))

(declare-fun c!23269 () Bool)

(assert (=> b!127069 (= c!23269 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127070 () Bool)

(declare-fun e!82968 () Bool)

(assert (=> b!127070 (= e!82968 (= (apply!111 lt!65748 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 newMap!16)))))

(declare-fun b!127071 () Bool)

(assert (=> b!127071 (= e!82964 e!82968)))

(declare-fun res!61450 () Bool)

(declare-fun call!13708 () Bool)

(assert (=> b!127071 (= res!61450 call!13708)))

(assert (=> b!127071 (=> (not res!61450) (not e!82968))))

(declare-fun b!127072 () Bool)

(assert (=> b!127072 (= e!82960 (= (apply!111 lt!65748 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 newMap!16)))))

(declare-fun bm!13703 () Bool)

(declare-fun call!13705 () ListLongMap!1681)

(declare-fun call!13711 () ListLongMap!1681)

(assert (=> bm!13703 (= call!13705 call!13711)))

(declare-fun b!127073 () Bool)

(assert (=> b!127073 (= e!82964 (not call!13708))))

(declare-fun call!13710 () ListLongMap!1681)

(declare-fun bm!13704 () Bool)

(declare-fun call!13709 () ListLongMap!1681)

(assert (=> bm!13704 (= call!13710 (+!170 (ite c!23267 call!13711 (ite c!23271 call!13705 call!13709)) (ite (or c!23267 c!23271) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun bm!13705 () Bool)

(assert (=> bm!13705 (= call!13708 (contains!877 lt!65748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127074 () Bool)

(declare-fun call!13706 () ListLongMap!1681)

(assert (=> b!127074 (= e!82963 call!13706)))

(declare-fun b!127075 () Bool)

(assert (=> b!127075 (= e!82967 call!13706)))

(declare-fun b!127076 () Bool)

(assert (=> b!127076 (= e!82958 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13706 () Bool)

(assert (=> bm!13706 (= call!13706 call!13710)))

(declare-fun b!127077 () Bool)

(assert (=> b!127077 (= e!82959 e!82965)))

(declare-fun c!23272 () Bool)

(assert (=> b!127077 (= c!23272 (not (= (bvand (extraKeys!2564 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127078 () Bool)

(assert (=> b!127078 (= e!82962 (= (apply!111 lt!65748 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 lt!65109) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 lt!65109)))))

(assert (=> b!127078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127079 () Bool)

(declare-fun res!61446 () Bool)

(assert (=> b!127079 (=> (not res!61446) (not e!82959))))

(assert (=> b!127079 (= res!61446 e!82969)))

(declare-fun res!61453 () Bool)

(assert (=> b!127079 (=> res!61453 e!82969)))

(declare-fun e!82961 () Bool)

(assert (=> b!127079 (= res!61453 (not e!82961))))

(declare-fun res!61448 () Bool)

(assert (=> b!127079 (=> (not res!61448) (not e!82961))))

(assert (=> b!127079 (= res!61448 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127080 () Bool)

(assert (=> b!127080 (= e!82961 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127081 () Bool)

(assert (=> b!127081 (= e!82966 (+!170 call!13710 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(declare-fun b!127082 () Bool)

(assert (=> b!127082 (= e!82963 call!13709)))

(declare-fun bm!13707 () Bool)

(assert (=> bm!13707 (= call!13711 (getCurrentListMapNoExtraKeys!136 (_keys!4516 newMap!16) lt!65109 (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))

(declare-fun bm!13708 () Bool)

(assert (=> bm!13708 (= call!13709 call!13705)))

(assert (= (and d!38345 c!23267) b!127081))

(assert (= (and d!38345 (not c!23267)) b!127063))

(assert (= (and b!127063 c!23271) b!127075))

(assert (= (and b!127063 (not c!23271)) b!127062))

(assert (= (and b!127062 c!23268) b!127074))

(assert (= (and b!127062 (not c!23268)) b!127082))

(assert (= (or b!127074 b!127082) bm!13708))

(assert (= (or b!127075 bm!13708) bm!13703))

(assert (= (or b!127075 b!127074) bm!13706))

(assert (= (or b!127081 bm!13703) bm!13707))

(assert (= (or b!127081 bm!13706) bm!13704))

(assert (= (and d!38345 res!61449) b!127076))

(assert (= (and d!38345 c!23270) b!127068))

(assert (= (and d!38345 (not c!23270)) b!127064))

(assert (= (and d!38345 res!61447) b!127079))

(assert (= (and b!127079 res!61448) b!127080))

(assert (= (and b!127079 (not res!61453)) b!127066))

(assert (= (and b!127066 res!61445) b!127078))

(assert (= (and b!127079 res!61446) b!127069))

(assert (= (and b!127069 c!23269) b!127071))

(assert (= (and b!127069 (not c!23269)) b!127073))

(assert (= (and b!127071 res!61450) b!127070))

(assert (= (or b!127071 b!127073) bm!13705))

(assert (= (and b!127069 res!61452) b!127077))

(assert (= (and b!127077 c!23272) b!127065))

(assert (= (and b!127077 (not c!23272)) b!127067))

(assert (= (and b!127065 res!61451) b!127072))

(assert (= (or b!127065 b!127067) bm!13702))

(declare-fun b_lambda!5605 () Bool)

(assert (=> (not b_lambda!5605) (not b!127078)))

(assert (=> b!127078 t!6053))

(declare-fun b_and!7843 () Bool)

(assert (= b_and!7839 (and (=> t!6053 result!3847) b_and!7843)))

(assert (=> b!127078 t!6055))

(declare-fun b_and!7845 () Bool)

(assert (= b_and!7841 (and (=> t!6055 result!3849) b_and!7845)))

(assert (=> b!127066 m!147041))

(assert (=> b!127066 m!147041))

(declare-fun m!148591 () Bool)

(assert (=> b!127066 m!148591))

(assert (=> d!38345 m!147051))

(declare-fun m!148593 () Bool)

(assert (=> b!127068 m!148593))

(declare-fun m!148595 () Bool)

(assert (=> b!127068 m!148595))

(assert (=> b!127068 m!148595))

(declare-fun m!148597 () Bool)

(assert (=> b!127068 m!148597))

(declare-fun m!148599 () Bool)

(assert (=> b!127068 m!148599))

(declare-fun m!148601 () Bool)

(assert (=> b!127068 m!148601))

(declare-fun m!148603 () Bool)

(assert (=> b!127068 m!148603))

(declare-fun m!148605 () Bool)

(assert (=> b!127068 m!148605))

(declare-fun m!148607 () Bool)

(assert (=> b!127068 m!148607))

(assert (=> b!127068 m!148599))

(declare-fun m!148609 () Bool)

(assert (=> b!127068 m!148609))

(declare-fun m!148611 () Bool)

(assert (=> b!127068 m!148611))

(declare-fun m!148613 () Bool)

(assert (=> b!127068 m!148613))

(declare-fun m!148615 () Bool)

(assert (=> b!127068 m!148615))

(declare-fun m!148617 () Bool)

(assert (=> b!127068 m!148617))

(assert (=> b!127068 m!147041))

(assert (=> b!127068 m!148601))

(declare-fun m!148619 () Bool)

(assert (=> b!127068 m!148619))

(declare-fun m!148621 () Bool)

(assert (=> b!127068 m!148621))

(declare-fun m!148623 () Bool)

(assert (=> b!127068 m!148623))

(assert (=> b!127068 m!148613))

(declare-fun m!148625 () Bool)

(assert (=> bm!13702 m!148625))

(assert (=> b!127080 m!147041))

(assert (=> b!127080 m!147041))

(assert (=> b!127080 m!147043))

(declare-fun m!148627 () Bool)

(assert (=> b!127072 m!148627))

(assert (=> b!127076 m!147041))

(assert (=> b!127076 m!147041))

(assert (=> b!127076 m!147043))

(declare-fun m!148629 () Bool)

(assert (=> bm!13704 m!148629))

(declare-fun m!148631 () Bool)

(assert (=> b!127081 m!148631))

(assert (=> bm!13707 m!148621))

(assert (=> b!127078 m!147041))

(assert (=> b!127078 m!147145))

(declare-fun m!148633 () Bool)

(assert (=> b!127078 m!148633))

(assert (=> b!127078 m!147145))

(declare-fun m!148635 () Bool)

(assert (=> b!127078 m!148635))

(assert (=> b!127078 m!148633))

(assert (=> b!127078 m!147041))

(declare-fun m!148637 () Bool)

(assert (=> b!127078 m!148637))

(declare-fun m!148639 () Bool)

(assert (=> b!127070 m!148639))

(declare-fun m!148641 () Bool)

(assert (=> bm!13705 m!148641))

(assert (=> b!126402 d!38345))

(declare-fun lt!65770 () Bool)

(declare-fun d!38347 () Bool)

(assert (=> d!38347 (= lt!65770 (select (content!125 (toList!856 lt!65323)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!82970 () Bool)

(assert (=> d!38347 (= lt!65770 e!82970)))

(declare-fun res!61455 () Bool)

(assert (=> d!38347 (=> (not res!61455) (not e!82970))))

(assert (=> d!38347 (= res!61455 ((_ is Cons!1694) (toList!856 lt!65323)))))

(assert (=> d!38347 (= (contains!879 (toList!856 lt!65323) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65770)))

(declare-fun b!127083 () Bool)

(declare-fun e!82971 () Bool)

(assert (=> b!127083 (= e!82970 e!82971)))

(declare-fun res!61454 () Bool)

(assert (=> b!127083 (=> res!61454 e!82971)))

(assert (=> b!127083 (= res!61454 (= (h!2296 (toList!856 lt!65323)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!127084 () Bool)

(assert (=> b!127084 (= e!82971 (contains!879 (t!6045 (toList!856 lt!65323)) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38347 res!61455) b!127083))

(assert (= (and b!127083 (not res!61454)) b!127084))

(declare-fun m!148643 () Bool)

(assert (=> d!38347 m!148643))

(declare-fun m!148645 () Bool)

(assert (=> d!38347 m!148645))

(declare-fun m!148647 () Bool)

(assert (=> b!127084 m!148647))

(assert (=> b!126431 d!38347))

(declare-fun d!38349 () Bool)

(declare-fun e!82973 () Bool)

(assert (=> d!38349 e!82973))

(declare-fun res!61456 () Bool)

(assert (=> d!38349 (=> res!61456 e!82973)))

(declare-fun lt!65772 () Bool)

(assert (=> d!38349 (= res!61456 (not lt!65772))))

(declare-fun lt!65771 () Bool)

(assert (=> d!38349 (= lt!65772 lt!65771)))

(declare-fun lt!65774 () Unit!3924)

(declare-fun e!82972 () Unit!3924)

(assert (=> d!38349 (= lt!65774 e!82972)))

(declare-fun c!23273 () Bool)

(assert (=> d!38349 (= c!23273 lt!65771)))

(assert (=> d!38349 (= lt!65771 (containsKey!171 (toList!856 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38349 (= (contains!877 lt!65390 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65772)))

(declare-fun b!127085 () Bool)

(declare-fun lt!65773 () Unit!3924)

(assert (=> b!127085 (= e!82972 lt!65773)))

(assert (=> b!127085 (= lt!65773 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127085 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127086 () Bool)

(declare-fun Unit!3964 () Unit!3924)

(assert (=> b!127086 (= e!82972 Unit!3964)))

(declare-fun b!127087 () Bool)

(assert (=> b!127087 (= e!82973 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38349 c!23273) b!127085))

(assert (= (and d!38349 (not c!23273)) b!127086))

(assert (= (and d!38349 (not res!61456)) b!127087))

(declare-fun m!148649 () Bool)

(assert (=> d!38349 m!148649))

(declare-fun m!148651 () Bool)

(assert (=> b!127085 m!148651))

(declare-fun m!148653 () Bool)

(assert (=> b!127085 m!148653))

(assert (=> b!127085 m!148653))

(declare-fun m!148655 () Bool)

(assert (=> b!127085 m!148655))

(assert (=> b!127087 m!148653))

(assert (=> b!127087 m!148653))

(assert (=> b!127087 m!148655))

(assert (=> b!126514 d!38349))

(declare-fun b!127088 () Bool)

(declare-fun c!23275 () Bool)

(assert (=> b!127088 (= c!23275 (and (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!82984 () ListLongMap!1681)

(declare-fun e!82980 () ListLongMap!1681)

(assert (=> b!127088 (= e!82984 e!82980)))

(declare-fun bm!13709 () Bool)

(declare-fun call!13714 () Bool)

(declare-fun lt!65775 () ListLongMap!1681)

(assert (=> bm!13709 (= call!13714 (contains!877 lt!65775 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127089 () Bool)

(declare-fun e!82983 () ListLongMap!1681)

(assert (=> b!127089 (= e!82983 e!82984)))

(declare-fun c!23278 () Bool)

(assert (=> b!127089 (= c!23278 (and (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127090 () Bool)

(declare-fun e!82974 () Unit!3924)

(declare-fun Unit!3965 () Unit!3924)

(assert (=> b!127090 (= e!82974 Unit!3965)))

(declare-fun b!127091 () Bool)

(declare-fun e!82982 () Bool)

(declare-fun e!82977 () Bool)

(assert (=> b!127091 (= e!82982 e!82977)))

(declare-fun res!61463 () Bool)

(assert (=> b!127091 (= res!61463 call!13714)))

(assert (=> b!127091 (=> (not res!61463) (not e!82977))))

(declare-fun b!127092 () Bool)

(declare-fun e!82986 () Bool)

(declare-fun e!82979 () Bool)

(assert (=> b!127092 (= e!82986 e!82979)))

(declare-fun res!61457 () Bool)

(assert (=> b!127092 (=> (not res!61457) (not e!82979))))

(assert (=> b!127092 (= res!61457 (contains!877 lt!65775 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(assert (=> b!127092 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(declare-fun b!127093 () Bool)

(assert (=> b!127093 (= e!82982 (not call!13714))))

(declare-fun d!38351 () Bool)

(declare-fun e!82976 () Bool)

(assert (=> d!38351 e!82976))

(declare-fun res!61459 () Bool)

(assert (=> d!38351 (=> (not res!61459) (not e!82976))))

(assert (=> d!38351 (= res!61459 (or (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))))

(declare-fun lt!65784 () ListLongMap!1681)

(assert (=> d!38351 (= lt!65775 lt!65784)))

(declare-fun lt!65790 () Unit!3924)

(assert (=> d!38351 (= lt!65790 e!82974)))

(declare-fun c!23277 () Bool)

(declare-fun e!82975 () Bool)

(assert (=> d!38351 (= c!23277 e!82975)))

(declare-fun res!61461 () Bool)

(assert (=> d!38351 (=> (not res!61461) (not e!82975))))

(assert (=> d!38351 (= res!61461 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(assert (=> d!38351 (= lt!65784 e!82983)))

(declare-fun c!23274 () Bool)

(assert (=> d!38351 (= c!23274 (and (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38351 (validMask!0 (mask!7039 (_2!1300 lt!65097)))))

(assert (=> d!38351 (= (getCurrentListMap!536 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))) lt!65775)))

(declare-fun b!127094 () Bool)

(declare-fun lt!65779 () Unit!3924)

(assert (=> b!127094 (= e!82974 lt!65779)))

(declare-fun lt!65787 () ListLongMap!1681)

(assert (=> b!127094 (= lt!65787 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun lt!65781 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65794 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65794 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000))))

(declare-fun lt!65780 () Unit!3924)

(assert (=> b!127094 (= lt!65780 (addStillContains!87 lt!65787 lt!65781 (zeroValue!2646 (_2!1300 lt!65097)) lt!65794))))

(assert (=> b!127094 (contains!877 (+!170 lt!65787 (tuple2!2577 lt!65781 (zeroValue!2646 (_2!1300 lt!65097)))) lt!65794)))

(declare-fun lt!65786 () Unit!3924)

(assert (=> b!127094 (= lt!65786 lt!65780)))

(declare-fun lt!65795 () ListLongMap!1681)

(assert (=> b!127094 (= lt!65795 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun lt!65792 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65792 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65796 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65796 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000))))

(declare-fun lt!65782 () Unit!3924)

(assert (=> b!127094 (= lt!65782 (addApplyDifferent!87 lt!65795 lt!65792 (minValue!2646 (_2!1300 lt!65097)) lt!65796))))

(assert (=> b!127094 (= (apply!111 (+!170 lt!65795 (tuple2!2577 lt!65792 (minValue!2646 (_2!1300 lt!65097)))) lt!65796) (apply!111 lt!65795 lt!65796))))

(declare-fun lt!65778 () Unit!3924)

(assert (=> b!127094 (= lt!65778 lt!65782)))

(declare-fun lt!65788 () ListLongMap!1681)

(assert (=> b!127094 (= lt!65788 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun lt!65793 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65785 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65785 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000))))

(declare-fun lt!65777 () Unit!3924)

(assert (=> b!127094 (= lt!65777 (addApplyDifferent!87 lt!65788 lt!65793 (zeroValue!2646 (_2!1300 lt!65097)) lt!65785))))

(assert (=> b!127094 (= (apply!111 (+!170 lt!65788 (tuple2!2577 lt!65793 (zeroValue!2646 (_2!1300 lt!65097)))) lt!65785) (apply!111 lt!65788 lt!65785))))

(declare-fun lt!65791 () Unit!3924)

(assert (=> b!127094 (= lt!65791 lt!65777)))

(declare-fun lt!65783 () ListLongMap!1681)

(assert (=> b!127094 (= lt!65783 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun lt!65789 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65789 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!65776 () (_ BitVec 64))

(assert (=> b!127094 (= lt!65776 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000))))

(assert (=> b!127094 (= lt!65779 (addApplyDifferent!87 lt!65783 lt!65789 (minValue!2646 (_2!1300 lt!65097)) lt!65776))))

(assert (=> b!127094 (= (apply!111 (+!170 lt!65783 (tuple2!2577 lt!65789 (minValue!2646 (_2!1300 lt!65097)))) lt!65776) (apply!111 lt!65783 lt!65776))))

(declare-fun b!127095 () Bool)

(declare-fun res!61464 () Bool)

(assert (=> b!127095 (=> (not res!61464) (not e!82976))))

(declare-fun e!82981 () Bool)

(assert (=> b!127095 (= res!61464 e!82981)))

(declare-fun c!23276 () Bool)

(assert (=> b!127095 (= c!23276 (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!127096 () Bool)

(declare-fun e!82985 () Bool)

(assert (=> b!127096 (= e!82985 (= (apply!111 lt!65775 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2646 (_2!1300 lt!65097))))))

(declare-fun b!127097 () Bool)

(assert (=> b!127097 (= e!82981 e!82985)))

(declare-fun res!61462 () Bool)

(declare-fun call!13715 () Bool)

(assert (=> b!127097 (= res!61462 call!13715)))

(assert (=> b!127097 (=> (not res!61462) (not e!82985))))

(declare-fun b!127098 () Bool)

(assert (=> b!127098 (= e!82977 (= (apply!111 lt!65775 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2646 (_2!1300 lt!65097))))))

(declare-fun bm!13710 () Bool)

(declare-fun call!13712 () ListLongMap!1681)

(declare-fun call!13718 () ListLongMap!1681)

(assert (=> bm!13710 (= call!13712 call!13718)))

(declare-fun b!127099 () Bool)

(assert (=> b!127099 (= e!82981 (not call!13715))))

(declare-fun call!13716 () ListLongMap!1681)

(declare-fun call!13717 () ListLongMap!1681)

(declare-fun bm!13711 () Bool)

(assert (=> bm!13711 (= call!13717 (+!170 (ite c!23274 call!13718 (ite c!23278 call!13712 call!13716)) (ite (or c!23274 c!23278) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (_2!1300 lt!65097))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (_2!1300 lt!65097))))))))

(declare-fun bm!13712 () Bool)

(assert (=> bm!13712 (= call!13715 (contains!877 lt!65775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127100 () Bool)

(declare-fun call!13713 () ListLongMap!1681)

(assert (=> b!127100 (= e!82980 call!13713)))

(declare-fun b!127101 () Bool)

(assert (=> b!127101 (= e!82984 call!13713)))

(declare-fun b!127102 () Bool)

(assert (=> b!127102 (= e!82975 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun bm!13713 () Bool)

(assert (=> bm!13713 (= call!13713 call!13717)))

(declare-fun b!127103 () Bool)

(assert (=> b!127103 (= e!82976 e!82982)))

(declare-fun c!23279 () Bool)

(assert (=> b!127103 (= c!23279 (not (= (bvand (extraKeys!2564 (_2!1300 lt!65097)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!127104 () Bool)

(assert (=> b!127104 (= e!82979 (= (apply!111 lt!65775 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)) (get!1443 (select (arr!2226 (_values!2766 (_2!1300 lt!65097))) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 (_2!1300 lt!65097)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!127104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2490 (_values!2766 (_2!1300 lt!65097)))))))

(assert (=> b!127104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(declare-fun b!127105 () Bool)

(declare-fun res!61458 () Bool)

(assert (=> b!127105 (=> (not res!61458) (not e!82976))))

(assert (=> b!127105 (= res!61458 e!82986)))

(declare-fun res!61465 () Bool)

(assert (=> b!127105 (=> res!61465 e!82986)))

(declare-fun e!82978 () Bool)

(assert (=> b!127105 (= res!61465 (not e!82978))))

(declare-fun res!61460 () Bool)

(assert (=> b!127105 (=> (not res!61460) (not e!82978))))

(assert (=> b!127105 (= res!61460 (bvslt #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(declare-fun b!127106 () Bool)

(assert (=> b!127106 (= e!82978 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun b!127107 () Bool)

(assert (=> b!127107 (= e!82983 (+!170 call!13717 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (_2!1300 lt!65097)))))))

(declare-fun b!127108 () Bool)

(assert (=> b!127108 (= e!82980 call!13716)))

(declare-fun bm!13714 () Bool)

(assert (=> bm!13714 (= call!13718 (getCurrentListMapNoExtraKeys!136 (_keys!4516 (_2!1300 lt!65097)) (_values!2766 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097)) (extraKeys!2564 (_2!1300 lt!65097)) (zeroValue!2646 (_2!1300 lt!65097)) (minValue!2646 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65097))))))

(declare-fun bm!13715 () Bool)

(assert (=> bm!13715 (= call!13716 call!13712)))

(assert (= (and d!38351 c!23274) b!127107))

(assert (= (and d!38351 (not c!23274)) b!127089))

(assert (= (and b!127089 c!23278) b!127101))

(assert (= (and b!127089 (not c!23278)) b!127088))

(assert (= (and b!127088 c!23275) b!127100))

(assert (= (and b!127088 (not c!23275)) b!127108))

(assert (= (or b!127100 b!127108) bm!13715))

(assert (= (or b!127101 bm!13715) bm!13710))

(assert (= (or b!127101 b!127100) bm!13713))

(assert (= (or b!127107 bm!13710) bm!13714))

(assert (= (or b!127107 bm!13713) bm!13711))

(assert (= (and d!38351 res!61461) b!127102))

(assert (= (and d!38351 c!23277) b!127094))

(assert (= (and d!38351 (not c!23277)) b!127090))

(assert (= (and d!38351 res!61459) b!127105))

(assert (= (and b!127105 res!61460) b!127106))

(assert (= (and b!127105 (not res!61465)) b!127092))

(assert (= (and b!127092 res!61457) b!127104))

(assert (= (and b!127105 res!61458) b!127095))

(assert (= (and b!127095 c!23276) b!127097))

(assert (= (and b!127095 (not c!23276)) b!127099))

(assert (= (and b!127097 res!61462) b!127096))

(assert (= (or b!127097 b!127099) bm!13712))

(assert (= (and b!127095 res!61464) b!127103))

(assert (= (and b!127103 c!23279) b!127091))

(assert (= (and b!127103 (not c!23279)) b!127093))

(assert (= (and b!127091 res!61463) b!127098))

(assert (= (or b!127091 b!127093) bm!13709))

(declare-fun b_lambda!5607 () Bool)

(assert (=> (not b_lambda!5607) (not b!127104)))

(declare-fun tb!2321 () Bool)

(declare-fun t!6057 () Bool)

(assert (=> (and b!125935 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 (_2!1300 lt!65097))) t!6057) tb!2321))

(declare-fun result!3851 () Bool)

(assert (=> tb!2321 (= result!3851 tp_is_empty!2841)))

(assert (=> b!127104 t!6057))

(declare-fun b_and!7847 () Bool)

(assert (= b_and!7843 (and (=> t!6057 result!3851) b_and!7847)))

(declare-fun t!6059 () Bool)

(declare-fun tb!2323 () Bool)

(assert (=> (and b!125945 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (_2!1300 lt!65097))) t!6059) tb!2323))

(declare-fun result!3853 () Bool)

(assert (= result!3853 result!3851))

(assert (=> b!127104 t!6059))

(declare-fun b_and!7849 () Bool)

(assert (= b_and!7845 (and (=> t!6059 result!3853) b_and!7849)))

(assert (=> b!127092 m!148441))

(assert (=> b!127092 m!148441))

(declare-fun m!148657 () Bool)

(assert (=> b!127092 m!148657))

(assert (=> d!38351 m!147855))

(declare-fun m!148659 () Bool)

(assert (=> b!127094 m!148659))

(declare-fun m!148661 () Bool)

(assert (=> b!127094 m!148661))

(assert (=> b!127094 m!148661))

(declare-fun m!148663 () Bool)

(assert (=> b!127094 m!148663))

(declare-fun m!148665 () Bool)

(assert (=> b!127094 m!148665))

(declare-fun m!148667 () Bool)

(assert (=> b!127094 m!148667))

(declare-fun m!148669 () Bool)

(assert (=> b!127094 m!148669))

(declare-fun m!148671 () Bool)

(assert (=> b!127094 m!148671))

(declare-fun m!148673 () Bool)

(assert (=> b!127094 m!148673))

(assert (=> b!127094 m!148665))

(declare-fun m!148675 () Bool)

(assert (=> b!127094 m!148675))

(declare-fun m!148677 () Bool)

(assert (=> b!127094 m!148677))

(declare-fun m!148679 () Bool)

(assert (=> b!127094 m!148679))

(declare-fun m!148681 () Bool)

(assert (=> b!127094 m!148681))

(declare-fun m!148683 () Bool)

(assert (=> b!127094 m!148683))

(assert (=> b!127094 m!148441))

(assert (=> b!127094 m!148667))

(declare-fun m!148685 () Bool)

(assert (=> b!127094 m!148685))

(declare-fun m!148687 () Bool)

(assert (=> b!127094 m!148687))

(declare-fun m!148689 () Bool)

(assert (=> b!127094 m!148689))

(assert (=> b!127094 m!148679))

(declare-fun m!148691 () Bool)

(assert (=> bm!13709 m!148691))

(assert (=> b!127106 m!148441))

(assert (=> b!127106 m!148441))

(assert (=> b!127106 m!148443))

(declare-fun m!148693 () Bool)

(assert (=> b!127098 m!148693))

(assert (=> b!127102 m!148441))

(assert (=> b!127102 m!148441))

(assert (=> b!127102 m!148443))

(declare-fun m!148695 () Bool)

(assert (=> bm!13711 m!148695))

(declare-fun m!148697 () Bool)

(assert (=> b!127107 m!148697))

(assert (=> bm!13714 m!148687))

(assert (=> b!127104 m!148441))

(declare-fun m!148699 () Bool)

(assert (=> b!127104 m!148699))

(declare-fun m!148701 () Bool)

(assert (=> b!127104 m!148701))

(assert (=> b!127104 m!148699))

(declare-fun m!148703 () Bool)

(assert (=> b!127104 m!148703))

(assert (=> b!127104 m!148701))

(assert (=> b!127104 m!148441))

(declare-fun m!148705 () Bool)

(assert (=> b!127104 m!148705))

(declare-fun m!148707 () Bool)

(assert (=> b!127096 m!148707))

(declare-fun m!148709 () Bool)

(assert (=> bm!13712 m!148709))

(assert (=> d!37985 d!38351))

(declare-fun d!38353 () Bool)

(declare-fun e!82988 () Bool)

(assert (=> d!38353 e!82988))

(declare-fun res!61466 () Bool)

(assert (=> d!38353 (=> res!61466 e!82988)))

(declare-fun lt!65798 () Bool)

(assert (=> d!38353 (= res!61466 (not lt!65798))))

(declare-fun lt!65797 () Bool)

(assert (=> d!38353 (= lt!65798 lt!65797)))

(declare-fun lt!65800 () Unit!3924)

(declare-fun e!82987 () Unit!3924)

(assert (=> d!38353 (= lt!65800 e!82987)))

(declare-fun c!23280 () Bool)

(assert (=> d!38353 (= c!23280 lt!65797)))

(assert (=> d!38353 (= lt!65797 (containsKey!171 (toList!856 (map!1387 (_2!1300 lt!65284))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38353 (= (contains!877 (map!1387 (_2!1300 lt!65284)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65798)))

(declare-fun b!127109 () Bool)

(declare-fun lt!65799 () Unit!3924)

(assert (=> b!127109 (= e!82987 lt!65799)))

(assert (=> b!127109 (= lt!65799 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (map!1387 (_2!1300 lt!65284))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!127109 (isDefined!120 (getValueByKey!167 (toList!856 (map!1387 (_2!1300 lt!65284))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!127110 () Bool)

(declare-fun Unit!3966 () Unit!3924)

(assert (=> b!127110 (= e!82987 Unit!3966)))

(declare-fun b!127111 () Bool)

(assert (=> b!127111 (= e!82988 (isDefined!120 (getValueByKey!167 (toList!856 (map!1387 (_2!1300 lt!65284))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (= (and d!38353 c!23280) b!127109))

(assert (= (and d!38353 (not c!23280)) b!127110))

(assert (= (and d!38353 (not res!61466)) b!127111))

(assert (=> d!38353 m!146847))

(declare-fun m!148711 () Bool)

(assert (=> d!38353 m!148711))

(assert (=> b!127109 m!146847))

(declare-fun m!148713 () Bool)

(assert (=> b!127109 m!148713))

(assert (=> b!127109 m!146847))

(declare-fun m!148715 () Bool)

(assert (=> b!127109 m!148715))

(assert (=> b!127109 m!148715))

(declare-fun m!148717 () Bool)

(assert (=> b!127109 m!148717))

(assert (=> b!127111 m!146847))

(assert (=> b!127111 m!148715))

(assert (=> b!127111 m!148715))

(assert (=> b!127111 m!148717))

(assert (=> b!126392 d!38353))

(declare-fun d!38355 () Bool)

(assert (=> d!38355 (= (map!1387 (_2!1300 lt!65284)) (getCurrentListMap!536 (_keys!4516 (_2!1300 lt!65284)) (_values!2766 (_2!1300 lt!65284)) (mask!7039 (_2!1300 lt!65284)) (extraKeys!2564 (_2!1300 lt!65284)) (zeroValue!2646 (_2!1300 lt!65284)) (minValue!2646 (_2!1300 lt!65284)) #b00000000000000000000000000000000 (defaultEntry!2783 (_2!1300 lt!65284))))))

(declare-fun bs!5269 () Bool)

(assert (= bs!5269 d!38355))

(declare-fun m!148719 () Bool)

(assert (=> bs!5269 m!148719))

(assert (=> b!126392 d!38355))

(declare-fun d!38357 () Bool)

(declare-fun res!61467 () Bool)

(declare-fun e!82989 () Bool)

(assert (=> d!38357 (=> res!61467 e!82989)))

(assert (=> d!38357 (= res!61467 (and ((_ is Cons!1694) (toList!856 call!13571)) (= (_1!1299 (h!2296 (toList!856 call!13571))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38357 (= (containsKey!171 (toList!856 call!13571) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!82989)))

(declare-fun b!127112 () Bool)

(declare-fun e!82990 () Bool)

(assert (=> b!127112 (= e!82989 e!82990)))

(declare-fun res!61468 () Bool)

(assert (=> b!127112 (=> (not res!61468) (not e!82990))))

(assert (=> b!127112 (= res!61468 (and (or (not ((_ is Cons!1694) (toList!856 call!13571))) (bvsle (_1!1299 (h!2296 (toList!856 call!13571))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!856 call!13571)) (bvslt (_1!1299 (h!2296 (toList!856 call!13571))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!127113 () Bool)

(assert (=> b!127113 (= e!82990 (containsKey!171 (t!6045 (toList!856 call!13571)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38357 (not res!61467)) b!127112))

(assert (= (and b!127112 res!61468) b!127113))

(assert (=> b!127113 m!146847))

(declare-fun m!148721 () Bool)

(assert (=> b!127113 m!148721))

(assert (=> d!37983 d!38357))

(declare-fun d!38359 () Bool)

(declare-fun e!82992 () Bool)

(assert (=> d!38359 e!82992))

(declare-fun res!61469 () Bool)

(assert (=> d!38359 (=> res!61469 e!82992)))

(declare-fun lt!65802 () Bool)

(assert (=> d!38359 (= res!61469 (not lt!65802))))

(declare-fun lt!65801 () Bool)

(assert (=> d!38359 (= lt!65802 lt!65801)))

(declare-fun lt!65804 () Unit!3924)

(declare-fun e!82991 () Unit!3924)

(assert (=> d!38359 (= lt!65804 e!82991)))

(declare-fun c!23281 () Bool)

(assert (=> d!38359 (= c!23281 lt!65801)))

(assert (=> d!38359 (= lt!65801 (containsKey!171 (toList!856 lt!65021) lt!65018))))

(assert (=> d!38359 (= (contains!877 lt!65021 lt!65018) lt!65802)))

(declare-fun b!127114 () Bool)

(declare-fun lt!65803 () Unit!3924)

(assert (=> b!127114 (= e!82991 lt!65803)))

(assert (=> b!127114 (= lt!65803 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65021) lt!65018))))

(assert (=> b!127114 (isDefined!120 (getValueByKey!167 (toList!856 lt!65021) lt!65018))))

(declare-fun b!127115 () Bool)

(declare-fun Unit!3967 () Unit!3924)

(assert (=> b!127115 (= e!82991 Unit!3967)))

(declare-fun b!127116 () Bool)

(assert (=> b!127116 (= e!82992 (isDefined!120 (getValueByKey!167 (toList!856 lt!65021) lt!65018)))))

(assert (= (and d!38359 c!23281) b!127114))

(assert (= (and d!38359 (not c!23281)) b!127115))

(assert (= (and d!38359 (not res!61469)) b!127116))

(declare-fun m!148723 () Bool)

(assert (=> d!38359 m!148723))

(declare-fun m!148725 () Bool)

(assert (=> b!127114 m!148725))

(assert (=> b!127114 m!147465))

(assert (=> b!127114 m!147465))

(declare-fun m!148727 () Bool)

(assert (=> b!127114 m!148727))

(assert (=> b!127116 m!147465))

(assert (=> b!127116 m!147465))

(assert (=> b!127116 m!148727))

(assert (=> d!38029 d!38359))

(assert (=> d!38029 d!38023))

(declare-fun d!38361 () Bool)

(assert (=> d!38361 (= (apply!111 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65018) (apply!111 lt!65021 lt!65018))))

(assert (=> d!38361 true))

(declare-fun _$34!949 () Unit!3924)

(assert (=> d!38361 (= (choose!764 lt!65021 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65018) _$34!949)))

(declare-fun bs!5270 () Bool)

(assert (= bs!5270 d!38361))

(assert (=> bs!5270 m!146907))

(assert (=> bs!5270 m!146907))

(assert (=> bs!5270 m!146909))

(assert (=> bs!5270 m!146899))

(assert (=> d!38029 d!38361))

(assert (=> d!38029 d!38035))

(assert (=> d!38029 d!38037))

(declare-fun d!38363 () Bool)

(declare-fun isEmpty!398 (List!1698) Bool)

(assert (=> d!38363 (= (isEmpty!397 lt!65390) (isEmpty!398 (toList!856 lt!65390)))))

(declare-fun bs!5271 () Bool)

(assert (= bs!5271 d!38363))

(declare-fun m!148729 () Bool)

(assert (=> bs!5271 m!148729))

(assert (=> b!126512 d!38363))

(declare-fun d!38365 () Bool)

(assert (=> d!38365 (= (get!1447 (getValueByKey!167 (toList!856 lt!65028) lt!65029)) (v!3128 (getValueByKey!167 (toList!856 lt!65028) lt!65029)))))

(assert (=> d!38017 d!38365))

(declare-fun d!38367 () Bool)

(declare-fun c!23282 () Bool)

(assert (=> d!38367 (= c!23282 (and ((_ is Cons!1694) (toList!856 lt!65028)) (= (_1!1299 (h!2296 (toList!856 lt!65028))) lt!65029)))))

(declare-fun e!82993 () Option!173)

(assert (=> d!38367 (= (getValueByKey!167 (toList!856 lt!65028) lt!65029) e!82993)))

(declare-fun b!127118 () Bool)

(declare-fun e!82994 () Option!173)

(assert (=> b!127118 (= e!82993 e!82994)))

(declare-fun c!23283 () Bool)

(assert (=> b!127118 (= c!23283 (and ((_ is Cons!1694) (toList!856 lt!65028)) (not (= (_1!1299 (h!2296 (toList!856 lt!65028))) lt!65029))))))

(declare-fun b!127120 () Bool)

(assert (=> b!127120 (= e!82994 None!171)))

(declare-fun b!127119 () Bool)

(assert (=> b!127119 (= e!82994 (getValueByKey!167 (t!6045 (toList!856 lt!65028)) lt!65029))))

(declare-fun b!127117 () Bool)

(assert (=> b!127117 (= e!82993 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65028)))))))

(assert (= (and d!38367 c!23282) b!127117))

(assert (= (and d!38367 (not c!23282)) b!127118))

(assert (= (and b!127118 c!23283) b!127119))

(assert (= (and b!127118 (not c!23283)) b!127120))

(declare-fun m!148731 () Bool)

(assert (=> b!127119 m!148731))

(assert (=> d!38017 d!38367))

(assert (=> b!126388 d!37957))

(assert (=> b!126342 d!38055))

(declare-fun d!38369 () Bool)

(assert (=> d!38369 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!65805 () Unit!3924)

(assert (=> d!38369 (= lt!65805 (choose!761 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!82995 () Bool)

(assert (=> d!38369 e!82995))

(declare-fun res!61470 () Bool)

(assert (=> d!38369 (=> (not res!61470) (not e!82995))))

(assert (=> d!38369 (= res!61470 (isStrictlySorted!317 (toList!856 lt!65008)))))

(assert (=> d!38369 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65805)))

(declare-fun b!127121 () Bool)

(assert (=> b!127121 (= e!82995 (containsKey!171 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38369 res!61470) b!127121))

(assert (=> d!38369 m!146895))

(assert (=> d!38369 m!147031))

(assert (=> d!38369 m!147031))

(assert (=> d!38369 m!147531))

(assert (=> d!38369 m!146895))

(declare-fun m!148733 () Bool)

(assert (=> d!38369 m!148733))

(assert (=> d!38369 m!148437))

(assert (=> b!127121 m!146895))

(assert (=> b!127121 m!147527))

(assert (=> b!126524 d!38369))

(assert (=> b!126524 d!38065))

(assert (=> b!126524 d!38067))

(assert (=> b!126427 d!38075))

(assert (=> b!126384 d!38057))

(declare-fun d!38371 () Bool)

(assert (=> d!38371 (= (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65009)) (v!3128 (getValueByKey!167 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65009)))))

(assert (=> d!38041 d!38371))

(declare-fun c!23284 () Bool)

(declare-fun d!38373 () Bool)

(assert (=> d!38373 (= c!23284 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65009)))))

(declare-fun e!82996 () Option!173)

(assert (=> d!38373 (= (getValueByKey!167 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65009) e!82996)))

(declare-fun b!127123 () Bool)

(declare-fun e!82997 () Option!173)

(assert (=> b!127123 (= e!82996 e!82997)))

(declare-fun c!23285 () Bool)

(assert (=> b!127123 (= c!23285 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65009))))))

(declare-fun b!127125 () Bool)

(assert (=> b!127125 (= e!82997 None!171)))

(declare-fun b!127124 () Bool)

(assert (=> b!127124 (= e!82997 (getValueByKey!167 (t!6045 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65009))))

(declare-fun b!127122 () Bool)

(assert (=> b!127122 (= e!82996 (Some!172 (_2!1299 (h!2296 (toList!856 (+!170 lt!65016 (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38373 c!23284) b!127122))

(assert (= (and d!38373 (not c!23284)) b!127123))

(assert (= (and b!127123 c!23285) b!127124))

(assert (= (and b!127123 (not c!23285)) b!127125))

(declare-fun m!148735 () Bool)

(assert (=> b!127124 m!148735))

(assert (=> d!38041 d!38373))

(declare-fun d!38375 () Bool)

(assert (=> d!38375 (= (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65018)) (v!3128 (getValueByKey!167 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65018)))))

(assert (=> d!38023 d!38375))

(declare-fun d!38377 () Bool)

(declare-fun c!23286 () Bool)

(assert (=> d!38377 (= c!23286 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65018)))))

(declare-fun e!82998 () Option!173)

(assert (=> d!38377 (= (getValueByKey!167 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65018) e!82998)))

(declare-fun b!127127 () Bool)

(declare-fun e!82999 () Option!173)

(assert (=> b!127127 (= e!82998 e!82999)))

(declare-fun c!23287 () Bool)

(assert (=> b!127127 (= c!23287 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65018))))))

(declare-fun b!127129 () Bool)

(assert (=> b!127129 (= e!82999 None!171)))

(declare-fun b!127128 () Bool)

(assert (=> b!127128 (= e!82999 (getValueByKey!167 (t!6045 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65018))))

(declare-fun b!127126 () Bool)

(assert (=> b!127126 (= e!82998 (Some!172 (_2!1299 (h!2296 (toList!856 (+!170 lt!65021 (tuple2!2577 lt!65026 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38377 c!23286) b!127126))

(assert (= (and d!38377 (not c!23286)) b!127127))

(assert (= (and b!127127 c!23287) b!127128))

(assert (= (and b!127127 (not c!23287)) b!127129))

(declare-fun m!148737 () Bool)

(assert (=> b!127128 m!148737))

(assert (=> d!38023 d!38377))

(assert (=> b!126552 d!38075))

(assert (=> b!126450 d!38075))

(declare-fun d!38379 () Bool)

(declare-fun c!23288 () Bool)

(assert (=> d!38379 (= c!23288 (and ((_ is Cons!1694) (toList!856 lt!65422)) (= (_1!1299 (h!2296 (toList!856 lt!65422))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83000 () Option!173)

(assert (=> d!38379 (= (getValueByKey!167 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!83000)))

(declare-fun b!127131 () Bool)

(declare-fun e!83001 () Option!173)

(assert (=> b!127131 (= e!83000 e!83001)))

(declare-fun c!23289 () Bool)

(assert (=> b!127131 (= c!23289 (and ((_ is Cons!1694) (toList!856 lt!65422)) (not (= (_1!1299 (h!2296 (toList!856 lt!65422))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127133 () Bool)

(assert (=> b!127133 (= e!83001 None!171)))

(declare-fun b!127132 () Bool)

(assert (=> b!127132 (= e!83001 (getValueByKey!167 (t!6045 (toList!856 lt!65422)) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127130 () Bool)

(assert (=> b!127130 (= e!83000 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65422)))))))

(assert (= (and d!38379 c!23288) b!127130))

(assert (= (and d!38379 (not c!23288)) b!127131))

(assert (= (and b!127131 c!23289) b!127132))

(assert (= (and b!127131 (not c!23289)) b!127133))

(declare-fun m!148739 () Bool)

(assert (=> b!127132 m!148739))

(assert (=> b!126554 d!38379))

(declare-fun lt!65806 () Bool)

(declare-fun d!38381 () Bool)

(assert (=> d!38381 (= lt!65806 (select (content!125 (toList!856 lt!65146)) (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83002 () Bool)

(assert (=> d!38381 (= lt!65806 e!83002)))

(declare-fun res!61472 () Bool)

(assert (=> d!38381 (=> (not res!61472) (not e!83002))))

(assert (=> d!38381 (= res!61472 ((_ is Cons!1694) (toList!856 lt!65146)))))

(assert (=> d!38381 (= (contains!879 (toList!856 lt!65146) (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!65806)))

(declare-fun b!127134 () Bool)

(declare-fun e!83003 () Bool)

(assert (=> b!127134 (= e!83002 e!83003)))

(declare-fun res!61471 () Bool)

(assert (=> b!127134 (=> res!61471 e!83003)))

(assert (=> b!127134 (= res!61471 (= (h!2296 (toList!856 lt!65146)) (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127135 () Bool)

(assert (=> b!127135 (= e!83003 (contains!879 (t!6045 (toList!856 lt!65146)) (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38381 res!61472) b!127134))

(assert (= (and b!127134 (not res!61471)) b!127135))

(declare-fun m!148741 () Bool)

(assert (=> d!38381 m!148741))

(declare-fun m!148743 () Bool)

(assert (=> d!38381 m!148743))

(declare-fun m!148745 () Bool)

(assert (=> b!127135 m!148745))

(assert (=> b!126276 d!38381))

(declare-fun d!38383 () Bool)

(assert (=> d!38383 (= (size!2493 newMap!16) (bvadd (_size!580 newMap!16) (bvsdiv (bvadd (extraKeys!2564 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!126266 d!38383))

(assert (=> b!126345 d!38079))

(assert (=> b!126345 d!38081))

(assert (=> d!38057 d!37977))

(declare-fun d!38385 () Bool)

(declare-fun e!83006 () Bool)

(assert (=> d!38385 e!83006))

(declare-fun res!61478 () Bool)

(assert (=> d!38385 (=> (not res!61478) (not e!83006))))

(declare-fun lt!65809 () SeekEntryResult!270)

(assert (=> d!38385 (= res!61478 ((_ is Found!270) lt!65809))))

(assert (=> d!38385 (= lt!65809 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(assert (=> d!38385 true))

(declare-fun _$33!105 () Unit!3924)

(assert (=> d!38385 (= (choose!767 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)) _$33!105)))

(declare-fun b!127140 () Bool)

(declare-fun res!61477 () Bool)

(assert (=> b!127140 (=> (not res!61477) (not e!83006))))

(assert (=> b!127140 (= res!61477 (inRange!0 (index!3236 lt!65809) (mask!7039 newMap!16)))))

(declare-fun b!127141 () Bool)

(assert (=> b!127141 (= e!83006 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65809)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38385 res!61478) b!127140))

(assert (= (and b!127140 res!61477) b!127141))

(assert (=> d!38385 m!146847))

(assert (=> d!38385 m!146977))

(declare-fun m!148747 () Bool)

(assert (=> b!127140 m!148747))

(declare-fun m!148749 () Bool)

(assert (=> b!127141 m!148749))

(assert (=> d!38057 d!38385))

(assert (=> d!38057 d!38171))

(declare-fun b!127142 () Bool)

(declare-fun e!83009 () Bool)

(declare-fun e!83008 () Bool)

(assert (=> b!127142 (= e!83009 e!83008)))

(declare-fun lt!65810 () (_ BitVec 64))

(assert (=> b!127142 (= lt!65810 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000))))

(declare-fun lt!65811 () Unit!3924)

(assert (=> b!127142 (= lt!65811 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4516 (_2!1300 lt!65097)) lt!65810 #b00000000000000000000000000000000))))

(assert (=> b!127142 (arrayContainsKey!0 (_keys!4516 (_2!1300 lt!65097)) lt!65810 #b00000000000000000000000000000000)))

(declare-fun lt!65812 () Unit!3924)

(assert (=> b!127142 (= lt!65812 lt!65811)))

(declare-fun res!61479 () Bool)

(assert (=> b!127142 (= res!61479 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000) (_keys!4516 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097))) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!127142 (=> (not res!61479) (not e!83008))))

(declare-fun b!127143 () Bool)

(declare-fun e!83007 () Bool)

(assert (=> b!127143 (= e!83007 e!83009)))

(declare-fun c!23290 () Bool)

(assert (=> b!127143 (= c!23290 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun bm!13716 () Bool)

(declare-fun call!13719 () Bool)

(assert (=> bm!13716 (= call!13719 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4516 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097))))))

(declare-fun b!127144 () Bool)

(assert (=> b!127144 (= e!83008 call!13719)))

(declare-fun d!38387 () Bool)

(declare-fun res!61480 () Bool)

(assert (=> d!38387 (=> res!61480 e!83007)))

(assert (=> d!38387 (= res!61480 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(assert (=> d!38387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 (_2!1300 lt!65097)) (mask!7039 (_2!1300 lt!65097))) e!83007)))

(declare-fun b!127145 () Bool)

(assert (=> b!127145 (= e!83009 call!13719)))

(assert (= (and d!38387 (not res!61480)) b!127143))

(assert (= (and b!127143 c!23290) b!127142))

(assert (= (and b!127143 (not c!23290)) b!127145))

(assert (= (and b!127142 res!61479) b!127144))

(assert (= (or b!127144 b!127145) bm!13716))

(assert (=> b!127142 m!148441))

(declare-fun m!148751 () Bool)

(assert (=> b!127142 m!148751))

(declare-fun m!148753 () Bool)

(assert (=> b!127142 m!148753))

(assert (=> b!127142 m!148441))

(declare-fun m!148755 () Bool)

(assert (=> b!127142 m!148755))

(assert (=> b!127143 m!148441))

(assert (=> b!127143 m!148441))

(assert (=> b!127143 m!148443))

(declare-fun m!148757 () Bool)

(assert (=> bm!13716 m!148757))

(assert (=> b!126462 d!38387))

(declare-fun d!38389 () Bool)

(declare-fun res!61481 () Bool)

(declare-fun e!83010 () Bool)

(assert (=> d!38389 (=> res!61481 e!83010)))

(assert (=> d!38389 (= res!61481 (and ((_ is Cons!1694) (t!6045 (toList!856 lt!64952))) (= (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38389 (= (containsKey!171 (t!6045 (toList!856 lt!64952)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!83010)))

(declare-fun b!127146 () Bool)

(declare-fun e!83011 () Bool)

(assert (=> b!127146 (= e!83010 e!83011)))

(declare-fun res!61482 () Bool)

(assert (=> b!127146 (=> (not res!61482) (not e!83011))))

(assert (=> b!127146 (= res!61482 (and (or (not ((_ is Cons!1694) (t!6045 (toList!856 lt!64952)))) (bvsle (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1694) (t!6045 (toList!856 lt!64952))) (bvslt (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!127147 () Bool)

(assert (=> b!127147 (= e!83011 (containsKey!171 (t!6045 (t!6045 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38389 (not res!61481)) b!127146))

(assert (= (and b!127146 res!61482) b!127147))

(assert (=> b!127147 m!146847))

(declare-fun m!148759 () Bool)

(assert (=> b!127147 m!148759))

(assert (=> b!126532 d!38389))

(declare-fun c!23291 () Bool)

(declare-fun d!38391 () Bool)

(assert (=> d!38391 (= c!23291 (and ((_ is Cons!1694) (toList!856 lt!65402)) (= (_1!1299 (h!2296 (toList!856 lt!65402))) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83012 () Option!173)

(assert (=> d!38391 (= (getValueByKey!167 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!83012)))

(declare-fun b!127149 () Bool)

(declare-fun e!83013 () Option!173)

(assert (=> b!127149 (= e!83012 e!83013)))

(declare-fun c!23292 () Bool)

(assert (=> b!127149 (= c!23292 (and ((_ is Cons!1694) (toList!856 lt!65402)) (not (= (_1!1299 (h!2296 (toList!856 lt!65402))) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127151 () Bool)

(assert (=> b!127151 (= e!83013 None!171)))

(declare-fun b!127150 () Bool)

(assert (=> b!127150 (= e!83013 (getValueByKey!167 (t!6045 (toList!856 lt!65402)) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127148 () Bool)

(assert (=> b!127148 (= e!83012 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65402)))))))

(assert (= (and d!38391 c!23291) b!127148))

(assert (= (and d!38391 (not c!23291)) b!127149))

(assert (= (and b!127149 c!23292) b!127150))

(assert (= (and b!127149 (not c!23292)) b!127151))

(declare-fun m!148761 () Bool)

(assert (=> b!127150 m!148761))

(assert (=> b!126522 d!38391))

(declare-fun d!38393 () Bool)

(declare-fun e!83015 () Bool)

(assert (=> d!38393 e!83015))

(declare-fun res!61483 () Bool)

(assert (=> d!38393 (=> res!61483 e!83015)))

(declare-fun lt!65814 () Bool)

(assert (=> d!38393 (= res!61483 (not lt!65814))))

(declare-fun lt!65813 () Bool)

(assert (=> d!38393 (= lt!65814 lt!65813)))

(declare-fun lt!65816 () Unit!3924)

(declare-fun e!83014 () Unit!3924)

(assert (=> d!38393 (= lt!65816 e!83014)))

(declare-fun c!23293 () Bool)

(assert (=> d!38393 (= c!23293 lt!65813)))

(assert (=> d!38393 (= lt!65813 (containsKey!171 (toList!856 lt!65299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38393 (= (contains!877 lt!65299 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65814)))

(declare-fun b!127152 () Bool)

(declare-fun lt!65815 () Unit!3924)

(assert (=> b!127152 (= e!83014 lt!65815)))

(assert (=> b!127152 (= lt!65815 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127152 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127153 () Bool)

(declare-fun Unit!3968 () Unit!3924)

(assert (=> b!127153 (= e!83014 Unit!3968)))

(declare-fun b!127154 () Bool)

(assert (=> b!127154 (= e!83015 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38393 c!23293) b!127152))

(assert (= (and d!38393 (not c!23293)) b!127153))

(assert (= (and d!38393 (not res!61483)) b!127154))

(declare-fun m!148763 () Bool)

(assert (=> d!38393 m!148763))

(declare-fun m!148765 () Bool)

(assert (=> b!127152 m!148765))

(declare-fun m!148767 () Bool)

(assert (=> b!127152 m!148767))

(assert (=> b!127152 m!148767))

(declare-fun m!148769 () Bool)

(assert (=> b!127152 m!148769))

(assert (=> b!127154 m!148767))

(assert (=> b!127154 m!148767))

(assert (=> b!127154 m!148769))

(assert (=> bm!13618 d!38393))

(declare-fun d!38395 () Bool)

(assert (=> d!38395 (= (apply!111 lt!65166 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) (get!1447 (getValueByKey!167 (toList!856 lt!65166) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5272 () Bool)

(assert (= bs!5272 d!38395))

(assert (=> bs!5272 m!147041))

(assert (=> bs!5272 m!148413))

(assert (=> bs!5272 m!148413))

(declare-fun m!148771 () Bool)

(assert (=> bs!5272 m!148771))

(assert (=> b!126335 d!38395))

(declare-fun c!23294 () Bool)

(declare-fun d!38397 () Bool)

(assert (=> d!38397 (= c!23294 ((_ is ValueCellFull!1077) (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000)))))

(declare-fun e!83016 () V!3435)

(assert (=> d!38397 (= (get!1443 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83016)))

(declare-fun b!127155 () Bool)

(assert (=> b!127155 (= e!83016 (get!1445 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127156 () Bool)

(assert (=> b!127156 (= e!83016 (get!1446 (select (arr!2226 (ite (or c!23022 c!23029) (_values!2766 newMap!16) lt!65109)) #b00000000000000000000000000000000) (dynLambda!413 (defaultEntry!2783 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38397 c!23294) b!127155))

(assert (= (and d!38397 (not c!23294)) b!127156))

(assert (=> b!127155 m!147147))

(assert (=> b!127155 m!147145))

(declare-fun m!148773 () Bool)

(assert (=> b!127155 m!148773))

(assert (=> b!127156 m!147147))

(assert (=> b!127156 m!147145))

(declare-fun m!148775 () Bool)

(assert (=> b!127156 m!148775))

(assert (=> b!126335 d!38397))

(declare-fun d!38399 () Bool)

(assert (=> d!38399 (= (get!1445 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3123 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!126218 d!38399))

(assert (=> d!38027 d!38043))

(assert (=> d!38027 d!38045))

(declare-fun d!38401 () Bool)

(assert (=> d!38401 (contains!877 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65027)))

(assert (=> d!38401 true))

(declare-fun _$35!371 () Unit!3924)

(assert (=> d!38401 (= (choose!765 lt!65020 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))) lt!65027) _$35!371)))

(declare-fun bs!5273 () Bool)

(assert (= bs!5273 d!38401))

(assert (=> bs!5273 m!146905))

(assert (=> bs!5273 m!146905))

(assert (=> bs!5273 m!146915))

(assert (=> d!38027 d!38401))

(declare-fun d!38403 () Bool)

(declare-fun e!83018 () Bool)

(assert (=> d!38403 e!83018))

(declare-fun res!61484 () Bool)

(assert (=> d!38403 (=> res!61484 e!83018)))

(declare-fun lt!65818 () Bool)

(assert (=> d!38403 (= res!61484 (not lt!65818))))

(declare-fun lt!65817 () Bool)

(assert (=> d!38403 (= lt!65818 lt!65817)))

(declare-fun lt!65820 () Unit!3924)

(declare-fun e!83017 () Unit!3924)

(assert (=> d!38403 (= lt!65820 e!83017)))

(declare-fun c!23295 () Bool)

(assert (=> d!38403 (= c!23295 lt!65817)))

(assert (=> d!38403 (= lt!65817 (containsKey!171 (toList!856 lt!65020) lt!65027))))

(assert (=> d!38403 (= (contains!877 lt!65020 lt!65027) lt!65818)))

(declare-fun b!127158 () Bool)

(declare-fun lt!65819 () Unit!3924)

(assert (=> b!127158 (= e!83017 lt!65819)))

(assert (=> b!127158 (= lt!65819 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65020) lt!65027))))

(assert (=> b!127158 (isDefined!120 (getValueByKey!167 (toList!856 lt!65020) lt!65027))))

(declare-fun b!127159 () Bool)

(declare-fun Unit!3969 () Unit!3924)

(assert (=> b!127159 (= e!83017 Unit!3969)))

(declare-fun b!127160 () Bool)

(assert (=> b!127160 (= e!83018 (isDefined!120 (getValueByKey!167 (toList!856 lt!65020) lt!65027)))))

(assert (= (and d!38403 c!23295) b!127158))

(assert (= (and d!38403 (not c!23295)) b!127159))

(assert (= (and d!38403 (not res!61484)) b!127160))

(declare-fun m!148777 () Bool)

(assert (=> d!38403 m!148777))

(declare-fun m!148779 () Bool)

(assert (=> b!127158 m!148779))

(declare-fun m!148781 () Bool)

(assert (=> b!127158 m!148781))

(assert (=> b!127158 m!148781))

(declare-fun m!148783 () Bool)

(assert (=> b!127158 m!148783))

(assert (=> b!127160 m!148781))

(assert (=> b!127160 m!148781))

(assert (=> b!127160 m!148783))

(assert (=> d!38027 d!38403))

(declare-fun d!38405 () Bool)

(declare-fun e!83020 () Bool)

(assert (=> d!38405 e!83020))

(declare-fun res!61485 () Bool)

(assert (=> d!38405 (=> res!61485 e!83020)))

(declare-fun lt!65822 () Bool)

(assert (=> d!38405 (= res!61485 (not lt!65822))))

(declare-fun lt!65821 () Bool)

(assert (=> d!38405 (= lt!65822 lt!65821)))

(declare-fun lt!65824 () Unit!3924)

(declare-fun e!83019 () Unit!3924)

(assert (=> d!38405 (= lt!65824 e!83019)))

(declare-fun c!23296 () Bool)

(assert (=> d!38405 (= c!23296 lt!65821)))

(assert (=> d!38405 (= lt!65821 (containsKey!171 (toList!856 lt!65325) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38405 (= (contains!877 lt!65325 #b0000000000000000000000000000000000000000000000000000000000000000) lt!65822)))

(declare-fun b!127161 () Bool)

(declare-fun lt!65823 () Unit!3924)

(assert (=> b!127161 (= e!83019 lt!65823)))

(assert (=> b!127161 (= lt!65823 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65325) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127161 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127162 () Bool)

(declare-fun Unit!3970 () Unit!3924)

(assert (=> b!127162 (= e!83019 Unit!3970)))

(declare-fun b!127163 () Bool)

(assert (=> b!127163 (= e!83020 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38405 c!23296) b!127161))

(assert (= (and d!38405 (not c!23296)) b!127162))

(assert (= (and d!38405 (not res!61485)) b!127163))

(declare-fun m!148785 () Bool)

(assert (=> d!38405 m!148785))

(declare-fun m!148787 () Bool)

(assert (=> b!127161 m!148787))

(declare-fun m!148789 () Bool)

(assert (=> b!127161 m!148789))

(assert (=> b!127161 m!148789))

(declare-fun m!148791 () Bool)

(assert (=> b!127161 m!148791))

(assert (=> b!127163 m!148789))

(assert (=> b!127163 m!148789))

(assert (=> b!127163 m!148791))

(assert (=> bm!13625 d!38405))

(declare-fun d!38407 () Bool)

(declare-fun e!83022 () Bool)

(assert (=> d!38407 e!83022))

(declare-fun res!61486 () Bool)

(assert (=> d!38407 (=> res!61486 e!83022)))

(declare-fun lt!65826 () Bool)

(assert (=> d!38407 (= res!61486 (not lt!65826))))

(declare-fun lt!65825 () Bool)

(assert (=> d!38407 (= lt!65826 lt!65825)))

(declare-fun lt!65828 () Unit!3924)

(declare-fun e!83021 () Unit!3924)

(assert (=> d!38407 (= lt!65828 e!83021)))

(declare-fun c!23297 () Bool)

(assert (=> d!38407 (= c!23297 lt!65825)))

(assert (=> d!38407 (= lt!65825 (containsKey!171 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38407 (= (contains!877 lt!65422 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65826)))

(declare-fun b!127164 () Bool)

(declare-fun lt!65827 () Unit!3924)

(assert (=> b!127164 (= e!83021 lt!65827)))

(assert (=> b!127164 (= lt!65827 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127164 (isDefined!120 (getValueByKey!167 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127165 () Bool)

(declare-fun Unit!3971 () Unit!3924)

(assert (=> b!127165 (= e!83021 Unit!3971)))

(declare-fun b!127166 () Bool)

(assert (=> b!127166 (= e!83022 (isDefined!120 (getValueByKey!167 (toList!856 lt!65422) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38407 c!23297) b!127164))

(assert (= (and d!38407 (not c!23297)) b!127165))

(assert (= (and d!38407 (not res!61486)) b!127166))

(declare-fun m!148793 () Bool)

(assert (=> d!38407 m!148793))

(declare-fun m!148795 () Bool)

(assert (=> b!127164 m!148795))

(assert (=> b!127164 m!147565))

(assert (=> b!127164 m!147565))

(declare-fun m!148797 () Bool)

(assert (=> b!127164 m!148797))

(assert (=> b!127166 m!147565))

(assert (=> b!127166 m!147565))

(assert (=> b!127166 m!148797))

(assert (=> d!38063 d!38407))

(declare-fun d!38409 () Bool)

(declare-fun c!23298 () Bool)

(assert (=> d!38409 (= c!23298 (and ((_ is Cons!1694) lt!65420) (= (_1!1299 (h!2296 lt!65420)) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83023 () Option!173)

(assert (=> d!38409 (= (getValueByKey!167 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!83023)))

(declare-fun b!127168 () Bool)

(declare-fun e!83024 () Option!173)

(assert (=> b!127168 (= e!83023 e!83024)))

(declare-fun c!23299 () Bool)

(assert (=> b!127168 (= c!23299 (and ((_ is Cons!1694) lt!65420) (not (= (_1!1299 (h!2296 lt!65420)) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127170 () Bool)

(assert (=> b!127170 (= e!83024 None!171)))

(declare-fun b!127169 () Bool)

(assert (=> b!127169 (= e!83024 (getValueByKey!167 (t!6045 lt!65420) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127167 () Bool)

(assert (=> b!127167 (= e!83023 (Some!172 (_2!1299 (h!2296 lt!65420))))))

(assert (= (and d!38409 c!23298) b!127167))

(assert (= (and d!38409 (not c!23298)) b!127168))

(assert (= (and b!127168 c!23299) b!127169))

(assert (= (and b!127168 (not c!23299)) b!127170))

(declare-fun m!148799 () Bool)

(assert (=> b!127169 m!148799))

(assert (=> d!38063 d!38409))

(declare-fun d!38411 () Bool)

(assert (=> d!38411 (= (getValueByKey!167 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65829 () Unit!3924)

(assert (=> d!38411 (= lt!65829 (choose!770 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83025 () Bool)

(assert (=> d!38411 e!83025))

(declare-fun res!61487 () Bool)

(assert (=> d!38411 (=> (not res!61487) (not e!83025))))

(assert (=> d!38411 (= res!61487 (isStrictlySorted!317 lt!65420))))

(assert (=> d!38411 (= (lemmaContainsTupThenGetReturnValue!82 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65829)))

(declare-fun b!127171 () Bool)

(declare-fun res!61488 () Bool)

(assert (=> b!127171 (=> (not res!61488) (not e!83025))))

(assert (=> b!127171 (= res!61488 (containsKey!171 lt!65420 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127172 () Bool)

(assert (=> b!127172 (= e!83025 (contains!879 lt!65420 (tuple2!2577 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38411 res!61487) b!127171))

(assert (= (and b!127171 res!61488) b!127172))

(assert (=> d!38411 m!147559))

(declare-fun m!148801 () Bool)

(assert (=> d!38411 m!148801))

(declare-fun m!148803 () Bool)

(assert (=> d!38411 m!148803))

(declare-fun m!148805 () Bool)

(assert (=> b!127171 m!148805))

(declare-fun m!148807 () Bool)

(assert (=> b!127172 m!148807))

(assert (=> d!38063 d!38411))

(declare-fun b!127173 () Bool)

(declare-fun e!83026 () List!1698)

(declare-fun c!23303 () Bool)

(declare-fun c!23301 () Bool)

(assert (=> b!127173 (= e!83026 (ite c!23301 (t!6045 (toList!856 call!13513)) (ite c!23303 (Cons!1694 (h!2296 (toList!856 call!13513)) (t!6045 (toList!856 call!13513))) Nil!1695)))))

(declare-fun c!23302 () Bool)

(declare-fun bm!13717 () Bool)

(declare-fun call!13721 () List!1698)

(assert (=> bm!13717 (= call!13721 ($colon$colon!89 e!83026 (ite c!23302 (h!2296 (toList!856 call!13513)) (tuple2!2577 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23300 () Bool)

(assert (=> bm!13717 (= c!23300 c!23302)))

(declare-fun b!127174 () Bool)

(assert (=> b!127174 (= e!83026 (insertStrictlySorted!85 (t!6045 (toList!856 call!13513)) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127175 () Bool)

(declare-fun e!83027 () Bool)

(declare-fun lt!65830 () List!1698)

(assert (=> b!127175 (= e!83027 (contains!879 lt!65830 (tuple2!2577 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127176 () Bool)

(declare-fun e!83030 () List!1698)

(declare-fun call!13720 () List!1698)

(assert (=> b!127176 (= e!83030 call!13720)))

(declare-fun b!127177 () Bool)

(declare-fun e!83029 () List!1698)

(declare-fun call!13722 () List!1698)

(assert (=> b!127177 (= e!83029 call!13722)))

(declare-fun b!127178 () Bool)

(assert (=> b!127178 (= e!83029 call!13722)))

(declare-fun b!127179 () Bool)

(declare-fun e!83028 () List!1698)

(assert (=> b!127179 (= e!83028 call!13721)))

(declare-fun d!38413 () Bool)

(assert (=> d!38413 e!83027))

(declare-fun res!61489 () Bool)

(assert (=> d!38413 (=> (not res!61489) (not e!83027))))

(assert (=> d!38413 (= res!61489 (isStrictlySorted!317 lt!65830))))

(assert (=> d!38413 (= lt!65830 e!83028)))

(assert (=> d!38413 (= c!23302 (and ((_ is Cons!1694) (toList!856 call!13513)) (bvslt (_1!1299 (h!2296 (toList!856 call!13513))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38413 (isStrictlySorted!317 (toList!856 call!13513))))

(assert (=> d!38413 (= (insertStrictlySorted!85 (toList!856 call!13513) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65830)))

(declare-fun bm!13718 () Bool)

(assert (=> bm!13718 (= call!13720 call!13721)))

(declare-fun bm!13719 () Bool)

(assert (=> bm!13719 (= call!13722 call!13720)))

(declare-fun b!127180 () Bool)

(declare-fun res!61490 () Bool)

(assert (=> b!127180 (=> (not res!61490) (not e!83027))))

(assert (=> b!127180 (= res!61490 (containsKey!171 lt!65830 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127181 () Bool)

(assert (=> b!127181 (= c!23303 (and ((_ is Cons!1694) (toList!856 call!13513)) (bvsgt (_1!1299 (h!2296 (toList!856 call!13513))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127181 (= e!83030 e!83029)))

(declare-fun b!127182 () Bool)

(assert (=> b!127182 (= e!83028 e!83030)))

(assert (=> b!127182 (= c!23301 (and ((_ is Cons!1694) (toList!856 call!13513)) (= (_1!1299 (h!2296 (toList!856 call!13513))) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38413 c!23302) b!127179))

(assert (= (and d!38413 (not c!23302)) b!127182))

(assert (= (and b!127182 c!23301) b!127176))

(assert (= (and b!127182 (not c!23301)) b!127181))

(assert (= (and b!127181 c!23303) b!127178))

(assert (= (and b!127181 (not c!23303)) b!127177))

(assert (= (or b!127178 b!127177) bm!13719))

(assert (= (or b!127176 bm!13719) bm!13718))

(assert (= (or b!127179 bm!13718) bm!13717))

(assert (= (and bm!13717 c!23300) b!127174))

(assert (= (and bm!13717 (not c!23300)) b!127173))

(assert (= (and d!38413 res!61489) b!127180))

(assert (= (and b!127180 res!61490) b!127175))

(declare-fun m!148809 () Bool)

(assert (=> b!127174 m!148809))

(declare-fun m!148811 () Bool)

(assert (=> b!127175 m!148811))

(declare-fun m!148813 () Bool)

(assert (=> d!38413 m!148813))

(declare-fun m!148815 () Bool)

(assert (=> d!38413 m!148815))

(declare-fun m!148817 () Bool)

(assert (=> b!127180 m!148817))

(declare-fun m!148819 () Bool)

(assert (=> bm!13717 m!148819))

(assert (=> d!38063 d!38413))

(declare-fun b!127183 () Bool)

(declare-fun e!83033 () Bool)

(declare-fun e!83032 () Bool)

(assert (=> b!127183 (= e!83033 e!83032)))

(declare-fun lt!65831 () (_ BitVec 64))

(assert (=> b!127183 (= lt!65831 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!65832 () Unit!3924)

(assert (=> b!127183 (= lt!65832 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) lt!65831 #b00000000000000000000000000000000))))

(assert (=> b!127183 (arrayContainsKey!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) lt!65831 #b00000000000000000000000000000000)))

(declare-fun lt!65833 () Unit!3924)

(assert (=> b!127183 (= lt!65833 lt!65832)))

(declare-fun res!61491 () Bool)

(assert (=> b!127183 (= res!61491 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000) (_keys!4516 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992)))) (Found!270 #b00000000000000000000000000000000)))))

(assert (=> b!127183 (=> (not res!61491) (not e!83032))))

(declare-fun b!127184 () Bool)

(declare-fun e!83031 () Bool)

(assert (=> b!127184 (= e!83031 e!83033)))

(declare-fun c!23304 () Bool)

(assert (=> b!127184 (= c!23304 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13720 () Bool)

(declare-fun call!13723 () Bool)

(assert (=> bm!13720 (= call!13723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4516 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!127185 () Bool)

(assert (=> b!127185 (= e!83032 call!13723)))

(declare-fun d!38415 () Bool)

(declare-fun res!61492 () Bool)

(assert (=> d!38415 (=> res!61492 e!83031)))

(assert (=> d!38415 (= res!61492 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (mask!7039 (v!3124 (underlying!439 thiss!992)))) e!83031)))

(declare-fun b!127186 () Bool)

(assert (=> b!127186 (= e!83033 call!13723)))

(assert (= (and d!38415 (not res!61492)) b!127184))

(assert (= (and b!127184 c!23304) b!127183))

(assert (= (and b!127184 (not c!23304)) b!127186))

(assert (= (and b!127183 res!61491) b!127185))

(assert (= (or b!127185 b!127186) bm!13720))

(assert (=> b!127183 m!148575))

(declare-fun m!148821 () Bool)

(assert (=> b!127183 m!148821))

(declare-fun m!148823 () Bool)

(assert (=> b!127183 m!148823))

(assert (=> b!127183 m!148575))

(declare-fun m!148825 () Bool)

(assert (=> b!127183 m!148825))

(assert (=> b!127184 m!148575))

(assert (=> b!127184 m!148575))

(assert (=> b!127184 m!148577))

(declare-fun m!148827 () Bool)

(assert (=> bm!13720 m!148827))

(assert (=> b!126468 d!38415))

(assert (=> b!126395 d!38355))

(declare-fun d!38417 () Bool)

(declare-fun e!83034 () Bool)

(assert (=> d!38417 e!83034))

(declare-fun res!61493 () Bool)

(assert (=> d!38417 (=> (not res!61493) (not e!83034))))

(declare-fun lt!65836 () ListLongMap!1681)

(assert (=> d!38417 (= res!61493 (contains!877 lt!65836 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65834 () List!1698)

(assert (=> d!38417 (= lt!65836 (ListLongMap!1682 lt!65834))))

(declare-fun lt!65835 () Unit!3924)

(declare-fun lt!65837 () Unit!3924)

(assert (=> d!38417 (= lt!65835 lt!65837)))

(assert (=> d!38417 (= (getValueByKey!167 lt!65834 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38417 (= lt!65837 (lemmaContainsTupThenGetReturnValue!82 lt!65834 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38417 (= lt!65834 (insertStrictlySorted!85 (toList!856 (map!1387 newMap!16)) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38417 (= (+!170 (map!1387 newMap!16) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65836)))

(declare-fun b!127187 () Bool)

(declare-fun res!61494 () Bool)

(assert (=> b!127187 (=> (not res!61494) (not e!83034))))

(assert (=> b!127187 (= res!61494 (= (getValueByKey!167 (toList!856 lt!65836) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127188 () Bool)

(assert (=> b!127188 (= e!83034 (contains!879 (toList!856 lt!65836) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38417 res!61493) b!127187))

(assert (= (and b!127187 res!61494) b!127188))

(declare-fun m!148829 () Bool)

(assert (=> d!38417 m!148829))

(declare-fun m!148831 () Bool)

(assert (=> d!38417 m!148831))

(declare-fun m!148833 () Bool)

(assert (=> d!38417 m!148833))

(declare-fun m!148835 () Bool)

(assert (=> d!38417 m!148835))

(declare-fun m!148837 () Bool)

(assert (=> b!127187 m!148837))

(declare-fun m!148839 () Bool)

(assert (=> b!127188 m!148839))

(assert (=> b!126395 d!38417))

(assert (=> b!126395 d!37927))

(assert (=> d!37959 d!38171))

(declare-fun d!38419 () Bool)

(declare-fun c!23305 () Bool)

(assert (=> d!38419 (= c!23305 (and ((_ is Cons!1694) (toList!856 lt!65323)) (= (_1!1299 (h!2296 (toList!856 lt!65323))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!83035 () Option!173)

(assert (=> d!38419 (= (getValueByKey!167 (toList!856 lt!65323) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!83035)))

(declare-fun b!127190 () Bool)

(declare-fun e!83036 () Option!173)

(assert (=> b!127190 (= e!83035 e!83036)))

(declare-fun c!23306 () Bool)

(assert (=> b!127190 (= c!23306 (and ((_ is Cons!1694) (toList!856 lt!65323)) (not (= (_1!1299 (h!2296 (toList!856 lt!65323))) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!127192 () Bool)

(assert (=> b!127192 (= e!83036 None!171)))

(declare-fun b!127191 () Bool)

(assert (=> b!127191 (= e!83036 (getValueByKey!167 (t!6045 (toList!856 lt!65323)) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!127189 () Bool)

(assert (=> b!127189 (= e!83035 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65323)))))))

(assert (= (and d!38419 c!23305) b!127189))

(assert (= (and d!38419 (not c!23305)) b!127190))

(assert (= (and b!127190 c!23306) b!127191))

(assert (= (and b!127190 (not c!23306)) b!127192))

(declare-fun m!148841 () Bool)

(assert (=> b!127191 m!148841))

(assert (=> b!126430 d!38419))

(declare-fun d!38421 () Bool)

(declare-fun res!61495 () Bool)

(declare-fun e!83037 () Bool)

(assert (=> d!38421 (=> res!61495 e!83037)))

(assert (=> d!38421 (= res!61495 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38421 (= (containsKey!171 (toList!856 lt!65008) #b0000000000000000000000000000000000000000000000000000000000000000) e!83037)))

(declare-fun b!127193 () Bool)

(declare-fun e!83038 () Bool)

(assert (=> b!127193 (= e!83037 e!83038)))

(declare-fun res!61496 () Bool)

(assert (=> b!127193 (=> (not res!61496) (not e!83038))))

(assert (=> b!127193 (= res!61496 (and (or (not ((_ is Cons!1694) (toList!856 lt!65008))) (bvsle (_1!1299 (h!2296 (toList!856 lt!65008))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1694) (toList!856 lt!65008)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65008))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127194 () Bool)

(assert (=> b!127194 (= e!83038 (containsKey!171 (t!6045 (toList!856 lt!65008)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38421 (not res!61495)) b!127193))

(assert (= (and b!127193 res!61496) b!127194))

(declare-fun m!148843 () Bool)

(assert (=> b!127194 m!148843))

(assert (=> d!37989 d!38421))

(declare-fun d!38423 () Bool)

(assert (=> d!38423 (= (inRange!0 (index!3236 lt!65415) (mask!7039 newMap!16)) (and (bvsge (index!3236 lt!65415) #b00000000000000000000000000000000) (bvslt (index!3236 lt!65415) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!126537 d!38423))

(declare-fun c!23307 () Bool)

(declare-fun d!38425 () Bool)

(assert (=> d!38425 (= c!23307 (and ((_ is Cons!1694) (t!6045 (toList!856 lt!64952))) (= (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun e!83039 () Option!173)

(assert (=> d!38425 (= (getValueByKey!167 (t!6045 (toList!856 lt!64952)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!83039)))

(declare-fun b!127196 () Bool)

(declare-fun e!83040 () Option!173)

(assert (=> b!127196 (= e!83039 e!83040)))

(declare-fun c!23308 () Bool)

(assert (=> b!127196 (= c!23308 (and ((_ is Cons!1694) (t!6045 (toList!856 lt!64952))) (not (= (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(declare-fun b!127198 () Bool)

(assert (=> b!127198 (= e!83040 None!171)))

(declare-fun b!127197 () Bool)

(assert (=> b!127197 (= e!83040 (getValueByKey!167 (t!6045 (t!6045 (toList!856 lt!64952))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun b!127195 () Bool)

(assert (=> b!127195 (= e!83039 (Some!172 (_2!1299 (h!2296 (t!6045 (toList!856 lt!64952))))))))

(assert (= (and d!38425 c!23307) b!127195))

(assert (= (and d!38425 (not c!23307)) b!127196))

(assert (= (and b!127196 c!23308) b!127197))

(assert (= (and b!127196 (not c!23308)) b!127198))

(assert (=> b!127197 m!146847))

(declare-fun m!148845 () Bool)

(assert (=> b!127197 m!148845))

(assert (=> b!126287 d!38425))

(declare-fun d!38427 () Bool)

(assert (=> d!38427 (= (apply!111 lt!65299 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5274 () Bool)

(assert (= bs!5274 d!38427))

(declare-fun m!148847 () Bool)

(assert (=> bs!5274 m!148847))

(assert (=> bs!5274 m!148847))

(declare-fun m!148849 () Bool)

(assert (=> bs!5274 m!148849))

(assert (=> b!126419 d!38427))

(assert (=> d!37981 d!37969))

(assert (=> d!37981 d!37971))

(declare-fun d!38429 () Bool)

(assert (=> d!38429 (isDefined!120 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38429 true))

(declare-fun _$12!390 () Unit!3924)

(assert (=> d!38429 (= (choose!761 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) _$12!390)))

(declare-fun bs!5275 () Bool)

(assert (= bs!5275 d!38429))

(assert (=> bs!5275 m!146847))

(assert (=> bs!5275 m!146955))

(assert (=> bs!5275 m!146955))

(assert (=> bs!5275 m!146957))

(assert (=> d!37981 d!38429))

(declare-fun d!38431 () Bool)

(declare-fun res!61501 () Bool)

(declare-fun e!83045 () Bool)

(assert (=> d!38431 (=> res!61501 e!83045)))

(assert (=> d!38431 (= res!61501 (or ((_ is Nil!1695) (toList!856 lt!64952)) ((_ is Nil!1695) (t!6045 (toList!856 lt!64952)))))))

(assert (=> d!38431 (= (isStrictlySorted!317 (toList!856 lt!64952)) e!83045)))

(declare-fun b!127203 () Bool)

(declare-fun e!83046 () Bool)

(assert (=> b!127203 (= e!83045 e!83046)))

(declare-fun res!61502 () Bool)

(assert (=> b!127203 (=> (not res!61502) (not e!83046))))

(assert (=> b!127203 (= res!61502 (bvslt (_1!1299 (h!2296 (toList!856 lt!64952))) (_1!1299 (h!2296 (t!6045 (toList!856 lt!64952))))))))

(declare-fun b!127204 () Bool)

(assert (=> b!127204 (= e!83046 (isStrictlySorted!317 (t!6045 (toList!856 lt!64952))))))

(assert (= (and d!38431 (not res!61501)) b!127203))

(assert (= (and b!127203 res!61502) b!127204))

(declare-fun m!148851 () Bool)

(assert (=> b!127204 m!148851))

(assert (=> d!37981 d!38431))

(declare-fun d!38433 () Bool)

(declare-fun e!83048 () Bool)

(assert (=> d!38433 e!83048))

(declare-fun res!61503 () Bool)

(assert (=> d!38433 (=> res!61503 e!83048)))

(declare-fun lt!65839 () Bool)

(assert (=> d!38433 (= res!61503 (not lt!65839))))

(declare-fun lt!65838 () Bool)

(assert (=> d!38433 (= lt!65839 lt!65838)))

(declare-fun lt!65841 () Unit!3924)

(declare-fun e!83047 () Unit!3924)

(assert (=> d!38433 (= lt!65841 e!83047)))

(declare-fun c!23309 () Bool)

(assert (=> d!38433 (= c!23309 lt!65838)))

(assert (=> d!38433 (= lt!65838 (containsKey!171 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> d!38433 (= (contains!877 lt!65402 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65839)))

(declare-fun b!127205 () Bool)

(declare-fun lt!65840 () Unit!3924)

(assert (=> b!127205 (= e!83047 lt!65840)))

(assert (=> b!127205 (= lt!65840 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (=> b!127205 (isDefined!120 (getValueByKey!167 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127206 () Bool)

(declare-fun Unit!3972 () Unit!3924)

(assert (=> b!127206 (= e!83047 Unit!3972)))

(declare-fun b!127207 () Bool)

(assert (=> b!127207 (= e!83048 (isDefined!120 (getValueByKey!167 (toList!856 lt!65402) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38433 c!23309) b!127205))

(assert (= (and d!38433 (not c!23309)) b!127206))

(assert (= (and d!38433 (not res!61503)) b!127207))

(declare-fun m!148853 () Bool)

(assert (=> d!38433 m!148853))

(declare-fun m!148855 () Bool)

(assert (=> b!127205 m!148855))

(assert (=> b!127205 m!147521))

(assert (=> b!127205 m!147521))

(declare-fun m!148857 () Bool)

(assert (=> b!127205 m!148857))

(assert (=> b!127207 m!147521))

(assert (=> b!127207 m!147521))

(assert (=> b!127207 m!148857))

(assert (=> d!38047 d!38433))

(declare-fun d!38435 () Bool)

(declare-fun c!23310 () Bool)

(assert (=> d!38435 (= c!23310 (and ((_ is Cons!1694) lt!65400) (= (_1!1299 (h!2296 lt!65400)) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83049 () Option!173)

(assert (=> d!38435 (= (getValueByKey!167 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) e!83049)))

(declare-fun b!127209 () Bool)

(declare-fun e!83050 () Option!173)

(assert (=> b!127209 (= e!83049 e!83050)))

(declare-fun c!23311 () Bool)

(assert (=> b!127209 (= c!23311 (and ((_ is Cons!1694) lt!65400) (not (= (_1!1299 (h!2296 lt!65400)) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127211 () Bool)

(assert (=> b!127211 (= e!83050 None!171)))

(declare-fun b!127210 () Bool)

(assert (=> b!127210 (= e!83050 (getValueByKey!167 (t!6045 lt!65400) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127208 () Bool)

(assert (=> b!127208 (= e!83049 (Some!172 (_2!1299 (h!2296 lt!65400))))))

(assert (= (and d!38435 c!23310) b!127208))

(assert (= (and d!38435 (not c!23310)) b!127209))

(assert (= (and b!127209 c!23311) b!127210))

(assert (= (and b!127209 (not c!23311)) b!127211))

(declare-fun m!148859 () Bool)

(assert (=> b!127210 m!148859))

(assert (=> d!38047 d!38435))

(declare-fun d!38437 () Bool)

(assert (=> d!38437 (= (getValueByKey!167 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (Some!172 (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun lt!65842 () Unit!3924)

(assert (=> d!38437 (= lt!65842 (choose!770 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83051 () Bool)

(assert (=> d!38437 e!83051))

(declare-fun res!61504 () Bool)

(assert (=> d!38437 (=> (not res!61504) (not e!83051))))

(assert (=> d!38437 (= res!61504 (isStrictlySorted!317 lt!65400))))

(assert (=> d!38437 (= (lemmaContainsTupThenGetReturnValue!82 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65842)))

(declare-fun b!127212 () Bool)

(declare-fun res!61505 () Bool)

(assert (=> b!127212 (=> (not res!61505) (not e!83051))))

(assert (=> b!127212 (= res!61505 (containsKey!171 lt!65400 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127213 () Bool)

(assert (=> b!127213 (= e!83051 (contains!879 lt!65400 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38437 res!61504) b!127212))

(assert (= (and b!127212 res!61505) b!127213))

(assert (=> d!38437 m!147515))

(declare-fun m!148861 () Bool)

(assert (=> d!38437 m!148861))

(declare-fun m!148863 () Bool)

(assert (=> d!38437 m!148863))

(declare-fun m!148865 () Bool)

(assert (=> b!127212 m!148865))

(declare-fun m!148867 () Bool)

(assert (=> b!127213 m!148867))

(assert (=> d!38047 d!38437))

(declare-fun c!23313 () Bool)

(declare-fun b!127214 () Bool)

(declare-fun c!23315 () Bool)

(declare-fun e!83052 () List!1698)

(assert (=> b!127214 (= e!83052 (ite c!23313 (t!6045 (toList!856 lt!65028)) (ite c!23315 (Cons!1694 (h!2296 (toList!856 lt!65028)) (t!6045 (toList!856 lt!65028))) Nil!1695)))))

(declare-fun call!13725 () List!1698)

(declare-fun bm!13721 () Bool)

(declare-fun c!23314 () Bool)

(assert (=> bm!13721 (= call!13725 ($colon$colon!89 e!83052 (ite c!23314 (h!2296 (toList!856 lt!65028)) (tuple2!2577 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun c!23312 () Bool)

(assert (=> bm!13721 (= c!23312 c!23314)))

(declare-fun b!127215 () Bool)

(assert (=> b!127215 (= e!83052 (insertStrictlySorted!85 (t!6045 (toList!856 lt!65028)) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127216 () Bool)

(declare-fun e!83053 () Bool)

(declare-fun lt!65843 () List!1698)

(assert (=> b!127216 (= e!83053 (contains!879 lt!65843 (tuple2!2577 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127217 () Bool)

(declare-fun e!83056 () List!1698)

(declare-fun call!13724 () List!1698)

(assert (=> b!127217 (= e!83056 call!13724)))

(declare-fun b!127218 () Bool)

(declare-fun e!83055 () List!1698)

(declare-fun call!13726 () List!1698)

(assert (=> b!127218 (= e!83055 call!13726)))

(declare-fun b!127219 () Bool)

(assert (=> b!127219 (= e!83055 call!13726)))

(declare-fun b!127220 () Bool)

(declare-fun e!83054 () List!1698)

(assert (=> b!127220 (= e!83054 call!13725)))

(declare-fun d!38439 () Bool)

(assert (=> d!38439 e!83053))

(declare-fun res!61506 () Bool)

(assert (=> d!38439 (=> (not res!61506) (not e!83053))))

(assert (=> d!38439 (= res!61506 (isStrictlySorted!317 lt!65843))))

(assert (=> d!38439 (= lt!65843 e!83054)))

(assert (=> d!38439 (= c!23314 (and ((_ is Cons!1694) (toList!856 lt!65028)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65028))) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38439 (isStrictlySorted!317 (toList!856 lt!65028))))

(assert (=> d!38439 (= (insertStrictlySorted!85 (toList!856 lt!65028) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) (_2!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65843)))

(declare-fun bm!13722 () Bool)

(assert (=> bm!13722 (= call!13724 call!13725)))

(declare-fun bm!13723 () Bool)

(assert (=> bm!13723 (= call!13726 call!13724)))

(declare-fun b!127221 () Bool)

(declare-fun res!61507 () Bool)

(assert (=> b!127221 (=> (not res!61507) (not e!83053))))

(assert (=> b!127221 (= res!61507 (containsKey!171 lt!65843 (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127222 () Bool)

(assert (=> b!127222 (= c!23315 (and ((_ is Cons!1694) (toList!856 lt!65028)) (bvsgt (_1!1299 (h!2296 (toList!856 lt!65028))) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127222 (= e!83056 e!83055)))

(declare-fun b!127223 () Bool)

(assert (=> b!127223 (= e!83054 e!83056)))

(assert (=> b!127223 (= c!23313 (and ((_ is Cons!1694) (toList!856 lt!65028)) (= (_1!1299 (h!2296 (toList!856 lt!65028))) (_1!1299 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (= (and d!38439 c!23314) b!127220))

(assert (= (and d!38439 (not c!23314)) b!127223))

(assert (= (and b!127223 c!23313) b!127217))

(assert (= (and b!127223 (not c!23313)) b!127222))

(assert (= (and b!127222 c!23315) b!127219))

(assert (= (and b!127222 (not c!23315)) b!127218))

(assert (= (or b!127219 b!127218) bm!13723))

(assert (= (or b!127217 bm!13723) bm!13722))

(assert (= (or b!127220 bm!13722) bm!13721))

(assert (= (and bm!13721 c!23312) b!127215))

(assert (= (and bm!13721 (not c!23312)) b!127214))

(assert (= (and d!38439 res!61506) b!127221))

(assert (= (and b!127221 res!61507) b!127216))

(declare-fun m!148869 () Bool)

(assert (=> b!127215 m!148869))

(declare-fun m!148871 () Bool)

(assert (=> b!127216 m!148871))

(declare-fun m!148873 () Bool)

(assert (=> d!38439 m!148873))

(declare-fun m!148875 () Bool)

(assert (=> d!38439 m!148875))

(declare-fun m!148877 () Bool)

(assert (=> b!127221 m!148877))

(declare-fun m!148879 () Bool)

(assert (=> bm!13721 m!148879))

(assert (=> d!38047 d!38439))

(declare-fun d!38441 () Bool)

(declare-fun e!83057 () Bool)

(assert (=> d!38441 e!83057))

(declare-fun res!61508 () Bool)

(assert (=> d!38441 (=> (not res!61508) (not e!83057))))

(declare-fun lt!65846 () ListLongMap!1681)

(assert (=> d!38441 (= res!61508 (contains!877 lt!65846 (_1!1299 (tuple2!2577 lt!65389 lt!65386))))))

(declare-fun lt!65844 () List!1698)

(assert (=> d!38441 (= lt!65846 (ListLongMap!1682 lt!65844))))

(declare-fun lt!65845 () Unit!3924)

(declare-fun lt!65847 () Unit!3924)

(assert (=> d!38441 (= lt!65845 lt!65847)))

(assert (=> d!38441 (= (getValueByKey!167 lt!65844 (_1!1299 (tuple2!2577 lt!65389 lt!65386))) (Some!172 (_2!1299 (tuple2!2577 lt!65389 lt!65386))))))

(assert (=> d!38441 (= lt!65847 (lemmaContainsTupThenGetReturnValue!82 lt!65844 (_1!1299 (tuple2!2577 lt!65389 lt!65386)) (_2!1299 (tuple2!2577 lt!65389 lt!65386))))))

(assert (=> d!38441 (= lt!65844 (insertStrictlySorted!85 (toList!856 lt!65388) (_1!1299 (tuple2!2577 lt!65389 lt!65386)) (_2!1299 (tuple2!2577 lt!65389 lt!65386))))))

(assert (=> d!38441 (= (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386)) lt!65846)))

(declare-fun b!127224 () Bool)

(declare-fun res!61509 () Bool)

(assert (=> b!127224 (=> (not res!61509) (not e!83057))))

(assert (=> b!127224 (= res!61509 (= (getValueByKey!167 (toList!856 lt!65846) (_1!1299 (tuple2!2577 lt!65389 lt!65386))) (Some!172 (_2!1299 (tuple2!2577 lt!65389 lt!65386)))))))

(declare-fun b!127225 () Bool)

(assert (=> b!127225 (= e!83057 (contains!879 (toList!856 lt!65846) (tuple2!2577 lt!65389 lt!65386)))))

(assert (= (and d!38441 res!61508) b!127224))

(assert (= (and b!127224 res!61509) b!127225))

(declare-fun m!148881 () Bool)

(assert (=> d!38441 m!148881))

(declare-fun m!148883 () Bool)

(assert (=> d!38441 m!148883))

(declare-fun m!148885 () Bool)

(assert (=> d!38441 m!148885))

(declare-fun m!148887 () Bool)

(assert (=> d!38441 m!148887))

(declare-fun m!148889 () Bool)

(assert (=> b!127224 m!148889))

(declare-fun m!148891 () Bool)

(assert (=> b!127225 m!148891))

(assert (=> b!126511 d!38441))

(assert (=> b!126511 d!37953))

(declare-fun d!38443 () Bool)

(declare-fun e!83059 () Bool)

(assert (=> d!38443 e!83059))

(declare-fun res!61510 () Bool)

(assert (=> d!38443 (=> res!61510 e!83059)))

(declare-fun lt!65849 () Bool)

(assert (=> d!38443 (= res!61510 (not lt!65849))))

(declare-fun lt!65848 () Bool)

(assert (=> d!38443 (= lt!65849 lt!65848)))

(declare-fun lt!65851 () Unit!3924)

(declare-fun e!83058 () Unit!3924)

(assert (=> d!38443 (= lt!65851 e!83058)))

(declare-fun c!23316 () Bool)

(assert (=> d!38443 (= c!23316 lt!65848)))

(assert (=> d!38443 (= lt!65848 (containsKey!171 (toList!856 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386))) lt!65387))))

(assert (=> d!38443 (= (contains!877 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386)) lt!65387) lt!65849)))

(declare-fun b!127226 () Bool)

(declare-fun lt!65850 () Unit!3924)

(assert (=> b!127226 (= e!83058 lt!65850)))

(assert (=> b!127226 (= lt!65850 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386))) lt!65387))))

(assert (=> b!127226 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386))) lt!65387))))

(declare-fun b!127227 () Bool)

(declare-fun Unit!3973 () Unit!3924)

(assert (=> b!127227 (= e!83058 Unit!3973)))

(declare-fun b!127228 () Bool)

(assert (=> b!127228 (= e!83059 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386))) lt!65387)))))

(assert (= (and d!38443 c!23316) b!127226))

(assert (= (and d!38443 (not c!23316)) b!127227))

(assert (= (and d!38443 (not res!61510)) b!127228))

(declare-fun m!148893 () Bool)

(assert (=> d!38443 m!148893))

(declare-fun m!148895 () Bool)

(assert (=> b!127226 m!148895))

(declare-fun m!148897 () Bool)

(assert (=> b!127226 m!148897))

(assert (=> b!127226 m!148897))

(declare-fun m!148899 () Bool)

(assert (=> b!127226 m!148899))

(assert (=> b!127228 m!148897))

(assert (=> b!127228 m!148897))

(assert (=> b!127228 m!148899))

(assert (=> b!126511 d!38443))

(declare-fun d!38445 () Bool)

(declare-fun e!83060 () Bool)

(assert (=> d!38445 e!83060))

(declare-fun res!61511 () Bool)

(assert (=> d!38445 (=> (not res!61511) (not e!83060))))

(declare-fun lt!65854 () ListLongMap!1681)

(assert (=> d!38445 (= res!61511 (contains!877 lt!65854 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!65852 () List!1698)

(assert (=> d!38445 (= lt!65854 (ListLongMap!1682 lt!65852))))

(declare-fun lt!65853 () Unit!3924)

(declare-fun lt!65855 () Unit!3924)

(assert (=> d!38445 (= lt!65853 lt!65855)))

(assert (=> d!38445 (= (getValueByKey!167 lt!65852 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38445 (= lt!65855 (lemmaContainsTupThenGetReturnValue!82 lt!65852 (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38445 (= lt!65852 (insertStrictlySorted!85 (toList!856 call!13634) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38445 (= (+!170 call!13634 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!65854)))

(declare-fun b!127229 () Bool)

(declare-fun res!61512 () Bool)

(assert (=> b!127229 (=> (not res!61512) (not e!83060))))

(assert (=> b!127229 (= res!61512 (= (getValueByKey!167 (toList!856 lt!65854) (_1!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!172 (_2!1299 (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127230 () Bool)

(assert (=> b!127230 (= e!83060 (contains!879 (toList!856 lt!65854) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38445 res!61511) b!127229))

(assert (= (and b!127229 res!61512) b!127230))

(declare-fun m!148901 () Bool)

(assert (=> d!38445 m!148901))

(declare-fun m!148903 () Bool)

(assert (=> d!38445 m!148903))

(declare-fun m!148905 () Bool)

(assert (=> d!38445 m!148905))

(declare-fun m!148907 () Bool)

(assert (=> d!38445 m!148907))

(declare-fun m!148909 () Bool)

(assert (=> b!127229 m!148909))

(declare-fun m!148911 () Bool)

(assert (=> b!127230 m!148911))

(assert (=> b!126511 d!38445))

(declare-fun d!38447 () Bool)

(assert (=> d!38447 (not (contains!877 (+!170 lt!65388 (tuple2!2577 lt!65389 lt!65386)) lt!65387))))

(declare-fun lt!65858 () Unit!3924)

(declare-fun choose!772 (ListLongMap!1681 (_ BitVec 64) V!3435 (_ BitVec 64)) Unit!3924)

(assert (=> d!38447 (= lt!65858 (choose!772 lt!65388 lt!65389 lt!65386 lt!65387))))

(declare-fun e!83063 () Bool)

(assert (=> d!38447 e!83063))

(declare-fun res!61515 () Bool)

(assert (=> d!38447 (=> (not res!61515) (not e!83063))))

(assert (=> d!38447 (= res!61515 (not (contains!877 lt!65388 lt!65387)))))

(assert (=> d!38447 (= (addStillNotContains!56 lt!65388 lt!65389 lt!65386 lt!65387) lt!65858)))

(declare-fun b!127234 () Bool)

(assert (=> b!127234 (= e!83063 (not (= lt!65389 lt!65387)))))

(assert (= (and d!38447 res!61515) b!127234))

(assert (=> d!38447 m!147479))

(assert (=> d!38447 m!147479))

(assert (=> d!38447 m!147481))

(declare-fun m!148913 () Bool)

(assert (=> d!38447 m!148913))

(declare-fun m!148915 () Bool)

(assert (=> d!38447 m!148915))

(assert (=> b!126511 d!38447))

(declare-fun d!38449 () Bool)

(declare-fun res!61516 () Bool)

(declare-fun e!83064 () Bool)

(assert (=> d!38449 (=> res!61516 e!83064)))

(assert (=> d!38449 (= res!61516 (and ((_ is Cons!1694) (toList!856 call!13583)) (= (_1!1299 (h!2296 (toList!856 call!13583))) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))))

(assert (=> d!38449 (= (containsKey!171 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))) e!83064)))

(declare-fun b!127235 () Bool)

(declare-fun e!83065 () Bool)

(assert (=> b!127235 (= e!83064 e!83065)))

(declare-fun res!61517 () Bool)

(assert (=> b!127235 (=> (not res!61517) (not e!83065))))

(assert (=> b!127235 (= res!61517 (and (or (not ((_ is Cons!1694) (toList!856 call!13583))) (bvsle (_1!1299 (h!2296 (toList!856 call!13583))) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))) ((_ is Cons!1694) (toList!856 call!13583)) (bvslt (_1!1299 (h!2296 (toList!856 call!13583))) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119))))))))

(declare-fun b!127236 () Bool)

(assert (=> b!127236 (= e!83065 (containsKey!171 (t!6045 (toList!856 call!13583)) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(assert (= (and d!38449 (not res!61516)) b!127235))

(assert (= (and b!127235 res!61517) b!127236))

(declare-fun m!148917 () Bool)

(assert (=> b!127236 m!148917))

(assert (=> d!38011 d!38449))

(declare-fun b!127238 () Bool)

(declare-fun res!61520 () Bool)

(declare-fun e!83066 () Bool)

(assert (=> b!127238 (=> (not res!61520) (not e!83066))))

(assert (=> b!127238 (= res!61520 (bvsge (size!2493 (v!3124 (underlying!439 thiss!992))) (_size!580 (v!3124 (underlying!439 thiss!992)))))))

(declare-fun b!127237 () Bool)

(declare-fun res!61521 () Bool)

(assert (=> b!127237 (=> (not res!61521) (not e!83066))))

(assert (=> b!127237 (= res!61521 (and (= (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992)))) (bvadd (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001)) (= (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (size!2490 (_values!2766 (v!3124 (underlying!439 thiss!992))))) (bvsge (_size!580 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!580 (v!3124 (underlying!439 thiss!992))) (bvadd (mask!7039 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!38451 () Bool)

(declare-fun res!61519 () Bool)

(assert (=> d!38451 (=> (not res!61519) (not e!83066))))

(assert (=> d!38451 (= res!61519 (validMask!0 (mask!7039 (v!3124 (underlying!439 thiss!992)))))))

(assert (=> d!38451 (= (simpleValid!87 (v!3124 (underlying!439 thiss!992))) e!83066)))

(declare-fun b!127239 () Bool)

(declare-fun res!61518 () Bool)

(assert (=> b!127239 (=> (not res!61518) (not e!83066))))

(assert (=> b!127239 (= res!61518 (= (size!2493 (v!3124 (underlying!439 thiss!992))) (bvadd (_size!580 (v!3124 (underlying!439 thiss!992))) (bvsdiv (bvadd (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!127240 () Bool)

(assert (=> b!127240 (= e!83066 (and (bvsge (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2564 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!580 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!38451 res!61519) b!127237))

(assert (= (and b!127237 res!61521) b!127238))

(assert (= (and b!127238 res!61520) b!127239))

(assert (= (and b!127239 res!61518) b!127240))

(declare-fun m!148919 () Bool)

(assert (=> b!127238 m!148919))

(assert (=> d!38451 m!146839))

(assert (=> b!127239 m!148919))

(assert (=> d!38013 d!38451))

(declare-fun d!38453 () Bool)

(declare-fun res!61522 () Bool)

(declare-fun e!83067 () Bool)

(assert (=> d!38453 (=> res!61522 e!83067)))

(assert (=> d!38453 (= res!61522 (= (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> d!38453 (= (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!83067)))

(declare-fun b!127241 () Bool)

(declare-fun e!83068 () Bool)

(assert (=> b!127241 (= e!83067 e!83068)))

(declare-fun res!61523 () Bool)

(assert (=> b!127241 (=> (not res!61523) (not e!83068))))

(assert (=> b!127241 (= res!61523 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun b!127242 () Bool)

(assert (=> b!127242 (= e!83068 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!38453 (not res!61522)) b!127241))

(assert (= (and b!127241 res!61523) b!127242))

(assert (=> d!38453 m!148537))

(assert (=> b!127242 m!146847))

(declare-fun m!148921 () Bool)

(assert (=> b!127242 m!148921))

(assert (=> b!126460 d!38453))

(declare-fun d!38455 () Bool)

(assert (=> d!38455 (= (apply!111 lt!65299 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5276 () Bool)

(assert (= bs!5276 d!38455))

(assert (=> bs!5276 m!148767))

(assert (=> bs!5276 m!148767))

(declare-fun m!148923 () Bool)

(assert (=> bs!5276 m!148923))

(assert (=> b!126417 d!38455))

(assert (=> bm!13620 d!38213))

(assert (=> d!37957 d!37977))

(declare-fun b!127259 () Bool)

(declare-fun res!61534 () Bool)

(declare-fun e!83079 () Bool)

(assert (=> b!127259 (=> (not res!61534) (not e!83079))))

(declare-fun call!13732 () Bool)

(assert (=> b!127259 (= res!61534 call!13732)))

(declare-fun e!83077 () Bool)

(assert (=> b!127259 (= e!83077 e!83079)))

(declare-fun b!127260 () Bool)

(declare-fun e!83080 () Bool)

(declare-fun e!83078 () Bool)

(assert (=> b!127260 (= e!83080 e!83078)))

(declare-fun res!61533 () Bool)

(assert (=> b!127260 (= res!61533 call!13732)))

(assert (=> b!127260 (=> (not res!61533) (not e!83078))))

(declare-fun b!127261 () Bool)

(declare-fun res!61535 () Bool)

(declare-fun lt!65861 () SeekEntryResult!270)

(assert (=> b!127261 (= res!61535 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3235 lt!65861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127261 (=> (not res!61535) (not e!83078))))

(declare-fun d!38457 () Bool)

(assert (=> d!38457 e!83080))

(declare-fun c!23321 () Bool)

(assert (=> d!38457 (= c!23321 ((_ is MissingZero!270) lt!65861))))

(assert (=> d!38457 (= lt!65861 (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(assert (=> d!38457 true))

(declare-fun _$34!952 () Unit!3924)

(assert (=> d!38457 (= (choose!760 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (defaultEntry!2783 newMap!16)) _$34!952)))

(declare-fun b!127262 () Bool)

(assert (=> b!127262 (= e!83080 e!83077)))

(declare-fun c!23322 () Bool)

(assert (=> b!127262 (= c!23322 ((_ is MissingVacant!270) lt!65861))))

(declare-fun b!127263 () Bool)

(declare-fun call!13731 () Bool)

(assert (=> b!127263 (= e!83079 (not call!13731))))

(declare-fun bm!13728 () Bool)

(assert (=> bm!13728 (= call!13731 (arrayContainsKey!0 (_keys!4516 newMap!16) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!127264 () Bool)

(assert (=> b!127264 (= e!83078 (not call!13731))))

(declare-fun b!127265 () Bool)

(declare-fun res!61532 () Bool)

(assert (=> b!127265 (=> (not res!61532) (not e!83079))))

(assert (=> b!127265 (= res!61532 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3238 lt!65861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127266 () Bool)

(assert (=> b!127266 (= e!83077 ((_ is Undefined!270) lt!65861))))

(declare-fun bm!13729 () Bool)

(assert (=> bm!13729 (= call!13732 (inRange!0 (ite c!23321 (index!3235 lt!65861) (index!3238 lt!65861)) (mask!7039 newMap!16)))))

(assert (= (and d!38457 c!23321) b!127260))

(assert (= (and d!38457 (not c!23321)) b!127262))

(assert (= (and b!127260 res!61533) b!127261))

(assert (= (and b!127261 res!61535) b!127264))

(assert (= (and b!127262 c!23322) b!127259))

(assert (= (and b!127262 (not c!23322)) b!127266))

(assert (= (and b!127259 res!61534) b!127265))

(assert (= (and b!127265 res!61532) b!127263))

(assert (= (or b!127260 b!127259) bm!13729))

(assert (= (or b!127264 b!127263) bm!13728))

(assert (=> d!38457 m!146847))

(assert (=> d!38457 m!146977))

(declare-fun m!148925 () Bool)

(assert (=> bm!13729 m!148925))

(declare-fun m!148927 () Bool)

(assert (=> b!127261 m!148927))

(declare-fun m!148929 () Bool)

(assert (=> b!127265 m!148929))

(assert (=> bm!13728 m!146847))

(assert (=> bm!13728 m!146961))

(assert (=> d!37957 d!38457))

(assert (=> d!37957 d!38171))

(declare-fun d!38459 () Bool)

(declare-fun e!83082 () Bool)

(assert (=> d!38459 e!83082))

(declare-fun res!61536 () Bool)

(assert (=> d!38459 (=> res!61536 e!83082)))

(declare-fun lt!65863 () Bool)

(assert (=> d!38459 (= res!61536 (not lt!65863))))

(declare-fun lt!65862 () Bool)

(assert (=> d!38459 (= lt!65863 lt!65862)))

(declare-fun lt!65865 () Unit!3924)

(declare-fun e!83081 () Unit!3924)

(assert (=> d!38459 (= lt!65865 e!83081)))

(declare-fun c!23323 () Bool)

(assert (=> d!38459 (= c!23323 lt!65862)))

(assert (=> d!38459 (= lt!65862 (containsKey!171 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38459 (= (contains!877 lt!65349 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65863)))

(declare-fun b!127267 () Bool)

(declare-fun lt!65864 () Unit!3924)

(assert (=> b!127267 (= e!83081 lt!65864)))

(assert (=> b!127267 (= lt!65864 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> b!127267 (isDefined!120 (getValueByKey!167 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127268 () Bool)

(declare-fun Unit!3974 () Unit!3924)

(assert (=> b!127268 (= e!83081 Unit!3974)))

(declare-fun b!127269 () Bool)

(assert (=> b!127269 (= e!83082 (isDefined!120 (getValueByKey!167 (toList!856 lt!65349) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38459 c!23323) b!127267))

(assert (= (and d!38459 (not c!23323)) b!127268))

(assert (= (and d!38459 (not res!61536)) b!127269))

(declare-fun m!148931 () Bool)

(assert (=> d!38459 m!148931))

(declare-fun m!148933 () Bool)

(assert (=> b!127267 m!148933))

(assert (=> b!127267 m!147377))

(assert (=> b!127267 m!147377))

(declare-fun m!148935 () Bool)

(assert (=> b!127267 m!148935))

(assert (=> b!127269 m!147377))

(assert (=> b!127269 m!147377))

(assert (=> b!127269 m!148935))

(assert (=> d!38005 d!38459))

(declare-fun d!38461 () Bool)

(declare-fun c!23324 () Bool)

(assert (=> d!38461 (= c!23324 (and ((_ is Cons!1694) lt!65347) (= (_1!1299 (h!2296 lt!65347)) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun e!83083 () Option!173)

(assert (=> d!38461 (= (getValueByKey!167 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) e!83083)))

(declare-fun b!127271 () Bool)

(declare-fun e!83084 () Option!173)

(assert (=> b!127271 (= e!83083 e!83084)))

(declare-fun c!23325 () Bool)

(assert (=> b!127271 (= c!23325 (and ((_ is Cons!1694) lt!65347) (not (= (_1!1299 (h!2296 lt!65347)) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun b!127273 () Bool)

(assert (=> b!127273 (= e!83084 None!171)))

(declare-fun b!127272 () Bool)

(assert (=> b!127272 (= e!83084 (getValueByKey!167 (t!6045 lt!65347) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127270 () Bool)

(assert (=> b!127270 (= e!83083 (Some!172 (_2!1299 (h!2296 lt!65347))))))

(assert (= (and d!38461 c!23324) b!127270))

(assert (= (and d!38461 (not c!23324)) b!127271))

(assert (= (and b!127271 c!23325) b!127272))

(assert (= (and b!127271 (not c!23325)) b!127273))

(declare-fun m!148937 () Bool)

(assert (=> b!127272 m!148937))

(assert (=> d!38005 d!38461))

(declare-fun d!38463 () Bool)

(assert (=> d!38463 (= (getValueByKey!167 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (Some!172 (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun lt!65866 () Unit!3924)

(assert (=> d!38463 (= lt!65866 (choose!770 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83085 () Bool)

(assert (=> d!38463 e!83085))

(declare-fun res!61537 () Bool)

(assert (=> d!38463 (=> (not res!61537) (not e!83085))))

(assert (=> d!38463 (= res!61537 (isStrictlySorted!317 lt!65347))))

(assert (=> d!38463 (= (lemmaContainsTupThenGetReturnValue!82 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65866)))

(declare-fun b!127274 () Bool)

(declare-fun res!61538 () Bool)

(assert (=> b!127274 (=> (not res!61538) (not e!83085))))

(assert (=> b!127274 (= res!61538 (containsKey!171 lt!65347 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127275 () Bool)

(assert (=> b!127275 (= e!83085 (contains!879 lt!65347 (tuple2!2577 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38463 res!61537) b!127274))

(assert (= (and b!127274 res!61538) b!127275))

(assert (=> d!38463 m!147371))

(declare-fun m!148939 () Bool)

(assert (=> d!38463 m!148939))

(declare-fun m!148941 () Bool)

(assert (=> d!38463 m!148941))

(declare-fun m!148943 () Bool)

(assert (=> b!127274 m!148943))

(declare-fun m!148945 () Bool)

(assert (=> b!127275 m!148945))

(assert (=> d!38005 d!38463))

(declare-fun b!127276 () Bool)

(declare-fun c!23329 () Bool)

(declare-fun e!83086 () List!1698)

(declare-fun c!23327 () Bool)

(assert (=> b!127276 (= e!83086 (ite c!23327 (t!6045 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (ite c!23329 (Cons!1694 (h!2296 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (t!6045 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))))) Nil!1695)))))

(declare-fun c!23328 () Bool)

(declare-fun bm!13730 () Bool)

(declare-fun call!13734 () List!1698)

(assert (=> bm!13730 (= call!13734 ($colon$colon!89 e!83086 (ite c!23328 (h!2296 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (tuple2!2577 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(declare-fun c!23326 () Bool)

(assert (=> bm!13730 (= c!23326 c!23328)))

(declare-fun b!127277 () Bool)

(assert (=> b!127277 (= e!83086 (insertStrictlySorted!85 (t!6045 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun e!83087 () Bool)

(declare-fun b!127278 () Bool)

(declare-fun lt!65867 () List!1698)

(assert (=> b!127278 (= e!83087 (contains!879 lt!65867 (tuple2!2577 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(declare-fun b!127279 () Bool)

(declare-fun e!83090 () List!1698)

(declare-fun call!13733 () List!1698)

(assert (=> b!127279 (= e!83090 call!13733)))

(declare-fun b!127280 () Bool)

(declare-fun e!83089 () List!1698)

(declare-fun call!13735 () List!1698)

(assert (=> b!127280 (= e!83089 call!13735)))

(declare-fun b!127281 () Bool)

(assert (=> b!127281 (= e!83089 call!13735)))

(declare-fun b!127282 () Bool)

(declare-fun e!83088 () List!1698)

(assert (=> b!127282 (= e!83088 call!13734)))

(declare-fun d!38465 () Bool)

(assert (=> d!38465 e!83087))

(declare-fun res!61539 () Bool)

(assert (=> d!38465 (=> (not res!61539) (not e!83087))))

(assert (=> d!38465 (= res!61539 (isStrictlySorted!317 lt!65867))))

(assert (=> d!38465 (= lt!65867 e!83088)))

(assert (=> d!38465 (= c!23328 (and ((_ is Cons!1694) (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (bvslt (_1!1299 (h!2296 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> d!38465 (isStrictlySorted!317 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))))))

(assert (=> d!38465 (= (insertStrictlySorted!85 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) (_2!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65867)))

(declare-fun bm!13731 () Bool)

(assert (=> bm!13731 (= call!13733 call!13734)))

(declare-fun bm!13732 () Bool)

(assert (=> bm!13732 (= call!13735 call!13733)))

(declare-fun b!127283 () Bool)

(declare-fun res!61540 () Bool)

(assert (=> b!127283 (=> (not res!61540) (not e!83087))))

(assert (=> b!127283 (= res!61540 (containsKey!171 lt!65867 (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(declare-fun b!127284 () Bool)

(assert (=> b!127284 (= c!23329 (and ((_ is Cons!1694) (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (bvsgt (_1!1299 (h!2296 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (=> b!127284 (= e!83090 e!83089)))

(declare-fun b!127285 () Bool)

(assert (=> b!127285 (= e!83088 e!83090)))

(assert (=> b!127285 (= c!23327 (and ((_ is Cons!1694) (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512)))) (= (_1!1299 (h!2296 (toList!856 (ite c!22986 call!13514 (ite c!22990 call!13508 call!13512))))) (_1!1299 (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))))

(assert (= (and d!38465 c!23328) b!127282))

(assert (= (and d!38465 (not c!23328)) b!127285))

(assert (= (and b!127285 c!23327) b!127279))

(assert (= (and b!127285 (not c!23327)) b!127284))

(assert (= (and b!127284 c!23329) b!127281))

(assert (= (and b!127284 (not c!23329)) b!127280))

(assert (= (or b!127281 b!127280) bm!13732))

(assert (= (or b!127279 bm!13732) bm!13731))

(assert (= (or b!127282 bm!13731) bm!13730))

(assert (= (and bm!13730 c!23326) b!127277))

(assert (= (and bm!13730 (not c!23326)) b!127276))

(assert (= (and d!38465 res!61539) b!127283))

(assert (= (and b!127283 res!61540) b!127278))

(declare-fun m!148947 () Bool)

(assert (=> b!127277 m!148947))

(declare-fun m!148949 () Bool)

(assert (=> b!127278 m!148949))

(declare-fun m!148951 () Bool)

(assert (=> d!38465 m!148951))

(declare-fun m!148953 () Bool)

(assert (=> d!38465 m!148953))

(declare-fun m!148955 () Bool)

(assert (=> b!127283 m!148955))

(declare-fun m!148957 () Bool)

(assert (=> bm!13730 m!148957))

(assert (=> d!38005 d!38465))

(declare-fun d!38467 () Bool)

(declare-fun e!83092 () Bool)

(assert (=> d!38467 e!83092))

(declare-fun res!61541 () Bool)

(assert (=> d!38467 (=> res!61541 e!83092)))

(declare-fun lt!65869 () Bool)

(assert (=> d!38467 (= res!61541 (not lt!65869))))

(declare-fun lt!65868 () Bool)

(assert (=> d!38467 (= lt!65869 lt!65868)))

(declare-fun lt!65871 () Unit!3924)

(declare-fun e!83091 () Unit!3924)

(assert (=> d!38467 (= lt!65871 e!83091)))

(declare-fun c!23330 () Bool)

(assert (=> d!38467 (= c!23330 lt!65868)))

(assert (=> d!38467 (= lt!65868 (containsKey!171 (toList!856 lt!65299) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38467 (= (contains!877 lt!65299 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) lt!65869)))

(declare-fun b!127286 () Bool)

(declare-fun lt!65870 () Unit!3924)

(assert (=> b!127286 (= e!83091 lt!65870)))

(assert (=> b!127286 (= lt!65870 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65299) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127286 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127287 () Bool)

(declare-fun Unit!3975 () Unit!3924)

(assert (=> b!127287 (= e!83091 Unit!3975)))

(declare-fun b!127288 () Bool)

(assert (=> b!127288 (= e!83092 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38467 c!23330) b!127286))

(assert (= (and d!38467 (not c!23330)) b!127287))

(assert (= (and d!38467 (not res!61541)) b!127288))

(assert (=> d!38467 m!147041))

(declare-fun m!148959 () Bool)

(assert (=> d!38467 m!148959))

(assert (=> b!127286 m!147041))

(declare-fun m!148961 () Bool)

(assert (=> b!127286 m!148961))

(assert (=> b!127286 m!147041))

(assert (=> b!127286 m!147641))

(assert (=> b!127286 m!147641))

(declare-fun m!148963 () Bool)

(assert (=> b!127286 m!148963))

(assert (=> b!127288 m!147041))

(assert (=> b!127288 m!147641))

(assert (=> b!127288 m!147641))

(assert (=> b!127288 m!148963))

(assert (=> b!126413 d!38467))

(declare-fun d!38469 () Bool)

(assert (=> d!38469 (= (apply!111 lt!65166 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65166) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5277 () Bool)

(assert (= bs!5277 d!38469))

(assert (=> bs!5277 m!148431))

(assert (=> bs!5277 m!148431))

(declare-fun m!148965 () Bool)

(assert (=> bs!5277 m!148965))

(assert (=> b!126329 d!38469))

(assert (=> d!37997 d!38171))

(declare-fun d!38471 () Bool)

(assert (=> d!38471 (= (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65029)) (v!3128 (getValueByKey!167 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65029)))))

(assert (=> d!38033 d!38471))

(declare-fun c!23331 () Bool)

(declare-fun d!38473 () Bool)

(assert (=> d!38473 (= c!23331 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65029)))))

(declare-fun e!83093 () Option!173)

(assert (=> d!38473 (= (getValueByKey!167 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65029) e!83093)))

(declare-fun b!127290 () Bool)

(declare-fun e!83094 () Option!173)

(assert (=> b!127290 (= e!83093 e!83094)))

(declare-fun c!23332 () Bool)

(assert (=> b!127290 (= c!23332 (and ((_ is Cons!1694) (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) (not (= (_1!1299 (h!2296 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))) lt!65029))))))

(declare-fun b!127292 () Bool)

(assert (=> b!127292 (= e!83094 None!171)))

(declare-fun b!127291 () Bool)

(assert (=> b!127291 (= e!83094 (getValueByKey!167 (t!6045 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))) lt!65029))))

(declare-fun b!127289 () Bool)

(assert (=> b!127289 (= e!83093 (Some!172 (_2!1299 (h!2296 (toList!856 (+!170 lt!65028 (tuple2!2577 lt!65025 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))))))

(assert (= (and d!38473 c!23331) b!127289))

(assert (= (and d!38473 (not c!23331)) b!127290))

(assert (= (and b!127290 c!23332) b!127291))

(assert (= (and b!127290 (not c!23332)) b!127292))

(declare-fun m!148967 () Bool)

(assert (=> b!127291 m!148967))

(assert (=> d!38033 d!38473))

(declare-fun d!38475 () Bool)

(assert (=> d!38475 (= (apply!111 lt!65325 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1447 (getValueByKey!167 (toList!856 lt!65325) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5278 () Bool)

(assert (= bs!5278 d!38475))

(assert (=> bs!5278 m!148789))

(assert (=> bs!5278 m!148789))

(declare-fun m!148969 () Bool)

(assert (=> bs!5278 m!148969))

(assert (=> b!126440 d!38475))

(declare-fun d!38477 () Bool)

(declare-fun res!61542 () Bool)

(declare-fun e!83095 () Bool)

(assert (=> d!38477 (=> res!61542 e!83095)))

(assert (=> d!38477 (= res!61542 (and ((_ is Cons!1694) (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (= (_1!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(assert (=> d!38477 (= (containsKey!171 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) e!83095)))

(declare-fun b!127293 () Bool)

(declare-fun e!83096 () Bool)

(assert (=> b!127293 (= e!83095 e!83096)))

(declare-fun res!61543 () Bool)

(assert (=> b!127293 (=> (not res!61543) (not e!83096))))

(assert (=> b!127293 (= res!61543 (and (or (not ((_ is Cons!1694) (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (bvsle (_1!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) ((_ is Cons!1694) (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (bvslt (_1!1299 (h!2296 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))))))

(declare-fun b!127294 () Bool)

(assert (=> b!127294 (= e!83096 (containsKey!171 (t!6045 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38477 (not res!61542)) b!127293))

(assert (= (and b!127293 res!61543) b!127294))

(assert (=> b!127294 m!146847))

(declare-fun m!148971 () Bool)

(assert (=> b!127294 m!148971))

(assert (=> d!37995 d!38477))

(declare-fun d!38479 () Bool)

(assert (=> d!38479 (contains!877 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) lt!65185)))

(declare-fun lt!65872 () Unit!3924)

(assert (=> d!38479 (= lt!65872 (choose!765 lt!65178 lt!65172 (zeroValue!2646 newMap!16) lt!65185))))

(assert (=> d!38479 (contains!877 lt!65178 lt!65185)))

(assert (=> d!38479 (= (addStillContains!87 lt!65178 lt!65172 (zeroValue!2646 newMap!16) lt!65185) lt!65872)))

(declare-fun bs!5279 () Bool)

(assert (= bs!5279 d!38479))

(assert (=> bs!5279 m!147111))

(assert (=> bs!5279 m!147111))

(assert (=> bs!5279 m!147121))

(declare-fun m!148973 () Bool)

(assert (=> bs!5279 m!148973))

(declare-fun m!148975 () Bool)

(assert (=> bs!5279 m!148975))

(assert (=> b!126325 d!38479))

(declare-fun d!38481 () Bool)

(assert (=> d!38481 (= (apply!111 lt!65186 lt!65187) (get!1447 (getValueByKey!167 (toList!856 lt!65186) lt!65187)))))

(declare-fun bs!5280 () Bool)

(assert (= bs!5280 d!38481))

(declare-fun m!148977 () Bool)

(assert (=> bs!5280 m!148977))

(assert (=> bs!5280 m!148977))

(declare-fun m!148979 () Bool)

(assert (=> bs!5280 m!148979))

(assert (=> b!126325 d!38481))

(declare-fun d!38483 () Bool)

(assert (=> d!38483 (= (apply!111 (+!170 lt!65186 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) lt!65187) (apply!111 lt!65186 lt!65187))))

(declare-fun lt!65873 () Unit!3924)

(assert (=> d!38483 (= lt!65873 (choose!764 lt!65186 lt!65183 (minValue!2646 newMap!16) lt!65187))))

(declare-fun e!83097 () Bool)

(assert (=> d!38483 e!83097))

(declare-fun res!61544 () Bool)

(assert (=> d!38483 (=> (not res!61544) (not e!83097))))

(assert (=> d!38483 (= res!61544 (contains!877 lt!65186 lt!65187))))

(assert (=> d!38483 (= (addApplyDifferent!87 lt!65186 lt!65183 (minValue!2646 newMap!16) lt!65187) lt!65873)))

(declare-fun b!127295 () Bool)

(assert (=> b!127295 (= e!83097 (not (= lt!65187 lt!65183)))))

(assert (= (and d!38483 res!61544) b!127295))

(assert (=> d!38483 m!147107))

(assert (=> d!38483 m!147109))

(declare-fun m!148981 () Bool)

(assert (=> d!38483 m!148981))

(assert (=> d!38483 m!147131))

(declare-fun m!148983 () Bool)

(assert (=> d!38483 m!148983))

(assert (=> d!38483 m!147107))

(assert (=> b!126325 d!38483))

(declare-fun d!38485 () Bool)

(assert (=> d!38485 (= (apply!111 (+!170 lt!65186 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) lt!65187) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65186 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))) lt!65187)))))

(declare-fun bs!5281 () Bool)

(assert (= bs!5281 d!38485))

(declare-fun m!148985 () Bool)

(assert (=> bs!5281 m!148985))

(assert (=> bs!5281 m!148985))

(declare-fun m!148987 () Bool)

(assert (=> bs!5281 m!148987))

(assert (=> b!126325 d!38485))

(declare-fun d!38487 () Bool)

(assert (=> d!38487 (= (apply!111 lt!65179 lt!65176) (get!1447 (getValueByKey!167 (toList!856 lt!65179) lt!65176)))))

(declare-fun bs!5282 () Bool)

(assert (= bs!5282 d!38487))

(declare-fun m!148989 () Bool)

(assert (=> bs!5282 m!148989))

(assert (=> bs!5282 m!148989))

(declare-fun m!148991 () Bool)

(assert (=> bs!5282 m!148991))

(assert (=> b!126325 d!38487))

(declare-fun d!38489 () Bool)

(assert (=> d!38489 (= (apply!111 (+!170 lt!65179 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) lt!65176) (apply!111 lt!65179 lt!65176))))

(declare-fun lt!65874 () Unit!3924)

(assert (=> d!38489 (= lt!65874 (choose!764 lt!65179 lt!65184 (zeroValue!2646 newMap!16) lt!65176))))

(declare-fun e!83098 () Bool)

(assert (=> d!38489 e!83098))

(declare-fun res!61545 () Bool)

(assert (=> d!38489 (=> (not res!61545) (not e!83098))))

(assert (=> d!38489 (= res!61545 (contains!877 lt!65179 lt!65176))))

(assert (=> d!38489 (= (addApplyDifferent!87 lt!65179 lt!65184 (zeroValue!2646 newMap!16) lt!65176) lt!65874)))

(declare-fun b!127296 () Bool)

(assert (=> b!127296 (= e!83098 (not (= lt!65176 lt!65184)))))

(assert (= (and d!38489 res!61545) b!127296))

(assert (=> d!38489 m!147113))

(assert (=> d!38489 m!147115))

(declare-fun m!148993 () Bool)

(assert (=> d!38489 m!148993))

(assert (=> d!38489 m!147105))

(declare-fun m!148995 () Bool)

(assert (=> d!38489 m!148995))

(assert (=> d!38489 m!147113))

(assert (=> b!126325 d!38489))

(declare-fun d!38491 () Bool)

(declare-fun e!83099 () Bool)

(assert (=> d!38491 e!83099))

(declare-fun res!61546 () Bool)

(assert (=> d!38491 (=> (not res!61546) (not e!83099))))

(declare-fun lt!65877 () ListLongMap!1681)

(assert (=> d!38491 (= res!61546 (contains!877 lt!65877 (_1!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))))))

(declare-fun lt!65875 () List!1698)

(assert (=> d!38491 (= lt!65877 (ListLongMap!1682 lt!65875))))

(declare-fun lt!65876 () Unit!3924)

(declare-fun lt!65878 () Unit!3924)

(assert (=> d!38491 (= lt!65876 lt!65878)))

(assert (=> d!38491 (= (getValueByKey!167 lt!65875 (_1!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38491 (= lt!65878 (lemmaContainsTupThenGetReturnValue!82 lt!65875 (_1!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38491 (= lt!65875 (insertStrictlySorted!85 (toList!856 lt!65179) (_1!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38491 (= (+!170 lt!65179 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) lt!65877)))

(declare-fun b!127297 () Bool)

(declare-fun res!61547 () Bool)

(assert (=> b!127297 (=> (not res!61547) (not e!83099))))

(assert (=> b!127297 (= res!61547 (= (getValueByKey!167 (toList!856 lt!65877) (_1!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))))))))

(declare-fun b!127298 () Bool)

(assert (=> b!127298 (= e!83099 (contains!879 (toList!856 lt!65877) (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))))))

(assert (= (and d!38491 res!61546) b!127297))

(assert (= (and b!127297 res!61547) b!127298))

(declare-fun m!148997 () Bool)

(assert (=> d!38491 m!148997))

(declare-fun m!148999 () Bool)

(assert (=> d!38491 m!148999))

(declare-fun m!149001 () Bool)

(assert (=> d!38491 m!149001))

(declare-fun m!149003 () Bool)

(assert (=> d!38491 m!149003))

(declare-fun m!149005 () Bool)

(assert (=> b!127297 m!149005))

(declare-fun m!149007 () Bool)

(assert (=> b!127298 m!149007))

(assert (=> b!126325 d!38491))

(assert (=> b!126325 d!38269))

(declare-fun d!38493 () Bool)

(declare-fun e!83100 () Bool)

(assert (=> d!38493 e!83100))

(declare-fun res!61548 () Bool)

(assert (=> d!38493 (=> (not res!61548) (not e!83100))))

(declare-fun lt!65881 () ListLongMap!1681)

(assert (=> d!38493 (= res!61548 (contains!877 lt!65881 (_1!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))))))

(declare-fun lt!65879 () List!1698)

(assert (=> d!38493 (= lt!65881 (ListLongMap!1682 lt!65879))))

(declare-fun lt!65880 () Unit!3924)

(declare-fun lt!65882 () Unit!3924)

(assert (=> d!38493 (= lt!65880 lt!65882)))

(assert (=> d!38493 (= (getValueByKey!167 lt!65879 (_1!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38493 (= lt!65882 (lemmaContainsTupThenGetReturnValue!82 lt!65879 (_1!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38493 (= lt!65879 (insertStrictlySorted!85 (toList!856 lt!65178) (_1!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))))))

(assert (=> d!38493 (= (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) lt!65881)))

(declare-fun b!127299 () Bool)

(declare-fun res!61549 () Bool)

(assert (=> b!127299 (=> (not res!61549) (not e!83100))))

(assert (=> b!127299 (= res!61549 (= (getValueByKey!167 (toList!856 lt!65881) (_1!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))))))))

(declare-fun b!127300 () Bool)

(assert (=> b!127300 (= e!83100 (contains!879 (toList!856 lt!65881) (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))))))

(assert (= (and d!38493 res!61548) b!127299))

(assert (= (and b!127299 res!61549) b!127300))

(declare-fun m!149009 () Bool)

(assert (=> d!38493 m!149009))

(declare-fun m!149011 () Bool)

(assert (=> d!38493 m!149011))

(declare-fun m!149013 () Bool)

(assert (=> d!38493 m!149013))

(declare-fun m!149015 () Bool)

(assert (=> d!38493 m!149015))

(declare-fun m!149017 () Bool)

(assert (=> b!127299 m!149017))

(declare-fun m!149019 () Bool)

(assert (=> b!127300 m!149019))

(assert (=> b!126325 d!38493))

(declare-fun d!38495 () Bool)

(assert (=> d!38495 (= (apply!111 (+!170 lt!65174 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) lt!65167) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65174 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))) lt!65167)))))

(declare-fun bs!5283 () Bool)

(assert (= bs!5283 d!38495))

(declare-fun m!149021 () Bool)

(assert (=> bs!5283 m!149021))

(assert (=> bs!5283 m!149021))

(declare-fun m!149023 () Bool)

(assert (=> bs!5283 m!149023))

(assert (=> b!126325 d!38495))

(declare-fun d!38497 () Bool)

(declare-fun e!83101 () Bool)

(assert (=> d!38497 e!83101))

(declare-fun res!61550 () Bool)

(assert (=> d!38497 (=> (not res!61550) (not e!83101))))

(declare-fun lt!65885 () ListLongMap!1681)

(assert (=> d!38497 (= res!61550 (contains!877 lt!65885 (_1!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))))))

(declare-fun lt!65883 () List!1698)

(assert (=> d!38497 (= lt!65885 (ListLongMap!1682 lt!65883))))

(declare-fun lt!65884 () Unit!3924)

(declare-fun lt!65886 () Unit!3924)

(assert (=> d!38497 (= lt!65884 lt!65886)))

(assert (=> d!38497 (= (getValueByKey!167 lt!65883 (_1!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))))))

(assert (=> d!38497 (= lt!65886 (lemmaContainsTupThenGetReturnValue!82 lt!65883 (_1!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))))))

(assert (=> d!38497 (= lt!65883 (insertStrictlySorted!85 (toList!856 lt!65186) (_1!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))))))

(assert (=> d!38497 (= (+!170 lt!65186 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))) lt!65885)))

(declare-fun b!127301 () Bool)

(declare-fun res!61551 () Bool)

(assert (=> b!127301 (=> (not res!61551) (not e!83101))))

(assert (=> b!127301 (= res!61551 (= (getValueByKey!167 (toList!856 lt!65885) (_1!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65183 (minValue!2646 newMap!16))))))))

(declare-fun b!127302 () Bool)

(assert (=> b!127302 (= e!83101 (contains!879 (toList!856 lt!65885) (tuple2!2577 lt!65183 (minValue!2646 newMap!16))))))

(assert (= (and d!38497 res!61550) b!127301))

(assert (= (and b!127301 res!61551) b!127302))

(declare-fun m!149025 () Bool)

(assert (=> d!38497 m!149025))

(declare-fun m!149027 () Bool)

(assert (=> d!38497 m!149027))

(declare-fun m!149029 () Bool)

(assert (=> d!38497 m!149029))

(declare-fun m!149031 () Bool)

(assert (=> d!38497 m!149031))

(declare-fun m!149033 () Bool)

(assert (=> b!127301 m!149033))

(declare-fun m!149035 () Bool)

(assert (=> b!127302 m!149035))

(assert (=> b!126325 d!38497))

(declare-fun d!38499 () Bool)

(assert (=> d!38499 (= (apply!111 (+!170 lt!65174 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) lt!65167) (apply!111 lt!65174 lt!65167))))

(declare-fun lt!65887 () Unit!3924)

(assert (=> d!38499 (= lt!65887 (choose!764 lt!65174 lt!65180 (minValue!2646 newMap!16) lt!65167))))

(declare-fun e!83102 () Bool)

(assert (=> d!38499 e!83102))

(declare-fun res!61552 () Bool)

(assert (=> d!38499 (=> (not res!61552) (not e!83102))))

(assert (=> d!38499 (= res!61552 (contains!877 lt!65174 lt!65167))))

(assert (=> d!38499 (= (addApplyDifferent!87 lt!65174 lt!65180 (minValue!2646 newMap!16) lt!65167) lt!65887)))

(declare-fun b!127303 () Bool)

(assert (=> b!127303 (= e!83102 (not (= lt!65167 lt!65180)))))

(assert (= (and d!38499 res!61552) b!127303))

(assert (=> d!38499 m!147125))

(assert (=> d!38499 m!147127))

(declare-fun m!149037 () Bool)

(assert (=> d!38499 m!149037))

(assert (=> d!38499 m!147117))

(declare-fun m!149039 () Bool)

(assert (=> d!38499 m!149039))

(assert (=> d!38499 m!147125))

(assert (=> b!126325 d!38499))

(declare-fun d!38501 () Bool)

(declare-fun e!83103 () Bool)

(assert (=> d!38501 e!83103))

(declare-fun res!61553 () Bool)

(assert (=> d!38501 (=> (not res!61553) (not e!83103))))

(declare-fun lt!65890 () ListLongMap!1681)

(assert (=> d!38501 (= res!61553 (contains!877 lt!65890 (_1!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))))))

(declare-fun lt!65888 () List!1698)

(assert (=> d!38501 (= lt!65890 (ListLongMap!1682 lt!65888))))

(declare-fun lt!65889 () Unit!3924)

(declare-fun lt!65891 () Unit!3924)

(assert (=> d!38501 (= lt!65889 lt!65891)))

(assert (=> d!38501 (= (getValueByKey!167 lt!65888 (_1!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))))))

(assert (=> d!38501 (= lt!65891 (lemmaContainsTupThenGetReturnValue!82 lt!65888 (_1!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))))))

(assert (=> d!38501 (= lt!65888 (insertStrictlySorted!85 (toList!856 lt!65174) (_1!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))))))

(assert (=> d!38501 (= (+!170 lt!65174 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))) lt!65890)))

(declare-fun b!127304 () Bool)

(declare-fun res!61554 () Bool)

(assert (=> b!127304 (=> (not res!61554) (not e!83103))))

(assert (=> b!127304 (= res!61554 (= (getValueByKey!167 (toList!856 lt!65890) (_1!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 lt!65180 (minValue!2646 newMap!16))))))))

(declare-fun b!127305 () Bool)

(assert (=> b!127305 (= e!83103 (contains!879 (toList!856 lt!65890) (tuple2!2577 lt!65180 (minValue!2646 newMap!16))))))

(assert (= (and d!38501 res!61553) b!127304))

(assert (= (and b!127304 res!61554) b!127305))

(declare-fun m!149041 () Bool)

(assert (=> d!38501 m!149041))

(declare-fun m!149043 () Bool)

(assert (=> d!38501 m!149043))

(declare-fun m!149045 () Bool)

(assert (=> d!38501 m!149045))

(declare-fun m!149047 () Bool)

(assert (=> d!38501 m!149047))

(declare-fun m!149049 () Bool)

(assert (=> b!127304 m!149049))

(declare-fun m!149051 () Bool)

(assert (=> b!127305 m!149051))

(assert (=> b!126325 d!38501))

(declare-fun d!38503 () Bool)

(declare-fun e!83105 () Bool)

(assert (=> d!38503 e!83105))

(declare-fun res!61555 () Bool)

(assert (=> d!38503 (=> res!61555 e!83105)))

(declare-fun lt!65893 () Bool)

(assert (=> d!38503 (= res!61555 (not lt!65893))))

(declare-fun lt!65892 () Bool)

(assert (=> d!38503 (= lt!65893 lt!65892)))

(declare-fun lt!65895 () Unit!3924)

(declare-fun e!83104 () Unit!3924)

(assert (=> d!38503 (= lt!65895 e!83104)))

(declare-fun c!23333 () Bool)

(assert (=> d!38503 (= c!23333 lt!65892)))

(assert (=> d!38503 (= lt!65892 (containsKey!171 (toList!856 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) lt!65185))))

(assert (=> d!38503 (= (contains!877 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16))) lt!65185) lt!65893)))

(declare-fun b!127306 () Bool)

(declare-fun lt!65894 () Unit!3924)

(assert (=> b!127306 (= e!83104 lt!65894)))

(assert (=> b!127306 (= lt!65894 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) lt!65185))))

(assert (=> b!127306 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) lt!65185))))

(declare-fun b!127307 () Bool)

(declare-fun Unit!3976 () Unit!3924)

(assert (=> b!127307 (= e!83104 Unit!3976)))

(declare-fun b!127308 () Bool)

(assert (=> b!127308 (= e!83105 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65178 (tuple2!2577 lt!65172 (zeroValue!2646 newMap!16)))) lt!65185)))))

(assert (= (and d!38503 c!23333) b!127306))

(assert (= (and d!38503 (not c!23333)) b!127307))

(assert (= (and d!38503 (not res!61555)) b!127308))

(declare-fun m!149053 () Bool)

(assert (=> d!38503 m!149053))

(declare-fun m!149055 () Bool)

(assert (=> b!127306 m!149055))

(declare-fun m!149057 () Bool)

(assert (=> b!127306 m!149057))

(assert (=> b!127306 m!149057))

(declare-fun m!149059 () Bool)

(assert (=> b!127306 m!149059))

(assert (=> b!127308 m!149057))

(assert (=> b!127308 m!149057))

(assert (=> b!127308 m!149059))

(assert (=> b!126325 d!38503))

(declare-fun d!38505 () Bool)

(assert (=> d!38505 (= (apply!111 lt!65174 lt!65167) (get!1447 (getValueByKey!167 (toList!856 lt!65174) lt!65167)))))

(declare-fun bs!5284 () Bool)

(assert (= bs!5284 d!38505))

(declare-fun m!149061 () Bool)

(assert (=> bs!5284 m!149061))

(assert (=> bs!5284 m!149061))

(declare-fun m!149063 () Bool)

(assert (=> bs!5284 m!149063))

(assert (=> b!126325 d!38505))

(declare-fun d!38507 () Bool)

(assert (=> d!38507 (= (apply!111 (+!170 lt!65179 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16))) lt!65176) (get!1447 (getValueByKey!167 (toList!856 (+!170 lt!65179 (tuple2!2577 lt!65184 (zeroValue!2646 newMap!16)))) lt!65176)))))

(declare-fun bs!5285 () Bool)

(assert (= bs!5285 d!38507))

(declare-fun m!149065 () Bool)

(assert (=> bs!5285 m!149065))

(assert (=> bs!5285 m!149065))

(declare-fun m!149067 () Bool)

(assert (=> bs!5285 m!149067))

(assert (=> b!126325 d!38507))

(declare-fun d!38509 () Bool)

(assert (=> d!38509 (= (get!1447 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3128 (getValueByKey!167 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!37951 d!38509))

(assert (=> d!37951 d!38067))

(assert (=> bm!13627 d!38227))

(declare-fun d!38511 () Bool)

(declare-fun e!83107 () Bool)

(assert (=> d!38511 e!83107))

(declare-fun res!61556 () Bool)

(assert (=> d!38511 (=> res!61556 e!83107)))

(declare-fun lt!65897 () Bool)

(assert (=> d!38511 (= res!61556 (not lt!65897))))

(declare-fun lt!65896 () Bool)

(assert (=> d!38511 (= lt!65897 lt!65896)))

(declare-fun lt!65899 () Unit!3924)

(declare-fun e!83106 () Unit!3924)

(assert (=> d!38511 (= lt!65899 e!83106)))

(declare-fun c!23334 () Bool)

(assert (=> d!38511 (= c!23334 lt!65896)))

(assert (=> d!38511 (= lt!65896 (containsKey!171 (toList!856 lt!65325) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38511 (= (contains!877 lt!65325 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)) lt!65897)))

(declare-fun b!127309 () Bool)

(declare-fun lt!65898 () Unit!3924)

(assert (=> b!127309 (= e!83106 lt!65898)))

(assert (=> b!127309 (= lt!65898 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65325) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!127309 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!127310 () Bool)

(declare-fun Unit!3977 () Unit!3924)

(assert (=> b!127310 (= e!83106 Unit!3977)))

(declare-fun b!127311 () Bool)

(assert (=> b!127311 (= e!83107 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38511 c!23334) b!127309))

(assert (= (and d!38511 (not c!23334)) b!127310))

(assert (= (and d!38511 (not res!61556)) b!127311))

(assert (=> d!38511 m!147041))

(declare-fun m!149069 () Bool)

(assert (=> d!38511 m!149069))

(assert (=> b!127309 m!147041))

(declare-fun m!149071 () Bool)

(assert (=> b!127309 m!149071))

(assert (=> b!127309 m!147041))

(assert (=> b!127309 m!147659))

(assert (=> b!127309 m!147659))

(declare-fun m!149073 () Bool)

(assert (=> b!127309 m!149073))

(assert (=> b!127311 m!147041))

(assert (=> b!127311 m!147659))

(assert (=> b!127311 m!147659))

(assert (=> b!127311 m!149073))

(assert (=> b!126436 d!38511))

(declare-fun d!38513 () Bool)

(assert (=> d!38513 (= (get!1447 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3128 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38015 d!38513))

(assert (=> d!38015 d!38277))

(assert (=> d!38001 d!38171))

(declare-fun b!127312 () Bool)

(declare-fun e!83109 () Bool)

(declare-fun call!13736 () Bool)

(assert (=> b!127312 (= e!83109 call!13736)))

(declare-fun b!127313 () Bool)

(assert (=> b!127313 (= e!83109 call!13736)))

(declare-fun b!127314 () Bool)

(declare-fun e!83108 () Bool)

(assert (=> b!127314 (= e!83108 e!83109)))

(declare-fun c!23335 () Bool)

(assert (=> b!127314 (= c!23335 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13733 () Bool)

(assert (=> bm!13733 (= call!13736 (arrayNoDuplicates!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23335 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23119 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)) (ite c!23119 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697))))))

(declare-fun d!38515 () Bool)

(declare-fun res!61557 () Bool)

(declare-fun e!83111 () Bool)

(assert (=> d!38515 (=> res!61557 e!83111)))

(assert (=> d!38515 (= res!61557 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38515 (= (arrayNoDuplicates!0 (_keys!4516 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23119 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697)) e!83111)))

(declare-fun b!127315 () Bool)

(assert (=> b!127315 (= e!83111 e!83108)))

(declare-fun res!61559 () Bool)

(assert (=> b!127315 (=> (not res!61559) (not e!83108))))

(declare-fun e!83110 () Bool)

(assert (=> b!127315 (= res!61559 (not e!83110))))

(declare-fun res!61558 () Bool)

(assert (=> b!127315 (=> (not res!61558) (not e!83110))))

(assert (=> b!127315 (= res!61558 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!127316 () Bool)

(assert (=> b!127316 (= e!83110 (contains!880 (ite c!23119 (Cons!1696 (select (arr!2225 (_keys!4516 newMap!16)) #b00000000000000000000000000000000) Nil!1697) Nil!1697) (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!38515 (not res!61557)) b!127315))

(assert (= (and b!127315 res!61558) b!127316))

(assert (= (and b!127315 res!61559) b!127314))

(assert (= (and b!127314 c!23335) b!127313))

(assert (= (and b!127314 (not c!23335)) b!127312))

(assert (= (or b!127313 b!127312) bm!13733))

(assert (=> b!127314 m!148537))

(assert (=> b!127314 m!148537))

(assert (=> b!127314 m!148539))

(assert (=> bm!13733 m!148537))

(declare-fun m!149075 () Bool)

(assert (=> bm!13733 m!149075))

(assert (=> b!127315 m!148537))

(assert (=> b!127315 m!148537))

(assert (=> b!127315 m!148539))

(assert (=> b!127316 m!148537))

(assert (=> b!127316 m!148537))

(declare-fun m!149077 () Bool)

(assert (=> b!127316 m!149077))

(assert (=> bm!13634 d!38515))

(declare-fun d!38517 () Bool)

(declare-fun e!83113 () Bool)

(assert (=> d!38517 e!83113))

(declare-fun res!61560 () Bool)

(assert (=> d!38517 (=> res!61560 e!83113)))

(declare-fun lt!65901 () Bool)

(assert (=> d!38517 (= res!61560 (not lt!65901))))

(declare-fun lt!65900 () Bool)

(assert (=> d!38517 (= lt!65901 lt!65900)))

(declare-fun lt!65903 () Unit!3924)

(declare-fun e!83112 () Unit!3924)

(assert (=> d!38517 (= lt!65903 e!83112)))

(declare-fun c!23336 () Bool)

(assert (=> d!38517 (= c!23336 lt!65900)))

(assert (=> d!38517 (= lt!65900 (containsKey!171 (toList!856 lt!65390) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38517 (= (contains!877 lt!65390 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!65901)))

(declare-fun b!127317 () Bool)

(declare-fun lt!65902 () Unit!3924)

(assert (=> b!127317 (= e!83112 lt!65902)))

(assert (=> b!127317 (= lt!65902 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65390) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!127317 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!127318 () Bool)

(declare-fun Unit!3978 () Unit!3924)

(assert (=> b!127318 (= e!83112 Unit!3978)))

(declare-fun b!127319 () Bool)

(assert (=> b!127319 (= e!83113 (isDefined!120 (getValueByKey!167 (toList!856 lt!65390) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38517 c!23336) b!127317))

(assert (= (and d!38517 (not c!23336)) b!127318))

(assert (= (and d!38517 (not res!61560)) b!127319))

(assert (=> d!38517 m!146895))

(declare-fun m!149079 () Bool)

(assert (=> d!38517 m!149079))

(assert (=> b!127317 m!146895))

(declare-fun m!149081 () Bool)

(assert (=> b!127317 m!149081))

(assert (=> b!127317 m!146895))

(assert (=> b!127317 m!148423))

(assert (=> b!127317 m!148423))

(declare-fun m!149083 () Bool)

(assert (=> b!127317 m!149083))

(assert (=> b!127319 m!146895))

(assert (=> b!127319 m!148423))

(assert (=> b!127319 m!148423))

(assert (=> b!127319 m!149083))

(assert (=> b!126508 d!38517))

(assert (=> b!126399 d!38301))

(assert (=> b!126399 d!38143))

(declare-fun d!38519 () Bool)

(assert (=> d!38519 (isDefined!120 (getValueByKey!167 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!65904 () Unit!3924)

(assert (=> d!38519 (= lt!65904 (choose!761 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83114 () Bool)

(assert (=> d!38519 e!83114))

(declare-fun res!61561 () Bool)

(assert (=> d!38519 (=> (not res!61561) (not e!83114))))

(assert (=> d!38519 (= res!61561 (isStrictlySorted!317 (toList!856 lt!65008)))))

(assert (=> d!38519 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000) lt!65904)))

(declare-fun b!127320 () Bool)

(assert (=> b!127320 (= e!83114 (containsKey!171 (toList!856 lt!65008) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!38519 res!61561) b!127320))

(assert (=> d!38519 m!147061))

(assert (=> d!38519 m!147061))

(assert (=> d!38519 m!147063))

(declare-fun m!149085 () Bool)

(assert (=> d!38519 m!149085))

(assert (=> d!38519 m!148437))

(assert (=> b!127320 m!147057))

(assert (=> b!126268 d!38519))

(assert (=> b!126268 d!38275))

(assert (=> b!126268 d!38277))

(assert (=> b!126265 d!38383))

(declare-fun b!127321 () Bool)

(declare-fun e!83117 () Bool)

(declare-fun e!83116 () Bool)

(assert (=> b!127321 (= e!83117 e!83116)))

(declare-fun lt!65905 () (_ BitVec 64))

(assert (=> b!127321 (= lt!65905 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!65906 () Unit!3924)

(assert (=> b!127321 (= lt!65906 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4516 newMap!16) lt!65905 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!127321 (arrayContainsKey!0 (_keys!4516 newMap!16) lt!65905 #b00000000000000000000000000000000)))

(declare-fun lt!65907 () Unit!3924)

(assert (=> b!127321 (= lt!65907 lt!65906)))

(declare-fun res!61562 () Bool)

(assert (=> b!127321 (= res!61562 (= (seekEntryOrOpen!0 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4516 newMap!16) (mask!7039 newMap!16)) (Found!270 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!127321 (=> (not res!61562) (not e!83116))))

(declare-fun b!127322 () Bool)

(declare-fun e!83115 () Bool)

(assert (=> b!127322 (= e!83115 e!83117)))

(declare-fun c!23337 () Bool)

(assert (=> b!127322 (= c!23337 (validKeyInArray!0 (select (arr!2225 (_keys!4516 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!13734 () Bool)

(declare-fun call!13737 () Bool)

(assert (=> bm!13734 (= call!13737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun b!127323 () Bool)

(assert (=> b!127323 (= e!83116 call!13737)))

(declare-fun d!38521 () Bool)

(declare-fun res!61563 () Bool)

(assert (=> d!38521 (=> res!61563 e!83115)))

(assert (=> d!38521 (= res!61563 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 newMap!16))))))

(assert (=> d!38521 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4516 newMap!16) (mask!7039 newMap!16)) e!83115)))

(declare-fun b!127324 () Bool)

(assert (=> b!127324 (= e!83117 call!13737)))

(assert (= (and d!38521 (not res!61563)) b!127322))

(assert (= (and b!127322 c!23337) b!127321))

(assert (= (and b!127322 (not c!23337)) b!127324))

(assert (= (and b!127321 res!61562) b!127323))

(assert (= (or b!127323 b!127324) bm!13734))

(assert (=> b!127321 m!148537))

(declare-fun m!149087 () Bool)

(assert (=> b!127321 m!149087))

(declare-fun m!149089 () Bool)

(assert (=> b!127321 m!149089))

(assert (=> b!127321 m!148537))

(declare-fun m!149091 () Bool)

(assert (=> b!127321 m!149091))

(assert (=> b!127322 m!148537))

(assert (=> b!127322 m!148537))

(assert (=> b!127322 m!148539))

(declare-fun m!149093 () Bool)

(assert (=> bm!13734 m!149093))

(assert (=> bm!13595 d!38521))

(declare-fun d!38523 () Bool)

(declare-fun e!83119 () Bool)

(assert (=> d!38523 e!83119))

(declare-fun res!61564 () Bool)

(assert (=> d!38523 (=> res!61564 e!83119)))

(declare-fun lt!65909 () Bool)

(assert (=> d!38523 (= res!61564 (not lt!65909))))

(declare-fun lt!65908 () Bool)

(assert (=> d!38523 (= lt!65909 lt!65908)))

(declare-fun lt!65911 () Unit!3924)

(declare-fun e!83118 () Unit!3924)

(assert (=> d!38523 (= lt!65911 e!83118)))

(declare-fun c!23338 () Bool)

(assert (=> d!38523 (= c!23338 lt!65908)))

(assert (=> d!38523 (= lt!65908 (containsKey!171 (toList!856 lt!65299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38523 (= (contains!877 lt!65299 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65909)))

(declare-fun b!127325 () Bool)

(declare-fun lt!65910 () Unit!3924)

(assert (=> b!127325 (= e!83118 lt!65910)))

(assert (=> b!127325 (= lt!65910 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127325 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127326 () Bool)

(declare-fun Unit!3979 () Unit!3924)

(assert (=> b!127326 (= e!83118 Unit!3979)))

(declare-fun b!127327 () Bool)

(assert (=> b!127327 (= e!83119 (isDefined!120 (getValueByKey!167 (toList!856 lt!65299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38523 c!23338) b!127325))

(assert (= (and d!38523 (not c!23338)) b!127326))

(assert (= (and d!38523 (not res!61564)) b!127327))

(declare-fun m!149095 () Bool)

(assert (=> d!38523 m!149095))

(declare-fun m!149097 () Bool)

(assert (=> b!127325 m!149097))

(assert (=> b!127325 m!148847))

(assert (=> b!127325 m!148847))

(declare-fun m!149099 () Bool)

(assert (=> b!127325 m!149099))

(assert (=> b!127327 m!148847))

(assert (=> b!127327 m!148847))

(assert (=> b!127327 m!149099))

(assert (=> bm!13615 d!38523))

(assert (=> b!126423 d!38075))

(assert (=> b!126231 d!38075))

(declare-fun d!38525 () Bool)

(declare-fun e!83132 () Bool)

(assert (=> d!38525 e!83132))

(declare-fun c!23346 () Bool)

(declare-fun lt!65916 () SeekEntryResult!270)

(assert (=> d!38525 (= c!23346 (and ((_ is Intermediate!270) lt!65916) (undefined!1082 lt!65916)))))

(declare-fun e!83134 () SeekEntryResult!270)

(assert (=> d!38525 (= lt!65916 e!83134)))

(declare-fun c!23345 () Bool)

(assert (=> d!38525 (= c!23345 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!65917 () (_ BitVec 64))

(assert (=> d!38525 (= lt!65917 (select (arr!2225 (_keys!4516 newMap!16)) (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16))))))

(assert (=> d!38525 (validMask!0 (mask!7039 newMap!16))))

(assert (=> d!38525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)) lt!65916)))

(declare-fun b!127346 () Bool)

(declare-fun e!83131 () SeekEntryResult!270)

(assert (=> b!127346 (= e!83134 e!83131)))

(declare-fun c!23347 () Bool)

(assert (=> b!127346 (= c!23347 (or (= lt!65917 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) (= (bvadd lt!65917 lt!65917) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!127347 () Bool)

(assert (=> b!127347 (= e!83132 (bvsge (x!14963 lt!65916) #b01111111111111111111111111111110))))

(declare-fun b!127348 () Bool)

(assert (=> b!127348 (= e!83134 (Intermediate!270 true (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!127349 () Bool)

(assert (=> b!127349 (= e!83131 (Intermediate!270 false (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!127350 () Bool)

(assert (=> b!127350 (= e!83131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) #b00000000000000000000000000000000 (mask!7039 newMap!16)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (_keys!4516 newMap!16) (mask!7039 newMap!16)))))

(declare-fun b!127351 () Bool)

(assert (=> b!127351 (and (bvsge (index!3237 lt!65916) #b00000000000000000000000000000000) (bvslt (index!3237 lt!65916) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun e!83130 () Bool)

(assert (=> b!127351 (= e!83130 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65916)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127352 () Bool)

(assert (=> b!127352 (and (bvsge (index!3237 lt!65916) #b00000000000000000000000000000000) (bvslt (index!3237 lt!65916) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61571 () Bool)

(assert (=> b!127352 (= res!61571 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65916)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (=> b!127352 (=> res!61571 e!83130)))

(declare-fun e!83133 () Bool)

(assert (=> b!127352 (= e!83133 e!83130)))

(declare-fun b!127353 () Bool)

(assert (=> b!127353 (= e!83132 e!83133)))

(declare-fun res!61573 () Bool)

(assert (=> b!127353 (= res!61573 (and ((_ is Intermediate!270) lt!65916) (not (undefined!1082 lt!65916)) (bvslt (x!14963 lt!65916) #b01111111111111111111111111111110) (bvsge (x!14963 lt!65916) #b00000000000000000000000000000000) (bvsge (x!14963 lt!65916) #b00000000000000000000000000000000)))))

(assert (=> b!127353 (=> (not res!61573) (not e!83133))))

(declare-fun b!127354 () Bool)

(assert (=> b!127354 (and (bvsge (index!3237 lt!65916) #b00000000000000000000000000000000) (bvslt (index!3237 lt!65916) (size!2489 (_keys!4516 newMap!16))))))

(declare-fun res!61572 () Bool)

(assert (=> b!127354 (= res!61572 (= (select (arr!2225 (_keys!4516 newMap!16)) (index!3237 lt!65916)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127354 (=> res!61572 e!83130)))

(assert (= (and d!38525 c!23345) b!127348))

(assert (= (and d!38525 (not c!23345)) b!127346))

(assert (= (and b!127346 c!23347) b!127349))

(assert (= (and b!127346 (not c!23347)) b!127350))

(assert (= (and d!38525 c!23346) b!127347))

(assert (= (and d!38525 (not c!23346)) b!127353))

(assert (= (and b!127353 res!61573) b!127352))

(assert (= (and b!127352 (not res!61571)) b!127354))

(assert (= (and b!127354 (not res!61572)) b!127351))

(assert (=> d!38525 m!147097))

(declare-fun m!149101 () Bool)

(assert (=> d!38525 m!149101))

(assert (=> d!38525 m!147051))

(declare-fun m!149103 () Bool)

(assert (=> b!127354 m!149103))

(assert (=> b!127351 m!149103))

(assert (=> b!127350 m!147097))

(declare-fun m!149105 () Bool)

(assert (=> b!127350 m!149105))

(assert (=> b!127350 m!149105))

(assert (=> b!127350 m!146847))

(declare-fun m!149107 () Bool)

(assert (=> b!127350 m!149107))

(assert (=> b!127352 m!149103))

(assert (=> d!37977 d!38525))

(declare-fun d!38527 () Bool)

(declare-fun lt!65923 () (_ BitVec 32))

(declare-fun lt!65922 () (_ BitVec 32))

(assert (=> d!38527 (= lt!65923 (bvmul (bvxor lt!65922 (bvlshr lt!65922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!38527 (= lt!65922 ((_ extract 31 0) (bvand (bvxor (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvlshr (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!38527 (and (bvsge (mask!7039 newMap!16) #b00000000000000000000000000000000) (let ((res!61574 (let ((h!2299 ((_ extract 31 0) (bvand (bvxor (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (bvlshr (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15067 (bvmul (bvxor h!2299 (bvlshr h!2299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15067 (bvlshr x!15067 #b00000000000000000000000000001101)) (mask!7039 newMap!16)))))) (and (bvslt res!61574 (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001)) (bvsge res!61574 #b00000000000000000000000000000000))))))

(assert (=> d!38527 (= (toIndex!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (mask!7039 newMap!16)) (bvand (bvxor lt!65923 (bvlshr lt!65923 #b00000000000000000000000000001101)) (mask!7039 newMap!16)))))

(assert (=> d!37977 d!38527))

(assert (=> d!37977 d!38171))

(declare-fun d!38529 () Bool)

(declare-fun res!61575 () Bool)

(declare-fun e!83135 () Bool)

(assert (=> d!38529 (=> res!61575 e!83135)))

(assert (=> d!38529 (= res!61575 (and ((_ is Cons!1694) (toList!856 lt!65008)) (= (_1!1299 (h!2296 (toList!856 lt!65008))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38529 (= (containsKey!171 (toList!856 lt!65008) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83135)))

(declare-fun b!127355 () Bool)

(declare-fun e!83136 () Bool)

(assert (=> b!127355 (= e!83135 e!83136)))

(declare-fun res!61576 () Bool)

(assert (=> b!127355 (=> (not res!61576) (not e!83136))))

(assert (=> b!127355 (= res!61576 (and (or (not ((_ is Cons!1694) (toList!856 lt!65008))) (bvsle (_1!1299 (h!2296 (toList!856 lt!65008))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1694) (toList!856 lt!65008)) (bvslt (_1!1299 (h!2296 (toList!856 lt!65008))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!127356 () Bool)

(assert (=> b!127356 (= e!83136 (containsKey!171 (t!6045 (toList!856 lt!65008)) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!38529 (not res!61575)) b!127355))

(assert (= (and b!127355 res!61576) b!127356))

(assert (=> b!127356 m!146895))

(declare-fun m!149109 () Bool)

(assert (=> b!127356 m!149109))

(assert (=> d!38051 d!38529))

(declare-fun d!38531 () Bool)

(declare-fun c!23348 () Bool)

(assert (=> d!38531 (= c!23348 (and ((_ is Cons!1694) (toList!856 lt!65146)) (= (_1!1299 (h!2296 (toList!856 lt!65146))) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!83137 () Option!173)

(assert (=> d!38531 (= (getValueByKey!167 (toList!856 lt!65146) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!83137)))

(declare-fun b!127358 () Bool)

(declare-fun e!83138 () Option!173)

(assert (=> b!127358 (= e!83137 e!83138)))

(declare-fun c!23349 () Bool)

(assert (=> b!127358 (= c!23349 (and ((_ is Cons!1694) (toList!856 lt!65146)) (not (= (_1!1299 (h!2296 (toList!856 lt!65146))) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!127360 () Bool)

(assert (=> b!127360 (= e!83138 None!171)))

(declare-fun b!127359 () Bool)

(assert (=> b!127359 (= e!83138 (getValueByKey!167 (t!6045 (toList!856 lt!65146)) (_1!1299 (ite c!23022 (ite c!23024 (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2577 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!127357 () Bool)

(assert (=> b!127357 (= e!83137 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65146)))))))

(assert (= (and d!38531 c!23348) b!127357))

(assert (= (and d!38531 (not c!23348)) b!127358))

(assert (= (and b!127358 c!23349) b!127359))

(assert (= (and b!127358 (not c!23349)) b!127360))

(declare-fun m!149111 () Bool)

(assert (=> b!127359 m!149111))

(assert (=> b!126275 d!38531))

(declare-fun lt!65924 () Bool)

(declare-fun d!38533 () Bool)

(assert (=> d!38533 (= lt!65924 (select (content!125 (toList!856 lt!65398)) (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!83139 () Bool)

(assert (=> d!38533 (= lt!65924 e!83139)))

(declare-fun res!61578 () Bool)

(assert (=> d!38533 (=> (not res!61578) (not e!83139))))

(assert (=> d!38533 (= res!61578 ((_ is Cons!1694) (toList!856 lt!65398)))))

(assert (=> d!38533 (= (contains!879 (toList!856 lt!65398) (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65924)))

(declare-fun b!127361 () Bool)

(declare-fun e!83140 () Bool)

(assert (=> b!127361 (= e!83139 e!83140)))

(declare-fun res!61577 () Bool)

(assert (=> b!127361 (=> res!61577 e!83140)))

(assert (=> b!127361 (= res!61577 (= (h!2296 (toList!856 lt!65398)) (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127362 () Bool)

(assert (=> b!127362 (= e!83140 (contains!879 (t!6045 (toList!856 lt!65398)) (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38533 res!61578) b!127361))

(assert (= (and b!127361 (not res!61577)) b!127362))

(declare-fun m!149113 () Bool)

(assert (=> d!38533 m!149113))

(declare-fun m!149115 () Bool)

(assert (=> d!38533 m!149115))

(declare-fun m!149117 () Bool)

(assert (=> b!127362 m!149117))

(assert (=> b!126521 d!38533))

(declare-fun d!38535 () Bool)

(assert (=> d!38535 (isDefined!120 (getValueByKey!167 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(declare-fun lt!65925 () Unit!3924)

(assert (=> d!38535 (= lt!65925 (choose!761 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(declare-fun e!83141 () Bool)

(assert (=> d!38535 e!83141))

(declare-fun res!61579 () Bool)

(assert (=> d!38535 (=> (not res!61579) (not e!83141))))

(assert (=> d!38535 (= res!61579 (isStrictlySorted!317 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992))))))))))

(assert (=> d!38535 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027) lt!65925)))

(declare-fun b!127363 () Bool)

(assert (=> b!127363 (= e!83141 (containsKey!171 (toList!856 (+!170 lt!65020 (tuple2!2577 lt!65014 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65027))))

(assert (= (and d!38535 res!61579) b!127363))

(assert (=> d!38535 m!147497))

(assert (=> d!38535 m!147497))

(assert (=> d!38535 m!147499))

(declare-fun m!149119 () Bool)

(assert (=> d!38535 m!149119))

(declare-fun m!149121 () Bool)

(assert (=> d!38535 m!149121))

(assert (=> b!127363 m!147493))

(assert (=> b!126517 d!38535))

(assert (=> b!126517 d!38281))

(assert (=> b!126517 d!38283))

(declare-fun d!38537 () Bool)

(declare-fun e!83142 () Bool)

(assert (=> d!38537 e!83142))

(declare-fun res!61580 () Bool)

(assert (=> d!38537 (=> (not res!61580) (not e!83142))))

(declare-fun lt!65928 () ListLongMap!1681)

(assert (=> d!38537 (= res!61580 (contains!877 lt!65928 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(declare-fun lt!65926 () List!1698)

(assert (=> d!38537 (= lt!65928 (ListLongMap!1682 lt!65926))))

(declare-fun lt!65927 () Unit!3924)

(declare-fun lt!65929 () Unit!3924)

(assert (=> d!38537 (= lt!65927 lt!65929)))

(assert (=> d!38537 (= (getValueByKey!167 lt!65926 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38537 (= lt!65929 (lemmaContainsTupThenGetReturnValue!82 lt!65926 (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38537 (= lt!65926 (insertStrictlySorted!85 (toList!856 call!13604) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (=> d!38537 (= (+!170 call!13604 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))) lt!65928)))

(declare-fun b!127364 () Bool)

(declare-fun res!61581 () Bool)

(assert (=> b!127364 (=> (not res!61581) (not e!83142))))

(assert (=> b!127364 (= res!61581 (= (getValueByKey!167 (toList!856 lt!65928) (_1!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (Some!172 (_2!1299 (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(declare-fun b!127365 () Bool)

(assert (=> b!127365 (= e!83142 (contains!879 (toList!856 lt!65928) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))

(assert (= (and d!38537 res!61580) b!127364))

(assert (= (and b!127364 res!61581) b!127365))

(declare-fun m!149123 () Bool)

(assert (=> d!38537 m!149123))

(declare-fun m!149125 () Bool)

(assert (=> d!38537 m!149125))

(declare-fun m!149127 () Bool)

(assert (=> d!38537 m!149127))

(declare-fun m!149129 () Bool)

(assert (=> d!38537 m!149129))

(declare-fun m!149131 () Bool)

(assert (=> b!127364 m!149131))

(declare-fun m!149133 () Bool)

(assert (=> b!127365 m!149133))

(assert (=> b!126338 d!38537))

(declare-fun d!38539 () Bool)

(assert (=> d!38539 (= (isEmpty!396 (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355))) (not ((_ is Some!172) (getValueByKey!167 (toList!856 lt!64952) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))))

(assert (=> d!37969 d!38539))

(declare-fun d!38541 () Bool)

(declare-fun lt!65930 () Bool)

(assert (=> d!38541 (= lt!65930 (select (content!125 (toList!856 lt!65360)) (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun e!83143 () Bool)

(assert (=> d!38541 (= lt!65930 e!83143)))

(declare-fun res!61583 () Bool)

(assert (=> d!38541 (=> (not res!61583) (not e!83143))))

(assert (=> d!38541 (= res!61583 ((_ is Cons!1694) (toList!856 lt!65360)))))

(assert (=> d!38541 (= (contains!879 (toList!856 lt!65360) (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))) lt!65930)))

(declare-fun b!127366 () Bool)

(declare-fun e!83144 () Bool)

(assert (=> b!127366 (= e!83143 e!83144)))

(declare-fun res!61582 () Bool)

(assert (=> b!127366 (=> res!61582 e!83144)))

(assert (=> b!127366 (= res!61582 (= (h!2296 (toList!856 lt!65360)) (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127367 () Bool)

(assert (=> b!127367 (= e!83144 (contains!879 (t!6045 (toList!856 lt!65360)) (tuple2!2577 lt!65022 (minValue!2646 (v!3124 (underlying!439 thiss!992))))))))

(assert (= (and d!38541 res!61583) b!127366))

(assert (= (and b!127366 (not res!61582)) b!127367))

(declare-fun m!149135 () Bool)

(assert (=> d!38541 m!149135))

(declare-fun m!149137 () Bool)

(assert (=> d!38541 m!149137))

(declare-fun m!149139 () Bool)

(assert (=> b!127367 m!149139))

(assert (=> b!126475 d!38541))

(declare-fun d!38543 () Bool)

(declare-fun e!83146 () Bool)

(assert (=> d!38543 e!83146))

(declare-fun res!61584 () Bool)

(assert (=> d!38543 (=> res!61584 e!83146)))

(declare-fun lt!65932 () Bool)

(assert (=> d!38543 (= res!61584 (not lt!65932))))

(declare-fun lt!65931 () Bool)

(assert (=> d!38543 (= lt!65932 lt!65931)))

(declare-fun lt!65934 () Unit!3924)

(declare-fun e!83145 () Unit!3924)

(assert (=> d!38543 (= lt!65934 e!83145)))

(declare-fun c!23350 () Bool)

(assert (=> d!38543 (= c!23350 lt!65931)))

(assert (=> d!38543 (= lt!65931 (containsKey!171 (toList!856 lt!65325) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38543 (= (contains!877 lt!65325 #b1000000000000000000000000000000000000000000000000000000000000000) lt!65932)))

(declare-fun b!127368 () Bool)

(declare-fun lt!65933 () Unit!3924)

(assert (=> b!127368 (= e!83145 lt!65933)))

(assert (=> b!127368 (= lt!65933 (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 lt!65325) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!127368 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!127369 () Bool)

(declare-fun Unit!3980 () Unit!3924)

(assert (=> b!127369 (= e!83145 Unit!3980)))

(declare-fun b!127370 () Bool)

(assert (=> b!127370 (= e!83146 (isDefined!120 (getValueByKey!167 (toList!856 lt!65325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38543 c!23350) b!127368))

(assert (= (and d!38543 (not c!23350)) b!127369))

(assert (= (and d!38543 (not res!61584)) b!127370))

(declare-fun m!149141 () Bool)

(assert (=> d!38543 m!149141))

(declare-fun m!149143 () Bool)

(assert (=> b!127368 m!149143))

(assert (=> b!127368 m!148133))

(assert (=> b!127368 m!148133))

(declare-fun m!149145 () Bool)

(assert (=> b!127368 m!149145))

(assert (=> b!127370 m!148133))

(assert (=> b!127370 m!148133))

(assert (=> b!127370 m!149145))

(assert (=> bm!13622 d!38543))

(assert (=> b!126446 d!38075))

(declare-fun d!38545 () Bool)

(assert (=> d!38545 (isDefined!120 (getValueByKey!167 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun lt!65935 () Unit!3924)

(assert (=> d!38545 (= lt!65935 (choose!761 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(declare-fun e!83147 () Bool)

(assert (=> d!38545 e!83147))

(declare-fun res!61585 () Bool)

(assert (=> d!38545 (=> (not res!61585) (not e!83147))))

(assert (=> d!38545 (= res!61585 (isStrictlySorted!317 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16)))))))

(assert (=> d!38545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)) lt!65935)))

(declare-fun b!127371 () Bool)

(assert (=> b!127371 (= e!83147 (containsKey!171 (toList!856 (getCurrentListMap!536 (_keys!4516 newMap!16) (_values!2766 newMap!16) (mask!7039 newMap!16) (extraKeys!2564 newMap!16) (zeroValue!2646 newMap!16) (minValue!2646 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2783 newMap!16))) (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355)))))

(assert (= (and d!38545 res!61585) b!127371))

(assert (=> d!38545 m!146847))

(assert (=> d!38545 m!147249))

(assert (=> d!38545 m!147249))

(assert (=> d!38545 m!147251))

(assert (=> d!38545 m!146847))

(declare-fun m!149147 () Bool)

(assert (=> d!38545 m!149147))

(declare-fun m!149149 () Bool)

(assert (=> d!38545 m!149149))

(assert (=> b!127371 m!146847))

(assert (=> b!127371 m!147245))

(assert (=> b!126406 d!38545))

(assert (=> b!126406 d!38323))

(assert (=> b!126406 d!38325))

(declare-fun d!38547 () Bool)

(assert (=> d!38547 (= (inRange!0 (ite c!23049 (index!3235 lt!65130) (index!3238 lt!65130)) (mask!7039 newMap!16)) (and (bvsge (ite c!23049 (index!3235 lt!65130) (index!3238 lt!65130)) #b00000000000000000000000000000000) (bvslt (ite c!23049 (index!3235 lt!65130) (index!3238 lt!65130)) (bvadd (mask!7039 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13592 d!38547))

(declare-fun b!127372 () Bool)

(declare-fun e!83149 () (_ BitVec 32))

(declare-fun call!13738 () (_ BitVec 32))

(assert (=> b!127372 (= e!83149 call!13738)))

(declare-fun d!38549 () Bool)

(declare-fun lt!65936 () (_ BitVec 32))

(assert (=> d!38549 (and (bvsge lt!65936 #b00000000000000000000000000000000) (bvsle lt!65936 (bvsub (size!2489 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(declare-fun e!83148 () (_ BitVec 32))

(assert (=> d!38549 (= lt!65936 e!83148)))

(declare-fun c!23352 () Bool)

(assert (=> d!38549 (= c!23352 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(assert (=> d!38549 (and (bvsle #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2489 (_keys!4516 (_2!1300 lt!65097))) (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(assert (=> d!38549 (= (arrayCountValidKeys!0 (_keys!4516 (_2!1300 lt!65097)) #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65097)))) lt!65936)))

(declare-fun b!127373 () Bool)

(assert (=> b!127373 (= e!83148 #b00000000000000000000000000000000)))

(declare-fun bm!13735 () Bool)

(assert (=> bm!13735 (= call!13738 (arrayCountValidKeys!0 (_keys!4516 (_2!1300 lt!65097)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (_2!1300 lt!65097)))))))

(declare-fun b!127374 () Bool)

(assert (=> b!127374 (= e!83149 (bvadd #b00000000000000000000000000000001 call!13738))))

(declare-fun b!127375 () Bool)

(assert (=> b!127375 (= e!83148 e!83149)))

(declare-fun c!23351 () Bool)

(assert (=> b!127375 (= c!23351 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (_2!1300 lt!65097))) #b00000000000000000000000000000000)))))

(assert (= (and d!38549 c!23352) b!127373))

(assert (= (and d!38549 (not c!23352)) b!127375))

(assert (= (and b!127375 c!23351) b!127374))

(assert (= (and b!127375 (not c!23351)) b!127372))

(assert (= (or b!127374 b!127372) bm!13735))

(declare-fun m!149151 () Bool)

(assert (=> bm!13735 m!149151))

(assert (=> b!127375 m!148441))

(assert (=> b!127375 m!148441))

(assert (=> b!127375 m!148443))

(assert (=> b!126461 d!38549))

(declare-fun d!38551 () Bool)

(assert (=> d!38551 (isDefined!120 (getValueByKey!167 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(declare-fun lt!65937 () Unit!3924)

(assert (=> d!38551 (= lt!65937 (choose!761 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(declare-fun e!83150 () Bool)

(assert (=> d!38551 e!83150))

(declare-fun res!61586 () Bool)

(assert (=> d!38551 (=> (not res!61586) (not e!83150))))

(assert (=> d!38551 (= res!61586 (isStrictlySorted!317 (toList!856 call!13583)))))

(assert (=> d!38551 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!119 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))) lt!65937)))

(declare-fun b!127376 () Bool)

(assert (=> b!127376 (= e!83150 (containsKey!171 (toList!856 call!13583) (ite c!23029 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) from!355) (select (arr!2225 (_keys!4516 newMap!16)) (index!3236 lt!65119)))))))

(assert (= (and d!38551 res!61586) b!127376))

(assert (=> d!38551 m!147395))

(assert (=> d!38551 m!147395))

(assert (=> d!38551 m!147397))

(declare-fun m!149153 () Bool)

(assert (=> d!38551 m!149153))

(declare-fun m!149155 () Bool)

(assert (=> d!38551 m!149155))

(assert (=> b!127376 m!147391))

(assert (=> b!126464 d!38551))

(assert (=> b!126464 d!38311))

(assert (=> b!126464 d!38313))

(declare-fun b!127377 () Bool)

(declare-fun e!83152 () (_ BitVec 32))

(declare-fun call!13739 () (_ BitVec 32))

(assert (=> b!127377 (= e!83152 call!13739)))

(declare-fun d!38553 () Bool)

(declare-fun lt!65938 () (_ BitVec 32))

(assert (=> d!38553 (and (bvsge lt!65938 #b00000000000000000000000000000000) (bvsle lt!65938 (bvsub (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!83151 () (_ BitVec 32))

(assert (=> d!38553 (= lt!65938 e!83151)))

(declare-fun c!23354 () Bool)

(assert (=> d!38553 (= c!23354 (bvsge #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38553 (and (bvsle #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(assert (=> d!38553 (= (arrayCountValidKeys!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) #b00000000000000000000000000000000 (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))) lt!65938)))

(declare-fun b!127378 () Bool)

(assert (=> b!127378 (= e!83151 #b00000000000000000000000000000000)))

(declare-fun bm!13736 () Bool)

(assert (=> bm!13736 (= call!13739 (arrayCountValidKeys!0 (_keys!4516 (v!3124 (underlying!439 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2489 (_keys!4516 (v!3124 (underlying!439 thiss!992))))))))

(declare-fun b!127379 () Bool)

(assert (=> b!127379 (= e!83152 (bvadd #b00000000000000000000000000000001 call!13739))))

(declare-fun b!127380 () Bool)

(assert (=> b!127380 (= e!83151 e!83152)))

(declare-fun c!23353 () Bool)

(assert (=> b!127380 (= c!23353 (validKeyInArray!0 (select (arr!2225 (_keys!4516 (v!3124 (underlying!439 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38553 c!23354) b!127378))

(assert (= (and d!38553 (not c!23354)) b!127380))

(assert (= (and b!127380 c!23353) b!127379))

(assert (= (and b!127380 (not c!23353)) b!127377))

(assert (= (or b!127379 b!127377) bm!13736))

(declare-fun m!149157 () Bool)

(assert (=> bm!13736 m!149157))

(assert (=> b!127380 m!148575))

(assert (=> b!127380 m!148575))

(assert (=> b!127380 m!148577))

(assert (=> b!126467 d!38553))

(declare-fun lt!65939 () Bool)

(declare-fun d!38555 () Bool)

(assert (=> d!38555 (= lt!65939 (select (content!125 (toList!856 lt!65349)) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun e!83153 () Bool)

(assert (=> d!38555 (= lt!65939 e!83153)))

(declare-fun res!61588 () Bool)

(assert (=> d!38555 (=> (not res!61588) (not e!83153))))

(assert (=> d!38555 (= res!61588 ((_ is Cons!1694) (toList!856 lt!65349)))))

(assert (=> d!38555 (= (contains!879 (toList!856 lt!65349) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))) lt!65939)))

(declare-fun b!127381 () Bool)

(declare-fun e!83154 () Bool)

(assert (=> b!127381 (= e!83153 e!83154)))

(declare-fun res!61587 () Bool)

(assert (=> b!127381 (=> res!61587 e!83154)))

(assert (=> b!127381 (= res!61587 (= (h!2296 (toList!856 lt!65349)) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(declare-fun b!127382 () Bool)

(assert (=> b!127382 (= e!83154 (contains!879 (t!6045 (toList!856 lt!65349)) (ite (or c!22986 c!22990) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 (v!3124 (underlying!439 thiss!992)))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 (v!3124 (underlying!439 thiss!992)))))))))

(assert (= (and d!38555 res!61588) b!127381))

(assert (= (and b!127381 (not res!61587)) b!127382))

(declare-fun m!149159 () Bool)

(assert (=> d!38555 m!149159))

(declare-fun m!149161 () Bool)

(assert (=> d!38555 m!149161))

(declare-fun m!149163 () Bool)

(assert (=> b!127382 m!149163))

(assert (=> b!126454 d!38555))

(declare-fun d!38557 () Bool)

(declare-fun e!83155 () Bool)

(assert (=> d!38557 e!83155))

(declare-fun res!61589 () Bool)

(assert (=> d!38557 (=> (not res!61589) (not e!83155))))

(declare-fun lt!65942 () ListLongMap!1681)

(assert (=> d!38557 (= res!61589 (contains!877 lt!65942 (_1!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(declare-fun lt!65940 () List!1698)

(assert (=> d!38557 (= lt!65942 (ListLongMap!1682 lt!65940))))

(declare-fun lt!65941 () Unit!3924)

(declare-fun lt!65943 () Unit!3924)

(assert (=> d!38557 (= lt!65941 lt!65943)))

(assert (=> d!38557 (= (getValueByKey!167 lt!65940 (_1!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38557 (= lt!65943 (lemmaContainsTupThenGetReturnValue!82 lt!65940 (_1!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (_2!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38557 (= lt!65940 (insertStrictlySorted!85 (toList!856 (ite c!23090 call!13624 (ite c!23094 call!13618 call!13622))) (_1!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) (_2!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))))))

(assert (=> d!38557 (= (+!170 (ite c!23090 call!13624 (ite c!23094 call!13618 call!13622)) (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))) lt!65942)))

(declare-fun b!127383 () Bool)

(declare-fun res!61590 () Bool)

(assert (=> b!127383 (=> (not res!61590) (not e!83155))))

(assert (=> b!127383 (= res!61590 (= (getValueByKey!167 (toList!856 lt!65942) (_1!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16))))) (Some!172 (_2!1299 (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))))

(declare-fun b!127384 () Bool)

(assert (=> b!127384 (= e!83155 (contains!879 (toList!856 lt!65942) (ite (or c!23090 c!23094) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2646 newMap!16)) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2646 newMap!16)))))))

(assert (= (and d!38557 res!61589) b!127383))

(assert (= (and b!127383 res!61590) b!127384))

(declare-fun m!149165 () Bool)

(assert (=> d!38557 m!149165))

(declare-fun m!149167 () Bool)

(assert (=> d!38557 m!149167))

(declare-fun m!149169 () Bool)

(assert (=> d!38557 m!149169))

(declare-fun m!149171 () Bool)

(assert (=> d!38557 m!149171))

(declare-fun m!149173 () Bool)

(assert (=> b!127383 m!149173))

(declare-fun m!149175 () Bool)

(assert (=> b!127384 m!149175))

(assert (=> bm!13617 d!38557))

(declare-fun d!38559 () Bool)

(declare-fun res!61591 () Bool)

(declare-fun e!83156 () Bool)

(assert (=> d!38559 (=> (not res!61591) (not e!83156))))

(assert (=> d!38559 (= res!61591 (simpleValid!87 (_2!1300 lt!65284)))))

(assert (=> d!38559 (= (valid!505 (_2!1300 lt!65284)) e!83156)))

(declare-fun b!127385 () Bool)

(declare-fun res!61592 () Bool)

(assert (=> b!127385 (=> (not res!61592) (not e!83156))))

(assert (=> b!127385 (= res!61592 (= (arrayCountValidKeys!0 (_keys!4516 (_2!1300 lt!65284)) #b00000000000000000000000000000000 (size!2489 (_keys!4516 (_2!1300 lt!65284)))) (_size!580 (_2!1300 lt!65284))))))

(declare-fun b!127386 () Bool)

(declare-fun res!61593 () Bool)

(assert (=> b!127386 (=> (not res!61593) (not e!83156))))

(assert (=> b!127386 (= res!61593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4516 (_2!1300 lt!65284)) (mask!7039 (_2!1300 lt!65284))))))

(declare-fun b!127387 () Bool)

(assert (=> b!127387 (= e!83156 (arrayNoDuplicates!0 (_keys!4516 (_2!1300 lt!65284)) #b00000000000000000000000000000000 Nil!1697))))

(assert (= (and d!38559 res!61591) b!127385))

(assert (= (and b!127385 res!61592) b!127386))

(assert (= (and b!127386 res!61593) b!127387))

(declare-fun m!149177 () Bool)

(assert (=> d!38559 m!149177))

(declare-fun m!149179 () Bool)

(assert (=> b!127385 m!149179))

(declare-fun m!149181 () Bool)

(assert (=> b!127386 m!149181))

(declare-fun m!149183 () Bool)

(assert (=> b!127387 m!149183))

(assert (=> b!126394 d!38559))

(declare-fun d!38561 () Bool)

(assert (=> d!38561 (= (get!1447 (getValueByKey!167 (toList!856 lt!65021) lt!65018)) (v!3128 (getValueByKey!167 (toList!856 lt!65021) lt!65018)))))

(assert (=> d!38037 d!38561))

(declare-fun d!38563 () Bool)

(declare-fun c!23355 () Bool)

(assert (=> d!38563 (= c!23355 (and ((_ is Cons!1694) (toList!856 lt!65021)) (= (_1!1299 (h!2296 (toList!856 lt!65021))) lt!65018)))))

(declare-fun e!83157 () Option!173)

(assert (=> d!38563 (= (getValueByKey!167 (toList!856 lt!65021) lt!65018) e!83157)))

(declare-fun b!127389 () Bool)

(declare-fun e!83158 () Option!173)

(assert (=> b!127389 (= e!83157 e!83158)))

(declare-fun c!23356 () Bool)

(assert (=> b!127389 (= c!23356 (and ((_ is Cons!1694) (toList!856 lt!65021)) (not (= (_1!1299 (h!2296 (toList!856 lt!65021))) lt!65018))))))

(declare-fun b!127391 () Bool)

(assert (=> b!127391 (= e!83158 None!171)))

(declare-fun b!127390 () Bool)

(assert (=> b!127390 (= e!83158 (getValueByKey!167 (t!6045 (toList!856 lt!65021)) lt!65018))))

(declare-fun b!127388 () Bool)

(assert (=> b!127388 (= e!83157 (Some!172 (_2!1299 (h!2296 (toList!856 lt!65021)))))))

(assert (= (and d!38563 c!23355) b!127388))

(assert (= (and d!38563 (not c!23355)) b!127389))

(assert (= (and b!127389 c!23356) b!127390))

(assert (= (and b!127389 (not c!23356)) b!127391))

(declare-fun m!149185 () Bool)

(assert (=> b!127390 m!149185))

(assert (=> d!38037 d!38563))

(assert (=> bm!13614 d!38007))

(declare-fun d!38565 () Bool)

(declare-fun e!83159 () Bool)

(assert (=> d!38565 e!83159))

(declare-fun res!61594 () Bool)

(assert (=> d!38565 (=> (not res!61594) (not e!83159))))

(declare-fun lt!65946 () ListLongMap!1681)

(assert (=> d!38565 (= res!61594 (contains!877 lt!65946 (_1!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(declare-fun lt!65944 () List!1698)

(assert (=> d!38565 (= lt!65946 (ListLongMap!1682 lt!65944))))

(declare-fun lt!65945 () Unit!3924)

(declare-fun lt!65947 () Unit!3924)

(assert (=> d!38565 (= lt!65945 lt!65947)))

(assert (=> d!38565 (= (getValueByKey!167 lt!65944 (_1!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))) (Some!172 (_2!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(assert (=> d!38565 (= lt!65947 (lemmaContainsTupThenGetReturnValue!82 lt!65944 (_1!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (_2!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(assert (=> d!38565 (= lt!65944 (insertStrictlySorted!85 (toList!856 (ite c!23096 call!13631 (ite c!23100 call!13625 call!13629))) (_1!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) (_2!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))))))

(assert (=> d!38565 (= (+!170 (ite c!23096 call!13631 (ite c!23100 call!13625 call!13629)) (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))) lt!65946)))

(declare-fun b!127392 () Bool)

(declare-fun res!61595 () Bool)

(assert (=> b!127392 (=> (not res!61595) (not e!83159))))

(assert (=> b!127392 (= res!61595 (= (getValueByKey!167 (toList!856 lt!65946) (_1!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16)))))) (Some!172 (_2!1299 (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))))

(declare-fun b!127393 () Bool)

(assert (=> b!127393 (= e!83159 (contains!879 (toList!856 lt!65946) (ite (or c!23096 c!23100) (tuple2!2577 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23022 c!23024) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2646 newMap!16))) (tuple2!2577 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23022 (ite c!23024 (minValue!2646 newMap!16) (get!1443 (select (arr!2226 (_values!2766 (v!3124 (underlying!439 thiss!992)))) from!355) (dynLambda!413 (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2646 newMap!16))))))))

(assert (= (and d!38565 res!61594) b!127392))

(assert (= (and b!127392 res!61595) b!127393))

(declare-fun m!149187 () Bool)

(assert (=> d!38565 m!149187))

(declare-fun m!149189 () Bool)

(assert (=> d!38565 m!149189))

(declare-fun m!149191 () Bool)

(assert (=> d!38565 m!149191))

(declare-fun m!149193 () Bool)

(assert (=> d!38565 m!149193))

(declare-fun m!149195 () Bool)

(assert (=> b!127392 m!149195))

(declare-fun m!149197 () Bool)

(assert (=> b!127393 m!149197))

(assert (=> bm!13624 d!38565))

(declare-fun mapIsEmpty!4513 () Bool)

(declare-fun mapRes!4513 () Bool)

(assert (=> mapIsEmpty!4513 mapRes!4513))

(declare-fun condMapEmpty!4513 () Bool)

(declare-fun mapDefault!4513 () ValueCell!1077)

(assert (=> mapNonEmpty!4511 (= condMapEmpty!4513 (= mapRest!4511 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4513)))))

(declare-fun e!83160 () Bool)

(assert (=> mapNonEmpty!4511 (= tp!10973 (and e!83160 mapRes!4513))))

(declare-fun b!127395 () Bool)

(assert (=> b!127395 (= e!83160 tp_is_empty!2841)))

(declare-fun b!127394 () Bool)

(declare-fun e!83161 () Bool)

(assert (=> b!127394 (= e!83161 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4513 () Bool)

(declare-fun tp!10975 () Bool)

(assert (=> mapNonEmpty!4513 (= mapRes!4513 (and tp!10975 e!83161))))

(declare-fun mapKey!4513 () (_ BitVec 32))

(declare-fun mapValue!4513 () ValueCell!1077)

(declare-fun mapRest!4513 () (Array (_ BitVec 32) ValueCell!1077))

(assert (=> mapNonEmpty!4513 (= mapRest!4511 (store mapRest!4513 mapKey!4513 mapValue!4513))))

(assert (= (and mapNonEmpty!4511 condMapEmpty!4513) mapIsEmpty!4513))

(assert (= (and mapNonEmpty!4511 (not condMapEmpty!4513)) mapNonEmpty!4513))

(assert (= (and mapNonEmpty!4513 ((_ is ValueCellFull!1077) mapValue!4513)) b!127394))

(assert (= (and mapNonEmpty!4511 ((_ is ValueCellFull!1077) mapDefault!4513)) b!127395))

(declare-fun m!149199 () Bool)

(assert (=> mapNonEmpty!4513 m!149199))

(declare-fun mapIsEmpty!4514 () Bool)

(declare-fun mapRes!4514 () Bool)

(assert (=> mapIsEmpty!4514 mapRes!4514))

(declare-fun condMapEmpty!4514 () Bool)

(declare-fun mapDefault!4514 () ValueCell!1077)

(assert (=> mapNonEmpty!4512 (= condMapEmpty!4514 (= mapRest!4512 ((as const (Array (_ BitVec 32) ValueCell!1077)) mapDefault!4514)))))

(declare-fun e!83162 () Bool)

(assert (=> mapNonEmpty!4512 (= tp!10974 (and e!83162 mapRes!4514))))

(declare-fun b!127397 () Bool)

(assert (=> b!127397 (= e!83162 tp_is_empty!2841)))

(declare-fun b!127396 () Bool)

(declare-fun e!83163 () Bool)

(assert (=> b!127396 (= e!83163 tp_is_empty!2841)))

(declare-fun mapNonEmpty!4514 () Bool)

(declare-fun tp!10976 () Bool)

(assert (=> mapNonEmpty!4514 (= mapRes!4514 (and tp!10976 e!83163))))

(declare-fun mapRest!4514 () (Array (_ BitVec 32) ValueCell!1077))

(declare-fun mapValue!4514 () ValueCell!1077)

(declare-fun mapKey!4514 () (_ BitVec 32))

(assert (=> mapNonEmpty!4514 (= mapRest!4512 (store mapRest!4514 mapKey!4514 mapValue!4514))))

(assert (= (and mapNonEmpty!4512 condMapEmpty!4514) mapIsEmpty!4514))

(assert (= (and mapNonEmpty!4512 (not condMapEmpty!4514)) mapNonEmpty!4514))

(assert (= (and mapNonEmpty!4514 ((_ is ValueCellFull!1077) mapValue!4514)) b!127396))

(assert (= (and mapNonEmpty!4512 ((_ is ValueCellFull!1077) mapDefault!4514)) b!127397))

(declare-fun m!149201 () Bool)

(assert (=> mapNonEmpty!4514 m!149201))

(declare-fun b_lambda!5609 () Bool)

(assert (= b_lambda!5579 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5609)))

(declare-fun b_lambda!5611 () Bool)

(assert (= b_lambda!5581 (or (and b!125935 b_free!2849) (and b!125945 b_free!2851 (= (defaultEntry!2783 newMap!16) (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))))) b_lambda!5611)))

(declare-fun b_lambda!5613 () Bool)

(assert (= b_lambda!5605 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5613)))

(declare-fun b_lambda!5615 () Bool)

(assert (= b_lambda!5587 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5615)))

(declare-fun b_lambda!5617 () Bool)

(assert (= b_lambda!5585 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5617)))

(declare-fun b_lambda!5619 () Bool)

(assert (= b_lambda!5591 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5619)))

(declare-fun b_lambda!5621 () Bool)

(assert (= b_lambda!5589 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5621)))

(declare-fun b_lambda!5623 () Bool)

(assert (= b_lambda!5601 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5623)))

(declare-fun b_lambda!5625 () Bool)

(assert (= b_lambda!5593 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5625)))

(declare-fun b_lambda!5627 () Bool)

(assert (= b_lambda!5595 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5627)))

(declare-fun b_lambda!5629 () Bool)

(assert (= b_lambda!5603 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5629)))

(declare-fun b_lambda!5631 () Bool)

(assert (= b_lambda!5583 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5631)))

(declare-fun b_lambda!5633 () Bool)

(assert (= b_lambda!5599 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5633)))

(declare-fun b_lambda!5635 () Bool)

(assert (= b_lambda!5597 (or (and b!125935 b_free!2849 (= (defaultEntry!2783 (v!3124 (underlying!439 thiss!992))) (defaultEntry!2783 newMap!16))) (and b!125945 b_free!2851) b_lambda!5635)))

(check-sat b_and!7849 (not b!127269) (not b!127169) (not b!127184) (not b!126579) (not d!38417) (not d!38481) (not d!38195) (not b!127061) (not b!126858) (not b!127267) (not d!38207) (not b_lambda!5615) (not b!127311) (not b!126681) (not b_lambda!5553) (not bm!13712) (not b!126846) (not b!126872) (not b!127057) (not b!126893) (not b!126820) (not b!127072) (not b_lambda!5575) (not d!38247) (not d!38165) (not b!126889) (not d!38233) (not b!126732) (not b!127113) (not d!38385) (not b!127302) (not d!38443) (not b!127278) (not b!126894) (not b!126844) (not b!126586) (not b!126887) (not bm!13681) (not b!126611) (not b!126900) (not d!38407) (not b!127116) (not b!127213) tp_is_empty!2841 (not d!38097) (not d!38237) (not d!38297) (not b!127154) (not b!126886) (not bm!13685) (not b!126838) (not b!127370) (not bm!13638) (not bm!13693) (not b!127309) (not d!38507) (not b!127187) (not b!126859) (not d!38125) (not bm!13709) (not d!38319) (not d!38239) (not d!38265) (not b!126734) (not b!126903) (not b!126829) (not b!127393) (not bm!13684) (not b!126864) (not d!38401) (not b!127135) (not d!38191) (not bm!13704) (not b!126565) (not b!126986) (not b!126786) (not d!38077) (not b!126654) (not d!38105) (not bm!13733) (not b!126932) (not b!127359) (not b!126603) (not d!38169) (not b!126860) (not b!127156) (not b!127286) (not d!38363) (not b!127022) (not b!127283) (not bm!13689) (not b!126701) (not b!126973) (not b!127188) (not b!127175) (not b!127046) (not b!126832) (not b!126798) (not b!126746) (not b!126594) (not b!127392) (not b!127386) (not d!38109) (not b!127277) (not b!127059) (not b_lambda!5625) (not b!126996) (not d!38197) (not d!38155) (not d!38487) (not b!127298) (not b!127068) (not d!38193) (not b!126737) (not bm!13671) (not b_lambda!5633) (not b!127362) (not d!38229) (not b!127152) (not b!127371) (not b!126936) (not d!38159) (not d!38269) (not b!127382) (not b!127142) (not b!126705) (not d!38517) (not b!126730) (not d!38433) (not bm!13729) (not d!38153) (not d!38253) (not b!127321) (not b!126855) (not b!126778) (not b!126799) (not bm!13641) (not b!126643) (not d!38263) (not d!38231) (not b!127275) (not b!127390) (not b!127106) (not d!38131) (not b!126999) (not d!38457) (not d!38221) (not b!126747) (not d!38565) (not d!38405) (not b!126677) (not b!127013) (not bm!13678) (not b!127301) (not b!126833) (not b_next!2849) (not b!126650) (not b!127319) (not bm!13690) (not d!38205) (not d!38475) (not b!127163) (not d!38355) (not b!126827) (not bm!13637) (not bm!13736) (not b_lambda!5607) (not b!126852) (not d!38249) (not b!126811) (not d!38429) (not b!126591) (not b!127272) (not d!38359) (not b!127158) (not b!127056) (not b!127306) (not b!126679) (not b!126970) (not b!126621) (not d!38369) (not d!38551) (not b!126847) (not b!126983) (not d!38511) (not d!38329) (not b!126785) (not b!126638) (not b!126628) (not b!127132) (not bm!13721) (not d!38351) (not d!38503) (not bm!13636) (not b!126950) (not b!126624) (not bm!13663) (not d!38219) (not d!38211) (not d!38349) (not d!38465) (not b!127114) (not d!38499) (not d!38495) (not b!127143) (not b!127317) (not b!126870) (not b!127164) (not d!38427) (not b!126620) (not bm!13697) (not b!126848) (not d!38559) (not d!38113) (not d!38217) (not d!38199) (not b!126960) (not b!127210) (not b!126947) (not b!126614) (not b!127294) (not b!126735) (not b!126891) (not b!127239) (not b!126805) (not b!126775) (not b!126862) (not d!38479) (not b!126817) (not d!38129) (not b!127166) (not d!38437) (not d!38091) (not b!127204) (not bm!13702) (not b!126627) (not bm!13673) (not b!126807) (not d!38185) (not b!127035) (not b!126664) (not b!127322) (not b!126689) (not d!38493) (not b!126866) (not d!38541) (not b!126788) (not b_lambda!5623) (not d!38451) (not d!38117) (not b!126975) (not b!126740) (not b!127194) (not b!126824) (not b!126721) (not mapNonEmpty!4514) (not b!126920) (not b!127299) (not d!38273) (not b!127031) (not b!126911) (not bm!13653) (not d!38301) (not b!127111) (not b!126599) (not b!127228) (not d!38305) (not b!126675) (not bm!13705) (not b!126890) (not b!127308) (not b!126700) (not bm!13720) (not bm!13730) (not bm!13716) (not b!127092) (not bm!13660) (not b!127094) (not b!127238) (not bm!13682) (not b!126867) (not b!127229) (not b!126794) (not b!127104) (not d!38215) (not b!127384) (not d!38323) (not b!126850) (not bm!13651) (not b!127076) (not b!126815) (not b!127368) b_and!7847 (not d!38381) (not d!38343) (not d!38293) (not b!127274) (not d!38289) (not b!126714) (not b_lambda!5573) (not b!127242) (not b!127102) (not b!126562) (not b!126604) (not d!38485) (not b!127009) (not d!38251) (not d!38537) (not d!38295) (not d!38525) (not b!126641) (not b!127161) (not b!127304) (not b!127150) (not d!38287) (not b!126618) (not b!126924) (not b!126909) (not b!126652) (not b!127221) (not d!38361) (not d!38501) (not b!127147) (not b!127109) (not b!127216) (not d!38467) (not d!38065) (not b_lambda!5613) (not d!38317) (not d!38137) (not b!126863) (not d!38079) (not b!127197) (not b!126564) (not d!38535) (not d!38069) (not b!126639) (not d!38285) (not b!127040) (not b!126888) (not b!126770) (not b_lambda!5635) (not bm!13687) (not bm!13645) (not b!127383) (not b!126642) (not d!38279) (not b!127037) (not b!127314) (not d!38441) (not b_next!2851) (not b!127380) (not d!38261) (not d!38413) (not d!38353) (not d!38333) (not b!126876) (not b_lambda!5631) (not b!127315) (not b!127212) (not b!126881) (not d!38557) (not d!38235) (not b!126880) (not b!126978) (not b_lambda!5557) (not bm!13711) (not b!126928) (not b!127305) (not b!127230) (not b!126990) (not b!126962) (not b_lambda!5627) (not b!126971) (not bm!13735) (not bm!13649) (not d!38213) (not bm!13734) (not b!126958) (not d!38223) (not b!126703) (not d!38259) (not d!38203) (not b!127043) (not b!126708) (not b!126939) (not b!127128) (not b!127215) (not b!126856) (not b!127367) (not b!126711) (not b!126884) (not b!126780) (not bm!13666) (not b!126917) (not b!126830) (not b!127180) (not bm!13668) (not d!38315) (not b!126601) (not b_lambda!5611) (not b!127034) (not d!38505) (not bm!13717) (not d!38411) (not d!38271) (not b!126690) (not b!127098) (not d!38225) (not b_lambda!5617) (not d!38489) (not b!127085) (not d!38167) (not b!127124) (not d!38085) (not b!126626) (not b!127325) (not bm!13676) (not d!38177) (not b!126716) (not b!127155) (not d!38469) (not b!127032) (not b!127327) (not b!127078) (not d!38189) (not bm!13677) (not b!127375) (not b!126956) (not bm!13635) (not b!126596) (not d!38145) (not d!38183) (not bm!13701) (not b!127297) (not b!127191) (not d!38151) (not b!126877) (not d!38245) (not b!127096) (not d!38395) (not bm!13643) (not d!38241) (not d!38073) (not b!126906) (not d!38459) (not d!38209) (not bm!13728) (not d!38337) (not b!127084) (not b!127224) (not b_lambda!5571) (not b!127172) (not b!127350) (not b!127107) (not b!126809) (not b!127042) (not d!38347) (not b!126980) (not d!38281) (not b!126875) (not d!38107) (not b!127051) (not b!126789) (not b!126966) (not d!38445) (not b!126982) (not d!38311) (not b!127183) (not b!126987) (not b!127070) (not d!38201) (not b!127058) (not d!38447) (not d!38339) (not b!126719) (not d!38555) (not b!127320) (not b!127205) (not d!38121) (not d!38345) (not b!127363) (not bm!13707) (not bm!13692) (not b!126927) (not b!126912) (not b!127236) (not d!38463) (not b!127001) (not bm!13669) (not b!126605) (not b!127356) (not d!38455) (not b!126901) (not d!38275) (not b!126662) (not d!38403) (not bm!13714) (not b!127121) (not d!38187) (not b!127364) (not b_lambda!5569) (not d!38331) (not b!126853) (not d!38227) (not b!127365) (not b!126845) (not d!38071) (not b!126715) (not b!126633) (not bm!13695) (not d!38147) (not d!38523) (not b!126935) (not b!127080) (not d!38291) (not b!126593) (not b!127140) (not b_lambda!5619) (not d!38255) (not d!38543) (not b!127387) (not b!127066) (not d!38123) (not b!127300) (not b!126988) (not b!126822) (not b!126590) (not b!127316) (not d!38545) (not b!126656) (not b!126589) (not d!38439) (not b!127226) (not b!126968) (not b!127171) (not d!38519) (not b!127026) (not bm!13640) (not b!127225) (not b!126660) (not d!38083) (not d!38497) (not b!127011) (not d!38173) (not b!127207) (not b!126941) (not d!38243) (not b!126879) (not b_lambda!5577) (not b!127385) (not b!126687) (not b!126726) (not b!126938) (not b!126944) (not b!126769) (not b_lambda!5609) (not bm!13646) (not b!127119) (not b!127376) (not d!38135) (not b!127017) (not bm!13698) (not b!127160) (not b!127288) (not d!38483) (not d!38533) (not b!126587) (not d!38393) (not b!127087) (not b!126722) (not b!127081) (not d!38161) (not b_lambda!5621) (not b!126819) (not b!127045) (not b!127291) (not b!126585) (not b!126665) (not b!126908) (not b!126929) (not b!126976) (not b!126921) (not d!38179) (not b!126670) (not b!126933) (not b_lambda!5629) (not b!127021) (not b!127007) (not bm!13648) (not b!126883) (not b!126685) (not b!126842) (not d!38299) (not mapNonEmpty!4513) (not b!126931) (not d!38491) (not b!126783) (not b!127019) (not b!127174) (not b!126800) (not d!38309) (not b!127002))
(check-sat b_and!7847 b_and!7849 (not b_next!2849) (not b_next!2851))
