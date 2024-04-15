; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18598 () Bool)

(assert start!18598)

(declare-fun b!183936 () Bool)

(declare-fun b_free!4537 () Bool)

(declare-fun b_next!4537 () Bool)

(assert (=> b!183936 (= b_free!4537 (not b_next!4537))))

(declare-fun tp!16390 () Bool)

(declare-fun b_and!11093 () Bool)

(assert (=> b!183936 (= tp!16390 b_and!11093)))

(declare-fun e!121075 () Bool)

(declare-fun e!121073 () Bool)

(declare-fun tp_is_empty!4309 () Bool)

(declare-datatypes ((V!5393 0))(
  ( (V!5394 (val!2199 Int)) )
))
(declare-datatypes ((ValueCell!1811 0))(
  ( (ValueCellFull!1811 (v!4098 V!5393)) (EmptyCell!1811) )
))
(declare-datatypes ((array!7795 0))(
  ( (array!7796 (arr!3682 (Array (_ BitVec 32) (_ BitVec 64))) (size!3997 (_ BitVec 32))) )
))
(declare-datatypes ((array!7797 0))(
  ( (array!7798 (arr!3683 (Array (_ BitVec 32) ValueCell!1811)) (size!3998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2530 0))(
  ( (LongMapFixedSize!2531 (defaultEntry!3759 Int) (mask!8836 (_ BitVec 32)) (extraKeys!3496 (_ BitVec 32)) (zeroValue!3600 V!5393) (minValue!3600 V!5393) (_size!1314 (_ BitVec 32)) (_keys!5684 array!7795) (_values!3742 array!7797) (_vacant!1314 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2530)

(declare-fun array_inv!2381 (array!7795) Bool)

(declare-fun array_inv!2382 (array!7797) Bool)

(assert (=> b!183936 (= e!121073 (and tp!16390 tp_is_empty!4309 (array_inv!2381 (_keys!5684 thiss!1248)) (array_inv!2382 (_values!3742 thiss!1248)) e!121075))))

(declare-fun mapIsEmpty!7405 () Bool)

(declare-fun mapRes!7405 () Bool)

(assert (=> mapIsEmpty!7405 mapRes!7405))

(declare-fun b!183937 () Bool)

(declare-fun e!121070 () Bool)

(assert (=> b!183937 (= e!121070 tp_is_empty!4309)))

(declare-fun b!183938 () Bool)

(declare-fun res!87008 () Bool)

(declare-fun e!121071 () Bool)

(assert (=> b!183938 (=> (not res!87008) (not e!121071))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3394 0))(
  ( (tuple2!3395 (_1!1708 (_ BitVec 64)) (_2!1708 V!5393)) )
))
(declare-datatypes ((List!2334 0))(
  ( (Nil!2331) (Cons!2330 (h!2961 tuple2!3394) (t!7197 List!2334)) )
))
(declare-datatypes ((ListLongMap!2303 0))(
  ( (ListLongMap!2304 (toList!1167 List!2334)) )
))
(declare-fun contains!1263 (ListLongMap!2303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!800 (array!7795 array!7797 (_ BitVec 32) (_ BitVec 32) V!5393 V!5393 (_ BitVec 32) Int) ListLongMap!2303)

(assert (=> b!183938 (= res!87008 (not (contains!1263 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) key!828)))))

(declare-fun b!183939 () Bool)

(declare-fun e!121074 () Bool)

(assert (=> b!183939 (= e!121074 tp_is_empty!4309)))

(declare-fun b!183940 () Bool)

(declare-fun e!121069 () Bool)

(assert (=> b!183940 (= e!121069 e!121071)))

(declare-fun res!87011 () Bool)

(assert (=> b!183940 (=> (not res!87011) (not e!121071))))

(declare-datatypes ((SeekEntryResult!625 0))(
  ( (MissingZero!625 (index!4670 (_ BitVec 32))) (Found!625 (index!4671 (_ BitVec 32))) (Intermediate!625 (undefined!1437 Bool) (index!4672 (_ BitVec 32)) (x!20030 (_ BitVec 32))) (Undefined!625) (MissingVacant!625 (index!4673 (_ BitVec 32))) )
))
(declare-fun lt!90850 () SeekEntryResult!625)

(get-info :version)

(assert (=> b!183940 (= res!87011 (and (not ((_ is Undefined!625) lt!90850)) (not ((_ is MissingVacant!625) lt!90850)) (not ((_ is MissingZero!625) lt!90850)) ((_ is Found!625) lt!90850)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7795 (_ BitVec 32)) SeekEntryResult!625)

(assert (=> b!183940 (= lt!90850 (seekEntryOrOpen!0 key!828 (_keys!5684 thiss!1248) (mask!8836 thiss!1248)))))

(declare-fun b!183941 () Bool)

(declare-fun res!87010 () Bool)

(assert (=> b!183941 (=> (not res!87010) (not e!121069))))

(assert (=> b!183941 (= res!87010 (not (= key!828 (bvneg key!828))))))

(declare-fun b!183942 () Bool)

(assert (=> b!183942 (= e!121075 (and e!121070 mapRes!7405))))

(declare-fun condMapEmpty!7405 () Bool)

(declare-fun mapDefault!7405 () ValueCell!1811)

(assert (=> b!183942 (= condMapEmpty!7405 (= (arr!3683 (_values!3742 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1811)) mapDefault!7405)))))

(declare-fun b!183935 () Bool)

(assert (=> b!183935 (= e!121071 (and (= (size!3998 (_values!3742 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8836 thiss!1248))) (= (size!3997 (_keys!5684 thiss!1248)) (size!3998 (_values!3742 thiss!1248))) (bvslt (mask!8836 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!87009 () Bool)

(assert (=> start!18598 (=> (not res!87009) (not e!121069))))

(declare-fun valid!1063 (LongMapFixedSize!2530) Bool)

(assert (=> start!18598 (= res!87009 (valid!1063 thiss!1248))))

(assert (=> start!18598 e!121069))

(assert (=> start!18598 e!121073))

(assert (=> start!18598 true))

(declare-fun mapNonEmpty!7405 () Bool)

(declare-fun tp!16389 () Bool)

(assert (=> mapNonEmpty!7405 (= mapRes!7405 (and tp!16389 e!121074))))

(declare-fun mapRest!7405 () (Array (_ BitVec 32) ValueCell!1811))

(declare-fun mapKey!7405 () (_ BitVec 32))

(declare-fun mapValue!7405 () ValueCell!1811)

(assert (=> mapNonEmpty!7405 (= (arr!3683 (_values!3742 thiss!1248)) (store mapRest!7405 mapKey!7405 mapValue!7405))))

(declare-fun b!183943 () Bool)

(declare-fun res!87007 () Bool)

(assert (=> b!183943 (=> (not res!87007) (not e!121071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!183943 (= res!87007 (validMask!0 (mask!8836 thiss!1248)))))

(assert (= (and start!18598 res!87009) b!183941))

(assert (= (and b!183941 res!87010) b!183940))

(assert (= (and b!183940 res!87011) b!183938))

(assert (= (and b!183938 res!87008) b!183943))

(assert (= (and b!183943 res!87007) b!183935))

(assert (= (and b!183942 condMapEmpty!7405) mapIsEmpty!7405))

(assert (= (and b!183942 (not condMapEmpty!7405)) mapNonEmpty!7405))

(assert (= (and mapNonEmpty!7405 ((_ is ValueCellFull!1811) mapValue!7405)) b!183939))

(assert (= (and b!183942 ((_ is ValueCellFull!1811) mapDefault!7405)) b!183937))

(assert (= b!183936 b!183942))

(assert (= start!18598 b!183936))

(declare-fun m!210927 () Bool)

(assert (=> b!183938 m!210927))

(assert (=> b!183938 m!210927))

(declare-fun m!210929 () Bool)

(assert (=> b!183938 m!210929))

(declare-fun m!210931 () Bool)

(assert (=> b!183940 m!210931))

(declare-fun m!210933 () Bool)

(assert (=> mapNonEmpty!7405 m!210933))

(declare-fun m!210935 () Bool)

(assert (=> b!183936 m!210935))

(declare-fun m!210937 () Bool)

(assert (=> b!183936 m!210937))

(declare-fun m!210939 () Bool)

(assert (=> start!18598 m!210939))

(declare-fun m!210941 () Bool)

(assert (=> b!183943 m!210941))

(check-sat (not mapNonEmpty!7405) b_and!11093 (not b!183940) (not start!18598) (not b!183936) (not b!183943) (not b_next!4537) tp_is_empty!4309 (not b!183938))
(check-sat b_and!11093 (not b_next!4537))
(get-model)

(declare-fun d!54735 () Bool)

(declare-fun e!121122 () Bool)

(assert (=> d!54735 e!121122))

(declare-fun res!87044 () Bool)

(assert (=> d!54735 (=> res!87044 e!121122)))

(declare-fun lt!90868 () Bool)

(assert (=> d!54735 (= res!87044 (not lt!90868))))

(declare-fun lt!90866 () Bool)

(assert (=> d!54735 (= lt!90868 lt!90866)))

(declare-datatypes ((Unit!5535 0))(
  ( (Unit!5536) )
))
(declare-fun lt!90867 () Unit!5535)

(declare-fun e!121123 () Unit!5535)

(assert (=> d!54735 (= lt!90867 e!121123)))

(declare-fun c!32994 () Bool)

(assert (=> d!54735 (= c!32994 lt!90866)))

(declare-fun containsKey!220 (List!2334 (_ BitVec 64)) Bool)

(assert (=> d!54735 (= lt!90866 (containsKey!220 (toList!1167 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(assert (=> d!54735 (= (contains!1263 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) key!828) lt!90868)))

(declare-fun b!184004 () Bool)

(declare-fun lt!90865 () Unit!5535)

(assert (=> b!184004 (= e!121123 lt!90865)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!169 (List!2334 (_ BitVec 64)) Unit!5535)

(assert (=> b!184004 (= lt!90865 (lemmaContainsKeyImpliesGetValueByKeyDefined!169 (toList!1167 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(declare-datatypes ((Option!222 0))(
  ( (Some!221 (v!4101 V!5393)) (None!220) )
))
(declare-fun isDefined!170 (Option!222) Bool)

(declare-fun getValueByKey!216 (List!2334 (_ BitVec 64)) Option!222)

(assert (=> b!184004 (isDefined!170 (getValueByKey!216 (toList!1167 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828))))

(declare-fun b!184005 () Bool)

(declare-fun Unit!5537 () Unit!5535)

(assert (=> b!184005 (= e!121123 Unit!5537)))

(declare-fun b!184006 () Bool)

(assert (=> b!184006 (= e!121122 (isDefined!170 (getValueByKey!216 (toList!1167 (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248))) key!828)))))

(assert (= (and d!54735 c!32994) b!184004))

(assert (= (and d!54735 (not c!32994)) b!184005))

(assert (= (and d!54735 (not res!87044)) b!184006))

(declare-fun m!210975 () Bool)

(assert (=> d!54735 m!210975))

(declare-fun m!210977 () Bool)

(assert (=> b!184004 m!210977))

(declare-fun m!210979 () Bool)

(assert (=> b!184004 m!210979))

(assert (=> b!184004 m!210979))

(declare-fun m!210981 () Bool)

(assert (=> b!184004 m!210981))

(assert (=> b!184006 m!210979))

(assert (=> b!184006 m!210979))

(assert (=> b!184006 m!210981))

(assert (=> b!183938 d!54735))

(declare-fun b!184049 () Bool)

(declare-fun e!121157 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184049 (= e!121157 (validKeyInArray!0 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184050 () Bool)

(declare-fun e!121153 () ListLongMap!2303)

(declare-fun call!18567 () ListLongMap!2303)

(assert (=> b!184050 (= e!121153 call!18567)))

(declare-fun b!184051 () Bool)

(declare-fun e!121150 () Bool)

(declare-fun e!121162 () Bool)

(assert (=> b!184051 (= e!121150 e!121162)))

(declare-fun res!87068 () Bool)

(declare-fun call!18569 () Bool)

(assert (=> b!184051 (= res!87068 call!18569)))

(assert (=> b!184051 (=> (not res!87068) (not e!121162))))

(declare-fun b!184052 () Bool)

(declare-fun e!121152 () Bool)

(declare-fun e!121155 () Bool)

(assert (=> b!184052 (= e!121152 e!121155)))

(declare-fun res!87063 () Bool)

(assert (=> b!184052 (=> (not res!87063) (not e!121155))))

(declare-fun lt!90920 () ListLongMap!2303)

(assert (=> b!184052 (= res!87063 (contains!1263 lt!90920 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))))))

(declare-fun b!184053 () Bool)

(declare-fun e!121158 () ListLongMap!2303)

(declare-fun call!18571 () ListLongMap!2303)

(declare-fun +!278 (ListLongMap!2303 tuple2!3394) ListLongMap!2303)

(assert (=> b!184053 (= e!121158 (+!278 call!18571 (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3600 thiss!1248))))))

(declare-fun b!184054 () Bool)

(declare-fun e!121161 () Bool)

(declare-fun call!18570 () Bool)

(assert (=> b!184054 (= e!121161 (not call!18570))))

(declare-fun b!184055 () Bool)

(declare-fun res!87067 () Bool)

(declare-fun e!121156 () Bool)

(assert (=> b!184055 (=> (not res!87067) (not e!121156))))

(assert (=> b!184055 (= res!87067 e!121161)))

(declare-fun c!33012 () Bool)

(assert (=> b!184055 (= c!33012 (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!184056 () Bool)

(declare-fun e!121154 () Unit!5535)

(declare-fun Unit!5538 () Unit!5535)

(assert (=> b!184056 (= e!121154 Unit!5538)))

(declare-fun b!184057 () Bool)

(declare-fun e!121160 () ListLongMap!2303)

(declare-fun call!18565 () ListLongMap!2303)

(assert (=> b!184057 (= e!121160 call!18565)))

(declare-fun b!184058 () Bool)

(assert (=> b!184058 (= e!121156 e!121150)))

(declare-fun c!33007 () Bool)

(assert (=> b!184058 (= c!33007 (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184059 () Bool)

(declare-fun res!87066 () Bool)

(assert (=> b!184059 (=> (not res!87066) (not e!121156))))

(assert (=> b!184059 (= res!87066 e!121152)))

(declare-fun res!87071 () Bool)

(assert (=> b!184059 (=> res!87071 e!121152)))

(declare-fun e!121159 () Bool)

(assert (=> b!184059 (= res!87071 (not e!121159))))

(declare-fun res!87065 () Bool)

(assert (=> b!184059 (=> (not res!87065) (not e!121159))))

(assert (=> b!184059 (= res!87065 (bvslt #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))))))

(declare-fun bm!18562 () Bool)

(declare-fun call!18566 () ListLongMap!2303)

(declare-fun call!18568 () ListLongMap!2303)

(assert (=> bm!18562 (= call!18566 call!18568)))

(declare-fun bm!18563 () Bool)

(assert (=> bm!18563 (= call!18567 call!18566)))

(declare-fun bm!18564 () Bool)

(assert (=> bm!18564 (= call!18569 (contains!1263 lt!90920 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184060 () Bool)

(declare-fun lt!90916 () Unit!5535)

(assert (=> b!184060 (= e!121154 lt!90916)))

(declare-fun lt!90923 () ListLongMap!2303)

(declare-fun getCurrentListMapNoExtraKeys!182 (array!7795 array!7797 (_ BitVec 32) (_ BitVec 32) V!5393 V!5393 (_ BitVec 32) Int) ListLongMap!2303)

(assert (=> b!184060 (= lt!90923 (getCurrentListMapNoExtraKeys!182 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!90931 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90931 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90919 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90919 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90927 () Unit!5535)

(declare-fun addStillContains!137 (ListLongMap!2303 (_ BitVec 64) V!5393 (_ BitVec 64)) Unit!5535)

(assert (=> b!184060 (= lt!90927 (addStillContains!137 lt!90923 lt!90931 (zeroValue!3600 thiss!1248) lt!90919))))

(assert (=> b!184060 (contains!1263 (+!278 lt!90923 (tuple2!3395 lt!90931 (zeroValue!3600 thiss!1248))) lt!90919)))

(declare-fun lt!90915 () Unit!5535)

(assert (=> b!184060 (= lt!90915 lt!90927)))

(declare-fun lt!90928 () ListLongMap!2303)

(assert (=> b!184060 (= lt!90928 (getCurrentListMapNoExtraKeys!182 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!90929 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90924 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90924 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90913 () Unit!5535)

(declare-fun addApplyDifferent!137 (ListLongMap!2303 (_ BitVec 64) V!5393 (_ BitVec 64)) Unit!5535)

(assert (=> b!184060 (= lt!90913 (addApplyDifferent!137 lt!90928 lt!90929 (minValue!3600 thiss!1248) lt!90924))))

(declare-fun apply!161 (ListLongMap!2303 (_ BitVec 64)) V!5393)

(assert (=> b!184060 (= (apply!161 (+!278 lt!90928 (tuple2!3395 lt!90929 (minValue!3600 thiss!1248))) lt!90924) (apply!161 lt!90928 lt!90924))))

(declare-fun lt!90933 () Unit!5535)

(assert (=> b!184060 (= lt!90933 lt!90913)))

(declare-fun lt!90917 () ListLongMap!2303)

(assert (=> b!184060 (= lt!90917 (getCurrentListMapNoExtraKeys!182 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!90921 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90921 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90918 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90918 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90926 () Unit!5535)

(assert (=> b!184060 (= lt!90926 (addApplyDifferent!137 lt!90917 lt!90921 (zeroValue!3600 thiss!1248) lt!90918))))

(assert (=> b!184060 (= (apply!161 (+!278 lt!90917 (tuple2!3395 lt!90921 (zeroValue!3600 thiss!1248))) lt!90918) (apply!161 lt!90917 lt!90918))))

(declare-fun lt!90922 () Unit!5535)

(assert (=> b!184060 (= lt!90922 lt!90926)))

(declare-fun lt!90934 () ListLongMap!2303)

(assert (=> b!184060 (= lt!90934 (getCurrentListMapNoExtraKeys!182 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun lt!90930 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90930 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90932 () (_ BitVec 64))

(assert (=> b!184060 (= lt!90932 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184060 (= lt!90916 (addApplyDifferent!137 lt!90934 lt!90930 (minValue!3600 thiss!1248) lt!90932))))

(assert (=> b!184060 (= (apply!161 (+!278 lt!90934 (tuple2!3395 lt!90930 (minValue!3600 thiss!1248))) lt!90932) (apply!161 lt!90934 lt!90932))))

(declare-fun d!54737 () Bool)

(assert (=> d!54737 e!121156))

(declare-fun res!87069 () Bool)

(assert (=> d!54737 (=> (not res!87069) (not e!121156))))

(assert (=> d!54737 (= res!87069 (or (bvsge #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))))))))

(declare-fun lt!90914 () ListLongMap!2303)

(assert (=> d!54737 (= lt!90920 lt!90914)))

(declare-fun lt!90925 () Unit!5535)

(assert (=> d!54737 (= lt!90925 e!121154)))

(declare-fun c!33009 () Bool)

(assert (=> d!54737 (= c!33009 e!121157)))

(declare-fun res!87070 () Bool)

(assert (=> d!54737 (=> (not res!87070) (not e!121157))))

(assert (=> d!54737 (= res!87070 (bvslt #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))))))

(assert (=> d!54737 (= lt!90914 e!121158)))

(declare-fun c!33010 () Bool)

(assert (=> d!54737 (= c!33010 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54737 (validMask!0 (mask!8836 thiss!1248))))

(assert (=> d!54737 (= (getCurrentListMap!800 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)) lt!90920)))

(declare-fun b!184061 () Bool)

(assert (=> b!184061 (= e!121162 (= (apply!161 lt!90920 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3600 thiss!1248)))))

(declare-fun b!184062 () Bool)

(declare-fun e!121151 () Bool)

(assert (=> b!184062 (= e!121161 e!121151)))

(declare-fun res!87064 () Bool)

(assert (=> b!184062 (= res!87064 call!18570)))

(assert (=> b!184062 (=> (not res!87064) (not e!121151))))

(declare-fun bm!18565 () Bool)

(assert (=> bm!18565 (= call!18570 (contains!1263 lt!90920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184063 () Bool)

(assert (=> b!184063 (= e!121153 call!18565)))

(declare-fun b!184064 () Bool)

(assert (=> b!184064 (= e!121150 (not call!18569))))

(declare-fun bm!18566 () Bool)

(assert (=> bm!18566 (= call!18568 (getCurrentListMapNoExtraKeys!182 (_keys!5684 thiss!1248) (_values!3742 thiss!1248) (mask!8836 thiss!1248) (extraKeys!3496 thiss!1248) (zeroValue!3600 thiss!1248) (minValue!3600 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3759 thiss!1248)))))

(declare-fun c!33011 () Bool)

(declare-fun bm!18567 () Bool)

(assert (=> bm!18567 (= call!18571 (+!278 (ite c!33010 call!18568 (ite c!33011 call!18566 call!18567)) (ite (or c!33010 c!33011) (tuple2!3395 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3600 thiss!1248)) (tuple2!3395 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3600 thiss!1248)))))))

(declare-fun bm!18568 () Bool)

(assert (=> bm!18568 (= call!18565 call!18571)))

(declare-fun b!184065 () Bool)

(declare-fun get!2114 (ValueCell!1811 V!5393) V!5393)

(declare-fun dynLambda!495 (Int (_ BitVec 64)) V!5393)

(assert (=> b!184065 (= e!121155 (= (apply!161 lt!90920 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000)) (get!2114 (select (arr!3683 (_values!3742 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!495 (defaultEntry!3759 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3998 (_values!3742 thiss!1248))))))

(assert (=> b!184065 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))))))

(declare-fun b!184066 () Bool)

(assert (=> b!184066 (= e!121151 (= (apply!161 lt!90920 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3600 thiss!1248)))))

(declare-fun b!184067 () Bool)

(declare-fun c!33008 () Bool)

(assert (=> b!184067 (= c!33008 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!184067 (= e!121160 e!121153)))

(declare-fun b!184068 () Bool)

(assert (=> b!184068 (= e!121159 (validKeyInArray!0 (select (arr!3682 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184069 () Bool)

(assert (=> b!184069 (= e!121158 e!121160)))

(assert (=> b!184069 (= c!33011 (and (not (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3496 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!54737 c!33010) b!184053))

(assert (= (and d!54737 (not c!33010)) b!184069))

(assert (= (and b!184069 c!33011) b!184057))

(assert (= (and b!184069 (not c!33011)) b!184067))

(assert (= (and b!184067 c!33008) b!184063))

(assert (= (and b!184067 (not c!33008)) b!184050))

(assert (= (or b!184063 b!184050) bm!18563))

(assert (= (or b!184057 bm!18563) bm!18562))

(assert (= (or b!184057 b!184063) bm!18568))

(assert (= (or b!184053 bm!18562) bm!18566))

(assert (= (or b!184053 bm!18568) bm!18567))

(assert (= (and d!54737 res!87070) b!184049))

(assert (= (and d!54737 c!33009) b!184060))

(assert (= (and d!54737 (not c!33009)) b!184056))

(assert (= (and d!54737 res!87069) b!184059))

(assert (= (and b!184059 res!87065) b!184068))

(assert (= (and b!184059 (not res!87071)) b!184052))

(assert (= (and b!184052 res!87063) b!184065))

(assert (= (and b!184059 res!87066) b!184055))

(assert (= (and b!184055 c!33012) b!184062))

(assert (= (and b!184055 (not c!33012)) b!184054))

(assert (= (and b!184062 res!87064) b!184066))

(assert (= (or b!184062 b!184054) bm!18565))

(assert (= (and b!184055 res!87067) b!184058))

(assert (= (and b!184058 c!33007) b!184051))

(assert (= (and b!184058 (not c!33007)) b!184064))

(assert (= (and b!184051 res!87068) b!184061))

(assert (= (or b!184051 b!184064) bm!18564))

(declare-fun b_lambda!7197 () Bool)

(assert (=> (not b_lambda!7197) (not b!184065)))

(declare-fun t!7200 () Bool)

(declare-fun tb!2825 () Bool)

(assert (=> (and b!183936 (= (defaultEntry!3759 thiss!1248) (defaultEntry!3759 thiss!1248)) t!7200) tb!2825))

(declare-fun result!4769 () Bool)

(assert (=> tb!2825 (= result!4769 tp_is_empty!4309)))

(assert (=> b!184065 t!7200))

(declare-fun b_and!11099 () Bool)

(assert (= b_and!11093 (and (=> t!7200 result!4769) b_and!11099)))

(declare-fun m!210983 () Bool)

(assert (=> bm!18566 m!210983))

(declare-fun m!210985 () Bool)

(assert (=> bm!18567 m!210985))

(declare-fun m!210987 () Bool)

(assert (=> b!184053 m!210987))

(declare-fun m!210989 () Bool)

(assert (=> b!184061 m!210989))

(declare-fun m!210991 () Bool)

(assert (=> b!184068 m!210991))

(assert (=> b!184068 m!210991))

(declare-fun m!210993 () Bool)

(assert (=> b!184068 m!210993))

(assert (=> b!184052 m!210991))

(assert (=> b!184052 m!210991))

(declare-fun m!210995 () Bool)

(assert (=> b!184052 m!210995))

(declare-fun m!210997 () Bool)

(assert (=> b!184066 m!210997))

(assert (=> b!184049 m!210991))

(assert (=> b!184049 m!210991))

(assert (=> b!184049 m!210993))

(declare-fun m!210999 () Bool)

(assert (=> bm!18564 m!210999))

(declare-fun m!211001 () Bool)

(assert (=> bm!18565 m!211001))

(declare-fun m!211003 () Bool)

(assert (=> b!184065 m!211003))

(assert (=> b!184065 m!211003))

(declare-fun m!211005 () Bool)

(assert (=> b!184065 m!211005))

(declare-fun m!211007 () Bool)

(assert (=> b!184065 m!211007))

(assert (=> b!184065 m!211005))

(assert (=> b!184065 m!210991))

(assert (=> b!184065 m!210991))

(declare-fun m!211009 () Bool)

(assert (=> b!184065 m!211009))

(assert (=> b!184060 m!210991))

(declare-fun m!211011 () Bool)

(assert (=> b!184060 m!211011))

(declare-fun m!211013 () Bool)

(assert (=> b!184060 m!211013))

(assert (=> b!184060 m!210983))

(declare-fun m!211015 () Bool)

(assert (=> b!184060 m!211015))

(assert (=> b!184060 m!211011))

(declare-fun m!211017 () Bool)

(assert (=> b!184060 m!211017))

(declare-fun m!211019 () Bool)

(assert (=> b!184060 m!211019))

(declare-fun m!211021 () Bool)

(assert (=> b!184060 m!211021))

(declare-fun m!211023 () Bool)

(assert (=> b!184060 m!211023))

(declare-fun m!211025 () Bool)

(assert (=> b!184060 m!211025))

(assert (=> b!184060 m!211021))

(declare-fun m!211027 () Bool)

(assert (=> b!184060 m!211027))

(declare-fun m!211029 () Bool)

(assert (=> b!184060 m!211029))

(assert (=> b!184060 m!211013))

(declare-fun m!211031 () Bool)

(assert (=> b!184060 m!211031))

(declare-fun m!211033 () Bool)

(assert (=> b!184060 m!211033))

(declare-fun m!211035 () Bool)

(assert (=> b!184060 m!211035))

(declare-fun m!211037 () Bool)

(assert (=> b!184060 m!211037))

(assert (=> b!184060 m!211033))

(declare-fun m!211039 () Bool)

(assert (=> b!184060 m!211039))

(assert (=> d!54737 m!210941))

(assert (=> b!183938 d!54737))

(declare-fun d!54739 () Bool)

(assert (=> d!54739 (= (validMask!0 (mask!8836 thiss!1248)) (and (or (= (mask!8836 thiss!1248) #b00000000000000000000000000000111) (= (mask!8836 thiss!1248) #b00000000000000000000000000001111) (= (mask!8836 thiss!1248) #b00000000000000000000000000011111) (= (mask!8836 thiss!1248) #b00000000000000000000000000111111) (= (mask!8836 thiss!1248) #b00000000000000000000000001111111) (= (mask!8836 thiss!1248) #b00000000000000000000000011111111) (= (mask!8836 thiss!1248) #b00000000000000000000000111111111) (= (mask!8836 thiss!1248) #b00000000000000000000001111111111) (= (mask!8836 thiss!1248) #b00000000000000000000011111111111) (= (mask!8836 thiss!1248) #b00000000000000000000111111111111) (= (mask!8836 thiss!1248) #b00000000000000000001111111111111) (= (mask!8836 thiss!1248) #b00000000000000000011111111111111) (= (mask!8836 thiss!1248) #b00000000000000000111111111111111) (= (mask!8836 thiss!1248) #b00000000000000001111111111111111) (= (mask!8836 thiss!1248) #b00000000000000011111111111111111) (= (mask!8836 thiss!1248) #b00000000000000111111111111111111) (= (mask!8836 thiss!1248) #b00000000000001111111111111111111) (= (mask!8836 thiss!1248) #b00000000000011111111111111111111) (= (mask!8836 thiss!1248) #b00000000000111111111111111111111) (= (mask!8836 thiss!1248) #b00000000001111111111111111111111) (= (mask!8836 thiss!1248) #b00000000011111111111111111111111) (= (mask!8836 thiss!1248) #b00000000111111111111111111111111) (= (mask!8836 thiss!1248) #b00000001111111111111111111111111) (= (mask!8836 thiss!1248) #b00000011111111111111111111111111) (= (mask!8836 thiss!1248) #b00000111111111111111111111111111) (= (mask!8836 thiss!1248) #b00001111111111111111111111111111) (= (mask!8836 thiss!1248) #b00011111111111111111111111111111) (= (mask!8836 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8836 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!183943 d!54739))

(declare-fun d!54741 () Bool)

(declare-fun res!87078 () Bool)

(declare-fun e!121165 () Bool)

(assert (=> d!54741 (=> (not res!87078) (not e!121165))))

(declare-fun simpleValid!177 (LongMapFixedSize!2530) Bool)

(assert (=> d!54741 (= res!87078 (simpleValid!177 thiss!1248))))

(assert (=> d!54741 (= (valid!1063 thiss!1248) e!121165)))

(declare-fun b!184078 () Bool)

(declare-fun res!87079 () Bool)

(assert (=> b!184078 (=> (not res!87079) (not e!121165))))

(declare-fun arrayCountValidKeys!0 (array!7795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184078 (= res!87079 (= (arrayCountValidKeys!0 (_keys!5684 thiss!1248) #b00000000000000000000000000000000 (size!3997 (_keys!5684 thiss!1248))) (_size!1314 thiss!1248)))))

(declare-fun b!184079 () Bool)

(declare-fun res!87080 () Bool)

(assert (=> b!184079 (=> (not res!87080) (not e!121165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7795 (_ BitVec 32)) Bool)

(assert (=> b!184079 (= res!87080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5684 thiss!1248) (mask!8836 thiss!1248)))))

(declare-fun b!184080 () Bool)

(declare-datatypes ((List!2336 0))(
  ( (Nil!2333) (Cons!2332 (h!2963 (_ BitVec 64)) (t!7201 List!2336)) )
))
(declare-fun arrayNoDuplicates!0 (array!7795 (_ BitVec 32) List!2336) Bool)

(assert (=> b!184080 (= e!121165 (arrayNoDuplicates!0 (_keys!5684 thiss!1248) #b00000000000000000000000000000000 Nil!2333))))

(assert (= (and d!54741 res!87078) b!184078))

(assert (= (and b!184078 res!87079) b!184079))

(assert (= (and b!184079 res!87080) b!184080))

(declare-fun m!211041 () Bool)

(assert (=> d!54741 m!211041))

(declare-fun m!211043 () Bool)

(assert (=> b!184078 m!211043))

(declare-fun m!211045 () Bool)

(assert (=> b!184079 m!211045))

(declare-fun m!211047 () Bool)

(assert (=> b!184080 m!211047))

(assert (=> start!18598 d!54741))

(declare-fun d!54743 () Bool)

(assert (=> d!54743 (= (array_inv!2381 (_keys!5684 thiss!1248)) (bvsge (size!3997 (_keys!5684 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183936 d!54743))

(declare-fun d!54745 () Bool)

(assert (=> d!54745 (= (array_inv!2382 (_values!3742 thiss!1248)) (bvsge (size!3998 (_values!3742 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183936 d!54745))

(declare-fun b!184093 () Bool)

(declare-fun e!121172 () SeekEntryResult!625)

(assert (=> b!184093 (= e!121172 Undefined!625)))

(declare-fun d!54747 () Bool)

(declare-fun lt!90941 () SeekEntryResult!625)

(assert (=> d!54747 (and (or ((_ is Undefined!625) lt!90941) (not ((_ is Found!625) lt!90941)) (and (bvsge (index!4671 lt!90941) #b00000000000000000000000000000000) (bvslt (index!4671 lt!90941) (size!3997 (_keys!5684 thiss!1248))))) (or ((_ is Undefined!625) lt!90941) ((_ is Found!625) lt!90941) (not ((_ is MissingZero!625) lt!90941)) (and (bvsge (index!4670 lt!90941) #b00000000000000000000000000000000) (bvslt (index!4670 lt!90941) (size!3997 (_keys!5684 thiss!1248))))) (or ((_ is Undefined!625) lt!90941) ((_ is Found!625) lt!90941) ((_ is MissingZero!625) lt!90941) (not ((_ is MissingVacant!625) lt!90941)) (and (bvsge (index!4673 lt!90941) #b00000000000000000000000000000000) (bvslt (index!4673 lt!90941) (size!3997 (_keys!5684 thiss!1248))))) (or ((_ is Undefined!625) lt!90941) (ite ((_ is Found!625) lt!90941) (= (select (arr!3682 (_keys!5684 thiss!1248)) (index!4671 lt!90941)) key!828) (ite ((_ is MissingZero!625) lt!90941) (= (select (arr!3682 (_keys!5684 thiss!1248)) (index!4670 lt!90941)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!625) lt!90941) (= (select (arr!3682 (_keys!5684 thiss!1248)) (index!4673 lt!90941)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54747 (= lt!90941 e!121172)))

(declare-fun c!33020 () Bool)

(declare-fun lt!90943 () SeekEntryResult!625)

(assert (=> d!54747 (= c!33020 (and ((_ is Intermediate!625) lt!90943) (undefined!1437 lt!90943)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7795 (_ BitVec 32)) SeekEntryResult!625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54747 (= lt!90943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8836 thiss!1248)) key!828 (_keys!5684 thiss!1248) (mask!8836 thiss!1248)))))

(assert (=> d!54747 (validMask!0 (mask!8836 thiss!1248))))

(assert (=> d!54747 (= (seekEntryOrOpen!0 key!828 (_keys!5684 thiss!1248) (mask!8836 thiss!1248)) lt!90941)))

(declare-fun e!121173 () SeekEntryResult!625)

(declare-fun b!184094 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7795 (_ BitVec 32)) SeekEntryResult!625)

(assert (=> b!184094 (= e!121173 (seekKeyOrZeroReturnVacant!0 (x!20030 lt!90943) (index!4672 lt!90943) (index!4672 lt!90943) key!828 (_keys!5684 thiss!1248) (mask!8836 thiss!1248)))))

(declare-fun b!184095 () Bool)

(assert (=> b!184095 (= e!121173 (MissingZero!625 (index!4672 lt!90943)))))

(declare-fun b!184096 () Bool)

(declare-fun e!121174 () SeekEntryResult!625)

(assert (=> b!184096 (= e!121174 (Found!625 (index!4672 lt!90943)))))

(declare-fun b!184097 () Bool)

(declare-fun c!33019 () Bool)

(declare-fun lt!90942 () (_ BitVec 64))

(assert (=> b!184097 (= c!33019 (= lt!90942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184097 (= e!121174 e!121173)))

(declare-fun b!184098 () Bool)

(assert (=> b!184098 (= e!121172 e!121174)))

(assert (=> b!184098 (= lt!90942 (select (arr!3682 (_keys!5684 thiss!1248)) (index!4672 lt!90943)))))

(declare-fun c!33021 () Bool)

(assert (=> b!184098 (= c!33021 (= lt!90942 key!828))))

(assert (= (and d!54747 c!33020) b!184093))

(assert (= (and d!54747 (not c!33020)) b!184098))

(assert (= (and b!184098 c!33021) b!184096))

(assert (= (and b!184098 (not c!33021)) b!184097))

(assert (= (and b!184097 c!33019) b!184095))

(assert (= (and b!184097 (not c!33019)) b!184094))

(declare-fun m!211049 () Bool)

(assert (=> d!54747 m!211049))

(declare-fun m!211051 () Bool)

(assert (=> d!54747 m!211051))

(declare-fun m!211053 () Bool)

(assert (=> d!54747 m!211053))

(assert (=> d!54747 m!210941))

(declare-fun m!211055 () Bool)

(assert (=> d!54747 m!211055))

(declare-fun m!211057 () Bool)

(assert (=> d!54747 m!211057))

(assert (=> d!54747 m!211055))

(declare-fun m!211059 () Bool)

(assert (=> b!184094 m!211059))

(declare-fun m!211061 () Bool)

(assert (=> b!184098 m!211061))

(assert (=> b!183940 d!54747))

(declare-fun mapIsEmpty!7414 () Bool)

(declare-fun mapRes!7414 () Bool)

(assert (=> mapIsEmpty!7414 mapRes!7414))

(declare-fun b!184105 () Bool)

(declare-fun e!121180 () Bool)

(assert (=> b!184105 (= e!121180 tp_is_empty!4309)))

(declare-fun condMapEmpty!7414 () Bool)

(declare-fun mapDefault!7414 () ValueCell!1811)

(assert (=> mapNonEmpty!7405 (= condMapEmpty!7414 (= mapRest!7405 ((as const (Array (_ BitVec 32) ValueCell!1811)) mapDefault!7414)))))

(declare-fun e!121179 () Bool)

(assert (=> mapNonEmpty!7405 (= tp!16389 (and e!121179 mapRes!7414))))

(declare-fun b!184106 () Bool)

(assert (=> b!184106 (= e!121179 tp_is_empty!4309)))

(declare-fun mapNonEmpty!7414 () Bool)

(declare-fun tp!16405 () Bool)

(assert (=> mapNonEmpty!7414 (= mapRes!7414 (and tp!16405 e!121180))))

(declare-fun mapKey!7414 () (_ BitVec 32))

(declare-fun mapValue!7414 () ValueCell!1811)

(declare-fun mapRest!7414 () (Array (_ BitVec 32) ValueCell!1811))

(assert (=> mapNonEmpty!7414 (= mapRest!7405 (store mapRest!7414 mapKey!7414 mapValue!7414))))

(assert (= (and mapNonEmpty!7405 condMapEmpty!7414) mapIsEmpty!7414))

(assert (= (and mapNonEmpty!7405 (not condMapEmpty!7414)) mapNonEmpty!7414))

(assert (= (and mapNonEmpty!7414 ((_ is ValueCellFull!1811) mapValue!7414)) b!184105))

(assert (= (and mapNonEmpty!7405 ((_ is ValueCellFull!1811) mapDefault!7414)) b!184106))

(declare-fun m!211063 () Bool)

(assert (=> mapNonEmpty!7414 m!211063))

(declare-fun b_lambda!7199 () Bool)

(assert (= b_lambda!7197 (or (and b!183936 b_free!4537) b_lambda!7199)))

(check-sat (not d!54741) (not bm!18567) b_and!11099 (not bm!18564) (not b!184066) (not mapNonEmpty!7414) (not b!184006) (not b!184053) (not b!184065) (not b!184079) (not b!184052) (not b!184060) (not b!184068) (not b_next!4537) (not d!54737) (not bm!18566) (not b!184061) (not d!54747) (not d!54735) (not b!184004) (not b!184049) (not b!184078) (not b!184080) tp_is_empty!4309 (not b!184094) (not b_lambda!7199) (not bm!18565))
(check-sat b_and!11099 (not b_next!4537))
